Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C3CC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1wrjOZ25AMEbbC5RG2Bl34Xp7n5uiu5eMlW7fz5kxo=; b=Q5ngj6aMDZOip80iAWYjaI6pqc
	7iweKXJU59QdwgQoSElnJnTd4cXlWXdJgc0Wz0PoOvEu/MSk7u+1hJi7TdfwJ4S3JxL6nu6z6OX3f
	KwsOA/7zndBKpmA51V1R+xo7JbSb2oTXDyEG9nTSVi9RLhCv3n+21rFk9SvecfwRdSeU95oV1LtD8
	O6ngc+K65CEOVRQjKIgSUiAw7+o4rZ4z+6m66hFqu9bmeXtzXhK56JtFwKmPlm0yphpN8yYrjj2mk
	avQa8NAgoODhayIvfoiNF3elMS5B8joZjGC6CzCupAOfqQ+C7Az8d0U0fKyF7rikq6hdbe2OR1ch9
	OFprnDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Us-0000000BIB5-0ibi;
	Fri, 28 Feb 2025 14:37:50 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11Z-0000000BBE1-1WFL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:35 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so3851943a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751652; x=1741356452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1wrjOZ25AMEbbC5RG2Bl34Xp7n5uiu5eMlW7fz5kxo=;
        b=YZeC+M6Me/z7YSpmh9nb/WtaJiOnbiAHHqVPoMHfTiaJimq7IBVjsEOfyOlzSke1vz
         CTJxfsyDshy97kPS1Sn5UpjhVWLxNp9CsQb9UR5faqU75+o6H9UHJxngthiTcq5kCrub
         N6Bzqt3DdKyWyqladqyu8NT4r/sdUyn4K5PmHhmJNoUtg19RMj7K+yidAJ6ej76WKjkY
         /F8xvTz/As3Ai4brgJBwXo8i0mzQE1qCsOPn5FCWD9J6rO7eXCTe01/jWwlkGOnWsJrq
         YBxVWbhAMcUjnmxcqNkQhkQcKEf4UG4nw9xC/RAlbJmyUOCqaNlPgPKCKKW+zsoBBWgI
         CdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751652; x=1741356452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1wrjOZ25AMEbbC5RG2Bl34Xp7n5uiu5eMlW7fz5kxo=;
        b=HYErFgP1N/1rssw6eM50QAKs1nApidOAoYGzqI0m+fWP2i5gQ4xzntfOFQbVvRcClF
         Vr1IDE2o/fE/gLKXpX4YxvKBBpMvTW7+pt2ZKu5LXiQ8kIUeXLQuWrE3adohtHP+BPVs
         6TR+ZyC38X/YRZJ08FSUdmjsspd2CS4WVHCGM88U3IVMvlIEQ8ggY81PNYtVOc9pRHiN
         1wTrA8MJReX5OYGVtuUOcAT43J/sYmp2J3feE802IyoJSUE60zQHE7x6QrcRGLW5js8P
         3wMu0U2cdv32Zf9M8ldTjtlVQb7d0d7w7jo+HB2xSuk9zlNMQscfykS/E5YcgEE5jelO
         7XDw==
X-Forwarded-Encrypted: i=1; AJvYcCWaMpoK5Bh/B18m+L/8EqShPh2V/UwFCDXURidTGqp9bRpZmoQZ8524J9GFWPdE+sBIcTE3An8VM5y3IGp+emA+@lists.infradead.org
X-Gm-Message-State: AOJu0YxnamG+og/D/Sib4dUvYCR+q8QETXiECPTzaFLkLI5GnmkeOMXL
	C3HhG1FQ8xWYvuwkyzEkg9EbtOx/65BQt/sA30xiCW/8HDkgTSukT7hfP3WB294=
X-Gm-Gg: ASbGnctPouDxOMRrbRW5mkMhLIFDennnWaGrNRre2hB2yD46UMiFxVuCXWrFKq57k+S
	EyfEyWqYR9dI8o2ZhaSY3zI9e2+QUxbb9BoqZrxtu4ohgWRvZ0SXOuvHmKMG3CaDvh2F52/uyEI
	XnhMMnesU4oonP1ippoZcNvH63EGvQms5360kxk0KFkXhiAe3hDCRzm/3JF1WBDelQBMI4V5j6+
	BF5E8nalIJu15VwMDbDVfEXH6VY4WdgqKl+NCG7gQp8iQn+qedprBftG7AcbL5HnzLPiqn/QngY
	XaLxHfLRSYhGwwUH7VjI+sunrLNgCt8wDpkBq7czcLD3JEXqJzCDbay8B6wNv2KrKzubjC5pkJr
	km9tku1VMFA==
X-Google-Smtp-Source: AGHT+IH8oBqlrNujitdioxAVXjdPgLAryRZxpXTnrztyLFYptlh+GD/CB4rbFiDA0RhEFxZK1lBu3A==
X-Received: by 2002:a05:6402:35c6:b0:5dc:c943:7b6 with SMTP id 4fb4d7f45d1cf-5e4d6ad4a6amr2900190a12.3.1740751651952;
        Fri, 28 Feb 2025 06:07:31 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:30 +0000
Subject: [PATCH 17/18] rtc: max77686: use dev_err_probe() where appropriate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-17-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_060733_398974_9A1ED663 
X-CRM114-Status: GOOD (  12.89  )
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

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-max77686.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 6b0d02b44c8097453f704cbec9f02580fb869ca3..69ea3ce75b5a5426d4a56b979773be71c4ee7562 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -704,10 +704,9 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 	}
 
 	info->regmap = dev_get_regmap(parent, NULL);
-	if (!info->regmap) {
-		dev_err(info->dev, "Failed to get rtc regmap\n");
-		return -ENODEV;
-	}
+	if (!info->regmap)
+		return dev_err_probe(info->dev, -ENODEV,
+				     "Failed to get rtc regmap\n");
 
 	if (info->drv_data->rtc_i2c_addr == MAX77686_INVALID_I2C_ADDR) {
 		info->rtc_regmap = info->regmap;
@@ -716,28 +715,24 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 
 	client = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
 					   info->drv_data->rtc_i2c_addr);
-	if (IS_ERR(client)) {
-		dev_err(info->dev, "Failed to allocate I2C device for RTC\n");
-		return PTR_ERR(client);
-	}
+	if (IS_ERR(client))
+		return dev_err_probe(info->dev, PTR_ERR(client),
+				     "Failed to allocate I2C device for RTC\n");
 
 	info->rtc_regmap = devm_regmap_init_i2c(client,
 						info->drv_data->regmap_config);
-	if (IS_ERR(info->rtc_regmap)) {
-		ret = PTR_ERR(info->rtc_regmap);
-		dev_err(info->dev, "Failed to allocate RTC regmap: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(info->rtc_regmap))
+		return dev_err_probe(info->dev, PTR_ERR(info->rtc_regmap),
+				     "Failed to allocate RTC regmap\n");
 
 add_rtc_irq:
 	ret = regmap_add_irq_chip(info->rtc_regmap, info->rtc_irq,
 				  IRQF_ONESHOT | IRQF_SHARED,
 				  0, info->drv_data->rtc_irq_chip,
 				  &info->rtc_irq_data);
-	if (ret < 0) {
-		dev_err(info->dev, "Failed to add RTC irq chip: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(info->dev, ret,
+				     "Failed to add RTC irq chip\n");
 
 	return 0;
 }

-- 
2.48.1.711.g2feabab25a-goog


