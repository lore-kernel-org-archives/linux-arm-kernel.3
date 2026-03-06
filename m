Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77E9F0183C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHiziDrbrII1tYwtdt9uLufHtIuF7NAMU9T1cNEOC3I=; b=eHqC+dQ9NGgJMXUkNVnOriyRgd
	JdEVspqQg1YfIKru+t5nVLXVZepaMfgBFR8akalMAFPMuRS3CYriaVL9OzW5OBHD2w8OZ/vYbghH4
	+znMh5JKXvnU8BfhocWG9UF6y4jDUEceaT+gJxEg+AZ16x93CakclqAwjerG2jqg0T0TaBGcM/yOW
	OgwXxYv7fRctwJvqO0BM8+wuSfbGxKxeq5fap/BQtVOrU3TrEOzbgkSL2qOKQqwH7sl0KeCPVC2PZ
	ftiGVVNyUowbodwT0AFvjNA/ykqsFRom1ETuj3iGHtsHwN2fYt7xxeFJqEnVw7DSuASk+U0cEPyTs
	GzV47nIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlP-00000003qBI-2Grt;
	Fri, 06 Mar 2026 14:02:47 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlK-00000003q4y-1jwn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:02:43 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4836bf1a920so99520485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772805759; x=1773410559; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sHiziDrbrII1tYwtdt9uLufHtIuF7NAMU9T1cNEOC3I=;
        b=rtdQQLUzublQS/SV65D+fGHhN51kz+MnfYW82Iimje6YJG0UlE4ld/vUTZxsREWhhB
         /1hgzCRpTTFKF4qXgT/sOezscudnvPJYO7C8ZkH19BdiKqfzU2ECH8LyPy7dTUDGtVNk
         0Ux+0SBN1uMTrHJqXr/UtAxH16V1hGjnQIkRDIF8M08OXANACpxbPIlUS9B6DJvICVit
         wDwyw7qU6JUCIIKZ0aVemHBaMukDAoYfpXb76X9GI0PcnPUTfFWtz+R1Nv4dwCeYAxDl
         uWIVahBcrvyYU18OLYe8R7tSZblw586X6uiJwQFnRWHn+MoQXZqOj5hRew/fgqCGP5eV
         P8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805759; x=1773410559;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sHiziDrbrII1tYwtdt9uLufHtIuF7NAMU9T1cNEOC3I=;
        b=XryEG+qbIR4p7U37Ktky+DjHoB7mqlDn/Y5E6ecA+/ZrjGZQ9MxUURiWxz7quElXhh
         NuK93H8sO/hfICf/CEe/GOFZN/pMxuRzbRqslXhWjegJgvLZ+0KlDAUpuxPxWFgbrUmt
         fTK6rxOGp7ez1Afv4FcT81ZXYu7DKVbAEK7fYedj0KN2L2CmrjYzx5TvcAop+Cq9+kC/
         oJTxgq4MCqpNjOoHzTpgF1MPKVP3RbzFgv75ooew688k6pYd/Dtd2AB2JZkwWuAl7SbL
         NlOCBhvcjXNNResyEQ5ikcS4PaL0NgFmQfrN+ntxj4JxDHsQ+DjJOTJr3zY2THUrI28S
         yVoA==
X-Forwarded-Encrypted: i=1; AJvYcCXsTVlXAQH67q4nxBqZsmqyKjq2ruehJmCRUrUa39lFpFW1R61vzxGZsmv1Qk1gh/f0DplcstvCtTPKqnrqfOEp@lists.infradead.org
X-Gm-Message-State: AOJu0YzK8Gs8acHpDmDoTuvxCqm3QHYd/J9fa1l5tkx0ak+FAEtJbp3P
	LrqAnxd1RotqSnJur9ClA1I8p4EEfPIHZkh7mNeZ0mVtMg4NtCn6JnmS7zJidr5kXapmGLVDCWA
	X1Q==
X-Received: from wmjk6.prod.google.com ([2002:a7b:c306:0:b0:483:7b48:cd99])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a0d:b0:485:1878:7b8c
 with SMTP id 5b1f17b1804b1-4852695b6fcmr34660805e9.18.1772805758953; Fri, 06
 Mar 2026 06:02:38 -0800 (PST)
Date: Fri,  6 Mar 2026 14:02:23 +0000
In-Reply-To: <20260306140232.2193802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260306140232.2193802-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306140232.2193802-5-tabba@google.com>
Subject: [PATCH v1 04/13] KVM: arm64: Isolate mmap_read_lock inside new
 kvm_s2_fault_get_vma_info() helper
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060242_468996_A26D1B31 
X-CRM114-Status: GOOD (  14.91  )
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

Extract the VMA lookup and metadata snapshotting logic from
kvm_s2_fault_pin_pfn() into a tightly-scoped sub-helper.

This refactoring structurally fixes a TOCTOU (Time-Of-Check to
Time-Of-Use) vulnerability and Use-After-Free risk involving the vma
pointer. In the previous layout, the mmap_read_lock is taken, the vma is
looked up, and then the lock is dropped before the function continues to
map the PFN. While an explicit vma = NULL safeguard was present, the vma
variable was still lexically in scope for the remainder of the function.

By isolating the locked region into kvm_s2_fault_get_vma_info(), the vma
pointer becomes a local variable strictly confined to that sub-helper.
Because the pointer's scope literally ends when the sub-helper returns,
it is not possible for the subsequent page fault logic in
kvm_s2_fault_pin_pfn() to accidentally access the vanished VMA,
eliminating this bug class by design.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index d56c6422ca5f..344a477e1bff 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1740,7 +1740,7 @@ struct kvm_s2_fault {
 	vm_flags_t vm_flags;
 };
 
-static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
+static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
 {
 	struct vm_area_struct *vma;
 	struct kvm *kvm = fault->vcpu->kvm;
@@ -1774,9 +1774,6 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
 
 	fault->is_vma_cacheable = kvm_vma_is_cacheable(vma);
 
-	/* Don't use the VMA after the unlock -- it may have vanished */
-	vma = NULL;
-
 	/*
 	 * Read mmu_invalidate_seq so that KVM can detect if the results of
 	 * vma_lookup() or __kvm_faultin_pfn() become stale prior to
@@ -1788,6 +1785,17 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
 	fault->mmu_seq = kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
+	return 0;
+}
+
+static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
+{
+	int ret;
+
+	ret = kvm_s2_fault_get_vma_info(fault);
+	if (ret)
+		return ret;
+
 	fault->pfn = __kvm_faultin_pfn(fault->memslot, fault->gfn,
 				       fault->write_fault ? FOLL_WRITE : 0,
 				       &fault->writable, &fault->page);
-- 
2.53.0.473.g4a7958ca14-goog


