Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9744BCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUzxj3AwlFMn/Cb4ZnmJ6RjeXFL5y1o/ilqQYnR/MVw=; b=zWO4qobwwkcelySw0tIwB34Y1a
	C4bbpmZ/9vTd5k7Npkhzr3nNR4LTYb1nqIdFuuRwFrvoERkDvucLkr3rOpacA0JNRTREmx0dAtHza
	LKO7oNecFxYMjbaWOfQJTMssYTVS13PkH2fuqBchJ6n76vWUK6q+bZma/F44xOZN17EcheFyI3D/E
	CUpV0UtbtOaIfPwwdnZecMO3lZCySe3ZVkUAx80YnoWuXL5gwzUia+DwE2H/aRUBSOuLy5SZa6psG
	puRBKqkCMeMqz45lDoS2VwQMbVm6MIl/lyViK+PyTtD64dTP/edpBXMjhmG8xn1Krq+95rFwvKAdO
	mX9jAMFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrJa-0000000BgLm-02CX;
	Tue, 26 Aug 2025 10:54:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqO7-0000000BVmB-3nLH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:54:49 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3c6743a10e3so2191502f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202086; x=1756806886; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUzxj3AwlFMn/Cb4ZnmJ6RjeXFL5y1o/ilqQYnR/MVw=;
        b=EMT2S75hY5khNvbyMyGJ1MBp4bQ/6sDl/4AltLvmVfJU/ohi+h0UIOxReCrxQh7dJg
         4cixKpfxnbe4b1aiZzHC6WtUE7245LQ+x6KDg2O+6Jf3ZMQgV1RuVVeZ/E6SKABgQ4ri
         dgL4MOiigLjGJIErrvSwZ1T5XDIuxO5TJCpW10uHQSEWeHu7YobN286oq4IV7P9yBhZQ
         rzSdUYAX2/GKbpjX3NbaXE9EyrqJoGq9u0EWcQYdBpQ3FptYDLyi9b0GTGqZzUUhtEkf
         tpfWegIUX+0lAdGD/hWuiCcoWpO3/fGcBRpdmb9+G+ObjW6jiBZxRVYGtf3SvKEnCYJG
         QsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202086; x=1756806886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUzxj3AwlFMn/Cb4ZnmJ6RjeXFL5y1o/ilqQYnR/MVw=;
        b=wIbIbfj3p2lwCWaKXDpXeIcNtJCIGuMsY/sHe0Uc0cEvrMl9e6Xfos550Pkj0OP/xo
         D/pQhCQO8ZwzOybhDU4nY3MC5feRhaZLYHP6w4F0dffVEl/3cecFmZEcPUc/Jz/0Wc7b
         6Ajtu7P4BGacub4XVAhSxi5CEwK/YIcI7DV8sLo5x2r6rNhRXxW5HP1bbc1AK6Jm6gd+
         XKLLJlBPSCtN1CkdfAYhACrNl7u5m8w5AQYGejE+wY2SeYaOO/7Teyuzai53CNzT6mcR
         9vQ4lKKEHzPDY75x/5DGgz350mbNu7RuogzmeYH4SoSQSkkn1FQKR0CjOPghfp2wM9QK
         9pKw==
X-Forwarded-Encrypted: i=1; AJvYcCXasyTpDYRaEw+HlkgYdxlMzv1Y7MYGDwloR5402GOcw5geJXuUleRZ5bCUAMBIIVnQNk9YuwRhO8T7xXwfBVhC@lists.infradead.org
X-Gm-Message-State: AOJu0YxwfHk8beLNxXNiE8tWDVz5PzmJ+s29y/94glTymsYi46CjwKZl
	/5k6K7ucvoChUZ2y8yvbw52E/nzY8RE0StiaMOkxgcKCfVpl1EVtOeQXRdxAzZwzXS0=
X-Gm-Gg: ASbGncuFXtrEvZ7UkvPuFQQmbXEMPE2voBtzfhIebUO3D6P49+LpRuHoVll/OLHbzBj
	TNlTAcrZ96hpndWTQ+YwRg6kRCPOv+/MPn8nwONiIcwjBZBHEpaPtPBXuLskr1gRLrGP0YP6H19
	6LxWgCFDAiys086QkKSY0dgG0S5hR3CNu+geLbE8NxaqkjfsQLEGpZRqVIdMpxIeWb1P70O9Rdq
	zEPV3+bLwf3j+Ihx5Y6DNOkFuy8WHS/FK2kbrOYwsa78mGjrN0uhaX88GskFGhriEl4nVQEG+hw
	Wcuuwh+Q7u1B/gzz2K371BrKWZOhcVhY9+Ss341FgOHIC6dFpO3pQML96lCHnXWeqtvbKXRU6yK
	A7stPhHDdXc8jw1VqFw==
X-Google-Smtp-Source: AGHT+IEq7Pdf+yKsvkWm+MwW4ovsbwrrSZre17IZ6PflaifIEPCYnP/bAcdG3LE+PYHL5F83Vsr22Q==
X-Received: by 2002:a05:6000:26c8:b0:3c8:e436:a5c6 with SMTP id ffacd0b85a97d-3c8e436aaccmr5104411f8f.23.1756202086354;
        Tue, 26 Aug 2025 02:54:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:54:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:54:37 +0200
Subject: [PATCH 3/6] gpio: wm831x: don't print out global GPIO numbers in
 debugfs callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-dbg-show-base-v1-3-7f27cd7f2256@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0doGTq4jVCHH5hAlopIUV2rywiE5EAOXG6MofWNOqdk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRgPCC7iTt/8LaCLZ4zIye40qfjGVFVH5elC
 XqjSnKoEeKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EYAAKCRARpy6gFHHX
 chxeD/0Z4DZnn9ZzUFJ05Yd1652M+GEyzC29T6CIFKaE/dlhyax7hUNfKtRHYE7U+/Spudq+OPU
 vJpWBxUSWpqDHubZ2+FPbYRFosDePbdOqRMxdp6PogyXJ6HA0eWV9lh/DRkC+YMUdAVFZkgHWCt
 EHFhnQDH9SorKiEdPmOueFadYPqipZA6k/dJTyGQBqAhZbymA0vEDlHdPZlIwzciFLnGrFaDEaF
 E4Mb5Z642juTfhqJTlMTtqqH4YpCM7hA+I8TehIxj3asLn8h03M6Uv/wndoaanBjNzP+3IVvXTJ
 MAe7b1pfQmMSdvjjcJCOJI1YJlkMfpzj9MT5QsNb3N790NaJqK9ADIUAyEBK5y8AVbK9fc4cQt4
 CKOND2GqpYC7JfJzlizaV7LUtlSDc/HCRZiZq5LuZYiojlL2MzexXaLVgbKzJaQwmtzRvLAJzDE
 Tz7aeHvkzd1zExLGalCuHKHq5VBgf8ER6svb5hI74wr9dF1MYN87PkOERip+qF0spc5T6TDwvO8
 JiUwldshiqUlKmLFe/jhOAeFGDSqFn7UdHbFe4oNKtPwQA5Km8D353wRUjpBGbc26wCZYou+zH8
 c6rkZ/kNTgnFo9mYAVMVY1J2JlFZf0AF6uNaP4/Ho19bN9924Iah7g1D96Yxentnt61AeCveARD
 tThXGIwo2MT83dQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_025447_957103_C0F8030E 
X-CRM114-Status: GOOD (  13.00  )
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
 drivers/gpio/gpio-wm831x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index f03c0e808fab27349c39f9efc41e5ea420b2d03b..489479d6f32b3a8bcd7592e46ad61ec70794a2ab 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -159,7 +159,6 @@ static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	int i, tristated;
 
 	for (i = 0; i < chip->ngpio; i++) {
-		int gpio = i + chip->base;
 		int reg;
 		const char *pull, *powerdomain;
 
@@ -175,13 +174,13 @@ static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		}
 
 		seq_printf(s, " gpio-%-3d (%-20.20s) ",
-			   gpio, label ?: "Unrequested");
+			   i, label ?: "Unrequested");
 
 		reg = wm831x_reg_read(wm831x, WM831X_GPIO1_CONTROL + i);
 		if (reg < 0) {
 			dev_err(wm831x->dev,
 				"GPIO control %d read failed: %d\n",
-				gpio, reg);
+				i, reg);
 			seq_putc(s, '\n');
 			continue;
 		}

-- 
2.48.1


