Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978C0C55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQ2XbzOPil9qVoh17DDbsi8z090nZiLrDnaHmae0z4k=; b=U7XErXi0AuWgXrf6fULUh2CnV0
	CBVSR+0eX9/OvLq9AFpb7OjEzvz+ZY5Ecna2zT+S4vQU5QYhRoszwxcreggy5OvvnRzBCEg+3HcY3
	ERO5QTfnzBeYI5G38PkYzK3C3iscUqpY5Xk/k0MCUuRtyIg109602fWWTauoD2WnrMF6QWnwBB/Fx
	mZpVYWkXrLXLiWEwhX39ssjbC5lsbtnxIrUzvefdyk0Tps+le45bA/VmKIsjDGGbsefa+eE54gJq4
	0PaWtsZQ8f8waXLn1lNtS0nTfKgau49BYv/FbT1fLkSUncawIc+3zg2xGfzVNvBDr0wZZj1gEVE4Y
	FcEuUdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdV-0000000Gmzo-11UT;
	Mon, 03 Aug 2026 10:11:09 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdS-0000000GmuQ-3x7a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:11:08 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4955843c6cdso18397455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751865; x=1786356665; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQ2XbzOPil9qVoh17DDbsi8z090nZiLrDnaHmae0z4k=;
        b=uH0t6p05SjcRJcmp/Tq/tvuQDhedY0vIZTy3xQcrTlPYgqc0vlCZFInLNOEU3rRiGQ
         Ed+vB1TmAVzFK3oVAAL4++/V3dYdBFiMDiNdB0nRqni/sgzT8vQAzPXMMM+dGjiJNiag
         2beOxRISM6F1XhuI6JDjW8AGTx2eFP6O9FuTA0zh5Mn/TJGGvfGFsX/001UzAEJgnt+z
         xGYgziAAEbL6k80ADD/Rv4h8vY7Xs06ONoZy0NeN0nhbYdkK6JT7bwjDWQqQ/Yckpxhb
         kN0XdqSBGdVdTH5uLB+YBIPURWZBlZkpuNcT6873HnU5zmRP+mwaSHk+Lpkc6flmyPzG
         meAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751865; x=1786356665;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQ2XbzOPil9qVoh17DDbsi8z090nZiLrDnaHmae0z4k=;
        b=QsB3vJMF44ly/e9GborkUsg+fhlelbLf/54IBNC2p1hWmqK9EvZa+uoF9inu/6aGG9
         4B2d6rYpi/+UQkjcNslGLfjHz9hmQ9YoCVPhMTRaHqlIdDoxB11iWwgpN931op/NddGO
         Qaac3G4UvmlZyBXbbOQEVywLqQTtCJwQ6Nr7iYgd0439ycdsLvNkfdRoI374o3H1Ww7I
         9OwfDyS6fBF9HorWSr4NbhC4U5rCdzZgcND5dfiNe0JzGvCyT2wYqOGJYNBx9i4kCn89
         rgyUy4usyBrlYjWGhG3z8QiwzhwQh1LCvL5RLuA/sHoi5tdho/BQkmKEEA0FfMZKq1vp
         ax8g==
X-Forwarded-Encrypted: i=1; AHgh+RpS2VrEUnjvAMr9C8UMt9o2vUJjPsZRoajs8xzWcA9gZxy+noNKqVLE+InZzrWrJSHkTp8Vtonj7flDZVAnv+oy@lists.infradead.org
X-Gm-Message-State: AOJu0YwkteFsrTqXLdgGAurgDRB66tHuu47Amu9S/02MGqB5MT4e6UK8
	DVLQ2LDlsPCbBc01KXvWr4i7droDHhMhHESh83UhihDH/J6thmQ58Sa39+ZXNUdD2xzy6Gv3Rfb
	5Q5dWmlX8C1cJuSqzbR+DFA==
X-Received: from wmog15.prod.google.com ([2002:a05:600c:310f:b0:493:bd80:da9b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c6:b0:495:4a22:d684 with SMTP id 5b1f17b1804b1-4980c674700mr188242255e9.10.1785751864768;
 Mon, 03 Aug 2026 03:11:04 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:08:53 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-10-vdonnefort@google.com>
Subject: [PATCH 09/20] KVM: arm64: Add a range to __pkvm_guest_share_host()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031107_018960_914EBDC1 
X-CRM114-Status: GOOD (  11.33  )
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

In preparation for supporting stage-2 huge mappings for protected VMs, add a
nr_pages argument to the __pkvm_guest_share_host() hypercall. This
range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is 512
on a 4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 678bb55c694a..7fdfe3f22c5a 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -32,7 +32,7 @@ enum pkvm_component_id {
 
 int __pkvm_prot_finalize(void);
 int __pkvm_host_share_hyp(u64 pfn, u64 nr_pages);
-int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
+int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages);
 int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_host_unshare_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index ce637f1a55b3..53c48cea5f0e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1004,31 +1004,37 @@ int __pkvm_host_share_hyp(u64 pfn, u64 nr_pages)
 	return ret;
 }
 
-int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
+static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *size);
+
+int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
-	u64 phys, ipa = hyp_pfn_to_phys(gfn);
+	u64 size, phys, ipa = hyp_pfn_to_phys(gfn);
 	kvm_pte_t pte;
 	int ret;
 
+	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &phys);
+	ret = get_valid_guest_pte(vm, ipa, size, &pte, &phys);
 	if (ret)
 		goto unlock;
 
 	ret = -EPERM;
 	if (pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte)) != PKVM_PAGE_OWNED)
 		goto unlock;
-	if (__host_check_page_state_range(phys, PAGE_SIZE, PKVM_NOPAGE))
+	if (__host_check_page_state_range(phys, size, PKVM_NOPAGE))
 		goto unlock;
 
 	ret = 0;
-	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
 				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_SHARED_OWNED),
 				       &vcpu->vcpu.arch.pkvm_memcache, 0));
-	WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
+	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED));
 unlock:
 	guest_unlock_component(vm);
 	host_unlock_component();
@@ -1917,8 +1923,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_PAGE_SHARED_BORROWED;
 	selftest_state.guest[0] = PKVM_PAGE_SHARED_OWNED;
-	assert_transition_res(0,	__pkvm_guest_share_host, vcpu, gfn);
-	assert_transition_res(-EPERM,	__pkvm_guest_share_host, vcpu, gfn);
+	assert_transition_res(0,	__pkvm_guest_share_host, vcpu, gfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_guest_share_host, vcpu, gfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
@@ -1948,7 +1954,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(0,	__pkvm_host_force_reclaim_page_guest, phys);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn);
+	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn, 1);
 	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn);
 
 	selftest_state.host = PKVM_NOPAGE;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 8f5d32cdb4eb..f8e2618c78e3 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1091,7 +1091,7 @@ static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 		goto out_guest;
 
 	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
-	switch (__pkvm_guest_share_host(hyp_vcpu, hyp_phys_to_pfn(ipa))) {
+	switch (__pkvm_guest_share_host(hyp_vcpu, hyp_phys_to_pfn(ipa), 1)) {
 	case 0:
 		ret[0] = SMCCC_RET_SUCCESS;
 		goto out_guest;
-- 
2.55.0.508.g3f0d502094-goog


