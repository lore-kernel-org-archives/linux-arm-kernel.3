Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4338CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YOHiNJrZBpE7+WMk67gEyR4d7/2QuIAsHv8fTvzpm8=; b=ZFO7BuDjLHmHfb4dOdStT1kcsi
	Pjg3iRDwduhomTV/g5ywVy88XN6rK8tdxIqKozRWA4vKKSSsAxuF1CMH+2upkNlQ8+2eVMZjJd8N2
	OznHj9S3gCvz1ci086E/G+y42IIdTAVNOySiYjb/MV8xhIOoRUV4gBaYxGCqACkrhUP5kHt3gFb/j
	joUGT1DQJvGIbCg0JB7fBlXq+BhoCk0bWw0WMkLNAWX0yOfvXoQpBiESpFfDbrgIS3teA4AXvZgiq
	oKGVJ7nWrxcNKNlbRZd5hTqXEnqlTKtQIbg6yxrxFHk68mbvxYtTfgr8QEiQMeb/0XBFrUOOSIWcl
	LbmR51eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFel-0000000Aw68-08q9;
	Mon, 16 Dec 2024 18:17:23 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFMc-0000000Ar4s-43c8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:58:40 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-aa6a6dcf9a3so142801166b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734371917; x=1734976717; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4YOHiNJrZBpE7+WMk67gEyR4d7/2QuIAsHv8fTvzpm8=;
        b=EKG8MntrwkUsiHXO6PRk+UwX2Q+e6FElB8Xw8B96JAAiHePNavsKFPE44xUNqEwm79
         oiAUjbsQcuxiNNZy2YPPblw7I/naJottvc9w2+9Aa1Ijc1cD55kQN0wqedXYCTH+PGj8
         pNBgGKeTuelkeJ+p+Cmv1WBV2lNOYPQF2OSAuu0aajx1cw0bw61/e3pbFJfSGUgKZAVh
         lysQ8Ok85BzTNRA9yKLlGBh/KgBJWeJyo/0rFT6yqAj5VIEzonaokwsPW/QCv0GYCFDm
         FqtLmRbPo4FXWe4S70SnUQTYI8sJITDTBdC/miNcx/ulR/U6FirqhL7xZqT2JR/PHG9t
         txFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371917; x=1734976717;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4YOHiNJrZBpE7+WMk67gEyR4d7/2QuIAsHv8fTvzpm8=;
        b=ZXJ6vOu4KPa28G3pe/b4AwNLH/FWtTOaHieiEuL8kBbjg1laHzvgNwiQBo2rsm3MFh
         IsUTLOP7MGkhRx+WuCZ+6mWiaZXOL0Z3W3qFT+RGFh1ZWp93OMpHI4qQHLMfBsIYqyUs
         fmksu0xZDy3hUD4UaAVFd2eM2MTKVnaNY3cPB8XiS8qKUZqimDdgZp2DnvZK7TMe14Dk
         d8p35dDWPRdhaku14g8e2/V27atozivKFpTrrVECtrkz/rcLMtdD2F/vfBFbIxrBG/9K
         IMPEl/gPPOpD1lb++J2kuYBtXKZt5I986Y5E4zz59/3CyljvVNAt0Ji425xXFYVBnugQ
         VMhA==
X-Forwarded-Encrypted: i=1; AJvYcCWVMZTOew0wFN4U2/PuyZRlBzv4I7n/b90OPLlTyEIe/cblw7kg79tgs1UEpzZMXBWmW120Rjk+h4C2R4e68xfI@lists.infradead.org
X-Gm-Message-State: AOJu0YxC/NbitC+MMo0RG/iuF9GbFdCLu62KcoM8zrzYNXkeTl7YVJHD
	hOKzjtCDWkng6nZdB7PV/ZRocwhmvSsbkS9R0o6F6Q8SBBzeqY6LyM7cHRseS4aFo+5N2L/EJIM
	gllmioQ==
X-Google-Smtp-Source: AGHT+IGwqENMAGZonee0eKfEqVGzhNKsT5jXcNwjSd/KRUBOe/TazOnE3jhEec1mHF2pcCq0KmtgL72Jbhuo
X-Received: from edyd3.prod.google.com ([2002:a05:6402:783:b0:5d1:f6fd:8acc])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:60d6:b0:aa6:730c:acd
 with SMTP id a640c23a62f3a-aab7792c704mr1428447066b.16.1734371917086; Mon, 16
 Dec 2024 09:58:37 -0800 (PST)
Date: Mon, 16 Dec 2024 17:58:00 +0000
In-Reply-To: <20241216175803.2716565-1-qperret@google.com>
Mime-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216175803.2716565-16-qperret@google.com>
Subject: [PATCH v3 15/18] KVM: arm64: Introduce __pkvm_host_mkyoung_guest()
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_095839_006541_092A3844 
X-CRM114-Status: GOOD (  12.64  )
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

Plumb the kvm_pgtable_stage2_mkyoung() callback into pKVM for
non-protected guests. It will be called later from the fault handling
path.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 19 ++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 20 +++++++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 4f97155d6323..a3b07db2776c 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -70,6 +70,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_mkyoung_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index b3aaad150b3e..65c34753d86c 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -44,6 +44,7 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
 int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
+int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 616e172a9c48..32c4627b5b5b 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -324,6 +324,24 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
 	cpu_reg(host_ctxt, 1) = ret;
 }
 
+static void handle___pkvm_host_mkyoung_guest(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u64, gfn, host_ctxt, 1);
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	int ret = -EINVAL;
+
+	if (!is_protected_kvm_enabled())
+		goto out;
+
+	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+	if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		goto out;
+
+	ret = __pkvm_host_mkyoung_guest(gfn, hyp_vcpu);
+out:
+	cpu_reg(host_ctxt, 1) =  ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -538,6 +556,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_relax_perms_guest),
 	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
 	HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
+	HANDLE_FUNC(__pkvm_host_mkyoung_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 0e42c3baaf4b..eae03509d371 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1549,3 +1549,23 @@ int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *
 
 	return ret;
 }
+
+int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
+{
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 phys;
+	int ret;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = __check_host_shared_guest(vm, &phys, ipa);
+	if (!ret)
+		kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
+
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.1.613.gc27f4b7a9f-goog


