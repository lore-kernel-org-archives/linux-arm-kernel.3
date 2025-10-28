Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C4ACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 22:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B288Y6TAy0Oj1t/N3Z1wYBH55x8/0e/DLaA7QkeLdXk=; b=hQQ/lljZnk4boLUhH8XFY0L7Et
	rmuRf3Xs9sqbWSclW8B+fhMnv76xlXzA3MR835JMjMOjeC06iocJZtj+WT0Oyh2VSVzYkygQxT+It
	f1okaGfrAz001d9TqCh50YXbICVgUydp29Nm7xV/tX27jA3URUQLUaQ60LJ/RCcFbYGdZdPXAYbY8
	1Lw6TJ9NqVmY2l5bx6B/yDN2XMZ0S5rC25drYjxd8pBvQsxNPh3AF4LRPG7C77J201o1jmSa3OABt
	sj/eoqvAJAK6vdkEAFR2FSXjMZRlFHByoVCXMjwiHAnWP8G3aHoPn+Tif90rVyq2ifl4zr7NcZHRk
	3dCjYWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsec-0000000Gm2V-0RhX;
	Tue, 28 Oct 2025 22:59:02 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDseU-0000000Gm0E-3SR0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 22:58:56 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33bbbb41a84so14314407a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 15:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761692334; x=1762297134; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B288Y6TAy0Oj1t/N3Z1wYBH55x8/0e/DLaA7QkeLdXk=;
        b=IcsNmvPQeeWVVik6H/DInuZe7cRuezerbVMdHzUeo+7GpLKlIgSgPe8kMrfWvB+l+r
         r1nkO4W/tDqtBPdIxuejyUqjpk64+FPV103SmaoL2WoslzDWk1W0gb3Z2yf/F4JBJNpt
         aFXaFF0R1QEij/NUiEfYAOnnS1oC9NhSPTvvlCY9niZiboeAbP0xQIFCYhH1OxyNW5bB
         x+mDUszmfLOr2E1Z4QEQO36KW+P44IEgh9tkbtxX2qduvW3GraKlWSR8PuX8ZnUlSmy2
         j/pcN6LRfAQfpsISvZWVCr8a0dyzgPtS/Jc2DNdyoexgPPIpzBdNj7f4qJ2LB8pr+bDG
         hQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761692334; x=1762297134;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B288Y6TAy0Oj1t/N3Z1wYBH55x8/0e/DLaA7QkeLdXk=;
        b=nNG0ahF2dqgNBkNaP9MRySHlOAXedKrbAGAguKIFi14J3SWaOd7w9ECf3dsPJkLFVJ
         YNz7i6YL9C3pgCa4Ug6nSkz5aqSomV3l6Qsmi2Mg8NW3iJzGxP2VaiUpomWihq+ByOC0
         V04IFuBwo8MY95Yd1qVpwOpJyuxzin9U+eq+Yn4RZ7C4z0UVMrfMm5P5BkehfDNzqeLY
         HMgx/oseIHyrjtATacG8SBa4NKwmT+ucW7kzKX0ypXAA9OSWdyygwksCeL6yDScg9uTn
         BKU1Vyk8V+uRPFqUbesIpBTLDMNX6fRcy7Ue306IcjwCDtUrz6Lm6V00ONz/CT59bV4y
         CXig==
X-Forwarded-Encrypted: i=1; AJvYcCUKTFzbqVdls7tdfd4DcqGSDaHcDp0OIrLpXqjwcngy0XIdhddimdqBJ3pSRyX8BZrOpoFC5fQ4JcCUq+Oz/l9g@lists.infradead.org
X-Gm-Message-State: AOJu0YwXgGavNrEbGgHqs2LtbuSRgwDtmOVZUvm/Gk9KGWTP5upSCY+N
	awgo8IomOAcszIYHIs+gk58xPgh1wJsxxyGyj0SVYvQ3agrkFodNQ0KGP0L2DVNlfr4LC3wAqT8
	30uIs2whKdZ0X0Q==
X-Google-Smtp-Source: AGHT+IHUBNt+yVkmaDzMVABj692uUI0JHObl1P4P9tqPjQ42MTaBcOUyDM9YJNfeKyaxLDAtJvc+QR92G8cTPA==
X-Received: from pjso22.prod.google.com ([2002:a17:90a:c096:b0:33b:b387:9850])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:586c:b0:330:a454:c31a with SMTP id 98e67ed59e1d1-3403a2f2d62mr821811a91.32.1761692333727;
 Tue, 28 Oct 2025 15:58:53 -0700 (PDT)
Date: Tue, 28 Oct 2025 15:30:39 -0700
In-Reply-To: <20251028225827.2269128-1-jmattson@google.com>
Mime-Version: 1.0
References: <20251028225827.2269128-1-jmattson@google.com>
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251028225827.2269128-2-jmattson@google.com>
Subject: [PATCH v2 1/4] KVM: selftests: Use a loop to create guest page tables
From: Jim Mattson <jmattson@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Bibo Mao <maobibo@loongson.cn>, Jim Mattson <jmattson@google.com>, 
	"Pratik R. Sampat" <prsampat@amd.com>, James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_155854_864509_1717AF19 
X-CRM114-Status: GOOD (  13.57  )
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

Walk the guest page tables via a loop when creating new mappings,
instead of using unique variables for each level of the page tables.

This simplifies the code and makes it easier to support 5-level paging
in the future.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 .../testing/selftests/kvm/lib/x86/processor.c | 25 ++++++++-----------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index b418502c5ecc..738f2a44083f 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -218,8 +218,8 @@ static uint64_t *virt_create_upper_pte(struct kvm_vm *vm,
 void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
 {
 	const uint64_t pg_size = PG_LEVEL_SIZE(level);
-	uint64_t *pml4e, *pdpe, *pde;
-	uint64_t *pte;
+	uint64_t *pte = &vm->pgd;
+	int current_level;
 
 	TEST_ASSERT(vm->mode == VM_MODE_PXXV48_4K,
 		    "Unknown or unsupported guest mode, mode: 0x%x", vm->mode);
@@ -243,20 +243,17 @@ void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
 	 * Allocate upper level page tables, if not already present.  Return
 	 * early if a hugepage was created.
 	 */
-	pml4e = virt_create_upper_pte(vm, &vm->pgd, vaddr, paddr, PG_LEVEL_512G, level);
-	if (*pml4e & PTE_LARGE_MASK)
-		return;
-
-	pdpe = virt_create_upper_pte(vm, pml4e, vaddr, paddr, PG_LEVEL_1G, level);
-	if (*pdpe & PTE_LARGE_MASK)
-		return;
-
-	pde = virt_create_upper_pte(vm, pdpe, vaddr, paddr, PG_LEVEL_2M, level);
-	if (*pde & PTE_LARGE_MASK)
-		return;
+	for (current_level = vm->pgtable_levels;
+	     current_level > PG_LEVEL_4K;
+	     current_level--) {
+		pte = virt_create_upper_pte(vm, pte, vaddr, paddr,
+					    current_level, level);
+		if (*pte & PTE_LARGE_MASK)
+			return;
+	}
 
 	/* Fill in page table entry. */
-	pte = virt_get_pte(vm, pde, vaddr, PG_LEVEL_4K);
+	pte = virt_get_pte(vm, pte, vaddr, PG_LEVEL_4K);
 	TEST_ASSERT(!(*pte & PTE_PRESENT_MASK),
 		    "PTE already present for 4k page at vaddr: 0x%lx", vaddr);
 	*pte = PTE_PRESENT_MASK | PTE_WRITABLE_MASK | (paddr & PHYSICAL_PAGE_MASK);
-- 
2.51.1.851.g4ebd6896fd-goog


