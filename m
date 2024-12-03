Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80FFE69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYizfs5ugNIRCne9WipVM8NnIjcJOlVcRn/zTXEmfg0=; b=VyugStBL13aeyo/3vnTlcLwF/4
	wWNyRXF3NBBtnnY02B7aTq5MWiztlFE7LpZzz2q+geF5O62YpuxpJwpjFPjqvNnSU/AJzNz7WMI5O
	yYXXSWuYH9YUa8/nLMNG+3i+jTB0XLWPklzZJTALeBoG0q/cPBujwj2r/xO3SFA8a0tXssWI29xyH
	UJrxdx/oQVf4snnLW4Wew8XUhDSSCZfC7kP/AA46fqL6wXMU/ddmjnt0plhlj3eQgsBEnJNz+PicY
	22pzaFNByw5Yvr/ZHLfXmaxkafgU4brCEkGX/8XSDiXa+shWgNUIidgBys0NbKCOdN80B3m/RMLla
	gFAzRwuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQYL-000000099X7-1J3c;
	Tue, 03 Dec 2024 10:54:49 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQIH-000000095km-3KQx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:38:14 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-aa52ec07bcbso334643066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222291; x=1733827091; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eYizfs5ugNIRCne9WipVM8NnIjcJOlVcRn/zTXEmfg0=;
        b=yx53bSrEsMEKg6LS/atoTvWoWpZx5kC8QUjQHcBGMKz2HU9y8YCygMpofuFmf+g9qj
         xIUfY3XsnXiq27yuyx95+H/4QqjeGcGXomeSjlS4ELJUhFqY0pk0OaF4+29YKTpINncr
         5NCszsPL8vhpV9dVI3aaX4f25EKHrYTP4DfgM0RkgEo5QjJ6dZw1EVGwLW0LvtuF/T5x
         uIF6fT4Dv3fLiXDyHOnut49DVQGeYFhbTjuEgN5c9luy0C27AuHS1EkJM6gHWpZ2cp2q
         NVzrPYTjJyQtyqrQkCeCOQh5KadcTeQTnnN2T1Iha4FIdzt7yOU93+fYQ5pk5W12bFZ0
         jvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222291; x=1733827091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYizfs5ugNIRCne9WipVM8NnIjcJOlVcRn/zTXEmfg0=;
        b=lj/nrpX8V8Z3TFo7u5pz840Oh18IdyNQkWjThTNwWmCtmCpPyU3RD/IJLHOWHyOvJb
         IkS60MgpA5g5if34QUgjU92hY3fYCTIciAm/olQo7/ORM2cZ4zUK/VJc0Zo2lQ4oxkMC
         1pAVLLXiYzBarV1tmIPcQRebAtZfYnW8JxwpV+sSuxIWyVzGkrH7PN+FYpG3At5wjJ6T
         9keAXMiMWwlrGdTKofiz3H0mKP0vww7sNPDtRK1hmHvjHAE/j8eOMQBKLIfiw++dKOU8
         uyAgphCtWuiSkP//C9zF2D0FLifOEiKw0raBeqcMrVwE2zREd0KJp5R63zjbqqLjjY4v
         wiBA==
X-Forwarded-Encrypted: i=1; AJvYcCWkf3MqLx3/S2Z4zLQjWQrgw/Q4Slj04GhO0704sm2NWE+K1Ej0iyJu+AL5CfJUTPoe3IDwg3N/zC5nFxdM3Gnu@lists.infradead.org
X-Gm-Message-State: AOJu0YzCPv6yvKRTti7N3Igi0Bye+4KGm/cAJRgHARXKCdL4cBocb0GK
	pwPdK8qcVcyqj8Fw0w82S1+26P3o5Cd5Lvn/InOtH+0jhLWTHRC3J6D1Qg1e4wzvYxutwE9ALc+
	zUybD4Q==
X-Google-Smtp-Source: AGHT+IHy5ejf0OiCrkEdWE2fH7ml0DEW+PK/xc+o7UbY9Xx9O7ZNOT6ubaPhP/xD9o/HpxIVzCb6WRgnDi57
X-Received: from edix21.prod.google.com ([2002:a50:d615:0:b0:5d0:a9a6:5abc])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7703:b0:aa5:1a75:dcd9
 with SMTP id a640c23a62f3a-aa5f7f1ad71mr161678366b.48.1733222291421; Tue, 03
 Dec 2024 02:38:11 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:33 +0000
In-Reply-To: <20241203103735.2267589-1-qperret@google.com>
Mime-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-17-qperret@google.com>
Subject: [PATCH v2 16/18] KVM: arm64: Introduce __pkvm_tlb_flush_vmid()
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
X-CRM114-CacheID: sfid-20241203_023813_829594_A2B0DD74 
X-CRM114-Status: GOOD (  11.92  )
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

Introduce a new hypercall to flush the TLBs of non-protected guests. The
host kernel will be responsible for issuing this hypercall after changing
stage-2 permissions using the __pkvm_host_relax_guest_perms() or
__pkvm_host_wrprotect_guest() paths. This is left under the host's
responsibility for performance reasons.

Note however that the TLB maintenance for all *unmap* operations still
remains entirely under the hypervisor's responsibility for security
reasons -- an unmapped page may be donated to another entity, so a stale
TLB entry could be used to leak private data.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h   |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 6178e12a0dbc..df6237d0459c 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -87,6 +87,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_teardown_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
+	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index de0012a75827..219d7fb850ec 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -398,6 +398,22 @@ static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
 	__kvm_tlb_flush_vmid(kern_hyp_va(mmu));
 }
 
+static void handle___pkvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
+	struct pkvm_hyp_vm *hyp_vm;
+
+	if (!is_protected_kvm_enabled())
+		return;
+
+	hyp_vm = get_pkvm_hyp_vm(handle);
+	if (!hyp_vm)
+		return;
+
+	__kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
+	put_pkvm_hyp_vm(hyp_vm);
+}
+
 static void handle___kvm_flush_cpu_context(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
@@ -582,6 +598,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_teardown_vm),
 	HANDLE_FUNC(__pkvm_vcpu_load),
 	HANDLE_FUNC(__pkvm_vcpu_put),
+	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
-- 
2.47.0.338.g60cca15819-goog


