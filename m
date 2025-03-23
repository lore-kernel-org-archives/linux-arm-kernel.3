Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E1BC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3Twc2HyOCZXfu7bqwpcMcsjD+r2Ct4/gngHvFw4saQ=; b=Fo2ByOVNFBtdrZ0NUjkqmwXOhG
	TTbmOBpzaWFSb6IVH6o2TiDPkdtfk/omom3hUNsBI+UPkYQ6b9yA7OvnKDwzX3ZKO9sZtWPHGpDtW
	SkHOLU/qcoSDQa4364nyj+fKQF5x0r0rFTZofeDMbpxWYaYZGeDHzw7pZb02G7poYrsWYdkMp4CV1
	aCD5DuZKcFihaY4FaQvdXgGqvD2oO4LWacfz429cRDM2eq80D7jTGwcw3MncJfBx/FKTvmc4r+LX5
	z3CYHe6NhvXIB17yCJJwGDqssmOOkOK6JDobvDlV8gUl+kJRZNHQ6PG40gk1M5gMFNZWh+i2EvYAi
	/svlCb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUWJ-00000001tO7-3Mb0;
	Sun, 23 Mar 2025 23:14:19 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyj-00000001p9y-1g3J
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:38 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso838516166b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769576; x=1743374376; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3Twc2HyOCZXfu7bqwpcMcsjD+r2Ct4/gngHvFw4saQ=;
        b=uEpi5FGLKbCpk7YYffzJ+P4+6n4PqBrw52f/UUUUCZETjSYrWpFGvi5AWJCGmgUAOf
         3HG4cH23nFzR4h7u/WbK681eBrHsiWzEH8RyCGM2yRUq3P1QYOMRMlAMiUJ9KkhwU1re
         F0UwOH+7G8MIUw8VqrrkIl7o0dYxUfkzxvIypfpczF8aqCYMXGk1Mj3AGJ5SWyvbHNQo
         wPE+Vkl4Yot1QlzowmnGvfSA9g60ps/Wq8Sr84vj+bUWHVreSmTeP836eTe+3WG8O4mn
         eM4ogAZY4doyjlX0YrO5l5zoI2ToBvQuIlXbQI3AGWTGjm81gaWPzY8BDNOOnIJXd20R
         op8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769576; x=1743374376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3Twc2HyOCZXfu7bqwpcMcsjD+r2Ct4/gngHvFw4saQ=;
        b=jRdU9WXivFfYMqLZWKqxylPXPFu1MvQ4a0soYRWYquIOelWg9LqERNZatlXk17ptOO
         cPr+H3VDz4vNssHSq26Q6UQUPvCJctXyPC5nB7v1dbVEKhjl6aP5DO1wUmb5rUG/NmjB
         btnm2Lt3yB96CT78A2pB47XpEL+rOweEbM396axibRvik6Iwvb0HEOnVbc6gURAqU+of
         eGZ+ad7i+aRvsMG7xzM0a5aqs3eQxaBYms25K8+2mTlVDNAfpaLUIZb2Ck/bK1//9lhE
         +nvYXOXSy0mxJ/ZXrJNqmKQzgUUWpg/UeBbnN0ZAj9lssvRRbtS+lcAotbXvLwymtPIq
         ljpw==
X-Forwarded-Encrypted: i=1; AJvYcCWsItfWHvRrr+NJVGgFTI900qGfJOenDQ1XMdUTCofulcQ+2M7GUhQwaMGyuRm08qjuQUU9ApRDjNhE7KJ4+vWL@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhf9AEZigJBc7+VDEZeOhszFWAxVU7UKQt9LJli51yLNWyhDWB
	wnnxrrIWpBPCuellksTDQMAveps3G5KhgXKpei9z7y2QfovaCetQhNNNAElINow=
X-Gm-Gg: ASbGnctWKZIA1zZQDrSK6u/rpxb0VNf+lL1Ij0DPEHBo+jc33VxEpePGyPUEeYEmmWA
	M1wLQ9K5WntsN4PefRjr9WKkgv88HUUHYhv20JxUU4LMbr6AOkvrG9VLyQAo6tKFNdes35/sdAP
	jQn0DI28cjoDJPD3yKeZVs0aZT97EVotGKWxJFspGpD1XAyIPg0fsarN/ojSDTCCCMMKALvdIjm
	kAaS9a5GMJ5FW15/5Te58OJkcX0zWrxWw6L8iC8wSR8YFnjGLXzRWhGaRed0jZmoJ+/Lsj+Ht+8
	zqvq//iG0xG7iP4VZ6Ox0J/VwYwaqemmdMC9TROY5GYfetsoPluoHOHXTTLlCb0Km9h38CjdbzB
	9vxQCwBPCGc8gkd1MzNhnP3iMWoXm
X-Google-Smtp-Source: AGHT+IGQ8L6LLeC0zwpvMlguGkzr2gQM+jg2bpgKU+l+fqanTCryHJuZychWrZmnRDXRMuRhkKJXmw==
X-Received: by 2002:a17:907:7f92:b0:abf:8f56:fe76 with SMTP id a640c23a62f3a-ac3f22b43c4mr975457666b.25.1742769576042;
        Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:35 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:37 +0000
Subject: [PATCH 21/34] mfd: sec: change device_type to int
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-21-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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
X-CRM114-CacheID: sfid-20250323_153937_448659_841DCDF7 
X-CRM114-Status: GOOD (  15.66  )
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
 drivers/mfd/sec-common.c         | 8 ++++----
 drivers/mfd/sec-core.h           | 4 ++--
 drivers/mfd/sec-i2c.c            | 2 +-
 drivers/mfd/sec-irq.c            | 5 ++---
 include/linux/mfd/samsung/core.h | 2 +-
 5 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index bec8f93a03f7fd794beade563d73610534cb96b2..48d5c9a23230d0927b9dc610166ae3f8f1aec924 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -129,8 +129,8 @@ static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)
 	}
 }
 
-int sec_pmic_probe(struct device *dev, unsigned long device_type,
-		   unsigned int irq, struct regmap *regmap,
+int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
+		   struct regmap *regmap,
 		   const struct sec_pmic_probe_data *probedata,
 		   struct i2c_client *client)
 {
@@ -214,7 +214,7 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		break;
 	default:
 		return dev_err_probe(sec_pmic->dev, -EINVAL,
-				     "Unsupported device type %lu\n",
+				     "Unsupported device type %d\n",
 				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
@@ -248,7 +248,7 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			"Unsupported device %lu for manual power off\n",
+			"Unsupported device %d for manual power off\n",
 			sec_pmic->device_type);
 		return;
 	}
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
index 58e5b645f377cea5543a215c05957a2c49239a6f..34a801144a47bcdb5472ce5548bcef0fe3f0926f 100644
--- a/drivers/mfd/sec-core.h
+++ b/drivers/mfd/sec-core.h
@@ -21,8 +21,8 @@ struct sec_pmic_probe_data {
 	bool disable_wrstbi;
 };
 
-int sec_pmic_probe(struct device *dev, unsigned long device_type,
-		   unsigned int irq, struct regmap *regmap,
+int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
+		   struct regmap *regmap,
 		   const struct sec_pmic_probe_data *probedata,
 		   struct i2c_client *client);
 void sec_pmic_shutdown(struct device *dev);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 9f33d4569cf73461c57d101f6ca1cf2b75f22b4d..760dd89b62a1639013c9e51b6e1a7376f15ac504 100644
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
index dc5560a0c496917e847a40295c53e3f762b60998..cf1add30dcd0ff1ad149b483fe40edf82c2b57e1 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -450,10 +450,9 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
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
@@ -485,7 +484,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
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
2.49.0.395.g12beb8f557-goog


