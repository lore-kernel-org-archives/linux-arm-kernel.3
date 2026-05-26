Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB99CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjw03D6SHFyZLBNhPne++YEq9ou7VA2sQlGz9HbrowM=; b=iWnZHi2QXADS6BnfIO936RG2lU
	455s/5JQ+l4fVppBI3nt8Yk/XjpDYPK9SWyAdPJdYQzjunu0VS44Y+G+Ewnuj1QQqyeAl5IP2nyBz
	aT2srlaaSvV0KYW7fJsJtOIqgU9XdQcCh3ZqXPb9ylyXtE8pXEh4gih5oP9q0wT8dQt05r3ID2PJV
	ceQc3UwmX4OipFZx5D7ezUlqojZtTMmgSMfmHxmkDYJzrGHLbzNPVq6qgOcL0d4OOjtlnrU1ww/fo
	H4fM38r7wKdslbjG6ubjdO2lL2w45/zCKhX277cmScmvlIjJKnUNePiuioYnJAz2HiOLlif814CKW
	poMuoX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw4V-00000002nLf-0mRj;
	Tue, 26 May 2026 18:00:07 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw44-00000002mv9-09Gk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:41 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fdacf2616so56896755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818378; x=1780423178; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pjw03D6SHFyZLBNhPne++YEq9ou7VA2sQlGz9HbrowM=;
        b=ahAzVDSgSJpTUsJFoOib3W+TCjkfNmQ4cAvY4j4z98mTiwWC15kwr9Y/XhNfeZ8On6
         Cjkle3qJkqCyzALW/w4eNjl3g4alcGaOL+h6oCMzvQyCKYNHJvFdY64/dH7D2ADPJ8/C
         UhWASbjSz/U9DHuKAV8RJ6VW7jhyIzVvOcS9RYdaz6TsdwJNPWLjt1c8lGfJwoSmNIuz
         DMM6hFh+5olpHXfcjpR3n2Y5BvdLc0v2JF7eurAfn2Q+uTzh7ICymyMbRamr2VFgatfI
         +uTMBtL2VcMttuGV1v1QEznJebXkPxZ9MxUEotRdFMY4/7ljvY2CAfk4j5B+bvgs9qAE
         7Lkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818378; x=1780423178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pjw03D6SHFyZLBNhPne++YEq9ou7VA2sQlGz9HbrowM=;
        b=Vzl5eZjFjAwBFbZRVMXVjI9/jr4+YInIZlR9/Dic0Hvur5DuXklOHOQJtKWa+SbaPe
         clXnd51olNFsnStIGx8VQOwvo4pA+1nQuLiuUQ5Xij3fcKdGFJSJQeHIwk9aCarE+1VE
         mxsT7iElbr/tuwdxP08cBXRXUuTp6Np/C5+gTPddO2MFkQ0b2S8jhRwyWN63Ab5ZM1ga
         vGKSX7S8L0lmXPAis/2JKODzD34sEnevvCsA4f+xK3noDl2dBASI3Vs4ulWKbCPuSntN
         3HiRvu3nuhc09vhpUacMEAg3PNHcPPUHKQvFMz7mflFP33vb/OcJTb+WTcFqUnjK6KF0
         cqcg==
X-Gm-Message-State: AOJu0Yxi2/zB9+Rb7Oa4SDUMmC4PkT3LhMJCXG36R3To9ylqki5Izyzd
	dxZ3J3IMG3NfLZtgzEbTAi2/FSSFCaWtvZbZyMw1OQ3UpIVkYQkN8v803VEe6cyetDhVGLYy47x
	M/+S/1fhXwDQM93SDr3eDnaqfU2W88o2ann0dk/v7PiEKd7J7c+rzDND96KEyGGPvoXLfpM9nGu
	7vk7eq7lrTDwdbr/k+2vVlK46sPstDHee9b8N28Hmmrzvj
X-Received: from wmog11.prod.google.com ([2002:a05:600c:310b:b0:488:7f73:f59f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f88:b0:490:50eb:b777
 with SMTP id 5b1f17b1804b1-49050ebb9e0mr289239055e9.5.1779818377750; Tue, 26
 May 2026 10:59:37 -0700 (PDT)
Date: Tue, 26 May 2026 19:59:00 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330; i=ardb@kernel.org;
 h=from:subject; bh=P6+9rEICJJwtkUC1X6hejRp2Q1Pr3xumYehGC6YytMU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0fobew29CRUaVxU/ZtLw+1lwTWmzi/Jj1qSv70V6Hy
 z8YV03qKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNpOcfI8HBnlRjjxeVTqlfn
 ZXLs3ZJ7bJOj+aZIhVt/dgfO0n5tlsrwz8LsvO1Fp6MbfH7/PnJz9VaPp6kP950W7qm/NTevLfh YHjcA
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-30-ardb+git@google.com>
Subject: [PATCH v6 13/15] sh: cast away constness from the zero page when
 flushing it from the cache
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_105940_093410_A517FCBC 
X-CRM114-Status: GOOD (  13.96  )
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

SH performs cache maintenance on the zero page during boot, presumably
to ensure that any clearing of BSS that has occurred at startup is
visible to other CPUs and DMA devices.

The __flush_wback_region() function takes a void* argument, which is
conceptually sound, but given that empty_zero_page[] must never be
modified, it is being repainted as const, making it incompatible with a
void* formal parameter.

Given the above, and the fact that __flush_wback_region() is in fact a
function pointer variable with multiple implementations, take the easy
way out, and cast away the constness in this particular invocation.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/sh/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index 4e40d5e96be9..acbb481cdbfe 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -332,7 +332,7 @@ void __init mem_init(void)
 	cpu_cache_init();
 
 	/* clear the zero-page */
-	__flush_wback_region(empty_zero_page, PAGE_SIZE);
+	__flush_wback_region((void *)empty_zero_page, PAGE_SIZE);
 
 	vsyscall_init();
 
-- 
2.54.0.794.g4f17f83d09-goog


