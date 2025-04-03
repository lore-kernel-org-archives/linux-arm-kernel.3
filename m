Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE936C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pB7gFyupIzWsX2vSOEGK7q4UbjZdy1MRwKTSd+TQnVk=; b=Dqxa/+8sHmGeD+969dClXgfjyX
	pueba3Mwxg2d1TyOvPVnzuznfWSc9g4l0hTPTFE8/RJCF24axLjtklljxHjKGMD8PPa0rqQDQCPbD
	KNj36+dztiHK1//YwVdOO6IxmWWLipKz76e25pxMO5+V4u1XTIRD9Mi3JLooYk7D7EE/xeA6S/2Wu
	Nq2UBxse7XzO6HAIGq52bivXCNJwX2xy3kOcinoYZhu6hT2k2ZhX/UznnjFoW9kT3FpryD+h7Jtcj
	vBV+OTVXm4tPIJeiOoS8AQZIQN/f8+tMc606kp0XCcW+Sex1OIiEzSbkAcKO7iMhzwtfudoDc6xhS
	gNYnKjFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GmB-00000008OLl-1xaA;
	Thu, 03 Apr 2025 09:22:19 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPl-00000008JkG-1v91
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:10 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so100899166b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670748; x=1744275548; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pB7gFyupIzWsX2vSOEGK7q4UbjZdy1MRwKTSd+TQnVk=;
        b=s/Nu5Ym6BM5fT7kOaGoxFzrBBLhGJPXeJ5IEZ+fMZhuvPzRYznmipUx8Q9RR67kD44
         GdlC705eR02W2OWmgZOj3RaPu2o9ZCU5MgTN4M7Ds93Ga2Wjx0dLetuTrFHSUzrbwe+z
         UoiXK/uj4n7TKrhoKTy4bM0zCbh0HeXryruq388O1RlXs/snkzF4O6uCogZqyB6xJYEK
         n9IrO2Oj652UsyytroViMSQk1D4ls2j2nGXCA0goRuSJLd5/HcwwbKQl9AWpY6SlFj8C
         E0xZP0oEfNYBjDsu38R9hsCgZUM35D6MqUQHxES2Id1aiPlpeDn9kAqFFxySnoHie67M
         zY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670748; x=1744275548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pB7gFyupIzWsX2vSOEGK7q4UbjZdy1MRwKTSd+TQnVk=;
        b=F6NLMCbkE6NzfCLn+CUNrbsVdEd7RhqpCex95VHya4oeHcyJgYxIZKSxtfAL7p/TZS
         KwdMhyK2d3sJ9m7WXuhwlcZFtFrpQvboyWN1GURC5/6I1BLlX01QpM5GFdk2MfzDbdmp
         R4jBZVp+jmI5EZ8rRNe31LEIeh+FOo+kBhsE6ezkVImuu8iu5ckmfuxerLR0pMQGx0pu
         OzjasNNho+UwTXjOgDCYFLbSO0/NRn1fGP/ZNgIrs6icDx1GzRM/RJaSNlNTLerhZph+
         eY6bDDnCyJ5e8nbjTWs8cKMCb+Tj7HHnVOX6bhHDe8AI+TZoF2rKJS5QUqA39XbQ6trn
         NUZg==
X-Forwarded-Encrypted: i=1; AJvYcCX9FIdAtdc1fqvRGYVpng0tlCGxz/d+ajsAeE0mJTOYKMIa6X1TxKEEx0fjUovToNAHMKcu51mU5VjPMsxWZgpn@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ1XWck7YXPTk7Ht9mFagDI9if1nTVOjuVMvjgyxyw48YCwRJI
	PHs9zEqPYsf4cvCPZsXRze1soEutrfGgqF0B2CkZkjPPtZJ7tPVREM81nb/Yens=
X-Gm-Gg: ASbGncsExhs06KM2gNt9D0q1kKD689HMT8v4n/dwp5WBd1fWyX+mOHf060ik5Rx6Fc+
	m5n7etEnEhgMGNOg5CWDSHrQraVTJ6dEMftagiGcElRSBc99LRXRSp15I/G/DpbO5m9dEhFqFGJ
	bZrjkM3XfQOAjIqaNFvyORo5X6y2mkGPQZYf2pkhxZ70Yi61TTqCcPCPKDpePmajc8pqdgY0Yh1
	A9C5gwJxIDv378NZb+u1n7tuaX87nDi3NXHTFawvg55QcIeEogb6GMbmtlKFCYmsZ0WyiD7nIXy
	Q/Cn+8/PNxqf88aBlVWV1kKQgGAYCT/22I5jEuiIYywx0cn6TBGQn66lCNR1eSOvaV6WOAhl0RG
	LwYQGwjunLmUPvp8mphU6IwrKtYf13/g5rbW/EkM=
X-Google-Smtp-Source: AGHT+IHJBM6wgjWYZps6ri5VFfxoUgvh5j0PdsJYHzhGp7CXuLgrnxXEuXRPTmCkvL8y435madc/FA==
X-Received: by 2002:a17:907:9708:b0:ac1:fab4:a83 with SMTP id a640c23a62f3a-ac738a50828mr1837746066b.25.1743670747866;
        Thu, 03 Apr 2025 01:59:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:04 +0100
Subject: [PATCH v3 12/32] mfd: sec: sort struct of_device_id entries and
 the device type switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-12-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015909_494153_881002FB 
X-CRM114-Status: GOOD (  12.88  )
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

Sort struct of_device_id entries and the device type switch in _probe()
alphabetically, which makes it easier to find the right place where to
insert new entries in the future.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 8e3a365ff3e5533e27d94fa8a15dbfa639518a5f..966d116dd781ac6ab63453f641b2a68bba3945a9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -154,12 +154,12 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPS15X:
 		regmap = &s2mps15_regmap_config;
 		break;
-	case S5M8767X:
-		regmap = &s5m8767_regmap_config;
-		break;
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S5M8767X:
+		regmap = &s5m8767_regmap_config;
+		break;
 	default:
 		regmap = &sec_regmap_config;
 		break;
@@ -184,11 +184,11 @@ static void sec_pmic_i2c_shutdown(struct i2c_client *i2c)
 
 static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	{
-		.compatible = "samsung,s5m8767-pmic",
-		.data = (void *)S5M8767X,
-	}, {
 		.compatible = "samsung,s2dos05",
 		.data = (void *)S2DOS05,
+	}, {
+		.compatible = "samsung,s2mpa01-pmic",
+		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mps11-pmic",
 		.data = (void *)S2MPS11X,
@@ -201,15 +201,15 @@ static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	}, {
 		.compatible = "samsung,s2mps15-pmic",
 		.data = (void *)S2MPS15X,
-	}, {
-		.compatible = "samsung,s2mpa01-pmic",
-		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mpu02-pmic",
 		.data = (void *)S2MPU02,
 	}, {
 		.compatible = "samsung,s2mpu05-pmic",
 		.data = (void *)S2MPU05,
+	}, {
+		.compatible = "samsung,s5m8767-pmic",
+		.data = (void *)S5M8767X,
 	},
 	{ },
 };

-- 
2.49.0.472.ge94155a9ec-goog


