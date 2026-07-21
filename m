Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590FAC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 22:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QGYc1TdXcvIKmo54F2N01YiaD23wedJvo9tZPTjUvCE=; b=hxb5lPCV4Y97KhuNfDPONAUECG
	7/N5PVj3p1M1xcENrNmtLidyRukjTOarmx+Ueodm8W/GH+LBlNj6gYM6iqCZ3lY64rOJJNEOlv6VU
	1uFl97/YbAaDXCAExxabf4TdIMIHf8R16OfclsspPk/7rHrChFecLEpxtlt6AmqdxVyCkcRkGQtxM
	1moIzF7kkoT2D17R+xXzpEy0ANv0uhlQnoGeSeLHHRJIdv0Mp1AmdFaBTLLqg/CzPLVmGOAhzVSwT
	XAw8iJtLtBSbyCy/IsiKvNTXQ9CMh77e3JZv41CxgNyg23m0w327H6Z/zLg+2MBEfKoIUad21pOWK
	/CTiENnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJLt-0000000AXJy-39u2;
	Tue, 21 Jul 2026 22:54:17 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJLq-0000000AXJZ-2NGD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 22:54:16 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c999f162c9aso7521524a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 15:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784674453; x=1785279253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGYc1TdXcvIKmo54F2N01YiaD23wedJvo9tZPTjUvCE=;
        b=OT5QomZKEJgmN5lVfyj/6pDI5dbUpAp8tIudgsbCxp8wcTOgh0l4xyluzqohla1jBn
         FLAm5azZ99cStlwhBAvg0El1DHs//Pa113sIWU+MCVTQ5RGNbwrkyMtEk15b1VI7rJNQ
         tyl8y+ZoAFANejQcsKWMXfVt3bZ6baKUT6uRW5U7FQC+6EjihOvlxRPqoZCyLu1PTVyU
         /E0vKdJN2RT/KOMS0F7vPXKUziHkwOPJRWclHFnQ5bDIHFdZ3YTTGTjvzDOMOdFUizTr
         2hwx1V2/NFSjLqaexmzREXwwSpSNh6vbmhrS4FCvtb+s5VxMQsQ74RlnP+1EQhULEPiR
         GBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674453; x=1785279253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGYc1TdXcvIKmo54F2N01YiaD23wedJvo9tZPTjUvCE=;
        b=Aqzbb73J3ezwxN9Xq2fDiGrlfP5TvEa6y0Ek9t+wOohLrGCcnw2LFuMPCXwXobBpNk
         IdKNq2xb/jdKWYFuWjlHx2uLWahcMLIJg+cKPZuZE0Gvai0/TNx8Y8SKs9AxV3WczZ8R
         uCpUsnrPupPbCXy6kpTLXX/Yt1cSwgx4EkVrh9/jr+4Gqk0H5kTDqwNTU2aCW25ZkvCj
         MPsXiPTxHEVzQ5PrEjZ9E+p9QB3WhCyxkql5bLOZcklfrBvNbyRo7vUliefl2Mx1kOyW
         TSnSqobmxXfJBCeJ4TjCKCeZrdkg7/8LZi7HPH+oJ2+43xwoxywCrytyhgMFcKHW3b6O
         sENA==
X-Forwarded-Encrypted: i=1; AHgh+RpzaJLyLy7MnsSbYOEclDKrrIVPuWWr5fYgxAcbU25QuvdEv8Mhym267KZrSVrNcnA8vXARu3PSs291Vm6BHWSQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw45cGK//UI6ARhznOTCc3B/Dd7Y7oUBF23JplktCahkvBybGwD
	Yau2aXueppkpBbRu/cfqgpVdOXTt7daNpXwx3Vtva09SaEhybCzD1bxSch59Ow==
X-Gm-Gg: AR+sD11TwZUQqCFXpGVeBiklsYsSUvTSWkLq3lbuE5Y9jre9YV8iiwkH4fd/lzWoRYp
	LYAREaV1K7vC3seGwqH1uW/e391DIauk8d5+icFvc/o5emSdIIs3dLh8KnAUZ39uunW+VDOqYRQ
	U+ElKmHqnwIzvvKO5MFJzeP5rs+JPpQ1T16ZOmc+HpSTvs1qsuP6hiKIcxAoC6XWy6rQPLjimlA
	uVil2EPMn0WqCM2ghHMcGrJqcSvXqUiSB3Ur/fng/PfT3XttIu2jkP+oe1kfHqbDeB6YHFenwiX
	+Prz+5ncdobwxBqtFxmxQSy4U3f1l7//WyLMeanrhBGbxnNuRHnrAgcYtUpsLmn0p4bAEwLH0Nh
	sMz9woG1WccKG+Vq1zy2+mN/cWMW6d0eDLwe7MLNxEdcgHW23LvHlGEgLmY7KnGVJ3uvIrQjId+
	osT6cYamDVLey13HxM+NM9Qqu5f0Hc3VFdmfeBG0WoJwBLTChpYeViwJR8sknAc43mRJH776E0c
	dAzOWEyf6yVTjKlny/ewj8zrMhXlt2B24jpyIkMSt9E16ftL8deuFE=
X-Received: by 2002:a05:6a21:7008:b0:3b4:8ba9:4d8e with SMTP id adf61e73a8af0-3c3ad7a3d10mr23380821637.23.1784674453530;
        Tue, 21 Jul 2026 15:54:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a884esm199994a12.23.2026.07.21.15.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:54:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] ALSA: atmel: ac97c: use platform helpers and devm cleanup
Date: Tue, 21 Jul 2026 15:54:11 -0700
Message-ID: <20260721225411.815553-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_155414_634501_66F59A05 
X-CRM114-Status: GOOD (  19.39  )
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

Convert atmel_ac97c_probe() to the managed APIs. Replace the open-coded
platform_get_resource() + ioremap() with devm_platform_ioremap_resource(),
which requests and maps the AC97C register window in one call. Switch the
clock to devm_clk_get_enabled(), the card to snd_devm_card_new(), and the
interrupt to devm_request_irq(). The now-unnecessary error-path cleanup
and the manual teardown in atmel_ac97c_remove() are dropped, since devm
handles them.

platform_get_irq() was already used; tighten its error check to irq < 0.

Both resource and IRQ lookups are equivalent for a platform-backed
device. The AC97C register window is owned solely by this driver, so the
new region request cannot conflict with another claimant, and it is
mapped exactly once (no double mapping).

No functional change; built for ARM (allmodconfig + SND_ATMEL_AC97C)
with LLVM=1 and sound/atmel/ac97c.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/atmel/ac97c.c | 67 ++++++++++++---------------------------------
 1 file changed, 17 insertions(+), 50 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index e394205f469b..234549e17351 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -693,7 +693,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	struct snd_card			*card;
 	struct atmel_ac97c		*chip;
-	struct resource			*regs;
+	void __iomem			*regs;
 	struct clk			*pclk;
 	static const struct snd_ac97_bus_ops	ops = {
 		.write	= atmel_ac97c_write,
@@ -702,42 +702,34 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	int				retval;
 	int				irq;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!regs) {
-		dev_dbg(&pdev->dev, "no memory resource\n");
-		return -ENXIO;
-	}
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_dbg(&pdev->dev, "could not get irq: %d\n", irq);
+	if (irq < 0)
 		return irq;
-	}
 
-	pclk = clk_get(&pdev->dev, "ac97_clk");
+	pclk = devm_clk_get_enabled(&pdev->dev, "ac97_clk");
 	if (IS_ERR(pclk)) {
 		dev_dbg(&pdev->dev, "no peripheral clock\n");
 		return PTR_ERR(pclk);
 	}
-	retval = clk_prepare_enable(pclk);
-	if (retval)
-		goto err_prepare_enable;
 
-	retval = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
+	retval = snd_devm_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
 			      SNDRV_DEFAULT_STR1, THIS_MODULE,
 			      sizeof(struct atmel_ac97c), &card);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not create sound card device\n");
-		goto err_snd_card_new;
+		return retval;
 	}
 
 	chip = get_chip(card);
 
-	retval = request_irq(irq, atmel_ac97c_interrupt, 0, "AC97C", chip);
-	if (retval) {
-		dev_dbg(&pdev->dev, "unable to request irq %d\n", irq);
-		goto err_request_irq;
-	}
+	retval = devm_request_irq(&pdev->dev, irq, atmel_ac97c_interrupt, 0, "AC97C", chip);
+	if (retval)
+		return retval;
+
 	chip->irq = irq;
 
 	spin_lock_init(&chip->lock);
@@ -749,13 +741,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	chip->card = card;
 	chip->pclk = pclk;
 	chip->pdev = pdev;
-	chip->regs = ioremap(regs->start, resource_size(regs));
-
-	if (!chip->regs) {
-		dev_dbg(&pdev->dev, "could not remap register memory\n");
-		retval = -ENOMEM;
-		goto err_ioremap;
-	}
+	chip->regs = regs;
 
 	chip->reset_pin = devm_gpiod_get_index(dev, "ac97", 2, GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->reset_pin))
@@ -770,25 +756,25 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	retval = snd_ac97_bus(card, 0, &ops, chip, &chip->ac97_bus);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register on ac97 bus\n");
-		goto err_ac97_bus;
+		return retval;
 	}
 
 	retval = atmel_ac97c_mixer_new(chip);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register ac97 mixer\n");
-		goto err_ac97_bus;
+		return retval;
 	}
 
 	retval = atmel_ac97c_pcm_new(chip);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register ac97 pcm device\n");
-		goto err_ac97_bus;
+		return retval;
 	}
 
 	retval = snd_card_register(card);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register sound card\n");
-		goto err_ac97_bus;
+		return retval;
 	}
 
 	platform_set_drvdata(pdev, card);
@@ -797,18 +783,6 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 			chip->regs, irq);
 
 	return 0;
-
-err_ac97_bus:
-	iounmap(chip->regs);
-err_ioremap:
-	free_irq(irq, chip);
-err_request_irq:
-	snd_card_free(card);
-err_snd_card_new:
-	clk_disable_unprepare(pclk);
-err_prepare_enable:
-	clk_put(pclk);
-	return retval;
 }
 
 static int atmel_ac97c_suspend(struct device *pdev)
@@ -839,13 +813,6 @@ static void atmel_ac97c_remove(struct platform_device *pdev)
 	ac97c_writel(chip, CAMR, 0);
 	ac97c_writel(chip, COMR, 0);
 	ac97c_writel(chip, MR,   0);
-
-	clk_disable_unprepare(chip->pclk);
-	clk_put(chip->pclk);
-	iounmap(chip->regs);
-	free_irq(chip->irq, chip);
-
-	snd_card_free(card);
 }
 
 static struct platform_driver atmel_ac97c_driver = {
-- 
2.55.0


