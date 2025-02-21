Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD5CC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 20:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lmr3YaTLm2TMny3Haqb4MzDdaWsOi7W4RHKlgDAQeoc=; b=JI8LdTipSK2Q+T5Mp0i5bXayPA
	UyqcHexTZUw4eBfwRRBSasQ/Ia9BOWDtIJBzLCbuYvyNI4WKGhYEYdtkJbDxsWFJt9PQkn5mNR5fv
	ZKSfRZiW+QzYyGWc7c9LIH7nnL8wE+z51zpc+xMjZZ3tvKZrMLNaYk45cxLtTSUhNYWf1/YhaCHwt
	S02S0Ey6aMOR0Ns/kIk0osFUbr/w8bWX1vnaXgHo2YjjYlyT6Wbdz3Zzlc4r7pgnPbcSfX+z8ngmP
	MAfZdZi7XC4Yh1MTTEdtYEXAIAJGB5YaGvsnm9MWLc9gJbfh/33yFeeea5aM/F62D9F3e9cmoE+td
	6tHIJQGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZZ4-00000006m9X-2VHN;
	Fri, 21 Feb 2025 20:24:02 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZRx-00000006kmt-0wtl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 20:16:42 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so4599887a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 12:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169000; x=1740773800; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lmr3YaTLm2TMny3Haqb4MzDdaWsOi7W4RHKlgDAQeoc=;
        b=WW6aQbu6n9AhYy7s+iP+5jf9Vg5gE4AWdnSi0Ho+oyYpCA/Q3iIuOpkqKaoMlUuvf2
         H28mTm/HJNZNfBRfXX4TQAaDT6kl5gRWROB9Lp/E+YASkjqmVuXNSaxX54gyZBESOuMY
         DjBO7fLLsC8wf7ZXM5QZrJuBYxevK/132rCSD2IlksO8wAdywHI0PDg0tp+o9Ufxo8bn
         fn+MXOmS87a6qnMvRe34CkVcoTKd3cXovDdIOZI3ceoSpDeYizXXnCQXuNstdwHly09t
         qpDHIAfvqhUHxPjKeXSBiPec+coXOt2aI297jrVuCLn54wZY+wNJD+cF34xANaoGcsfs
         WLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169000; x=1740773800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lmr3YaTLm2TMny3Haqb4MzDdaWsOi7W4RHKlgDAQeoc=;
        b=b8+uIFCocaww9iAxRn7TybpDHBJsywFUt2ssE6QPbN9XbCfypJR7iNdy7k9d1LN20Z
         jpLFTnypuwO29vPbe1cr2cLj0mx+dezdBdYdYVRaXXrPppyYvNde+xMfCgW8txtjOCoN
         SStgcuMOUOuDwo4F6UVoFq2IPV3skx47Uvht9aToWWtjQm+3pco1O9sjjUFMtizTCUNn
         w19oOSjiEoxJub5qTTQFRBaLb4aLpKNcgsvzAnwwu7ap0zmLdXdAVo6xgraYyNLWUWTH
         /yia5s8pBBNeUhsnLqqyWo2lbAqo6ps4VBkGAxedHzYlWCMMba/Cl1a3zalHtIV3CbQC
         BpOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV0eVObzrJTK1qnYFzT2XxLSq3yvbPq5rCqlvx3K847fXf6bZXFHgI1+GogsjXcAyqy283Sib8RLl+OFV7+/l+@lists.infradead.org
X-Gm-Message-State: AOJu0YzJeKqsX8Zoja2HA03BGW0wARZ3EkiRC6ngu0KH+tA5oVVSTUBY
	o8VuKSSRAmyQMIpP6zIWt/lGt0nxdKXK5D9JYaUU56Lb4eLmgZ3Z
X-Gm-Gg: ASbGnctANLjibVVbG5hQgmGbHfcv7rM5T4dXebMNtxpQaMf6M6d8ozKqD5jPSLBmNmG
	19hyKgIPl2Zp+otEazsUeBwaX6/4QwPwrcZxT5HYd9ca3oJK5+DpX0FrjaO5enTQ8e3qQ8v28M8
	fk804r9u9M8bBEMy5AQREjZ77RTZ6lKA9RcRLpazU//MBYfioDCJrStFLr9EPhlusJZuXUE+UJy
	SDkEIFynj9MmoAbIeZFRBR6dfZ/VPXPSYGfZq+zP9j7Z/aLkLQx8bUEdOK+KuH7cf8O0QmLU8wB
	fBai9Z1BCLHImtSx9f/ZeuM+c0w1INpY8kEIRqvdrnhoXf9LlgIj5tBwszBKhsQzMaUBYz2Y
X-Google-Smtp-Source: AGHT+IEeKOS8OKCsI/ty3zePkmJDpCNDVO0risKPCTuABCL5ejXvmTQrB5HccUNC0YkgxKNgnt/D6w==
X-Received: by 2002:a05:6402:430f:b0:5e0:4710:5f47 with SMTP id 4fb4d7f45d1cf-5e0b7243e16mr4226037a12.23.1740168999708;
        Fri, 21 Feb 2025 12:16:39 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f70sm14127594a12.12.2025.02.21.12.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:16:39 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 21 Feb 2025 21:16:26 +0100
Subject: [PATCH v5 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-bcm59054-v5-4-065f516a9042@gmail.com>
References: <20250221-bcm59054-v5-0-065f516a9042@gmail.com>
In-Reply-To: <20250221-bcm59054-v5-0-065f516a9042@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740168989; l=2626;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=t1GHjMmU0ognTEYJZcAOAhbfDin+9ghT43s1MEvfcck=;
 b=Y3l+sREpXyFYOU8qs/T6Jp2nukNDFnsJJtx5eMGBfeDRnFSBW6I2OHkxh2gNxpgPPV/82Dz/7
 +VR6B90B4UmBQdIdzfpNQgbeI3CeK/WyKJveT4bxIUtYf5vJKq8fNRy
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_121641_272800_74C16F66 
X-CRM114-Status: GOOD (  18.61  )
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

The BCM59054 is another chip from the BCM590xx line of PMUs,
commonly used on devices with the BCM21664/BCM23550 chipsets.

Prepare the BCM590xx driver for supporting other devices by
adding a "bcm590xx_dev_type" enum with supported chip types
and store it in the MFD data struct as "dev_type". Then, add
a DT compatible for the BCM59054, and provide the device type
as OF match data.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Rewrite commit message description
- Rename "device_type" member to "dev_type"
- Drop awkward line break to fit function call
- Add PMU ID/revision parsing function

Changes in v3:
- Fix compilation warning about device_type pointer cast type
- Name the device types enum and use it as the type in the MFD struct
---
 drivers/mfd/bcm590xx.c       | 5 ++++-
 include/linux/mfd/bcm590xx.h | 8 ++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 8b56786d85d0182acf91da203b5f943556c08422..632eb57d0d9e9f20f801fac22eae21b3c46cefd5 100644
--- a/drivers/mfd/bcm590xx.c
+++ b/drivers/mfd/bcm590xx.c
@@ -50,6 +50,8 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 	bcm590xx->dev = &i2c_pri->dev;
 	bcm590xx->i2c_pri = i2c_pri;
 
+	bcm590xx->dev_type = (uintptr_t) of_device_get_match_data(bcm590xx->dev);
+
 	bcm590xx->regmap_pri = devm_regmap_init_i2c(i2c_pri,
 						 &bcm590xx_regmap_config_pri);
 	if (IS_ERR(bcm590xx->regmap_pri)) {
@@ -91,7 +93,8 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 }
 
 static const struct of_device_id bcm590xx_of_match[] = {
-	{ .compatible = "brcm,bcm59056" },
+	{ .compatible = "brcm,bcm59054", .data = (void *)BCM59054_TYPE },
+	{ .compatible = "brcm,bcm59056", .data = (void *)BCM59056_TYPE },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bcm590xx_of_match);
diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
index 6b8791da6119b22514447bf1572238b71c8b0e97..83e62b5a6c45805bc2acc88ccc7119d86f9ac424 100644
--- a/include/linux/mfd/bcm590xx.h
+++ b/include/linux/mfd/bcm590xx.h
@@ -13,12 +13,20 @@
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 
+/* device types */
+enum bcm590xx_dev_type {
+	BCM59054_TYPE,
+	BCM59056_TYPE,
+	BCM590XX_TYPE_MAX,
+};
+
 /* max register address */
 #define BCM590XX_MAX_REGISTER_PRI	0xe7
 #define BCM590XX_MAX_REGISTER_SEC	0xf0
 
 struct bcm590xx {
 	struct device *dev;
+	enum bcm590xx_dev_type dev_type;
 	struct i2c_client *i2c_pri;
 	struct i2c_client *i2c_sec;
 	struct regmap *regmap_pri;

-- 
2.48.1


