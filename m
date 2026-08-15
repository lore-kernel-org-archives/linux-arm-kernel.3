Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B4CC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7rlTdXPQx8KtQhzgq3ccigzE8IVB9jSLAgF9XPuDuY=; b=WCr7vxI3NgcIHeHrjPzeqa6CHV
	ZxkOW9AgRcOlwyyN84pcdCDiJQrgJrzbZwtUBXMt5/DNAZ4mW6oMiOZdCBREWOXhy1KniQHAdaJ6M
	+kPKo1Ujtht0ZMlgWvcKbnLWS3j3iQw9d+JVk7/W6jHUE0+nCFXK+Rs8F6lh6PEC88u9IWDTXDtXp
	RK4Nde3QsuY12/emJ0+reZZM549vHhZxN9hhfiu2cX3omwRTi7Su8WISGo0+O6RXKSCM+cnD8Yfvv
	or8oYuZwv+81CZlqxF/RYfELIM5Q7fiGSocH3AwgeXN0V3UfVQNYf0YeSKyjMDRg/7tlPorRjZvXs
	5ne1eEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvHEF-00000003wbx-0KA8;
	Sat, 15 Aug 2026 16:27:27 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvHED-00000003wbA-0D6M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 16:27:26 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38101f85591so2856498a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786811244; x=1787416044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7rlTdXPQx8KtQhzgq3ccigzE8IVB9jSLAgF9XPuDuY=;
        b=plwz5Qy6OF5p1b3yQx4pXDvzNR1c/Hh1UzU/aXRiKGebwkU9CVjaCjNDI/efwnKxpA
         x9q8Ew7DvHOVjI6sZ1IWBEPeBBSM1JjktiuY3p6M7LSL9YXNsN1tFf+hzPWdsclW4/NR
         IVi1AScurbJbwhpYkTR0GnjSK6I9pRIbWT2bGUiD3SBsqzNfxLsO57GVEotyZFuct5gJ
         k1fXKhM1z9r2MkvzsXP04UtmKCuJ1ImUM1wcu++DhYBheDZ9O0WpHar318rKhR6DZUIr
         5/kNSSsKbnx+J5+JJyOHbuRq0N6bn6DGqZwKeW2hMH017IXwy5w8U16sz82tct0BkKD/
         O17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786811244; x=1787416044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/7rlTdXPQx8KtQhzgq3ccigzE8IVB9jSLAgF9XPuDuY=;
        b=kHjXdwdSH03Ualnh7alKRhVzd+/tcyxYsnLKggbBXNXq3Zubb+3NzjAbl8KT92BUET
         YDtaHogk966EcRt0vKJsJrjyE5KnKQ1Y459P5vVU7gt0qS6/Pqrk0ZITotBPBe3nXPkh
         r/cAZfPq8stK3DF+of1oTvGoyoaIVHWvxp6JrBl2UDV8rsCFkt3Ig6QuNzecKDQecq+G
         bgomX9xi8y9xyGLML/rKda6qfl1BbHUxAzYZvJymQtyxAPD/jW4Ip7so4C56b6jbDkrA
         OPQUaFOlklX0egViO+Li7vpbhOX888/J9Nn61grXYoZLcr93GCCEVUkJHtzEJY9qcEwk
         Y5LA==
X-Forwarded-Encrypted: i=1; AHgh+RpOvegoTJXH/N0dWczfJoCn0hZBJSxGbAHK8VQ0cmwZR8F/8IzicarWT5CePc3CsVNVo62ptOCs1tXAmyoqmrc9@lists.infradead.org
X-Gm-Message-State: AOJu0YzN/PilkTSc/Vrp5MNo4A6sLvsBroQ3fF4KZtrbQCAieRlHG0VP
	rsQU1JI/1pWTxGaAPxmBhNmODNPhdF0Agz8rBdHiu+LPsNUfis4H/s/4T9cTBf8q
X-Gm-Gg: AR+sD13diro5B4T0/5BFL8oKUr1dG51iDU8Qc6e5jxuxq+Xg8VHsOqjqBaYEsua0jQn
	Rovdj2ARNLVtdaL+y5oKNmycP8zuB17PtawG12zF9u6jxaMkJV4ITiznVI7V9JBNsB6EZf7AF+v
	D8tVqO6dcHrSzXCetNbzCkvB52tkvJsJjn0ofNPZLGfdJbD8zIWV3yyc/Noz+9omw6+5PVrQLu9
	Ts/9eCJdpE822S+qovCcVnVsX1phYU5/ZqCDpzhIGwSNFqST18TumMZ7GF59M2rRu7X9U6T4bE3
	PkbskHUAC6sJOIfZMfpVv8Am8MabTtnFulX0XSKXJwzsv0wnJmaEJyg2/XenTlS+HEXWrye0b9s
	aYFefNrlmmWyouRpBLAvGaroNZUATWdc0GYZAUdPyqQJUESQtStU6Mu/zY2RkIjDADUP92Hq3Ov
	kl8tbxyX2c4EltQk+j47CF9JVEKycpwPo+aWxPDpoTaB2EwaOtDUdRkQc/RDcD8sRBtugMXVutb
	uKlJeDo1rzNrfRfyW+m9pmi+qSxC1xE
X-Received: by 2002:a17:90b:37c3:b0:390:84db:888e with SMTP id 98e67ed59e1d1-3933afb4ba2mr11298200a91.7.1786811244193;
        Sat, 15 Aug 2026 09:27:24 -0700 (PDT)
Received: from Ubuntu.. ([49.43.242.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ed5b1sm36427232c88.8.2026.08.15.09.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 09:27:23 -0700 (PDT)
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
Subject: [PATCH 1/2] ASoC: sound: atmel: ac97c: Fix IRQ handler null pointer dereference
Date: Sat, 15 Aug 2026 16:27:05 +0000
Message-ID: <20260815162707.353893-2-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815162707.353893-1-manishbaing2789@gmail.com>
References: <20260815162707.353893-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_092725_138020_F9A4B118 
X-CRM114-Status: GOOD (  15.25  )
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
because I do not have the hardware. The issue was flagged by the
Sashiko AI bot.

Link: https://sashiko.dev/#/patchset/20260530052812.115994-1-manishbaing2789@gmail.com?part=1
Reported-by: Sashiko AI <sashiko-bot@kernel.org>

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 sound/atmel/ac97c.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index e394205f469b..205475157e72 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -733,11 +733,6 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 
 	chip = get_chip(card);
 
-	retval = request_irq(irq, atmel_ac97c_interrupt, 0, "AC97C", chip);
-	if (retval) {
-		dev_dbg(&pdev->dev, "unable to request irq %d\n", irq);
-		goto err_request_irq;
-	}
 	chip->irq = irq;
 
 	spin_lock_init(&chip->lock);
@@ -785,6 +780,12 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
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


