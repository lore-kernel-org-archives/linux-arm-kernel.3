Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B69CC4450C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUr73LZY6+2QdfjE2MOlrcvd4yMtGCLi1U7P6fK2y3E=; b=jBvQoyrNfVvi4JANxzDIHTj130
	7w2nIc8ICO0iVHGcXIcsdurxx+TRwC5rqjgMcE9o6pzG33EAEMaQOzCvRrVibSllRsR5pO9sY5RyB
	FQ9PpyfkHu/Hx49BxrcJi4ggXVg7Q1+BInKJv5YXhdPatVkl4RXYrDA3WueIiMzfHBKk39+QK5pMv
	mIitHHp+G/VRpz7lpTD33mrXtUtgzi19Ud38hDVNWsZqYkTG4zQonVJ03yGW8sj8czzEaCs8QS6pN
	v+9lJ7X3DwThQMpi7DuGjSBQxvSZaYwQLx2v7KMuP2cshRSQau8zQDu3siCtYt3/9zCKVpY4Kw7sz
	Bo1Mh6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiuh-0000000D7Hm-3FfD;
	Tue, 14 Jul 2026 19:35:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiue-0000000D7Ft-1UBm;
	Tue, 14 Jul 2026 19:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057726;
	bh=KrO1QK4//StkgMJIK/o6MlDMIM5lHO4umCxT2+qIO8c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AHA94tSiPWgwsq2DyPIeSJE0wVgOBVGzHHhcnAfz3n7/JyeZtWqeJPGrfpfU1bKwX
	 EN9g3w9e8hmekSk+QgTF+wbl+mRnbdJ1H075hxrRkwUnbiUTBo73mzw/UKCc9gBbD6
	 hGJteq8DxKuHY5cEVF+/gFNdd93SYnZVZLQEfNwayFY8w2xTSb2ZwIrlfiJdyQSoqe
	 6nqtJn5wxrXWbYz25LHRpKZ6xS3pXsrpLFUAdFFmS8GT0r8mrz8YTbge+vJhdKyqeN
	 2hd7knhBKDIm3HgTy/wYPzso05+vvutJ3yuSXCsLdEX131v6KLgPIH/FP+2trDKgNG
	 ZH26tU1Jc6nNQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D078517E0956;
	Tue, 14 Jul 2026 21:35:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0E15F480079; Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:35 +0200
Subject: [PATCH v13 34/35] phy: rockchip: usbdp: Re-init PHY on mux change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-34-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KrO1QK4//StkgMJIK/o6MlDMIM5lHO4umCxT2+qIO8c=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVCzntzUEtABrBhDotBxk9zsFW1+aiIw8
 iuPzkVZ99/Vt4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaLEgP/0WLQHet8RD1OOsumbMiLtY5l5BRWnUbvRBv0O1I0Fiiz02GGXISEVTWhdl79xWnQbY
 jWkXFdORJro2nZc1vasEJ+/GyhtD03RE8TywespOQpNTIzgfZKaSfRmv20nN2atD3fdQXtOA3ci
 g7Ul/5UTxhTY9QLVXQm2r1DDoviKgFNcVfoKaELm+1GPlh4SSlXmYanRp91gYIhb723rkEzccIu
 uCNSk+3EuMttRtd8ZqNGXOUEnrDie8LBaiW214xJ1sD60rvP+MIJe7jNU5+F04tzF2eEmaw5fuG
 RR/8NPtYOiSDo29dDzQcZ6sseZIoSZsXnhip9q1xsy3AE4Ybo4vCpPD4UxopZeCC4q4AmWctyP9
 BI1ggAOrzIgnM2MULRO9rl9V00p3fz0duJiTBkBiB/AUR2MqyINEcSTl1ljOkZAZQTqYYoZUPLU
 ZT+qV2REHR2ixJJlUVDMZOqrNFFSIQ0h1ez27UChKavzJEATVU3IJVYXfgHWFkaSO1Geu3TQAkJ
 u2GJWAD+i4Btn7q8aUtTfRRlmbGAchbbS2zthv+iP46NV04Xnl7juXqghRaLOh6eQsyVThkpbvy
 4HTybhqpKYSwACHyfQUYw/aGUGU05Coz8Geqj38tnIIhNHUMiVHVOpsL68COc3dHn03Mg6Tai6V
 kTAMGFATIpOL2kjCCdKQgNA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_123528_556678_62FE2EE3 
X-CRM114-Status: GOOD (  12.70  )
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

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:

 - cable orientation changes without DP being involved
 - switching from DP-only into a mode with USB support

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e597cdfe8d79..87d6df682176 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1392,7 +1392,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static void rk_udphy_typec_mux_unregister(void *data)

-- 
2.53.0


