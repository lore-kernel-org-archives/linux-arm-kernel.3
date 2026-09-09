Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8108AC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7rXaYLXeDaufl+lX5zkSQUxxWafEIsiLpWoK4oXgy0=; b=rI5UhWRr6vMu1w6Y/PEKPJvHwy
	MapolLMepHC9YQvboa5tQmkU3Pkg520tP/RJ4bDAUpj+yOHqsTDg+7PDIEZ2u7Zxnki9781SBRPHZ
	W/XVeDOlzHxmYLtCK4hHlLOPXxXR78qduVtDTh3sxpJwN13F7wcnirPQjd7ng47Qz0TyNdmoCaHBA
	OmBKrF9vbNFl1/KU1xMZvNopX0zBOFO8Driva+FgG7pqE4saHP05uYQJMUg8OiUAfddWrKwqVNdKW
	1dNuanDEAIqcNuNgtGsnoYNep1/kdooFsEkllRsQ/fpZvSHg72jIahju/cdCvkoS9WksgOYSTxkb2
	YAVlUZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LEp-0000000CKjg-2oFD;
	Wed, 09 Sep 2026 16:33:31 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LEm-0000000CKhc-1Udh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:33:29 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4994cf6cdb9so43704805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788971606; x=1789576406; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7rXaYLXeDaufl+lX5zkSQUxxWafEIsiLpWoK4oXgy0=;
        b=tjI0foiodzahffbyIWf/c2Y3LcCKzamAU29vBTjbmhdCDMSGCvkm8fn5+TQRPmjTRB
         i66tldkGPOHCM4wpr5UVGmBg7ya2n4mfzxaJrc24wyy8TYzv9hB9ckk8I7EZJjwZeO4P
         ZHDIUDoYEYS66zY5OU6iT8OUYrwWRvVWsogCeeyhJ0lUpwCG2M0yuowWeXRT7eRaa9ZU
         Gg/i0XFaJyLg0Fy7bM0n8X0gTEWfnkPAlfsaOnTZNEtr5RVTVpnRn1NVtMgfrLha1PFm
         OkZ1H0rqHYY/d0PoOg+pLKwPhX24O0YW5yanbYIf44zk+AERqnYzVl1sH006m9EfF/H4
         2SKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971606; x=1789576406;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y7rXaYLXeDaufl+lX5zkSQUxxWafEIsiLpWoK4oXgy0=;
        b=ZLTqZfMamb4t61lIWheGuyAtLDK4e5Onk0MUBaYiS+kNtwwVL1A8elEaOQQ1sU639f
         OInH2tYk9Pu6/d+12/W/JwW8n7/bzIsK8JZZ4gVjn4QmQSWXTi7Pmvn4KJqYQ+jvnQJA
         oSol9lzJ+CnUc6e/N/E0eCZ/P7hTWO3BFgnuf5xvJ7BOHy1ymLkfap6HmK2xrTw0P3Co
         ex0GznlLDBN/JIy3Hct/SAFMjqD5x9H7TGCRistL6kHphQ7P2hQhe+gR6qLSjjEB3IVm
         0ELQ8TefPZbjiAXNraVUYDCJpf+I6T5uhEadtbzyQs3UtC19Hi0EpBiQ3cUs65/HiRnZ
         d2Uw==
X-Gm-Message-State: AFuF++nFImWv7WoAoNJFRBLENeKQ/j3UZMFehUEgLhTiHo6oz0OfRyqz
	+/48c134p29Yyc/isuNT3fYyfIL2mChbHdhGHfsD/HlSLFpRWW+DNxWGq5hAgLpdVuJR/OsJp5S
	iMDHmf1WUQIUu7wpL0QxsrXnzCgIY7G7BsClDjY3Kqm2mu6LgO/rBDBfnoekixijul4/b3WSvWM
	ztLprhgJZd4kTdJ7NnyU3OzH7T1KbfM1cYYsbf36fvUtEX
X-Received: from wmpd22.prod.google.com ([2002:a05:600c:4c16:b0:499:caa3:ae0f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:8498:20b0:49c:cee0:f383
 with SMTP id 5b1f17b1804b1-49cf828c65amr260689035e9.16.1788971605881; Wed, 09
 Sep 2026 09:33:25 -0700 (PDT)
Date: Wed,  9 Sep 2026 18:33:21 +0200
In-Reply-To: <20260909163319.2116279-4-ardb+git@google.com>
Mime-Version: 1.0
References: <20260909163319.2116279-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=ardb@kernel.org;
 h=from:subject; bh=rKUAJsgtj9Irtxu4FWQLSWZXKAdegrFKPi39QCTPPzM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWthV2Dnw2g94eYvM+rNMyqL/1V9L2KdfMPvfN3kde1vF
 B5fcNvcUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACby/inD//CUJV+3r1i+9eNp
 70cbtAS+9v5j1c8o26L94sD2XdEHaqwY/ldqXrr0IOLIm4CqZQej7rPtPf4iKOoCU8LZtHbzjG+ f1/ADAA==
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260909163319.2116279-5-ardb+git@google.com>
Subject: [PATCH 1/2] lib/raid6: Switch to Linux's NEON intrinsics header
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093328_401053_89856DB6 
X-CRM114-Status: GOOD (  14.84  )
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

Including arm_neon.h directly requires workarounds in the types.h header
that are ugly and should only be applied when actually building NEON
code.

ARM and arm64 both have a asm/neon-intrinsics.h header that applies the
same workarounds, but without propagating them to all other C files. So
include that instead.

This will allow those type hacks to be dropped from the ARM tree.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/raid/raid6/arm/neon.uc            | 2 +-
 lib/raid/raid6/arm/recov_neon_inner.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/raid/raid6/arm/neon.uc b/lib/raid/raid6/arm/neon.uc
index 14a9fc2c60fa..fb31cfac1f86 100644
--- a/lib/raid/raid6/arm/neon.uc
+++ b/lib/raid/raid6/arm/neon.uc
@@ -24,7 +24,7 @@
  * This file is postprocessed using unroll.awk
  */
 
-#include <arm_neon.h>
+#include <asm/neon-intrinsics.h>
 #include "arm/neon.h"
 
 typedef uint8x16_t unative_t;
diff --git a/lib/raid/raid6/arm/recov_neon_inner.c b/lib/raid/raid6/arm/recov_neon_inner.c
index 53c355efa7ff..afd225a533cf 100644
--- a/lib/raid/raid6/arm/recov_neon_inner.c
+++ b/lib/raid/raid6/arm/recov_neon_inner.c
@@ -4,7 +4,7 @@
  * Copyright (C) 2017 Linaro Ltd. <ard.biesheuvel@linaro.org>
  */
 
-#include <arm_neon.h>
+#include <asm/neon-intrinsics.h>
 #include "arm/neon.h"
 
 #ifdef CONFIG_ARM
-- 
2.55.0.1003.g10538fe699-goog


