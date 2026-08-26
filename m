Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A60C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 23:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWeAmxR3HdkD+eL/iYkERMpi9Iin+GwZMkGAjZk8hSk=; b=d6lJB1IeGlHHqiap6PkvojhGkt
	2AYSnogXceyZXcC+BmX+ilBYevga7F/UmKVqJlLTjBEcY981SUj5UfEf2bp8tklOA5zLP2CLVY7rM
	897kcLxirKdzjkIVdo1LG7NfR7Ql2rdwMmdZMq7AMDLvNhe4mrBNzU30JUDW1mSXrjQaWWL4xUfuj
	j6UoBw14iKbxyBQ2o642Lkowt4Zz15YKqPo++cSxqh7SkmEhB6Bw8tFHYI5Jj/cMvWY8jrknrG1n8
	NbXmJHy6Nq10Z9xP/Tq81aHvQD/BT6f5Ngtu4wV2ngjt+triHtkXuLtZm8srRkTWyqHrn4uTlz+lC
	jTct1K9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgk-000000036dD-3ga4;
	Wed, 26 Aug 2026 23:05:46 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgN-0000000368B-3IZ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:25 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-854f274dd69so232578b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 16:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785522; x=1788390322; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YWeAmxR3HdkD+eL/iYkERMpi9Iin+GwZMkGAjZk8hSk=;
        b=au9gX8fkeJDpvIjdA5wdYq62Ubdb5ifniHcvqo4qS0wW/CkyFpqCjsmpoCRQVYNw2s
         17eIP6VI6WAZ1nhfHJ9Pk9pCXKCboNGpcflrMILBPdmxYMF1wXv3loTgZseTlFDV/nW2
         j3yFWdmufQcpFxJvjJbng9k90kn+tSvTFc9+q/OlHu7ofmykc7aYaQqNmZEzbdVC32ti
         3yx6oGvRWPGVmPN0YgggUdWqhSbzcETmjMZo4b6RnxN6XuxovAb05/FKf1jrVpWRMc7h
         /a/UaOWDX/I7Fc+AAPS8DqQuBFpYz+Ma00cfucA9vMzFSF/ZuTMnQS1t4C4cKqjt8aRd
         0FeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785522; x=1788390322;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YWeAmxR3HdkD+eL/iYkERMpi9Iin+GwZMkGAjZk8hSk=;
        b=s4+YBsoqZ/1rALAYyvkGh4Q6OrVRF2guuA/Faud/S1ySH3rIA7gH8EXu1BcO9Vkj95
         muumQ0SEvC8+o1HEaVImeQ9qNITSAwn5Ewm5ARQAfkA9cTHC4Nn4AOaKtNsQFQpCvv7w
         UVV4dSvWMGU15XUby7QBpOQUFcIjQ4oZoehYRrSIeY2N39BtgbLSPUdE/2NH8tyBDhFc
         OxZrhA5QP5YjWsHeGDzoC/SOIYTUpjHxiuvmDFw3EhHBiXv5yy1H5rNpolrZPPd3AOcU
         X6V+7oGUfGTUPKwy/BeQYL7YYlYeXevtZQ3awkppE6fUSkFDU2iw0HUbe1DrFVkidVkJ
         w28w==
X-Forwarded-Encrypted: i=1; AHgh+Rrl1EXZS4fz+fjDRVl6OCq630uErjiJ/m/T6ksJVFdomFy/sFrZoRi54wxPWcAcik1PAIKSf9RLn6o3AdxyQpn6@lists.infradead.org
X-Gm-Message-State: AFuF++m1WK8xLek1gDVEpB63jBdx2i+atUpo6GlVcitAqRKKMfa1K9Vv
	A7oTNxyOd/4Ko8lSBb6veoSUtOx1rn8LYWsciTQM706VMFL2VqLTwuI5dsn/lidNriwDdPsWz/5
	78aG7mg==
X-Received: from pgbaz9.prod.google.com ([2002:a05:6a02:49:b0:c85:a528:228f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c916:b0:3c8:d3a4:7b40
 with SMTP id adf61e73a8af0-3cf7576da18mr22519138637.2.1787785521893; Wed, 26
 Aug 2026 16:05:21 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:04:56 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-6-seanjc@google.com>
Subject: [PATCH 05/20] KVM: selftests: Use goto instead of do-while to retry
 finding unused physical pages
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
X-CRM114-CacheID: sfid-20260826_160524_015240_E2E2FAC6 
X-CRM114-Status: GOOD (  12.12  )
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
2.55.0.887.g758fc8c411-goog


