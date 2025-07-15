Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8CFC83F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cgq3BkoPZV1MsAUuUatWqCO5CrlezlZFLpi79f3dpXM=; b=U/FPOaqYKPgqNWiKMb4pXeTl7B
	f4oTSoT9KwS4F2TaJkNjWTExhNQ0ZsOVoZFmhhNBetHCQgp5yRH9GdFHgKIMrPaLwZgEWv/qPbxjQ
	E080IKQ5mdqOlXFp9vXHINqCw7IDTS6uzLkfrbz1FtEaOlGmufK49XFwTfe5njUER/71oTncJ7g2v
	+rfBsy3OiXbvUrYVa5aT/3jjB4i0QmI0NBLwV6VOTabyBy1VBYS0VqhbJ4bCOV6JOBM6vwl1xvcCy
	Qf11m2P0vnHV3X/jDq7vXySlLcj6xAmr7TLWKdmWWkc24jvS105paey6nG7oYDedUUE2Stdrlm9KV
	DAKlTt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbTn-00000004b5C-2qpB;
	Tue, 15 Jul 2025 08:57:39 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubatH-00000004UuP-27CQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:19:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-455b00283a5so21819025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 01:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752567594; x=1753172394; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cgq3BkoPZV1MsAUuUatWqCO5CrlezlZFLpi79f3dpXM=;
        b=IcvyLVHFg4tyUV/nvKYA9+vKXMlhWVD7sZ/0C3RpPcLNUI9MDzYEsqoeQu8ZGP4jSw
         ZdnhFic2p76hIHfJeRJI9uGjb3yrA26wk0Pxp4Ss8FdGzel5fGpwXTQ1c+++1AG7kOL/
         1e1hJh7LulKct06zuWmonWbIHP603eVGqXJ25OV97OrrypMXRoug0rm73/je+1YqdNoQ
         vxuPaUq1A5CWSWTxHBT3Zj/OnL4dQ5+sRcuE3eMX94UtdCUFhXYI/H9AQd10ngTC6s2g
         z/WvDM4BYDVWNmTvxI/7vS7XoHwOVghxmaHfE9wgSx3z9Zgn9kGiel6ly3spwKzb4jeq
         3pnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752567594; x=1753172394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cgq3BkoPZV1MsAUuUatWqCO5CrlezlZFLpi79f3dpXM=;
        b=Xpdw6VxhSUPBo+FecJ4u8+tlAR9bNhdCggFFetytxHTsrxkfRC/mlgC00vx1DjveX2
         ZHTl6VpVM5bLt8AGG6TpgJpGPlFxkwgHougS/pwXmLaqU+vnhKXPf/HaSw2+qDuCwL06
         O1LEtbDhjaVcbSjVt8Lrh5YKsUb4AJQ1mfQeUiqHYZ09T2V4MlkqTtMRgh8O1inCE25B
         CxTsKetBGxE2dyHIrsU4RZKXHtSGOOKOSKcSxwlo6SGTgUrGNZpTrKlYr1zvZ52KyJ62
         ecir6PiSQBdmDcMDe5npRtuSGQywBY7x05iGkCzfXgrm64YTOIcPdY0bEJ1BN7tAV1cl
         wKMg==
X-Forwarded-Encrypted: i=1; AJvYcCU5RFJLMrHGLCcibQn2ExMlSuy8GMZTDemalZls+0DXZ9f7UANC1gzj+bSqYMoC1eu/8Mca7X7O6kZJlfonntJm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9gwmrbnFcIqbDn2jhP0uh6HmbEPq5oDyhPOUkpqAOsJrIaqdD
	HMREPnUYBXzRdtuJYThgEo00uEin9iQJe8ZZdAcUq1x4kzGMCTsvCshTgITH0IIum6k=
X-Gm-Gg: ASbGncsA4aQ6Aqq1uXMNePCPTJGlL25ylSox0GOTLbGBVxT+zp9q3EvH1yjLTb5AJo7
	SSQgKFqu6kUCTR1wQ8GJ4ZtVeDtt72c+mUMrlyCmv/wZkB2dUojDXoV5nbJ1A+7wq8kTzKR2oMZ
	eGOhG2vebo3M547N8V2r5J6zY2j+CQ7BK+SKdeE4+0wbjUX04V4E+HtnvM/SEiQWZfwwcdHrgBu
	8PNW76RPgBy8dGW5bJLuSGH+ikeZeNllpplg6t7Rln8ISitxmtJtZoG/A3ekuFDEw2JiXu6/qWw
	AHZnopoDVDe7gSWWJoMt/qwBhMF6KBTVlpcccfuSELDkkE5Gz7Dfcn9RDJmFtOuFAPc8WfslEcU
	DePz4UhoeVg3ewoQz
X-Google-Smtp-Source: AGHT+IGrkuKRf8ASKDfX0sTDcpcG9CKUjqG6Ra7UQoKBXPCTkOeDhsizOUZ9apPiOxx9SQWio855/Q==
X-Received: by 2002:a05:600c:a08c:b0:456:22f0:d9ca with SMTP id 5b1f17b1804b1-45622f0de79mr38258375e9.26.1752567593839;
        Tue, 15 Jul 2025 01:19:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5631:db97:f06d:3c45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1de0sm14334589f8f.24.2025.07.15.01.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:19:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 15 Jul 2025 10:19:44 +0200
Subject: [PATCH v2 1/2] gpio: wcove: use regmap_assign_bits() in .set()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-gpiochip-set-rv-gpio-remaining-v2-1-072b4cf06330@linaro.org>
References: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
In-Reply-To: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gLwj1jcF6O5wtOOh/IADmop2uEL16XARUpkAcXGwhYI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBodg8nnunuxPzL46V7QrmHbN9D3vpJ5ZvWi5UKe
 4SnHsoJVQGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaHYPJwAKCRARpy6gFHHX
 clQZEADJ0l35mCofC3vsZu3DzXah2/oltxb9XT8xF2yTRVenxDymV25Gx8mLtGrzx1r7gD51HZi
 FPwhwABLkcZ1j5oMOx4ApDzrbJX4OATYGBwDgG+sSZajIAxYD5lrziOc8X9tWiLO5nwvHpGrp1f
 A+a+dztQH4GiGbUKOLOHAjRVKocN7/kfW8roBJtEybs3X8DL2vOcVDEtj1B5Urp8oMN/ES9Riua
 N7UOyjMzvopcoEFvaCMHloUDGfviE2pH/5UYPwQaxanXqmp1KOeQccQ+e/PeASUm9PUEQKi2UjW
 eNZzrx04cufdTax83865WDbLCv+1MtUC7y3mweuRV64BdzAkM1mON5HW5cmmSYGyW3kZLq2UVIW
 W5oFI44PUblHYGG592KPnM9UViWAmJC8Qio73ERDFQqGhyre9uyVvQA73F91m/vN168+iyyqmOF
 qeUJ+hoqu9bkSMoQkGIWuK9WlpS/LOGgCadCPgLxyFtQf7BYJOEd9ehnu7NmkxgfRpdRU3vQVfT
 I506EqBAiYrorQmf/RS4qWlEzc8zCGvU7syvG54yNkhHjgg2eRKoUZ5AuFS4pbY9XKpLnyQlHhy
 rQWzaesgWkLRoJDNUStyK2XS/eX2zUqpb/E6kyR1kEi3q4p/V9CytJsZe07Cs6DzF7HG8V/J7FF
 1UuxI82J3v792Qg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_011955_549755_89768FF3 
X-CRM114-Status: GOOD (  11.40  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the if-else with a direct call to the regmap_assign_bits()
helper and save a couple lines of code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wcove.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 1ec24f6f9300f33f5b3f0f8deb539e08392b8188..816fb8d113e66b27070f286755f3192b2a8f8512 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -208,10 +208,7 @@ static void wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	if (reg < 0)
 		return;
 
-	if (value)
-		regmap_set_bits(wg->regmap, reg, 1);
-	else
-		regmap_clear_bits(wg->regmap, reg, 1);
+	regmap_assign_bits(wg->regmap, reg, 1, value);
 }
 
 static int wcove_gpio_set_config(struct gpio_chip *chip, unsigned int gpio,

-- 
2.48.1


