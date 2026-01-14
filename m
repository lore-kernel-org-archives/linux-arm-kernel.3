Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41ACD37E33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdOFUkO2rK+vmXcRhQDnh9qxgTzvG+6iS6r5EIC/eI4=; b=awY/5Y4KHA8FkLYbsLIZChqSuN
	/ddsMb0BL9Pc+nfVf7ErqPx0jmds0L8hl3QhlXxKJsTjooqOYzaIhXZkIRikKWtC2RL+QWkqG7mco
	Up3hdoDxWFla+Cfldgy+PnpCzZziUgUAkP83NyJuf+tDYlF/gK8055yJ7yQ1l1N5SMVT4jXJlQ1c9
	06/1GmJdba3blWFhLVvLPUpNLaUkYn8EUwOeWWVyKlxw+MJhdqf8bgoEivkZQkl7wvT2MzROBPamv
	zoxHFB5pQxs9YZDL3ozoqgW8ifUxWz3dhs2ZcojGisg/4Zx6AANVyEqK/C2ANSqNcuTHLGu3JvJKg
	rkuPHeYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gX-00000009UTA-3lke;
	Wed, 14 Jan 2026 14:17:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gU-00000009UOo-2iD7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:17:20 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so87777495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 06:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400237; x=1769005037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdOFUkO2rK+vmXcRhQDnh9qxgTzvG+6iS6r5EIC/eI4=;
        b=sBbPxj+axwM2T4dqKPBcJa4dAzl7e+ZGSLD8OzxT+JXfLiNDhIhGsLldqm3SqN7qz0
         Z4h1Kpc2pi5+dAd/hmlcl1Lo3PyjbSPQJnfc5SnMd4hos02jaObZ8bHQctG8GTywtHCm
         AvfVPWrE8S4ZXxAiBvoX1vSF/e1NmQ61SfrXT58nrSNi4YKfarUC4UzpGqb+UZlAO8ZQ
         qKeD5LfwLpTN5ddSkllb7Vh9ZoAMwnjcdeWM4YaRyKBjH6msI04u328JfrY4fLVwXqW2
         JmSqqddWnhfbaR+4df+t0XDsXMYDyfrYB/lHVyXnhLUkLKsMFPvxxgB4gOO0xacOMe0T
         R/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400237; x=1769005037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vdOFUkO2rK+vmXcRhQDnh9qxgTzvG+6iS6r5EIC/eI4=;
        b=F/l6eV+uH+KJHF5jFWHtslShQlCJqw2lvWIlfRAQXkH77LGAo/B46jAQaFh4jnRVgD
         7FPbSlCV80Mzcdn1XjNg4MuIepjSYwsImILE4MoEVdR9hC+Sy00QYm2UM7HWoB+YbP8H
         vfD8F1PVkb25k0UHeBERntUKJ/A+U3RIFnawigz9dz8mlaBI7S5xpjaHCMddPY9FPdK2
         JOmJ8ZbuE7cXyg5Se71ygeMpEJSvblNmVTAlfIGuKisJ7gnExoYhZxd/wTnvsdEA4akE
         o+ETQyzzNrnYA1XSSlJqF3bX2GpDX86tMuVuYgD+pR+uN/gP9M99SuP8OmHTpJZu7pM+
         t9aA==
X-Forwarded-Encrypted: i=1; AJvYcCUIBkiJMPub37pp1SwEudSk42ldRiyvC0+4MnCE3TYUnL1JmIzfD691amEjWsMFxGpDTiQBfmbi0NaA1VpCPF6d@lists.infradead.org
X-Gm-Message-State: AOJu0YyV0E6rtMKpCSHpb4rSfeSwCDA+rEXUnhCy34nEWgEuTCbNgWJB
	zULiyLCMfdOxyydT+Ce+f6OYMVml5iXm8vZqF7D1mYYfTECfCLrxI5kDZbDSUe9R7rs=
X-Gm-Gg: AY/fxX6tpnne9dCOIKeb+UayEVaiUqfMHrkf4bxeRkkTn6FMpReew8mgfNxXJ1vkHEu
	87dQYtGYrAjkvKBkAjRwPLdupNel5eXNh4grjBXP1D1UxXJRuiPQ3MQKPIe8inCA13JA0qUGGMH
	37InPRNy296iYwggmsXp2f823tot+WoaA64E7U68uJiLqlTek8CbliaaH6odTnJSTaEYTMb9qD3
	VKQpNdyk9uu4oXXnmjx7HRxIdIQA92Gs7bijsfEmWN/hukODnNNCVQxmqXuieLyTcMjteyhG+x/
	IKaLlLv3GKGkDnm1v63qgyqpE+VU4bsPXPIEdBwwGSve6ZOOO1jIk1VF3Utnu3cgZfO/61bWTOm
	A77/QDLnNMjyfHjN4Y+miM7HJ8c5X7y12LojvM+g2Ko8oDMKNFt9AdWGK4nsa+RpZVyPQUw2uuo
	0OB4ssIEAX0//7HfRGHaBE8nXjcOChrhjt4MDwjg42rS4w2RDrCkeEAuunDBlIny3wL9nFMw==
X-Received: by 2002:a05:600c:4e0f:b0:47d:4fbe:e6cc with SMTP id 5b1f17b1804b1-47ee32fc6f7mr35528635e9.13.1768400236418;
        Wed, 14 Jan 2026 06:17:16 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm29595445e9.6.2026.01.14.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:17:15 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 14 Jan 2026 14:16:33 +0000
Subject: [PATCH 5/8] thermal: samsung: Add support for GS101 TMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-acpm-tmu-v1-5-cfe56d93e90f@linaro.org>
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
In-Reply-To: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768400224; l=19726;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ycpTTuEHw1ktY5WMh2z4gJLM2jmFjBFEmH6MdKsS1So=;
 b=eED9yiRauzhGXIgeGdYP5CwjdKHFDJEMMA2jDrY3zoMHdeoGBrrHvA2fJnMVrzxv0icVFiP08
 E4szHaZjxIhBFGBoK34KNK6iumTx+q0/C0Bs40VtYBaHp9BEPIjgYf6
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_061718_858895_C0B81C91 
X-CRM114-Status: GOOD (  25.27  )
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

Add the thermal driver for the Google GS101 SoC.

The GS101 TMU architecture involves a split responsibility between the
kernel and the Alive Core and Power Manager (ACPM) firmware. The kernel
is responsible for mapping the interrupt pending registers via syscon
to identify thermal events, while the firmware handles sensor configuration,
threshold setting, and interrupt acknowledgment via the ACPM protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/Kconfig    |  16 +
 drivers/thermal/samsung/Makefile   |   2 +
 drivers/thermal/samsung/acpm-tmu.c | 638 +++++++++++++++++++++++++++++++++++++
 3 files changed, 656 insertions(+)

diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
index f4eff5a41a84ce02b12abb85d6a0f8818031d0dc..dfe1c19e982f407e6d8acd65958ee39d671c6924 100644
--- a/drivers/thermal/samsung/Kconfig
+++ b/drivers/thermal/samsung/Kconfig
@@ -9,3 +9,19 @@ config EXYNOS_THERMAL
 	  the TMU, reports temperature and handles cooling action if defined.
 	  This driver uses the Exynos core thermal APIs and TMU configuration
 	  data from the supported SoCs.
+
+config EXYNOS_ACPM_THERMAL
+	tristate "Exynos ACPM thermal management unit driver"
+	depends on THERMAL_OF
+	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
+	help
+	  Support for the Thermal Management Unit (TMU) on Google GS101 SoC.
+
+	  The TMU on GS101 is managed by the Alive Clock and Power Manager
+	  (ACPM) firmware. This driver handles the kernel-side interaction,
+	  including reading interrupt status registers via syscon and
+	  communicating with the firmware via the ACPM protocol for
+	  configuration and thermal events.
+
+	  Select this if you want to monitor device temperature and enable
+	  thermal mitigation on GS101 based devices.
diff --git a/drivers/thermal/samsung/Makefile b/drivers/thermal/samsung/Makefile
index f139407150d26940fc9ffcf000505cea4866223f..daed80647c349ba4f937ed8fbe6be9df06c34aac 100644
--- a/drivers/thermal/samsung/Makefile
+++ b/drivers/thermal/samsung/Makefile
@@ -4,3 +4,5 @@
 #
 obj-$(CONFIG_EXYNOS_THERMAL)			+= exynos_thermal.o
 exynos_thermal-y				:= exynos_tmu.o
+obj-$(CONFIG_EXYNOS_ACPM_THERMAL)		+= exynos_acpm_thermal.o
+exynos_acpm_thermal-y				:= acpm-tmu.o
diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
new file mode 100644
index 0000000000000000000000000000000000000000..f6ae4c7815421e684d4ea7ac7a486a9968292324
--- /dev/null
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -0,0 +1,638 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2019 Samsung Electronics Co., Ltd.
+ * Copyright 2025 Google LLC.
+ * Copyright 2026 Linaro Ltd.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/device/devres.h>
+#include <linux/err.h>
+#include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/thermal.h>
+#include <linux/units.h>
+
+#include "../thermal_hwmon.h"
+
+#define EXYNOS_TMU_SENSOR(i)		BIT(i)
+#define EXYNOS_TMU_SENSORS_MAX_COUNT	16
+
+#define GS101_CPUCL2_SENSOR_MASK (EXYNOS_TMU_SENSOR(0) |	\
+				  EXYNOS_TMU_SENSOR(6) |	\
+				  EXYNOS_TMU_SENSOR(7) |	\
+				  EXYNOS_TMU_SENSOR(8) |	\
+				  EXYNOS_TMU_SENSOR(9))
+#define GS101_CPUCL1_SENSOR_MASK (EXYNOS_TMU_SENSOR(4) |	\
+				  EXYNOS_TMU_SENSOR(5))
+#define GS101_CPUCL0_SENSOR_MASK (EXYNOS_TMU_SENSOR(1) |	\
+				  EXYNOS_TMU_SENSOR(2))
+
+#define GS101_REG_INTPEND(i)		((i) * 0x50 + 0xf8)
+
+enum {
+	P0_INTPEND,
+	P1_INTPEND,
+	P2_INTPEND,
+	P3_INTPEND,
+	P4_INTPEND,
+	P5_INTPEND,
+	P6_INTPEND,
+	P7_INTPEND,
+	P8_INTPEND,
+	P9_INTPEND,
+	P10_INTPEND,
+	P11_INTPEND,
+	P12_INTPEND,
+	P13_INTPEND,
+	P14_INTPEND,
+	P15_INTPEND,
+	REG_INTPEND_COUNT,
+};
+
+struct acpm_tmu_sensor_group {
+	u16 mask;
+	u8 id;
+};
+
+struct acpm_tmu_sensor {
+	const struct acpm_tmu_sensor_group *group;
+	struct thermal_zone_device *tzd;
+	struct acpm_tmu_priv *priv;
+	struct mutex lock; /* protects sensor state */
+	bool enabled;
+};
+
+struct acpm_tmu_priv {
+	struct regmap_field *regmap_fields[REG_INTPEND_COUNT];
+	const struct acpm_handle *handle;
+	struct device *dev;
+	struct clk *clk;
+	unsigned int mbox_chan_id;
+	unsigned int num_sensors;
+	int irq;
+	struct acpm_tmu_sensor sensors[] __counted_by(num_sensors);
+};
+
+struct acpm_tmu_driver_data {
+	const struct reg_field *syscon_reg_fields;
+	const struct acpm_tmu_sensor_group *sensor_groups;
+	unsigned int num_sensor_groups;
+	unsigned int mbox_chan_id;
+};
+
+struct acpm_tmu_initialize_tripwalkdata {
+	unsigned char threshold[8];
+	unsigned char hysteresis[8];
+	unsigned char inten;
+	int i;
+};
+
+struct acpm_tmu_trip_temp_tripwalkdata {
+	const struct thermal_trip *trip;
+	unsigned char threshold[8];
+	int temperature;
+	int i;
+};
+
+#define ACPM_TMU_SENSOR_GROUP(_mask, _id)		\
+	{					\
+		.mask	= _mask,		\
+		.id	= _id,			\
+	}
+
+static const struct acpm_tmu_sensor_group gs101_sensor_groups[] = {
+	ACPM_TMU_SENSOR_GROUP(GS101_CPUCL2_SENSOR_MASK, 0),
+	ACPM_TMU_SENSOR_GROUP(GS101_CPUCL1_SENSOR_MASK, 1),
+	ACPM_TMU_SENSOR_GROUP(GS101_CPUCL0_SENSOR_MASK, 2),
+};
+
+static const struct reg_field gs101_syscon_tmu_reg_fields[REG_INTPEND_COUNT] = {
+	[P0_INTPEND] = REG_FIELD(GS101_REG_INTPEND(0), 0, 31),
+	[P1_INTPEND] = REG_FIELD(GS101_REG_INTPEND(1), 0, 31),
+	[P2_INTPEND] = REG_FIELD(GS101_REG_INTPEND(2), 0, 31),
+	[P3_INTPEND] = REG_FIELD(GS101_REG_INTPEND(3), 0, 31),
+	[P4_INTPEND] = REG_FIELD(GS101_REG_INTPEND(4), 0, 31),
+	[P5_INTPEND] = REG_FIELD(GS101_REG_INTPEND(5), 0, 31),
+	[P6_INTPEND] = REG_FIELD(GS101_REG_INTPEND(6), 0, 31),
+	[P7_INTPEND] = REG_FIELD(GS101_REG_INTPEND(7), 0, 31),
+	[P8_INTPEND] = REG_FIELD(GS101_REG_INTPEND(8), 0, 31),
+	[P9_INTPEND] = REG_FIELD(GS101_REG_INTPEND(9), 0, 31),
+	[P10_INTPEND] = REG_FIELD(GS101_REG_INTPEND(10), 0, 31),
+	[P11_INTPEND] = REG_FIELD(GS101_REG_INTPEND(11), 0, 31),
+	[P12_INTPEND] = REG_FIELD(GS101_REG_INTPEND(12), 0, 31),
+	[P13_INTPEND] = REG_FIELD(GS101_REG_INTPEND(13), 0, 31),
+	[P14_INTPEND] = REG_FIELD(GS101_REG_INTPEND(14), 0, 31),
+	[P15_INTPEND] = REG_FIELD(GS101_REG_INTPEND(15), 0, 31),
+};
+
+static const struct acpm_tmu_driver_data acpm_tmu_gs101 = {
+	.syscon_reg_fields = gs101_syscon_tmu_reg_fields,
+	.sensor_groups = gs101_sensor_groups,
+	.num_sensor_groups = ARRAY_SIZE(gs101_sensor_groups),
+	.mbox_chan_id = 9,
+};
+
+static int acpm_tmu_op_tz_control(struct acpm_tmu_sensor *sensor, bool on)
+{
+	struct acpm_tmu_priv *priv = sensor->priv;
+	const struct acpm_handle *handle = priv->handle;
+	const struct acpm_tmu_ops *ops = &handle->ops.tmu;
+	int ret;
+
+	ret = ops->tz_control(handle, priv->mbox_chan_id, sensor->group->id,
+			      on);
+	if (ret)
+		return ret;
+
+	sensor->enabled = on;
+
+	return 0;
+}
+
+static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
+{
+	struct device *dev = priv->dev;
+	int i, ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < priv->num_sensors; i++) {
+		struct acpm_tmu_sensor *sensor = &priv->sensors[i];
+
+		/* Skip sensors that weren't found in DT */
+		if (!sensor->tzd)
+			continue;
+
+		scoped_guard(mutex, &sensor->lock) {
+			ret = acpm_tmu_op_tz_control(sensor, on);
+		}
+
+		if (ret)
+			goto out;
+	}
+
+out:
+	pm_runtime_put_autosuspend(dev);
+	return ret;
+}
+
+static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct acpm_tmu_sensor *sensor = thermal_zone_device_priv(tz);
+	struct acpm_tmu_priv *priv = sensor->priv;
+	const struct acpm_handle *handle = priv->handle;
+	const struct acpm_tmu_ops *ops = &handle->ops.tmu;
+	struct device *dev = priv->dev;
+	int acpm_temp, ret;
+
+	if (!sensor->enabled)
+		return -EAGAIN;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
+	scoped_guard(mutex, &sensor->lock) {
+		ret = ops->read_temp(handle, priv->mbox_chan_id,
+				     sensor->group->id, &acpm_temp);
+	}
+
+	pm_runtime_put_autosuspend(dev);
+
+	if (ret)
+		return ret;
+
+	*temp = acpm_temp * MILLIDEGREE_PER_DEGREE;
+
+	return 0;
+}
+
+static int acpm_tmu_trip_temp_walk_cb(struct thermal_trip *trip, void *data)
+{
+	struct acpm_tmu_trip_temp_tripwalkdata * const twd = data;
+	int temperature;
+
+	if (twd->i >= ARRAY_SIZE(twd->threshold))
+		return -ERANGE;
+
+	if (trip->type == THERMAL_TRIP_PASSIVE)
+		goto out;
+
+	temperature = (trip == twd->trip) ? twd->temperature : trip->temperature;
+
+	twd->threshold[twd->i] = temperature / MILLIDEGREE_PER_DEGREE;
+
+out:
+	++twd->i;
+	return 0;
+}
+
+static int acpm_tmu_set_trip_temp(struct thermal_zone_device *tz,
+			const struct thermal_trip *trip, int temperature)
+{
+	struct acpm_tmu_sensor *sensor = thermal_zone_device_priv(tz);
+	struct acpm_tmu_priv *priv = sensor->priv;
+	const struct acpm_handle *handle = priv->handle;
+	const struct acpm_tmu_ops *ops = &handle->ops.tmu;
+	struct device *dev = priv->dev;
+	struct acpm_tmu_trip_temp_tripwalkdata twd = {
+		.trip = trip,
+		.temperature = temperature,
+	};
+	int ret;
+
+	if (trip->type == THERMAL_TRIP_PASSIVE)
+		return 0;
+
+	for_each_thermal_trip(tz, acpm_tmu_trip_temp_walk_cb, &twd);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&sensor->lock);
+
+	if (!sensor->enabled) {
+		ret = ops->set_threshold(handle, priv->mbox_chan_id,
+					 sensor->group->id, twd.threshold,
+					 ARRAY_SIZE(twd.threshold));
+		goto out;
+	}
+
+	ret = acpm_tmu_op_tz_control(sensor, false);
+	if (ret)
+		goto out;
+
+	ret = ops->set_threshold(handle, priv->mbox_chan_id, sensor->group->id,
+				 twd.threshold, ARRAY_SIZE(twd.threshold));
+	if (ret)
+		goto out;
+
+	ret = acpm_tmu_op_tz_control(sensor, true);
+
+out:
+	pm_runtime_put_autosuspend(dev);
+	return ret;
+}
+
+static const struct thermal_zone_device_ops acpm_tmu_sensor_ops = {
+	.get_temp = acpm_tmu_get_temp,
+	.set_trip_temp = acpm_tmu_set_trip_temp,
+};
+
+static int acpm_tmu_has_pending_irq(struct acpm_tmu_sensor *sensor,
+				    bool *pending_irq)
+{
+	struct acpm_tmu_priv *priv = sensor->priv;
+	unsigned long mask = sensor->group->mask;
+	int i, ret;
+	u32 val;
+
+	guard(mutex)(&sensor->lock);
+
+	for_each_set_bit(i, &mask, EXYNOS_TMU_SENSORS_MAX_COUNT) {
+		ret = regmap_field_read(priv->regmap_fields[i], &val);
+		if (ret)
+			return ret;
+
+		if (val) {
+			*pending_irq = true;
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static irqreturn_t acpm_tmu_thread_fn(int irq, void *id)
+{
+	struct acpm_tmu_priv *priv = id;
+	const struct acpm_handle *handle = priv->handle;
+	const struct acpm_tmu_ops *ops = &handle->ops.tmu;
+	struct device *dev = priv->dev;
+	int i, ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, "Failed to resume: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	for (i = 0; i < priv->num_sensors; i++) {
+		struct acpm_tmu_sensor *sensor = &priv->sensors[i];
+		bool pending_irq = false;
+
+		if (!sensor->tzd)
+			continue;
+
+		ret = acpm_tmu_has_pending_irq(sensor, &pending_irq);
+		if (ret || !pending_irq)
+			continue;
+
+		thermal_zone_device_update(sensor->tzd,
+					   THERMAL_EVENT_UNSPECIFIED);
+
+		scoped_guard(mutex, &sensor->lock) {
+			ret = ops->clear_tz_irq(handle, priv->mbox_chan_id,
+						sensor->group->id);
+			if (ret)
+				dev_err(priv->dev, "Sensor %d: failed to clear IRQ (%d)\n",
+					i, ret);
+		}
+	}
+
+	pm_runtime_put_autosuspend(dev);
+
+	return IRQ_HANDLED;
+}
+
+static int acpm_tmu_init_sensor(struct acpm_tmu_sensor *sensor,
+			const struct acpm_tmu_initialize_tripwalkdata *twd)
+{
+	struct acpm_tmu_priv *priv = sensor->priv;
+	const struct acpm_handle *handle = priv->handle;
+	const struct acpm_tmu_ops *ops = &handle->ops.tmu;
+	unsigned int mbox_chan_id = priv->mbox_chan_id;
+	u8 acpm_sensor_id = sensor->group->id;
+	int ret;
+
+	guard(mutex)(&sensor->lock);
+
+	ret = ops->set_threshold(handle, mbox_chan_id, acpm_sensor_id,
+				 twd->threshold,
+				 ARRAY_SIZE(twd->threshold));
+	if (ret)
+		return ret;
+
+	ret = ops->set_hysteresis(handle, mbox_chan_id, acpm_sensor_id,
+				  twd->hysteresis,
+				  ARRAY_SIZE(twd->threshold));
+	if (ret)
+		return ret;
+
+	ret = ops->set_interrupt_enable(handle, mbox_chan_id, acpm_sensor_id,
+					twd->inten);
+	return ret;
+}
+
+static int acpm_tmu_initialize_walk_cb(struct thermal_trip *trip, void *data)
+{
+	struct acpm_tmu_initialize_tripwalkdata * const twd = data;
+	int i;
+
+	if (twd->i >= ARRAY_SIZE(twd->threshold))
+		return -ERANGE;
+
+	if (trip->type == THERMAL_TRIP_PASSIVE)
+		goto out;
+
+	i = twd->i;
+
+	twd->threshold[i] = trip->temperature / MILLIDEGREE_PER_DEGREE;
+	twd->hysteresis[i] = trip->hysteresis / MILLIDEGREE_PER_DEGREE;
+
+	twd->inten |= BIT(i);
+
+out:
+	++twd->i;
+	return 0;
+}
+
+static int acpm_tmu_init_sensors(struct acpm_tmu_priv *priv)
+{
+	int i, ret;
+
+	for (i = 0; i < priv->num_sensors; i++) {
+		struct acpm_tmu_sensor *sensor = &priv->sensors[i];
+		struct acpm_tmu_initialize_tripwalkdata twd = {};
+
+		/* Skip sensors that weren't found in DT */
+		if (!sensor->tzd)
+			continue;
+
+		thermal_zone_for_each_trip(sensor->tzd,
+					   acpm_tmu_initialize_walk_cb, &twd);
+
+		ret = acpm_tmu_init_sensor(sensor, &twd);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id acpm_tmu_match[] = {
+	{ .compatible = "google,gs101-tmu-top", .data = &acpm_tmu_gs101 },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, acpm_tmu_match);
+
+static int acpm_tmu_probe(struct platform_device *pdev)
+{
+	const struct acpm_tmu_driver_data *data;
+	const struct acpm_handle *acpm_handle;
+	struct device *dev = &pdev->dev;
+	struct acpm_tmu_priv *priv;
+	struct regmap *regmap;
+	int i, ret;
+
+	acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
+	if (IS_ERR(acpm_handle))
+		return dev_err_probe(dev, PTR_ERR(acpm_handle),
+				     "Failed to get ACPM handle\n");
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to get match data\n");
+
+	priv = devm_kzalloc(dev,
+			    struct_size(priv, sensors, data->num_sensor_groups),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->handle = acpm_handle;
+	priv->mbox_chan_id = data->mbox_chan_id;
+	priv->num_sensors = data->num_sensor_groups;
+
+	platform_set_drvdata(pdev, priv);
+
+	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Unable to map syscon\n");
+
+	ret = devm_regmap_field_bulk_alloc(dev, regmap, priv->regmap_fields,
+					   data->syscon_reg_fields,
+					   REG_INTPEND_COUNT);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Unable to map syscon registers\n");
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk),
+				     "Failed to get the clock\n");
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return dev_err_probe(dev, priv->irq, "Failed to get irq\n");
+
+	ret = devm_request_threaded_irq(dev, priv->irq, NULL,
+					acpm_tmu_thread_fn, IRQF_ONESHOT,
+					dev_name(dev), priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request irq\n");
+
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to resume device\n");
+
+	ret = acpm_handle->ops.tmu.init(acpm_handle, priv->mbox_chan_id);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "Failed to init TMU\n");
+		goto err_pm_put;
+	}
+
+	for (i = 0; i < priv->num_sensors; i++) {
+		struct acpm_tmu_sensor *sensor = &priv->sensors[i];
+
+		mutex_init(&sensor->lock);
+		sensor->group = &data->sensor_groups[i];
+		sensor->priv = priv;
+
+		sensor->tzd = devm_thermal_of_zone_register(dev, i, sensor,
+							    &acpm_tmu_sensor_ops);
+		if (IS_ERR(sensor->tzd)) {
+			ret = PTR_ERR(sensor->tzd);
+			if (ret == -ENODEV) {
+				sensor->tzd = NULL;
+				dev_dbg(dev, "Sensor %d not used in DT, skipping\n", i);
+				continue;
+			}
+
+			ret = dev_err_probe(dev, ret, "Failed to register sensor %d\n", i);
+			goto err_pm_put;
+		}
+
+		ret = devm_thermal_add_hwmon_sysfs(dev, sensor->tzd);
+		if (ret)
+			dev_warn(dev, "Failed to add hwmon sysfs!\n");
+	}
+
+	ret = acpm_tmu_init_sensors(priv);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "Failed to init sensors\n");
+		goto err_pm_put;
+	}
+
+	ret = acpm_tmu_control(priv, true);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "Failed to enable TMU\n");
+		goto err_pm_put;
+	}
+
+	pm_runtime_put_autosuspend(&pdev->dev);
+
+	return 0;
+
+err_pm_put:
+	pm_runtime_put_sync(dev);
+	return ret;
+}
+
+static void acpm_tmu_remove(struct platform_device *pdev)
+{
+	struct acpm_tmu_priv *priv = platform_get_drvdata(pdev);
+
+	/* Stop IRQ first to prevent race with thread_fn */
+	disable_irq(priv->irq);
+
+	acpm_tmu_control(priv, false);
+}
+
+static int acpm_tmu_suspend(struct device *dev)
+{
+	struct acpm_tmu_priv *priv = dev_get_drvdata(dev);
+	const struct acpm_handle *handle = priv->handle;
+	const struct acpm_tmu_ops *ops = &handle->ops.tmu;
+	int ret;
+
+	ret = acpm_tmu_control(priv, false);
+	if (ret)
+		return ret;
+
+	/* APB clock not required for this specific msg */
+	return ops->suspend(handle, priv->mbox_chan_id);
+}
+
+static int acpm_tmu_resume(struct device *dev)
+{
+	struct acpm_tmu_priv *priv = dev_get_drvdata(dev);
+	const struct acpm_handle *handle = priv->handle;
+	const struct acpm_tmu_ops *ops = &handle->ops.tmu;
+	int ret;
+
+	/* APB clock not required for this specific msg */
+	ret = ops->resume(handle, priv->mbox_chan_id);
+	if (ret)
+		return ret;
+
+	return acpm_tmu_control(priv, true);
+}
+
+static int acpm_tmu_runtime_suspend(struct device *dev)
+{
+	struct acpm_tmu_priv *priv = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(priv->clk);
+
+	return 0;
+}
+
+static int acpm_tmu_runtime_resume(struct device *dev)
+{
+	struct acpm_tmu_priv *priv = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(priv->clk);
+}
+
+static const struct dev_pm_ops acpm_tmu_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(acpm_tmu_suspend, acpm_tmu_resume)
+	RUNTIME_PM_OPS(acpm_tmu_runtime_suspend, acpm_tmu_runtime_resume, NULL)
+};
+
+static struct platform_driver acpm_tmu_driver = {
+	.driver = {
+		.name   = "gs-tmu",
+		.pm     = pm_ptr(&acpm_tmu_pm_ops),
+		.of_match_table = acpm_tmu_match,
+	},
+	.probe = acpm_tmu_probe,
+	.remove = acpm_tmu_remove,
+};
+module_platform_driver(acpm_tmu_driver);
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos ACPM TMU Driver");
+MODULE_LICENSE("GPL");

-- 
2.52.0.457.g6b5491de43-goog


