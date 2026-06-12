Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A90BCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4Wco8480FO6PUbyM75XQ1Wh3P11pfctt7dutpCGgB4=; b=RNN/OFhKhvUL2br+X+Fu+/4MJx
	1g7JWy0rBpkkdKnyMcTJOtXx4NBbiBcQpizZoigXsoMPfVWJAJzsjCoWkybO4QJ4fpb4aF4DbK/1P
	aAZ6Dd4e7D0r17OoGrvQqJsW4azJlc2M2sHXMyrxnQ1cfHQ7gr6k+3ajKxsBEFTi+8IaaEkPNNui+
	XtVkEG0MqJcxuJe3TBDuvppG6JNX+knbg0o+w6HfEA/QRq0gd0qtYBrzNfqkRwrfNxHSZAkr9vAJ0
	RmDu3R4q2v70EsJrmZBMPoFvcO/ELFXZno+JiQGq+BzLSdMfaDbvClyHW5kuRjTV5Y8TV3FWBFuWF
	AHgqnHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4j8-0000000BHBC-3XWb;
	Fri, 12 Jun 2026 16:27:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4j5-0000000BHA8-3QL1;
	Fri, 12 Jun 2026 16:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281641;
	bh=TQjWe30iP+QgilolloWUpNb5d8ldWowCS2RaAcWUC6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LAVrbEnkDUxIY8LKDEPOdJcBH13N9KBwlx296+UJiE38sgjszfrGbIhOOkJrJ48Z6
	 E0zlRW5/vn5tNZ4h74AlaBrWQHpRvJc1LWMCCGaPAWus5pZHFvuKwR1fBovTOWjIxM
	 bW6g1E+45a8JRrs3I9+cysmhv+Q3rNU8qkCdiyyPJLNV203LKAUS1lXa4sWk/EE2dx
	 Mb+ZS/Muf5CoUae+HK/wR1TcAPxX7S8ckZVY3xCN/b2VHyx1sGDRX5UwkRn6N4TN6a
	 +pEWLGKkdXyDoLFiXBM4J/mO45PxPs3WdD3EC7MRD2Kyh1xshFN/a5ExWScSLa9wmM
	 iFQcV9tDUFpdA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E8FA17E35E3;
	Fri, 12 Jun 2026 18:27:21 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DC58B480055; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:54 +0200
Subject: [PATCH v5 16/18] phy: rockchip: usbdp: Use guard functions for
 mutex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-16-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4395;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=TQjWe30iP+QgilolloWUpNb5d8ldWowCS2RaAcWUC6Q=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiHUqM5F6HZgkgIiIkSxb1K9vCxFpnySJ
 bs9QpuH/0FAHIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qaIx0QAIq8Snm6ApF/CEZ7HvZrboecmFwtvq8JUuUo88ZKVBPeiPE2yZj+7NzgWiTA2kcZVoH
 ZwQbJf4DAPFneBj0whnbbVsObRF/GaAyb+1BMnY/kUwpZNKfw1aOpjJ5n5UoHCX+FMCIUd392lW
 zsSy6NKEETH+eZpmoHWeBsy9EknwNIh9NpCNyf2oIQo3xkgBMyNw3yXDcFZt2AcmpwT1p7jT/RF
 VuD0WahVD+TU+AYUOQjffFw4OZXDEULCLPza4pdfqa6GCybGCQltYmux5vzoTx5hmKbDUaI40Rk
 5eYwnsHDzdEnktSUVPHssFiHLRHaZPMWSoPlsse/109HFdWNj2E77gSDIJ5Mjtovw3+qlUwmVys
 PTbffEL3jlfmSCXVjnfeM/yZyCW95+pUnnbgbqcfuAdiQBI16wTJezqq2oa0peK33We4SzCR95+
 YHALvW7l4h235Z4pUgP0ETMaaZtRIUOgck5D8PjgGAJpiVj/QWqTh2S8GaEkcHE2s0Pf98S/bRG
 PXvUj9XzJV9V1Ecmb2YkG/349btjmb7oRf29i2EJMSot2u+51X2EUqufIYlfuWxq5LdIiD3RMjm
 6ZgsIRD+gtNgRJtO0oA1qMJErPh5hwjn6zZHJ2gZJmVmQxi2hbIVeNFBnY02X0hjgKnRzZWdkX1
 jOLtTfOjk9Qiq5TYbLsQmlQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092724_039775_131FC699 
X-CRM114-Status: GOOD (  14.91  )
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

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 51 ++++++++++++++-----------------
 1 file changed, 23 insertions(+), 28 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 4ba8b6f0a954..f673c5481d24 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -10,6 +10,7 @@
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
@@ -652,14 +653,15 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
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
@@ -669,8 +671,6 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 
-unlock_ret:
-	mutex_unlock(&udphy->mutex);
 	return 0;
 }
 
@@ -1043,26 +1043,25 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
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
 
@@ -1070,10 +1069,10 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
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
@@ -1275,19 +1274,18 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
-	int ret = 0;
+	int ret;
+
+	guard(mutex)(&udphy->mutex);
 
-	mutex_lock(&udphy->mutex);
 	/* DP only or high-speed, disable U3 port */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
-		goto unlock;
+		return 0;
 	}
 
 	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
 
-unlock:
-	mutex_unlock(&udphy->mutex);
 	return ret;
 }
 
@@ -1295,15 +1293,14 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
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
 
@@ -1326,12 +1323,10 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 	if (!state->alt || state->alt->svid != USB_TYPEC_DP_SID)
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


