Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E72CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dP/J1DbhtLVImQPHdjjhVild5BKkbbGQM9cLmZs/I0=; b=a0Mx5GBWVFOG5Imv3LUfiWn7Wk
	iA1usobW5QDezYqGGWP1of+gtuJx82ECg1F5g3hcc6h6h6z2FzAHh6VMR1wCscG2zIG/a8gn8qGcE
	S25XlMRbWY0KQLoJl3E6EiFp9QtIrOso+PG3tzeVc2OF95FgZqp4lUwZYOT0+GONNzh7FCg8YcR1E
	uabUHUwjaJSJmHuOGnOkka+cMqTJAjaYkiQJ5WfLE56E8Zyw0N+eG9GI342x45PLE7jxt8UPOI3R+
	VsyNjFM59NPTtdonLCdAgVaTEmzdHv0iagu++moewm6VYcWx+iJtgw6/52t/SCkVITY0TSiyzpjak
	LFl9nncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipj-00000004zIv-0QZm;
	Wed, 20 May 2026 15:27:43 +0000
Received: from mail-wr1-f73.google.com ([209.85.221.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipS-00000004z3T-3539
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:27:28 +0000
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-45e2f74da10so5561812f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290844; x=1779895644; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2dP/J1DbhtLVImQPHdjjhVild5BKkbbGQM9cLmZs/I0=;
        b=txrvZxp//BZB/B/B49DMu/EWoV3mypncbPOQTheL7A1vMAhYOMNhorzXXZiB8AQzlR
         pBoEZEx5ABLt8f8MZUy+5vPeL9BE7gIQawcHp9rvraRl9oq/6I4LakciK8PYj3jPHUio
         uBnH2Y/KfXTKxM7GnuH+nqNtHcBI+wwMH1teGq8oMf/ex43YYOjkjfcyY/xe0/qXmFFL
         nheUr9jCkcocleLdZ9ensPYLVKZDaArNPiFZRNe/RmS54Cj3JHDZXuMTfjOz78kzPyTm
         /Bfy1DTh1UxVRVVjlmSe6mhAcWSgJd+WUgb+CqvqMLacW6c7UbcNaTHucKAeJXBljoYC
         lFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290844; x=1779895644;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dP/J1DbhtLVImQPHdjjhVild5BKkbbGQM9cLmZs/I0=;
        b=bflIfUS5A15Omu5C15ciKQiqdfepqPvlOEPUuV8oEIuD0uqXSA0pGpP8qL3NvVdm5p
         RbAcxSQF08RElUWbdxXM51kvjRMeEYmogIDKYEXYttWKjjl/3pVFtU1QeQJEoZakkmgV
         4p/wLRMlxF95sKo0kVqIOE4zRqCZDKISH5EL24Mf6UxV7Zm9c4Edd/QVkprNqr80Imc5
         ydTpTjXfNKG+Ri+TedRFDkhbTLAvysHPYZ+4SBK+8i431ZoZ5QKbIg0K5wkcbfRI+0Uh
         tlkIIhbzSL54mT74aScm0kHp4vw2k6c5ogWuIVrp6oKqZhBq0bioFSuiMJ9rHwj36KDs
         +x/w==
X-Gm-Message-State: AOJu0Yx4TbeB0J1u/NwrK7E01QfRhRM7sQAuuHKfWOfAEZW8gWVD1MPS
	DVWES0dn2UG+Dfr1HHG7xdH2hSv68CRXjAWK97a3AoCX9SLYY6uq+ZUPUMjfpTpdkNqGTTzZObE
	xKWeOqW8OuSVXAII5AtGnBQ==
X-Received: from wmbdt12.prod.google.com ([2002:a05:600c:630c:b0:488:b96e:9939])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b26:b0:490:261d:7dfe with SMTP id 5b1f17b1804b1-490261d7e2bmr80484455e9.6.1779290843643;
 Wed, 20 May 2026 08:27:23 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:42 +0100
In-Reply-To: <20260520152650.4107895-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260520152650.4107895-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520152650.4107895-10-vdonnefort@google.com>
Subject: [PATCH 09/17] KVM: arm64: Add reclaim interface for the pKVM heap alloc
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082726_797204_0EBCAF38 
X-CRM114-Status: GOOD (  12.43  )
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

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 681b7bf8ac08..b427ef790b15 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -115,6 +115,8 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
 	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
 	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaim,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaimable,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_MAX)
 };
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index bf43235e62d3..ca3b5fc5f28f 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -21,6 +21,9 @@ enum pkvm_topup_id {
 	PKVM_TOPUP_HYP_ALLOC,
 };
 
+unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target);
+unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id);
+
 int pkvm_init_host_vm(struct kvm *kvm, unsigned long type);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 38ce834ca840..20be0343abd4 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -638,6 +638,42 @@ static void handle___pkvm_hyp_topup(struct kvm_cpu_context *host_ctxt)
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
@@ -769,6 +805,8 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_vcpu_put),
 	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
 	HANDLE_FUNC(__pkvm_hyp_topup),
+	HANDLE_FUNC(__pkvm_hyp_reclaim),
+	HANDLE_FUNC(__pkvm_hyp_reclaimable),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index f5288a350069..f29134a1cc73 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -111,6 +111,30 @@ static int pkvm_hyp_topup(enum pkvm_topup_id id, unsigned long nr_pages)
 	return res.a1;
 }
 
+unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
+{
+	struct kvm_hyp_memcache mc;
+	struct arm_smccc_res res;
+	unsigned long reclaimed;
+
+	arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(__pkvm_hyp_reclaim), id, target, &res);
+	WARN_ON(res.a0 != SMCCC_RET_SUCCESS);
+	if (WARN_ON_ONCE(res.a1))
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
+unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
+{
+	return kvm_call_hyp_nvhe(__pkvm_hyp_reclaimable, id);
+}
+
 static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
 {
 	int ret = -EINVAL;
-- 
2.54.0.631.ge1b05301d1-goog


