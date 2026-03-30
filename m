Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EC0F3D61F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRgmbcJ3AXb+74vYgoE0faR1L0KpIWMIXJ5aAz85EHE=; b=GLL/2LFvF6h0l0pwYhLR8GYyU4
	nPBL2wxQCjGXMVWgHe6M+ESJm1i7gm9LtjgNfmyfwjrHS+gaUdHuRzDyuQgFA9BGODcW72vZheLG0
	tkrHLLpgU3Hsl4sbkfC04AwvVoRP40nThK7G1Y4HjvW8HqyddV1j2GkUpWT9kiL5P+IwjGzLN8t3H
	mPpivwbHjEqB8FgyjaF8aUSZLUbJpkHiyLUb3ekDQfiEa8IjNq+ZHrlXmy+qeBmm6cXraapgZpRUL
	awqSwslfU/4a8f4NyOr7/1fCpXAqoeIGg+dRJ6qWjQCncNWGGEEJIKHiTLAajc0q2Z/Y4AQRDWe0U
	vYldpzTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w786a-0000000AsIl-3OcC;
	Mon, 30 Mar 2026 08:36:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w786V-0000000AsFd-0Bmx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:36:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so40830065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 01:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859769; x=1775464569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRgmbcJ3AXb+74vYgoE0faR1L0KpIWMIXJ5aAz85EHE=;
        b=K3OtAfpFXuRWE3OApsNUi/vAok8Yke4GDwDFv/+k2xSagHRw1wv7z2xOWcLSXKNyhs
         g4ZFFziyzXAzI1aCRvCsgcqYQV8cb+Be0wamSTgWiP/BFZX2JjS5tzEEbr4nddIGIUnJ
         2dacC7l4rzqj1gm47rx1gSxLXHgr4Ym2OYyWZDkFr9cj71u8CShGRbM7QFFX26gBJK9D
         cbFiafo2l7oQZKJYa32Tx8nAv9opr7OwXwn1R/KvU6GnzyFZO+fjF3uVHvdAJJTBkhr+
         YF1zntyejW3YO1XjU2CINKeVDbUxazUkLu1W42qc13XLRufZcogzSXVrtQF8Yl058dHx
         B6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859769; x=1775464569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PRgmbcJ3AXb+74vYgoE0faR1L0KpIWMIXJ5aAz85EHE=;
        b=nnrMBr0sxJHDvGE3vxPrr46w5cRNZ4Ngvmpt4maGXTqdV2wDep23Bf5cDOBVMOw68s
         n/1WXssuVQJcZgt4Dg4rm+Cbkk+NLLsict7vcbV/u1qCUq7jBrAA71De7+c58+Y/c9+J
         nRDIUwK66U0VPMOfYAe/F4E4LgOTr5dsF9eIqglZzuKyWwvsHmRi5Y6z+jVAyX75k36K
         dGdMYddQYEdOqrcurQOE5wk30QAtKOsAh+uMVTlxXjbTH6JcP2CtUB28EejGAIFK6naa
         kdA7ygst5uByWpON02Ei5/7sHjbH5yyJsUbqAfg+82jxlbvUml7WFxa93S7krziAEA6Z
         UtDA==
X-Forwarded-Encrypted: i=1; AJvYcCV21NbtMUFrMEXi4GW4v6MiuJC7wAJeTyqTAte5IOQCSaVvFf9fFLJkJjl4TrKqwfFMLbLzmni3tx78hmx1j7eD@lists.infradead.org
X-Gm-Message-State: AOJu0YyQB7lSkSR4qJDxM+ayOTlf/rh0v9MIvviDwTHz/GY9kXaURoFU
	m08kZuvRovzX5NSSmlMT7OPloTIomsPSQuC9+O26fK9CTShDwleaqKts
X-Gm-Gg: ATEYQzxGDZx9SSQwQPzJ4RDOhFvn3S6QxqgFYE2G7/tSQIw/bfnvKqUd6pvbXx3bjPf
	kX+PPojdM2t3eaTofyZLnp9zxV/pR4SVmsTUhYl+FjnBfOfgXPL4kDQj5WDZga0pNJiXCAa/h8P
	tXARvsIb3PJpYcED4Gp1M2qrg9U01JfATEZ12R5QYH0la1fndZ78mq5VTCUvYTk0Cz44YB0JBE8
	Z6gyd7ljh+3cOw2XcX6k4Gdv1j+/gGbdUx/YBl2e7X1lgg/r9w36CCzJlGqUUqeIR6ADgZubBPC
	60OlYWd58B0sn+XA+9djdxrjLEFxIJ9VkpIpDOfnk7E1TwgxN7+PwZmtomHJq0p6Z/o+mSpvH79
	HbEpbN8ABMFoskcjzYTajopbZfKh/ArAOhxdhtQv4IBqHMSqWONXCEdPzgwAICC714aRxwOFkNJ
	REq6JhqiCr8xTS4jlFqZI=
X-Received: by 2002:a05:600c:8b66:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-48739547940mr66003685e9.11.1774859768827;
        Mon, 30 Mar 2026 01:36:08 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:36:08 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 7/9] regulator: Add MediaTek MT6392 regulator
Date: Mon, 30 Mar 2026 09:29:41 +0100
Message-ID: <20260330083429.359819-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013611_247862_F3C34EE4 
X-CRM114-Status: GOOD (  22.98  )
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

From: Fabien Parent <parent.f@gmail.com>

The MT6392 is a regulator found on boards based on the MediaTek
MT8167, MT8516, and probably other SoCs. It is a so called PMIC and
connects as a slave to a SoC using SPI, wrapped inside PWRAP.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Co-developed-by: Val Packett <val@packett.cool>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/Kconfig                  |   9 +
 drivers/regulator/Makefile                 |   1 +
 drivers/regulator/mt6392-regulator.c       | 509 +++++++++++++++++++++
 include/linux/regulator/mt6392-regulator.h |  42 ++
 4 files changed, 561 insertions(+)
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/linux/regulator/mt6392-regulator.h

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d10b6f9243d5..7ae06634a12b 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1000,6 +1000,15 @@ config REGULATOR_MT6380
 	  This driver supports the control of different power rails of device
 	  through regulator interface.
 
+config REGULATOR_MT6392
+	tristate "MediaTek MT6392 PMIC"
+	depends on MFD_MT6397
+	help
+	  Say y here to select this option to enable the power regulator of
+	  MediaTek MT6392 PMIC.
+	  This driver supports the control of different power rails of device
+	  through regulator interface.
+
 config REGULATOR_MT6397
 	tristate "MediaTek MT6397 PMIC"
 	depends on MFD_MT6397
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 35639f3115fd..e5f1fa91b967 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -118,6 +118,7 @@ obj-$(CONFIG_REGULATOR_MT6360) += mt6360-regulator.o
 obj-$(CONFIG_REGULATOR_MT6363) += mt6363-regulator.o
 obj-$(CONFIG_REGULATOR_MT6370) += mt6370-regulator.o
 obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
+obj-$(CONFIG_REGULATOR_MT6392)	+= mt6392-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
 obj-$(CONFIG_REGULATOR_MTK_DVFSRC) += mtk-dvfsrc-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
diff --git a/drivers/regulator/mt6392-regulator.c b/drivers/regulator/mt6392-regulator.c
new file mode 100644
index 000000000000..6e0278bded92
--- /dev/null
+++ b/drivers/regulator/mt6392-regulator.c
@@ -0,0 +1,509 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Copyright (c) 2020 BayLibre, SAS.
+// Author: Chen Zhong <chen.zhong@mediatek.com>
+// Author: Fabien Parent <fparent@baylibre.com>
+//
+// Based on mt6397-regulator.c
+
+#include <linux/module.h>
+#include <linux/linear_range.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/mt6397/core.h>
+#include <linux/mfd/mt6392/registers.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/mt6392-regulator.h>
+#include <linux/regulator/of_regulator.h>
+#include <dt-bindings/regulator/mediatek,mt6392-regulator.h>
+
+/*
+ * MT6392 regulators' information
+ *
+ * @desc: standard fields of regulator description.
+ * @qi: Mask for query enable signal status of regulators
+ * @vselon_reg: Register sections for hardware control mode of bucks
+ * @vselctrl_reg: Register for controlling the buck control mode.
+ * @vselctrl_mask: Mask for query buck's voltage control mode.
+ */
+struct mt6392_regulator_info {
+	struct regulator_desc desc;
+	u32 qi;
+	u32 vselon_reg;
+	u32 vselctrl_reg;
+	u32 vselctrl_mask;
+	u32 modeset_reg;
+	u32 modeset_mask;
+};
+
+#define MT6392_BUCK(match, vreg, supply, min, max, step, volt_ranges,	\
+		enreg, vosel_reg, vosel_mask, voselon_reg, vosel_ctrl,	\
+		_modeset_reg, _modeset_mask, rampdelay)			\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_range_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ((max) - (min)) / (step) + 1,		\
+		.linear_ranges = volt_ranges,				\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),		\
+		.vsel_reg = vosel_reg,					\
+		.vsel_mask = vosel_mask,				\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(0),					\
+		.ramp_delay = rampdelay,				\
+	},								\
+	.qi = BIT(13),							\
+	.vselon_reg = voselon_reg,					\
+	.vselctrl_reg = vosel_ctrl,					\
+	.vselctrl_mask = BIT(1),					\
+	.modeset_reg = _modeset_reg,					\
+	.modeset_mask = _modeset_mask,					\
+}
+
+#define MT6392_LDO(match, vreg, supply, ldo_volt_table, enreg, enbit,	\
+		vosel_reg, vosel_mask, _modeset_reg, _modeset_mask,	\
+		entime)							\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_table_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ARRAY_SIZE(ldo_volt_table),		\
+		.volt_table = ldo_volt_table,				\
+		.vsel_reg = vosel_reg,					\
+		.vsel_mask = vosel_mask,				\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+		.enable_time = entime,					\
+	},								\
+	.qi = BIT(15),							\
+	.modeset_reg = _modeset_reg,					\
+	.modeset_mask = _modeset_mask,					\
+}
+
+#define MT6392_LDO_LINEAR(match, vreg, supply, min, max, step,		\
+		volt_ranges, enreg, enbit, vosel_reg, vosel_mask,	\
+		_modeset_reg, _modeset_mask, entime)			\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_ldo_range_ops,			\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ((max) - (min)) / (step) + 1,		\
+		.linear_ranges = volt_ranges,				\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),		\
+		.vsel_reg = vosel_reg,					\
+		.vsel_mask = vosel_mask,				\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+		.enable_time = entime,					\
+	},								\
+	.qi = BIT(15),							\
+	.modeset_reg = _modeset_reg,					\
+	.modeset_mask = _modeset_mask,					\
+}
+
+#define MT6392_REG_FIXED(match, vreg, supply, enreg, enbit, volt,	\
+		_modeset_reg, _modeset_mask, entime)			\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_fixed_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = 1,					\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+		.enable_time = entime,					\
+		.min_uV = volt,						\
+	},								\
+	.qi = BIT(15),							\
+	.modeset_reg = _modeset_reg,					\
+	.modeset_mask = _modeset_mask,					\
+}
+
+#define MT6392_REG_FIXED_NO_MODE(match, vreg, supply, enreg, enbit,	\
+	volt, entime)							\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_fixed_no_mode_ops,			\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = 1,					\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+		.enable_time = entime,					\
+		.min_uV = volt,						\
+	},								\
+	.qi = BIT(15),							\
+}
+
+static const struct linear_range buck_volt_range1[] = {
+	REGULATOR_LINEAR_RANGE(700000, 0, 0x7f, 6250),
+};
+
+static const struct linear_range buck_volt_range2[] = {
+	REGULATOR_LINEAR_RANGE(1400000, 0, 0x7f, 12500),
+};
+
+static const u32 ldo_volt_table1[] = {
+	1800000, 1900000, 2000000, 2200000,
+};
+
+static const u32 ldo_volt_table1b[] = {
+	1500000, 1800000, 2500000, 2800000,
+};
+
+static const struct linear_range ldo_volt_range2[] = {
+	REGULATOR_LINEAR_RANGE(3300000, 0, 3, 100000),
+};
+
+static const u32 ldo_volt_table3[] = {
+	1800000, 3300000,
+};
+
+static const u32 ldo_volt_table4[] = {
+	3000000, 3300000,
+};
+
+static const u32 ldo_volt_table5[] = {
+	1200000, 1300000, 1500000, 1800000, 2000000, 2800000, 3000000, 3300000,
+};
+
+static const u32 ldo_volt_table6[] = {
+	1240000, 1390000,
+};
+
+static const u32 ldo_volt_table7[] = {
+	1200000, 1300000, 1500000, 1800000,
+};
+
+static const u32 ldo_volt_table8[] = {
+	1800000, 2000000,
+};
+
+static int mt6392_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	int ret, val = 0;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	switch (mode) {
+	case REGULATOR_MODE_FAST:
+		val = MT6392_BUCK_MODE_FORCE_PWM;
+		break;
+	case REGULATOR_MODE_NORMAL:
+		val = MT6392_BUCK_MODE_AUTO;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val <<= ffs(info->modeset_mask) - 1;
+
+	ret = regmap_update_bits(rdev->regmap, info->modeset_reg,
+				 info->modeset_mask, val);
+
+	return ret;
+}
+
+static unsigned int mt6392_buck_get_mode(struct regulator_dev *rdev)
+{
+	unsigned int val;
+	unsigned int mode;
+	int ret;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	ret = regmap_read(rdev->regmap, info->modeset_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= info->modeset_mask;
+	val >>= ffs(info->modeset_mask) - 1;
+
+	if (val & 0x1)
+		mode = REGULATOR_MODE_FAST;
+	else
+		mode = REGULATOR_MODE_NORMAL;
+
+	return mode;
+}
+
+static int mt6392_ldo_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	int ret, val = 0;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	switch (mode) {
+	case REGULATOR_MODE_STANDBY:
+		val = MT6392_LDO_MODE_LP;
+		break;
+	case REGULATOR_MODE_NORMAL:
+		val = MT6392_LDO_MODE_NORMAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val <<= ffs(info->modeset_mask) - 1;
+
+	ret = regmap_update_bits(rdev->regmap, info->modeset_reg,
+				 info->modeset_mask, val);
+
+	return ret;
+}
+
+static unsigned int mt6392_ldo_get_mode(struct regulator_dev *rdev)
+{
+	unsigned int val;
+	unsigned int mode;
+	int ret;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	ret = regmap_read(rdev->regmap, info->modeset_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= info->modeset_mask;
+	val >>= ffs(info->modeset_mask) - 1;
+
+	if (val & 0x1)
+		mode = REGULATOR_MODE_STANDBY;
+	else
+		mode = REGULATOR_MODE_NORMAL;
+
+	return mode;
+}
+
+static const struct regulator_ops mt6392_volt_range_ops = {
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.set_mode = mt6392_buck_set_mode,
+	.get_mode = mt6392_buck_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_table_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_iterate,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.set_mode = mt6392_ldo_set_mode,
+	.get_mode = mt6392_ldo_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_ldo_range_ops = {
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.set_mode = mt6392_ldo_set_mode,
+	.get_mode = mt6392_ldo_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_fixed_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.set_mode = mt6392_ldo_set_mode,
+	.get_mode = mt6392_ldo_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_fixed_no_mode_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+/* The array is indexed by id(MT6392_ID_XXX) */
+static struct mt6392_regulator_info mt6392_regulators[] = {
+	MT6392_BUCK("vproc", VPROC, "vproc", 700000, 1493750, 6250,
+		    buck_volt_range1, MT6392_VPROC_CON7, MT6392_VPROC_CON9, 0x7f,
+		    MT6392_VPROC_CON10, MT6392_VPROC_CON5, MT6392_VPROC_CON2, 0x100,
+		    12500),
+	MT6392_BUCK("vsys", VSYS, "vsys", 1400000, 2987500, 12500,
+		    buck_volt_range2, MT6392_VSYS_CON7, MT6392_VSYS_CON9, 0x7f,
+		    MT6392_VSYS_CON10, MT6392_VSYS_CON5, MT6392_VSYS_CON2, 0x100,
+		    25000),
+	MT6392_BUCK("vcore", VCORE, "vcore", 700000, 1493750, 6250,
+		    buck_volt_range1, MT6392_VCORE_CON7, MT6392_VCORE_CON9, 0x7f,
+		    MT6392_VCORE_CON10, MT6392_VCORE_CON5, MT6392_VCORE_CON2, 0x100,
+		    12500),
+	MT6392_REG_FIXED("vxo22", VXO22, "ldo1", MT6392_ANALDO_CON1, 10, 2200000,
+			 MT6392_ANALDO_CON1, 0x2, 110),
+	MT6392_LDO("vaud22", VAUD22, "ldo1", ldo_volt_table1,
+		   MT6392_ANALDO_CON2, 14, MT6392_ANALDO_CON8, 0x60,
+		   MT6392_ANALDO_CON2, 0x2, 264),
+	MT6392_REG_FIXED_NO_MODE("vcama", VCAMA, "ldo1", MT6392_ANALDO_CON4, 15,
+				 2800000, 264),
+	MT6392_REG_FIXED("vaud28", VAUD28, "ldo1", MT6392_ANALDO_CON23, 14, 2800000,
+			 MT6392_ANALDO_CON23, 0x2, 264),
+	MT6392_REG_FIXED("vadc18", VADC18, "ldo1", MT6392_ANALDO_CON25, 14, 1800000,
+			 MT6392_ANALDO_CON25, 0x2, 264),
+	MT6392_LDO_LINEAR("vcn35", VCN35, "ldo2", 3300000, 3600000, 100000,
+			  ldo_volt_range2, MT6392_ANALDO_CON21, 12,
+			  MT6392_ANALDO_CON16, 0xC, MT6392_ANALDO_CON21, 0x2, 264),
+	MT6392_REG_FIXED("vio28", VIO28, "ldo2", MT6392_DIGLDO_CON0, 14, 2800000,
+			 MT6392_DIGLDO_CON0, 0x2, 264),
+	MT6392_REG_FIXED("vusb", VUSB, "ldo3", MT6392_DIGLDO_CON2, 14, 3300000,
+			 MT6392_DIGLDO_CON2, 0x2, 264),
+	MT6392_LDO("vmc", VMC, "ldo2", ldo_volt_table3,
+		   MT6392_DIGLDO_CON3, 12, MT6392_DIGLDO_CON24, 0x10,
+		   MT6392_DIGLDO_CON3, 0x2, 264),
+	MT6392_LDO("vmch", VMCH, "ldo2", ldo_volt_table4,
+		   MT6392_DIGLDO_CON5, 14, MT6392_DIGLDO_CON26, 0x80,
+		   MT6392_DIGLDO_CON5, 0x2, 264),
+	MT6392_LDO("vemc3v3", VEMC3V3, "ldo3", ldo_volt_table4,
+		   MT6392_DIGLDO_CON6, 14, MT6392_DIGLDO_CON27, 0x80,
+		   MT6392_DIGLDO_CON6, 0x2, 264),
+	MT6392_LDO("vgp1", VGP1, "ldo3", ldo_volt_table5,
+		   MT6392_DIGLDO_CON7, 15, MT6392_DIGLDO_CON28, 0xE0,
+		   MT6392_DIGLDO_CON7, 0x2, 264),
+	MT6392_LDO("vgp2", VGP2, "ldo3", ldo_volt_table5,
+		   MT6392_DIGLDO_CON8, 15, MT6392_DIGLDO_CON29, 0xE0,
+		   MT6392_DIGLDO_CON8, 0x2, 264),
+	MT6392_REG_FIXED("vcn18", VCN18, "avddldo", MT6392_DIGLDO_CON11, 14, 1800000,
+			 MT6392_DIGLDO_CON11, 0x2, 264),
+	MT6392_LDO("vcamaf", VCAMAF, "ldo3", ldo_volt_table5,
+		   MT6392_DIGLDO_CON31, 15, MT6392_DIGLDO_CON32, 0xE0,
+		   MT6392_DIGLDO_CON31, 0x2, 264),
+	MT6392_LDO("vm", VM, "avddldo", ldo_volt_table6,
+		   MT6392_DIGLDO_CON47, 14, MT6392_DIGLDO_CON48, 0x30,
+		   MT6392_DIGLDO_CON47, 0x2, 264),
+	MT6392_REG_FIXED("vio18", VIO18, "avddldo", MT6392_DIGLDO_CON49, 14, 1800000,
+			 MT6392_DIGLDO_CON49, 0x2, 264),
+	MT6392_LDO("vcamd", VCAMD, "avddldo", ldo_volt_table7,
+		   MT6392_DIGLDO_CON51, 14, MT6392_DIGLDO_CON52, 0x60,
+		   MT6392_DIGLDO_CON51, 0x2, 264),
+	MT6392_REG_FIXED("vcamio", VCAMIO, "avddldo", MT6392_DIGLDO_CON53, 14, 1800000,
+			 MT6392_DIGLDO_CON53, 0x2, 264),
+	MT6392_REG_FIXED("vm25", VM25, "ldo3", MT6392_DIGLDO_CON55, 14, 2500000,
+			 MT6392_DIGLDO_CON55, 0x2, 264),
+	MT6392_LDO("vefuse", VEFUSE, "ldo2", ldo_volt_table8,
+		   MT6392_DIGLDO_CON57, 14, MT6392_DIGLDO_CON58, 0x10,
+		   MT6392_DIGLDO_CON57, 0x2, 264),
+	MT6392_REG_FIXED_NO_MODE("vdig18", VDIG18, "ldo2", MT6392_DIGLDO_CON12, 15,
+				 1800000, 264),
+	MT6392_REG_FIXED_NO_MODE("vrtc", VRTC, "ldo1", MT6392_DIGLDO_CON15, 15,
+				 2800000, 264)
+};
+
+static int mt6392_set_buck_vosel_reg(struct platform_device *pdev)
+{
+	struct mt6397_chip *mt6392 = dev_get_drvdata(pdev->dev.parent);
+	int i;
+	u32 regval;
+
+	for (i = 0; i < MT6392_MAX_REGULATOR; i++) {
+		if (mt6392_regulators[i].vselctrl_reg) {
+			if (regmap_read(mt6392->regmap,
+					mt6392_regulators[i].vselctrl_reg,
+					&regval) < 0) {
+				dev_err(&pdev->dev,
+					"Failed to read buck ctrl\n");
+				return -EIO;
+			}
+
+			if (regval & mt6392_regulators[i].vselctrl_mask) {
+				mt6392_regulators[i].desc.vsel_reg =
+				mt6392_regulators[i].vselon_reg;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int mt6392_regulator_probe(struct platform_device *pdev)
+{
+	struct mt6397_chip *mt6392 = dev_get_drvdata(pdev->dev.parent);
+	struct regulator_config config = {};
+	struct regulator_dev *rdev;
+	int i;
+
+	pdev->dev.of_node = pdev->dev.parent->of_node;
+
+	/* Query buck controller to select activated voltage register part */
+	if (mt6392_set_buck_vosel_reg(pdev))
+		return -EIO;
+
+	config.dev = mt6392->dev;
+	config.regmap = mt6392->regmap;
+	for (i = 0; i < MT6392_MAX_REGULATOR; i++) {
+		config.driver_data = &mt6392_regulators[i];
+
+		rdev = devm_regulator_register(&pdev->dev,
+					       &mt6392_regulators[i].desc,
+					       &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev, "failed to register %s\n",
+				mt6392_regulators[i].desc.name);
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id mt6392_platform_ids[] = {
+	{"mt6392-regulator", 0},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, mt6392_platform_ids);
+
+static struct platform_driver mt6392_regulator_driver = {
+	.driver = {
+		.name = "mt6392-regulator",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = mt6392_regulator_probe,
+	.id_table = mt6392_platform_ids,
+};
+
+module_platform_driver(mt6392_regulator_driver);
+
+MODULE_AUTHOR("Chen Zhong <chen.zhong@mediatek.com>");
+MODULE_DESCRIPTION("Regulator Driver for MediaTek MT6392 PMIC");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/regulator/mt6392-regulator.h b/include/linux/regulator/mt6392-regulator.h
new file mode 100644
index 000000000000..0eccd085b062
--- /dev/null
+++ b/include/linux/regulator/mt6392-regulator.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: Chen Zhong <chen.zhong@mediatek.com>
+ */
+
+#ifndef __LINUX_REGULATOR_MT6392_H
+#define __LINUX_REGULATOR_MT6392_H
+
+enum {
+	MT6392_ID_VPROC = 0,
+	MT6392_ID_VSYS,
+	MT6392_ID_VCORE,
+	MT6392_ID_VXO22,
+	MT6392_ID_VAUD22,
+	MT6392_ID_VCAMA,
+	MT6392_ID_VAUD28,
+	MT6392_ID_VADC18,
+	MT6392_ID_VCN35,
+	MT6392_ID_VIO28,
+	MT6392_ID_VUSB = 10,
+	MT6392_ID_VMC,
+	MT6392_ID_VMCH,
+	MT6392_ID_VEMC3V3,
+	MT6392_ID_VGP1,
+	MT6392_ID_VGP2,
+	MT6392_ID_VCN18,
+	MT6392_ID_VCAMAF,
+	MT6392_ID_VM,
+	MT6392_ID_VIO18,
+	MT6392_ID_VCAMD,
+	MT6392_ID_VCAMIO,
+	MT6392_ID_VM25,
+	MT6392_ID_VEFUSE,
+	MT6392_ID_VDIG18,
+	MT6392_ID_VRTC,
+	MT6392_ID_RG_MAX,
+};
+
+#define MT6392_MAX_REGULATOR	MT6392_ID_RG_MAX
+
+#endif /* __LINUX_REGULATOR_MT6392_H */
-- 
2.43.0


