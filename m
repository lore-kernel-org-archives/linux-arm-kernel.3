Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F08C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 20:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snTumn4iv+UCdzCDJTBtnrtlkQDZvBl625j3dPFfzu0=; b=e0ac0njUbQuntTxzAov8fxSz7r
	m7IOAlO8NvXgYxmswcogBNsjIh7bqxFwwbnCF6FlHFv5yUafAL2fxqYlVAwOEROg3zjOMDcs1V/x9
	IirBW4x+pJzysneEvPzgcBfYfQVKD7E114LWM9d1ANqMiEjtLkQD85tvBBlQrhGZgV+agLWTcbZ88
	7PB+7LxzQoosQTfuMktfJ6nIZHYog3jHnC9aIyBJYZq7AUbAS0sIaqVskV579r5L4thqnxP11+oR0
	0XXnQu/IkuG71CQBOUeek1FLgAC4DPM4n0cxpwG4U+sY494vsie0NqYHjCAQbDv3z0B7HIPnzUNEW
	l16kUk1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZm2-00000006os7-0pB0;
	Fri, 21 Feb 2025 20:37:26 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZhY-00000006nqc-2CHa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 20:32:49 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e02eba02e8so3434711a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 12:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169967; x=1740774767; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snTumn4iv+UCdzCDJTBtnrtlkQDZvBl625j3dPFfzu0=;
        b=eleK0HGa6e3m3Zdp+IPKjSYn4U7u/q72YXV3hdY7bQAxlRbtGEkjeVfVUd/kDP0zG0
         8TJXUfauBsXU/Ue1U7v7a3ZZS+74xC+rzBZr63sOY++oCRZZEXH+xksvpdkmz4Cm+KVB
         AGqnLWH0rIrVEyglBEEpnKkT/rSl5WdBM57Hh6b3Iicl7Vq/Czpni4KNscPeQK8eCSa9
         CHQ+EIFs6OEN7UBDgSBrTdOdDIzbJ3Fz1m2yQ+kAS+FYL3CQowvQzoxaoRmytD7maRj3
         mim08c9wtP3RIk6h4Z+l7oFd++Jyv0ZMTO2PmFiYByYe4dGFGD/Jv2GaSZXng0jJf/Tw
         iqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169967; x=1740774767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snTumn4iv+UCdzCDJTBtnrtlkQDZvBl625j3dPFfzu0=;
        b=A3MwUp4ywkPGGTZ52rWf9OT8llh5hJbz03NShsrfqPHLvRXy8xZETKGXPnfnAhfJ9o
         eAAwqNCWtvtlnfXsxD2FDBaP2aUPQjTblT+ikhB56pB7KqhO2kEqt8rNtzLbcy5ablC6
         klLFGEBmxJpzjyaG4aF0oOXaZ7WFSCGp8NU/W8tvC6I7noBdKIGQ58JFTUj2o+AYD8KC
         67PrurChn3nLiVT8H21hQHBj68KvZrDMDU/7SyCQiPBhU8QpcO1A52mXzKPprXjerBco
         7Zqtu6MEYlZ66jfh4QOjkv1PGZCzkN658Amtr6cHbWlXXiu2jbSvXjHYNE5pYhv4h/M/
         3UlA==
X-Forwarded-Encrypted: i=1; AJvYcCXDrlPJr3has+FeQTt4BRmHnacWmJCW/TXMztSU4mtr3hYD9/9sKPrxRbOk3IQ5nHq6i0faFlXKV97WjUQ/k6K8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzr94a+yUQWAXXrnA7WL10pxAAjGdPcSds2dQYAafKLVA4I0L0
	91RLHuPjaW8IkBmx5/PNTH0Dh3FNovsyogl8+Eh0/0qyv9bCLanD
X-Gm-Gg: ASbGnctY2+yDRbbfFubmHvEXdBBGCB/sp8lvDZgCoVymd3+aXsWUCb34CI/V2GQD1VH
	RXPrY4gFMr1a3zY/ZxldQbCv2HCarUa7ftghzCJueE852jbkoaLsD5IxO0+aW6g/pZGBrQ3Rvjm
	Iv9eDUKk5FRPg+ozqZ1511vGS5Fvz0lniG9T+JID3IFfkLAvVrqmcK3l5riBQxT212z0ZkPs5Vs
	GBpCfNhF/WeqtsqSg9URHTjrGYT8UgXm7Sga7gAstyfa23lJvxUQYyNT5UTpGN8es1wx/VP80F/
	J7oYCsXX+NB/ClSlFaIvhmMhEHSkfkwX0jl5GkqQxfl1mYbGkI5NjmLpxt2qxYOygN9KJ44D
X-Google-Smtp-Source: AGHT+IFTxkMlCgyEhrq+P+QrT3EEXq7+LvpCxZ7kChZ/0Jf/Wob5JHP2c7HEHF/fdXcS44PmZFoEWw==
X-Received: by 2002:a05:6402:388e:b0:5e0:818a:5f43 with SMTP id 4fb4d7f45d1cf-5e0b723ee9cmr4508702a12.30.1740169966265;
        Fri, 21 Feb 2025 12:32:46 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c418bsm14653485a12.24.2025.02.21.12.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:32:45 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 21 Feb 2025 21:32:38 +0100
Subject: [PATCH v2 2/6] pinctrl: bcm281xx: Use "unsigned int" instead of
 bare "unsigned"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-bcm21664-pinctrl-v2-2-7d1f0279fe16@gmail.com>
References: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
In-Reply-To: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740169959; l=5672;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=8Mipz4VrzSKXY8BbbxBUC3KcuVRejyAjsTstQRtR2iA=;
 b=361j678cJVEP1V9qvwiEzsITzWeF0xPxKGUFsbIxvFBTKMrsoLTjkkVw8eJ1g9mNiTBiDa2m9
 swVJ5JJYpnoATWOl4KmsMUCH2hQpfUOge9WUV+wrwskkWxXCCScvD+O
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_123248_566961_02C3F649 
X-CRM114-Status: GOOD (  14.02  )
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


