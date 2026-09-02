Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C15C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh/M14gjNPKIhJHces0NPAZ6Z3gj1daHrmdTKDJlvdI=; b=S+kjxOJitxdsYM6jz/fdUpKpKJ
	upcpupu00ZJYvHYKiUPJMq54bzZ5VR2Fsi1xsN4PjqrwQUc0k/3mngDbQSG0QvUEs3asao41j1JtY
	E/9C1Uesu0Cffbsx6tsS+2vd7HEsabT8bcGk9hyjiKCjj0E8oxT323WjC8WdIndIrvgllfVnkT+bk
	rU5APdjDOcdlVwsjKQb1GBYU3egGt5CklHZsTFvWGMZ5UasN9N2INO+qVILEScuVj9ogqZFDU3ooQ
	lF/88OF5NhbktedmlEA8QvzZizkFj/pIv2RozSpSTmkL3SreWQn6D6EelSsV+y+R70Wv43wmR14pA
	2LY78YZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1s-0000000FEQY-3hBS;
	Wed, 02 Sep 2026 16:41:40 +0000
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1l-0000000FE7Q-0MVw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:34 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so2245194a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 09:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367291; x=1788972091; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wh/M14gjNPKIhJHces0NPAZ6Z3gj1daHrmdTKDJlvdI=;
        b=UTlMfSkgPI0H11sj3I89wXPP1+5/9bSoO0T350BG7ZZfWV1AZSZdceUXyoJ+LRHYf7
         NPuI6fCa7m2anvy75VPxXNCwi/uzH0PqxXadI4rhAIgQxJVM6s6Y2FFzT60Bg8EYCQXu
         XWH8n1YXZiX0iVtgVAuWB13PVEvMM/EK4s9Xh4r2UvwFggr8wUXBsM0ASGAKLCgUsje1
         rYsT3HohAWfJj7x9vYHg8jsbq/CmniykDXGA13cxRSWxB/mtK8GJYHiH0ZIEE//b7FF7
         6djN6jchIkACAlpuPJOckCpLcHTn9A+4+eN8pDpsxFNXtD5trAtG9aT9hNESawbxOPJQ
         6ilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367291; x=1788972091;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wh/M14gjNPKIhJHces0NPAZ6Z3gj1daHrmdTKDJlvdI=;
        b=dj+r+zglwM+O8+rq4avNWwTjgeWiqRXbPbdjvGyNoIdiOFX1gXBeMkKoNgn+B6VXs8
         cA3Ue3+vL+HFyUOtf0eU+qcRq+GC4C1c16aAqPqFa9E0bt0VZNkpFSu2gu/N/vugfsnc
         Zg+jHpmvztr7tqIDTpXidEd08eSKmrWDhC3FnO94d0rBbWv7jeq+ICeiW9o05eUZnLV9
         PGwIzdu8bdRK28U5D9rlg5gataqggzB8SWXH5Aj8/n9BU34RxQfC8ZgeZ0AhPRrZiwwL
         nfNa5YpwZgLuyCFGwvwYq1TXRnXORAo4aFq0YKTg9iIs/N6kx3q9dhxjH1pBRFGPyQYM
         e0KQ==
X-Forwarded-Encrypted: i=1; AKwUvByDtekhtsjE13TtWZt94BBqKaik5KGdtJqq7ANErRP60Dd6pacZbHGHg1GOLuVQ6xGT8THxchVU0FdN68Dd4Mf6@lists.infradead.org
X-Gm-Message-State: AFuF++lgwQA6mVV3trJCKLg0QMOLjjezEtpg8Ogc6Yk2V/6NDSvzCjXT
	VuxTP+lg+8zoZoiUdx2gKUlDJj8VhRkMi/OdXJGiSi+1V2g6kBbTzYQSu2xYyWoNIibovIDHHJp
	TDd3hug==
X-Received: from pjbbt18.prod.google.com ([2002:a17:90a:f012:b0:396:5f0e:9c23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c52:b0:38e:6aa7:68ad
 with SMTP id 98e67ed59e1d1-39aedf7c6aemr8714453a91.5.1788367291013; Wed, 02
 Sep 2026 09:41:31 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:08 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-6-seanjc@google.com>
Subject: [PATCH v2 05/20] KVM: selftests: Use goto instead of do-while to
 retry finding unused physical pages
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
X-CRM114-CacheID: sfid-20260902_094133_246092_77D5BAC1 
X-CRM114-Status: GOOD (  13.07  )
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

From: Nicholas Piggin <npiggin@gmail.com>

Rework the core loop of the physical page allocator to use a goto instead
of do-while loop when retrying with a new base address.  The do-while loop
obviously works, but it obfuscates the success vs. failure paths, and in
general is convoluted.

For all intents and purposes, no functional change intended.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[Rebased to latest mainline tree]
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
[sean: separate from alignment change, use enomem label, write changelog]
Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index b071d77dd301..bbf6d7684c0c 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2049,23 +2049,15 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	TEST_ASSERT(!protected || region->protected_phy_pages,
 		    "Region doesn't support protected memory");
 
-	base = pg = min_gpa >> vm->page_shift;
-	do {
-		for (; pg < base + nr_pages; ++pg) {
-			if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
-				base = pg = sparsebit_next_set(region->unused_phy_pages, pg);
-				break;
-			}
+	base = min_gpa >> vm->page_shift;
+again:
+	for (pg = base; pg < base + nr_pages; ++pg) {
+		if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
+			base = sparsebit_next_set(region->unused_phy_pages, pg);
+			if (!base)
+				goto enomem;
+			goto again;
 		}
-	} while (pg && pg != base + nr_pages);
-
-	if (pg == 0) {
-		fprintf(stderr, "No guest physical page available, "
-			"min_gpa: 0x%lx page_size: 0x%x memslot: %u\n",
-			min_gpa, vm->page_size, memslot);
-		fputs("---- vm dump ----\n", stderr);
-		vm_dump(stderr, vm, 2);
-		abort();
 	}
 
 	for (pg = base; pg < base + nr_pages; ++pg) {
@@ -2075,6 +2067,14 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	}
 
 	return base * vm->page_size;
+
+enomem:
+	fprintf(stderr, "No guest physical page available, min_gpa: 0x%lx page_size: 0x%x memslot: %u\n",
+		min_gpa, vm->page_size, memslot);
+	fputs("---- vm dump ----\n", stderr);
+	vm_dump(stderr, vm, 2);
+	abort();
+	__builtin_unreachable();
 }
 
 gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot)
-- 
2.55.0.966.g6673acef38-goog


