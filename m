Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383B7C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 23:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHiSvQXl4tkWm+SikbwEM4QvcPfHzRPC0s7Gep7aVew=; b=QzIU6xTdGKfF9VkxYJxDsDMvpU
	QJRx5wgX3AF3nD8LrqBx1YnLGEZ2/kXSGnZktT2fLMMyLATrMbjiaLm8P/6CJ8kageKWj2A1Abnu6
	xC8DBGjOXQkP/e7PwUw1Al14yLio9ni6Su2rJxC7VrkxfqpFgz4X96BV0oVfolzeOTlnnPvdDK74r
	DvydTxZ+57Kofe3YQn2KQbUk3e5QYzTFFSVj/DXrEH41UNUBCGCRbzxuJCsBMAdp7TEIJvrIhOvU2
	d5aFt6yw3BbvaQ6GB/YZrgG7Ub/7rGvj0hvZyP/IhyIB6V5xUcJ+ENJC/NcevRY0nRN4v0HN0ySOS
	lMppuIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMiD-000000038ln-2abb;
	Wed, 26 Aug 2026 23:07:17 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgg-000000036Ud-0U2w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:47 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-84859a64079so96133b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 16:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785540; x=1788390340; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pHiSvQXl4tkWm+SikbwEM4QvcPfHzRPC0s7Gep7aVew=;
        b=INpkLr1fvVLvYon/bkf7KM65z2TYI7obmoBXbuvbOQS+rHmm5H0nmcEYV6NLWxzJ6d
         UYQJ5FYWQ9TUm9o3VLdHBsHXrcYxHJuhTWoz2QzWk3VoQl5O3B+GPfzqn9nMJZqAzWt+
         QfpwJAzu9wRUhg82MQl4SUHQhNbSfpn19j+E1luZ4YsnMmUU+Qg6QESGPWhIhqL9qeyY
         DbLyK7At1+Z8c/b+MSVEwSzH+SlB1Kj4T8GXmTjAc2+UxRMsND8jy01Abhbv3NQgUl3C
         8YqnL6wSqsHe5bWYP24aL/oNw6x6hiRNrm/dgcOmgLT2KqiKcBUABR8iRpLA4KzhmAcl
         FMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785540; x=1788390340;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pHiSvQXl4tkWm+SikbwEM4QvcPfHzRPC0s7Gep7aVew=;
        b=ZMfFmOIy2B0b5AV4V0bChll5+RjHYkS4tTh/hjNyyMgAQ5NnaCc8BgcibWv6ZCRe9N
         IZWRFGIyNF5M2S8F3j3Mnj1B0zCWJLPOcYeNVPjRvlliUPp/pq18r+0n9ryzwxbDfm1p
         7RkT4qzpHeAsi/UtZtmmw3pLUWmRMFa3DglFe3gUo7RoEbD/yoIJMKLzlfrhYtfsWzwj
         wBH723HCobZnXRtm7jOn9UhhLQRNyWbXILZ8dFGKvYssho6l5jtv3ebp7bLlCZZYmrst
         s+QcbcgMbgv2ITiTdF0rsI+XylXx+NrNGWoZ4aqtLFR/32IsZ47zRSq8QUoPY3w68n6i
         P7RQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpUJzE8ybldnFdZCb4Zb9Rc+b80F8vW/0Gq2n57IQE8HOMtJly3G8SsaOjWPwI/V2ORqYDOhJeaXgAsWHmGWXu@lists.infradead.org
X-Gm-Message-State: AFuF++mPUU6jA9M1h6pyYeuf8Qr0J3zluMCKnT13YdMDou6slXl6zseM
	AXJvTe0kD7bhTdIh+/2lAyThADH2gG5K23QvyByAXIldiwczUsdopNNjeGDw+07YFKyK9CdX0fK
	EcVRB7w==
X-Received: from pfbcb3.prod.google.com ([2002:a05:6a00:4303:b0:847:aa6c:47fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b53:b0:851:8baf:5b26
 with SMTP id d2e1a72fcca58-853749a5e4emr17924734b3a.14.1787785540289; Wed, 26
 Aug 2026 16:05:40 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:11 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-21-seanjc@google.com>
Subject: [PATCH 20/20] KVM: selftests: Add arch hook to force page tables to
 be naturally aligned
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
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_160542_225931_82A68911 
X-CRM114-Status: GOOD (  12.21  )
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

Add an arch hook to communicate to the core physical page allocator that
page table allocations need to be naturally aligned.  The hook will be used
for upcoming PowerPC support, which has MMU tables that are larger than the
guest base page size and need to be naturally aligned.

Bury the hook in the physical page allocator to avoid having to plumb a
rarely used param into the main APIs.

Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c     | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 1264cd1a343a..ffd4cf740d7f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1050,6 +1050,8 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
 
 const char *exit_reason_str(unsigned int exit_reason);
 
+bool kvm_arch_needs_naturally_aligned_page_tables(void);
+
 gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			     u32 memslot, bool protected, bool naturally_aligned);
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 8b5b330a5889..57b653fbd0b1 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2085,10 +2085,16 @@ gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	__builtin_unreachable();
 }
 
+__weak bool kvm_arch_needs_naturally_aligned_page_tables(void)
+{
+	return false;
+}
+
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 			   enum kvm_mem_region_type type, bool protected)
 {
 	struct userspace_mem_region *region = vm_get_mem_region(vm, type);
+	bool naturally_aligned = false;
 	gpa_t min_gpa;
 
 	TEST_ASSERT(region, "No region for type '%u', memslot '%u'",
@@ -2110,6 +2116,7 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 		break;
 	case MEM_REGION_PT:
 		min_gpa = KVM_GUEST_PAGE_TABLE_MIN_PADDR;
+		naturally_aligned = kvm_arch_needs_naturally_aligned_page_tables();
 		break;
 	case MEM_REGION_TEST_EXTRA:
 		min_gpa = region->region.guest_phys_addr;
@@ -2120,7 +2127,7 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 	}
 
 	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, vm->memslots[type],
-				      protected, false);
+				      protected, naturally_aligned);
 }
 
 /*
-- 
2.55.0.887.g758fc8c411-goog


