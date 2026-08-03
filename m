Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63356C5518E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1N7eTqyzhojnYLCzmndwfkpJEZ3Yu/26zZ6K0a/4F0g=; b=EKC+ZZFLRBV12Fx5mkz9JV+n+L
	wIiD7W0X33cDv1ZiS+2navrI8A/bdKs+lGpXS5JtvzGd4nTwhE2iyrO/4XzM//HNf0rz+LRfnznGq
	PTR3XG9VacsHBu7v0Ut0NnKLPqXNFCBoyBvXGnsqaHdhjHlamViFeR1bgwHg/yd/KmCGaHG98T5OC
	4dz6mip6aLHRNrOyEyTIYIKcfqpyHHRubKIi6lCW4Gcy/o+Z2Yb0kwCifRcFJkBN6Q85Toq9p+jIK
	T/04RyE+noatNBJKJ0bQFlDKy1dR/idNoOC/tUhwoLWtw/4g2/DnDoXUdFyHUB1GSJihvCt4WKivE
	NEjdv+oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdS-0000000GmvS-2k5I;
	Mon, 03 Aug 2026 10:11:06 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdQ-0000000Gmqh-09Xw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:11:05 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4954fe32d6eso8252915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751861; x=1786356661; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1N7eTqyzhojnYLCzmndwfkpJEZ3Yu/26zZ6K0a/4F0g=;
        b=gRcLrZnR/Rt9bcDEnhdR73UYYFgA637eMkeDIUwYgo+MLrLlfz9YJsczNjpVZ8D/jt
         t94o/6SyYF6SwbMpoylh3ySNfPAgCzbZaDRLmuziqLWo0CY0i0oL5p999o2EdHYVbDvs
         K2M0f6gHjpf6OtGW53ZcyU17RrUPzeRw7QDGdbAAiq2jV4oNF2k+EIE222X1ne9A1KFK
         ULaqNh3hpQW3HOAoo9M+mmDye5J3peDBgITK6terF3nxf7zbPi9Okr9b/pXgNkZWLic0
         SG6r7GykBixR5GGMp8S8RjSzBBkiC7S5H/9H18GOZAzlYADN08xhCQYYTNMX/x04fDLV
         BzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751861; x=1786356661;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1N7eTqyzhojnYLCzmndwfkpJEZ3Yu/26zZ6K0a/4F0g=;
        b=Sl8ktLP4fr1GIdNpwxEcV9/CI1ih3Kc9QEzq+oR7EheJT2jPdTp4NtybuffGyYKBym
         Yy9RXKzG+rUBNZsyHMAg5jVWUr3KPTZ+yrJoxGp5x3W1Y8LNWF+PTeRPgN2PNJr8aolN
         12OheZp8EHprJN877yPK+1OlflJ9HrJebYqeEdHLgTPdUGk5Z9irf+WGlDfNToRpUoKD
         ysWPPuFr0sMeB4uHAHL2vEwICFjYOIjKWcZJ9btUwH9UT514gVWXqswNifceJ0fEZnNb
         zxTlxKSSSQVpOgwPVftkPvPYT9YGhBXBwaRmrgkjB/4mgA/bgusLiuWQfDQrYWhXPF1q
         Eb3g==
X-Forwarded-Encrypted: i=1; AHgh+RqK+c/Yk1svaUcBFKHd6OWLOvOydrPk71aIpC0QbWSZWlBdV1MOA29Q4epNogAPvXCxjR4OypsWe8Fm5y5D4rmU@lists.infradead.org
X-Gm-Message-State: AOJu0YwaP8VS5YJSwoHUNnXzL3KGD7+bKU6uGdcak8KH5Jbb7FKAOqmY
	G0aKxJ8uVMDp/mbdI2PytdXVP0wOo9lBH5XPj9+IivS3BK4SAwWeRH87Wu+2mDAkt6C8Q4/DA7N
	3vlNTa/yVrabNh2mzpoB1dw==
X-Received: from wmdv2.prod.google.com ([2002:a05:600c:12c2:b0:493:c481:d8e9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35c1:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-499484a820emr16996425e9.9.1785751860958;
 Mon, 03 Aug 2026 03:11:00 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:08:50 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-7-vdonnefort@google.com>
Subject: [PATCH 06/20] KVM: arm64: Add a range to __pkvm_host_share/unshare_hyp()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031104_394164_BB8552A0 
X-CRM114-Status: GOOD (  11.28  )
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

Nothing prevents the host/hyp sharing transition to work on a range. In
preparation for testing huge-mapping with the pKVM ownership selftest,
add a range to these hypercalls to allow them to be tested just like the
others without any special case.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index e2a5d7ffec7d..1f70162fa625 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -31,10 +31,10 @@ enum pkvm_component_id {
 };
 
 int __pkvm_prot_finalize(void);
-int __pkvm_host_share_hyp(u64 pfn);
+int __pkvm_host_share_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
-int __pkvm_host_unshare_hyp(u64 pfn);
+int __pkvm_host_unshare_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index a327c2bbb6b6..a6e12f240c50 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -263,13 +263,13 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
 	if (ret)
 		goto out_unlock;
 
-	ret = __pkvm_host_share_hyp(hyp_phys_to_pfn(tx));
+	ret = __pkvm_host_share_hyp(hyp_phys_to_pfn(tx), 1);
 	if (ret) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto err_unmap;
 	}
 
-	ret = __pkvm_host_share_hyp(hyp_phys_to_pfn(rx));
+	ret = __pkvm_host_share_hyp(hyp_phys_to_pfn(rx), 1);
 	if (ret) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto err_unshare_tx;
@@ -301,9 +301,9 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
 err_unpin_tx:
 	hyp_unpin_shared_mem(tx_virt, tx_virt + 1);
 err_unshare_rx:
-	__pkvm_host_unshare_hyp(hyp_phys_to_pfn(rx));
+	__pkvm_host_unshare_hyp(hyp_phys_to_pfn(rx), 1);
 err_unshare_tx:
-	__pkvm_host_unshare_hyp(hyp_phys_to_pfn(tx));
+	__pkvm_host_unshare_hyp(hyp_phys_to_pfn(tx), 1);
 err_unmap:
 	ffa_unmap_hyp_buffers();
 	goto out_unlock;
@@ -327,11 +327,11 @@ static void do_ffa_rxtx_unmap(struct arm_smccc_1_2_regs *res,
 	}
 
 	hyp_unpin_shared_mem(host_buffers.tx, host_buffers.tx + 1);
-	WARN_ON(__pkvm_host_unshare_hyp(hyp_virt_to_pfn(host_buffers.tx)));
+	WARN_ON(__pkvm_host_unshare_hyp(hyp_virt_to_pfn(host_buffers.tx), 1));
 	host_buffers.tx = NULL;
 
 	hyp_unpin_shared_mem(host_buffers.rx, host_buffers.rx + 1);
-	WARN_ON(__pkvm_host_unshare_hyp(hyp_virt_to_pfn(host_buffers.rx)));
+	WARN_ON(__pkvm_host_unshare_hyp(hyp_virt_to_pfn(host_buffers.rx), 1));
 	host_buffers.rx = NULL;
 
 	ffa_unmap_hyp_buffers();
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index bed3ba8e48e5..c922288a77e6 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -522,14 +522,14 @@ static void handle___pkvm_host_share_hyp(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(u64, pfn, host_ctxt, 1);
 
-	cpu_reg(host_ctxt, 1) = __pkvm_host_share_hyp(pfn);
+	cpu_reg(host_ctxt, 1) = __pkvm_host_share_hyp(pfn, 1);
 }
 
 static void handle___pkvm_host_unshare_hyp(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(u64, pfn, host_ctxt, 1);
 
-	cpu_reg(host_ctxt, 1) = __pkvm_host_unshare_hyp(pfn);
+	cpu_reg(host_ctxt, 1) = __pkvm_host_unshare_hyp(pfn, 1);
 }
 
 static void handle___pkvm_create_private_mapping(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index b917537f12a7..3118941a11a7 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -962,12 +962,15 @@ int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
 	return ret;
 }
 
-int __pkvm_host_share_hyp(u64 pfn)
+int __pkvm_host_share_hyp(u64 pfn, u64 nr_pages)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-	u64 size = PAGE_SIZE;
+	u64 size = PAGE_SIZE * nr_pages;
 	int ret;
 
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
 	host_lock_component();
 	hyp_lock_component();
 
@@ -1054,12 +1057,15 @@ int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
 	return ret;
 }
 
-int __pkvm_host_unshare_hyp(u64 pfn)
+int __pkvm_host_unshare_hyp(u64 pfn, u64 nr_pages)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-	u64 size = PAGE_SIZE;
+	u64 size = PAGE_SIZE * nr_pages;
 	int ret;
 
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
 	host_lock_component();
 	hyp_lock_component();
 
@@ -1777,8 +1783,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	selftest_state.guest[0] = selftest_state.guest[1] = PKVM_NOPAGE;
 	assert_page_state();
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
@@ -1790,15 +1796,15 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	selftest_state.hyp = PKVM_NOPAGE;
 	assert_transition_res(0,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
 	selftest_state.hyp = PKVM_PAGE_SHARED_BORROWED;
-	assert_transition_res(0,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
+	assert_transition_res(0,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
@@ -1810,8 +1816,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
 	hyp_unpin_shared_mem(virt, virt + size);
 	WARN_ON(hyp_page_count(virt) != 1);
-	assert_transition_res(-EBUSY,	__pkvm_host_unshare_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
+	assert_transition_res(-EBUSY,	__pkvm_host_unshare_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
@@ -1825,15 +1831,15 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(0,	__pkvm_host_unshare_hyp, pfn, 1);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
 	assert_transition_res(0,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
@@ -1851,8 +1857,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
@@ -1877,8 +1883,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 
 	selftest_state.host = PKVM_PAGE_SHARED_BORROWED;
@@ -1891,8 +1897,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 
 	selftest_state.host = PKVM_NOPAGE;
@@ -1905,8 +1911,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
-- 
2.55.0.508.g3f0d502094-goog


