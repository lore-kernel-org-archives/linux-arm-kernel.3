Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8D7C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQxlVtrJtUCrJtsTUEo3upetgEQMqaEgBfUje9yw0l0=; b=xbLbnVeHh32+d5ru1fhYFaEwBB
	BKdcNY66oMRs/WOlr+8bpAvEGxtfb73B/dBxkrnfuFE2erxPq69UrfaSCU2ZwRpvP39y34xWo5sve
	VcOGOmtlbzSpuaM+iUlA/SH27OO54T2PCe7TOQjYTMoQjtjjozSAmtWunq0srY4uLaHCpoNulF+eH
	lFgE6/KFOcZ3T2gA7Cc3L6RmSpDCc7lv4UuL3glr9oeVLSczIX9OD8m4UZr9j+MR0cjwQ91kfsohK
	nOe+bxkA3x1nYPwxTENsxRw/2gG9errsz8J/w2u1XkMz6mXltHg6U/9zmheIiGF7ScYobIOuWMq8Y
	xAA4jYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndh7-00000007Tgq-2iQZ;
	Thu, 27 Feb 2025 13:12:53 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncxT-00000007MQx-0ckF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:25:44 +0000
X-CSE-ConnectionGUID: yBFGoVt4TKauLojNfmO+9g==
X-CSE-MsgGUID: TYxiKB1vSN+0/gxkx2XnNw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Feb 2025 21:25:42 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.68])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4EFEF4007D01;
	Thu, 27 Feb 2025 21:25:35 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	biju.das.jz@bp.renesas.com
Subject: [PATCH v2 5/7] thermal: renesas: rzg3e: Add safety check when reading temperature
Date: Thu, 27 Feb 2025 13:24:41 +0100
Message-ID: <20250227122453.30480-6-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227122453.30480-1-john.madieu.xa@bp.renesas.com>
References: <20250227122453.30480-1-john.madieu.xa@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_042543_294305_8A5E9FE0 
X-CRM114-Status: GOOD (  16.79  )
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

Becaure reading temperature may fail, add mechanism to panic in case
reading the temperature fails after a given number of trials. This is due
to the thermal core disabling the thermal zone device after a couple of
consecutive attempt failures.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
v1 -> v2: no changes

 drivers/thermal/renesas/rzg3e_thermal.c | 38 +++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/renesas/rzg3e_thermal.c b/drivers/thermal/renesas/rzg3e_thermal.c
index be9e1d118a67..ff80d1b517c8 100644
--- a/drivers/thermal/renesas/rzg3e_thermal.c
+++ b/drivers/thermal/renesas/rzg3e_thermal.c
@@ -83,6 +83,19 @@
 #define TSU_TIMEOUT_US		10000
 #define TSU_MIN_CLOCK_RATE	24000000
 
+/*
+ * Number of consecutive errors before shutdown
+ *
+ * While simulating thermal sensor failure, we have noticed that the thermal
+ * core tries to fetch the temperature a couple times and then disable the
+ * thermal zone device. In case of extreme heat, this might lead to SoC
+ * destruction.
+ *
+ * Let's prevent this by limitating the number of failure and panic in
+ * case it happens.
+ */
+#define MAX_TEMP_READ_ERRORS       10
+
 /**
  * struct rzg3e_thermal_priv - RZ/G3E thermal private data structure
  * @base: TSU base address
@@ -93,6 +106,7 @@
  * @conv_complete: ADC conversion completion
  * @reg_lock: protect shared register access
  * @cached_temp: last computed temperature (milliCelsius)
+ * @error_count: Track consecutive errors
  * @trmval: trim (calibration) values
  */
 struct rzg3e_thermal_priv {
@@ -104,6 +118,7 @@ struct rzg3e_thermal_priv {
 	struct completion conv_complete;
 	spinlock_t reg_lock;
 	int cached_temp;
+	atomic_t error_count;
 	u32 trmval[2];
 };
 
@@ -200,6 +215,7 @@ static irqreturn_t rzg3e_thermal_adc_irq(int irq, void *dev_id)
 static int rzg3e_thermal_get_temp(struct thermal_zone_device *zone, int *temp)
 {
 	struct rzg3e_thermal_priv *priv = thermal_zone_device_priv(zone);
+	int error_count;
 	u32 val;
 	int ret;
 
@@ -217,7 +233,7 @@ static int rzg3e_thermal_get_temp(struct thermal_zone_device *zone, int *temp)
 					TSU_POLL_DELAY_US, TSU_TIMEOUT_US);
 	if (ret) {
 		dev_err(priv->dev, "ADC conversion timed out\n");
-		return ret;
+		goto handle_error;
 	}
 
 	/* Start conversion */
@@ -225,15 +241,33 @@ static int rzg3e_thermal_get_temp(struct thermal_zone_device *zone, int *temp)
 
 	if (!wait_for_completion_timeout(&priv->conv_complete,
 					 msecs_to_jiffies(100))) {
+		ret = -ETIMEDOUT;
 		dev_err(priv->dev, "ADC conversion completion timeout\n");
-		return -ETIMEDOUT;
+		goto handle_error;
 	}
 
 	scoped_guard(spinlock_irqsave, &priv->reg_lock) {
 		*temp = priv->cached_temp;
 	}
 
+	/* Reset error count on successful read */
+	atomic_set(&priv->error_count, 0);
 	return 0;
+
+handle_error:
+	error_count = atomic_inc_return(&priv->error_count);
+	if (error_count >= MAX_TEMP_READ_ERRORS) {
+		dev_emerg(priv->dev,
+			"Failed to read temperature %d times, initiating emergency shutdown\n",
+			error_count);
+		mdelay(100);
+		panic("Temperature sensor failure - emergency shutdown");
+	}
+
+	dev_err(priv->dev, "Failed to read temperature (error %d), attempt %d/%d\n",
+		ret, error_count, MAX_TEMP_READ_ERRORS);
+
+	return ret;
 }
 
 /* Convert temperature in milliCelsius to raw sensor code */
-- 
2.25.1


