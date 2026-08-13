Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB15C5DF6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yh1Hyj09SnSAtbE36mVqk0oVrTrUh3d83bFCwiaLd1s=; b=QkvtecB77ImDUSJVF0OjwRAE4x
	WTIHn1A3N+fVuBVqLA58gcm0M8q8YeaYGBBUcTK3yqP7qK5+mVQMPL7CGM7pt74n9wRYI2MW1nq35
	E5Se3C/Fyj0XmddGePbe5tQhA8ss7qeDs8ydW/rFTITRrCJWEyzP9SMaQgLMGHrJlPMS4jtRAJe5Q
	g7KeT9LRZ4025R/BYfYLJPaW2WYiScStWy6/UE0X3M9KOjDiPm6OnarYvC2XW//CKf9upYwWKnQXf
	K9ojO30x3/COhBz2mEZSvWTeTkRNZxBHtvvRNU60tIcX2IdeiaJ2Xhd0Pznn6cvCa75n10pOL+NbV
	eLc5ns0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPx-00000001YG9-0gdf;
	Thu, 13 Aug 2026 20:52:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPA-00000001XEv-1rvU;
	Thu, 13 Aug 2026 20:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=tWX9go0u3+GnvkeHXNXvA5SOHjDyN8/Tg+MqJJtnATA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fGiNnDVmUKtSGN6c0TcdD5Mtneof4JSvbk377N2/q+FPySzEo6ZlsC/ZUt3AUdmOb
	 zY95j2atNRZfdkSVY4p1is1mbK6gLHH9o3cDkJc2vo6OXYcV7cf5jX6vCTKAj/1OfJ
	 iQtD9HTPI50cEOy9xQyVd0xnvpUHMyDz1Kqqze8q2ahOC6ZpKLt+x3aLBmLjKh16JU
	 q9sn3V6O8aFOlnsg7m9j0kijeC7qQmPNhN0sNy9WQqQQJP3EmAoFT4qa85Pwre+eMO
	 HkBYh91wL4C+17R/OqhxKm0HXeAIePgHhTTBvIgzfMI+AyFIT6uwYB/XxBc53ndvqt
	 b5RaGFey5z1yw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 46A7D17E10C0;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A320C480047; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:53 +0200
Subject: [PATCH v14 10/38] phy: rockchip: usbdp: Add missing mode_change
 update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-10-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2075;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=tWX9go0u3+GnvkeHXNXvA5SOHjDyN8/Tg+MqJJtnATA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmRWBIPA0c3ljBQ2qrAmf1qc/+6EIANKY
 JYNSilf00MZBYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qaGewQAJvYmFWdO+OoMGxytPk0HAwB0O06YhCw+RD0Ou1B+2q2iOnt0oB28iCdXQIisIwtn8p
 mc3r3SJImxaba/04ziV6R8Ma00ObZTIhXgwWYXbgnt66ob+UbWxQXvovjc53O9gHYq6zdP1yGU9
 DQyNUr8dObblB2x4OAHEXXJVvfDw6QMTJX5F3yUAhhk1DgsyZe+Yi3BOk+xCMeEwtkTPBeEpZDE
 Sp5WVhpr7ExBGG9EuTASQxcb63jLQ8WI1qE9XxfnK2kB+hnkb0X4hiERZFrRGP1fjcI7WxStP4K
 1UQNPomzaLJFn8jAVkGmsRdVbF3fcVdeQao+9soFOmadJ4OstVYFv0/Ev5+dRtPjtVHCG03my+2
 XCPo4SPNiO8PrqSE5W7hQSVFe/y52iCe8Qwm1PMFCDaTba9b4uZyXiq0ZIXTkzs0HV2u6ii402U
 TXMmmyyY4/bnRGpoJH2tabMRqPuA+ie6sqW5xQ0Tq83fmYr5q0XjjAraAOOcyEPGbhgDQa4UPit
 ssQRVr132FElToqCwSMXZ7YzxeeaiRdgg7CPrXz3v67TyXa7Dg2q2Mkzssy897C0rW5RN/f01E1
 nc3nhRldQpkCoAlPVrAF3F2zW/CZXtXiHb6/lOpqoAYYkqALvX5WnnwkRzgcpPht8QEnt9n5l8U
 vfoF14xxGWBPikBuofgIrTQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135200_824655_0DF737BB 
X-CRM114-Status: GOOD (  12.36  )
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

rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.

Fix this issue by introducing a new helper to update the available
modes.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 982315535caf..7540c897dde1 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -617,6 +617,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
 	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
 }
 
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+{
+	if (udphy->mode == mode)
+		return;
+
+	udphy->mode_change = true;
+	udphy->mode = mode;
+}
+
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 {
 	if (udphy->flip) {
@@ -647,7 +656,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1361,10 +1370,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 			usleep_range(750, 800);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else if (data->status & DP_STATUS_HPD_STATE) {
-			if (udphy->mode != mode) {
-				udphy->mode = mode;
-				udphy->mode_change = true;
-			}
+			rk_udphy_mode_set(udphy, mode);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else {
 			rk_udphy_dp_hpd_event_trigger(udphy, false);

-- 
2.53.0


