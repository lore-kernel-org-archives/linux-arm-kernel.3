Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39B9C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rV66TNaxM+tRVm0G56yg1ZS+Xb8QC9jIEshfuDQ8Ajw=; b=su6mbwGFEZ/4WYk8fatLUxbiDD
	xi+deEjIblOMJnWE30N/Br4HPJLAoJGqynNM0Js4gRmkLPmC4iZD0dWJOFfOSWHr6RXiTrfWpDuG5
	j2U6WqPuqSYLQMG2ZRqmiKCFMH3NX75dorfmW08/7Ng9VA22zZAK0vOUErUFI/hPqVQwN0QPV8yBC
	LnJTdINdG+W4T7m3VB/wPmdpOQy+BKe2jEeOFUcvbVzzNB+Lrl/t1s9mxe8CR9/h0+4Z8mY8u6QEZ
	Bl3xw3NNbJNmXz9gGj12b5FkVmMNZ+5FBhivcLkt7Qj7GKSQ34QxTmlRyYIrd/7mhbgelEtLnKg1i
	llRO25XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnn8-0000000EDzv-3H30;
	Thu, 12 Jun 2025 19:40:50 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhmB-0000000DLiJ-2UQt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a52874d593so975547f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734126; x=1750338926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rV66TNaxM+tRVm0G56yg1ZS+Xb8QC9jIEshfuDQ8Ajw=;
        b=aPwaKLcChCy5qKjzgaKvys88DPLSysoxUMaw3klN/8Sfum/XyEX8IUEWBE6unx5dY7
         fWwpWcY5tuI3typV9FTEj8bn6HGliQ5AZ/MI8m54MGNCbvZduIf6hdpeCDHsMvB5vJKW
         16+xIasERiojrPy5LQBlzEVxEK3W54B2PkIbq/08nNUbzZw3sLBIZN04H9w3E2crgSBn
         V+t2yiifol1Sf8vOx9xhh1xTCKrbe5B00699f304k5HM7R9IOMbKfu9YYLR7v3STFzTr
         A1m2HMDLTfDfDTg4jGyfqR8fDMedP0VoP3aMIskPAYiuv2PrfiKBXHeZ2xmAeGVyJ8Mi
         bF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734126; x=1750338926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rV66TNaxM+tRVm0G56yg1ZS+Xb8QC9jIEshfuDQ8Ajw=;
        b=YVwEtLeLh+VdL4N6KiV69IB5rSJ3mrmNOGzSRdxkhTSAj4v/gs8vNEVzfAS0Hq0CgP
         2PGsThu1EpL3YS6nEwjSW16f/+jx9Lg2ZVnot8cmHgq2o80JLZfEqqsNNGGQLK3qepNK
         YNRDODA9juuleTDDS2xaRAW0IOtW5eHO/shQ8PyUYkrLSLOVC1Vn+S0pfjWRyDauK+3Q
         MSr1PRuz+QEgbfoSdAK2fpyUMLBYZqKykj8+Re7lP67Bw38fVciD/5C5miJ4BUUNCvup
         I8o3e99nfVJR6w/9Zj1wn2PAM+RKpMBjiEXn4dIITNtg10pc+C9KTotK07IGshgUiYur
         FjEQ==
X-Gm-Message-State: AOJu0YyMYF9SgLP3eWLgbyDO29a+gzJTfibQR0qRBdL+Le8Vd5ZI8H0q
	OjBpZDLDc1ITehe4dmNCT/pl8d8tLbfaXa4seRKq32riXrzvu4t5AhNGMRcnB+KzgoQ=
X-Gm-Gg: ASbGncsg7b76CYUiM00igZdKevd3GZBZp1Fl+OyjdQxasCeKEIdFeQ7nup/BjUep2f2
	x+OHnLCf9HbeTnuEfXPRXTXc4OyFtp9EESR98zI/3exceQIr5784sZP0kZnJYe/s7RjHJQ/lnkI
	fU4EweszB/Q5iR04tBZ4uunfAgPehw7pn8By+H6B4ph3vUYUq92EowkswP0at3HUqHuYyKteYkU
	zP0Bd/y4B9JuTvcMbu0PgV2xT11jI/QEqFZg6dru8/KnKaXahXJFPoEVF53gaxQaPEVfdueY2V/
	P3LsUza3xHEYVZbI8QVQkOQ+I3tBCBt+SBbpk7PW49TXcCrxC6p4O88=
X-Google-Smtp-Source: AGHT+IE5mT66pzqKyfIajfIGyDumyvkC12XEvq6ZyTsCS1EDLoE+BveAXbQvq+KfiZgQjZVcNrQ5EA==
X-Received: by 2002:a05:6000:2890:b0:3a4:f744:e00e with SMTP id ffacd0b85a97d-3a560749228mr2745803f8f.4.1749734126031;
        Thu, 12 Jun 2025 06:15:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:13 +0200
Subject: [PATCH 04/16] pinctrl: mcp23s08: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-4-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tEFYQzYr4zlLCNgvVSEeoX4S4CSsudf7dYRdU15AU4k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLk00prsnH+1kwtr0kzg9zSLDkGxpKTnd0jQ
 2950YwwAduJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5AAKCRARpy6gFHHX
 chD4EACJYOau8Xi4fN3Ov3TIfQN7He28eIvwgT5/E20lExaBUJ2RaS+UWGxHsqkMw1AmYmlWwWe
 t7Y93zOUENY77UyolkyLKRIUoxa/rU5H3OHrxR2lzxEZHJGH1YIWDeKInlkQCAumxB/LbXOunlZ
 0Y/7w5Jm6gYhBq0c1lN8zx+kW4v6xH/BPTgfbz69NBHIg3q1m4abQQAxZdZBBJmludNlRPCel6C
 UJPsLmXvRaKumW5SFMgO3g+EZmXP2+/9JPy6FjxR9s3ZudFN/Q/24bByS4PGOuwEQbQZ/bQDV3e
 kY5l+jCwcAmU1EVEx4qQGBtNC5fa/OK85yj1wOzyr/uthH7vQFFPbLUWpiccyQsuRRTVamFc12M
 QWX6OnGRjMKwUyfEtqgwONiGC7b8/73K1ihlB1FWR+V4d8DntIjO2Hm31hZNk2K9HHs3Tnoye/Q
 V2Akk29iY+g1pd6DQ7ZCeFDiZ3/mYjrgr4SVc8LRVbOn2YBqrTBHkVgXNnw/Vf2SePZy/XjLuLL
 JvbAmYmTxkDQvqDfg3xmLI6aVfLuOLlvIbEY2hY8lkxE6oPurqUc1v4mNapXqijdfpMojdcUefE
 KgPCcATeWN6UEPqxC1itvEf6yH+135QoxRLH+32f39jZeN54TE1MjPkkwy1eeo94ZR4lkUBs+CL
 R0R7Nzt1LEuaeUA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061527_642192_17B7C0D8 
X-CRM114-Status: GOOD (  11.92  )
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
 drivers/pinctrl/pinctrl-mcp23s08.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index c2f4b16f42d20b0dfb0e1e6c79f8336392307c70..c8027ef03eccdf54809dfcd76ed8c07c424b41c3 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -341,24 +341,30 @@ static int __mcp23s08_set(struct mcp23s08 *mcp, unsigned mask, bool value)
 	return mcp_update_bits(mcp, MCP_OLAT, mask, value ? mask : 0);
 }
 
-static void mcp23s08_set(struct gpio_chip *chip, unsigned offset, int value)
+static int mcp23s08_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct mcp23s08	*mcp = gpiochip_get_data(chip);
 	unsigned mask = BIT(offset);
+	int ret;
 
 	mutex_lock(&mcp->lock);
-	__mcp23s08_set(mcp, mask, !!value);
+	ret = __mcp23s08_set(mcp, mask, !!value);
 	mutex_unlock(&mcp->lock);
+
+	return ret;
 }
 
-static void mcp23s08_set_multiple(struct gpio_chip *chip,
-				  unsigned long *mask, unsigned long *bits)
+static int mcp23s08_set_multiple(struct gpio_chip *chip,
+				 unsigned long *mask, unsigned long *bits)
 {
 	struct mcp23s08	*mcp = gpiochip_get_data(chip);
+	int ret;
 
 	mutex_lock(&mcp->lock);
-	mcp_update_bits(mcp, MCP_OLAT, *mask, *bits);
+	ret = mcp_update_bits(mcp, MCP_OLAT, *mask, *bits);
 	mutex_unlock(&mcp->lock);
+
+	return ret;
 }
 
 static int
@@ -626,8 +632,8 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	mcp->chip.get = mcp23s08_get;
 	mcp->chip.get_multiple = mcp23s08_get_multiple;
 	mcp->chip.direction_output = mcp23s08_direction_output;
-	mcp->chip.set = mcp23s08_set;
-	mcp->chip.set_multiple = mcp23s08_set_multiple;
+	mcp->chip.set_rv = mcp23s08_set;
+	mcp->chip.set_multiple_rv = mcp23s08_set_multiple;
 
 	mcp->chip.base = base;
 	mcp->chip.can_sleep = true;

-- 
2.48.1


