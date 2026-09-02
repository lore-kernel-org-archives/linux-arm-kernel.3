Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B633C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zhVxUyRpRhnHXbQLMxjoc4Ys+BN3Anj09sDDnw94v8=; b=QV2MPF1MyKCHNgrf+Ad/ogYSHD
	YMLzIEYCXX+ZGRVHC/yz7gEDwPfMuD0uRqLNjasJImUygq58dYklLF3PFZiHWsIknY409h4uTtnbb
	7Ec0MEdkRq7PARwVlBA4rAjJxbVn/YHrh4M0TsudUT0RQEvq+ua6QyZNNKz56rLyt2mAwE7sv9+Q2
	1WS/o23lSkPVWD8ECO96ttAAFuktxcV4+llzk2cKeRJnqys8GEoDe7T3TvWaoo3P9QGq6e7bqnzK1
	bQt0PtMbKG3Em6nEDRn3PVrsV8XCTFTg8LQDIVqrGUSuzGaudfZyBmnzVF1lcU0HSONT556oWhqVQ
	kNGX+7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1m-0000000FEDB-2jhv;
	Wed, 02 Sep 2026 16:41:34 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1h-0000000FE3m-2G6Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:32 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cc1d85c012dso2254767a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 09:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367288; x=1788972088; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0zhVxUyRpRhnHXbQLMxjoc4Ys+BN3Anj09sDDnw94v8=;
        b=rNguueMKEn6U8mBZL+YrixjT5dWBLQKLi7eGjef8sVFhDUuN4R3l6eqw+qPg4hRzF2
         5WVNmfOS+YHyk+MX0od7yoxnU02pcpStNmXF1OUNSAYiZCH63Aasf9/IrpldCAXNzXVh
         Tx5jxIE6Jld3lGrv7aO/PeoWYyKnvkt5+7c8Wfs4MdA8ipxN3cjBJuwHd7qU53LYbPq/
         KRjtFEPuacjHa9b08pm8lYHB+wxJoFbmaAj95b22VTp+uXE7HvHloGhicOJZTOfM2pDh
         6dt6dgeoyZmYzUV2BLvYikc2IOJEMxcMeR4jhTU0FUw8UBbXAgb/AyvnP8/PzHbVGURE
         7O8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367288; x=1788972088;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0zhVxUyRpRhnHXbQLMxjoc4Ys+BN3Anj09sDDnw94v8=;
        b=QrJu9xQg/uf1qFHqVFuM4JAjdCa0zdF9t+ageN90+/KHDX87UXzE91ESvpRLbrHDqL
         Stk+bTUs2p6H/hAy236pVLTqHTTcwv8Xv0/yQf9bP55n5mMD0dvYHYITnuuwm7humfka
         +4DfCrk8hdYS3Ju9mQU37h1CdAvytRksjFAmjx6zopvVcPTUvmKMBAJZJenfslF7IS1S
         ddtVY47j5H9mGtO7X6kbk7tMDqRdX3VHbyA8xLvsYlvvapGJChvC4yf5WaE4ngSlvsgy
         6ImnYHWlbXNYM3P29BhPhyJzhrtY5/75cJKiOCXdyYosqwIyv8CI6d4jmuFHAPEs3E0c
         CI4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwizoGtE7fD7mPBkRgZyJ3EMEFH1tAwWLJ08HBF1HvMyi/vDYEzxXyOtnKpGgtCYmm2Zs8/YaKWpWSMGaDDjLv4@lists.infradead.org
X-Gm-Message-State: AFuF++mJJn2/q05C78ytYxOlx7VMhIaOZFz80A/1enG+8Niryd31EDHC
	s73tFYBVI7WZ6lPzvkR495wTVBcvyHK+9OC396BqDcCZ4U6+wjiUUBCrqZh89m2e6BhEV0pcZ7X
	OfsWC/A==
X-Received: from pgbd10-n1.prod.google.com ([2002:a05:6a02:64ca:10b0:cc4:2728:8938])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7f82:b0:3cc:2552:ddd7
 with SMTP id adf61e73a8af0-3d9adaba731mr8793167637.5.1788367287815; Wed, 02
 Sep 2026 09:41:27 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:06 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-4-seanjc@google.com>
Subject: [PATCH v2 03/20] KVM: selftests: Use vm_alloc_page_table() to
 allocate LoongArch page tables
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_094130_656130_6D8EBD46 
X-CRM114-Status: GOOD (  12.76  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Now that LoongArch uses KVM_GUEST_PAGE_TABLE_MIN_PADDR for its page table
page allocations, use the common vm_alloc_page_table() instead of open
coding the same.

Opportunistically drop the assert that the allocation succeeded, as the
allocator itself guarantees success.

No functional change intended.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/loongarch/processor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/loongarch/processor.c b/tools/testing/selftests/kvm/lib/loongarch/processor.c
index 057a77713542..fcd41bc6fbda 100644
--- a/tools/testing/selftests/kvm/lib/loongarch/processor.c
+++ b/tools/testing/selftests/kvm/lib/loongarch/processor.c
@@ -56,9 +56,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	child = table = 0;
 	for (i = 0; i < vm->mmu.pgtable_levels; i++) {
 		invalid_pgtable[i] = child;
-		table = vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				vm->memslots[MEM_REGION_PT]);
-		TEST_ASSERT(table, "Fail to allocate page tale at level %d\n", i);
+		table = vm_alloc_page_table(vm);
 		virt_set_pgtable(vm, table, child);
 		child = table;
 	}
-- 
2.55.0.966.g6673acef38-goog


