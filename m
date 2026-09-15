Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF83C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edP/1GoeLUKEcn6of27Ti6YcYaFZvPoJc4kavTr0HaU=; b=URQaLvRhS9GyeFyEpjAVGb5BJ+
	KeS77GiQZ8Bx3MuiL+PZg6/9mbj4ULbujU5Uxc5dJmvWm0U7w39rbsVAAsZYw4nKee6uxKhPyEGeB
	YOCduFS5uL3gaL9L7zedzvAuzxjDCRF23arx8TuaJRZsN3xir6QcbpVDSn/cVEB7qnad3TPqAxi7v
	2fwZIiHzWtP6hcA34KiIZc29GdXItqti7IVh+shBe/kHMd0xxh+LSBJnu1IomPnbVrn1twRCCxcXY
	cuCm9KC2b+VGO9f/Q/itLHwVlDZfC05k0ar3WvvgEq9L3M0+PdWR2qR3ikkDbuiUi0jUVaaB+2bWB
	791EwJKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TXv-00000006nTg-2vFC;
	Tue, 15 Sep 2026 13:50:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TXt-00000006nQm-0M0h;
	Tue, 15 Sep 2026 13:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480198;
	bh=ZWQwvpL1M0bc6+FwRdWniOff2hRdkUDxZm9y3a3YJPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YK0M4T3+4Ii8kwykoBo+qp8sX5MBI4/4ACG8qmepdIOSHJd6I0IJFxMR+NQ4CBFQp
	 lGQ51u0ggL5HaDQ3TJxkJoVRMMArS5Ih5akqX4AmaKLafav9OVC34BxQAQazrl2dLc
	 eNa4tiL5jgvDiKzW6F6gvNBoj02oHc5dAta0IDXY8x4zNFoLLu8+8JyBJ3zkIjbKP1
	 QiPhNiTW+/ngrh1h+f6WmroFSalDapJMbdHQjOKnL0/uLg5LHZthhRIBCV7guUkK38
	 MbogctHqJRkbNv1bRMhDY2l4Jv9UDMsRD0ZCPzyW3txT2FGj+pQhC0gi5WMpSA/VyW
	 4r37PEOh+SPag==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F08C17E09B5;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2D0B1480030; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:50 +0200
Subject: [PATCH v15 03/16] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-3-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZWQwvpL1M0bc6+FwRdWniOff2hRdkUDxZm9y3a3YJPM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQVWNRCp7fSW3ZlbMEUJzDa1u6zaftWPV
 5tNlz4D9UP3gokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qa/s4QAInMmd/SVzgarSf8SjlwsOABLWrClbO1/KPEQE59xdgCNkJalZXH6bs2P5Eee0ok8Xa
 E7NPGKq5t9nsfXshXcgT1zbsXdnlxrWbM70OPaCumMsoTXjUIEsr+7c4qQBJZMDqYb1DpO3U5SV
 to2VgeGhA5dYzkbbM2+CKs8iXQDu4XVo3X1vcdANmOdkEHUiZQ2XJnYo8xewyMEghX57ty8cxTa
 RurB8/2P4rrEdIAZ+P/n6MAIgkj1R5jRTMNQnT7jEmB+Okknrk2BjYE+jcHyqnJC28VrslPHIaA
 37eemzkUZGWDC56WhvFqpH96VnajZyADXFabl8wZNEYaE8a3MCZu/3alrtOY9TmJCfHaFgxRUF/
 lxnliStphEyISTRVIYzycWaMfESV12ZNwC1kfr+FrO5vh3RGDRmlTN8LjdJktoaPO7v0jgbSkgf
 QerDM97Gm803NK9Fdy8uvyy/hwhdNhpGQCVhVX8wjJwsVzbu3tc825nN07euGxHf0lVuaNuvLMN
 YpUGkD++rJDZhuMZma56a5PHz8iJOUmwS3UImWHspUUFEHHM2pSRsw1l8DGnYSwHAKEpSPzCX4r
 Sh4kls4aYMmG15vpp4VtL1EbQ1tUHoL4YYaGhzSI13HsX5r9T4SfNnkSspfep/DzrY60cRGDQnb
 PvQOTOlc9JH0tPdEHKRokZQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_065001_294027_C7E89772 
X-CRM114-Status: GOOD (  12.64  )
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

By default (i.e. without manually enabling runtime PM) DWC3 requests the
USB3 PHY once and keeps it enabled all the time. When DisplayPort is
being requested later on, a mode change is needed. This re-initializes
the PHY. During re-initialization the status variable has incorrectly
been cleared, which means the tracking information for USB3 is lost.

This is not an immediate problem, since the DP side keeps the PHY
enabled. But once DP is toggled off, the whole PHY will be disabled.
This is a problem, because the USB side still needs it powered.

Fix things by not clearing the status flags.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 13649b52e99b..da0fa75fc9f0 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1007,7 +1007,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->mode_change = false;
 	} else if (udphy->mode_change) {
-		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 

-- 
2.53.0


