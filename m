Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7E3CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 20:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6RDOJWyZ5/u9ipkjQCKV4Mf6ByGXtSeoznwE7qqlAc4=; b=jyR2CCThDofWpas3eg6mTQftoc
	j+iMsRLm6ZsuQfHRWoO9xQsSQ4YwrHvT6G9Z3t4vUILqHUbtzCGGYKPObMCySnoTgEs/Y8JKw5YWt
	YDm5XLZc6/Ykw6taXbdy6pxbDwgHyqCljWoZHXGAIY0a+xVz9MWsbOvlYrC4W9N+VMHdd0mWe3YE7
	xSVgPDWs03syY82SVl60U5+L8l6GewwkrbL7oTxw10wk2BFA9KCzILrQH6K/s1DVB5pcAnsO3J2Oc
	F+D3Se1QNv54v04Bt9b1zSo+yvqAtgj9QDPsQOMnJE11zPjnZ2RFVbexyuEKFB6FwGG5Je2X08Bsl
	BbNw6qxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEoW-0000000HHuS-2KSP;
	Thu, 04 Jun 2026 20:37:16 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEoT-0000000HHte-1jVJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 20:37:14 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84230ab8857so535081b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 13:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780605432; x=1781210232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RDOJWyZ5/u9ipkjQCKV4Mf6ByGXtSeoznwE7qqlAc4=;
        b=TGhx5juXbc73BoOJUlfL6ZbLZtkagR/fwJFmAXg/mvSFTQc6S6Udh2fhfzDf2ztMcQ
         MVA5YjiunjMZRuWVer0lZzhAEx5IocXGBvZ7lWfWeYm/UdRLticbAQmFXyNwU7O/SqmD
         73R+ujFAYc7KJnRuEJ8bhX5xBuRg8r41lAx1NjPZS1KaoVEIFfeLuUFDU4Fzc9siStxP
         X8m3KQpTwaelAABMazAR8C52aDiWkCTCgkZyL0Nz/vAIN/4hYGXrmoQx4Uo6g9tuI56j
         sA2GlIHW76iVOg5MdLd0hyul5AISakUDXQU0ZWwm3X19kO2akdOi68ZF1VHjfMscao7D
         X56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780605432; x=1781210232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6RDOJWyZ5/u9ipkjQCKV4Mf6ByGXtSeoznwE7qqlAc4=;
        b=GNPd7RUBPi1KyUQORRhABFROA5G3WBLX/dooqEZEQRKpg+O91u1IxVTioxg1NedsYV
         1pGwvu9DlSfmvjgLvO5yLwBc5h6vZQ6RG7aT4UEmNmFoDyJzr3eBmUJYSyJxD3Q7HrZI
         rIyPdSxKGLCGM8ytMdDR4PHewurjn4sIAs5eqjOE1iKyNjkAPh1nNaZVuM91n06lB9Tr
         ew7hwHAd2RO3RAZ+pxDzSxreO2X01B2QV3aFoY5xomEcz964sMjZm7ZBrX86Ze+4SGc8
         nZaFRwv5F8iQHOQmJO4J43n7oWzO7lBJpYRRf/Kfv6s7DiZPfoFZjulOfdFn5GziDv7C
         qhug==
X-Forwarded-Encrypted: i=1; AFNElJ80W7fHFhyhAvkG/nxfou1QHl3fXAxoTEtzOg3U5ha6nXlsUlXFGAFaOQdgK+gZHel4LzEzTm+fnOmC2uZLMu0o@lists.infradead.org
X-Gm-Message-State: AOJu0YzIq553C7WpznYtTGVh9lvjrA23FWto/Sugo0MNlpB12FMSa74q
	91iAvgyAve3jxoKzNsMJKoZ2QxGqOD+bbIKSJw41aNZuZAb2CnRGQi7e
X-Gm-Gg: Acq92OEVEp6++2k4WdhmZ11LM1SOh6/yjATIumu170v/4hcti/msi4HJSk+AEo7Ebbw
	yqL++vNGoSqvFqdmGg6+mgwN/VFxEe+kwy3Cnp/EzfEv6hKAJwoAO0p8+GyckCMRk6CAjq+Uiof
	w16w4Qpfj435mBjpqBpv0RivqEsnGsXrkhglC+jKYOfM7fx0ozJFfstVBqSoaQu0PVNnF0lqLdP
	25+ET2XfLIMV+AXK0NuntGBj89zVCyVcGoEIS/hL8+RGSX+mSxXWpDLJm/5ou3DJxNaxvbDCnzA
	Aq9C5i/3Ldy6JJkbg5ULdT+9Xyi3D0a43xofsR/O7gb8Cs7A0iU1i07VKruB4M0IE2psaUA191k
	M9fQxP01lm9Vz4rhv6Iu/yqK889BGxBptx799m43oZBt7LSdFCLHvwcqqxRRPoER/x9QcDVExsq
	G8lizD4k/ArKzuwrwBn0+j2xm4xt4ld5rUKggj/BvGrycr1ULiXJsdC+6rJsHa3T6CIMpnKzyV1
	dt/
X-Received: by 2002:a05:6a00:9292:b0:842:688f:307f with SMTP id d2e1a72fcca58-842b0f51a52mr276902b3a.28.1780605432407;
        Thu, 04 Jun 2026 13:37:12 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fe634sm7118257b3a.52.2026.06.04.13.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:37:11 -0700 (PDT)
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
Subject: [RFC PATCH 2/2] ASoC: atmel: ac97c: Fix use-after-free on driver teardown
Date: Thu,  4 Jun 2026 20:36:23 +0000
Message-ID: <20260604203623.162640-3-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604203623.162640-1-manishbaing2789@gmail.com>
References: <20260604203623.162640-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_133713_461516_D21673F2 
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

In atmel_ac97c_remove() and the probe error path, the driver disables
clocks and unmaps memory before freeing the IRQ. If a stray interrupt
fires during this window, the handler will attempt to access unmapped
memory or unclocked hardware, resulting in a kernel panic.

Reorder the teardown sequence to call free_irq() first, adhering to
the standard reverse-initialization order.

Running make W=1 returns no errors. I was unable to test the patch
because I do not have the hardware.The issue was flagged by the
Sashiko AI bot.

Link: https://sashiko.dev/#/patchset/20260530052812.115994-1-manishbaing2789@gmail.com?part=1
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 sound/atmel/ac97c.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index cd74395dd222..b9280b644f26 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -790,7 +790,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	retval = snd_card_register(card);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register sound card\n");
-		goto err_ac97_bus;
+		goto err_snd_card_register;
 	}
 
 	platform_set_drvdata(pdev, card);
@@ -800,11 +800,12 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_snd_card_register:
+	free_irq(irq, chip);
 err_ac97_bus:
+err_request_irq:
 	iounmap(chip->regs);
 err_ioremap:
-	free_irq(irq, chip);
-err_request_irq:
 	snd_card_free(card);
 err_snd_card_new:
 	clk_disable_unprepare(pclk);
@@ -842,10 +843,10 @@ static void atmel_ac97c_remove(struct platform_device *pdev)
 	ac97c_writel(chip, COMR, 0);
 	ac97c_writel(chip, MR,   0);
 
+	free_irq(chip->irq, chip);
 	clk_disable_unprepare(chip->pclk);
 	clk_put(chip->pclk);
 	iounmap(chip->regs);
-	free_irq(chip->irq, chip);
 
 	snd_card_free(card);
 }
-- 
2.43.0


