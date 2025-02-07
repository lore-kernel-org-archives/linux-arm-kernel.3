Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B66C0219C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snTumn4iv+UCdzCDJTBtnrtlkQDZvBl625j3dPFfzu0=; b=fPlCtR8X8RSaLbjkkAB5oASO/f
	Ypa8wrvfV3bvdmGMeg66JmCFnqLgseT3Vn0xPr8ATS9//XDcqUEJhqESjpGktSZr7BqKd46394ysq
	lTR1cAlJANDG0dnCKYYWM0tN/ytHyJpvqkGTlKwl0mSNyQgJgDt1rNvH4ylm7L75Rgs7BC8SS+FhA
	EqQTg0mBb2PAr3wdsec2vHWK2+xPULgoh5pB0Y0+cUNYrjtZgL2Hjh2PCsOhNmNEICDETcQMWEo/i
	6C/Lo+IOC9HDU7UBLIRDqToV1tO2sVQHodLZz3KAeTTFk0kQ9lFW4hBawqCeh2EjT9pXXo8V9+Ol7
	TCjUYfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUzI-0000000B4qv-2cFE;
	Fri, 07 Feb 2025 20:30:08 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUYt-0000000B0N8-3plQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 20:02:53 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5de594e2555so404540a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 12:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958570; x=1739563370; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snTumn4iv+UCdzCDJTBtnrtlkQDZvBl625j3dPFfzu0=;
        b=WQHTO39P2H9TZn4lLZ0XbNi9XFWu1hKKtV74lUPDNu+vz0zIJfVCYtoDULH5MQNuy9
         dVk1eDg8GddA5WFvERrUIpRNF4Hzb7KmnJWxmRzgOhH9cz9SG+7w571dJbOt4HPLZoB8
         9VIZcJsMJNTetGzc3xs2FWlQAm1MXu2hhJ0b0u8AmGkrm7bQ1h3rVN5tIQz5hXbc12D4
         LDXMd07KFfa9NyxowfpnjSyueK8X6VxZ2YvHK51481Q0JM+r0HgsukvOXtLDlqubRh6U
         HkAun13kHU40qHl4TRkv6wQQCBRFfRm/CW9uVkNt8saeph6Cfs0DXpT0HWVbq56El+k3
         wGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958570; x=1739563370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snTumn4iv+UCdzCDJTBtnrtlkQDZvBl625j3dPFfzu0=;
        b=HFzJMcgrDhQ9nDRykzBjvCgXf4JsSIofsFiWXejAlQgowO17V0LbcdHUvW0vvKO8+z
         EsSN7t6v6jYWaF1G89XIp+eR+w1Pbc75SQ/bEcCk+G9eAS1CqqUoiYSo0fg9jMp/RfaM
         8LznTMx7jJ6n7fipHr9pChliR6lJl3yUuI4dTqkxfsFgUbUW86/qkoq3dUzqw2IMjoVO
         3qjGmCVD1QTilRcPZZ8H1i8DAYyoYggYQJkzqFsdGESXt8ddXvPUAmNCdxqGnfOQvlOy
         2vzQWNS9cbIZIKAQaeJagdwXN2/NN7h77v21oULdwJ42UUgsicRxGolWJw2MpKc6bynH
         JZWA==
X-Forwarded-Encrypted: i=1; AJvYcCXGnQNZXcVO7PROO0YO+c1c/lD1zcKzVrT0vJ8sovBwFQIQMW09BqfQ1IuInvG99uTkSVXV+F6YaHu3E18w4shO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr9H9HUvpLkueHU92fIT3Q/APEjt58hDIMNGxCbm0r/QHtyzpa
	g3YVXKUC9l/5P1FU4e5hQzib+HdLpzsiN2VAcj0gdOHcy5nx9W70
X-Gm-Gg: ASbGncvvpGuW1dIrRVq/OEfl/qG8C4bDeAenxdj0pk/mK3QmUtpw0arvnZoerbExAhf
	pQ6mD0p+ipQxhd0O9aXHlztW6DmIH1X6yP6yJQ+WkIFLqwXPyGaIHGpiaXQoew5ckPybKdPtvp7
	fq6RYQHb+DwTYB3NXsIQmYu2dL3j315SOVxz8P08NZme/47MU+pSuliyNfTUpj6YbMx3ljLOEQX
	JrTC1FUqpj9/FWQXJmAeR/5JzXJP84RsXj5NpAZ54hRiW6tAtVicxIBdFr2yGcJqCxcSx7PJSi2
	VvVh3AOtg1j25CoK827Qw47uHCkXKiZ7ANbjcWzGukR7+772VJ6X3h1B
X-Google-Smtp-Source: AGHT+IGCPUsAGzXP7K9RVxO9Z6WwP3Y5roj4zr79piTcVK2Ignfim9J1sMITZ1seLm//dPBP7tYh7g==
X-Received: by 2002:a05:6402:4344:b0:5de:5718:296 with SMTP id 4fb4d7f45d1cf-5de571802bemr1906286a12.13.1738958570162;
        Fri, 07 Feb 2025 12:02:50 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm256797a12.45.2025.02.07.12.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:02:49 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 07 Feb 2025 21:02:42 +0100
Subject: [PATCH 3/7] pinctrl: bcm281xx: Use "unsigned int" instead of bare
 "unsigned"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bcm21664-pinctrl-v1-3-e7cfac9b2d3b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738958562; l=5672;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=8Mipz4VrzSKXY8BbbxBUC3KcuVRejyAjsTstQRtR2iA=;
 b=K+VSp96VQgN7Bros04P/ItSpC06vyqMsR23IgxV8MplxUQarkS9iQvu0J0uGzMFKinz3YzfeB
 DybagnrN2ytBkaHqtPDcbXgK2QIM2lu+es+9LhNknEnThX8jfmwOUrR
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_120251_987049_C51A1087 
X-CRM114-Status: GOOD (  13.82  )
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

Replace uses of bare "unsigned" with "unsigned int" to fix checkpatch
warnings. No functional change.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 44 +++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index cf6efa9c0364a1ad65885c982e7634f26d19c944..a039b490cdb8e6c41169bfd48abb371447c150a0 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -72,7 +72,7 @@ static enum bcm281xx_pin_type hdmi_pin = BCM281XX_PIN_TYPE_HDMI;
 struct bcm281xx_pin_function {
 	const char *name;
 	const char * const *groups;
-	const unsigned ngroups;
+	const unsigned int ngroups;
 };
 
 /*
@@ -84,10 +84,10 @@ struct bcm281xx_pinctrl_data {
 
 	/* List of all pins */
 	const struct pinctrl_pin_desc *pins;
-	const unsigned npins;
+	const unsigned int npins;
 
 	const struct bcm281xx_pin_function *functions;
-	const unsigned nfunctions;
+	const unsigned int nfunctions;
 
 	struct regmap *regmap;
 };
@@ -941,7 +941,7 @@ static struct bcm281xx_pinctrl_data bcm281xx_pinctrl = {
 };
 
 static inline enum bcm281xx_pin_type pin_type_get(struct pinctrl_dev *pctldev,
-						  unsigned pin)
+						  unsigned int pin)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -985,7 +985,7 @@ static int bcm281xx_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
 }
 
 static const char *bcm281xx_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
-						   unsigned group)
+						   unsigned int group)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -993,9 +993,9 @@ static const char *bcm281xx_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
 }
 
 static int bcm281xx_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
-					   unsigned group,
+					   unsigned int group,
 					   const unsigned **pins,
-					   unsigned *num_pins)
+					   unsigned int *num_pins)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -1007,7 +1007,7 @@ static int bcm281xx_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 
 static void bcm281xx_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
 					  struct seq_file *s,
-					  unsigned offset)
+					  unsigned int offset)
 {
 	seq_printf(s, " %s", dev_name(pctldev->dev));
 }
@@ -1029,7 +1029,7 @@ static int bcm281xx_pinctrl_get_fcns_count(struct pinctrl_dev *pctldev)
 }
 
 static const char *bcm281xx_pinctrl_get_fcn_name(struct pinctrl_dev *pctldev,
-						 unsigned function)
+						 unsigned int function)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -1037,9 +1037,9 @@ static const char *bcm281xx_pinctrl_get_fcn_name(struct pinctrl_dev *pctldev,
 }
 
 static int bcm281xx_pinctrl_get_fcn_groups(struct pinctrl_dev *pctldev,
-					   unsigned function,
+					   unsigned int function,
 					   const char * const **groups,
-					   unsigned * const num_groups)
+					   unsigned int * const num_groups)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -1050,8 +1050,8 @@ static int bcm281xx_pinctrl_get_fcn_groups(struct pinctrl_dev *pctldev,
 }
 
 static int bcm281xx_pinmux_set(struct pinctrl_dev *pctldev,
-			       unsigned function,
-			       unsigned group)
+			       unsigned int function,
+			       unsigned int group)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 	const struct bcm281xx_pin_function *f = &pdata->functions[function];
@@ -1082,7 +1082,7 @@ static const struct pinmux_ops bcm281xx_pinctrl_pinmux_ops = {
 };
 
 static int bcm281xx_pinctrl_pin_config_get(struct pinctrl_dev *pctldev,
-					   unsigned pin,
+					   unsigned int pin,
 					   unsigned long *config)
 {
 	return -ENOTSUPP;
@@ -1091,9 +1091,9 @@ static int bcm281xx_pinctrl_pin_config_get(struct pinctrl_dev *pctldev,
 
 /* Goes through the configs and update register val/mask */
 static int bcm281xx_std_pin_update(struct pinctrl_dev *pctldev,
-				   unsigned pin,
+				   unsigned int pin,
 				   unsigned long *configs,
-				   unsigned num_configs,
+				   unsigned int num_configs,
 				   u32 *val,
 				   u32 *mask)
 {
@@ -1207,9 +1207,9 @@ static const u16 bcm281xx_pullup_map[] = {
 
 /* Goes through the configs and update register val/mask */
 static int bcm281xx_i2c_pin_update(struct pinctrl_dev *pctldev,
-				   unsigned pin,
+				   unsigned int pin,
 				   unsigned long *configs,
-				   unsigned num_configs,
+				   unsigned int num_configs,
 				   u32 *val,
 				   u32 *mask)
 {
@@ -1277,9 +1277,9 @@ static int bcm281xx_i2c_pin_update(struct pinctrl_dev *pctldev,
 
 /* Goes through the configs and update register val/mask */
 static int bcm281xx_hdmi_pin_update(struct pinctrl_dev *pctldev,
-				    unsigned pin,
+				    unsigned int pin,
 				    unsigned long *configs,
-				    unsigned num_configs,
+				    unsigned int num_configs,
 				    u32 *val,
 				    u32 *mask)
 {
@@ -1321,9 +1321,9 @@ static int bcm281xx_hdmi_pin_update(struct pinctrl_dev *pctldev,
 }
 
 static int bcm281xx_pinctrl_pin_config_set(struct pinctrl_dev *pctldev,
-					   unsigned pin,
+					   unsigned int pin,
 					   unsigned long *configs,
-					   unsigned num_configs)
+					   unsigned int num_configs)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 	enum bcm281xx_pin_type pin_type;

-- 
2.48.1


