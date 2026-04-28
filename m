Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731D7FF8877
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+N/GeiALPvDeTkFDVIjNiiRBFawtARcgiJZg0go6vRw=; b=Y9MU7RBg+wo9uCLNnYA7pCQK3D
	OYPLHjYo6dnujg75vKZhW+naw70g9L7dsJB4jP3sXg50QLZUCQZldZ8Qt0wD1EFyXiyQKppqVlxGB
	RJa1bzne2lz366vSAk+uBTiBsisxWWr0AhKrMVtqQcrBwRukypfewvGxjXwfQP9qtmbweFFV84bkp
	AsnxJtydbJr/2Y9fXf4DC/HpCTTCj+HE3E5JyVSP6+TWjvWK+AY7zBf78I16nkwsQzDP0yy5OIRTG
	C4GHMjYFb3hTvUhSxbLHzwAIFyoorU0VYwNcQGqjMpQGnkJGIOHNdvuQsxQuNspeFzta+EC3elO1f
	1UItS7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4t-00000001tF8-0J1G;
	Tue, 28 Apr 2026 16:14:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4f-00000001snh-32L4;
	Tue, 28 Apr 2026 16:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=67wDmxJ3v0D7azwKdSyF1seFoWWxCmMFNMvA6kd6Ops=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dQg9c+g04wfiQXa4L29DD0SCn3rfQo0h4bhB7cUqw9w/m0KvKqkkD1KVVQ5l+8LRw
	 kW3Cz8rkVt49bGwsCtUZ/+rqDL449FL1zfzFhgTOspoO+4EEEcEH/8+ihbiA3IEFmG
	 9yHi3LaNZmhHpNTGwa3v0EG5UqVKrZmM6J7PwR+n+sv3FBIeZa1I37lvKv9SxtWWER
	 g1mlt9KeSeNBa8y6FWe78ZYlq2rP3W6eyYTIzDXuHuNNVaauPBZrs70o72AG1lFxXO
	 0VImHn5AL3WenE/pvOSF3QvTOeLHUkHb16JtKrKze753KxOHZgqEjC/Fn2gQ3XnTTH
	 ak/UiDFBY1nOw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 76ECC17E15BE;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 984C6480065; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:55 +0200
Subject: [PATCH v4 16/16] phy: rockchip: usbdp: Use guard functions for
 mutex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-16-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4942;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=67wDmxJ3v0D7azwKdSyF1seFoWWxCmMFNMvA6kd6Ops=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MnW8CiIqQBhhqfXKVjaTn1rdb38SEoqq
 4GEkc+Bgl0Q+okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qaP5cP/13Aaft8oT737xrpkiUEL1jK6qvY/AcjzmzB37j0xavZ2FafsH3BTt+HH6PBKjtE3QX
 nKOSrF/PWSxdjtIdUYH3jLMSXb5hwRvUPeys1nhIzqWPBrBS1qTBhutRS2Zpx6JJ71zsMS39Bbf
 jjLUs3hEhB4P1rvUXPN0mmssmZJSMrzbqw22YE8if+gaZv3FbDK0eSxKqhPbLhArYFPqSC9Q0Cy
 BwndPrujnAAN4n6RrLLdEMTiGklUdaZkwvKuTPMu4bwpafnm8PiMkF+CVCj/cNmHlRezd6VMz73
 UmSiAw+GXgIF2bmiEKikLkqP2LkDTYnrn2VmlouhokzhkfjvAys/01SNA+dE2T9BOWeVl1op5tg
 kQdeLhR9Euy3Ips8IkuVg2CAv9X/2Hh2iaDQ9DoECSISnAhFSOy2eITbSNOGQS5rCPYVcu4RfUY
 hYHIZMf1c9zwmyfWOQhpa32H1qzLUsO/6roOXw4Bu75UrWixQrkMZAi/TOg7aeo9zfOPK+yfaZB
 slbEwJ+tnjlLmZIzzkWc9HQ73QDIZmH1yilVKpiCiXctAwSygQa+qBujNG+CBVgrtMTzF5IDgl8
 +LvL0Tw623G49bcPCDu8+8QTjKNNJo5e/IoDfV6Zm4J230OIgqdMsYU+0nZIFFejFkt8OqdzVk1
 SVn5lrpCGfbrJboxqYBsxHg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_091413_973757_4927EBCE 
X-CRM114-Status: GOOD (  15.29  )
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
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 60 ++++++++++++++-----------------
 1 file changed, 27 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 17637d92cf9b..f318b04c097d 100644
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
@@ -654,14 +655,15 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
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
@@ -671,8 +673,6 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 
-unlock_ret:
-	mutex_unlock(&udphy->mutex);
 	return 0;
 }
 
@@ -1044,12 +1044,10 @@ static int rk_udphy_dp_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
 
 	udphy->dp_in_use = true;
 
-	mutex_unlock(&udphy->mutex);
-
 	return 0;
 }
 
@@ -1057,9 +1055,10 @@ static int rk_udphy_dp_phy_exit(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
+
 	udphy->dp_in_use = false;
-	mutex_unlock(&udphy->mutex);
+
 	return 0;
 }
 
@@ -1068,26 +1067,25 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
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
 
@@ -1095,10 +1093,10 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
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
@@ -1302,19 +1300,18 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
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
 
@@ -1322,15 +1319,14 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
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
 
@@ -1345,12 +1341,10 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	mutex_unlock(&udphy->mutex);
-
 	return 0;
 }
 

-- 
2.53.0


