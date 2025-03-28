Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF38AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcW1mWBfWGvNcEl9sJWjMnkVLrjIE7eEENFwEaEA4Go=; b=eXLfr/b8BiuOSqwgmvs43lL4Hv
	rw97o4CiKtUczX2ca2v0KPWQllH1f40ITDReGIVdlRY5DyAilGO2+p3DwQo1hZydA/PP31G0+Uq6C
	71R/dlnOKsNAsHYfTrkGBswaT7OG+JdhTuC4hKrz9bb7ncXIPD5DVRAZC3lzLzOpyDt6cOSBzAMsg
	0xDtpeFSSe7J0SgnSmp/e1yOLJiFd9FOUExOVifzIfv5mcbFFZ6SeGt1wOyLzXhfU50rzJAbxAQrZ
	NJWvsIA+s7suLfiAlmvynZL8x2bs2LJTI5VGQZH+9fpJ89rMk9+zQol/yC+keIbwRxreiNrT+ncPd
	DqFzr7sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyADG-0000000DW5I-2AIl;
	Fri, 28 Mar 2025 13:57:34 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9na-0000000DQhn-3HVx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:03 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so3544555a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168661; x=1743773461; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcW1mWBfWGvNcEl9sJWjMnkVLrjIE7eEENFwEaEA4Go=;
        b=zNjzlrj/EGoim1VJGqozhpldTr4B9lPGiJMXhrm+S/JB7GlgB4Q7v4ZL8MLWaY2HMU
         pblqBudWGYAQHTOy2/wPi3wKo86FoFgIJZEkOm40oB9Zgrt3LAaxELK3d67kQL4Cb56+
         w1rq2JglkQBjZ6qbMV3jZHXGEKRdP2U8d5L/UbnK1PVxEZHmJdmSnzCIjdqXXq7Q+XJl
         gvigoyOkmmiXW4hd3bgRkeVKLdskh/6zTswmMd2Y4uyxu615+icx/tp7e6ywXlJYE2lq
         agCXxLZ7qD1QYtjmwdN1i5Sxos6Gfj5k1zWPC4CRPR2dEAXaU5CaO0adBSMFe+xS9f+M
         e0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168661; x=1743773461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcW1mWBfWGvNcEl9sJWjMnkVLrjIE7eEENFwEaEA4Go=;
        b=eHNZJTBVKyu/qk/uLtWmR9HDIEiI1pePyQhLM3bYkmLy2+J9CwjbfhjldBv9HakR26
         kpeimfnFgZRT27M/FSyBBuoQQwD1CNfbh5HZHSAji7F5J+Px/uRBFVtrCN0EmagxgkM4
         XwzcIZ3L8UQidwkTBk94rfvMWhb9ZxcsX+c36tEVEiRy90Kux4c6/GY6UhCmF5N+lnPC
         wkJmYI2kTmUBAaTmDELYu9+GgYeZu7JVTUbCGYzp5sAuYWqz8TiOdh8KIUlWDKl2yZfA
         Zk40C3Hl7ZLI4vRC/Nc08qcacUUzeOl+5Z8C3/L0OcPNHkAtY1b4doxf05dvoaI7qKZE
         ZVFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0FgbCP1pX1pxnKoUKchs9wbGVT0XGHooO73/4DB+MZm6VeCn0XIsJVcX+iCtLBn+HLRQWPcYL9BYmxlH5+/co@lists.infradead.org
X-Gm-Message-State: AOJu0Yye6ouxHQ/V9Q+9DreakalNZsI+CefWz7fD4LAGNAnvSx3AThc1
	VuC2RIccAQjzUvw/vBVQucUDgrrXzS2KQPxHZr0l1ty6zZHQBZ8qSEfjcl/PeTQ=
X-Gm-Gg: ASbGncuByJvSs+p5vjT8twRMLfnFNgRIPcJm5y65tRkr98TY9EuJ5A7iO/wOEUwY53w
	Mmf/QPKbJYjmvEg9yuqcqHT4YgYRrYSo6oOboF5HSYlS5vHurWT3bE/bJf5OneR+DU4zfKOFYdD
	ufodLGtTw0Ir7GaWQhLEhzitnf2dHlYsGMPP3LYxMfyClxYCm4nfa1VqFs7YUEzLJ/wc1NRYeKF
	nujDAwE5aKdAnxBf8l13ep3xZ3nnGXFhluZSB8CUnX80zhTRTVWJ+ek2rVU9ZDEMSRyRrYKTH4n
	QAzG3u/AM+n+AFQpQi3Mjt9tw3uE5wC2s3AWwd73cDVr2RD5sBfxJjHEZJgv/DTnSJuzbI37jfj
	OqAVT8VpsxCn0zEV9fk/4vPAQvOcW
X-Google-Smtp-Source: AGHT+IFoyjCdv6rnlWEUloFhpOSmsaTb0sh0cSCSk2tmwmMxrnGI+F5Pjs7eau9btRCy52IBbxAE/A==
X-Received: by 2002:a05:6402:1d4a:b0:5e5:ba77:6f24 with SMTP id 4fb4d7f45d1cf-5ed8e59e28cmr8076694a12.16.1743168660911;
        Fri, 28 Mar 2025 06:31:00 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:00 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:00 +0000
Subject: [PATCH v2 14/32] mfd: sec: s2dos05/s2mpu05: use explicit regmap
 config and drop default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-14-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063102_819188_F34AE70B 
X-CRM114-Status: GOOD (  18.49  )
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

When support for PMICs without compatibles was removed in
commit f736d2c0caa8 ("mfd: sec: Remove PMICs without compatibles"),
sec_regmap_config effectively became an orphan, because S5M8763X was
the only user left of it before removal, using the default: case of the
switch statement.

When s2dos05 and s2mpu05 support was added in commit bf231e5febcf
("mfd: sec-core: Add support for the Samsung s2dos05") and commit
ed33479b7beb ("mfd: sec: Add support for S2MPU05 PMIC"), they ended up
using that orphaned regmap_config in a non-obvious way due to the
default: case of the device type switch matching statement taking
effect again.

To make things more obvious, and to help the reader of this code while
reasoning about what the intention might be here, and to ensure future
additions to support new devices in this driver don't forget to add a
regmap config, add an explicit regmap config for these two devices, and
completely remove the generic regmap config as it becomes an orphan
again that shouldn't be used by any device.

Note that this commit doesn't fix the issue that s2dos05_regmap_config
ands2mpu05_regmap_config really are incomplete, but I have no
documentation on them.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* squash two previously separate patches into this one (Krzysztof)
---
 drivers/mfd/sec-i2c.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index a107a9c1e760f90fcb59a9944b74e9a39a0d946c..81f90003eea2a40f2caaebb49fc9494b89370e7f 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -61,7 +61,7 @@ static bool s2mpu02_volatile(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_config sec_regmap_config = {
+static const struct regmap_config s2dos05_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 };
@@ -120,6 +120,11 @@ static const struct regmap_config s2mpu02_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static const struct regmap_config s2mpu05_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
 static const struct regmap_config s5m8767_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -138,6 +143,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	device_type = (unsigned long)of_device_get_match_data(&client->dev);
 
 	switch (device_type) {
+	case S2DOS05:
+		regmap = &s2dos05_regmap_config;
+		break;
 	case S2MPA01:
 		regmap = &s2mpa01_regmap_config;
 		break;
@@ -156,12 +164,16 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S2MPU05:
+		regmap = &s2mpu05_regmap_config;
+		break;
 	case S5M8767X:
 		regmap = &s5m8767_regmap_config;
 		break;
 	default:
-		regmap = &sec_regmap_config;
-		break;
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported device type %lu\n",
+				     device_type);
 	}
 
 	regmap_pmic = devm_regmap_init_i2c(client, regmap);

-- 
2.49.0.472.ge94155a9ec-goog


