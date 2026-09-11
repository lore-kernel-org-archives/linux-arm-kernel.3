Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE56DC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0X+3qrPo+6WcnhtclVN1fOGXrL3GYrEp8y5NxryMR7s=; b=cGfYf0hcym3LAnTaca7HlpyBu3
	K9bp65az8dQTpCfMY5dNEV3cM73a8Ca3Lfy/tivvAf9vj5dtS89fH9MU2O7MlKy4enP2mWfnk8Vw/
	ZTDnXltVfZPL81nl60oASPDgNf9dJyA2KHi4fQwrVGrsD49yaNkPkL5a7IZMQe5AbTJbMLRPh31pS
	x+4BcPd7fVjZ5gw0oYcgPLxyGs6O4y1uL1aeRpTH3aM/mHHn1EsM82/MDG47w6ldMYArU1IemHRzD
	eiUt7pG9Nop+onJt02l4+q86TYb+Jc9qM9w7spJMCT8JMT3VBtDfXIEOhhgEoJk5YvCtSNuQnp/l/
	x/31X2zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51et-0000000GntW-2wr5;
	Fri, 11 Sep 2026 13:51:15 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51ep-0000000Gno3-0bdf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:13 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49b0e6638e3so7168955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134669; x=1789739469; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0X+3qrPo+6WcnhtclVN1fOGXrL3GYrEp8y5NxryMR7s=;
        b=FoZIuQyqmAtN5+Wf80L35y4pXHIqABJCSsyMmTjDeIZjl9uHpMPBkTV4ZnLQzzAwlV
         Hyb3wrxLMhSVLINCgzgwE9E9hDAG6ekz6m0AdMIKzfjEPDhXMkTxIyGh2hRlkKb3fzUM
         HkEmzuj0ZPbSfdx4BhUCmCNCkrImeoRjF7rnnYZbskNxhytUu6/1TmjMW2MC7vH36uq/
         98J1Bbbc6H8T7QKg2OV3vx129iT8s3LFbmoNKAeaarwvz9N4cmM0GkoiL9SARpWezVOn
         nSGYv4+iAcBk6F7htICEyP8ondrw222vpBFJAa0tqw1493wfjHYpK934FEZnVNHXS5Qc
         S1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134669; x=1789739469;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0X+3qrPo+6WcnhtclVN1fOGXrL3GYrEp8y5NxryMR7s=;
        b=Xde1itV+jgUI1hkB1r7K++EM31HKkfDRL0xVwn14LW1V0aebnoM5pZaTBL9PchYGVt
         TjG5m4UXh/P6BZK7HHBmy7gaqpo7E0Wy/eABb4hm+BPsuPjhHSgrUReXxiZ/ijai3EUS
         F/EmH2T53wunNUdGeNc2igJbP8BSpBvG8e+gTZQCoN2+ioNbbyHy1dLHV8DpdmeiMfWb
         +t4quR6CEhjQWek2pQ97irgkfhyj1P3eufqXtUxdC99blrfS36vaoZ8EDLOOcgDfwa3E
         mJTq7VDdnpU0p7ETr7uNUJebuWZEhcBJBWex0NoDtyeExogs4SRcq7InZPoCgGuOc5Ws
         jyNw==
X-Forwarded-Encrypted: i=1; AKwUvByw9we+5L0myaBwbj4ZKLoFZHD1q0RYJo4GK0+KtxiOKE/D6dShm5/rSczRBS7jxBuHCnp0GSUWeoyyN/zDXUMh@lists.infradead.org
X-Gm-Message-State: AFuF++mj0SKT9sASSkdp9qqTX3sUBtvOZoZ9y2oP00lO8XH/QEPMNzZ4
	JH7ekgzKOlYxN7yJWOw3S8s8pKjtifuJG1nmJnL2SmGnvILnBAcSr70HW01Qvl1mk369VzHyuD1
	tnPsGt7LoBNjLv/RvmB1DOA==
X-Received: from wmoz19.prod.google.com ([2002:a05:600c:793:b0:49c:caed:426c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b96:b0:49d:1916:59c7 with SMTP id 5b1f17b1804b1-49e619831a9mr50374375e9.7.1789134668769;
 Fri, 11 Sep 2026 06:51:08 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:37 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-7-vdonnefort@google.com>
Subject: [PATCH v2 06/22] KVM: arm64: Add a range to __pkvm_host_share/unshare_hyp()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065111_266075_770B5104 
X-CRM114-Status: GOOD (  13.60  )
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

Nothing prevents the host/hyp sharing transition from working on a
range. In preparation for testing huge mappings with the pKVM ownership
selftest, add a range to these hypercalls to allow them to be tested
just like the others without any special case.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  4 +-
 arch/arm64/kvm/hyp/nvhe/ffa.c                 | 12 ++---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  4 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 50 +++++++++++--------
 4 files changed, 38 insertions(+), 32 deletions(-)

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
index 9fbe703fc595..bb23006e60c4 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -716,14 +716,14 @@ static void handle___pkvm_host_share_hyp(struct kvm_cpu_context *host_ctxt)
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
index 183ecd7058cf..fb01f6129217 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -969,12 +969,15 @@ int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
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
 
@@ -1061,12 +1064,15 @@ int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
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
 
@@ -1784,8 +1790,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
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
@@ -1797,15 +1803,15 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
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
@@ -1817,8 +1823,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
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
@@ -1832,15 +1838,15 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
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
@@ -1858,8 +1864,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
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
@@ -1884,8 +1890,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 
 	selftest_state.host = PKVM_PAGE_SHARED_BORROWED;
@@ -1898,8 +1904,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 
 	selftest_state.host = PKVM_NOPAGE;
@@ -1912,8 +1918,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
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
2.55.0.1007.g17ff1f9808-goog


