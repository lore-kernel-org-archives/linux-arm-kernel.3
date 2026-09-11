Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E78C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FcQYlhVjdKJ/HjkPJaoU1lb6LXGKy2A6yCoD9ioS0s=; b=kc+l87dXZHbmG94wZq1/V26avB
	8z4uQf2r/EtMa0ZprZJRyYLfxW2qbi7K5+EtqxGukPku4GqWiOmuRfS+AsNW3/9TZ39+2vN/UURHg
	Mkh+niBpUJnvk2/0lFdiMKQIqq1y4xprZ0/cGJJDOGXHaSPtgvlWDJCPWfT6ZInHz+B6fq5vyRiu/
	9k0uwQWPIoo6UUURF23IWaZ8DhPfSN1jJ4QrTjluWbDzx2WXObDWYO+W+sJA0pVXdW9pnJgbRCv62
	2SH4RGc1wSzfjHQxyUPbeOMJ9jeO0TIALF5Gm8GQ/OZxQFf8HCmxT9oIsi7zRpnPs+GTW1bE7UU6+
	WMgJO5Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fN-0000000GoIF-1ioN;
	Fri, 11 Sep 2026 13:51:45 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51et-0000000GnrU-3Iv5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:17 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-49e64b80b94so4907165e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134674; x=1789739474; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FcQYlhVjdKJ/HjkPJaoU1lb6LXGKy2A6yCoD9ioS0s=;
        b=nc7uGbt/zybheY/SVT5O6vVfQZdCJzFWhzMDM8fLN32oGwgC+X0ePrK2GJ1L3HzwR1
         mlnIB+ocdlnUVYdiStCSyoVXYHlcYdi3cmA2QWipQPTAiJTx2GMxdQ0sMWyJMZFOA+SU
         +BpI7UJwFHDWWm5iE2IRg17U6mSbC2BOXiu9/gfgq1vD/o0Eb283iemFZ7NfJ37qeEnO
         qlhto2jj7mJX9KNZ+xZpSIn/z8cRh3vHiejacorMPJ4WnC4IVTzRe67V5AH3rosBhOrW
         sclGeaRlh4UcIDBQ1h79/z3+xeoQtrycnh1ZgR1T+kK1IxgKmIlviIeDDwhtT4VjVeH2
         L21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134674; x=1789739474;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9FcQYlhVjdKJ/HjkPJaoU1lb6LXGKy2A6yCoD9ioS0s=;
        b=tKxDcGzBgLuy2BMZcNzy2cYtqqBftaQrx5Fzyhsx1oJxxxNKutWHiYwzvXRX5JH9jd
         U0qSYoGJxQcR1g6og3FZBZ1HcN+nssilMrw4DTP1srIZZX8mm+SEjdtgcL6BTz5dSdmB
         7EgEJGXewY/KjfaPffTGKcAo7+gJFNDtSvZBXmmMxdpjq8z51jq9yR4vbkDmD48gmpdT
         1zM8fJuYzdAku+BtgMPFtLnKUooDdr2AcOV9sRM7LNTrQiipCsmbUyvY2odwdbiMWXoe
         iFmnESuOjv7lAzT0hODTPIj71p6tQNvOyyvvku8NK0prIhKIZZzs9RcWnDH1Cd/YO3Oj
         FEsA==
X-Forwarded-Encrypted: i=1; AKwUvBwf34ZkpuBAfyxtsVOA5PVQReFdaV0/6GgCuk6qUYuqzSMzlIMUPp6mpVU0hbTF8wInDtifC3WCAWB4pBySZ8zu@lists.infradead.org
X-Gm-Message-State: AFuF++kIoJDORoZcwVgAdPWFT2/32JWPZ9Od1J4+fVb9SVo5pvXaLW5/
	lReF8jST7iJT5ZKiP4d7P9RMYhbta1rvkoBKyogN+/pJIOptoyz6Jbs2USk+8P2iB5Ib3zK91Yf
	LyOMWgagNOlocTw1DCVRx8g==
X-Received: from wmhn12.prod.google.com ([2002:a05:600c:304c:b0:49d:a6b5:e823])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1385:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49e61878ab9mr76588395e9.3.1789134673450;
 Fri, 11 Sep 2026 06:51:13 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:41 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-11-vdonnefort@google.com>
Subject: [PATCH v2 10/22] KVM: arm64: Add a range to __pkvm_guest_share_host()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065115_874308_C04F598F 
X-CRM114-Status: GOOD (  14.19  )
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
add a nr_pages argument to the __pkvm_guest_share_host() hypercall. This
range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is 512
on a 4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 24 ++++++++++++-------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  2 +-
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 646d2335e5c1..b00a14c5ed9d 100644
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
index 25a86b318dfc..619dde4f576b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1011,31 +1011,37 @@ int __pkvm_host_share_hyp(u64 pfn, u64 nr_pages)
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
@@ -1918,8 +1924,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_PAGE_SHARED_BORROWED;
 	selftest_state.guest[0] = PKVM_PAGE_SHARED_OWNED;
-	assert_transition_res(0,	__pkvm_guest_share_host, vcpu, gfn);
-	assert_transition_res(-EPERM,	__pkvm_guest_share_host, vcpu, gfn);
+	assert_transition_res(0,	__pkvm_guest_share_host, vcpu, gfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_guest_share_host, vcpu, gfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
@@ -1949,7 +1955,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(0,	__pkvm_host_force_reclaim_page_guest, phys);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn);
+	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn, 1);
 	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn);
 
 	selftest_state.host = PKVM_NOPAGE;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 6590c4de7fd2..8f5c87ece728 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1104,7 +1104,7 @@ static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 		goto out_guest;
 
 	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
-	switch (__pkvm_guest_share_host(hyp_vcpu, hyp_phys_to_pfn(ipa))) {
+	switch (__pkvm_guest_share_host(hyp_vcpu, hyp_phys_to_pfn(ipa), 1)) {
 	case 0:
 		ret[0] = SMCCC_RET_SUCCESS;
 		goto out_guest;
-- 
2.55.0.1007.g17ff1f9808-goog


