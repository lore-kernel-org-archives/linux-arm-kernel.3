Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BEACA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q67A6dEiGrYDiWG1Ph6/tY11Zd+/g6UDAqeQXHMdpI8=; b=Yyi9xUfzasePmf87Vk6jueZDdy
	gWuLH08Tf6q+YbHKdFucsdTfO1TuSidPkZBwHvktCVsQOW96rQblZ7ZWQgay5DzX271iUuNLsw6FK
	B1zn/h35bIvvnPJMp0AtZ0eAv33MqHC27+ekgjC3MRVNLIDBOZUNn45tZ7RdG8Y44goUv6kJHZV+a
	1wvI2V8klfwBUn2UmCq6MfU1e5qp0W3JjVvHaZjKetjSP1InVbxqnoXukHGsc/V7pdGgPU/oGNTyb
	qI3FlPp0mzYQW6EImcDHKwKoYrAM5I/2sDIS8uaL6zlBQHLjN+XOaEaCM6AxCY+ItP20LG04dFWmc
	Ym3KnBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrEB-0000000Bfkm-1da1;
	Tue, 26 Aug 2025 10:48:35 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqO5-0000000BVlB-2Zxy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:54:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45b65469a5bso7320435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202084; x=1756806884; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q67A6dEiGrYDiWG1Ph6/tY11Zd+/g6UDAqeQXHMdpI8=;
        b=tI0z64JTm6JGpLWcpqe5Gt5ONSGJV/m890zFirvzx2cWNoKcLPZ/MFz/WIdu/aRuZK
         rhuLttd7hI2ovi2NF6Mpd1fL9T8q9bLLlrRIsyqkSn9thKoZw9ehbQl27ejQ/PFgG5vS
         UcIdxPtbUxjskPRfIhUFU6sLE6TtK7mJW4P+OiW6MyBMq5FbnSZE0i45xxFOv7FyNBJz
         rnSVAjmgtIZ9K1jy9hTtsQSCT5EaoeeGpcVQea+LXtRmRrOFDoMvVBFdVYCHggBlsB9S
         6GLtLL3NlUy/zoDS/PK+ItatPRZw/O3MA6Ixvc9hufnEMxe48Q40OvCh4z+Q5sg58Udr
         r93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202084; x=1756806884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q67A6dEiGrYDiWG1Ph6/tY11Zd+/g6UDAqeQXHMdpI8=;
        b=AvNLrj65Q1fLUqTQEiTpQ7Eh2fpggPUKiiTucYqjxApIeLgiQn0JotsuaPV9pjenQX
         YknXy5w0D+X493YTRRoe0D8/Vq0Dva7Y7ZeGoVZ0S58FEHNSED9GJrOkfkEJswxFifbk
         JahH87cphzaKaNHD7R01iW7hOSTC2ZPmS4YguzUdkOCH4OLaE7Uk7O5CdzVMCYReCelP
         lKrq3iJdvK3Btq5b72vz8ld10D9NLiJlERumK3OuINGTNRKuLP5crMJWhXuqzu8sVMjG
         oDEq8Jv6FcDI9ARonWO9vRin1HdCl8ubmWxTwQs6xWYaIpseDcXLaRf63cuwQCJjVlSp
         plmg==
X-Forwarded-Encrypted: i=1; AJvYcCWcLajUBsDTdMVrTuV6qNnnsMAEb5Ypug/Frru1/m/jMJzSm5FygWukXYTeRRphcNLxkvDvRdxI5GuNpGZPNB4K@lists.infradead.org
X-Gm-Message-State: AOJu0YydkAb8gh4FtH1Qoqqoix/EPWJiJkrQp6Veu55LRGa60WuAI10F
	+sNcZ+dGnpy5ak/tIKnvfJP0QBd+WNe48/0Kob8NAgp1tJCUakgX+GODAieiKOo6g0E=
X-Gm-Gg: ASbGnctvlneU/SJDJ9QkeB4yZ8cGJs0INqhVLLIR6+PL84VvTgdv/P6hV2/zX19JfVe
	SdukzA5MX8Dk1k6bedLF/fDuP1WTfCCVWLeZOFiN83UENoeujZQ1V9Wkm5dJq0N38zu/yKJtA8i
	R2pVOp+zxzO+sfTFKWXU7TPtNQWcs/PRsmd4w5b9XYixYtwdfH2s+r/3Vxpnr5yAcnRQ+HyOEj1
	TH/K5spevedCoD2rXphNE5Xk0o295cM0S7G8yrh0dlTxCEqeqJyv/jVKglBINiCCQF4u23aGUCW
	eslQezi34ilvgY+Z8wdIN5j/QI+mIEWizMjDxgX+9LOQUC/A6wQU3CE62tGWXa66pfUbBJrrTaG
	za8J8QasB9vQdE1sTvIo76gwiXNoS
X-Google-Smtp-Source: AGHT+IGbWWgfy4oVGNVw2G0/m0zq0IcbBhHudnTL2tazbGOxJcFH5HyRp6Ol0cIcccqIvQx6y5xP+g==
X-Received: by 2002:a05:600c:4747:b0:45b:627a:60cf with SMTP id 5b1f17b1804b1-45b627a62cbmr53835625e9.24.1756202084036;
        Tue, 26 Aug 2025 02:54:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:54:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:54:35 +0200
Subject: [PATCH 1/6] gpio: stmpe: don't print out global GPIO numbers in
 debugfs callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-dbg-show-base-v1-1-7f27cd7f2256@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2113;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=po0oP7+JqvmBUahZ4Cqs/cpV/Mj5xJP4shR7qEp8+ho=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRgPBjr2HKTi0bsdoQ+b83BxncLsMVofdaqL
 bBCOoX3jOuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EYAAKCRARpy6gFHHX
 cjpsD/9JA2Mu641ojLPtH3ELxbd1lMoD5z7nrGO7pgXSg3MrQTP3xEwfO960EIqZR329r7Z1QBW
 kgEI1Y9ntL0D9F2svgaOi7m77AL0fTt6DRGpXOeR6mck2ggG23Nl6NR+iXkFRaMUsLMh24VLl7f
 +TREbodVkT0wQO7Cms6iqxY+ok9xpZxm3q/RU5cUzMGvAybGlwifBuMwsUhXR0XfF5Cw+GC49u+
 K/09nsJ74+pwONQQJiUtzozSB5D/dkhRLdj1qUrMUDd5ctDD73jO31BDAmIgG1VKAyftQ9V3Wlg
 03KcmUwnODwAbhoQ3SZUgr0he2NGnEGekLPUjxxvcbKlwL3V6b5QvtaO4OwehJBb27wcmBANz8L
 CH0u/KdL/FAiqpAxaTKFLj4sPdgha+zuZRQaf37umOn3j9zl/IXlGtyj+KtP+fRR2IjU9/kpaza
 ahfnJHw3sbyOOcFycHXrgEUIpB6lYk/AZy8tUTTiGCzHqma44jp5C3bJhZQeqd4Rq14wyTvxER5
 fLK2WVpD09m17FcOX+f9Ok071nbFOnedGUkbLlHh0RLZf+5zazE7W6ZgTPSf1edBzJ+inVhaYIO
 KdFZSLDzy7ovq9Zmi5AaE3NkrCBlTI7WJy53WCGnsYGgkrZTB6FS+PRfWjXjVXeFjBoFCJ34hB6
 UIn+EnuvmR2BIkA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_025445_661058_6824F706 
X-CRM114-Status: GOOD (  13.67  )
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
 drivers/gpio/gpio-stmpe.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 7bf270af07fe49e7a778e91134b5bc5e7d0a13a5..6faf30347a36396fe9ab14ab4efb7331f78e95e3 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -262,9 +262,8 @@ static void stmpe_gpio_irq_unmask(struct irq_data *d)
 	stmpe_gpio->regs[REG_IE][regoffset] |= mask;
 }
 
-static void stmpe_dbg_show_one(struct seq_file *s,
-			       struct gpio_chip *gc,
-			       unsigned offset, unsigned gpio)
+static void stmpe_dbg_show_one(struct seq_file *s, struct gpio_chip *gc,
+			       unsigned int offset)
 {
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
@@ -286,7 +285,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 
 	if (dir) {
 		seq_printf(s, " gpio-%-3d (%-20.20s) out %s",
-			   gpio, label ?: "(none)", str_hi_lo(val));
+			   offset, label ?: "(none)", str_hi_lo(val));
 	} else {
 		u8 edge_det_reg;
 		u8 rise_reg;
@@ -354,7 +353,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 		irqen = !!(ret & mask);
 
 		seq_printf(s, " gpio-%-3d (%-20.20s) in  %s %13s %13s %25s %25s",
-			   gpio, label ?: "(none)",
+			   offset, label ?: "(none)",
 			   str_hi_lo(val),
 			   edge_det_values[edge_det],
 			   irqen ? "IRQ-enabled" : "IRQ-disabled",
@@ -366,10 +365,9 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 static void stmpe_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 {
 	unsigned i;
-	unsigned gpio = gc->base;
 
-	for (i = 0; i < gc->ngpio; i++, gpio++) {
-		stmpe_dbg_show_one(s, gc, i, gpio);
+	for (i = 0; i < gc->ngpio; i++) {
+		stmpe_dbg_show_one(s, gc, i);
 		seq_putc(s, '\n');
 	}
 }

-- 
2.48.1


