Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B1CC4450B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiYXe9hU4GLjYBlDm3NApTkkTrpbtTK2GE6gR5VILjo=; b=og8lL2Hi1uiYMScASkCaEhjq6P
	LZI33a0n2vMlo+nhpvrBNNuJ1sbGa1vVujdDGkmivPDtSeHDjGYaLfDOiOC58TFgVkOZ9sZ0ubXyL
	7Ed6tGWTVSiI8C3O7/HW6LhVwW2EMWFsQ5SETlOY2cDxYEd8zcpCB3zYWXKBm/tfetRT9FeC7EMeo
	b0qa1b0F/sunweCsn3pl9mZeoOreFf6ab45Ae5CtjzaCFf3yuRAGTpXsTtXVf/u9rIY+ZRJmMMZF3
	NNCcdLTJyKmDJ3CR1KizxEPU/AnI6gyMSLShAZ0oWP0BGX71tcIr2E3eNaIDNk8A7tORgXghx/pnP
	0Mmaq1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1F-00000003LYb-0ntw;
	Thu, 09 Jul 2026 19:02:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu17-00000003LIj-2PcK;
	Thu, 09 Jul 2026 19:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TAmBUw7n9uUAEA4O5H1Inpcb35tmf/EHn/06JUY2Qwk9sGGlfpGDexTaXlSI/lFGY
	 nDo0VxdTsfEUq3lfK0je/crj6IlWKCI2Kgamp7CFq4EARgUBU5QqA585C6tUU76XR8
	 zp5fJneNmYpp0GSkiPx4ZdGuObM2o11CXnMiDP5axfPL+jGFkyMTkDTt+/Pr2LO1xI
	 nM+ggcjza3B13qHT+RKZVZLYOVCEqfBtrBJXS03NZkaHgJQNB7UnO66yZUvcqsZd0c
	 hp/FRTKgOQaFQGNUmXHZo8gv2sZ9Za8U34O57gdMAX0OwYmDsGhShQ9gojiKwN3f+H
	 ZWIXN4tzdkoug==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 526B717E0EF3;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id ABBA3480038; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:30 +0200
Subject: [PATCH v11 07/36] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-7-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ESAPzuYOnZwp+4yqsd0Ziayk+CJYnYQp
 7mKkd4cOS/PGokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qaidYQAI/oIPjfuO1Zci50lhT4+dQmW2c9KfXTrWTzULXtX73g9os/Ydr0DYWqL76h8YNznl4
 bEoXjD6NFMiG+TQ6V+soGZ2PMQS/W507xNW37/VAfFWGRLok5vArmyDqx95HZNU9UwFbGJzJXJE
 j7a8p93pV7bi3/cly9GAWKOyyl1g1uBVE4qXmjKDtXEvCalYaSUYI3R5/umMUXr04+IToXx/B7o
 0VeGnM7KYh4Sf5OMYIJLWxseGYjhzB8oBx5FXVFqTRT9JqO4aFOYX/9tmdlLpfQF3czccfRcX15
 vo9sU8muPlthF3Hq5g62Ah7kaFT8hbTkMDz1wz87KOI3CsMMEaEJ2WyAlrgai2gUrFtQWcuYUU1
 pJJayry1c+4A16+uLAJTD15qfWUp/f1OyCyoL+CbdvKW90EPDkhtHIuHXKgSkr3ThOqRaoM1o4h
 gWW6pl0R0s7UxunrFqvyhrEJZjOKJcxoSiVbz+U9DlFhGSRSh+NFvHS58G4NWgbKylzJdBdDph4
 lv1kEceVaA1Xrhb7uIDebFcKKhoBOQV48q3XgaZneYixU3Zm9sbVMYOAIwyiuui34v6kqkMByuD
 nEq4X+Md+bw/air1c4CFNt2R8w0SYRt5XlGsGgh7w44kg6/bN/YnDscdjLabznXgUnfUWwwfjpp
 O/UA12EstrxZoYsggOxckzg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120237_814324_A3EE71E5 
X-CRM114-Status: GOOD (  10.61  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

When a mode change is required rk_udphy_power_on() disables
the clocks and then calls rk_udphy_setup(), which then enables
all the clocks again before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines,
re-enabling the clocks is just delaying things. Avoid it by
directly calling rk_udphy_init().

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 6cb9f6b4dbf6..e3f5a26c876a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -987,8 +987,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
-		rk_udphy_disable(udphy);
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
 		udphy->mode_change = false;

-- 
2.53.0


