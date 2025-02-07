Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9138EC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEdfUL/dtyBE4/ToThY0x09/WqOGrLcHS1tRCNwmfPU=; b=GuTAFZ+X/AP3/1MNvqTHPwphmA
	bdC/2TbDFAmkWYz8S4braoGvtv/gt4cI0JtnLTf2N4a26z0olo9yk1LRLQZNQ6oSuZToeCKS1hwD0
	9Hd7Y12mLSfiiRAtipd3r3e05hDTvNR7FGHb5etQAPOAGDI5b6AXXLYr6fAUGM3zUgtLFsXG4cKO5
	f7pJLhadUWhCDcnsZOxxSIRitel8J/Ebu+DUDlneJ5hCXnVVTB6zYa8RHjCNo1cVWH6fs1vW7UFFr
	Pwe8kLRByDLGVbvO6feBnAcXRYW9bR5/C/dgJvwuE+JlXNVtY12w5ikXNbr0BmGqL8UPQfIM1P69M
	rEr4s0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUzJ-0000000B4sv-2Apf;
	Fri, 07 Feb 2025 20:30:09 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUYw-0000000B0Nw-1qAf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 20:02:55 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5de4a8b4f86so1597669a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 12:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958573; x=1739563373; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEdfUL/dtyBE4/ToThY0x09/WqOGrLcHS1tRCNwmfPU=;
        b=UWgajCB5ZPQRMbSWX3xYpNzO7jQ1I3qpeA0DqDL0PGumu1wJDvc2g9WZcRjzmq/Me0
         KKPUMIqXSbZDuGMnZkQHFaaWuYdy1xt3wpf5IRFRRnMk9HXxJHeLId/F9TkJsTibMEiR
         1EAOok00DKP3dzN+IsfnCSz4LHAHhYFl35I4QGR4znd7aP48V8+DLzYzNK7gaGP5bLG0
         U3ReAXWbm7TyXTZIkxn5yzNr/8/jjxpviNvT6Msl0JtHUfGtRF8+dgdv36mhr5fSI3IW
         7BSLtlfq8gb/7CFF5ZS4ESlWHjwV8eisAq4pqQ6FzM4l2ONNdfkhGgSfUSn7w2AuEY7G
         onOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958573; x=1739563373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEdfUL/dtyBE4/ToThY0x09/WqOGrLcHS1tRCNwmfPU=;
        b=e9+IQqwoy+d8W/Q9cdY7FZGlwNNOrvAVTcBsgQwZM3Mpq7LRBfaHyb+wufZ8t9aa0y
         dlF0oxBvp7FBzhFmGxAwyAUfnQMgrHRCxY3TBDkGQLd5dO8J9PgDS6sesCCQiScmKu+T
         QlWr2405owmXr92cVBZkShJTQ6pHG3M81ZaTZXvpybHyBI45seDb+DC+a77kcGJL9n+K
         4+3nP/Zi773/Py+gKONGLCARshW2Lm3k0npusYvMknX7SfdBLxXMITQoglRNq1dBaTMd
         U6t8fJCHxQz+H8hQ7vtqFW5BYc/ruD6MHwtO8v6pKXsTFkKS3My75lpwwQt9il7sNfBy
         2zEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+qx3kesPG7bxOQE73MFoj9ipxZStiAoo4yhEu5RVn2dhBgeC3AxXmb6rHCN80iOytRzn5gYZLR3OWREtnEBqy@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx3FsU4tFZArhdY4lCc+LT1DRNKchAb86Fwg6K3t76SZj7tsbb
	y2hWvfokfWSH+i68/KNLcgcZ6ZCVucZeCZq9R4Fv53lOmX/Navtv
X-Gm-Gg: ASbGnctlGuKpcbHSw/uDCwiDc/RVqFyHhQzWPMQLRfN2Kqj3624007JQIKeBIyXfb80
	B8xdhVuXVVXhv6+WvXYYUqSNht5DqoJ0Be4WJLwTSMm0nOPey7pkqvXBuSOgaZXpdX965gHUuPL
	oAy4ETFW9NKgZWrkpWh2asEeJIsdBNAY14GgqALWLQLTJvhHXh3l9dWpSciWCz7MWJW28r4eewC
	FtgPOHRdq4KG2ouxrlgVI92HX8aO1ZUzLb6e+LseNue+RDdFDiUHzRZD1r/TumCHTRjvMgDPy1D
	7wHUJXOo19gZMh66k0etSrqEO4AFH59qjM6sfHNu8v30+rvTHBC3GeVl
X-Google-Smtp-Source: AGHT+IHkC2/+zqxLRQm9/utrpOL7OFLt0E8cEQ4FZKBkkMInJ+ntNyAg6UB5AlClGxCNo0XONPZZQw==
X-Received: by 2002:a05:6402:4608:b0:5dc:7538:3b6 with SMTP id 4fb4d7f45d1cf-5de44feb687mr5000337a12.1.1738958572571;
        Fri, 07 Feb 2025 12:02:52 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm256797a12.45.2025.02.07.12.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:02:51 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 07 Feb 2025 21:02:43 +0100
Subject: [PATCH 4/7] pinctrl: bcm281xx: Provide pinctrl device info as OF
 platform data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bcm21664-pinctrl-v1-4-e7cfac9b2d3b@gmail.com>
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
In-Reply-To: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Christian Daudt <bcm@fixthebug.org>, Sherman Yin <syin@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738958562; l=11284;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=GGMCKhB2E/bSDYDsbph07MEWr3++KivFv8Yj/G2cABo=;
 b=IBa2qliwc7aKEomUbmdzwwGklj8jNX6zwGPSP9DJg5GepG5wUIkj222TZiBvDIsfJreNyVyzf
 Mkf0KDicZ2+AIgLdHpBpV+CfU5YE6wCtCBh1QLnMFOjVhxdlp6ZTcVh
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_120254_493621_7C5285C9 
X-CRM114-Status: GOOD (  23.90  )
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
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 120 ++++++++++++++++++++++-----------
 1 file changed, 79 insertions(+), 41 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index a039b490cdb8e6c41169bfd48abb371447c150a0..6ed9bbed71f2d660a2c38d28788c1b0ca8f052c3 100644
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
+	const struct regmap_config regmap_config;
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
+	.regmap_config = bcm281xx_pinctrl_regmap_config,
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
 
@@ -1390,10 +1415,23 @@ static struct pinctrl_desc bcm281xx_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+static struct bcm281xx_pinctrl_data bcm281xx_pinctrl_pdata;
+
 static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 {
-	struct bcm281xx_pinctrl_data *pdata = &bcm281xx_pinctrl;
+	struct bcm281xx_pinctrl_data *pdata = &bcm281xx_pinctrl_pdata;
 	struct pinctrl_dev *pctl;
+	int rc;
+
+	/* Set device pointer in platform data */
+	pdata->dev = &pdev->dev;
+
+	/* Get the data to use from OF match */
+	pdata->info = of_device_get_match_data(&pdev->dev);
+	if (!pdata->info) {
+		dev_err(&pdev->dev, "Failed to get data from OF match\n");
+		return -ENODEV;
+	}
 
 	/* So far We can assume there is only 1 bank of registers */
 	pdata->reg_base = devm_platform_ioremap_resource(pdev, 0);
@@ -1404,15 +1442,15 @@ static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 
 	/* Initialize the dynamic part of pinctrl_desc */
 	pdata->regmap = devm_regmap_init_mmio(&pdev->dev, pdata->reg_base,
-		&bcm281xx_pinctrl_regmap_config);
+		&pdata->info->regmap_config);
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
@@ -1426,7 +1464,7 @@ static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id bcm281xx_pinctrl_of_match[] = {
-	{ .compatible = "brcm,bcm11351-pinctrl", },
+	{ .compatible = "brcm,bcm11351-pinctrl", .data = &bcm281xx_pinctrl },
 	{ },
 };
 

-- 
2.48.1


