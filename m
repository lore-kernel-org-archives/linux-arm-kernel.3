Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C198BC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 14:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhJ/KOnbvasCFETpQggN9O05Q5AQySa7hViHeBPdUq8=; b=Bhj97+oUIsK8PmO6oSEyl/evr/
	8lYKsUEeQiKiZhYsAojc+NrROs8z3/lVx6tYXpzb9MBZNtNT5Vtnqs1/GoudOkZGot9KJTeSckEJF
	9oEyc8PeWyChh0GiH47ubLulrPBxAPy9CkNsig8tK9TQ+F5ajrFWWli3zY7iPxHyJMAv4+IbOq75g
	4BebD/RnOPSL4OY0mpJ7XJGiHh6ysvW+lDlqTNaePcK2Lk52hbGiBa45N/8aNnH+xKA3vbTAatkqF
	jkRKtxjGCvwKJyw7DTuMOv5A7whtPLVibfslB6E7ykSQSOM14rsSu6wjm2azRyXFplUzML26jHGuF
	dvq71qVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twiNo-00000003Ktu-2N9f;
	Mon, 24 Mar 2025 14:02:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twiIk-00000003K6C-1Qva
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 13:57:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso23539235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742824633; x=1743429433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhJ/KOnbvasCFETpQggN9O05Q5AQySa7hViHeBPdUq8=;
        b=PXdg9l6reBg++gm2JRs4qyXBx7XTuGHXeXGp9B4UPdLuT5MCMX4sz2xwLNFBBsGslc
         zhtCbwvLHsfJQJZRngrOblA9FHb2A8poVKkC4ivdmQF8Rl5+J7T9hpyGrCGrOC5IT9xA
         lYgsqbvyZ/0qNjsXtAqP4oTSYEZEEx/sc9wJcTGv55r+tbj6+XuI5O9JzE0bo93LwYgg
         /FoZX+PQFS4D91FQJ6GPdAUSBdofgcUDFEdUzDScgWuQjeuXtUzXc0l2t+27Th8E1TFu
         +5j5hkN+MXzIHZM48IDKm1ov77FnTutAarL5Qm3FwiuA9CVW0/O2DjPxjJwpS02lSYgq
         JKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824633; x=1743429433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhJ/KOnbvasCFETpQggN9O05Q5AQySa7hViHeBPdUq8=;
        b=G81tbVJB8wvASDlItvwHYMCdx6obCODut43NSoPI6UVNrIikXv9+qUHkoZNjaRUfgr
         Yma1RWbuGQkz66rtf161FTHq8ys2Ay+LDHZF5wfFrjAmYRwyi+8H/62ZTjLR80ZxxZ58
         QESJoFshlSP/jI/8XmL96KqDMoVzpCswqvIdiQ2MkdjUgCPN4j1lJ991//Uw21h5AAWW
         i5p6S90X3k1FS9Sr5XDEu/vccFlKqtKRuP7aTk2rpuIHC2dpCRiCQXqOIsRl6hmUirZA
         Qs4pAw8A/vOtSN1Rcj4Hb8nYHv+LQ9etQmUG1+H+tCl7fdEkSOdiqY/iGJvRxPrL9Jw8
         Uv1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXi/BLNAZ4TPFVXt6q4emmTbD8hk0g4i+AYiapDKgfwpDq0T36fze5cL8T5d3JwxOOKzcwrSd80NI6AiBiv3SFQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3xwxHhoSs2YS8cpMbPbUvQgXWN5VuOUvmsxBmHtZOTC/jLU0O
	ilIgCNOqOrzJPQos6AGRxCrS+oWQ/aNKnFF2mC5vzadRV7UQgt0XFFp5yrfL1Dk=
X-Gm-Gg: ASbGncsD+hhjLHtvVhXVMNLl24WW4GB5TRkyt+IedBkwcaWGLOgwG4GmkMthKL4ntyt
	qXNA6Oj8CDPH8hMcKRKFfKKJEF8Ncvcrb0lugfI4KZgCmNNkogUn7LxGiJ+ISeIu9Ow/T1pv+Hu
	YCqmG56HGW+DufpAarz4JScDkzzTSejuUz9LeN/cN4dqAhP07KIgEyL1ZXRXPGpinnOsIkzT8GD
	twp924LkHSwG0TrMn75rL7/leIHUEv0HA4zGeK2SEM/YKcyBGoix7kYL2aeGUbjEDWtiFEKli+R
	RvKo3F0Ob/2m+rhpMcuBSDzsZnGjsLjBUXKh2qaHWUUQ9bSVSLdgeWQ+ouha6EoaeHn7+HmvriL
	LUzocdohH
X-Google-Smtp-Source: AGHT+IEUmzuDTQ++wAtgq0ZGTG4AOEt3lkkUIf8KVIRWixpO87zfJFNBtQaOxtOdIiS1wtmbI7DnJg==
X-Received: by 2002:a05:600c:1c90:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-43d509ea85cmr112761825e9.8.1742824632765;
        Mon, 24 Mar 2025 06:57:12 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbcfaasm120146525e9.35.2025.03.24.06.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:57:12 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 2/4] thermal: renesas: rzg3s: Add thermal driver for the Renesas RZ/G3S SoC
Date: Mon, 24 Mar 2025 15:56:59 +0200
Message-ID: <20250324135701.179827-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_065714_461439_6294F1B7 
X-CRM114-Status: GOOD (  29.58  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC features a Thermal Sensor Unit (TSU) that reports
the junction temperature. The temperature is reported through a dedicated
ADC channel. Add a driver for the Renesas RZ/G3S TSU.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- drop the runtime resume/suspend from rzg3s_thermal_get_temp(); this
  is not needed as the temperature is read with ADC
- opened the devres group id in rzg3s_thermal_probe() and rename
  previsouly rzg3s_thermal_probe() to rzg3s_thermal_probe_helper(), to
  have simpler code; this approach was suggested by Jonathan in [1];
  as there is no positive feedback for the generic solution [2] this
  looks currently the best approach

[1] https://lore.kernel.org/all/20250224120608.1769039-2-claudiu.beznea.uj@bp.renesas.com
[2] https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com


Changes in v2:
- use a devres group for the devm resources obtained though this
  driver to avoid issue described in [1]; with this dropped the
  following calls:
-- thermal_add_hwmon_sysfs(priv->tz);
-- thermal_of_zone_register(priv->tz);
-- pm_runtime_enable(priv->dev);
  and use devm variants
- used signed variables for temperature computation
- convert to mili degree Celsius before applying the computation formula
  to avoid losing precision

[1] https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/

 MAINTAINERS                             |   7 +
 drivers/thermal/renesas/Kconfig         |   8 +
 drivers/thermal/renesas/Makefile        |   1 +
 drivers/thermal/renesas/rzg3s_thermal.c | 313 ++++++++++++++++++++++++
 4 files changed, 329 insertions(+)
 create mode 100644 drivers/thermal/renesas/rzg3s_thermal.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a9b8fa5f032..f3795fbcdcba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20594,6 +20594,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/potentiometer/renesas,x9250.yaml
 F:	drivers/iio/potentiometer/x9250.c
 
+RENESAS RZ/G3S THERMAL SENSOR UNIT DRIVER
+M:	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+L:	linux-pm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
+F:	drivers/thermal/renesas/rzg3s_thermal.c
+
 RESET CONTROLLER FRAMEWORK
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 S:	Maintained
diff --git a/drivers/thermal/renesas/Kconfig b/drivers/thermal/renesas/Kconfig
index dcf5fc5ae08e..566478797095 100644
--- a/drivers/thermal/renesas/Kconfig
+++ b/drivers/thermal/renesas/Kconfig
@@ -26,3 +26,11 @@ config RZG2L_THERMAL
 	help
 	  Enable this to plug the RZ/G2L thermal sensor driver into the Linux
 	  thermal framework.
+
+config RZG3S_THERMAL
+	tristate "Renesas RZ/G3S thermal driver"
+	depends on ARCH_R9A08G045 || COMPILE_TEST
+	depends on OF && IIO && RZG2L_ADC
+	help
+	  Enable this to plug the RZ/G3S thermal sensor driver into the Linux
+	  thermal framework.
diff --git a/drivers/thermal/renesas/Makefile b/drivers/thermal/renesas/Makefile
index bf9cb3cb94d6..1feb5ab78827 100644
--- a/drivers/thermal/renesas/Makefile
+++ b/drivers/thermal/renesas/Makefile
@@ -3,3 +3,4 @@
 obj-$(CONFIG_RCAR_GEN3_THERMAL)	+= rcar_gen3_thermal.o
 obj-$(CONFIG_RCAR_THERMAL)	+= rcar_thermal.o
 obj-$(CONFIG_RZG2L_THERMAL)	+= rzg2l_thermal.o
+obj-$(CONFIG_RZG3S_THERMAL)	+= rzg3s_thermal.o
diff --git a/drivers/thermal/renesas/rzg3s_thermal.c b/drivers/thermal/renesas/rzg3s_thermal.c
new file mode 100644
index 000000000000..e0bc51943875
--- /dev/null
+++ b/drivers/thermal/renesas/rzg3s_thermal.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G3S TSU Thermal Sensor Driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/iio/consumer.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <linux/thermal.h>
+#include <linux/units.h>
+
+#include "../thermal_hwmon.h"
+
+#define TSU_SM			0x0
+#define TSU_SM_EN		BIT(0)
+#define TSU_SM_OE		BIT(1)
+#define OTPTSUTRIM_REG(n)	(0x18 + (n) * 0x4)
+#define OTPTSUTRIM_EN_MASK	BIT(31)
+#define OTPTSUTRIM_MASK		GENMASK(11, 0)
+
+#define TSU_READ_STEPS		8
+
+/* Default calibration values, if FUSE values are missing. */
+#define SW_CALIB0_VAL		1297
+#define SW_CALIB1_VAL		751
+
+#define MCELSIUS(temp)		((temp) * MILLIDEGREE_PER_DEGREE)
+
+/**
+ * struct rzg3s_thermal_priv - RZ/G3S thermal private data structure
+ * @base: TSU base address
+ * @dev: device pointer
+ * @tz: thermal zone pointer
+ * @rstc: reset control
+ * @channel: IIO channel to read the TSU
+ * @devres_group_id: devres group for the driver devres resources
+ *		      obtained in probe
+ * @mode: current device mode
+ * @calib0: calibration value
+ * @calib1: calibration value
+ */
+struct rzg3s_thermal_priv {
+	void __iomem *base;
+	struct device *dev;
+	struct thermal_zone_device *tz;
+	struct reset_control *rstc;
+	struct iio_channel *channel;
+	void *devres_group_id;
+	enum thermal_device_mode mode;
+	u16 calib0;
+	u16 calib1;
+};
+
+static int rzg3s_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct rzg3s_thermal_priv *priv = thermal_zone_device_priv(tz);
+	int ts_code_ave = 0;
+	int ret, val;
+
+	if (priv->mode != THERMAL_DEVICE_ENABLED)
+		return -EAGAIN;
+
+	for (u8 i = 0; i < TSU_READ_STEPS; i++) {
+		ret = iio_read_channel_raw(priv->channel, &val);
+		if (ret < 0)
+			return ret;
+
+		ts_code_ave += val;
+		/*
+		 * According to the HW manual (section 40.4.4 Procedure for Measuring the
+		 * Temperature) we need to wait here at leat 3us.
+		 */
+		usleep_range(5, 10);
+	}
+
+	ret = 0;
+	ts_code_ave = DIV_ROUND_CLOSEST(MCELSIUS(ts_code_ave), TSU_READ_STEPS);
+
+	/*
+	 * According to the HW manual (section 40.4.4 Procedure for Measuring the Temperature)
+	 * the computation formula is as follows:
+	 *
+	 * Tj = (ts_code_ave - priv->calib1) * 165 / (priv->calib0 - priv->calib1) - 40
+	 *
+	 * Convert everything to mili Celsius before applying the formula to avoid
+	 * losing precision.
+	 */
+
+	*temp = DIV_ROUND_CLOSEST((s64)(ts_code_ave - MCELSIUS(priv->calib1)) * MCELSIUS(165),
+				  MCELSIUS(priv->calib0 - priv->calib1)) - MCELSIUS(40);
+
+	/* Report it in mili degrees Celsius and round it up to 0.5 degrees Celsius. */
+	*temp = roundup(*temp, 500);
+
+	return ret;
+}
+
+static void rzg3s_thermal_set_mode(struct rzg3s_thermal_priv *priv,
+				   enum thermal_device_mode mode)
+{
+	struct device *dev = priv->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return;
+
+	if (mode == THERMAL_DEVICE_DISABLED) {
+		writel(0, priv->base + TSU_SM);
+	} else {
+		writel(TSU_SM_EN, priv->base + TSU_SM);
+		/*
+		 * According to the HW manual (section 40.4.1 Procedure for
+		 * Starting the TSU) we need to wait here 30us or more.
+		 */
+		usleep_range(30, 40);
+
+		writel(TSU_SM_OE | TSU_SM_EN, priv->base + TSU_SM);
+		/*
+		 * According to the HW manual (section 40.4.1 Procedure for
+		 * Starting the TSU) we need to wait here 50us or more.
+		 */
+		usleep_range(50, 60);
+	}
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+}
+
+static int rzg3s_thermal_change_mode(struct thermal_zone_device *tz,
+				     enum thermal_device_mode mode)
+{
+	struct rzg3s_thermal_priv *priv = thermal_zone_device_priv(tz);
+
+	if (priv->mode == mode)
+		return 0;
+
+	rzg3s_thermal_set_mode(priv, mode);
+	priv->mode = mode;
+
+	return 0;
+}
+
+static const struct thermal_zone_device_ops rzg3s_tz_of_ops = {
+	.get_temp = rzg3s_thermal_get_temp,
+	.change_mode = rzg3s_thermal_change_mode,
+};
+
+static int rzg3s_thermal_read_calib(struct rzg3s_thermal_priv *priv)
+{
+	struct device *dev = priv->dev;
+	u32 val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	val = readl(priv->base + OTPTSUTRIM_REG(0));
+	if (val & OTPTSUTRIM_EN_MASK)
+		priv->calib0 = FIELD_GET(OTPTSUTRIM_MASK, val);
+	else
+		priv->calib0 = SW_CALIB0_VAL;
+
+	val = readl(priv->base + OTPTSUTRIM_REG(1));
+	if (val & OTPTSUTRIM_EN_MASK)
+		priv->calib1 = FIELD_GET(OTPTSUTRIM_MASK, val);
+	else
+		priv->calib1 = SW_CALIB1_VAL;
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+}
+
+static int rzg3s_thermal_probe_helper(struct platform_device *pdev, void *devres_group_id)
+{
+	struct rzg3s_thermal_priv *priv;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->devres_group_id = devres_group_id;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->channel = devm_iio_channel_get(dev, "tsu");
+	if (IS_ERR(priv->channel))
+		return dev_err_probe(dev, PTR_ERR(priv->channel), "Failed to get IIO channel!\n");
+
+	priv->rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(priv->rstc))
+		return dev_err_probe(dev, PTR_ERR(priv->rstc), "Failed to get reset!\n");
+
+	priv->dev = dev;
+	priv->mode = THERMAL_DEVICE_DISABLED;
+	platform_set_drvdata(pdev, priv);
+
+	pm_runtime_set_autosuspend_delay(dev, 300);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable runtime PM!\n");
+
+	ret = rzg3s_thermal_read_calib(priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read calibration data!\n");
+
+	priv->tz = devm_thermal_of_zone_register(dev, 0, priv, &rzg3s_tz_of_ops);
+	if (IS_ERR(priv->tz))
+		return dev_err_probe(dev, PTR_ERR(priv->tz), "Failed to register thermal zone!\n");
+
+	ret = devm_thermal_add_hwmon_sysfs(dev, priv->tz);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add hwmon sysfs!\n");
+
+	return 0;
+}
+
+static int rzg3s_thermal_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	void *devres_group_id;
+	int ret;
+
+	/*
+	 * Open a devres group to allow using devm_pm_runtime_enable()
+	 * w/o interfeering with dev_pm_genpd_detach() in the platform bus
+	 * remove. Otherwise, durring repeated unbind/bind operations,
+	 * the TSU may be runtime resumed when it is not part of its power
+	 * domain, leading to accessing TSU registers (through
+	 * rzg3s_thermal_change_mode()) without its clocks being enabled
+	 * and its PM domain being turned on.
+	 */
+	devres_group_id = devres_open_group(dev, NULL, GFP_KERNEL);
+	if (!devres_group_id)
+		return -ENOMEM;
+
+	ret = rzg3s_thermal_probe_helper(pdev, devres_group_id);
+	if (ret)
+		devres_release_group(dev, devres_group_id);
+
+	return ret;
+}
+
+static void rzg3s_thermal_remove(struct platform_device *pdev)
+{
+	struct rzg3s_thermal_priv *priv = dev_get_drvdata(&pdev->dev);
+
+	devres_release_group(priv->dev, priv->devres_group_id);
+}
+
+static int rzg3s_thermal_suspend(struct device *dev)
+{
+	struct rzg3s_thermal_priv *priv = dev_get_drvdata(dev);
+
+	rzg3s_thermal_set_mode(priv, THERMAL_DEVICE_DISABLED);
+
+	return reset_control_assert(priv->rstc);
+}
+
+static int rzg3s_thermal_resume(struct device *dev)
+{
+	struct rzg3s_thermal_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return ret;
+
+	if (priv->mode != THERMAL_DEVICE_DISABLED)
+		rzg3s_thermal_set_mode(priv, priv->mode);
+
+	return 0;
+}
+
+static const struct dev_pm_ops rzg3s_thermal_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(rzg3s_thermal_suspend, rzg3s_thermal_resume)
+};
+
+static const struct of_device_id rzg3s_thermal_dt_ids[] = {
+	{ .compatible = "renesas,r9a08g045-tsu" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rzg3s_thermal_dt_ids);
+
+static struct platform_driver rzg3s_thermal_driver = {
+	.driver = {
+		.name = "rzg3s_thermal",
+		.of_match_table = rzg3s_thermal_dt_ids,
+		.pm = pm_ptr(&rzg3s_thermal_pm_ops),
+	},
+	.probe = rzg3s_thermal_probe,
+	.remove = rzg3s_thermal_remove,
+};
+module_platform_driver(rzg3s_thermal_driver);
+
+MODULE_DESCRIPTION("Renesas RZ/G3S Thermal Sensor Unit Driver");
+MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0


