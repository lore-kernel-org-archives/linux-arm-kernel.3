Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCADCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNZ6xElfqK3A4SE3F9P829uWscll1GihYVBHckeq6A0=; b=mN1EXC7DwB24Bkdbu28EgcY567
	wB2w6cvVHmka02vjZES5TCgd3MFHYjk6uSR31VKbivlpPXyOFHdi3pxEaXehAlRD+2KoifxA0X41f
	nZAsl+yPqwVT2rfNPXiO2YH3qzGbP/aI2SnrEMEm6aafur6K0TfEkmz9LM4FezJSwGwdxGeKVICIf
	t/0N3M8sQP6ElSp8HvueYhrYPlsN09IwxmM+qsjG4YUPMPnPWFq21nq1M+qjJsn82GEbQCT5P4hIO
	oNFQqCOIBpxfxPbOn06f7kdpJJYl8tLPauCXySkKESSyI+qB6isp3MKK1Nwdagp98gvQM+Qs9Kxer
	Q0Dcb//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw40-00000002mro-2ktr;
	Tue, 26 May 2026 17:59:36 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw3u-00000002mlf-3MKo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:32 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48eb0da933fso75100995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818368; x=1780423168; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cNZ6xElfqK3A4SE3F9P829uWscll1GihYVBHckeq6A0=;
        b=AN72Kb7a0dQvIVzubQI16R2e88iv+D97ghMS/Qk/OnrtmQcX6qgtZ3OxB8e9PyLici
         aNtt/TCyLWy24LZYGqKUXzySZ/N7alhcHaHO7mbNtpGrve3Rliq13tCPyWPG3HNDIVOp
         mX4dZw8A86oDFz7Rwgs7b5hcEne0L1SYvCkzs0xsc4T69qccZx7tVHcO0420F70Fndyc
         Z6V1610X3IYh4BR3B805GaS87211to9echq5Dl+scJF7hQtho7eUggFhQm8B4Nh0JgK9
         NKzQsK0jmSwSAzClA7Nu5RoRTurQKUxkE8YzjElxrhu0tWJwGJqcMQ29uBh07MW5Lqd3
         MbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818368; x=1780423168;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cNZ6xElfqK3A4SE3F9P829uWscll1GihYVBHckeq6A0=;
        b=iMFgPlwatV+xP7jiJtmLTym7lhZevOJTaC+fDGLnrg+z4SvAuhM4RViJ6sSHeKP2wA
         BVl8yhTsKoK2+nOb3tO0Jt1yf2VM3fIMUgHnW7gL0PVb/OA3/o/4m0yZVjW6Ig9x/LlK
         c4Dy+aG9UOingCW+n0PDPo7mDfsjlUImfWRRmvTIu/7e1vSezf0d99fOD0PQ0x4sv4JS
         rVFmP2HeMrJUpkVbbJRJgsl2YpsQ+3VaX4J0/X/QFHbknLMxZ60r1voZLq+2q06XFvqN
         cvglzkGxilH6/MBJXGzcRz4XUviakBqMcPk5BrdsqSV4Vk1xXfKL4pv7ddUrB4suUg1Y
         KZMg==
X-Gm-Message-State: AOJu0Yyokk4RfqkY7ouvKPmdbkCGyFH8h+oOgYOgEgSi2Hu9K/jFqjPu
	pVcYs20Sn4gepICdo80mzaPlje/B7yCRxqYm4RcgS20YqxR8vqVVNO4OfxXbZ4XA1zMFlAAQ//p
	JmZuFHnX5lOuYfVqkok+fVpvbWAYCbmg/ExJEuZW2rJR3Vh6YoAxNvAWWo27EaRoNkmFU7fqko1
	iiPxkjtIO/q17VynBbJdYwaUQhOGFSnC+Ethe9WXuQZMuq
X-Received: from wmbje7.prod.google.com ([2002:a05:600c:1f87:b0:48a:5970:2007])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b97:b0:490:52fb:12dd
 with SMTP id 5b1f17b1804b1-49052fb14fdmr292012705e9.10.1779818367951; Tue, 26
 May 2026 10:59:27 -0700 (PDT)
Date: Tue, 26 May 2026 19:58:53 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543; i=ardb@kernel.org;
 h=from:subject; bh=0Wnsvtw0Z2vu8jTM+plTHkuWXyq+RnVgc0hID3nHEQ0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0fnxSZsWx12f761qXqC0qS65U2ZVyr3Slf87jmSwTV
 KRvvbncUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbSLsjIsFvkWXjX0hVFJxZW
 Ldt97vPXdU3PRc8XH9GZ8UZlg9pB7T+MDA9i+Q/xn5Hz+Zl1U29m5LMYieUfPCfvSXROOpI/3bA ngBUA
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-23-ardb+git@google.com>
Subject: [PATCH v6 06/15] arm64: mm: Permit contiguous descriptors to be manipulated
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_105930_976772_53125BC7 
X-CRM114-Status: GOOD (  14.83  )
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

Currently, pgattr_change_is_safe() is overly pedantic when it comes to
descriptors with the contiguous hint attribute set, as it rejects
assignments even if the old and the new value are the same.

In fact, as per ARM ARM RJQQTC, manipulating descriptors with the
contiguous bit set is safe as long as the bit itself does not change
value, in the sense that no TLB conflict aborts or other exceptions may
be raised as a result. Inconsistent permission attributes within the
contiguous region may result in any of the alternatives to be taken to
apply to the entire region, which might be a programming error, but it
does not constitute an unsafe manipulation in terms of what
pgattr_change_is_safe() is intended to detect.

So drop the special PTE_CONT check, but still omit PTE_CONT from 'mask'
so that modifying the bit is still regarded as unsafe.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 6b42d724bd1b..d7a6991e1844 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -134,10 +134,6 @@ bool pgattr_change_is_safe(pteval_t old, pteval_t new)
 	if (pte_pfn(__pte(old)) != pte_pfn(__pte(new)))
 		return false;
 
-	/* live contiguous mappings may not be manipulated at all */
-	if ((old | new) & PTE_CONT)
-		return false;
-
 	/* Transitioning from Non-Global to Global is unsafe */
 	if (old & ~new & PTE_NG)
 		return false;
-- 
2.54.0.794.g4f17f83d09-goog


