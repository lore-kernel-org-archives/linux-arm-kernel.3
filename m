Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5C5C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=; b=0s5siDOKt5YVc8K6BhOwtVjiPs
	zlcMmBuAldIYf3VSSXCG6+9Ccs34SzGE1sWovYn8aCpzi+iOQYlMWLB+Py7r0xfx07W5qj8L+txlm
	1umwbJqnDH6xPG9ogbFGHmOMATIIBhLbXkKFhjFmZX2VJgT0l+l3uWkcAkiz0qOPcvt2HJZtlUWbj
	9F7EjXx/aOk6iM0QeBtKinBvpABk6F6UprJqRHLRbNY9iWpv+OzQ0pMcXErZPwILYYdHO/wVNJPT0
	7O0UlK2h+duhm2UYC1bIcVLXuyjZoVzreopMXII9shaGt5NdUHdG2t8SBj6Qv4sNFTwtx0spMtV3J
	tPH3Oc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Lc-0000000BGQb-2iVa;
	Fri, 28 Feb 2025 14:28:16 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11W-0000000BBA5-0eje
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:31 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so3512928a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751649; x=1741356449; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=I2QDvE9wN+g16Z7rKZjQU/K6ZyJAh05OKQtvnHRRZ/NX7Qo60eGE+dm8BKfzrU9iKF
         H4VtWcTaPRD6eL+CY91buxH7GcwnUrBJZ1sOvxJMOMk8bNMMlsPmkuULMQYZ8SfeDwAh
         YgMjP+C0daE8bbGNhggoSugyqhKMATjHZjaqz0aakz1z7gaFYEelDwo2P+Hk1MMenrlT
         BLN9w8ax0XNQ/NJGxcVsK2GrHXMq+tqrqKdG0uHBUg0Ylrs8u4l2Gr/qGb0VWM0hsO1n
         avp4lz4rxyTa1oxLElHNz+pDNz2jCIaGgtuNpqbUP7228REVsO3bsVrsDOdwKr46u5NJ
         B/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751649; x=1741356449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=NttMsYCvvbFvd6h+Em2kdjPKqtWQ93SYNoNHCjQkcVE1ZwTeydSz/5zmEIJmIXrjZo
         +l7lRuhtL/tpN5L7Fa1z4k3xSsvwGH8yTbITTqzQ8TT8kSK6FnlrcAGcseBdEG49FmMI
         6jH07dFc6MMeMZ82lsT2kN84WjemINvo9wIobcQVQqMtC+5rDxIojBvod/xKalE6bvOQ
         KejxTPAmhBf7MbmS2n/dD50I5Qe1ou4SJrwA1niFS6QEFJrpYPjPG6mEq3NoFceOuhz5
         ZxQR+DTTkn5k39sO+jga8MNbhY0toA9DhPj/03oPcsB6cIt5RMRwpKnqFkcadfWjIZRN
         X0pA==
X-Forwarded-Encrypted: i=1; AJvYcCUjxAZz98MS+TulOltKlDzZycMyH8tmzGnOMZhbrB3IL+QsU5Xpmcy2jUKHhM58Iq7daTNNvHqeJUlmsfCsPLOI@lists.infradead.org
X-Gm-Message-State: AOJu0YxmFBmYtp9MtxMzIMW2HKUXdIvcuwOM4bcWZdmLTD1A6bu+tJct
	8Hxk6l3eg8PkIosS0qldEAIdPMblBoxtJ4gKllzd9VyZj6z2kT1ZeK1q7C4ViSg=
X-Gm-Gg: ASbGncv2nNJNuTu3lMWjNxqjELf94PwmLzefNgBoVOKTI6p73GGFsEnQ02GfCDPpcNz
	ky7t4M6eQMc5J85lVPkT+w/LoDox/tCvNLFN4zZo3/g40hoF1L2X8MhcHhvKw+YWlnfWtFaGo1p
	eqciQKAeNjxKA1zLyZ0R6/6cme7/RrjF4yOOv781TOqIZOFdEpnxtyzvh0hf/99F/M51t+8xHw4
	BJqSf7zNsS+H8uAy7GRKXCmD25FVrHoctXcszyeKodWXz0TlhT3O4Pqv39mgybkFwuGYXojhhrM
	w+gqtPl/+olCm5k9db38P1d02EQpGI8UDCTznKEU4I1LVH+g/9dBjrZKJ6RodZrRhgoqQcepEI5
	pedRhoUEaLQ==
X-Google-Smtp-Source: AGHT+IF1zdUSX6ZhtbedenD60jZMcHzIIU2NhAe4k+oRQ6Wt3d6uE7nze1qy/Ap2/A6npGSF7Q9PVw==
X-Received: by 2002:a05:6402:348a:b0:5d1:f009:925e with SMTP id 4fb4d7f45d1cf-5e4d6b1869bmr2990380a12.16.1740751648743;
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:25 +0000
Subject: [PATCH 12/18] rtc: s35390a: drop needless struct s35390a::rtc
 member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-12-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060730_216115_ED44122E 
X-CRM114-Status: GOOD (  15.87  )
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


