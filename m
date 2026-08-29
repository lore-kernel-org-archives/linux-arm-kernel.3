Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43267C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 03:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TUlNGUgQY5khe/spcmDkrmv1B33pEeDXrJ5iK2i5+wc=; b=1UELzFIC+SaH62DgYYAEmYrHlk
	g42ALDhLjhUca9VzlC8Wmu2uIC213oN/flakeri9Bmx/8SnrCeq9exLHPMq3bdaFS69ng1hAtM8p5
	RKw/nrqVahSZ62i0nwgwHnMYkmDigPk6at3gCbGoSD4+kuWT+BEQQGjEasvGdnxzxflZc9QYRrzWM
	y91hiWgD3HAlWrGz6hY3R7STBsdAR06CEDqnHrIGHSF9Mt37nu2DNfdq6Va0R91gCTiWEnCk1qX9p
	MEP5wt3VgrQCdAfwrhgPqKiZZJvsf7aPjOj7GAiQK26ic5NEv4J7rjdGJFes9L3CbjvE5jdQlbR9o
	9IimpzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0AEO-00000006hT7-2zyG;
	Sat, 29 Aug 2026 03:59:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0AEM-00000006hSm-0znI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 03:59:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso14679785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 20:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787975984; x=1788580784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TUlNGUgQY5khe/spcmDkrmv1B33pEeDXrJ5iK2i5+wc=;
        b=hkDPlVRzUjjQoFzVTyb9XxS/dUbGhg0BkHlV5t7IDOclYxW0bhd3v6pZav5Gi2Kd8+
         lAthBmkBzkBfCPQbpl5Su+qJHE55HkomWiYcS6yCyHXsCHq8jeeOSG4DSpmSDhNZqo78
         eBx/B6oYYNQuPrXo9Wxw4d24v8pSijgL1AJw97XeJ1pU10/QmXXYJ5lB6EE8ywuxUxTy
         KaXExfdLY2R6ihJAiPCD/c/UKNroeBSxkDAl2RzfjILESEcd/t+A/djxS4GEVgU/QLE3
         w0HeHrxsyL/l5aJI5gJxiduKti/cFHHYOF3ZQGvUd/qOSNvkKma/IT+XqtzD78No/gGM
         lYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787975984; x=1788580784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUlNGUgQY5khe/spcmDkrmv1B33pEeDXrJ5iK2i5+wc=;
        b=Q5YFDXuSZRLRL+YIIHHQHR3cIs1sPRcWK47Hv1bJiGOiW3iPpm/vbqmSLBKsH8XEWm
         dO0CWtClySbXoisFwgD2wtx9kd6BrN9IXwdW+/c84dxzlJ50cF2sJFZsR9Mmh/aDQErG
         Dga/DFnhjqXOTaBAoAkp9E230aep2X5zmj+GC546BOsxcD2VZEaNKRxzXbbsAEk1dn9U
         uLJ29ysJniquLpRlfc2PhTlxApBNm8wT6JBLnVKr/FgGnvmmrmI6bHRqVCuVcEwQunk5
         ls7zYhkDGoDOPY0gUgPelyyTzCOKGkYRdZ9c0+komZDbzRo+3CfCAIdrObF4QNRkAAfp
         5MYg==
X-Forwarded-Encrypted: i=1; AHgh+RqFnxbrHl7sbuoJjlOKUtnvu0wzHalkAHgLs+gWxqTHb+agLtbbsYpwlf96yJghSy1yiVaQBfpD3JKZQDQK4pDp@lists.infradead.org
X-Gm-Message-State: AFuF++lsJJpTtlsbffElpETH9BQyoxJWxI4v0cjps5G83QRqbiORHsVR
	xbaOIFgt7N1YRFG4Nk0uyr0lV7BPgnvJRJ8kL6lKLMxxHn0WpLRLq6MTcsLd/qyA
X-Gm-Gg: AR+sD12IfVas7KXwgzlF9LKhVbWD9QpGRlR6fu7wMs7bJn2Kg/VrNd6jG4+SsJN54Qu
	yhDlc0TJUWHRjBu++zmFJUw9AQJ6fDw70xVddk1CmuqI+KVnD1tbXKq9fhp9Ix32UulDMo730wH
	rhE6/XmBD5q83vdBguKz0G4XUV8gwQfBGPZFeATYOqJZ6/2XLPqBPHCzB6a4nArtt1H40NPmIe2
	pk0Lx84SUaHOOHS3yJalrraXCUHtniAQWMpWYgDhsh8o52rbxYiKYgyV2FmNcMKe9Q3GNUyCaU0
	/qLh0PpfHswu94R/bGZna0F3NXnWdfG35cUq+7DVOJtiIN7eGke1KmM0nbi3jqr+SSKjLmxBQVC
	WoQYoBZPvo0JIPmjs72kXhFKxPN4qpfq+VCKlyuJAWJMK5UWGpdZSFmRGGt9Uej3pGcJtz0E4LL
	lyzvdoTLqCCeXcMArsPPLn4OlzVsVbE9kYKocJFf1yOUEHCk7P2Yd0e/NSpEdnX8UpjUPU35/oA
	lr8WEojDs3C7hONvW7eAC0EE0illLEwOHRTnDEmkpw5EpykxEc3RQZPhYxWgCylOXMJ4Lt8oVX4
	N3HODN6pXISoX1YAk7Ek
X-Received: by 2002:a05:600c:1c0a:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-49b91c1dd3fmr176903705e9.1.1787975983850;
        Fri, 28 Aug 2026 20:59:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dd2517sm100738355e9.7.2026.08.28.20.59.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 20:59:43 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Pramod Gurav <pramod.gurav@smartplayin.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-tdes - zero-initialize device state
Date: Sat, 29 Aug 2026 05:58:21 +0200
Message-Id: <20260829035821.67220-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_205946_334927_651C9E92 
X-CRM114-Status: GOOD (  14.53  )
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

Commit c659d07f11a3 ("crypto: atmel-tdes - Switch to managed version of
kzalloc") accidentally replaced kzalloc() with devm_kmalloc(), so the
device state is no longer zeroed.

atmel_tdes_hw_init() tests dd->flags during probe: a stale TDES_FLAGS_INIT
skips the hardware reset, and a stale TDES_FLAGS_BUSY makes
atmel_tdes_handle_queue() treat the engine as permanently busy, leaving
every request queued and never dispatched.

Seen on a SAM9X75 Curiosity: the first TDES request after boot never
completes and the TDES interrupt count stays at zero, while the AES and
SHA engines on the same SoC work normally.

Switch to devm_kzalloc(), matching the Atmel AES and SHA drivers.

Fixes: c659d07f11a3 ("crypto: atmel-tdes - Switch to managed version of kzalloc")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/crypto/atmel-tdes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index ffea1db74651..2756dab3f4c7 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -933,7 +933,7 @@ static int atmel_tdes_probe(struct platform_device *pdev)
 	struct resource *tdes_res;
 	int err;
 
-	tdes_dd = devm_kmalloc(&pdev->dev, sizeof(*tdes_dd), GFP_KERNEL);
+	tdes_dd = devm_kzalloc(&pdev->dev, sizeof(*tdes_dd), GFP_KERNEL);
 	if (!tdes_dd)
 		return -ENOMEM;
 
-- 
2.39.5 (Apple Git-154)


