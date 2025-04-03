Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB2FC3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VoGJVSU0pPXxfOhXBJG1TDUozXlWar2eJ++GWdYkqc=; b=F2nBi/KsOkBHt2lK3Kq2qMMIEI
	lf6f0GmpNFhsC/39fZcVPyafUa/4iXfawQCzxXQrLi9Cm3FdH7OfhEclgGv8rmOzgB8aq8xWv/veX
	sp3HHpZ0Zsei1qe5gMeVSHX+GLne/2a9/BDCLVcMYlb9C2/COlr51wHLHGYmlMQ8xeNGlVDtK7iGA
	tS3AvP+9rlj9miL5XTHc1nbLOAJLl4wgzt9rsPi1R60Os6j48ouzgUVSbgs+d1vnFInmkUGtZ/qzI
	RiZRz520PNWGhHAFTWmaW1gEPT46rkQQi+ObJJIX3p358HDNjmXrzUv/rZM3IREmqf3mPaXfZNzH/
	kc2Ph+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Gnw-00000008Occ-1HiX;
	Thu, 03 Apr 2025 09:24:08 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPm-00000008JkO-0pPk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:11 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso1131656a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670748; x=1744275548; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VoGJVSU0pPXxfOhXBJG1TDUozXlWar2eJ++GWdYkqc=;
        b=m1ZAYSEFySTQf2OjgrFzMB0zP2bElPdIh+CfpTpIUhJnh8irebLyDszY2NiDUorf6c
         qch/bl1wO76R6WU2vcneTCxEUbWJXbkJCzBAUZPXqREPYR54JWx/ePiXxRk6Ob968DIa
         GUYh7u4Wmr6x/PL6BjBfhoYtItGAgv7OYknolURhJ+RFeFcYHdBR6C3jaBGhy7d2kGjD
         w3x15m9SPq8M+HECOHAwysmr5a/zoYLuWdCFWw72PsjMzBlxnj8SBntaUYzcjG+xs5Fp
         +zp/SuJRNJ2QjIZSgyGKeTT9IJ2Sdkezl7Qgdlad/bXGzSS97H8izFzZuNnoSADBEy9u
         WVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670748; x=1744275548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VoGJVSU0pPXxfOhXBJG1TDUozXlWar2eJ++GWdYkqc=;
        b=Q2aPrOjsJgEP+X5LQ3se+5GQ5bfrA+VRL187ypPO+BbBVO0PKbq/rK8X7zoUB6A213
         NTJe/32kavorYo6Zs/UKyn1L31WKi6Cm+NOEJVcVWqZ5KbhahdevpBXD7LlsfRV2vxnD
         nDHn9d3jO0DPVMaKvzjiSQ+jC2BO6ffn2Yao9LEcJ1nAtlHZSkOQkFpoMaeEF6I0VGrp
         TpqGzpNp7P2pLtKWzXGe2mz0sDYhsNbAEmshz4HVm3AYExvr/4JI6dQrxBMdXFSUH809
         lv+gUlN7WTRe+r4ItoADlU8FY5GFqIi917ZhKWLtxIMZANPsJ8JDdYyAX174wXB3BAej
         a+aw==
X-Forwarded-Encrypted: i=1; AJvYcCXGgxpd0SPEZFBeX58JcurQjvbvUbT8+2bNKVwkA8Dwjla2AeayAiwZvrdekvbd9o1dtiryIjFzRgbXDSxIapNr@lists.infradead.org
X-Gm-Message-State: AOJu0YzMXT7sbP/IEHOpG3mPoMMuDEcWIgEXqERxCnURb1TEmfCIvGAh
	mfyrCrpYmjC/uvr3b/E6+PhilCYgLX45TQtlRRRub7YNS+gUjwnF+ybUfEZKnE0=
X-Gm-Gg: ASbGncvqIejkv/pYWwNiKvhf2qHOqlocEr9QBlSj6ROnIUm/pn48/HVoqM2H0+Ulphr
	PXR2MxASlVyqNh3xZC7Z0LWg3lhJ3NQMaqmUvrc4HLdUiK0yJ24enDJbkn9vsd87FGVnEYydOSQ
	UsK5vDCd50qm53jm8Pk11Z3Cl/9t75neyVxmHI8pJY18I30rmMTS1GCg3FlyxcW+xXqTocfnM1E
	NMgz/m+TZiWPyXyS5r2WEPDLOuLntvTkxivkdos02EpDrAC7YVWNp6QQ7u+gbp12vsKfQ3P3ELy
	TK72NX6Pw3Xp0d54wB57qyomeeszL/uRDh1+j2u2crcPBc+HE9mxtbijZzdlIqo/avjFpFWFUnN
	G/1UMb6IXoRMTlro2qP51y+XdxUPF
X-Google-Smtp-Source: AGHT+IHqXiYq96qJtZ3yqV0dm+q8a7Y9OXDNzTpX/U8kjT+jFNIA0/WaLQE/aqJwj+78Op+QK5nrPQ==
X-Received: by 2002:a05:6402:3495:b0:5e4:9348:72c3 with SMTP id 4fb4d7f45d1cf-5f04eacb1a8mr4769024a12.10.1743670748486;
        Thu, 03 Apr 2025 01:59:08 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:05 +0100
Subject: [PATCH v3 13/32] mfd: sec: use dev_err_probe() where appropriate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-13-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015910_231090_B96DE54B 
X-CRM114-Status: GOOD (  13.95  )
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

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

While at it, harmonise some error messages.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c |  6 +++---
 drivers/mfd/sec-i2c.c    | 10 +++-------
 drivers/mfd/sec-irq.c    | 14 +++++++-------
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 1a6f14dda825adeaeee1a677459c7399c144d553..f4c606c5ee5a809a106b13e947464f35a926b199 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -229,9 +229,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		num_sec_devs = ARRAY_SIZE(s2mpu05_devs);
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unsupported device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
 				   NULL, 0, NULL);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 966d116dd781ac6ab63453f641b2a68bba3945a9..a107a9c1e760f90fcb59a9944b74e9a39a0d946c 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -134,7 +134,6 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	const struct regmap_config *regmap;
 	unsigned long device_type;
 	struct regmap *regmap_pmic;
-	int ret;
 
 	device_type = (unsigned long)of_device_get_match_data(&client->dev);
 
@@ -166,12 +165,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	}
 
 	regmap_pmic = devm_regmap_init_i2c(client, regmap);
-	if (IS_ERR(regmap_pmic)) {
-		ret = PTR_ERR(regmap_pmic);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(regmap_pmic))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
+				     "regmap init failed\n");
 
 	return sec_pmic_probe(&client->dev, device_type, client->irq,
 			      regmap_pmic, client);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index aa467e488fb5ef79d5bc7110e1ba7c26fcfa9892..9f0173c48b0c8186a2cdc1d2179db081ef2e09c4 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -487,18 +487,18 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		sec_irq_chip = &s2mpu05_irq_chip;
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unknown device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0) {
-		dev_err(sec_pmic->dev, "Failed to register IRQ chip: %d\n", ret);
-		return ret;
-	}
+	if (ret != 0)
+		return dev_err_probe(sec_pmic->dev, ret,
+				     "Failed to add %s IRQ chip\n",
+				     sec_irq_chip->name);
 
 	/*
 	 * The rtc-s5m driver requests S2MPS14_IRQ_RTCA0 also for S2MPS11

-- 
2.49.0.472.ge94155a9ec-goog


