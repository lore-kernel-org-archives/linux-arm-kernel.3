Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2845AC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvJtfz+fiUCDq0+TFzpyF0MNxU3DrNqIuPHrEev6OBA=; b=lJ6Z0B9FDLyWPiN8KYA47+S1ST
	oMU9P8tA8QatR8G9QfgiZWth+H/mOBLrkZcxHzpkQZFAUYVXyNtpnbsXwyO83VSZaMyKHU+ASeGHU
	tlRk4J/XMH8gsxVN1ITTJItSnp2P+MJtq1AzjNamTpzVnmPVMzoGHbANDVYnP37sjXdPu456FFU4G
	RhJGhFelXPbNZNQzBWa3g1J3TCtcIOIjpP3QCIsf8VYYH4yldq8z7wZdWmMTQIB4kSJ9oC9tqBq1e
	8H+TTk37q0S+LxrOr9ZSC7jYUOnJl4lfTePZE0wKBY74MYj83qkLxF84wgJIc7+Vk1l8kWPvlBvaU
	Ajk8GJww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UkQ-000000075O6-1tYe;
	Tue, 15 Sep 2026 15:07:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ujr-000000074tO-3l5Z;
	Tue, 15 Sep 2026 15:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484779;
	bh=HP/2TxuLTpSBzkdGrral25VDP+HVgOhclYZLr8N0aFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l/ikF1Tzt9Ld//WzIiUbLEs7ujOEGqTmoHO53/krHEP0Tc9USLcGyvMnDSDBKboig
	 YjgotMkCvzyPe3eh2++oji1qBTf8EW3PJVkxX/elJTjYVO9GE9/YSwTd8yaMVdM1Cm
	 MKMDQagpFaaO0jFXKQCjWF78AJKbzIBOLfMVZTT5ynfGMO8fVuZaSk8rpP4W3W4w5o
	 WNg/B1a/vwYvrigjB9IYvDo0sJ587xg732NFbnBMFV6W3CNGwE45xQ2174gT9ZfgMI
	 OJGG/tAhqmwIATfQNMgAAmJBuugq5ib8BCOzjx0z/2jmWhG7KOhhqeYiDbOgzvR+EP
	 dsmCYIDwKJvZQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E7F8917E0B0F;
	Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 67CA2480038; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:06:09 +0200
Subject: [PATCH v15 06/11] phy: rockchip: usbdp: Use guard functions for
 mutex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-6-8d507cb1174f@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4473;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=HP/2TxuLTpSBzkdGrral25VDP+HVgOhclYZLr8N0aFs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXurWemrtH2KCb2hobF8Tg4oQf2Mpa357v
 njsyih0UbbnnokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7qAAoJENju1/PI
 O/qa90cP/jfPozEdktBhmGR6K1mIbArHr+X0EFLQ6z9yzlCGU8Ij9KiDAqF7Vg7MPi/93HzIMe1
 XQLZI0KxVy0qmxiH+aaKnO4X1is5GKO/GaHkpJ3PE8V0nMXDu2AT3bpi1j0DN5p2dYdhSZfnWTZ
 i30OqtEeNilmOjKt+69EpCzH/Ug6wsKa7qBPGs5rOsd29Km+9fKxGJ4zB+BkYywMPkYwAERV1tm
 1MR1KeGTYSHewqHRn0sD/dyl9Y03kV00ikdg6nHG/kYQM3Tlb2soqavsinwwSfaOUioK9SbBQCo
 1lxbIHLVm88i0e2ySnbRGNyW77rmybyamTMAKGN11X90fuxdPSCYoqYM37CNDc1Pwzm+2JFDuyF
 tJKU+J1h/NINcHBr94hedJSJvnVfdKjqGFOHDSnv653IyO+q2VaU9669AT7FwLctlF7NJ6CGnyv
 /EbVTuG4oExxCm7O9FNaI8e5YCQQVgpWQzECkFWdMLy6SjtbOGMJFZvHI9puyI4YfsL/+pXZUVe
 CFqHfsHyNRceZmzAYFJDXfLs0LHN1vBDK9GPXH2Bkj65tmV8wu+BBe/zHql/S3v0Iv/m310lFiP
 7DU+i3qpLgrHff30jx/3dV7g9pBunxex8jz+8XGl/Uj1lU6Y1RgT9uFr1r/JaCtDLa49BalBmRD
 a15MbzJsnTBEKURfFUWg0rQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_080628_153973_D923EE20 
X-CRM114-Status: GOOD (  15.07  )
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

Convert the driver to use guard functions for mutex handling as
a small cleanup. There is a small functional change in the DP PHY
power up function, which no longer sleeps if the internal powerup
code returns an error. This is not a problem as the sleep is only
relevant for successful power-up.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 54 +++++++++++++------------------
 1 file changed, 23 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 9ba571f7b9bf..9864024b9c0a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -10,6 +10,7 @@
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -649,14 +650,15 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
 	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
 
 	if (orien == TYPEC_ORIENTATION_NONE) {
 		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
 		/* unattached */
 		rk_udphy_usb_bvalid_enable(udphy, false);
-		goto unlock_ret;
+
+		return 0;
 	}
 
 	if (udphy->flip != flipped)
@@ -666,8 +668,6 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 
-unlock_ret:
-	mutex_unlock(&udphy->mutex);
 	return 0;
 }
 
@@ -1019,26 +1019,25 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 	int ret;
 
-	mutex_lock(&udphy->mutex);
+	scoped_guard(mutex, &udphy->mutex) {
+		phy_set_bus_width(phy, udphy->dp_lanes);
 
-	phy_set_bus_width(phy, udphy->dp_lanes);
-
-	ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
-	if (ret)
-		goto unlock;
+		ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
+		if (ret)
+			return ret;
 
-	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
+		rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dp_lane_select(udphy);
+		rk_udphy_dp_lane_select(udphy);
+	}
 
-unlock:
-	mutex_unlock(&udphy->mutex);
 	/*
 	 * If data send by aux channel too fast after phy power on,
 	 * the aux may be not ready which will cause aux error. Adding
 	 * delay to avoid this issue.
 	 */
 	usleep_range(10000, 11000);
+
 	return ret;
 }
 
@@ -1046,10 +1045,10 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
+
 	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
-	mutex_unlock(&udphy->mutex);
 
 	return 0;
 }
@@ -1254,35 +1253,30 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
-	int ret = 0;
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
+
 	/* DP only or high-speed, disable U3 port */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
-		goto unlock;
+		return 0;
 	}
 
-	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
-
-unlock:
-	mutex_unlock(&udphy->mutex);
-	return ret;
+	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
 }
 
 static int rk_udphy_usb3_phy_exit(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
+
 	/* DP only or high-speed */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
-		goto unlock;
+		return 0;
 
 	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
 
-unlock:
-	mutex_unlock(&udphy->mutex);
 	return 0;
 }
 
@@ -1314,12 +1308,10 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 	if (!rk_udphy_is_supported_mode(state))
 		return 0;
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	mutex_unlock(&udphy->mutex);
-
 	return 0;
 }
 

-- 
2.53.0


