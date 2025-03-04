Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAE1C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXesqtK3A8i6ZSMFwP8n6Z6kZDUFNsTogrZxF0Gh9Ac=; b=xi1oKGolvWLoq65u8Uy4vY0Tjo
	SV3Sxreu4fFh9j9WXbDHcMpvAuqrSSVAziU7v6DUFthHKUMYbvjIU2Dj4kZtR31YuOmDxRpkmZdXB
	wdVPGE+8xuyT67uPfqFKh557S6y/EttfPI+uTjFN6/QrQrHZA0rHZG/als2XyIHxkt6P65j5KqMbf
	9pL5j6ghQPeND91OTxhj3Iy3c+P2cdFh6FPm9jNheDTR3CE2jc9FjvUH2UYBUd0bbRM+jpICbhP9+
	ebgvBFCDlL4ayiKrxG/BCA31wPc6BPy7AyjksbpcNgJrkJrpOjnJmPHXlw3PmtKffjysV0RfbSJSQ
	sT2dfPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpX5e-00000005rle-0WDk;
	Tue, 04 Mar 2025 18:34:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi7-00000005YCC-38Gh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=VXesqtK3A8i6ZSMFwP8n6Z6kZDUFNsTogrZxF0Gh9Ac=; b=OesPi/4ZRbyYcG+bra1pr/zvJY
	xxg0WQaB/ZYtKV5nT/zGLUy/w3D5TB6VUsV3iP9LJrtGEmokEYHa8zeP4EEjzAOVOv/37HWtgR99/
	VBxpW5tcqUB1hxw0cmOrllWJwoStu3ejY+l2JtBb7ccCII9caOpbbVy1VUXe+x4w3N41ygDbDOiXa
	BvNHrEVlprbH2cT2gnqzGvtv4UgWkmEgfoK8+TozMOZWcPyoZZojVZLqWNrjTwMq62szS0EMikVt2
	0uot6rq8eN3JlOTmSE8vwss6Ge9GDk7Gyn78ic26UMHeeW60Q9eNozt6y3AURxvaC1pZ5LQto1TGa
	lj2Ntxug==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi3-00000002Cwy-3NT9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:38 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-abf57138cfaso615817766b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107933; x=1741712733; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXesqtK3A8i6ZSMFwP8n6Z6kZDUFNsTogrZxF0Gh9Ac=;
        b=Tv+6R42k9+VdSPd0W031MI4Ake7pCBNw/np5w+TFhNNnH3KEfHG2047cYBtMysqwo4
         M+sYPr1LaXMNmAGXDWAAwhw6Yw2ohfJSMhPxROG9uaNdfrJvC8OE15yW/fL3IUL2w5PJ
         Oc6KxiGGzj5b+L6G5KSVEG4JE5eqfetlyZXvJek1pYV5zI33mUOwdEvGWbi+0mY9PBoR
         MeBBxb0R+gmWCmxNXeqI6i4r4AvhU7DTtY06C85kaPo6c3ZPp4OYSgq9Pc6NZTlj+93y
         L6E/ogHM5WB8h2yqxiet7s6KSx/v8VamxlZsV6M7eNX6XrqjwCloKwDZ6zW10peMNmOy
         jWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107933; x=1741712733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXesqtK3A8i6ZSMFwP8n6Z6kZDUFNsTogrZxF0Gh9Ac=;
        b=EVBNtG6ptYkgWJj3OYOLuouX1x7RoGxwEGcIt3Pw+6tnfKe+/eku/FpR0moWMwRFYs
         6rwxjvHJujtL+2DWPF0S7DeE1sARnzrtA/Z5Xz7dnQ/TJZYCEmFR/BnUpHPOKDE1d4Pz
         bSwJPcauPyk6D/TITosIDx9WRWQ8UHO9IZ6oWFfTk9xbzUmQh+/Yj2fqZ+126fS5YZ/z
         2RCBEhbJEHVlPXzVREyvi8y4GdfreLI+I7IOBdsD97MjE58PwOKKVxTgAjgKkZOAEU/H
         9PhcKnhl42OQHdHVwcpiz9pj2YuyEjmNMRFyfD5Tv3Su20Czq4/m4xEJ6ilAcqEPTJF4
         y1+A==
X-Forwarded-Encrypted: i=1; AJvYcCVaFsTj82/q3q49sByTnVLLipAariAxiXnNMg20RVcMr0iKOIn+daGJktEcATqFllHu8bjYezqoLrelGu7NYRRg@lists.infradead.org
X-Gm-Message-State: AOJu0YwYR4jcteG7teJTtXH6jZB83iUMg3fCMNEgIriWTrvL+I9ZdPbL
	3mM+DVT1KRBCsR+LymQ9F/mI2YHVZJw3pSDRjmyGgx+Z7PUXsBYmUAFQlus7BZE=
X-Gm-Gg: ASbGncv72us4MsN8BJMQwEebx9HxYKiXfzH+paoItvBG2lpbX9yFaVP0wWW3bT08PQ5
	ROUNwDjkDktw46hmvVq3A+8Tuqu2Hd+5pZQWqFXiplFZWjU9P8eLJpgCvixT7gLKbQI48MUc9BG
	3xd23G5G6wxmkL76br0sZFY972aDP71brlu72r4RbfuWg4/sVm9IE69G5SMz+f5aueO8kcA5LZT
	peP8dTYRbKpPeX6dZ9BQPML5wj0WFy5/0SyE9IhipFzeINuTvL0adVXEz9p0xoWLpqfx+jOCO5x
	+Az6NYMLIFKqkqeDg59OAsebOiTvzN/kH4lhyMon/nWqFTIzukI+B7ufd7zrDzkeKjkqmCTFHJk
	x++RZpdVspYF9uxPfshM+qNL4L6uK
X-Google-Smtp-Source: AGHT+IHVbcY6l9+JTAHHIw3fmIWanoQo+sapqWdolutCogJsq5sGcHSbYPT4D1lGvFYrwfxZJsMGVg==
X-Received: by 2002:a17:906:f5aa:b0:abf:59a3:df19 with SMTP id a640c23a62f3a-abf59a3fa56mr1580793966b.57.1741107932647;
        Tue, 04 Mar 2025 09:05:32 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:30 +0000
Subject: [PATCH v2 02/16] rtc: s5m: drop needless struct s5m_rtc_info::i2c
 member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-2-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
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
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_170536_009651_D545FBAE 
X-CRM114-Status: GOOD (  14.08  )
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

When this driver was converted to using the devres managed i2c device
in commit 7db7ad0817fe ("rtc: s5m: use devm_i2c_new_dummy_device()"),
struct s5m_rtc_info::i2c became essentially unused.

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* fix arguments to devm_i2c_new_dummy_device() - too eager sed //, and
  gcc didn't notice, only clang :-(
---
 drivers/rtc/rtc-s5m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 36acca5b2639e272dd9baed06ea5582f635702b0..88aed27660348a05886f080a2848fcabbf9666d0 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -146,7 +146,6 @@ static const struct s5m_rtc_reg_config s2mps15_rtc_regs = {
 
 struct s5m_rtc_info {
 	struct device *dev;
-	struct i2c_client *i2c;
 	struct sec_pmic_dev *s5m87xx;
 	struct regmap *regmap;
 	struct rtc_device *rtc_dev;
@@ -640,6 +639,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
 	struct s5m_rtc_info *info;
+	struct i2c_client *i2c;
 	const struct regmap_config *regmap_cfg;
 	int ret, alarm_irq;
 
@@ -675,14 +675,14 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info->i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
-					      RTC_I2C_ADDR);
-	if (IS_ERR(info->i2c)) {
+	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
+					RTC_I2C_ADDR);
+	if (IS_ERR(i2c)) {
 		dev_err(&pdev->dev, "Failed to allocate I2C for RTC\n");
-		return PTR_ERR(info->i2c);
+		return PTR_ERR(i2c);
 	}
 
-	info->regmap = devm_regmap_init_i2c(info->i2c, regmap_cfg);
+	info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
 	if (IS_ERR(info->regmap)) {
 		ret = PTR_ERR(info->regmap);
 		dev_err(&pdev->dev, "Failed to allocate RTC register map: %d\n",

-- 
2.48.1.711.g2feabab25a-goog


