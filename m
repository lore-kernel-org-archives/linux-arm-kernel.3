Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A7DC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jN40ZfNJMy0FjY6srncII1llPxzne/Kt/F9K6awJPaQ=; b=2cPBxpia48L6+pMCHUzG3iYmj3
	7hKrVkTDnHdg549MLyOIZA74VRdLjYxLhXXfDVj8gdt03m6Qt4F4aIywIZ7TiacsdEZn+SaD6tz/4
	EbOJZSFM8ue1xBjICU4Dxomm4uye0qx7sGHkCh+WM8Jj9tzRZ11XTFMCyV6x2TWK8Ln83iv0lL5yr
	xPcabuHBQq5erulsmimwcau0qyi80ZVkklIg3j96cISYKXE/uCTnGRzvl+LMJjOu9/8Hcih0cfGZe
	jZQ3NGAyrzjbu6yHIq7LD970H0Giay/ZVfgmJRp9P+qG8GmymU2kl1mySN5eGQeOY+Jv1g+zPRDaZ
	v6l0On9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrad-00000007UwL-0z1k;
	Mon, 20 Jul 2026 17:15:39 +0000
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlraV-00000007Umq-3P5T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:15:33 +0000
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-474170b59dfso6120733f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 10:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784567728; x=1785172528; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jN40ZfNJMy0FjY6srncII1llPxzne/Kt/F9K6awJPaQ=;
        b=ic3rhjwd7KZ27V7wJh3RtnK5Lxo0hVHptXv8I9VSquQOwjVMy1x7ssuD3al8aRYYC3
         spUSTXLLBz9bWOcYI11IrPFsyxRzvMKiiY+cOcXCSGpaEZl8Nm7uIyNvLU2omd+UFl4D
         KUOIo0vRVdsvRLo+CxP7WuJkZnJ31hoj3vXjaVcQ7BqMvr3+WNDSqG8FHqLIFpieWGub
         S+JGebZQRO1He7L/mrKR5qssJXRItYn4kUfiIjR3WRJAwfDWe/NRyU7YBbCda3ipIVOd
         GiFCtin6scDmF4oSDgTqVWRv203O54FDQ+wHmCDy1umntFrLGDqef8H1m4ps8FKcGTLU
         sDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567728; x=1785172528;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jN40ZfNJMy0FjY6srncII1llPxzne/Kt/F9K6awJPaQ=;
        b=OKSB2xYpctN2MJKucj/T2z/K1iWMoQSJ9BBMiH1rW9oVlFU4ibfr5vSbiYP8qQFxK7
         HeFQVhd/MY9rY7S76TCUPJaqIC70G4a2RdAqmOrAPp0YdC2jYQW4vDfuH2cg33YJkiQq
         M993Nu36a07oG5xmfcEjrKjhod9KlIrBz1fxne1DTyrqH80uGL/tRhUx2Fm0FW3zSQ4G
         cU/Hy+eQWQyI0vguUIzb6wOlyJZSaDelF+j5zPajUl4JJvZJVzUzZDNgSRym06Lo1o3+
         ei8rG9NOnetPcdPxMcWSYW4DXzEBn/M5CYdIrEsfqghLBdvvd1xjp7GxIE6VBeHZBQVm
         frzA==
X-Forwarded-Encrypted: i=1; AHgh+RpYgV+RiBEQmLWeVPzN4dCAoiWhbWBwzoeIjlXHHQNMensyADl7ZJ6VZPe+Z+qtdEqNg4YZZsME78kmOGc1hHom@lists.infradead.org
X-Gm-Message-State: AOJu0YzVBTd7k6T0zopPK69oy3FTGYcUCn3JcteVkGIqki291hYPeiKy
	jl4u2Bn3bO5D+YsV5cEXWy2/5oPX/zKWyLDRntzbpYCkJpRbxJmBvLqsD34TyIfFpMOTGGLcrF1
	RcU3MeYMEkSx6YzuZiXB87g==
X-Received: from wmhf19.prod.google.com ([2002:a7b:cc13:0:b0:493:bb29:af53])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3515:b0:493:be13:98b with SMTP id 5b1f17b1804b1-4954a50c47emr162780435e9.23.1784567728133;
 Mon, 20 Jul 2026 10:15:28 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:15:04 +0100
In-Reply-To: <20260720171513.1415357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720171513.1415357-9-vdonnefort@google.com>
Subject: [PATCH v3 08/17] KVM: arm64: Add reclaim interface for the pKVM heap alloc
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_101531_869306_7F934335 
X-CRM114-Status: GOOD (  12.08  )
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

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

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
2.55.0.229.g6434b31f56-goog


