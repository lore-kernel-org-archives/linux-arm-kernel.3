Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ABEC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhPOxKl4TlxzRPfpK2hpc3GObTW6Ccux2swcxze2iEI=; b=ImP3EdIoLYJqxFIQQHc3TrMtvW
	aK+rjHMDvVF+z2EF62xBmShs3KRMKUV4BraVM0xf3bo3wpkDw4noYuYqXC3CxX0WQAHEaI2HrQuB/
	oB07yVYV9EXE7LShEOdbCh5GkfxNe/xTCXKmRAOUaofjnHsgIsLv5GIoxeVd3i42xZNn7T/u1EhFn
	zq99IgVjdx3iis0j8FLV6Ajq9G9qfX8K3Qzd5QeeNVxH6u1Sw188qw51aQY/w4vAaBct38ytq5NHA
	TKaHmZgCBw2eKZJnlG7uo1q7aD0rF3UAn0Qvc2zl+CvrzWCdzu04DdlTydZtx3RACJCD3SUc/ShlZ
	wZ211Vdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fN-0000000GoJE-3t5Z;
	Fri, 11 Sep 2026 13:51:45 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51ev-0000000Gnsy-2gRz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:20 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-484337a63bbso536419f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134675; x=1789739475; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GhPOxKl4TlxzRPfpK2hpc3GObTW6Ccux2swcxze2iEI=;
        b=KwxJXX3JakGUZcqs3xlpoR1qwsMsyR41PZedKZT8IVqR+kPwOkmjbbkpVF6Cf3uxFu
         Pxx9gl2GAb0w1nfZqUHuARNOaaf7zeiacX2tKLHrvR+TV50bCZaOdtMdz8x1wfIpe809
         SAM/81qfzkArk9MR3k1Ty97Lmo4YpnZAjp3VFVyqejyhffA6jvHalTG6sE2PKqZ8pCO6
         7rugSA51paTWbyw6Jx2MY6zB8oPMWPpfN9ha/ZR4qfMZKYAM4MfeCOpz3xvboOU6HHRJ
         xp36vs9NZM8/2id23Oo9jvXRCcNICXKuitjxcjaRyqjHrnVLRKtP+K7kbZEEbEMTIQBn
         1muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134675; x=1789739475;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GhPOxKl4TlxzRPfpK2hpc3GObTW6Ccux2swcxze2iEI=;
        b=USLtXlgZr80bEk/OnLR0WC/eMlDt/Z9nI2moj77OGV0PUC91qlddKBdTAw9lIfl9oV
         JDrZne1QTT9MbiNnG5EwtD3tfAuY6rK8KEjUnUV75+t7SvOby4acWwWA7OWSiRaYH7R9
         1LJbuTjnrTxm8RvvyzECiVJIkUWT/KRnP1tqfEuV/PR3Rt86jcsllLl+An3oziAzC2Y0
         PcS1kX/jQkGaqT5OdUGWVsBMY93x3xq23aMBpHuh1qd4eJNpcfiJCcCztBUDl7p4DhNf
         gzHcLCpo9qQs/arGTvhoF/he4yXM4eUznUO5feTOKGFIbtVGMbZwq2eyhfLjE2cURDj+
         WXKw==
X-Forwarded-Encrypted: i=1; AKwUvBw0bfHGzB8K2Buyn+XVxJ9KsRzKcXdvA+0gYvv1V5vQPP4i00bNh3QhE3xRsaPMFdXBcByirTlQ73qmV99xEFHE@lists.infradead.org
X-Gm-Message-State: AFuF++nhFm9Ld8V7vI9m3ILGqy21jua+G4Up7NtRmWrW5i/5jhaGtrOr
	0ajAIJZ6QkFuqprrdElFFHzo8wUB00SnJpE0vCi9motU3NjBQvcDUz/lcCC7xhQKBrjBFs7DfAn
	WmdP627z6Ob8OLUz6N5Yolw==
X-Received: from wmnp7.prod.google.com ([2002:a05:600c:2e87:b0:495:5ec9:83bb])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3515:b0:49d:16dc:e721 with SMTP id 5b1f17b1804b1-49e61a74140mr46318465e9.24.1789134674499;
 Fri, 11 Sep 2026 06:51:14 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:42 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-12-vdonnefort@google.com>
Subject: [PATCH v2 11/22] KVM: arm64: Add a range to __pkvm_guest_unshare_host()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065117_706991_33DF7878 
X-CRM114-Status: GOOD (  14.28  )
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

In preparation for supporting stage-2 huge mappings for protected VMs,
add a nr_pages argument to the __pkvm_guest_unshare_host() hypercall.
This range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is
512 on a 4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 22 +++++++++++--------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  2 +-
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index b00a14c5ed9d..33f2d1824614 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -33,7 +33,7 @@ enum pkvm_component_id {
 int __pkvm_prot_finalize(void);
 int __pkvm_host_share_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages);
-int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
+int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages);
 int __pkvm_host_unshare_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 619dde4f576b..7e6882ce51f6 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1049,31 +1049,35 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages)
 	return ret;
 }
 
-int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
+int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
-	u64 meta, phys, ipa = hyp_pfn_to_phys(gfn);
+	u64 size, meta, phys, ipa = hyp_pfn_to_phys(gfn);
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
 	if (pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte)) != PKVM_PAGE_SHARED_OWNED)
 		goto unlock;
-	if (__host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED))
+	if (__host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED))
 		goto unlock;
 
 	ret = 0;
 	meta = host_stage2_encode_gfn_meta(vm, gfn);
-	WARN_ON(host_stage2_set_owner_metadata_locked(phys, PAGE_SIZE,
+	WARN_ON(host_stage2_set_owner_metadata_locked(phys, size,
 						      PKVM_ID_GUEST, meta));
-	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
 				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
 				       &vcpu->vcpu.arch.pkvm_memcache, 0));
 unlock:
@@ -1938,8 +1942,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[0] = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn);
-	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn);
+	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
@@ -1956,7 +1960,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn, 1);
-	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn);
+	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn, 1);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[1] = PKVM_PAGE_OWNED;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 8f5c87ece728..2b0b0bc3064c 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1132,7 +1132,7 @@ static void pkvm_memunshare_call(u64 *ret, struct kvm_vcpu *vcpu)
 		return;
 
 	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
-	if (!__pkvm_guest_unshare_host(hyp_vcpu, hyp_phys_to_pfn(ipa)))
+	if (!__pkvm_guest_unshare_host(hyp_vcpu, hyp_phys_to_pfn(ipa), 1))
 		ret[0] = SMCCC_RET_SUCCESS;
 }
 
-- 
2.55.0.1007.g17ff1f9808-goog


