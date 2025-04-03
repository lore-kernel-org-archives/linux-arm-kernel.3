Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1C5C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcW1mWBfWGvNcEl9sJWjMnkVLrjIE7eEENFwEaEA4Go=; b=bw5WmpCR2gF/lUH8J1qhB/rL/w
	ZPK3NSQ2kXXLZLvEb2nn4kSGeIZe97Hp+hATnLur1bE2M7Z98dGvIHEAfayU/CLCeuEnzHBDvNZrz
	2osbb5M+SkzehKm2J2ddXbEYM27MCS31mrG0Hr5kbDc7IXu77RD3PK2wozEMfr+ha0NSUTkGSG1vA
	mGP0/LQCcS3EYy4Vd0qEnKA/eXqd7N3XhkWn/un3Zz945BRpr5LLMwzBmyJ1RRdZRdk2E5DZxdhrR
	PgyIzOUNU/2BSWiEjziF8mT+RkMIR5e5gwgS+EliLqcViE7zjVSUHMM/pnrgDe44paLADSRaR+Eb/
	q7Z/Eo7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Gpf-00000008P1o-2Tix;
	Thu, 03 Apr 2025 09:25:55 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPm-00000008Jkr-3opR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:12 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so123686366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670749; x=1744275549; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcW1mWBfWGvNcEl9sJWjMnkVLrjIE7eEENFwEaEA4Go=;
        b=l0xRBoGtiOKSksm49mQOsPYO1I1gJ2RCJ1UgcZlf3E/J/PD7ls1dh9q+L2NKzIf827
         VRooydmV8CrlWG36DHIOrel8nS/JJmmSODXfzErczx5BY4zpkRyEXduT4V2goUBwJsD9
         0Mqf754yufVvJ4xVgD2xYNOM6o9x96gQJ723H9mz6BY4V85NgW1UuvbJnIJ7Eoa00P/7
         KMyIbnRH/tfxmJyIRMbk7DrdyVLN/vBmh4yXjlupFLeLp1GV1y1XoiXbx7XSJDvDRBzT
         OQE1+wf8i3z4FyIdfnIHa3/IIjbRTUpMrA92R5cB0alAb/zRk/OrfhvHACMdm3hDsxd2
         x9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670749; x=1744275549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcW1mWBfWGvNcEl9sJWjMnkVLrjIE7eEENFwEaEA4Go=;
        b=LIyj+ddDQ61+beeOKwNA3jLpYHIeswLbDzJbBU3FOrtRbQwMRoE6f9z/yHn0SgC9IJ
         wokQ2jMhuqr2ny8KK+3bgzOLBlgUxC8TNxiTIFyBni4vtUPgAZsMTfxb1nSQuQ1FHt1m
         lXxgTTIMdub6AnuovumLjofWKw5Rg/H+FhwgTVBoo3XiFdUUR6BW67cHqnK8RUDWEA2R
         9CG5BpdQBrbTxBps4YddzfdQBK9FIZXymw7HkPXrdYilYA/AjWJ2QBqOdOiiYKiM5geH
         cE48vBl8LKSeJedgv0GDYSQs7kaU0GPwcFgj312rxP5bnlgXQURo3qA4HaD390VfknX1
         gsvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV64yXw1IdVVCHQLTNd3hPn5mcI6XuQa/9Y2jvBD0OkZ1L9GWrvx21e+j3TSFHaQflQP+1RSd6JwAy4gHs4nEy1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0PxhCuxgP9cjyY0s048hH/kWv4cqhDfCA303SjTzVxe741CsB
	MvS/CBf0DIJxCYqs/y1b61atB6KehDKjapeMGmdYip4bkqy2UfmM7DiRb2fnW54=
X-Gm-Gg: ASbGncsBAgzAk4+TGoXCutnSqhTdy8zNSM16ETs992TXGEWWiwyKQN40b8cT5SXNP/A
	WDhrN6fiHqi/RLCDaILq99kDdUeXImBE6HVVyCu+NCqrT9ngC5roufu6GUrNb3u3akT8dvMjuBl
	jyRB3GmyITRsmwxlMYXflzeK11ezQHIsxAWYhKGq8u4pETNjHn57ROU3jUUDQFh0kAo15HjUCxw
	snSJgAkUgUrBApUL+mntMtluqDBEg4XAS/ygP7ZgCc6huH6jOfkQvjIOtlKRjQ1u00W8DLl9fHU
	Ar0GHwyI0OrX88oQbz0SRqJfLKydnoKfTDGxnAddI92HcaBaj04E27NkXlj6JGAPPwfI4TLkXSS
	X7cVTOd6tMF7hYtn0W4SEkYa/E4kN
X-Google-Smtp-Source: AGHT+IGavhoPGzCabBNLBzdbL3jiat+xI87iDC+wiboHJiUvbmM/Wprhewp9oSPfUMvc9gVC8l54GA==
X-Received: by 2002:a17:907:6e87:b0:ac7:3911:35e7 with SMTP id a640c23a62f3a-ac7c0a97bb3mr143560466b.59.1743670749216;
        Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:06 +0100
Subject: [PATCH v3 14/32] mfd: sec: s2dos05/s2mpu05: use explicit regmap
 config and drop default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-14-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015910_948006_C204043D 
X-CRM114-Status: GOOD (  19.17  )
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


