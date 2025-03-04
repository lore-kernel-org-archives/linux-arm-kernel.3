Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC8EC282D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=; b=0wjtnttzQHPwLM4SWWcv77YUQE
	DxK0UwM00NVTWk2brnPydlN8o+Z/sxA4UTR6zqj/S1WQJY5+KIkCRenaCZB7arf1i2sGjU/2gN7pU
	8SKiMqZgzdBnGQA7wxNlMGZ7Ff+xW/QIc6jiBjWVI7MCY6HgnLFnhXaiAKdBxUe/O9oqGQeTjXzoq
	9zwFUSUQ8pUr9/WLTbjyyrfGzXhWtmdOdlyPY1roLljA58gJeZr61cu7Sh38epFpVFMxpepWsLjxL
	5BOS/o3iWA4DDm16LwSDp/KlUrIR2ERUSFOL396mL8cXim4uUDlqDTJu+AIRnGws3LW9MRGQbWadw
	94KmgOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpX8k-00000005sPj-1Njy;
	Tue, 04 Mar 2025 18:37:14 +0000
Received: from mail-ej1-f45.google.com ([209.85.218.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi9-00000005YD0-1Q0I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:42 +0000
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaecf50578eso1120079466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107939; x=1741712739; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=TxTakxzn4+ieuy3yrgAQY02mLpP6hHO5wb62C9klvyRR4MiONcN0W5txAb4R3LIU1S
         smWOhA3tBWoBpXxJ5zQQ06VlBa/wrzozOCWvhKzViJ3IDSFtYOxv18jBLdbNKZTEH4Eo
         e6HZm+IEjG3NBiILbhr6QfifJwl5DiO58fjW8Gea5dzIqYekFzSy1Zx+Z7qtcrmueyH4
         ourVym4BgHjte6mvd/lYilGzV2LuoXLVhq379lxgm9/eKBKU2iss+0sbpRe7FOerZUze
         eG9qVF0acWqgvxM/7Uph2lmwyKqGsny7043/ZdodY4vXJccGMnkPGN7tPvDNo2fdDUQh
         DDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107939; x=1741712739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=uuuppS8LS6QT1aV6QWpTMxdEs6IV+gzaiTsO/YfYZDi6aG21Z1WBBz87N38/L3aMY9
         J7aEP1s9pMw+dZJsQFB/u7BiPfkQWsPiY6A+fgpqRHaRD3HwOKVI9aJa9dgU9j86OKL7
         lQX/u4qABSppzFLvZaMExUhlZQBXI3eiPbHSbGjNtobwQTV/F3f4gcu6aGJ35Rz5OC5A
         HV+yORgOVNTNugW2mCJr+IjWYECpYLBCOQXcO8p08YTqMBO2TJVvtNp5sq+W+ZSKhpId
         26khVqVgQP3Q1o2bS2LnBHVMQbupx8rsy3ru2eIlL5j6IO12j9QCAbbxReLMGwjXi7Vb
         BMMA==
X-Forwarded-Encrypted: i=1; AJvYcCVDSX5LToF1XlDujEUOl/3hTtQtoQwHg+s/szlZqDiVr/VLWp/jmFOtfX0ocg67pOgjROYZdvrPY4RvYa4GzscR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/j+8zU9g7L8Zb7hbrDOw9YUIXJrLZ3uCPHo1XX0skfy58v7aH
	MLDWpX3EJUkDV86amA1YqoBDrUw8if7IyXFgR2+GtW3tvP6ulcIyIlRv7RfI3Pg=
X-Gm-Gg: ASbGnctoWXfMaZVTHN7g/KGJ+a3dbCYSADY0tzkTiDPItRhCa3iaotlUaJio3dEpRbh
	W2shgZypvMG1MEEGTMuQCuBnaueP049wkJEi27pzWghfal7N+SlNwqyLpe6byV+mRnuxKpHCxn0
	bBGrt8w3Y01EUSFRWhqno13FYJbgG2Fqn1oCs9V2qDHHpUace7PdLYzbVn2m57vqSQh0czP62Yt
	/Z8vVX/p9eSlx/rVPgGJFEP0g4fSmK0EL3O/DJBxLT+B4NYgAu6nxx/o82CfiOaWLgyVX0zBneR
	ntuVJm7aG4CavyOa4sENazBxdsFIejHgkP2fRNNsDJs8IiUjVHaCfJojwBn1Q6JjBHTqYgaLCaX
	Ni85kQ1cIeT7o9kmTNQ12IpWvZUZP
X-Google-Smtp-Source: AGHT+IEZqUVJFopMcdCw0Fa6138jis8STGfKBc9DN3g8sZLmJaNDRTq42x6nu+WBoJl/BXVMQfaxGw==
X-Received: by 2002:a17:907:97d5:b0:aba:246b:3954 with SMTP id a640c23a62f3a-abf268263f9mr1810089466b.47.1741107939344;
        Tue, 04 Mar 2025 09:05:39 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:38 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:40 +0000
Subject: [PATCH v2 12/16] rtc: s35390a: drop needless struct s35390a::rtc
 member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-12-d4689a71668c@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_090541_375126_C102A255 
X-CRM114-Status: GOOD (  16.47  )
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

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s35390a.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index e3dc18882f41445c41fbea56edbd5c869514880c..3408d2ab274194e39cde38a83567d37bd53f6632 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -63,7 +63,6 @@ MODULE_DEVICE_TABLE(of, s35390a_of_match);
 
 struct s35390a {
 	struct i2c_client *client[8];
-	struct rtc_device *rtc;
 	int twentyfourhour;
 };
 
@@ -422,6 +421,7 @@ static int s35390a_probe(struct i2c_client *client)
 	int err, err_read;
 	unsigned int i;
 	struct s35390a *s35390a;
+	struct rtc_device *rtc;
 	char buf, status1;
 	struct device *dev = &client->dev;
 
@@ -447,9 +447,9 @@ static int s35390a_probe(struct i2c_client *client)
 		}
 	}
 
-	s35390a->rtc = devm_rtc_allocate_device(dev);
-	if (IS_ERR(s35390a->rtc))
-		return PTR_ERR(s35390a->rtc);
+	rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
 	err_read = s35390a_read_status(s35390a, &status1);
 	if (err_read < 0) {
@@ -480,17 +480,17 @@ static int s35390a_probe(struct i2c_client *client)
 
 	device_set_wakeup_capable(dev, 1);
 
-	s35390a->rtc->ops = &s35390a_rtc_ops;
-	s35390a->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	s35390a->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->ops = &s35390a_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, s35390a->rtc->features);
-	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, s35390a->rtc->features );
+	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->features);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
 
 	if (status1 & S35390A_FLAG_INT2)
-		rtc_update_irq(s35390a->rtc, 1, RTC_AF);
+		rtc_update_irq(rtc, 1, RTC_AF);
 
-	return devm_rtc_register_device(s35390a->rtc);
+	return devm_rtc_register_device(rtc);
 }
 
 static struct i2c_driver s35390a_driver = {

-- 
2.48.1.711.g2feabab25a-goog


