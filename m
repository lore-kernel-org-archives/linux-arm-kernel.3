Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8E6CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtBeFQlOADPYK4gJNp1okGIhaF4i6t2Ouexf2+2MrWs=; b=KJPSYsay3pN7TDKNVGGf/PSYtF
	Ue+UCVhotH3g93e4bFi9RfkCrshHE5rWMbcBHIpeBzDJ4xIgTRAuwl58x4UD1tkdTuhBkzsK7dHDK
	wv0411ELfJM1/QtesBIoeCy+hIlgutuyqzwpzudNB14hAay8eEjKGf9I9FXpU/3i3nsTk9D9e6CCq
	3V055v5h6BGTf7BaCS8KfrFfbJl4FeL7oZxxiXkfM37tuiiBXgZvbPI4VKPR9haHBM0xaJl24NF/q
	JtVJNIP99hbOjezEtWCVXKxkK6rwOlAaabaNvrqDOAm8sw0QZ2Ss/OHNOx0XZU3Igw+X3qGXKGHNK
	VZwFJWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw40-00000002mqV-0CwS;
	Tue, 26 May 2026 17:59:36 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw3q-00000002mjM-2I5D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:27 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-68751570301so6069326a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818364; x=1780423164; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LtBeFQlOADPYK4gJNp1okGIhaF4i6t2Ouexf2+2MrWs=;
        b=MXg3B9S+03272o2sdxYf6EbFlVZ429W0sveZ+SUmFWJ+ATiA92q8yiMN0xECBIHHbd
         fF2/VCUa6dLhY6LTT03zictpC6ZiLGC0blb6TNHDRpWjTLdYOXznF9etpq7D3DdWjSvI
         cGiZqTXwaxlNTrIYAD7ghm/vSrSKiWf8lYfB6uGxVb3RQo6NxUBJBXNBMC56mejqhY/P
         /z4EtzDXJIRi7O3bnnphfJfzVsUcbZ9VgrkioAOcO7c9vHTU6WXG8hnK0QV0Gg9hZ9rp
         oblsm4fDmCOH+Be7AlEhdKsUnWdB1f7x3v7gKFm8HNHvpmBCP9RPyrnhjx/jScurNdek
         xL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818364; x=1780423164;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LtBeFQlOADPYK4gJNp1okGIhaF4i6t2Ouexf2+2MrWs=;
        b=AIsB45FO8slE27TU1IIRNCoDbbu6M0nhKW/hVzcnFtqOAXAODfT1uhmp1dHXsoBAY0
         tnS9v6PjEzt/QiAAivF9iUP73zgHmO7C0++/NgChYlxCIcIDXt2wKGcZ5ylxXrwvtoqD
         MYC4OQ4lUU97a5lIcMOjy1z8uMLc4CHe1BiQT+J4YutqWDDVBeFt/35fhUfIx3wd3phN
         Z64CAnHKvZVVOnTpWI7dh/ZKh+JG/rmF+EkDfoEoENHSnpf1CoA9FmDmz54sHDu8x1zB
         ftwAL3zKc+zFVxLVS88/W10mLxmdye82iszdKn7UiWZVpKnFISUL1AkIahV0O9FZiXSD
         KKPA==
X-Gm-Message-State: AOJu0Yx4JBEGuV+xfpExKHnLWlhcNm07wxlgzuQBTy/BRazmr4kiJGFF
	Cppdow9mVWLHK8x5zAYTyvqRSVmdqpljziI20vX13mQln/+TRGvB7C6EcxT4yOeIkuEcJvGKiEM
	eh1WfNQhkKXoNBRmW6jVarmgUoqbmbjZPp3X5w52ZdD2JlvgsI3RE6BJmMAK6jaKP5S3bBOFtXH
	SQNHx3KFLNt6VVfJnuO6bEwSvM5mzutoAC8R8uuNTUJFCW
X-Received: from edye18.prod.google.com ([2002:a05:6402:892:b0:67c:573d:d3a0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:40d4:b0:67b:cd1f:9cc1
 with SMTP id 4fb4d7f45d1cf-6889c445088mr10125279a12.6.1779818363764; Tue, 26
 May 2026 10:59:23 -0700 (PDT)
Date: Tue, 26 May 2026 19:58:50 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2121; i=ardb@kernel.org;
 h=from:subject; bh=UYuabKAGVqw/38U/k7XQfrNPG5ThRXq/7mqnsjcGnSk=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0fvTm0BsvTTTaUheFf26uWyada7zXR7A5ui2rSTZi1
 o2FJrwdpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCKHcxj+Cl+U+L3mz31fZxuh
 tHcrzdsEq/i1War/p2x78yRMa8USUUaGzw8WujlZRJw7v672d9asvI8f57TITLjpqnwn3Gp2wO5 +NgA=
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-20-ardb+git@google.com>
Subject: [PATCH v6 03/15] arm64: mm: Check for pud_/pmd_set_huge() failures on
 kernel mappings
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
X-CRM114-CacheID: sfid-20260526_105926_622137_B516A4EA 
X-CRM114-Status: GOOD (  17.08  )
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
2.54.0.794.g4f17f83d09-goog


