Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E730DCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hr9ezDvbabWM+JIoWhpxzu2N2664G4DRU3GkdP0Hsaw=; b=HWHLzLru5QCxCwbG1rpdjeb18C
	gwDOnvuHSvxe4vY5WVd9ydYO0noFmulCcwUNVJk9SK933gSfTrPpVkJCLogg218pUeYcmTkiezT0s
	8iBd+QDhWxa/YU369go0tf30GxkpE34vOMpi+1mxTYzEe8E6KtpXN950Q8ZkJ4sgJgcfcdiQXyf3R
	g2LBiHXjUPo9xUErUMJfpcyIIO2p1/duBpMARWqtovCkf1GP8oF1izz60V2pyoifmafxsiEuSQkIw
	PROng+tf3pgerwlbTJgvWgVXdQZzZl7CR0m883VHC34EGYzN9zb1pPL0qzZfwNqqg2CEfagdaIEA1
	zOH16wJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrP2-0000000BhWC-3Bxf;
	Tue, 26 Aug 2025 10:59:48 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqO9-0000000BVn4-1PT3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:54:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3c8fe6bd038so1058742f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202088; x=1756806888; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hr9ezDvbabWM+JIoWhpxzu2N2664G4DRU3GkdP0Hsaw=;
        b=I/BcTgSFEWVqzIZ+sJ0+EwICbt0B6AhLufZIp/Y2Ms5otDQ2sxWaRAsPDAY/u1Kw9B
         h0jZV4hEMea/g+4ZudQx/GcMk/9NXsVk7KwwaBGn4pPZvjtBJYofdVuX4TpOVPjlwfeX
         kpaECIpzLaOViuvabUwI/tBdlfBFQ5M62iCO9DAUADEJXZkg0d3fTdeThb5g+05n8HM1
         Uz9DrcsHIPId9mMK2Hj+UO5mQtIZTm0cf9mH3SFZx4g01IVA05WAsXg77v/ApnAuBhjb
         jK0IhVCOb2YXdgHCcMdkQph4ro7l88eaIo7FzlpkmTSB0sMW3wC93frqvtADOorFhGN9
         jqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202088; x=1756806888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hr9ezDvbabWM+JIoWhpxzu2N2664G4DRU3GkdP0Hsaw=;
        b=cHt1s03WiyJ/mlyJpRoVg+LpPH3YAmRJLye9v5E8ttJGLP0AP8m1I/h8ke6hYvbIB/
         7sp+TDLx9qI0N3PiyJIpre5LD190C/ag/4OsseY6SlJv34F9PGev+ZAFC/2yKTcyMbcj
         Nnca6mVFTk8nHPk6ahurU5ro9BPZ+sGoMA3EIwt07ksSYz6S9O/ySHKGeC1BzEvWdwu2
         8XlE3R8dVH0KdMWfB538/L1rPdHYCeNUzpHobPYSxK+AG9iHhJ5ineHlQ0tW1GJ087jX
         tNRzqyljdSnxnSGEqWOZ1rHxi6C78+9xRsLPl7irZo6m1V73CeReqi4f8ZAMwlD33irO
         MzPA==
X-Forwarded-Encrypted: i=1; AJvYcCWUJZe3dmfr0sYHnhglRC5XeT+6pU9iPTrCe0k7NivyYv3D9DH7Nr/bPPLZ9lnWsCKqxZS1wkftW96dvS+AOzDv@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp7JvJkaH3KF6m+HlwuBk37sbiBy8o+0GSOHKQeA9pP44hZRf7
	W8z5GgEfWanIBsCY29E+FPvMA8iIoh6pp9llIW9GIuODObvVZ7s/82nUp9UvWMptOLc=
X-Gm-Gg: ASbGncvd7y+mPK3SrrRMlMestV8eQic2JqCFCckQ4M5M8HMTT0652laBxHtOUo7V/ee
	Bl3dm7Y3bsHiU8vsqy9/CLAfCfFIKU8w4D8MgX2jq5lOBhzzcAN2Adi0ZM196BNaP+M4yT+sLdL
	in2mURxGWSuqvAqe7DbLBsM73ER/o7NxZUgYAduK4i7p2b4GJDhakSLn06SUR0sS3aKTgBPVlTu
	+LGMBlAb3gcNJ+ppcqDqEbAdJXrDqLd1o1AN1F1Nc3zkCAJP910qDW1ICbm+3S7wle80Y26H9SO
	u5akDs+hlug5lMeuNzZuqaVFhGuIPDpVhvWBSil4tTQiuiGsZFnDkPKyfRU3bauqpYUNe43HJBZ
	N5bpPH7A0QN0M9D51Ow7U2XZWVUWp
X-Google-Smtp-Source: AGHT+IEbmQ0wfHfNzU9A3vt56aJAW/TBqrp+wvsnCIpOz+MxEDmOeIEf5KV7QmY38nQb25bnONIElQ==
X-Received: by 2002:a5d:5f81:0:b0:3b8:f2f2:e417 with SMTP id ffacd0b85a97d-3c5dcdfc643mr11727394f8f.51.1756202087749;
        Tue, 26 Aug 2025 02:54:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:54:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:54:38 +0200
Subject: [PATCH 4/6] gpio: wm8994: don't print out global GPIO numbers in
 debugfs callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-dbg-show-base-v1-4-7f27cd7f2256@linaro.org>
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EvQ1SYQWer3RkO4fMSasYvVhk1H3yin4vuMK3XRhqvo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRhUQXOMPagC4V/EkuzJhJIamLzxI+KALqfB
 q+9XnyzgSqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EYQAKCRARpy6gFHHX
 chyoEADLBUcH51ZCT1TXPLgWv7MXnlLoympGVuWzAFP9Pii3SX74H3kEVV+0Tmba/cDTVmJSNzm
 2TaTrIzWerfU3YhuqiLeRkzA/mvIQWWL54Gl8Q2m9i9Ff52r0rTdNiq06a02hMBGmfN0rP8koT3
 axInx/kv5tIUpzfUuWlQSzhfSA4A84rEw5exxvxFxzoradZcvjs+GLRkZrVwXIKpNVNDCzYcvSc
 TccxQGCFVYff0ZND0qqLyAWYy5gwO2LufjeBzw5GiY9cBhiZMYm3Xuw+MBJAXrApo+3LPwU9PBy
 tDjmwsNpbgaRCwQyEEGbR7C1ifbrZwzf/taYJA1u5BvEXbFrFfFVpANN23Nj32K0Oj0qKOPwfkM
 1cwDE+Iq6omUOPOh8Df4UPmMisd3PiEhH0p77kt3MjOoIbdJhi7LNWJKLg2HOrFQEGBD3BTMdUZ
 +8dK0PQ9QVJlenx3Ah02EY5H8G/yfhPdhQp0e6sy8tnvKW+kErc00iJ8monRSd5t6gXJGHs/oz/
 Vifi0VfWOAimS0AklTN8w2ITiOxsp3wi6kozrnyZCVBe40tGIyGhbA+MIAb3nk9xTvZY9/DTYWe
 4FrpxochWDmvq/SFr5tuIVd+69KtLXOdTFeZa5CrnFMZaKeHtyXRDYUGk5yU/+qG3JVi1OSegyL
 PsyR0iUxyMNOVbg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_025449_382350_B2AF362B 
X-CRM114-Status: GOOD (  13.61  )
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

In order to further limit the number of references to the GPIO base
number stored in struct gpio_chip, replace the global GPIO numbers in
the output of debugfs callbacks by hardware offsets.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wm8994.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index df47a27f508d94d53056bbe666a67e887637f516..a0665cf3ff2f45640cef740deca7712606791f47 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -194,7 +194,6 @@ static void wm8994_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	int i;
 
 	for (i = 0; i < chip->ngpio; i++) {
-		int gpio = i + chip->base;
 		int reg;
 
 		/* We report the GPIO even if it's not requested since
@@ -208,14 +207,13 @@ static void wm8994_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 			continue;
 		}
 
-		seq_printf(s, " gpio-%-3d (%-20.20s) ", gpio,
+		seq_printf(s, " gpio-%-3d (%-20.20s) ", i,
 			   label ?: "Unrequested");
 
 		reg = wm8994_reg_read(wm8994, WM8994_GPIO_1 + i);
 		if (reg < 0) {
 			dev_err(wm8994->dev,
-				"GPIO control %d read failed: %d\n",
-				gpio, reg);
+				"GPIO control %d read failed: %d\n", i, reg);
 			seq_printf(s, "\n");
 			continue;
 		}

-- 
2.48.1


