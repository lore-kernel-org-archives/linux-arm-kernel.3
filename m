Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9B4C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 20:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snTumn4iv+UCdzCDJTBtnrtlkQDZvBl625j3dPFfzu0=; b=Ot/so75Bu6tUhTohssurjsihx5
	IDCPBfZa9jLZdBT2inM4CUcwm1gXgvM7Jz6FBwqT4JgazcmsNo3pIoRnc1DeqEusH+GZyokB1dGOq
	W/BlkPQHHlDm9C9MXSpgcjZQLn87zrNq08eIVVKjH3IsoRXyeDBvIotFZhomI/ZAan7LmJzwTGTe7
	hDnNi3pK1Gyb37HVG+NLDNnun+mcozai/qxaw7OsB6Jd88MlrCFNMnOrf6J2EHQR/mfAE+t88cKRX
	GeDljKadKn9iyWzUJJ5AsgqHZ3tpBU/b96YSvunOYyjGHL1fzzjOI7C9kOkLKRrCg7v4j/d6d+q4z
	dUjoloDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCt4-00000002J3p-2hYY;
	Mon, 03 Mar 2025 20:59:42 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCoQ-00000002Hta-26cx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 20:54:55 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso8444482a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 12:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741035293; x=1741640093; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snTumn4iv+UCdzCDJTBtnrtlkQDZvBl625j3dPFfzu0=;
        b=aOwa6lSoXRs83qviAY/jr9zyks5a+FV+CvW7wtuO8j76JJQ513Tj+DCDVM9QqLapGT
         XZSC9XSEn4yOY0q7BH4/oQL7jJoYmGO9zvw5W2dkdqFB1UDuCYGudYSWFcoIgDIZT05k
         JPUNpErHODHeXcjOxGjGiHS86/3P+nBwgXRWLBXApAq+wkTPFy/b9fChJED1dmZDIzux
         XEgA3AwY1lHpCrxKv7xqZ8pqIvKNcfhhakl3GfGC1MUwAC3+bb3szbrsnBF3NoOaJW7Y
         sMTnWnJp0//FPThbepJTt+VaF8cBfxcGmDo0uW6eoYvzuLLpRWIOB8eLHdPdhYwRx6Ub
         jhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035293; x=1741640093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snTumn4iv+UCdzCDJTBtnrtlkQDZvBl625j3dPFfzu0=;
        b=E+qRRpriKp/jBYbz6f7PAhRSckprxW1G7SIbAs16RHcURKPhXk4yCgurqGJZulIa5I
         rcYTPCdF/f7r2PsquSi1+cIwic+ntQB7btcY7OCBpsWeS+sl7syBRC0OJvG1H6dEOOFM
         /kEkYFhgGEq7+cEs/NTXi3KEGqV0odwRL4+6srC3LVzhpkdqQhi4OmHAFYoS94zwzZl7
         ey44cPQNz4klm0iG04VTzufxmxvF8INICBtCBnGAi4N6/YdCL68Gj2I/IfawGyZPElJD
         2CXtHJh41bBTb/rbzuJuGW1EHAzBjGrPIw+y54qvYZoaZozlk4fhA7HavkoQXBoPw0ys
         otpA==
X-Forwarded-Encrypted: i=1; AJvYcCUC+4KExW5932xL7Iu4sezpe+nufQClqnq3SSnXToZaBlPxQCCJtaVmvCYUuJoPmou/0IQfs1JMlrCicDocdopu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7QJ7ZGFZvYcG1wJ2cH25xT6cTkunOgO6rQt30dfyoMzU+Cl9d
	1y8uC3GHO7I4NSUbDWLdlBrCiICwq1qzwQWJ6fAve+zlaDlpwi4y
X-Gm-Gg: ASbGncvS/thXqpQlaXa9PiJJNQHmT6Rc0UB/cvhv8p2f4ZIjzBMGLxiSm6sH0PedLHY
	F101kQdRkR1MYKV/pqnzNhDREu8fwIJJHbVBpcDGvKUj3+yaYMvhsFp/dq9gxaEx84sRlyYDQ0R
	tRksWXCQBKB9neFC/CvrKI0sUa58wrLp7/1AAMKaCMogZaDogfZScRK1mKigOVHu+z5XrhFojRj
	rlNSbRFDSJZJP8awPpQMqEBfRlMi9bQ7uLxZPzfNSev0Px4AHC2kg5OWlojEUhOw24UMBT8wKOb
	XOcHYwtxfTmdhOvmXbFC0bVgHenBrtNGExtwOsDHxO2dSY9w8b5QjwqpY+j915pYgeqqzJrYWqF
	JQt9eH9hkF5LHDsI=
X-Google-Smtp-Source: AGHT+IG/g10nsVVv92x8KyOz2OlyW4WVodWGg3HBsxjosgBYyl/BYl+hV0cPfEb8k67GwIBiy14xgg==
X-Received: by 2002:a17:907:7f06:b0:abc:b8c:7b2d with SMTP id a640c23a62f3a-abf261f2f71mr1585598566b.32.1741035292765;
        Mon, 03 Mar 2025 12:54:52 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf76063ab8sm266955566b.73.2025.03.03.12.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:54:52 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 03 Mar 2025 21:54:47 +0100
Subject: [PATCH v3 2/6] pinctrl: bcm281xx: Use "unsigned int" instead of
 bare "unsigned"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-bcm21664-pinctrl-v3-2-5f8b80e4ab51@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741035289; l=5672;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=8Mipz4VrzSKXY8BbbxBUC3KcuVRejyAjsTstQRtR2iA=;
 b=9oOU0M3B/cZQu+4o4ff7u9OZWTBYC3eOTyVocbuvCDdHXvt9CIGD/q5+g3lpI00hz/adioC2a
 MiYOZyikMsJAlSYN7J6KgmpfQD4NuK0NXixb5Di93HdqiiYHedpf4xF
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_125454_544439_1172705B 
X-CRM114-Status: GOOD (  14.22  )
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


