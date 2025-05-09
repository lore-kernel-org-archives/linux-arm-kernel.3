Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D381C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8hB+UpJ8nfoMqwD5zT3Vt9miZUxTA/LC+QPWcp3onM=; b=Sj6W2st5SKsIDbbFn/ncTVxSUh
	3wJpDd1Oqj0Q0pjHWPPa2dusnWoop5V0Rf9TXyzOWBlq1cVAv69SYb6SZ85kR0dHLs3Z20apPn0++
	RIHzo7/CB+XuGBuj767c+JeHi/SX8rDFPEzl1PkI6CPMsD10u2ysNHLxayk0to4U1UamUdC5RfYbb
	OMhlFC9SaaSGZ/srNrkysYU5WAPHZ3znS9W92nktiI0OSwhNhz5j+NHV+RvsJfYdpQiemKcBjfWlv
	EY9mROF+RoBi2H4PSqrKY8gHbFagLwg335Sf0EnzKYNJFah251IQSkF5kRx/jVXp920QZedpJtv+z
	t024PzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOlX-00000003xD9-1CM4;
	Fri, 09 May 2025 14:31:55 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNbK-00000003izI-1hTL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:17:19 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43cf446681cso10840905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796636; x=1747401436; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I8hB+UpJ8nfoMqwD5zT3Vt9miZUxTA/LC+QPWcp3onM=;
        b=fFa5r+n+uoFC5YtV2UKfZToqBPcaHmsKjBNWpvnvfAxiw8qkz8JURgUmNuv563Kh2D
         p/AD+CHI93ML8IlUPuGpHvjDKhQ0/XbSXKC+hVn09d/s3zdj+hdlGVxY7rcCQAMehn0q
         kAW8ASIUKw5UeAHf8bvWHJ3sts5upzaaB903QV+ojJ9/ufXEIQuLIW4F6YqBDV/q2Ebg
         g15nMfbQvoaIpcIHo7qnViV/WA1/4PcHYHEjQB8RA9AhzJ1IGYNZxbSK6wCxhw4XodQh
         HByUXHmtGwl151h8QZGV3OjUJdJ57onJbdxUTRjfD9OcqoHp2K2pSxAHjMbe/B3yFkjT
         mC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796636; x=1747401436;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8hB+UpJ8nfoMqwD5zT3Vt9miZUxTA/LC+QPWcp3onM=;
        b=saup0C+Xv0n7OeGVs2c6krOEQIDjnmptfSsnt9rNjXVaXFhFr8KVhlB/tNVHkAHrxo
         MPpSn05ZzCJFDs6ZRolQ/6Q78B5uTRaRcuiRfg1/jTtYi9HtetRg33v9kJYs7FNJgFUt
         PpUPpVP5Qe9GmDJIwi2XQ0aqx7mRUlSMUYFrgqTuiemvcekoc26Cvjox4zoTo+Haxjd7
         foxenP6V/4Fp8cwwatSWIvVuuV3KOYAx+tAv2ETj7KGDH+n9d5QP3gkSPnexZNpJxy9L
         FajVarlSfDEuaFWVUpg99e4PHF800WfeypmGMu0Ck+oWbUPCJoeUCPYnI3X3mufdxTmy
         Y9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCW5EgIpAHZs04IW6Yj5BVH1JGySvIAWQHlZorGBB1D/2YU1Z5gnvxlZbIc2rXeyw8/hInz8ZMnSxuVflvnOqrC1@lists.infradead.org
X-Gm-Message-State: AOJu0YzQXAs3FFhrSmK9PZQgXt7yoC7vx0tTXkC3X0zJe5M0TLwv+VAS
	j8qYDQUxKj6L/C+B/zHvjr7FiVGaMH0uRX8ZWUrKK5HdT/JkLV3qMrjMC33tlgjLdA5C1Hk7dXF
	PHpbLyYzM0SYtQePSPw==
X-Google-Smtp-Source: AGHT+IHOKs9SkIggmh+/Y69yt2MLN4XNNtZ/42ScndjHR2rRG+bpQ9yfgd9NcLSJLAKDffw/mGE6sPD2AOF2xiGj
X-Received: from wmsp16.prod.google.com ([2002:a05:600c:1d90:b0:440:595d:fbaf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c07:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-442d6d18abfmr30485465e9.5.1746796636780;
 Fri, 09 May 2025 06:17:16 -0700 (PDT)
Date: Fri,  9 May 2025 14:16:59 +0100
In-Reply-To: <20250509131706.2336138-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250509131706.2336138-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-4-vdonnefort@google.com>
Subject: [PATCH v4 03/10] KVM: arm64: Add a range to __pkvm_host_share_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061718_444794_8FB26C3C 
X-CRM114-Status: GOOD (  16.81  )
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

In preparation for supporting stage-2 huge mappings for np-guest. Add a
nr_pages argument to the __pkvm_host_share_guest hypercall. This range
supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is 512 on a
4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 26016eb9323f..47aa7b01114f 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -39,7 +39,7 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
-int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
+int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 59db9606e6e1..4d3d215955c3 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -245,7 +245,8 @@ static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(u64, pfn, host_ctxt, 1);
 	DECLARE_REG(u64, gfn, host_ctxt, 2);
-	DECLARE_REG(enum kvm_pgtable_prot, prot, host_ctxt, 3);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 3);
+	DECLARE_REG(enum kvm_pgtable_prot, prot, host_ctxt, 4);
 	struct pkvm_hyp_vcpu *hyp_vcpu;
 	int ret = -EINVAL;
 
@@ -260,7 +261,7 @@ static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
 	if (ret)
 		goto out;
 
-	ret = __pkvm_host_share_guest(pfn, gfn, hyp_vcpu, prot);
+	ret = __pkvm_host_share_guest(pfn, gfn, nr_pages, hyp_vcpu, prot);
 out:
 	cpu_reg(host_ctxt, 1) =  ret;
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 4d269210dae0..f0f7c6f83e57 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -696,10 +696,9 @@ static enum pkvm_page_state guest_get_page_state(kvm_pte_t pte, u64 addr)
 	return pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte));
 }
 
-static int __guest_check_page_state_range(struct pkvm_hyp_vcpu *vcpu, u64 addr,
+static int __guest_check_page_state_range(struct pkvm_hyp_vm *vm, u64 addr,
 					  u64 size, enum pkvm_page_state state)
 {
-	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 	struct check_walk_data d = {
 		.desired	= state,
 		.get_page_state	= guest_get_page_state,
@@ -908,48 +907,81 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
 	return ret;
 }
 
-int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
+static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *size)
+{
+	if (nr_pages == 1) {
+		*size = PAGE_SIZE;
+		return 0;
+	}
+
+	/* We solely support PMD_SIZE huge-pages */
+	if (nr_pages != (1 << (PMD_SHIFT - PAGE_SHIFT)))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(phys | ipa, PMD_SIZE))
+		return -EINVAL;
+
+	*size = PMD_SIZE;
+	return 0;
+}
+
+int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 	u64 phys = hyp_pfn_to_phys(pfn);
 	u64 ipa = hyp_pfn_to_phys(gfn);
 	struct hyp_page *page;
+	u64 size;
 	int ret;
 
 	if (prot & ~KVM_PGTABLE_PROT_RWX)
 		return -EINVAL;
 
-	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
+	ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
+	ret = check_range_allowed_memory(phys, phys + size);
 	if (ret)
 		return ret;
 
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __guest_check_page_state_range(vcpu, ipa, PAGE_SIZE, PKVM_NOPAGE);
+	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_NOPAGE);
 	if (ret)
 		goto unlock;
 
-	page = hyp_phys_to_page(phys);
-	switch (get_host_state(page)) {
-	case PKVM_PAGE_OWNED:
-		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_OWNED));
-		break;
-	case PKVM_PAGE_SHARED_OWNED:
-		if (page->host_share_guest_count)
-			break;
-		/* Only host to np-guest multi-sharing is tolerated */
-		fallthrough;
-	default:
-		ret = -EPERM;
-		goto unlock;
+	for_each_hyp_page(phys, size, page) {
+		switch (get_host_state(page)) {
+		case PKVM_PAGE_OWNED:
+			continue;
+		case PKVM_PAGE_SHARED_OWNED:
+			if (page->host_share_guest_count == U32_MAX) {
+				ret = -EBUSY;
+				goto unlock;
+			}
+
+			/* Only host to np-guest multi-sharing is tolerated */
+			if (page->host_share_guest_count)
+				continue;
+
+			fallthrough;
+		default:
+			ret = -EPERM;
+			goto unlock;
+		}
+	}
+
+	for_each_hyp_page(phys, size, page) {
+		set_host_state(page, PKVM_PAGE_SHARED_OWNED);
+		page->host_share_guest_count++;
 	}
 
-	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
 				       pkvm_mkstate(prot, PKVM_PAGE_SHARED_BORROWED),
 				       &vcpu->vcpu.arch.pkvm_memcache, 0));
-	page->host_share_guest_count++;
 
 unlock:
 	guest_unlock_component(vm);
@@ -1170,6 +1202,9 @@ static void assert_page_state(void)
 	struct pkvm_hyp_vcpu *vcpu = &selftest_vcpu;
 	u64 phys = hyp_virt_to_phys(virt);
 	u64 ipa[2] = { selftest_ipa(), selftest_ipa() + PAGE_SIZE };
+	struct pkvm_hyp_vm *vm;
+
+	vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 
 	host_lock_component();
 	WARN_ON(__host_check_page_state_range(phys, size, selftest_state.host));
@@ -1180,8 +1215,8 @@ static void assert_page_state(void)
 	hyp_unlock_component();
 
 	guest_lock_component(&selftest_vm);
-	WARN_ON(__guest_check_page_state_range(vcpu, ipa[0], size, selftest_state.guest[0]));
-	WARN_ON(__guest_check_page_state_range(vcpu, ipa[1], size, selftest_state.guest[1]));
+	WARN_ON(__guest_check_page_state_range(vm, ipa[0], size, selftest_state.guest[0]));
+	WARN_ON(__guest_check_page_state_range(vm, ipa[1], size, selftest_state.guest[1]));
 	guest_unlock_component(&selftest_vm);
 }
 
@@ -1219,7 +1254,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
@@ -1238,7 +1273,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
@@ -1250,7 +1285,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 
 	hyp_unpin_shared_mem(virt, virt + size);
@@ -1269,7 +1304,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
@@ -1280,8 +1315,8 @@ void pkvm_ownership_selftest(void *base)
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
 	selftest_state.guest[0] = PKVM_PAGE_SHARED_BORROWED;
-	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
@@ -1290,7 +1325,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.guest[1] = PKVM_PAGE_SHARED_BORROWED;
-	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn + 1, vcpu, prot);
+	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	WARN_ON(hyp_virt_to_page(virt)->host_share_guest_count != 2);
 
 	selftest_state.guest[0] = PKVM_NOPAGE;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 83a737484046..0285e2cd2e7f 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -347,7 +347,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, prot);
+	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, 1, prot);
 	if (ret) {
 		/* Is the gfn already mapped due to a racing vCPU? */
 		if (ret == -EPERM)
-- 
2.49.0.1015.ga840276032-goog


