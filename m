Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9448FF60D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s29Xdjdtn9joPLQhVjn5m444FoNDrSpcw3rugwHh8kA=; b=1rhC1fogiiBfojfmJUK+2UWo9E
	JFWDxaKJzmNf2L/J63U10tBPmcBAY35rRH496TriEetx68lWhX1WtKGBu2Ff2xcdDSJPkWnuAhpVs
	w53cLMrr2RO4qXl004f8NOgwh6AtNlIOD9rfFkWDVEWXDAx3pSu/6EdICntPwn8oMRH2nXo20s/DO
	jRLylEHrRnC7AVVVHB4jR2GVb9g2H3pywhUjmHmMh8v3FSCBRrn5ymnHMPG/U9gKGdPiGPfdoC2o8
	tZdPmx7nmhFn1fLrfh7oYPgIoXgtPDff8mhau53IyTms6zRC7o5YT9nPzhyYF6Us41l8twaIWG2vI
	qYVo9OAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TrO-0000000CWRf-2iWJ;
	Tue, 31 Mar 2026 07:50:02 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TrH-0000000CWOC-3Sbt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:49:56 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4853b5b0fafso68465355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 00:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774943394; x=1775548194; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s29Xdjdtn9joPLQhVjn5m444FoNDrSpcw3rugwHh8kA=;
        b=d963ATNpKEQPm+vsekFfxZwk5ors2MgHW1ZzLmpqfzIEQtQpJm1wEjyDcqwsWDJE6O
         8qx/8RDFXHAH0BvcJD2rTtVkmIHFXgoiJd4ZSam6ttTcBIyva1GvStIZa17314e/+r0o
         huejvVNRB+Q8kR+TZqpmMh2itJ0BCtJYrzn1J74KJmJ9rNHZkvolK+275W7WWFZdx45w
         mw1PpTqQSUM5l5V/9NR4d5E+fjdqwEw7ATrftQaLHOVYdKlcFY0jsTVI0ShY8RRCW+pK
         ihubCaO7yIWWPPLs1jgxLWHcLCvVjuoCyaerIPURPEYPgUDTaW8BAhIewFPSG6/rG7Cs
         RjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943394; x=1775548194;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s29Xdjdtn9joPLQhVjn5m444FoNDrSpcw3rugwHh8kA=;
        b=hAfzDT/29w6YhuhdOTBafFu3APiAd95ZkGoEM3CM94/WS5yZDr50DvxXjzlDMEaxBN
         AYtw5Z6FycvgwDVeLYR1miLq3p8jLBqxxLNEMbV4pm5SNmso/JejgK9wsG9ZgxPNF1za
         SEp4zWVj7Jyj6546HR8ZR2g0CVao8uqruIt59G/5zFEXHHy3XOwBwYdvmFo8CeqaQFvJ
         LeDn0peRUG/Y3R6PjjDXWVpXEERaDFBNMTxKliiv4QRU2YEEXwYzvupYhxFA9piymjPh
         3k42BCY32fpD4AvT0I98V4uHAabaaU/1j/ug6ymSfc0FMfTVSxxktBPBfQrhdXm/Rp6S
         2BxQ==
X-Gm-Message-State: AOJu0Yyuvx70XEX9eM28XsfV5F+l2isvO3vofaHtBfRWPQStz1+73eOA
	uSNthZTp1/bg/qyCVo3uMbGq1njjaYz2ht7c/sC/34HjZSUvjh/eCmJwFGfPk6ubcZfDEtKw9w=
	=
X-Received: from wmpc34.prod.google.com ([2002:a05:600c:4a22:b0:485:3482:21e3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:64c8:b0:483:8062:b43
 with SMTP id 5b1f17b1804b1-48727eb7f4dmr252230715e9.19.1774943393579; Tue, 31
 Mar 2026 00:49:53 -0700 (PDT)
Date: Tue, 31 Mar 2026 09:49:42 +0200
In-Reply-To: <20260331074940.55502-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20260331074940.55502-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=846; i=ardb@kernel.org;
 h=from:subject; bh=DspK9ILwbkU2K9P3QWlgKSmk7WPgvh8qrRYpz8jocUU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN0zfQk37L7t5l5LA+oVkvmHHrkYbvO8MtnGdONZ+wMT
 aamP1jWUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYS0MHwv4LD4VTLCyU++Rb1
 Rw7S0xKuBHKv+mlk90dm4T6+LEXv/YwMu5/kWM+vuHx0R5APlzNvsKLTk9i5d6LNDtiV/DXw1n3 GDAA=
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331074940.55502-9-ardb+git@google.com>
Subject: [PATCH v2 2/5] crypto: aegis128 - Use neon-intrinsics.h on ARM too
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-raid@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_004955_859632_C1CC5BE9 
X-CRM114-Status: GOOD (  11.57  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Use the asm/neon-intrinsics.h header on ARM as well as arm64, so that
the calling code does not have to know the difference.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 crypto/aegis128-neon-inner.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/crypto/aegis128-neon-inner.c b/crypto/aegis128-neon-inner.c
index b6a52a386b22..56b534eeb680 100644
--- a/crypto/aegis128-neon-inner.c
+++ b/crypto/aegis128-neon-inner.c
@@ -3,13 +3,11 @@
  * Copyright (C) 2019 Linaro, Ltd. <ard.biesheuvel@linaro.org>
  */
 
-#ifdef CONFIG_ARM64
 #include <asm/neon-intrinsics.h>
 
+#ifdef CONFIG_ARM64
 #define AES_ROUND	"aese %0.16b, %1.16b \n\t aesmc %0.16b, %0.16b"
 #else
-#include <arm_neon.h>
-
 #define AES_ROUND	"aese.8 %q0, %q1 \n\t aesmc.8 %q0, %q0"
 #endif
 
-- 
2.53.0.1018.g2bb0e51243-goog


