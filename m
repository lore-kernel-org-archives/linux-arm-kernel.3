Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE14DCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPDlks8S40wU9ZB94GBJYrEHqJjoYpfybndF76KRr9U=; b=4Thb+QWxGYQlkwrzsFLjg0f1cz
	W5NgUIX9u6w80Jmj8ZYzwCqmcCcfckl7dt+R8kB7N30qyOVLfIv7/UElMUKgHtIb5rdmaUtAVN9xF
	k9qpTF4PGwu7IkrBT2ttHamYySjJFnE2v6v8EydmYW++nLfPhnDbfKpQLcZ9tIg6ahwMn5V19MibA
	YKlH49oBXz5GPVnLKm0ZaqjAwpUh2m4aVKHP1j1mem7zKfAaTULyGdxQrHPBvUn1MpKTCB/Lr0YNU
	OM0irCu6nGxGGmBu7iJLEqIBRrAG39d54qDNjgCej0Bwne070AnPvDCtf48JgCYGWV561tYi+VvQe
	f+vNfayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK1zx-0000000EVLL-3nBY;
	Mon, 04 May 2026 22:42:45 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK1zv-0000000EVJd-2e08
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:42:44 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c7948640854so1949538a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 15:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777934562; x=1778539362; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPDlks8S40wU9ZB94GBJYrEHqJjoYpfybndF76KRr9U=;
        b=EbqZUrgPB/zOQLFJFYwPcM6bVDrXhtjJ6G/KqMIxxvVC7sEimssdn4LQA8cKU4u5/F
         Z6Ggp6bocLZha2GezkSFcHT7rYn0KAnFBq++oTb/foaHi7R8QQqflVxMTlGK+6E/uKYn
         TBeRmlwS0mKK45tW2Q9bIT+HOqz1+9uFC35RNzZP09ah6ey0Y13dSZBPB0e+ZXPJYGlr
         6WvAfkzu59aVLLJIdJaE42kwO14X9enfWcudjfMY6l/wdQF86zL+yQrPmavUT0scqoi9
         ok4Ru+fWlNHJZ+cCjSZs9UER6p0Tlz30Pjf8UzlfBwuQsNNeRUbFoHgIzRzKUl7sH+w3
         9BMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934562; x=1778539362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WPDlks8S40wU9ZB94GBJYrEHqJjoYpfybndF76KRr9U=;
        b=IquCr+0DjXP9SNg2j8fsKSGKXe3XMGu4cnKbSFdHVyI2y4KGLrSILaM7FhLagjXc9P
         5cpUEkKIENloi4e0YhaTvFGb1KhWluhbOczRmcV0rU+LXXxWom+xPOXVVH7kUEw81X4d
         I+7NoeVic1px7O4PdWRbE6Tr9yapp/G14Glepn/paeLWDmHMcQg0yQHffLBJQTiRA7+k
         QRteC3Adj7uoVAjdXUpoaCWeEPABFIpxgk+N/wdd8OBIZwzx+FWr1juU7t9Fzo7zSi6i
         eJUjpx14KIEm7/BBKnTYV4AOl59iRIbPG/Xt7A+Vqcs8E/z3xbf374YjJ4GysR7jWfxR
         xgPw==
X-Forwarded-Encrypted: i=1; AFNElJ9RrqkmG34lemyciKMNXDhC53QopPE0Si1qL0KsXmjASyIIa67E/mv4kCi3WPjssTaq7cYo+vzlvS76fFSZbGyg@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq80Q2WbIzize5ek+0mz/dfy75lcGattyDgzBpih+qDgzPwpPe
	hwBYE4CP6WF6vsC4MCH0OH2wJzzyQwBoveEfvLT3btC0PtQV3ORqf0a1fru712PtBkqDFEEqj/N
	7y1tFk5Xp6s+Y3Wqx0CoKYg==
X-Received: from pgbcp9.prod.google.com ([2002:a05:6a02:4009:b0:c79:8315:4734])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:918a:b0:3a2:e0d3:37d1 with SMTP id adf61e73a8af0-3a7f1eb20dbmr12044574637.41.1777934561428;
 Mon, 04 May 2026 15:42:41 -0700 (PDT)
Date: Mon,  4 May 2026 22:42:10 +0000
In-Reply-To: <20260504224213.1049426-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260504224213.1049426-1-jthoughton@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504224213.1049426-4-jthoughton@google.com>
Subject: [PATCH 3/5] KVM: mips: Grab MMU lock in kvm_arch_flush_shadow_all()
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Gavin Shan <gshan@redhat.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Ricardo Koller <ricarkol@google.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, James Hogan <jhogan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_154243_672298_DFBEAA86 
X-CRM114-Status: GOOD (  10.57  )
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

kvm_mips_flush_gpa_pt() expects the MMU lock to be held; it is not in
this path.

This can lead to a double-free of page table entries if
kvm_arch_flush_shadow_all() is called twice on the same `kvm`
concurrently; such a scenario is possible.

Cc: stable@vger.kernel.org
Fixes: b62091108633 ("KVM: MIPS: Implement kvm_arch_flush_shadow_all/memslot")
Signed-off-by: James Houghton <jthoughton@google.com>
---
Note: This is compile-tested only!

 arch/mips/kvm/mips.c | 2 ++
 arch/mips/kvm/mmu.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a53abbba43ea..463b6c4aa62c 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -180,6 +180,8 @@ long kvm_arch_dev_ioctl(struct file *filp, unsigned int ioctl,
 
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
+	guard(spinlock)(&kvm->mmu_lock);
+
 	/* Flush whole GPA */
 	kvm_mips_flush_gpa_pt(kvm, 0, ~0);
 	kvm_flush_remote_tlbs(kvm);
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index d2c3b6b41f18..5045833f8116 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -269,6 +269,8 @@ static bool kvm_mips_flush_gpa_pgd(pgd_t *pgd, unsigned long start_gpa,
  */
 bool kvm_mips_flush_gpa_pt(struct kvm *kvm, gfn_t start_gfn, gfn_t end_gfn)
 {
+	lockdep_assert_held(&kvm->mmu_lock);
+
 	return kvm_mips_flush_gpa_pgd(kvm->arch.gpa_mm.pgd,
 				      start_gfn << PAGE_SHIFT,
 				      end_gfn << PAGE_SHIFT);
-- 
2.54.0.545.g6539524ca2-goog


