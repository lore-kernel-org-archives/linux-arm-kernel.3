Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5057C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzewZfPwk4hJVFLYHiSrmH9jhhrX57HEhFAQDXSOGew=; b=dogA2xBBHjgWk7yEtmBTKL68N9
	B0dfNjedA0k4No/MFBFLRTj6BBa4Ld/lc3XQoFcsFIGsNeiwy02d2Zlq18ZAa+5SXeWgQfIQlVHUu
	PiEFvU6wbUmnYOBWkTR54A+PFkRrhj1azX5g8nGlbmxNPoUp68fXnW7srSxk6ZzufgszP9Fv50mig
	tIJwgblhB6Ugn7rLTto8/JQEvLQbMPJUOOJG+gcHwWnoaOebyYQIf8CUgr/ShetZUR5hNzdsfaer7
	fGaG/L50mw9QISRq9IYU44jvoiKR5F0Ya9mzfIvehrt8tLue+Fuvvqpg3eRvCl7hd7y1OqHbg8VBP
	7vYGyLDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cX2-00000008W93-1nqR;
	Wed, 09 Apr 2025 21:00:24 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cAz-00000008Scq-3BTB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:39 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abbd96bef64so16527266b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231056; x=1744835856; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzewZfPwk4hJVFLYHiSrmH9jhhrX57HEhFAQDXSOGew=;
        b=UF/tU+kxIRnyC0/MThBczgrc1BzEKXGZcrRguuykid12iNjvFXkEzyiLRjpZVjvELA
         EDnPYftBzX58i72xsO5eN0sITl5hocTTYJWSuMA//G1BTsTVG44SFPJBny9oC2vsqcYW
         GPK6xWjHkUICR6zOT2auM1GbltEElaVfI8qlIsCNqijTHdLL82Sfoby2Fp+GauPQm5Nx
         TE8BPTLeIJY7I+yf0ONyljdRFUyChsJRE9XoRjeVHZ5jVbhjOaDcCJMdOE0ZT8rCcu5j
         SsPkf6gqcmect19IFohJFm+8QCMsJ3twExorxtuBuAwJweOIZsQBERwCISFT1Bod/Ymb
         7d0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231056; x=1744835856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzewZfPwk4hJVFLYHiSrmH9jhhrX57HEhFAQDXSOGew=;
        b=THjSDaUSv+85v9Fc4d21rAQMlgDCDETCcL6Ux7OayQv0ebREp6aF5DX8O6PmVW028L
         Aafkhj9f1n/htOx8AARh4b2iZNamv9TbfbycFGEtinq9teGhF1B1kP602OzVpCRXFUro
         CfTLkgyvFImQ0oyW65yLrKhSWAzeFwY1oGlQKCJiekgMUThH87peX+A7AIW6KAAThCWb
         Sw65moGBzlODTN8hrQTe6tVEFm4xj2ZxS1vt99EsjhsAgodVNcw6jvnT0n9OZQofhB/e
         brkeVn8ImcGp9kD5mQEAkRsnsdjj7gcbjAstUaWYH1a1QnYPhSHvWvPn0GPa5T3S+2CF
         G+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVvqNHthG/z8hIxFd5ApHlMjToSpTeKofAWHQOGiJZf8CtoGxsEhuiATIxzg3OqombhqxGeFAwKp5Btzpfza0Lq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb2c6SX1L6eZi3XDnXBuPjHfA++yp9hFG37PoS5aifthSN2NyM
	GhCfQz2mi89InQtR9enStYfhibZIRw3o79P4DKVneVWjVMV6vhoiOVs3fy/3bUI=
X-Gm-Gg: ASbGnctbZkey85QA0lIL7mBhWM1y0onNPysmVYtwGM70gkUDZJYHbnlZjX9sY4gt/yy
	jPm3yLm0RZJ/wg4yjLWSyeTQqsUWqgmtNpP3cZ/Rn3MOn/ZGeroLJckP9TlDMPIkaaH9MWiFZV/
	CAUSO6GCMJxnITvcu5mbj0CKylT688kz8ODcH+PuobgkTp8xoHJh2Dhf+jMZUsq4k503acGxRka
	WN4hubzukpZMgqumoM/gxc0x6SIKuLowngkqN5oqb/ntx6Fv/iWOsUOAuEDQ6b7HVIglWaJCvL7
	VD5C7AnD6Hik2GhasCqraka48l12epcHojsNmEhqBLF2olqwyp5K5+HhE5wvNghoo7jojvrSSrb
	Ul94jDp2y0y9P/jyH5lnAGKBz73g=
X-Google-Smtp-Source: AGHT+IGpsT9IiqTJupkCVJCKwUjfYOLBHOS0zZILWuXu5C8V5rItHRHHHMylNW+J8A+q4dyb1hPgug==
X-Received: by 2002:a17:907:7d9f:b0:aca:a16f:ee8f with SMTP id a640c23a62f3a-acabd12b147mr8466766b.8.1744231056245;
        Wed, 09 Apr 2025 13:37:36 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:35 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:34 +0100
Subject: [PATCH v4 13/32] mfd: sec: Use dev_err_probe() where appropriate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-13-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_133737_797339_F9E22922 
X-CRM114-Status: GOOD (  13.18  )
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
index b75d7fe86253037b4b7256a4d8c089003d58bc44..340f5f14eba3fad3b25935803dd33e91f7ec6629 100644
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
2.49.0.604.gff1f9ca942-goog


