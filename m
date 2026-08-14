Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC40EC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 20:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wxIm9u0qrjErO4FKPLFmc2VnAoNGd95iljPcraq0ae4=; b=W9elr2KAzFS1YQOs2abi2BdOvs
	7vRTT2aUjt5/EvDLGQTq5P1pGxIYv8lzF+oHQvSQUzPNjD34uYOFeof7gK82K3K0Yr+YNZNMbu16C
	6G1cecRCye8WIjs+JsQX7TEQ4GKcf5huqjPSImGU26up2Ju0xLIKMAWtSSTfwVITTA6QLPJKBzSFk
	y/3rDvA4PhJ+zbV8ZLEhtCPaHu51uxlNFwUITK01waOhHsSYn6NUiTa2x5IuyttWXpcTBOqO9cUFd
	xruAA7nYlkfNGyw8sUA6BYmmwwyosiKlFVl8S2OAQGg+8Wqvapk+2cFlzcvKTGCfnfS/ChTNRzZRh
	4A4UMhFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuymc-00000003AeZ-3KQk;
	Fri, 14 Aug 2026 20:45:42 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuymZ-00000003AeF-3kjm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 20:45:41 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so1076678a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 13:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786740339; x=1787345139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxIm9u0qrjErO4FKPLFmc2VnAoNGd95iljPcraq0ae4=;
        b=OIQMaAfHkuFBhjl4sgzVUbe8DdAxeeGj6hCP9ePnzQc63puokBJpHEYw4n8n0FmxaI
         B60/Lpxxq93JnlxuuJxKEvAPenk4V5cL7BTJ1H0ntVZ/deM51NFW0IHAienrvb/TSPGV
         ZnY2MJAszgZHWlTs4rZLWMtm462LDC/DiEfAGH+isEeElns0Fq58MOnXIfkDV+YjHS1a
         3YugwIdpqhFx1XFhS0Sus3tri1B2Y7AkinUxVXv9zQ01nr/RmrhbBjgyykXqwCP5M+GL
         7c1/wh5i/vvYrQcrY8OuThsfyv3LoZdLqLqshDIDJKXTHQ/F6Fe47D4YWQj5FsVxMSxj
         p2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786740339; x=1787345139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxIm9u0qrjErO4FKPLFmc2VnAoNGd95iljPcraq0ae4=;
        b=hPl5NLyX31p0WlvY+VFdxSMMFguBBL8x9TAbzHz3E49O+lQvl0FfScFwjrpfULGy7A
         piDlZD3fO1TK73XIc5+ImI1OYr/4HSUQmlSWTKLTU8mltmLSDzmjTjJVkUtNX4OAuo8G
         iA4YUZMSemjxHG2Hgc/bSnHBhh20XlPjStnPDFb4AHKn7dDKYwPaDkHagwmbSkBDrDKK
         o9Rlfg4KMeosXY1gpTDr1hQLjIk9cGroSa+alaKzShZAXrD77k+RqRXO/LyX6N+y9VfD
         SNKO8xUmSpkbwn2kd7K+WLpLpRn9Nfmuq5XlACuqfa2gMb6Q7W9Y1wZTCWnJk1oAX5If
         ra9A==
X-Forwarded-Encrypted: i=1; AHgh+Rq7glo70pLgHE9jtc3TknlYFNrhbs2WoixHzhIE98OeHlK3NDB+Se9pXs/s1bBg12B4ud27YTza7pa0S3PCOYWY@lists.infradead.org
X-Gm-Message-State: AOJu0YxMUarRthVg0ImUKqLuVKnvq9xxW9jzBqYEmZbp1RAYkC0j7XXz
	Y1ErAfwp+mcPSR8Xt3y4cjhRjR0nOwbSpE9hmfUyFqHsLM+YrKLAcIkn
X-Gm-Gg: AR+sD11mNh4kBMakoj4Sc9DwQxGSSZ6IdLVoOX3oCL+H+0floLbP2D12BXeSZ+Godqx
	zBjIViyrIDDrKhZG4iNMvhPJTBC+AvwoMJMXLiKSFZmIG4DfoOQdOkSy1BCp/ifT6G0kuDCa2o/
	lLsSjx4z5ym2oW1EUN/oWbU5v3N2sCUJr4yrVQpRygHBissxxi9AIgPlC/emlXoJ9GWTPovksnR
	6zKEXY88wh7BSBEUN4P5JqODjmrIkgetw7J6hbz4eZ9WrO2iLUEwR11xY8dyx9zgj3As6/+n+g6
	FU6PM2XvSbTXudulzEw9ga7bpVE4fZUbu2CV1nqFdMqNxvjXCejRTeJ0ld7Wb29dGfDYFPfXSnM
	p8jbDGXvcVHNpxmT8EypHfn8b8eDMMv6UO9zSifXCcPokyc+L8rLQC1bpicQ2xSbeA4p2QzIujx
	KarLSc6YBnJ5EfxAufzuVV611aXqUnaJIsb6c9FvURKl606jc2pAWIqCZ7CJus4onlCT95wWZqF
	ajxqy1gVeQTUnXQkeoVftnru/yptJqy1HFp/Rg5dOB2Yfotezm1NcDPPuH+tqKuhGYxqO0FHATF
	AmnNy50BbiNro33xNbNfp/bIYhz1MkhyPEu5W1X/6eveDn9G
X-Received: by 2002:a17:90b:398c:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-3933b7532e0mr8794391a91.5.1786740338924;
        Fri, 14 Aug 2026 13:45:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ebc08871sm3943246a91.16.2026.08.14.13.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 13:45:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/UNIPHIER ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: uniphier: aio-dma: pass chip to irq handler
Date: Fri, 14 Aug 2026 13:45:36 -0700
Message-ID: <20260814204536.38010-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_134539_955977_38D3CE05 
X-CRM114-Status: GOOD (  13.30  )
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

The irq handler takes the platform device and calls
platform_get_drvdata() to recover the chip.  Pass the chip directly
as the devm_request_irq() argument instead, dropping the
platform_get_drvdata() call.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/uniphier/aio-dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index c01eae55d4fc..389a45319dfc 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -66,8 +66,7 @@ static void aiodma_compr_irq(struct uniphier_aio_sub *sub)
 
 static irqreturn_t aiodma_irq(int irq, void *p)
 {
-	struct platform_device *pdev = p;
-	struct uniphier_aio_chip *chip = platform_get_drvdata(pdev);
+	struct uniphier_aio_chip *chip = p;
 	irqreturn_t ret = IRQ_NONE;
 	int i, j;
 
@@ -263,7 +262,7 @@ int uniphier_aiodma_soc_register_platform(struct platform_device *pdev)
 		return irq;
 
 	ret = devm_request_irq(dev, irq, aiodma_irq,
-			       IRQF_SHARED, dev_name(dev), pdev);
+			       IRQF_SHARED, dev_name(dev), chip);
 	if (ret)
 		return ret;
 
-- 
2.55.0


