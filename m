Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9363FC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZ+pWW3wwfoO36sbVjoQMpP7epgDk59E8mIno/3xwfk=; b=H+jNkVhV4+SI5TZtWlx6IhniPG
	kFFC6Nb5LTkyIlQfhmwlkAig8N8CER0m6Dc3+QbEfoMpKc9fM/fQKnbh7d51yVOd9wuJhH+qu3ZFH
	NOLG9Tj1tNAxcx7gYTfPMkmp40ahvfWgK1daPCBtzSnIP+VGuxOEMGUQlumKXVI3V8EICn3IK4ZKg
	iF8dA/s1pTUGt/+0JmmC6KHN+H5ZpEPQtB4QGMbr6z5zru/kPmsLJQE83/0rRXieGlo7+0Filofkr
	OrsgIuJptsBeAI0V6Oa2Cw0bTq3K9Gwscszi0CI0TaR6Ftiq+iCaCSb/sKNmMacVPL8gVPlr2Lzd5
	4loDdrCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAK7-0000000DXMy-21AL;
	Fri, 28 Mar 2025 14:04:39 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nc-0000000DQjJ-2keB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:05 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso3576814a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168663; x=1743773463; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZ+pWW3wwfoO36sbVjoQMpP7epgDk59E8mIno/3xwfk=;
        b=Pp21F29J16wYpv3hTEroA80nOt3KxPxtxQMGQRUU8vLpwVKrVJzHW3v6xQoRE04A5n
         Qyaj8xfWzSuJKS8c9urUjaUuxBoQMLlsKYI2V0Ne6Llarh+c+gVh/YfM1ajUttc9fUyR
         +rf5Bji2cRjzPhaLr8y3D7T8koeVrDPCapC/y65n6LqikYb8KHH145to6RdLPbn+1eC0
         68sXZC3RfGS6uSpZ+Yt9Ugu2FxVvQCFllq1mMjqIq0NnmgNYpU8a/RsrAtDJNTCgxj4y
         SpgxxTBBv6dQgicbX0W+J+lUt7GMUfLd6uY1U6RyjTvuVR2ZbBy/ZZWuyQR5t4Z2JqI9
         CSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168663; x=1743773463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZ+pWW3wwfoO36sbVjoQMpP7epgDk59E8mIno/3xwfk=;
        b=qjsYolirZHpL0RMHanlXcVeK6QWiwv5As0F0qYTBpVEruExPshH97ffkY2vdywG+Kl
         UCkpFO13L8LFhgA1tFWT+Y3ob0TkAnFTZr3Bvl7ZjONOmFus5dGwv7SZd7JPlFadw1E8
         yJ6YEG60lIAY2/LsK2Pxc03KNdAV9ZdKT8bXzIMv/2N9Yl0NOjY+RgDkfW+U+7xQVHEy
         fHyL1LRzTIqX0RK8UJdGW47uU0utxq09rUdOlK80uzLBeco+L4HNgxrpCmtOJBrR9mb+
         plguxUrPZNMLFWVaPkdh9HZ1wgXfc/ePr2eQjUAdWzoM0ns2nUre81udOxl5v8FW1euA
         GP8g==
X-Forwarded-Encrypted: i=1; AJvYcCU/fzpa+LI4SHRXroxJJ/xirVi3FDFh5fE8TYQQ2guXn8CAx/9cUzQY7W2Jamp8ilwsazTTZtVwCCt7fORTkdFd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm3NWUCdr6a1Jv9NjLNY5G0uw0tBpk09q5a4xR0qKVQNALOaj8
	iBYGumaLTx/Bw0kCXE39R8e13860qvdg/g365FQPPmcIVwl/w5zddu0IMxJwLnI=
X-Gm-Gg: ASbGncso5CH/Vifk9ym4HzRt8J6pYotz3ZOPkH1NywV2I1h2m9/Xsuqqf2wdkvv9CIY
	vocNX84k2Lh5z3HLhz6ZRGL0cPboY0JkPjbxGuywOkZiT13FVvHAo7Y+56tMnw1Cxc1Bv4O4l4e
	AiyGWZ0jxIB3KC0wO8/ilNInCiIiEcvcbD3Kk6EJXKRUzpYYH3WnwvZh18Qo0UiAqFkl5bwRpRx
	X1jjNZeStXFwJ9WYBwNp80knvFOPqaKnq1Xd7mhU5PzttLzXWuBtKD2CZbGlsR7R4q4hDG6kyV8
	B30SHPaK7DjTKcFxtaGEowBwlSuVLBTJ3RhJ+VhVgfRRR+Ikf9nYAhibLE17gS+TVcBzxSH1ber
	9XoBiOjQilpCIiiYUsZsP92vxwMuE
X-Google-Smtp-Source: AGHT+IFvr+SOv6TYL/fIDoyg5ti+FaRzN3oqSR0lDemyricExzUDfIk3kNyRHZoukM47sE3VOIFENg==
X-Received: by 2002:a05:6402:518d:b0:5e7:b02b:6430 with SMTP id 4fb4d7f45d1cf-5ed8f3fd122mr6774697a12.23.1743168663146;
        Fri, 28 Mar 2025 06:31:03 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:02 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:04 +0000
Subject: [PATCH v2 18/32] mfd: sec: change device_type to int
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-18-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063104_707168_77EF771E 
X-CRM114-Status: GOOD (  14.94  )
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
index 79a3b33441fa5ab48b4b233eb8d89b4c20c142ed..c4db58813059f07372679223ec570ed07f52cd73 100644
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
2.49.0.472.ge94155a9ec-goog


