Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33751C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 21:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaYFxN/ihbyHEozZR8rg46OlgPGpXgAil1GgQ0yQw30=; b=H19C9uLBPVFDCoOSEDMPDTz7So
	mGKEudkD824qP7umBRPol+e/vG2YSchtW2XwkWusA2kGQHxSao/Yz/9VFhkX2ZVsc0PiI3zY4IWb+
	rnfDNcCmkm7Hb+j0sbqgdVvUmsvrVGiT2B77tLnnfHcIIVGGdKC3XphpVVvfcVGp5wbabQXTdTNam
	pj58CRfW2SzQCPDeGTjgVp/bBnv9zza1O4jF83LTLLHOceWbWKPdr2Gt3FmgbPs1/35d/nOIwxhKQ
	wNDzqVbZb8ilSdeyxj77/dt3ERMBQEsDwHlUt7m+Ms0LsMrpKEiulrpxCu3Pw43a/JRqfqekORgqy
	pL8UopNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCuc-00000002JXR-1J4G;
	Mon, 03 Mar 2025 21:01:18 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCoR-00000002HuG-3POg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 20:54:56 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aaec61d0f65so996452566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 12:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741035294; x=1741640094; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaYFxN/ihbyHEozZR8rg46OlgPGpXgAil1GgQ0yQw30=;
        b=S4I6XFO1DlyeceJYw5uzMmhdw52y21C61P72LvxF3EiThFrVTB6J10wpRhLby5xthw
         wyMyclWksKHIiZJKF5YSCR61QAJ09AGn5gNf4TSVqpsvTnvGKDdDsHj7vf0gb18IeqLp
         0N1d4SFMD6K2nQnkECefzV5FgWbPbC4wYRxIPuZ3+hGmSlsO/CGtoo14Gz9vUYAA2YZg
         eGgL+Ju+ktcQdYbc9QgIUsSWCRZYixk6lwUcU6keP+Y8XUpWUKHXUVYUrxy7BjOyv01s
         7DMLsJ9lLXxMt0b6tST/taBPAC9WR/JYiMVIbGTLZM2TFgrXTOjiTWy5nLYlzJ8Ijt9q
         IOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035294; x=1741640094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaYFxN/ihbyHEozZR8rg46OlgPGpXgAil1GgQ0yQw30=;
        b=NQqVMlzu3EFDkxX3L3dUv36Hmw785nHUk128QY/2qVnPDLjYnU2C5GIW9YKusN7Nnt
         0TvfjgEvVow1a/R0nUfrn9lfhMikEsUQE26Ghf75s4X3QhQoN0DmF2euS7f9hkLWDI22
         EUyNoH8//Gby2UkBwQ2lLSnROagePq6vYBBoBuzli9nHXYm9smzeHEK9gsbEJ4agUKdi
         AXdNtUCO0NDP5lwzL012WCMRuLwYlk0v6bXZClxbQUsEfzNkwWnr6t9zjLleBJ4NXJFM
         DOoHL+PaoDfWPPBBOG7bqadG81SdO/0E7ebDgNPiRV0evE4dJgHXWTAnv9OYOMWxGhKd
         ikYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnep/GLceVWyI+1A1ms/e7SyO62OpqJ77Vqx+Z/ewP2gqGJbyJ26t3SSnXvnCDfTki9ljqcxoughuJQS9pDuYi@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0WPyCBMVHLz04WrkAOcQwmr7QL3EIhzaBeynRRFG6nngOD/iF
	8Q/UdqJ7i+NayQwsqijv28SuP+xhWw7Z3G0GWQYWW4LidoOWCf/wdv9lSA==
X-Gm-Gg: ASbGncsvl+Q0WVPT9t/NGCwqKleM5QQzLmaAMAtiTo8LMGoYiwVRW7jEfSq+2YL2yNT
	TFt0TdDDh1xFsnntXqTzWLULG7HM/t34Cj3SH2y0eGvKdgJq4gZv2K9Tk0SIh22ohtvmYpNK+OY
	qJiMZ9ymrRVrKlJYfM+bUgY8eR/731XxIeT2B+BOy6h6QfnifGEin1kt9MMTU030R+KlzoZm/KZ
	wZ3rWvdV17JvTkWwjbggmuyH+r3sxLNWONgSAPfEcLMzJOHKpXtsM/SuVI6AbbphqmLTjHhVmhs
	sG0tnce5vZ9nwZrY/cd4LpKWQ4Y4fsvC2z103rW5LbDH/DqoHUvGDlMiD8UMfqFf0+J9ErvZJ+D
	zj+cq11ouJ61Qq40=
X-Google-Smtp-Source: AGHT+IH64gS0ZDjXt8GPsgr6bpd2RQzzCfhLZJtwkTBbFu3DAOZQTE2TKFa+FvPIHCOCApQHKaRMxA==
X-Received: by 2002:a17:907:86a1:b0:ac1:def4:ce20 with SMTP id a640c23a62f3a-ac1def4d088mr387883466b.18.1741035293951;
        Mon, 03 Mar 2025 12:54:53 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf76063ab8sm266955566b.73.2025.03.03.12.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:54:53 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 03 Mar 2025 21:54:48 +0100
Subject: [PATCH v3 3/6] pinctrl: bcm281xx: Provide pinctrl device info as
 OF platform data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-bcm21664-pinctrl-v3-3-5f8b80e4ab51@gmail.com>
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
In-Reply-To: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741035289; l=11471;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=hBqTyx3cRXjMO8YcrUQl3T9HLfXnpEZnzEJ9oJSb1Dc=;
 b=jOaiXLIDUNXeZr/+d2T1x01Lk3CRbh8KvL29bv2KVPDVyogU5RpsGUSd5JC5uvxTaKijI10B1
 7KlrD5CdqMWCNgVUo0yq2DfCYRrc5AUxyV7r445vKLMVXUOjlkREHQK
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_125455_861287_B205B309 
X-CRM114-Status: GOOD (  24.78  )
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

Introduce a new struct type, "bcm281xx_pinctrl_info", that holds
information about the pins, pin functions and regmap config for a pin
control chip. Create such a struct for the BCM218xx and pass it as
device data for the OF compatible match.

This is done in preparation for introducing additional chip types
to the driver.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Make regmap_config pointer member of bcm281xx_pinctrl_info a pointer
  (fixes "initializer element is not a compile-time constant" error)
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 119 +++++++++++++++++++++------------
 1 file changed, 78 insertions(+), 41 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index a039b490cdb8e6c41169bfd48abb371447c150a0..f5aeb8a56e6ffa1204423ddc22204a4f0f4e8f84 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -76,20 +76,40 @@ struct bcm281xx_pin_function {
 };
 
 /*
- * bcm281xx_pinctrl_data - Broadcom-specific pinctrl data
- * @reg_base - base of pinctrl registers
+ * Device types (used in bcm281xx_pinctrl_desc to differentiate
+ * the two device types from each other)
  */
-struct bcm281xx_pinctrl_data {
-	void __iomem *reg_base;
+enum bcm281xx_pinctrl_type {
+	BCM281XX_PINCTRL_TYPE,
+};
+
+/*
+ * bcm281xx_pinctrl_info - description of a pinctrl device supported
+ * by this driver, intended to be used as a provider of OF match data.
+ */
+struct bcm281xx_pinctrl_info {
+	enum bcm281xx_pinctrl_type device_type;
 
 	/* List of all pins */
 	const struct pinctrl_pin_desc *pins;
-	const unsigned int npins;
+	unsigned int npins;
 
 	const struct bcm281xx_pin_function *functions;
-	const unsigned int nfunctions;
+	unsigned int nfunctions;
+
+	const struct regmap_config *regmap_config;
+};
+
+/*
+ * bcm281xx_pinctrl_data - Broadcom-specific pinctrl data
+ * @reg_base - base of pinctrl registers
+ */
+struct bcm281xx_pinctrl_data {
+	struct device *dev;
+	void __iomem *reg_base;
 
 	struct regmap *regmap;
+	const struct bcm281xx_pinctrl_info *info;
 };
 
 /*
@@ -933,11 +953,22 @@ static const struct bcm281xx_pin_function bcm281xx_functions[] = {
 	BCM281XX_PIN_FUNCTION(alt4),
 };
 
-static struct bcm281xx_pinctrl_data bcm281xx_pinctrl = {
+static const struct regmap_config bcm281xx_pinctrl_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = BCM281XX_PIN_VC_CAM3_SDA * 4,
+};
+
+static const struct bcm281xx_pinctrl_info bcm281xx_pinctrl = {
+	.device_type = BCM281XX_PINCTRL_TYPE,
+
 	.pins = bcm281xx_pinctrl_pins,
 	.npins = ARRAY_SIZE(bcm281xx_pinctrl_pins),
 	.functions = bcm281xx_functions,
 	.nfunctions = ARRAY_SIZE(bcm281xx_functions),
+
+	.regmap_config = &bcm281xx_pinctrl_regmap_config,
 };
 
 static inline enum bcm281xx_pin_type pin_type_get(struct pinctrl_dev *pctldev,
@@ -945,10 +976,10 @@ static inline enum bcm281xx_pin_type pin_type_get(struct pinctrl_dev *pctldev,
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	if (pin >= pdata->npins)
+	if (pin >= pdata->info->npins)
 		return BCM281XX_PIN_TYPE_UNKNOWN;
 
-	return *(enum bcm281xx_pin_type *)(pdata->pins[pin].drv_data);
+	return *(enum bcm281xx_pin_type *)(pdata->info->pins[pin].drv_data);
 }
 
 #define BCM281XX_PIN_SHIFT(type, param) \
@@ -970,18 +1001,11 @@ static inline void bcm281xx_pin_update(u32 *reg_val, u32 *reg_mask,
 	*reg_mask |= param_mask;
 }
 
-static const struct regmap_config bcm281xx_pinctrl_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = BCM281XX_PIN_VC_CAM3_SDA * 4,
-};
-
 static int bcm281xx_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	return pdata->npins;
+	return pdata->info->npins;
 }
 
 static const char *bcm281xx_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
@@ -989,7 +1013,7 @@ static const char *bcm281xx_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	return pdata->pins[group].name;
+	return pdata->info->pins[group].name;
 }
 
 static int bcm281xx_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
@@ -999,7 +1023,7 @@ static int bcm281xx_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	*pins = &pdata->pins[group].number;
+	*pins = &pdata->info->pins[group].number;
 	*num_pins = 1;
 
 	return 0;
@@ -1025,7 +1049,7 @@ static int bcm281xx_pinctrl_get_fcns_count(struct pinctrl_dev *pctldev)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	return pdata->nfunctions;
+	return pdata->info->nfunctions;
 }
 
 static const char *bcm281xx_pinctrl_get_fcn_name(struct pinctrl_dev *pctldev,
@@ -1033,7 +1057,7 @@ static const char *bcm281xx_pinctrl_get_fcn_name(struct pinctrl_dev *pctldev,
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	return pdata->functions[function].name;
+	return pdata->info->functions[function].name;
 }
 
 static int bcm281xx_pinctrl_get_fcn_groups(struct pinctrl_dev *pctldev,
@@ -1043,8 +1067,8 @@ static int bcm281xx_pinctrl_get_fcn_groups(struct pinctrl_dev *pctldev,
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	*groups = pdata->functions[function].groups;
-	*num_groups = pdata->functions[function].ngroups;
+	*groups = pdata->info->functions[function].groups;
+	*num_groups = pdata->info->functions[function].ngroups;
 
 	return 0;
 }
@@ -1054,14 +1078,15 @@ static int bcm281xx_pinmux_set(struct pinctrl_dev *pctldev,
 			       unsigned int group)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
-	const struct bcm281xx_pin_function *f = &pdata->functions[function];
-	u32 offset = 4 * pdata->pins[group].number;
+	const struct bcm281xx_pin_function *f = &pdata->info->functions[function];
+	unsigned int pin = pdata->info->pins[group].number;
+	u32 offset = 4 * pin;
 	int rc = 0;
 
 	dev_dbg(pctldev->dev,
 		"%s(): Enable function %s (%d) of pin %s (%d) @offset 0x%x.\n",
-		__func__, f->name, function, pdata->pins[group].name,
-		pdata->pins[group].number, offset);
+		__func__, f->name, function, pdata->info->pins[group].name,
+		pin, offset);
 
 	rc = regmap_update_bits(pdata->regmap, offset,
 		BCM281XX_PIN_REG_F_SEL_MASK,
@@ -1069,7 +1094,7 @@ static int bcm281xx_pinmux_set(struct pinctrl_dev *pctldev,
 	if (rc)
 		dev_err(pctldev->dev,
 			"Error updating register for pin %s (%d).\n",
-			pdata->pins[group].name, pdata->pins[group].number);
+			pdata->info->pins[group].name, pin);
 
 	return rc;
 }
@@ -1168,7 +1193,7 @@ static int bcm281xx_std_pin_update(struct pinctrl_dev *pctldev,
 					"Invalid Drive Strength value (%d) for "
 					"pin %s (%d). Valid values are "
 					"(2..16) mA, even numbers only.\n",
-					arg, pdata->pins[pin].name, pin);
+					arg, pdata->info->pins[pin].name, pin);
 				return -EINVAL;
 			}
 			bcm281xx_pin_update(val, mask, (arg/2)-1,
@@ -1179,7 +1204,7 @@ static int bcm281xx_std_pin_update(struct pinctrl_dev *pctldev,
 		default:
 			dev_err(pctldev->dev,
 				"Unrecognized pin config %d for pin %s (%d).\n",
-				param, pdata->pins[pin].name, pin);
+				param, pdata->info->pins[pin].name, pin);
 			return -EINVAL;
 
 		} /* switch config */
@@ -1233,7 +1258,7 @@ static int bcm281xx_i2c_pin_update(struct pinctrl_dev *pctldev,
 					"Invalid pull-up value (%d) for pin %s "
 					"(%d). Valid values are 568, 720, 831, "
 					"1080, 1200, 1800, 2700 Ohms.\n",
-					arg, pdata->pins[pin].name, pin);
+					arg, pdata->info->pins[pin].name, pin);
 				return -EINVAL;
 			}
 
@@ -1266,7 +1291,7 @@ static int bcm281xx_i2c_pin_update(struct pinctrl_dev *pctldev,
 		default:
 			dev_err(pctldev->dev,
 				"Unrecognized pin config %d for pin %s (%d).\n",
-				param, pdata->pins[pin].name, pin);
+				param, pdata->info->pins[pin].name, pin);
 			return -EINVAL;
 
 		} /* switch config */
@@ -1311,7 +1336,7 @@ static int bcm281xx_hdmi_pin_update(struct pinctrl_dev *pctldev,
 		default:
 			dev_err(pctldev->dev,
 				"Unrecognized pin config %d for pin %s (%d).\n",
-				param, pdata->pins[pin].name, pin);
+				param, pdata->info->pins[pin].name, pin);
 			return -EINVAL;
 
 		} /* switch config */
@@ -1354,7 +1379,7 @@ static int bcm281xx_pinctrl_pin_config_set(struct pinctrl_dev *pctldev,
 
 	default:
 		dev_err(pctldev->dev, "Unknown pin type for pin %s (%d).\n",
-			pdata->pins[pin].name, pin);
+			pdata->info->pins[pin].name, pin);
 		return -EINVAL;
 
 	} /* switch pin type */
@@ -1364,13 +1389,13 @@ static int bcm281xx_pinctrl_pin_config_set(struct pinctrl_dev *pctldev,
 
 	dev_dbg(pctldev->dev,
 		"%s(): Set pin %s (%d) with config 0x%x, mask 0x%x\n",
-		__func__, pdata->pins[pin].name, pin, cfg_val, cfg_mask);
+		__func__, pdata->info->pins[pin].name, pin, cfg_val, cfg_mask);
 
 	rc = regmap_update_bits(pdata->regmap, offset, cfg_mask, cfg_val);
 	if (rc) {
 		dev_err(pctldev->dev,
 			"Error updating register for pin %s (%d).\n",
-			pdata->pins[pin].name, pin);
+			pdata->info->pins[pin].name, pin);
 		return rc;
 	}
 
@@ -1390,11 +1415,23 @@ static struct pinctrl_desc bcm281xx_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+static struct bcm281xx_pinctrl_data bcm281xx_pinctrl_pdata;
+
 static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 {
-	struct bcm281xx_pinctrl_data *pdata = &bcm281xx_pinctrl;
+	struct bcm281xx_pinctrl_data *pdata = &bcm281xx_pinctrl_pdata;
 	struct pinctrl_dev *pctl;
 
+	/* Set device pointer in platform data */
+	pdata->dev = &pdev->dev;
+
+	/* Get the data to use from OF match */
+	pdata->info = of_device_get_match_data(&pdev->dev);
+	if (!pdata->info) {
+		dev_err(&pdev->dev, "Failed to get data from OF match\n");
+		return -ENODEV;
+	}
+
 	/* So far We can assume there is only 1 bank of registers */
 	pdata->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pdata->reg_base)) {
@@ -1404,15 +1441,15 @@ static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 
 	/* Initialize the dynamic part of pinctrl_desc */
 	pdata->regmap = devm_regmap_init_mmio(&pdev->dev, pdata->reg_base,
-		&bcm281xx_pinctrl_regmap_config);
+		pdata->info->regmap_config);
 	if (IS_ERR(pdata->regmap)) {
 		dev_err(&pdev->dev, "Regmap MMIO init failed.\n");
 		return -ENODEV;
 	}
 
 	bcm281xx_pinctrl_desc.name = dev_name(&pdev->dev);
-	bcm281xx_pinctrl_desc.pins = bcm281xx_pinctrl.pins;
-	bcm281xx_pinctrl_desc.npins = bcm281xx_pinctrl.npins;
+	bcm281xx_pinctrl_desc.pins = pdata->info->pins;
+	bcm281xx_pinctrl_desc.npins = pdata->info->npins;
 
 	pctl = devm_pinctrl_register(&pdev->dev, &bcm281xx_pinctrl_desc, pdata);
 	if (IS_ERR(pctl)) {
@@ -1426,7 +1463,7 @@ static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id bcm281xx_pinctrl_of_match[] = {
-	{ .compatible = "brcm,bcm11351-pinctrl", },
+	{ .compatible = "brcm,bcm11351-pinctrl", .data = &bcm281xx_pinctrl },
 	{ },
 };
 

-- 
2.48.1


