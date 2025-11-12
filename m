Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F53CCD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pibor61VRuWGPDBSUEX8Qfx5NaK+JEoulBZiwQw9G1A=; b=ZUVfFshBTN+hv2R9eGwViv66r6
	CAMyy00jLc6zJI+n3swivdxOLRtLWnT+vDc8Ox0fzBfbLGMX4vsYPFiI1+blOFEADJyQ1qiyZIg5u
	+XIURhJFK94RydQhhAdgpo3EvL6NF9Qt4ap2M28fWRNxZNjPFCIvkW8EIumXATOr78XiJQ/cQ38bs
	q9no94NZ78fYP0i8cyudagYKgI5Ahg+GWSfdS0zpsPKQeDRzcPuYQ7IU/WEu+S8PM7qts1Kh1pwFf
	mzJwA+tj5lSr5Hu+9r7McKXYWbi74wgCofQanAdE9mFu2nkB5i7+K94F6MmYjVQ3I03EeK0tjed0+
	+rg18FOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBKL-00000008seN-41tL;
	Wed, 12 Nov 2025 13:56:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBKG-00000008sWl-0vVC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:55:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so6765915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 05:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955754; x=1763560554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pibor61VRuWGPDBSUEX8Qfx5NaK+JEoulBZiwQw9G1A=;
        b=rTiZROtUFII9sizpK9Xu6F6Tz63iZligV+i7e3q7ZkG+FzwRX59ydwDNUQS9NIOpSp
         2hcHk5RfHar+7c+0VbKvOdzD51GqGVSEMWa6sepuE9xkOxq7uPSuYU7fz9mXk8DXYR9k
         Uu8Zsm38hZ/ReRFBavhetItNCd49uab2PCsPgkOmzt/u9EO9arNBeHi1wqkjiLT2Inn4
         nfoXM3qwIATMgKYPBZobKB3RHNECT/rOz6zkk+ztalh5KEJuQjc6qagfBIP9t0RoZtVk
         n3YBv+WGcPO7USbVi/tuKP50vT04PcW3JYHsBTfQSr/qBlzrJNSmQDlh8/gE+hzg15ko
         mGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955754; x=1763560554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pibor61VRuWGPDBSUEX8Qfx5NaK+JEoulBZiwQw9G1A=;
        b=TRmfo6GtwKVyubHOmA/YyqGZ/ZpCkob7dVNDhU2Oq3JnWHnVfv/37acrcidzpV1BiS
         Fnj97BB0uhc4uhP3JCKDYu6HMxMrkq+2Pw9G391GzMJWOkvXcU17MSYrdH7DtdM/b0Iq
         pPii0lh38TL7TRQgK5rEBAe3jyOlLN2e2NGnJMZZDIeaEcd25LEsl5D3moolI+8Tv90F
         f6h3yaJGfeEAEpe1pHSKX61EVc6bRFO8Zlfv8lJIKOXfHiTi5ELrKCMFfuHoE1Obmpf+
         f/NUmcCkzpBflkH+Lcgr048vKvebPLoFjDkLdWyrHA+wV10EFI3/RinMb+ILeA45uh5Y
         X2dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXZ/2/2aphTYEk4OFFWD2pKQm4afLGhOHT/1TKP9vhG3FY72w2SHYHC6PYZdAetLVvWBVFtRmm/6ePrdSiUc+k@lists.infradead.org
X-Gm-Message-State: AOJu0YwiX3iJyRexCa15arjlHny1YkdAmTbYnnFssqpKF5O1TJu7l3Cb
	GnRFME1dkEmAB2uvriY5//ZScKO41BCv6SjOpZaxCRE7vH6gQr9Fow1rTr2chIhkJaQ=
X-Gm-Gg: ASbGncsEDLfSa8bQgNtUKVww+MkHPcUhCZChWPEvhY1vzcI+p2SvJW3vbNa0iUFyShT
	+mEzum3lC1TInxHbSDUEXBVExrUvM9jQYmY+FhanAbNB8T/jkXpEvF+q0DTLAthhirIBVFzJXbR
	toFDKMdIXVrDBjJ5cjGx7olXBcf4U80ljUH5+26FNWKYZLTPDIlKNkI7PmgYCG3EtfFLq+d5i7I
	Der09rjnMnmpQvkE3LB7Mjlv68utVK9oKRrg6kLEfbcBYLp62zheaHKSm032C9hvVZeB1a3QfUg
	P/tb2bLkchjVMEugU295b/fHPeKrR5/W+fB+6vNPq4xZ19uxq1MWAPW0QsDRlbiOOo21hTf97m9
	nVvoYTM9isNzgbF+Fi8GPpCBCkLlGAtFU5VA8sA7V45aejzsA1euixZ3ebVRnnrTb4JI=
X-Google-Smtp-Source: AGHT+IEtvSDyr11LVdJoG53McXc+mzSebCMpeiLoCNayskXzc1xY0qsvnUscd2uSM6nTy0CesNazMg==
X-Received: by 2002:a05:600c:4e8d:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-4778703cdaemr25638175e9.1.1762955754244;
        Wed, 12 Nov 2025 05:55:54 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:53 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:38 +0100
Subject: [PATCH v4 09/10] ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-9-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=J7wcxqH1nXBAkgczyumTwaJPo/9guzjHl7eS3CVDzWM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHXOMadQXWhgF6RsrQC4lofPJXam1qmr5aWm
 Pv+ZdgkgLOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1wAKCRAFnS7L/zaE
 w9oND/9B2TQibJiQ94fYo4sg5Jc7PIXazrwBZOKxEffUtu865Wr3sHOIb73g/CPdrof6sPFX87v
 tJ0WbOpt1U5fnlUW9N7Ti8lheKmnC5fnqcb4NF/Jo6BLAQdt1VZb3rafkaYKEc2HwLY+cfjJiLn
 +qCNG0p8aDajzp9CfgiKwE8nR0GF1vo6Q4FOIQ3LHa5h0Bjg0QGN98IJYYBHLAVa9QSwra3jKWG
 TJgxLXTg8fIIvmheLbwstNvrAMB7f+0VqIWjSX0H7Ziv9BFtuW+hC9MrZO1u9jGdO/ch5l3/vaV
 LH2hcTM8yiAB3y3fQ+q6ilhh+PRLZNGMoGjCgthQyYi6gzW7/vs7m7iEazsevP/J//jUow58aq0
 jWQrwo01pMpuPp9NCQeRFfhoSlZhG7ct01F90PFKzWgzOkMU7Iw6NXtMF4x/0cmowzP1biWGG2D
 lPJEu7u6BrWuM6gTF6qxoYeNaA5EMECi5SF1keLY2ETkdQskHBsVSknhAg3QUIepSbjIGghr2Zb
 zVzumI7YOFBI6YF/DpPETCLtQ054rpVXLhhcbTGieGU0a8CI3a7S3sgLeo17uaRW4GUbirB+w/G
 ZhTwfaA4DIN+3Zw30zSAWpFkLgJSiwRHA7DQOlip2dpFLaN8V/XeLyMhfsR9krtKjBdB8F+1fkU
 b7r1+CMpTEED/sg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_055556_290517_9DEAEDE0 
X-CRM114-Status: GOOD (  14.22  )
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

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 96dd66c4b88dea34f1f24bed4d5ab66d3e2249ae..c3046e260cb958296a41b78b545f1ac7f377a968 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1572,13 +1572,10 @@ static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
 	if (IS_ERR(wsa883x->sd_reset))
 		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
 				     "Failed to get reset\n");
-	/*
-	 * if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios,
-	 * which does not handle sharing GPIO properly.
-	 */
+
+	 /* if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios */
 	if (!wsa883x->sd_reset) {
 		wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-							GPIOD_FLAGS_BIT_NONEXCLUSIVE |
 							GPIOD_OUT_HIGH);
 		if (IS_ERR(wsa883x->sd_n))
 			return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),

-- 
2.51.0


