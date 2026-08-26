Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A30C61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 23:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7O76V/eNZATQNVf7YqKvmEoyxMF4aKASfVXbmkJmYVA=; b=CFbbPoqZ+m6KwHg3i2c3+LLfm3
	9YNIXBpoV3n9ujjAeFzHqgGPZlgnWEHOZ/hN6KBsT6iG2+0+rfRQXDZ4lCzpHiiMDDyuSqCxa2jFG
	qY5BrFiHUX0qTLUoBgqmpwBuOyEW9YxTHrPlB33pzOnRPGfuMZgmvFHbl6MNsXwcnpap0AWBO6gh3
	PRoPRiGR3JdnwCaOUq3LYTVZAoyrOedIjZCFc1jCch71QfZcZSPAwZw2fjT6Cj0rCyeGV8MjRvIXn
	tFM6h0pqJNUgmtVXrEe8SWwnJc6cRHEJhzOHjEiI5eF/lvcX4jL6JfhElSL5zQe5163ovL7E89bXx
	AaxjI4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgh-000000036Yu-35Gq;
	Wed, 26 Aug 2026 23:05:43 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgK-0000000365B-0PLz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:21 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cb835525b10so1842384a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 16:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785519; x=1788390319; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7O76V/eNZATQNVf7YqKvmEoyxMF4aKASfVXbmkJmYVA=;
        b=viUi/nriOdfoHgkd77vMzoGycAqxsqlRW0IlyNhgjdBhT7nxNEO7HI2OERAJOEZGxo
         wKOLOfXK45QBziVV6HFmiH2eT3UYrtWfmBUXsDoBv5EzvSByGmxWuYUEJ2ddwd7dbQUG
         TkduoY34WClp6diRkNK2tAAyyjf4aMsQ8/bZNya8OaZvB0nbqcFwjT5sqsMP++9Tep1x
         WTm/qx3sMD0aGFujM5TdxJrBwAfDNCkKD/CkmPHK+2UMK+o4o7NgGH8M0w2BxNqpmxD6
         7VBUWSfyXlKUrk92tF2wt1jBk8fw5og/IvLUsIWVhSrkf6HYMyPJWQYATZpIaxEuHefr
         9SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785519; x=1788390319;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7O76V/eNZATQNVf7YqKvmEoyxMF4aKASfVXbmkJmYVA=;
        b=H7VJbMvkgeicTZmufuvhTHqpNID02qlFreAJmwLj88CT77yJPlNwlYQbbn1XI2Nfpp
         nKXpMsHI7xLcwH/Gxybr3rk3iJET51QxqQrsw2ea2AP9KpYkoRNXmFIxEN8G+YiVj8Po
         978d5RyPSBmD/oXxpvSnjQn1E90eUFO3Wx4Gmpnra/JnyDHcwWDKsfCGPJPhNTTe6x4X
         t3FgsW6EgZPGrM1PCE6zWhWJVDH1VT0YTmVc7MuwlXpQMAmIhoV+bzEGiDB0O/oYIFPR
         46d2esVPI3adheVNTH8FtYudqkdTuhpQ4NpRUIdnWGfSvB75VQYu85+XCfvAYXsswWfy
         Uk5A==
X-Forwarded-Encrypted: i=1; AHgh+RrpSGXj1sG6lngPrgJ93QCZJnIItORr1/Za+3pQ37CfRMXcBZcjUnh462JabAG4gMYXXcOiJjNMJGk3Ft31m9uD@lists.infradead.org
X-Gm-Message-State: AFuF++l5o+WlwViroqlFqDPgR5CsMFg+09lc/yHFxwzKqpoU5TEBsbh1
	f0/NkV05tcOwKUJkjQ0p1Rz/ZQhFrvoerVWxyQqN7puGQGScblYAPLAv3Be5kLiQBTcpp9WOyHK
	ku5hfcQ==
X-Received: from pgby7-n2.prod.google.com ([2002:a05:6a02:6507:20b0:cbe:9dc7:9ee8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6f03:b0:3cd:9f0b:f788
 with SMTP id adf61e73a8af0-3cf83d1ef40mr22810769637.12.1787785518656; Wed, 26
 Aug 2026 16:05:18 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:04:54 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-4-seanjc@google.com>
Subject: [PATCH 03/20] KVM: selftests: Use vm_alloc_page_table() to allocate
 LoongArch page tables
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
X-CRM114-CacheID: sfid-20260826_160520_218050_40D82A09 
X-CRM114-Status: GOOD (  12.29  )
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

Now that KVM_GUEST_PAGE_TABLE_MIN_PADDR == LOONGARCH_PAGE_TABLE_PHYS_MIN,
use the common vm_alloc_page_table() instead of open coding the same.

Opportunistically drop the assert that the allocation succeeded, as the
allocator itself guarantees success.

For all intents and purposes, no functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/loongarch/processor.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/loongarch/processor.c b/tools/testing/selftests/kvm/lib/loongarch/processor.c
index 47bbde3e205a..fcd41bc6fbda 100644
--- a/tools/testing/selftests/kvm/lib/loongarch/processor.c
+++ b/tools/testing/selftests/kvm/lib/loongarch/processor.c
@@ -9,7 +9,6 @@
 #include "processor.h"
 #include "ucall_common.h"
 
-#define LOONGARCH_PAGE_TABLE_PHYS_MIN		0x200000
 #define LOONGARCH_GUEST_STACK_VADDR_MIN		0x200000
 
 static gpa_t invalid_pgtable[4];
@@ -57,9 +56,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	child = table = 0;
 	for (i = 0; i < vm->mmu.pgtable_levels; i++) {
 		invalid_pgtable[i] = child;
-		table = vm_phy_page_alloc(vm, LOONGARCH_PAGE_TABLE_PHYS_MIN,
-				vm->memslots[MEM_REGION_PT]);
-		TEST_ASSERT(table, "Fail to allocate page tale at level %d\n", i);
+		table = vm_alloc_page_table(vm);
 		virt_set_pgtable(vm, table, child);
 		child = table;
 	}
-- 
2.55.0.887.g758fc8c411-goog


