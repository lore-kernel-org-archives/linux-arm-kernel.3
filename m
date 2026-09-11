Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638CEC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2Msz0mvqil4WqPj2cKyWRpEWk04Wm49RwlDEE43Qsg=; b=SqoZMLtz65xc2Tq7G1iCiWoRun
	I5WRgEZ17aMYpH7mjT8Zu6jsMLvbKizimFNgFS7eB7RtkFC/MAQx8MryT9h3S52Bu1y2gtPY7SVRa
	v3x+Ne1gkcEtKtkhhKyYmMPAjsE4c1MR7c5LfbV8rECzfs2at1ajfCUrSfAmtwOjIF+ggaINSipCq
	eRr80dKSWGAgmh24oaD7P2Tcb4D0stLdOcaaLCh8bmFPWUKw9J1i3BpyOz3fpO2nXvHGP8RVRHMSg
	XghfSfIHFG3hjHHFKe4nSoxDcBRIptM/450gaUEotSE/O3sSg7oFm7kHqhRWrhcfcqNRPSnmTDKqx
	LmjF46Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fM-0000000GoGF-0mbj;
	Fri, 11 Sep 2026 13:51:44 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51eq-0000000GnpO-3T9E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:14 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-482f41ca436so929317f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134670; x=1789739470; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2Msz0mvqil4WqPj2cKyWRpEWk04Wm49RwlDEE43Qsg=;
        b=sYsldW6ntVMgv9swcerFjeo08kq2aNhs4MbsajQO+Bdycl9euKf+c78WaFTGfAl1V/
         eh+nO37U0FUz3L3GMmeK+AWQeJ02K+GcDOXXbS3txUXxa1KrQ+TDByDPEcK2FmBCEFqV
         d+pI3GDaJ0AchOSRcCzgPei+yxPmYTGPHeB2sA7MlL3AM5QFz04D7qqC2M0+oNCEHBOQ
         6KX3J6YlKTLMoyEw07ayjR6s5qPBJm37MXladS4KM4LAjcbzoS+TY3LV1X1GWbh/jIwT
         JTGyy7tCw4Kq7lzB1kJ1MUrWr9HRrzLZy1jhRR6nMqhtHJO3KQeF7vMwHGpwYsB6S4Tk
         vn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134670; x=1789739470;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2Msz0mvqil4WqPj2cKyWRpEWk04Wm49RwlDEE43Qsg=;
        b=L1eSfgGIFl1c5Sc1BZpPrZ1vDclrwxAObF37uEP3kVp13ssyr3nVOsVUYVz2jWJ5RY
         5K03TgXPDKGkn7E6y5VnN2bZWi2tjwGRCTFZh2FCxubicQO1TOaOu/c7xHYMSOqB48tH
         i1Dq2XkuizbA0GR7Tv8KhWbtwXY3mcuObLkfvGr/tzvAYI/FyY5IQcvKmQxaKMqLZxht
         6R43gGzHGt0LMQy4VLpwQreAJPFR9u9EhW1FLvKw3hoqAnYhHFQJbzsBte+PKpEzUD65
         qxI3D7OtORhIwrTfO2yM+52ybYVudssrpB0SlbkfpyP31N/sB40yKKu0mST5JzMqgSw+
         mZMw==
X-Forwarded-Encrypted: i=1; AKwUvBydcGuVkwXkgmLB6t1HtE09m16WrHjsbJhqMmPqLzyVa6+Hy8g9oNN+5IizMxR9iMwKQjaxdACFVUxf38kzRrY9@lists.infradead.org
X-Gm-Message-State: AFuF++khu5xE6OR1s0yf2BsD4jZosw8moMvtxjY1w4ZcNga/2ljd2fQT
	OKV8gjXVIw0Roc3vpm/KXBhLTMRiz/662+0iq6jqbyd/Wv8Ih6/jrIhLrcf/GFbt8/ju3t3sYpi
	Rg6DSr4Zw12fjfObfzpIdAg==
X-Received: from wrdf15.prod.google.com ([2002:a5d:58ef:0:b0:482:dfac:89db])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:290f:b0:486:f36e:28c4 with SMTP id ffacd0b85a97d-486f36e2a84mr1587626f8f.5.1789134669911;
 Fri, 11 Sep 2026 06:51:09 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:38 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-8-vdonnefort@google.com>
Subject: [PATCH v2 07/22] KVM: arm64: Add a range to __pkvm_host_donate_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065112_925662_C9277306 
X-CRM114-Status: GOOD (  14.72  )
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
add a nr_pages argument to the __pkvm_host_donate_guest() hypercall.
This range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is
512 on a 4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  3 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 48 +++++++++++--------
 arch/arm64/kvm/pkvm.c                         |  2 +-
 4 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 1f70162fa625..c13f258fffb7 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -39,7 +39,7 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
-int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu);
+int __pkvm_host_donate_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu);
 int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu);
 int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys);
 int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index bb23006e60c4..84ff87d4e18d 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -415,6 +415,7 @@ static void handle___pkvm_host_donate_guest(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(u64, pfn, host_ctxt, 1);
 	DECLARE_REG(u64, gfn, host_ctxt, 2);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 3);
 	struct pkvm_hyp_vcpu *hyp_vcpu;
 	int ret = -EINVAL;
 
@@ -426,7 +427,7 @@ static void handle___pkvm_host_donate_guest(struct kvm_cpu_context *host_ctxt)
 	if (ret)
 		goto out;
 
-	ret = __pkvm_host_donate_guest(pfn, gfn, hyp_vcpu);
+	ret = __pkvm_host_donate_guest(pfn, gfn, nr_pages, hyp_vcpu);
 out:
 	cpu_reg(host_ctxt, 1) =  ret;
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index fb01f6129217..58ea0fa62226 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1429,22 +1429,30 @@ static int __guest_check_pgtable_memcache(struct pkvm_hyp_vcpu *vcpu)
 	return 0;
 }
 
-int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
+int __pkvm_host_donate_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 	u64 phys = hyp_pfn_to_phys(pfn);
 	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 size;
 	u64 meta;
 	int ret;
 
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
+	ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_OWNED);
+	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (ret)
 		goto unlock;
 
-	ret = __guest_check_page_state_range(vm, ipa, PAGE_SIZE, PKVM_NOPAGE);
+	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_NOPAGE);
 	if (ret)
 		goto unlock;
 
@@ -1453,9 +1461,9 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 		goto unlock;
 
 	meta = host_stage2_encode_gfn_meta(vm, gfn);
-	WARN_ON(host_stage2_set_owner_metadata_locked(phys, PAGE_SIZE,
+	WARN_ON(host_stage2_set_owner_metadata_locked(phys, size,
 						      PKVM_ID_GUEST, meta));
-	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
 				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
 				       &vcpu->vcpu.arch.pkvm_memcache, 0));
 
@@ -1797,7 +1805,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
@@ -1817,7 +1825,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
@@ -1830,7 +1838,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 
 	hyp_unpin_shared_mem(virt, virt + size);
 	assert_page_state();
@@ -1850,7 +1858,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
@@ -1867,7 +1875,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.guest[1] = PKVM_PAGE_SHARED_BORROWED;
@@ -1883,9 +1891,9 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[0] = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
+	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
@@ -1898,8 +1906,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	selftest_state.guest[0] = PKVM_PAGE_SHARED_OWNED;
 	assert_transition_res(0,	__pkvm_guest_share_host, vcpu, gfn);
 	assert_transition_res(-EPERM,	__pkvm_guest_share_host, vcpu, gfn);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
@@ -1912,8 +1920,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	selftest_state.guest[0] = PKVM_PAGE_OWNED;
 	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn);
 	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
@@ -1925,19 +1933,19 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.guest[0] = PKVM_POISON;
 	assert_transition_res(0,	__pkvm_host_force_reclaim_page_guest, phys);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn);
 	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[1] = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
+	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.guest[1] = PKVM_NOPAGE;
 	assert_transition_res(0,	__pkvm_host_reclaim_page_guest, gfn + 1, vm);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 
 	selftest_state.host = PKVM_NOPAGE;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index b88c1fcaadbd..99100204b093 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -462,7 +462,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 			return ret ? -EFAULT : -EAGAIN;
 		}
 
-		ret = kvm_call_hyp_nvhe(__pkvm_host_donate_guest, pfn, gfn);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_donate_guest, pfn, gfn, 1);
 	} else {
 		if (WARN_ON_ONCE(size != PAGE_SIZE && size != PMD_SIZE))
 			return -EINVAL;
-- 
2.55.0.1007.g17ff1f9808-goog


