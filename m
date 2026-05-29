Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78225CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/mwSEvShIHWF2QZpE0iwPRub+uC5Pg2lSQX62+z6MM=; b=GbZ4ez1xVj3NtOD7riLCJYvpQ5
	pCMr4vJWCZJlvzNH44eQ774fBnMGKOpH0/SK0tVjBOKsgF11PJG8UiqV/dLe+CQqF+pVkN+4w8hQ2
	Gsc+PvQf+mgs+1SB74291MOehebpuP8HDzQIyxT1p8OD1A/zUae6v04B08Cgtswy4MXu0SdMIkYCn
	ZGnUJLRkw8W78qzh2KXDwvt86C15dW/nxEyuEzAHWn+RVMtuPjj/a0YJKo0GVavgAspJemb8THKaR
	KaetYYhL0lqrpyHZdSnUBV42xOQvLTHvPVXAQK4UKAt+BAVeB6vKc81xaPWj2lwlJ/5GLUCLUipmI
	4D+LujIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjP-00000007bp9-0neX;
	Fri, 29 May 2026 15:02:39 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyj9-00000007beV-46do
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:02:27 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-49045f93baeso55068105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066941; x=1780671741; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U/mwSEvShIHWF2QZpE0iwPRub+uC5Pg2lSQX62+z6MM=;
        b=prLdgUmz/Rz2WR5mlw91dIBwTP4RIDqZE2Ujnmk00FSuH5pxrzjT9ALCWOE8iMA2T3
         DkGQ/CWxfR5GJgyOzrzXqZdKU84bBaUyV2jY0ESjInARHmv3S74WPH4LAZJ+wdeupEjN
         HH6x8irO3UhL+Ac34gARsledjz8SdMTijWQW9yB+/CYC80xyOt9RgZq0ePuDjg5dHos7
         ekbTQI1aq0aiJseh+CFfiyVCODnheeni/Si6P51BEXDhr6hUoTsMXhL7SaGVW4jUiH8x
         hQO3VGO8PNwLgod2ZThjg8BiLhekeYGnlVkJ6USr52i5b/iVxSpAARBTFa7NghtDFzRD
         a9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066941; x=1780671741;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/mwSEvShIHWF2QZpE0iwPRub+uC5Pg2lSQX62+z6MM=;
        b=Rp2TbHU69dPNoI9tLnF2YLPhKHBqxWqQXgd0RdpM56A39sHQAgeGrmEl0B4OvOXqYN
         S0slC62Ya9Rq+XU9CzIed7Dk+ArR+d4e4ShQDUUmcsfIu1Zj2WBEAH4uAwCmBkjqhNdI
         yjDMxNX8y0+W4Dtn8Sd3GC9+vQwIbeMhFtZcsRyPFbpVNqv3cBrlIxi6457MmNupxv6R
         +o5hCi6PZ0rXIns/e12LicMAo7uPIb02plwhfVyJhH8zi0m1XjTwqre17+iWIXajOtC4
         +g4lJ5woD3Wu5AV1sbds4VBfr3ynqgwuzQdwqzYBp8Bs1gn3p5SOZZDfNviI+aMKV+RZ
         eMSg==
X-Gm-Message-State: AOJu0YyhTw+cmHUoe+N7N0fTR/z8OhsG0kobnIha5IgVxJrt1HvbC3Ju
	xuUFPn8pvJMdYYekLuC1ok2wJugy3tBTh7ABKua98eUP+ZhFUpF+u/XEfTemyHSBkcw05Yb5qpr
	wgO72WX0ukWUOJr50/k/9O4FPIYNphRXeiNCIT1pu5FzkYs6fcmrTg46weACryIUVfNIG3k70s+
	Fv54at/bEaun2BGGCG1+rxXF76BGmOFSgrCSMbCaefoqCi
X-Received: from wmos19.prod.google.com ([2002:a05:600c:45d3:b0:48a:6a1b:6c3b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:e489:20b0:490:6869:46c6
 with SMTP id 5b1f17b1804b1-4909c0c3aa4mr45310045e9.31.1780066940967; Fri, 29
 May 2026 08:02:20 -0700 (PDT)
Date: Fri, 29 May 2026 17:01:54 +0200
In-Reply-To: <20260529150150.1670604-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2121; i=ardb@kernel.org;
 h=from:subject; bh=bTKeTgp6cCkzZ1W18Sd9Cjl54RAT9moCkecsCk8B5PI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtyVRLb9epvd/g6Z6nXCMU1XxDqFp7StynL770hk8KPC
 3fVkv52lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIm42DP8T+QPDuZ5kJNY4Fq0
 fndHhtCalPXbZGdn3574zC/PNP3pckaG3SKqFZWbT0T+XSk3T86mOHw7v2nxfgWXR9PW1P5ftia AFQA=
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150150.1670604-20-ardb+git@google.com>
Subject: [PATCH v7 03/15] arm64: mm: Check for pud_/pmd_set_huge() failures on
 kernel mappings
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_080224_039239_01A04463 
X-CRM114-Status: GOOD (  16.68  )
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

Sashiko reports:

| If pmd_set_huge() rejects an unsafe page table transition (such as
| mapping a different physical address over an existing block mapping),
| it returns 0 and leaves the page table entry unmodified.
|
| Because *pmdp remains unmodified, READ_ONCE(pmd_val(*pmdp)) will equal
| pmd_val(old_pmd). The transition from old_pmd to old_pmd is evaluated
| as safe by pgattr_change_is_safe(), so the BUG_ON never triggers.
|
| This allows invalid and unsafe mapping updates to be silently dropped
| instead of panicking, leaving stale memory mappings active while the
| caller assumes the update was successful.

The same applies to pud_set_huge() in alloc_init_pud().

Given how it is generally preferred to limp on rather than blow up the
system if an unexpected condition such as this one occurs, and the fact
that there are no known cases where this disparity results in real
problems, let's WARN on these failures rather than BUG, allowing the
system to survive to the point where it can actually report them.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index aa0e2c6435f7..b2ba5b35c35f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -257,7 +257,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		/* try section mapping first */
 		if (((addr | next | phys) & ~PMD_MASK) == 0 &&
 		    (flags & NO_BLOCK_MAPPINGS) == 0) {
-			pmd_set_huge(pmdp, phys, prot);
+			WARN_ON(!pmd_set_huge(pmdp, phys, prot));
 
 			/*
 			 * After the PMD entry has been populated once, we
@@ -380,7 +380,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		if (pud_sect_supported() &&
 		   ((addr | next | phys) & ~PUD_MASK) == 0 &&
 		    (flags & NO_BLOCK_MAPPINGS) == 0) {
-			pud_set_huge(pudp, phys, prot);
+			WARN_ON(!pud_set_huge(pudp, phys, prot));
 
 			/*
 			 * After the PUD entry has been populated once, we
-- 
2.54.0.823.g6e5bcc1fc9-goog


