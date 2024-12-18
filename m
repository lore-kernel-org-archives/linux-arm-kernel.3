Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981EDE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyQ2FY+PZ6PTObIJ7L2BgknDpmScKnttO8f3zJ1YOCk=; b=T1F4sAFcJEqiEZ6/g4glxoB32P
	zFPdwIcFrOHQxXVUYZQ5NHdkZgA926aESfwQEHd6h1UsksNVRBKONXWA8uywzsEguOUm1ZZc2m2SM
	6NtIOpuIn9KSqh/97QtgQ03sxBpmdYK2bxb2CjFnlRJO8yOKYEYMVQ4xREABXB9PBaZXuG4jH71JW
	9wOC5tVFR83a3mG0t1UE9f3WLGgf8//ainYLWYaGzN+qY8ILCAll2VVTSezGsar7H9TnzcWN53GAw
	M+IqmKm5o2whgRm5QVws7gbGENtKLtr4/B3QiPqgFRbJhE6iAU+gB6uNZvCTJxVIDbAi0qYlETtU+
	0cC+y5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO0C3-000000000OH-1xmX;
	Wed, 18 Dec 2024 19:58:51 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzvN-0000000HYR0-0FNr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:41:38 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5d43ec75bc4so4122036a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 11:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734550895; x=1735155695; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WyQ2FY+PZ6PTObIJ7L2BgknDpmScKnttO8f3zJ1YOCk=;
        b=bVQKtp5FG/YYGMp8L42YBig/99HyuVmo9pUgd5tlT+LF/g8oRS/bUAmWq810fuHNfE
         sjeBW0FYAsO+zrRMtwjCoSSjT/VqrpNchJtg4lN+QDqQ8gLUIOP+nqoMN8scGFNNXOUi
         3mhc+8HqPOzTI2yzsMBnePvTz8sJPv9E2vsMYjHUGtHtEtQVpzL/OFK1MqrDgQZwlgSe
         eSzdpgG1ETQjjEQ/EFnmJ7w0WO7jmG3ABwFmS8B8ASmhLnQn0dDC4kAx5EQeaM2rMDbx
         v11DZCN1/iDnzJnE5MLMqrGUNG1ozRnSMOn7Jss/LmL/wi5PzWQhMK3b0Pz+dE+XdDS9
         or1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734550895; x=1735155695;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WyQ2FY+PZ6PTObIJ7L2BgknDpmScKnttO8f3zJ1YOCk=;
        b=H50iYQH7Tq2w942tFuBGdqkkC2zBMg/Y1wCAbNko2NdXdwht1zxWQEs7/kfHyga7Nk
         U3sssfqsxQDSKhX4vk4zopydr3D86HluQO3V+9A/CG674Eh4pvvJBWmMsx2aqf/GTfb2
         DtMg+rqWRoy52mYoQ0aqTO8RpS1MTqKXRi2HKTVE5TqeVstYpREXSh+LCBE/HT2RhGus
         IYWTMFManCFr1Vb4b7tyYmiaYcD3GtoobxDBNifSK75VwB+jx/XPxkGx4HuKc+RMuurl
         HRE0izFqk9potujfUbNCOSppT81jt4hdOPurJG2THLEhhl2r51Jj6VwbGu/9pyN+Jnm3
         RfKg==
X-Forwarded-Encrypted: i=1; AJvYcCU/gyrpYeWNR6Z+ooXeN/FU6Yxc3P+sbuw5OniOqjoB72Hq921JUr0EdrsjlGYn1QdHiqFznVVyDCuqQrp4waoL@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv790TneFJDpnPsKWlkKvC09ph4nSHLzFwttAGWPBb3jYnbfmU
	7gjI96/XcRglU1WsLCvobdIAyt6QMz04U+OKYgyW4sKfP5ddeBt3l/Rm2YtAAUK3+tmzmONiaSI
	CJjSyJw==
X-Google-Smtp-Source: AGHT+IFwRaet79zZrR2QrxOid1hTv5/CbYmoBwkgLrd14LNjLEatI9Bw+MwfUFU8CYpCEQ+YTYRLzjjywJcU
X-Received: from edbev26.prod.google.com ([2002:a05:6402:541a:b0:5d1:26ae:9f05])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:40c9:b0:5d0:bcdd:ffa8
 with SMTP id 4fb4d7f45d1cf-5d7ee3772bdmr3504055a12.1.1734550895452; Wed, 18
 Dec 2024 11:41:35 -0800 (PST)
Date: Wed, 18 Dec 2024 19:40:56 +0000
In-Reply-To: <20241218194059.3670226-1-qperret@google.com>
Mime-Version: 1.0
References: <20241218194059.3670226-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241218194059.3670226-16-qperret@google.com>
Subject: [PATCH v4 15/18] KVM: arm64: Introduce __pkvm_host_mkyoung_guest()
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
X-CRM114-CacheID: sfid-20241218_114137_097704_074EFB88 
X-CRM114-Status: GOOD (  12.84  )
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

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
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
index 74bd6c72fff2..978f38c386ee 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -45,6 +45,7 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
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


