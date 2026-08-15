Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BF7C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 16:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0aZhTYimAntKdzPJKS6oC7Sa1HRLwmKSoA78yTWTLs=; b=iX/jdMUU47BmQWETWf26zzblKC
	affg/VC0t6NMgz4sXtlLJa0DcbzkemGNcbSyl7v00Ar0rwEAF3NR+0n3BwtgMW8lSvwb2HUtwAJgd
	WGQEnE+/ACLk/GqNi3dVLbmgi5lGSpFZ3g+TQVNnjuu07iQJbiW2LPRZgZRi1HlMR8ZQP9c3xlisg
	y/gPC5BZQLcatr1L1qRHl6W6sRTWpsKDQsHYtarbGof5F2g6S1Waoymqzx3YpfZmt4oIEPMEjSW38
	S3zIyuwJrd6iyja8sTu3wbPDJt6y3jsFGUSkruxEXhWwoVQZUbIsP/MjE8XnA79lITuA6Judqdena
	nXBP9aag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvHEa-00000003wgt-0pJR;
	Sat, 15 Aug 2026 16:27:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvHEX-00000003wfT-0RfE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 16:27:46 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2d5655cc850so1051465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 09:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786811264; x=1787416064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0aZhTYimAntKdzPJKS6oC7Sa1HRLwmKSoA78yTWTLs=;
        b=T9OdPluinPXw0cEg4ognUu9OM1qQxZ3bLAW3pJKg37jmFMhpCAzmkMELXm5K1MJ1wV
         k6OcLFRQ4ryA7OajYZLqPI1A/4IJf8b0oyZwJjJmNV3a7EZAsaDSt7eTnJiqqmTOWAYb
         5KkRW7gw4/k3s9kbpSG7/rqMzWVqfPQA0qBbiFy9aTMEjrkVJZHASWPd536y8rE+5mwe
         BpYx6mkCTR6M5NZnr3rFiPrRV0qkB0sXPC+3NUMF5Xqv3DJRiG9mozv7Q5lgw1he+z2Y
         IOK5GzYeCOsf00x5hUqz6p5hUUd0oTpjFcumtjSTqdBuvv0gXvMFLtOLUBEXlamdHmL7
         /Swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786811264; x=1787416064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u0aZhTYimAntKdzPJKS6oC7Sa1HRLwmKSoA78yTWTLs=;
        b=nGLkwIT5mFsn9cKV8338A61YjmRwH35NsN3+ima5Y5BNrH9gZIyrp9UxSKjsKIGQBg
         D8/rHPzL93DHVKqahId3zwdX8h1mYdcYAMcrAKMIvDmARcaim8cU+tcV/DRwQtd9rBzU
         dVZNhs+JeWTIFIcgTMt4091+x3k5WSPxJ9uKulkRRzHLUHlMhAEUOgVYoyF/R2McwTiI
         zAzon7ouIe42a5KdyBdjFsnb7lImrgKVx29/tnWdHxwBggX73ZymanAhHpf9DGLwNv+n
         RpWAPYGUsZgqlk9D6/iNovvo9ej7wijNmZVdjprsb8wzb4Ymrl2Umw/RT/0pKKdS0jvd
         hb2g==
X-Forwarded-Encrypted: i=1; AHgh+RoFb/6eNQTDVitbDO0QqEzyYNU4jolAaLMuhmX2HrcopZk2f3dNbynRI4xoYVjS0QSeAS/QMexp+xrIN6RNz63P@lists.infradead.org
X-Gm-Message-State: AOJu0YzZnlVE7v2bX9EHGdxG/tSml3UFWCwRSJ/n6q+FwD3yCjfFsXVh
	U79ijEwNVTTKvBLXFbaFrMoz0M5EuwUFnvgsVCcg7mJ/WCNfSK6AAVsC
X-Gm-Gg: AR+sD10ZQNCRh3ad0xaXVlY6YzEJgMfubFJY90CPs/dlJ/0XcyVBJ3rfbi3oazHbSGb
	2lpMtaItqP2B4qL+sLL0uQu7mi1ppW8U4hDAHHXJSuVuFD/AyBz9GCL01ZXEboHv6AKW5XReH8I
	fLXATTbpTHDhBmfpKftc415ZPBE7MI1U2HvVOoovXysYRh307bj3wPfa6HnaCRnBQ1aeUj537Fl
	rQmzZqbqJaw8lT30RHfql2+G6G5nprfENMgxpYb12eUpjpGyDuKj2dmgKzvFSd9ckSQBX7haR3B
	sdtAPvSwUxNsnqSkGzj9KQfSoxmPgJwiLiIVTZ1ql6UYlOHGBxh6To2PIlbCMGzXbl8pAwtv/dK
	3qbuFVYAvwl0b0+V6KZaI7Ppp1qjZjBDpw/ZBev7NmrI8ANusjVy8MPKzz68MIMKJZPcMbW2541
	yAAQq8v/NB4pdDyMMxlDoq3JEjA2UeMkTisgF9o2NaVJkHMc0Ns9lJ8hye3v10zQ+qK+ev9CGHI
	mgqV7VUMkuYV9Jgx/Y4V35GMAp6vml+
X-Received: by 2002:a05:6a21:7111:b0:3b1:882a:607b with SMTP id adf61e73a8af0-3cc71d24898mr16890086637.22.1786811264197;
        Sat, 15 Aug 2026 09:27:44 -0700 (PDT)
Received: from Ubuntu.. ([49.43.242.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ed5b1sm36427232c88.8.2026.08.15.09.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 09:27:43 -0700 (PDT)
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
Subject: [PATCH 2/2] ASoC: atmel: ac97c: Fix use-after-free on driver teardown
Date: Sat, 15 Aug 2026 16:27:06 +0000
Message-ID: <20260815162707.353893-3-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815162707.353893-1-manishbaing2789@gmail.com>
References: <20260815162707.353893-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_092745_147323_D45C903E 
X-CRM114-Status: GOOD (  13.85  )
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
because I do not have the hardware. The issue was flagged by the
Sashiko AI bot.

Link: https://sashiko.dev/#/patchset/20260530052812.115994-1-manishbaing2789@gmail.com?part=1
Reported-by: Sashiko AI <sashiko-bot@kernel.org>

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 sound/atmel/ac97c.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 205475157e72..24a27e67f15f 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -789,7 +789,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	retval = snd_card_register(card);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register sound card\n");
-		goto err_ac97_bus;
+		goto err_snd_card_register;
 	}
 
 	platform_set_drvdata(pdev, card);
@@ -799,11 +799,12 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 
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
@@ -841,10 +842,10 @@ static void atmel_ac97c_remove(struct platform_device *pdev)
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


