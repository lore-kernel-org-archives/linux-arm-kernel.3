Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4CAC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CO0TStYciJkxVrEVhFTekbwNrwQKqZ04D9RRPnQx4NI=; b=bzRpHBpg1sZAw/2CG2+hUxhoNu
	TutalouF5p/AbwAYJwlAKArgyo8ZpkF8GjFV6Nq1GFwUA+eFF2dKiLePz7dPBUOxCCDzZd0/IG/Wo
	tGD3sNVCjHMWfAi1t1TB+l7SOS7X3zZ7LcrwJPwFEIdbVDMqBnTataA20W/VCGfXBU0GKvdVvFZkQ
	KXuFtGK0Moozxm7v4Ql+In6JjnOVfppAlS60irivS31tnoJG2YRaip/frGQS21939EO7NjGq/c/8s
	USbmlq6p+cqtNC9ws8ioDOwYr1FeOAxmo2WgqA8V3Vb02x/8v3yYGzO2v37J9JTdd2RbUCJzdwdhR
	PgxWxLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCF3N-0000000BTzq-3sWu;
	Tue, 06 May 2025 09:57:33 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEBe-0000000BFxa-1I54
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:02:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so6414671f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522121; x=1747126921; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CO0TStYciJkxVrEVhFTekbwNrwQKqZ04D9RRPnQx4NI=;
        b=FGiy+kXJbVa/HgBtPIhfUhBAIcOHybReq4ewfYRZyEQRl7izTM8sly7OwmdOP1u5zZ
         3pq/28qWnB1Z5O3wsNe+UQGITVpzu5wm++Omv+UmH/syYQvNyRaMRixQXWPf35HfJRFN
         hDs6S5meq0e5YJlUDPp2J14FgV6b/Cba1Va4w9Tw7XrkZGUMw6wdBaHseIwO77k4OVdv
         ExQTVBnongcJEbqAT/br7xjYnFICzPAnxdPGl20ts/e1ZivpA66B1+07I7XDTVkDRDId
         exj5uNMjE6HnYFmrwCNIgl+Xy8yqFIgpr0Q0sEQmk3NLPkIxcIImWD5yZHSFRWXhxzI1
         +vyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522121; x=1747126921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CO0TStYciJkxVrEVhFTekbwNrwQKqZ04D9RRPnQx4NI=;
        b=HHa1qNSUhvHgRg3xH/5oprZ77PldfuOZXCNdYjgJkYEfnV5qDMppsLLT/LoeFvhqL7
         2IZYrZjS3QrEiJuSoZID2fwcrvMuLbNMaNgh/T9HBds5MWLjb0ZUcU8Ohvew4OX20xYh
         cpOv9aF1cMrITNRZGy2IZyIrLl2eoqNc89qjXy3DhC+72lDRjd9gk1z7P9q2i/Zv3Z3X
         kCoM6/c7ikh7tOjqQG4vW060WWk0VZAdQgkEJ+A+OXV3QfAEKS2QGIi+oZ451W7fbP6j
         VmAm7ajMNRm6bBSBkDWemh7hOuYg0p08Sv1cUpjYPtYbFvlvpc3JD0KmwdaAUpUVmmAu
         PnPA==
X-Forwarded-Encrypted: i=1; AJvYcCUxLhF7m+m69VsVU6YRQXAapqrZzsoCaVsUKD7scDCtjY1QnMUH2ZToT/UZuQL5PXbphECdF666JGD7npiy/rJN@lists.infradead.org
X-Gm-Message-State: AOJu0YwyMNxpjInaZH9Ll2jRfz8dOYg9ybv3OibvqprNSCVViGGcXrwh
	LcLlNMrjZ4aSPAv0avhdhZ8zC7axiyx0o48O7UHC9wOjb/V4NxHm2q8HOBMQXMg=
X-Gm-Gg: ASbGncvN2acWe3VsHgpYLx2lbDzs4YTz6l+RQ3EpFg8weehWbN8ScfdT4byTdGkvwsY
	0hIsVuytQ66VF533D4nhT3xQO7IJb0It7myEY+OnEVcfZ0elEq54oUoOQOO5mHVEQ5qs8RkFYc8
	076+xCRrhLTESb+aOLTZF1l89S8mJ1IFuRh0A4Z+38K+AaG4/nGcsp3q9mWKAE8ybyGzUyTUXWl
	m/nxZgLzVftYIs2dLgTwWyJzqsngZRWtQCiIQuE2bFPii7C1iyEOQUxh94y9UWHIlHzWNcYiYMy
	GXlKY+pjXXbREm0vggVhL0LspcwvZi1JPLM=
X-Google-Smtp-Source: AGHT+IElhv2wXvdZWe2BSaVQF6FOWYHmUMWsGXgp9L0VyKZ+PRC8C1pEa8f8v6TOsPJ2duwzmaV3Gg==
X-Received: by 2002:a5d:47c7:0:b0:39d:724f:a8ae with SMTP id ffacd0b85a97d-3a09fd9a77cmr8078099f8f.33.1746522120559;
        Tue, 06 May 2025 02:02:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:02:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:50 +0200
Subject: [PATCH 07/12] gpio: max730x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-7-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=C5mTxUoTZPoD+BYVxin9KA6rS3qrIxYM91GYOHN0blw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/+9uVpoftEKtklCkxpA9QpLMSMlQ3zO+VCP
 JvYVtcusGyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/gAKCRARpy6gFHHX
 crEqEACZiG048DnwbwoC7fKykT2HjmLlxGLUX+fOdkrVU4deU6eW5TBlgxOQkJPjFJiyoH62ZmB
 C/K/BY0xA2mtQYv0bhFzB+feuOq987JHl/stxocmaMoovOFz/uHyGOcAa2SfN5Lpfyw1XGIiFsB
 Io9NBYkF1Mv24CWFZlJcmu+Sf+GxeocPLW8Uab+Y1zQ8gqs8RuhnT2r+MzDpEEqX5cui+zkHFIf
 MiaMheSndz0bOIZJAgqzwVZADh3BBUG19tkWHT8S024LjDJ0mFn+ozP7n/f+N6d5soMTwhbbg+A
 QSW3JGZUtwrOnoT48SHITN6E+4QTNPWoG9bVpgpI9OrwQ6H56XnzswAsrpxdsElw9FNoiwpo56+
 IW7Iannd1gMlFBAmcDb9maEt2zD8MDdhv7IHV6g0BtJ+UvGgYrVETOjMYJpVJfqepWEwXWB1hvb
 jqtDvVu11/h44dejZHJKC7wouv3+oPEimede/G9wLY1CLX9UwMj24m6gAKpNbQ7/y/2Yi+UmiqY
 3pQFKze/tDjxRP3DycPAFPAv5ndpCC0t+oESotdZ2V7lMKGbFFdFg12/FQwGSBQJClCMa4IiTHA
 hiGrXFn5gFnbgXm5UJRga7lUvJscYCjwKSyRhuQidCfq+Uf9vnR8KpSELqboZrtwKj9ax0nWL10
 f4/nsoY5wR+SYgw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020202_349303_F0DD685B 
X-CRM114-Status: GOOD (  12.49  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-max730x.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max730x.c b/drivers/gpio/gpio-max730x.c
index e688c13c8cc32..75d414d8c992a 100644
--- a/drivers/gpio/gpio-max730x.c
+++ b/drivers/gpio/gpio-max730x.c
@@ -143,18 +143,21 @@ static int max7301_get(struct gpio_chip *chip, unsigned offset)
 	return level;
 }
 
-static void max7301_set(struct gpio_chip *chip, unsigned offset, int value)
+static int max7301_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct max7301 *ts = gpiochip_get_data(chip);
+	int ret;
 
 	/* First 4 pins are unused in the controller */
 	offset += 4;
 
 	mutex_lock(&ts->lock);
 
-	__max7301_set(ts, offset, value);
+	ret = __max7301_set(ts, offset, value);
 
 	mutex_unlock(&ts->lock);
+
+	return ret;
 }
 
 int __max730x_probe(struct max7301 *ts)
@@ -185,7 +188,7 @@ int __max730x_probe(struct max7301 *ts)
 	ts->chip.direction_input = max7301_direction_input;
 	ts->chip.get = max7301_get;
 	ts->chip.direction_output = max7301_direction_output;
-	ts->chip.set = max7301_set;
+	ts->chip.set_rv = max7301_set;
 
 	ts->chip.ngpio = PIN_NUMBER;
 	ts->chip.can_sleep = true;

-- 
2.45.2


