Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06E2C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 20:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pyl0f2+uV4prp2eIcLZG8qEi7jejYsdgoESG840i2SE=; b=fBqrG18SwxSZ5wRF3OkZIjoweV
	vQ37LCBgwUqfn19H0qP7h7GUkxDKpFmrjbkgBODl7Mq7pAhcTPGYfXKDuJ4tYclly38/HdCH2aOfH
	0ha6kWGnv/pTYmjKMqk4Y4+zf9FbsgSC1LFAXLYI7LjCTwNi5kiYlBSqkZHIfMakYjqjZSgdZKz1H
	rqNvciEQSVq97RysW0vdlNzJrEINc3XWvRvQmDVTfi/5Sk3qIdIRs85/CebczOoV/mTtyuuTe89WZ
	hQwjgkov7/WzWJDf1cjAXYNa9ij1V5x7ZZa4GlGgvvVLe4fpfYzl1gQuVwn0UjVB0OKhD2eAzjEne
	QWcToVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cVA-00000008Vu2-2WFp;
	Wed, 09 Apr 2025 20:58:28 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cAz-00000008ScU-0LWX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:38 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac2aeada833so29821766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231056; x=1744835856; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pyl0f2+uV4prp2eIcLZG8qEi7jejYsdgoESG840i2SE=;
        b=FmAI4NP/SpP8xoGEh7LFb5WE1lJaDzbaSZ6xWvBZxsTBA7dHL3+yDQOrZ0uCM7h/nh
         0EmhKpzvbbl9y93Dxz+QwyZmK5nj/zh8wBjPwEarpzR3FUqWndEU9lN8pkOr55JfnUFY
         63MWUnKcqvS/JcJAG3yq04jP7LaI5+oEREI2a1SOM2Id3MfZ+tNWGwVbr98Q9+vktmec
         KVPC1xHhCa1lw40jdoXwZ8CAUm+jayMfnPT7c8ID9gudqw3bs34uvAyV5vkFmO4dCkX+
         RSMqER0BzVMGQvjhxJpxGNS+41Cloo27PjrVE6QsBSeNJ15y5gRQfW4Sh81YUNcql5fG
         Zi2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231056; x=1744835856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pyl0f2+uV4prp2eIcLZG8qEi7jejYsdgoESG840i2SE=;
        b=MU07t0ltwDDAK60rY2yHNxqXLx6bJjOJE57TUkoMBi1jxsTYkOrcUabqIF3oxEIEWZ
         UAqF+BcSNRURJvD2qBnWLibG199CCjUQOrRKMFL0MjresEpIhbGCNLyp1sYpV0cAzkDX
         xoXH42Wytl5QoQ6AqhTbJ7itc40S/TKMuNYeBGNrgjrR37sIdtz8wQs2MTStFVOBh9ZR
         RiGwjqyQGZjy7EPpHrESGQqpP6x4DpBY6gQtLbtjxk1qI4Z6hgubXoMD91oyEGg5JSX4
         TNVdXCXHbOIu0usRf8u1ClYxW8WJFWqLFS+efHj5WJHqrZ6l22KOaS3jIYxKoHjG99xe
         GCtg==
X-Forwarded-Encrypted: i=1; AJvYcCXJRUGfZDKAl2ERE9dnXpsB+E3vtHg6TBSl4rGlx8ZmQIJ6Mcrf/yZXzkwQQq2TtUlvE6rT3FsDjiuxRi5rd7XV@lists.infradead.org
X-Gm-Message-State: AOJu0YxTzwjWKQwjGXJv5jpZRy4gGWiNsufqImqG+6Di21kJagHdyT6N
	xFlQiqLjTWs/LHOPTSeRluSa4irI2cZU67Hhmr/vLyyg2BP/locUKgSX+wZXZZg=
X-Gm-Gg: ASbGncsUuzp+6kLiH60ULOIE917Vd+1hXYeyvHg5y3n/RoebZRLy+o0wTRJo5CpOcmV
	dk2PmcdgP00i6xmr5n4rIn5hKC1S2lyzzY/nyMr863mHbmfe3ZcJm/Myl6GU4HxEHsbrRKr8scq
	mSzNMJHU3DRGgJQcEzf4yEnkR4jkqm05nFJ3fvpn8KYdb/V7GawGBheieD6bfOdNvTtp308UX3T
	tlTontP7Ij0wldvd75e8AgUTsmxDIlRqxQqzzeS9JDaIMSQ3fJRgKhfWWqMlbNNY4IK7RAqL4It
	AwqD1HngIsmvU72N5YA4tKtq+LWKlIJoZOyrUa+NlgAgoEku3igQ1EZKU/gjNCXlSOoIJAMVEZA
	d70Av/F5qfzEnSpcoooFVxxEmR7SJoWA/eZj/vQ==
X-Google-Smtp-Source: AGHT+IH59O+fzF/X8FnUuo3I290X8VkEPvKxapspcX/vEqYKSvjWcafmZVH9OY5PbPtNmVJlOQOSrw==
X-Received: by 2002:a17:906:4fcd:b0:abf:48df:bf07 with SMTP id a640c23a62f3a-acabc24ab2bmr15279266b.15.1744231055680;
        Wed, 09 Apr 2025 13:37:35 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:35 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:33 +0100
Subject: [PATCH v4 12/32] mfd: sec-i2c: Sort struct of_device_id entries
 and the device type switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-12-d66d5f39b6bf@linaro.org>
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
X-CRM114-CacheID: sfid-20250409_133737_118321_42E19AD8 
X-CRM114-Status: GOOD (  12.69  )
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
2.49.0.604.gff1f9ca942-goog


