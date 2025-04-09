Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BD4C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9YixQkkh2h+PoC6ERL/H9JIANLx33uZRMtwP8F9qEs=; b=PBcpttm57FOph6EhkOmwTNdgTc
	2XHAPMyoyM0jREDQWSEA2YLBxydSh4AEGHca5nEMpRxjQLI+iVb4NU+sO8PHZxwiuB3x7/pKNwEAb
	3Vd1A0UbXIGMEeWIJxG46vNJcRUSvuMZ0PAl/spI+2iFwlqspkzf3Q7pkiH16y1UtbYcaskOPUTjy
	sZ09QLXkE9ip/URXuZlqKZAtlc8mwDSrswo32ukuRnzJpmcmXvVwPDR3x7LRAFdzOdU8dYkgEepXB
	L7Lp5kMrLKRKiHqfg8Oh3fyYbkPAKsmHXYK0JiWYcknJJXRUJj7Y0+zUw94k3DwzuGcbfpBN9tLc5
	6sgNk9CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cjJ-00000008XsG-3uDN;
	Wed, 09 Apr 2025 21:13:05 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB2-00000008Se9-21NX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:41 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so19196066b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231059; x=1744835859; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9YixQkkh2h+PoC6ERL/H9JIANLx33uZRMtwP8F9qEs=;
        b=Rrufo/nNWltJIm5wsFUieudILQdOd14HrF3DEIc1MfcgrsbZvGV7ncNpfRQlLUjp0A
         uc+xnVYWe67no4uayzhYg3KR7HmiQ1HovO1ZPBR/PwE4wnTrJXEjdBMWKzqzBG8tHB7M
         qBcElmog6BmIfd4nF2W7XDR7DtI81PoJiw44eJwnOkV1sdaMOVyFjAU2YQNGD9gdYH00
         vOszaCH3P5PA3abh07EQpxX9TWXq7nWiOY6DQBaJlpR7b84ISOnKEfRtJq3F+jyuNQpz
         kaKdhqbdhanvcOhSWVz9SHAKmlpTJ6FLZlrnCPU+3MhNjiKKJUIcvvhTGZX3ztAVzeEF
         qCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231059; x=1744835859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9YixQkkh2h+PoC6ERL/H9JIANLx33uZRMtwP8F9qEs=;
        b=HEqTxv6DMRkY9ERs1b8FRnPB9RzjeWa0FZqzNbQrhv1xePmFwulUPfUIwMRsY5tZf7
         D765GlYO7toSkTwYOOIL6YPPfLQVtsxJwxiP8utKuVvZz7fAqgK2rsW1XczBD1DNMg37
         wdmUBymEnE2aybdBunFip3rfl6QriayOPbZ+rEiTIbvoSfL0Yc2m1XZ2Q1IlCrFA6Fqt
         Pfm4YE7jnXiIldcw4MTECqWhnmMtOTopZGDwOiDAAz4IWzJaHXPeQTo3ujfFDKRJGe7u
         EWJm6oNmwNiRLhzxUbUuKnQmjXdwWcENg7uQqablZUvllYvp2uxwPqI6VlTQI+mWthT7
         cfWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ0SvJqXZsZsU+hq6gqpAgoykxsyNgPLTd0yyHFAEoDujYI8LT1x3sxk/V1oSwD7yMfynoTVzIpJjXVwJdcLw4@lists.infradead.org
X-Gm-Message-State: AOJu0YzuxR8ky1LyenrRmRd1igO8fefYCgQypZRmEA9LpwfOEJmmD08+
	oOXxHkVxBHu6n9gNmqal9Ao2z9MGBjxr/Y3VoYwNtDohOPaNy70rcLu5Gr5ufRM=
X-Gm-Gg: ASbGncsJNjcgQlbbAUyxVZuULKNcesCvDsc/FbbG0yxJ+I8ZQNSAJx0eIHmlRlSBW+m
	ric0BBmJxHbXQOd45YwVIwCQJIU+zcMfTHV2vujUTbMJ3ekR2nonQJWkEYV6Hsg5B7D3OKX75Qf
	5Fc1+7541Kpvwri85bFIIGIYH4GOBjNCtqoJvW4v9TfagHWj9Hhh3uEm/LFdkz233w5SzLQId5e
	RpxU2opQZTr0pG50L97/3XulXIp3NbTQHQbs2QpeveDvbMThFZs+NtPD2ZfbUZ52gfepNVZT++i
	4Pv1OPIchAssq/LcRriQOhhjMiv8rxEjtr/zOHntTdS7THm8cPWgjmabnjzwov+fr+WSOpv7ZeW
	+TsYmCRNJkyYxbFoAnGgXxDeGyO4=
X-Google-Smtp-Source: AGHT+IGySdKlCUCRqIRdMr1m1a7VVzze8sUjh0tF6sp5LZEti5v72rp0jlKeAu4Y6YWVta765Hb6Iw==
X-Received: by 2002:a17:906:4fd4:b0:ac3:b3a3:f19d with SMTP id a640c23a62f3a-acabd3ba32cmr8605966b.43.1744231058840;
        Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:39 +0100
Subject: [PATCH v4 18/32] mfd: sec: Change device_type to int
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-18-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_133740_520853_E233EFC3 
X-CRM114-Status: GOOD (  14.95  )
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

Now that sec-i2c doesn't match device type by pointer casting anymore,
we can switch the device type from unsigned long to int easily.

This saves a few bytes in struct sec_pmic_dev due to member alignment.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c         | 9 ++++-----
 drivers/mfd/sec-core.h           | 5 ++---
 drivers/mfd/sec-i2c.c            | 2 +-
 drivers/mfd/sec-irq.c            | 5 ++---
 include/linux/mfd/samsung/core.h | 2 +-
 5 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d..4871492548f5efde4248b5b3db74045ec8c9d676 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -155,9 +155,8 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 	return pd;
 }
 
-int sec_pmic_probe(struct device *dev, unsigned long device_type,
-		   unsigned int irq, struct regmap *regmap,
-		   struct i2c_client *client)
+int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
+		   struct regmap *regmap, struct i2c_client *client)
 {
 	struct sec_platform_data *pdata;
 	const struct mfd_cell *sec_devs;
@@ -232,7 +231,7 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		break;
 	default:
 		return dev_err_probe(sec_pmic->dev, -EINVAL,
-				     "Unsupported device type %lu\n",
+				     "Unsupported device type %d\n",
 				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
@@ -266,7 +265,7 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			 "Unsupported device %lu for manual power off\n",
+			 "Unsupported device %d for manual power off\n",
 			 sec_pmic->device_type);
 		return;
 	}
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
index a0a3488924d96f69373e7569079cfefd0544ca26..92c7558ab8b0de44a52e028eeb7998e38358cb4c 100644
--- a/drivers/mfd/sec-core.h
+++ b/drivers/mfd/sec-core.h
@@ -14,9 +14,8 @@ struct i2c_client;
 
 extern const struct dev_pm_ops sec_pmic_pm_ops;
 
-int sec_pmic_probe(struct device *dev, unsigned long device_type,
-		   unsigned int irq, struct regmap *regmap,
-		   struct i2c_client *client);
+int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
+		   struct regmap *regmap, struct i2c_client *client);
 void sec_pmic_shutdown(struct device *dev);
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 41b09f5e3c49f410604a5d47e625cbb37d7f5fa2..2ccb494c8c024361c78e92be71ce9c215757dd89 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -27,7 +27,7 @@
 
 struct sec_pmic_i2c_platform_data {
 	const struct regmap_config *regmap_cfg;
-	unsigned long device_type;
+	int device_type;
 };
 
 static bool s2mpa01_volatile(struct device *dev, unsigned int reg)
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 79b4f74b05a24e413a84ff8c0b16156a828310e5..54c674574c701eec979d8c6a94909b78dcc77065 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -449,10 +449,9 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
 	int ret = 0;
-	int type = sec_pmic->device_type;
 	const struct regmap_irq_chip *sec_irq_chip;
 
-	switch (type) {
+	switch (sec_pmic->device_type) {
 	case S5M8767X:
 		sec_irq_chip = &s5m8767_irq_chip;
 		break;
@@ -484,7 +483,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		break;
 	default:
 		return dev_err_probe(sec_pmic->dev, -EINVAL,
-				     "Unsupported device type %lu\n",
+				     "Unsupported device type %d\n",
 				     sec_pmic->device_type);
 	}
 
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index c1102324172a9b6bd6072b5929a4866d6c9653fa..d785e101fe795a5d8f9cccf4ccc4232437e89416 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -67,7 +67,7 @@ struct sec_pmic_dev {
 	struct regmap *regmap_pmic;
 	struct i2c_client *i2c;
 
-	unsigned long device_type;
+	int device_type;
 	int irq;
 	struct regmap_irq_chip_data *irq_data;
 };

-- 
2.49.0.604.gff1f9ca942-goog


