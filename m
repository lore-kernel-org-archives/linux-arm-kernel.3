Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5218DC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kr3XOqzgbSiP3lCApiAxZrrNJKAnhGQTg8lRWdy7DEg=; b=gpT29yEtoRdHNbHTyRMN0uGrtd
	mG/1xEGT3dO1LKcQ+RRKUBblOdEYc2DO9JiYw3PXAv+kE2B4H4Da4hJTtFR7cUxiEuRO5lpqwXWNN
	yJ8OdVcsGJ5aRwnMgVb14HJSg9Vz0/RLESPJjVXzg4If+IjefmQzhglTRovbZ8MUQsGxU8fFccMdc
	bDT3eHsp/B4ddL4uegp7S6v4AVo2cxrab0G4oZ2Gfcm3O4m9bb8Wvgq08zERsjX9JDl/9OHeze6mi
	e766rZq1TkVfq3VmPEbFgutW5eGWovAmQR5CZGOvBh1gxD0TJ0o/p+oA5dCFnElcK6GynTNrrLR6C
	XVP24Jag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLZ-0000000CjgS-0wR9;
	Fri, 31 Jul 2026 14:36:25 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLG-0000000CjUz-05X5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:36:07 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-47f4bff865cso835969f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785508564; x=1786113364; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kr3XOqzgbSiP3lCApiAxZrrNJKAnhGQTg8lRWdy7DEg=;
        b=Oj4ecF1so1d3AcBTaBY5HX5u6deR607JYN8liZ+w6ocmLsn1vhQEFtpA4+nhGdzm6g
         BBTRpmdt9P8jvmsfff5XdlKNJ1GEvG0cOx0jeQdEMMLbmjtxudgXg0gUmGbjwWykvTOt
         i1Ph1lNLulliFLBgmiBETn3Vn82YMv25vx2xHVMKfTjFMJLSWRxz54EXrK4CG8t78dnC
         TBfEtp0EOmMquQbSPK/zuJghUIKdTnrjHJVXlE0dJu/pfmkrNlQLL5oEyw2LPOXAWW12
         VHQCmhTb67654VTZDCNLh6RfILCDgqlRlZLvDCZuFnMv0JEdULLt7uOsQuZgIcHL0N8D
         WU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508564; x=1786113364;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kr3XOqzgbSiP3lCApiAxZrrNJKAnhGQTg8lRWdy7DEg=;
        b=g/X3I3r4Y1OUL1Nb9bFsWRgLYVWRbfCK44ggi8MqSGqDW/XFveRer6Mv4rhlPC3pO3
         fRIDKWkkFeq0lSNgkvGPauLEamV3cWohQpjZ1QHus6cTovFrcTH1eKZvOH9VcUjBUuLR
         fESHzOjf/4wLOKFb4ro+CYVidDVhsHi5VmhfKnm828PRj5sQkTwqsx2fof2QpPA0JWGF
         agPP3vH3ZFv9imqZwkiR8cDIuZQlJcFDpP7B6B8TuPDtQdKyZv13s5NUO8fqF1vA6i9c
         kGQ7G+HuV8Cwdt7rgfUS5+7XDHvLdYh1BXL5J6y5JtceHrNI0EiQ/PjvPTsIFQEzPn28
         3cew==
X-Forwarded-Encrypted: i=1; AHgh+RqCEYyfdmIWPRrkYxSq8iJikchnXJTfiqupVzrs1+FfiLZVCZOTi5ARyJO22TtcGrp1IS2AbZaVlyzYxLDfLXhz@lists.infradead.org
X-Gm-Message-State: AOJu0YxQBz2hA21EEHjga8KsVZJvTThAJ2M7iS7nqsFc/TcbTlWJdfct
	VfNO/QKCoT3IL0x8fToI5OMvGAOqT52w4CHXnKYL9dQnZdiGfegVrzdv4pfZND8bTYIik6eJdhH
	XFnHtF17r1SVD0SkdaVjHEw==
X-Received: from wrqz15.prod.google.com ([2002:a5d:440f:0:b0:47f:86af:60e6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f49:0:b0:47f:921f:3a35 with SMTP id ffacd0b85a97d-47fd2b2ca9cmr4817215f8f.37.1785508563682;
 Fri, 31 Jul 2026 07:36:03 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:35:32 +0100
In-Reply-To: <20260731143541.956291-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731143541.956291-9-vdonnefort@google.com>
Subject: [PATCH v4 08/17] KVM: arm64: Add reclaim interface for the pKVM heap alloc
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073606_079927_5092384C 
X-CRM114-Status: GOOD (  12.03  )
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

Introduce a host interface to reclaim donated memory from the pKVM heap
allocator back to the host.

It specifically provides two helpers that will make it easier to
create a shrinker for pKVM:

  pkvm_hyp_reclaimable()
  pkvm_hyp_relaim()

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index b77acfd7d1c8..0c3126179704 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -90,6 +90,8 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
 	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaim,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaimable,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_PKVM_ONLY),
 
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 439b91fc8aec..346365e76ef2 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -657,6 +657,42 @@ static void handle___pkvm_hyp_topup(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 3) = host_mc.nr_pages;
 }
 
+static void handle___pkvm_hyp_reclaim(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(enum pkvm_topup_id, id, host_ctxt, 1);
+	DECLARE_REG(unsigned long, target, host_ctxt, 2);
+	struct kvm_hyp_memcache host_mc = {};
+	int ret = 0;
+
+	switch (id) {
+	case PKVM_TOPUP_HYP_ALLOC:
+		hyp_alloc_reclaim(&host_mc, target);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	cpu_reg(host_ctxt, 1) = ret;
+	cpu_reg(host_ctxt, 2) = host_mc.head;
+	cpu_reg(host_ctxt, 3) = host_mc.nr_pages;
+}
+
+static void handle___pkvm_hyp_reclaimable(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(enum pkvm_topup_id, id, host_ctxt, 1);
+	unsigned long reclaimable = 0;
+
+	switch (id) {
+	case PKVM_TOPUP_HYP_ALLOC:
+		reclaimable = hyp_alloc_reclaimable();
+		break;
+	default:
+		reclaimable = 0;
+	}
+
+	cpu_reg(host_ctxt, 1) = reclaimable;
+}
+
 static void handle___tracing_load(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(unsigned long, desc_hva, host_ctxt, 1);
@@ -766,6 +802,8 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__vgic_v5_save_apr),
 	HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
 	HANDLE_FUNC(__pkvm_hyp_topup),
+	HANDLE_FUNC(__pkvm_hyp_reclaim),
+	HANDLE_FUNC(__pkvm_hyp_reclaimable),
 
 	HANDLE_FUNC(__pkvm_host_share_hyp),
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index d26e7435d34d..a82e773a1c2d 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -115,6 +115,29 @@ static int pkvm_hyp_topup(enum pkvm_topup_id id, unsigned long nr_pages)
 	return ret;
 }
 
+static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
+{
+	struct kvm_hyp_memcache mc;
+	struct arm_smccc_res res;
+	unsigned long reclaimed;
+
+	arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(__pkvm_hyp_reclaim), id, target, &res);
+	if (WARN_ON_ONCE(res.a0 != SMCCC_RET_SUCCESS) || WARN_ON_ONCE(res.a1))
+		return 0;
+
+	init_hyp_memcache(&mc);
+	mc.head = res.a2;
+	mc.nr_pages = reclaimed = res.a3;
+	free_hyp_memcache(&mc);
+
+	return reclaimed;
+}
+
+static __maybe_unused unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
+{
+	return kvm_call_hyp_nvhe(__pkvm_hyp_reclaimable, id);
+}
+
 static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 {
 	if (pkvm_hyp_vm_is_created(kvm)) {
-- 
2.55.0.508.g3f0d502094-goog


