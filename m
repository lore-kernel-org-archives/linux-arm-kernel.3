Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E3DCD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 20:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSEu/KQOdhdFHwNGT0hTQLZR1iOR8ZTNFTO5ZOxwoto=; b=pnvTMZKkvSCRtn1NINcXbK62qp
	+oUFOZXu1mXipwQ4GETaOJWuGWqW6F+FapTzUbZLYCAkhfUX3C0RWGkAX0nUs20VQ7yj9gsq/20OL
	Wu+NSAc4C9wOdokhFYwdCH+t72tVuSpoGFFXHs6bzkWEZoYvQOHqmp3vFp7KEBC9hSaUD0ZVkgNaO
	ITbT6mOboRr2aGKWntY08gAMUkNjW3rGLzVU7qV2AlhdBTEqwBWqJ5IqLD/Wy9uE35POZiohZNruB
	0v5EW+wUoT1MtEk2RbbWcQa9WlP8nwtJGPr+wRhQmiepxJTg7XjyBM9MArY2wF6s7hMBqg8VazhLX
	/CtsBAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEoI-0000000HHqh-1jzw;
	Thu, 04 Jun 2026 20:37:02 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEoG-0000000HHps-0G7v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 20:37:01 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-842288702fbso551924b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 13:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780605419; x=1781210219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSEu/KQOdhdFHwNGT0hTQLZR1iOR8ZTNFTO5ZOxwoto=;
        b=Ch2BX4DaSh9+uDS+kL+8ImURjBbQfaersSUfhJ/j7GAOzwLqrcn1CDYleoWgjNO5zm
         twgmpYG1VDZA786i9hPys1xxLS3hHvVJa2CDyy2BOOTma1x8zfekrYQ766rCITd2mrWF
         5eqHPSBfOVk8VuXktwKHlEDzTa+ZmjIJZx324/LuxKqhv02n3REBNOlaFVn7sqhIFp8O
         2ZpLz/VtySwlj8ypuzpchnEIk44U0/U/cmwWsgcHlHIj2e/REGh+o3Ua2ne0MYfUrYQN
         iWq0Yr6dCkgdBkKPVQOeQRF9fIjt82dxIPsxTaIkmUH8wUkD873DDOuxTvpX3X0UQxj1
         UYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780605419; x=1781210219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FSEu/KQOdhdFHwNGT0hTQLZR1iOR8ZTNFTO5ZOxwoto=;
        b=maVhDB5MvWzeWtQH54WjCaZN4Z99PKg6Fdir70IDmOvRskXfP2jtbq6tpvpHrCb1qg
         2c5FxgOJqdpEq/gfQbT9MfvS45Ab1K9YZRgAdYYeLjYXbojzFGop3t3vQx9tjZIEnNth
         veAzMQu8fGyGNxT6pibLQGYPZj7LCnI7gxMfWJm9UqW9gKI/vIQJlHEaY5/kzko3YlEw
         3POXiU0GtwSaN/oa/FX5V+4gOOXuEdogkiCjGnXCB4gxYQgtE8PuPj1D4VsGXlTSE3+1
         MT4sO50MiqVNwB92AY3i6MUDUXQGRnah1to5nIFnz6PwTUx9lAX+T5Rzzr9Ghz/eo7lK
         b+Rw==
X-Forwarded-Encrypted: i=1; AFNElJ8Sewqyqf+kd562U/iRZYwybciEJiJZiHYo/hIDDldPO61QXL9RwkHm/HxGDPz2zPpDbkjlmXxD8iKJnrHI5Mv6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmb6OeH0bYidQ1+/PXkRwrOXrTSKlBtrb9clMYZ915DI9UbZ9h
	G11MB5xH57F4VdqbQuO865IlXsH/r09KhSCxpzSzY91UNbv3CdDIAnEx
X-Gm-Gg: Acq92OGho558PqajngfrdQr6aBIFGZPuhO49Al0zTLBot7wMjLuS7EyDSTcHWlOOTXe
	zzGXCLYLyYZfX2I0Hs9iERX0kgSmRV1CH3V3X2yyXjSn95sU9m7yKzdB0bP9bI2jNCJP8nFBERu
	OHhJs7+PKYUZ4N9AbMgp+ma5zMYAMhJl6rZ7eMYNoOKYcSzasxMHR138mcAWBihmCW+z2S3RP2/
	/VEc98SK2jMXAiwtSRj1zZRWf5/RkrxsAYB1Tm1qfWlmD422S8qJR6gY8mlryUmL3lA8Uuz2jjU
	imIxMUpwwKO83W+4RxwFel552tNkNF10PHpjKIbMxq4alQozdadH/LkM5K4QpouEZSyEK6mAXFW
	moNtSfCjWElf4S107vV5wrt5QSXH1t+cmC194ecCgJbcjqrj6Cg/bmMau2jiyt5j6f7/Ha8QIEG
	Jx6ftkauQjvmesibV1hiI0Mvqg/11t+WEkj5msPL/EQAq6SPSkeF7N9eaU/rOx3jnxGwQvgSuio
	9Br
X-Received: by 2002:a05:6a00:acd:b0:82f:776f:a78d with SMTP id d2e1a72fcca58-842b0f9987amr265860b3a.19.1780605419056;
        Thu, 04 Jun 2026 13:36:59 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fe634sm7118257b3a.52.2026.06.04.13.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:36:58 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com,
	Sashiko AI <sashiko-bot@kernel.org>
Subject: [RFC PATCH 1/2] ASoC: sound: atmel_ac97c: Fix IRQ handler null pointer dereference
Date: Thu,  4 Jun 2026 20:36:22 +0000
Message-ID: <20260604203623.162640-2-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604203623.162640-1-manishbaing2789@gmail.com>
References: <20260604203623.162640-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_133700_104569_9B9DF2AA 
X-CRM114-Status: GOOD (  15.08  )
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

In atmel_ac97c_probe(), request_irq() is called before ioremap().
If an interrupt fires immediately, the handler atmel_ac97c_interrupt()
will attempt to dereference chip->regs via ac97c_readl(), leading to
a null pointer dereference and kernel panic.

Move request_irq() to the end of the probe function, after memory
is mapped and clocks are enabled, ensuring the hardware is fully
ready before interrupts are serviced.

Running make W=1 returns no errors. I was unable to test the patch
because I do not have the hardware.The issue was flagged by the
Sashiko AI bot.

Link: https://sashiko.dev/#/patchset/20260530052812.115994-1-manishbaing2789@gmail.com?part=1
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 sound/atmel/ac97c.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index df0a049192de..cd74395dd222 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -734,11 +734,6 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 
 	chip = get_chip(card);
 
-	retval = request_irq(irq, atmel_ac97c_interrupt, 0, "AC97C", chip);
-	if (retval) {
-		dev_dbg(&pdev->dev, "unable to request irq %d\n", irq);
-		goto err_request_irq;
-	}
 	chip->irq = irq;
 
 	spin_lock_init(&chip->lock);
@@ -786,6 +781,12 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 		goto err_ac97_bus;
 	}
 
+	retval = request_irq(irq, atmel_ac97c_interrupt, 0, "AC97C", chip);
+	if (retval) {
+		dev_dbg(&pdev->dev, "unable to request irq %d\n", irq);
+		goto err_request_irq;
+	}
+
 	retval = snd_card_register(card);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register sound card\n");
-- 
2.43.0


