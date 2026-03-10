Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA778FD2D71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mh5fFUja/4mDlRa8xj9RozoLiOFoKZimG1GpvA9+1Yc=; b=SV1ZapyxKG4Z1CytjAUuoAtrqd
	askrq8BZFPjcuejs0S/HR9/abMVGwAN9c78b3bwHutvYeXtYoucC/pSzuW/kwL2bSzQNg9Y/L456Q
	AbZKKJr3WYmvm2rAgtedM/1qpzqvL5tl6LgneSYN8vSZd13GD9hFcK+LSjMDk61D6Uq2qV2Uxil2d
	om3XuYwGzf6QRwPF6mI626kQ4lFSdzS0N7NGFhAT+iti145hJOVtUeAMRiGvl4zAH+FF+syqhRd77
	7It3FOSHxaGKNk9FH2MXqAD4FdYUCEg+d7NZdQh1exCB7Ho4VINp7pDp8sVnZCLOcOiI6lYeOVc6s
	i7qFqUWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwXR-00000009Wbw-1jhL;
	Tue, 10 Mar 2026 12:50:17 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwXB-00000009WDr-25IF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:50:02 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-485390246c8so25977835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773146999; x=1773751799; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mh5fFUja/4mDlRa8xj9RozoLiOFoKZimG1GpvA9+1Yc=;
        b=C0g/XYZNGGNpBHkt3wqDqlS6McL2WT5jw/Q4jo82OThbDPzxJzV7hWEMzYWsXS4idU
         dbuEjrSSbCxguym+FuqDncK++0YBkjkjzUPpI4p0XkcbOALrA5XWhweuMzg6APn/d+Vz
         v2KZBr/0MWj1LsRNwbj4HQ9IERxTxPDxCYvR0KZY1bnBMQgPgG7MLCiZs/aNxjXK01m+
         tnsv1GnBOA3uG4a1BwPUlX9VHEn08TN2QINdtEFzQf/phgwoEYl+g1jDDBu7bw1jKM6n
         +MbmYPpoQejoL3DTu5FWJ9P2yv2rLPq0Qpk5Vi68+CNTlsTahoMyGFT7vxbdPCy4YKYK
         znOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146999; x=1773751799;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mh5fFUja/4mDlRa8xj9RozoLiOFoKZimG1GpvA9+1Yc=;
        b=DVsOY4cL6eT3cKDV20S6UnLd4dNXqr8qOESGJ9HKmUl8ReLbSpdleVdvQNbRGPT1an
         Bmkv1WMxJxvWmAOOIxkPK1FlYmk+71h9wEGtGE8rUs+mplO4eCbFXal50WFbCcgRIWpm
         H+Ly284qaH2xA2YsYC+1Drobi9g6Pw+KR5/Tm2F5g63ISzn7eJxzD3s4xidtn4rVEm0N
         4hQpEfBo/wSlWRL8PRhF1gIJSU5ebk/ce9yhy92IqVASQLehZ7qStPjSz3WlHc+CUECh
         P8F6oAHCe6Bfsdn6eGGKVNLSm4oaF7e9+veSFvUMhk2XpCMArz+ASzW1jPkka4Cabhiw
         Wwww==
X-Forwarded-Encrypted: i=1; AJvYcCXWf4V1oZwQLXIlCxfrxu/oT6jQBI79Xnpo2V6EGGrAfEaIeLqXE4ihfF4MckPl87D1jRsSRV0cHlrSAsxO/AmW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/nHQ9mASD3HZeqCNWSKZ+kE48AJKCEsALdZHQ0wSmbXKEi7Za
	zTKzzKLOYbVjm5kBuJgFCE+yLxJ7gRDqUOfP4lY7e2n/eD0e4vKwbrAmHTSQvPO1z1y+HEe7myC
	5V6RnPQutUT99HizLesqQMWSMqUjHQg==
X-Received: from wmqy3.prod.google.com ([2002:a05:600c:3643:b0:482:ef72:5793])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4445:b0:483:a27e:6706 with SMTP id 5b1f17b1804b1-48526922533mr269324465e9.9.1773146999106;
 Tue, 10 Mar 2026 05:49:59 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:49:33 +0000
In-Reply-To: <20260310124933.830025-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310124933.830025-15-sebastianene@google.com>
Subject: [PATCH 14/14] KVM: arm64: Implement HVC interface for ITS emulation setup
From: Sebastian Ene <sebastianene@google.com>
To: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: catalin.marinas@arm.com, dbrazdil@google.com, joey.gouly@arm.com, 
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	perlarsen@google.com, qperret@google.com, rananta@google.com, 
	sebastianene@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_055001_569608_A81D6761 
X-CRM114-Status: GOOD (  17.94  )
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

Introduce a new HVC to allow the host to trigger the ITS emulation
setup.

This interface notifies the ITS driver that hypervisor initialization is
complete. Upon invocation, the hypervisor replaces the initial
"trap-and-forward" MMIO handler with a full-featured emulation handler.
This transition enables mediated access to the ITS hardware, enforcing
the verifications required for a protected hypervisor environment.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/include/asm/kvm_asm.h   |  1 +
 arch/arm64/include/asm/kvm_pkvm.h  |  3 ++-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 14 ++++++++++++++
 arch/arm64/kvm/pkvm.c              | 24 +++++++++++++++++++++++-
 4 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index a1ad12c72ebf..550dafee88ef 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -89,6 +89,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
 	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
+	__KVM_HOST_SMCCC_FUNC___pkvm_init_its_emulation,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index dc5ef2f9ac49..20fb2678a9b9 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -35,7 +35,8 @@ extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
 extern unsigned int kvm_nvhe_sym(num_protected_reg);
 extern void kvm_nvhe_sym(pkvm_handle_forward_req)(struct pkvm_protected_reg *region, u64 offset,
 						  bool write, u64 *reg, u8 reg_size);
-
+extern void kvm_nvhe_sym(pkvm_handle_gic_emulation)(struct pkvm_protected_reg *region, u64 offset,
+						    bool write, u64 *reg, u8 reg_size);
 int pkvm_init_host_vm(struct kvm *kvm);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index e7790097db93..4e58e24a1eed 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -14,6 +14,7 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
+#include <nvhe/its_emulate.h>
 #include <nvhe/ffa.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -421,6 +422,18 @@ static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
 	__kvm_tlb_flush_vmid(kern_hyp_va(mmu));
 }
 
+static void handle___pkvm_init_its_emulation(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(phys_addr_t, dev_addr, host_ctxt, 1);
+	DECLARE_REG(void *, its_state, host_ctxt, 2);
+	DECLARE_REG(struct its_shadow_tables *, shadow, host_ctxt, 3);
+
+	if (!is_protected_kvm_enabled())
+		return;
+
+	cpu_reg(host_ctxt, 1) = pkvm_init_gic_its_emulation(dev_addr, its_state, shadow);
+}
+
 static void handle___pkvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
@@ -630,6 +643,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_vcpu_load),
 	HANDLE_FUNC(__pkvm_vcpu_put),
 	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
+	HANDLE_FUNC(__pkvm_init_its_emulation),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index a766be6de735..5399998d5235 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -6,6 +6,7 @@
 
 #include <linux/init.h>
 #include <linux/interval_tree_generic.h>
+#include <linux/irqchip/arm-gic-v3.h>
 #include <linux/kmemleak.h>
 #include <linux/kvm_host.h>
 #include <asm/kvm_mmu.h>
@@ -62,7 +63,7 @@ static int __init register_protected_regions(void)
 
 		pkvm_protected_regs[i].start_pfn = res.start >> PAGE_SHIFT;
 		pkvm_protected_regs[i].num_pages = resource_size(&res) >> PAGE_SHIFT;
-		pkvm_protected_regs[i].cb = lm_alias(&kvm_nvhe_sym(pkvm_handle_forward_req));
+		pkvm_protected_regs[i].cb = lm_alias(&kvm_nvhe_sym(pkvm_handle_gic_emulation));
 		i++;
 	}
 
@@ -286,16 +287,37 @@ static void __init _kvm_host_prot_finalize(void *arg)
 		WRITE_ONCE(*err, -EINVAL);
 }
 
+static int pkvm_init_its_emulation(phys_addr_t dev_addr, struct its_shadow_tables *shadow)
+{
+	void *its_state;
+	int ret;
+
+	its_state = (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
+	if (!its_state)
+		return -ENOMEM;
+
+	ret = kvm_call_hyp_nvhe(__pkvm_init_its_emulation, dev_addr, its_state, shadow);
+	if (ret)
+		free_page((unsigned long)its_state);
+
+	return ret;
+}
+
 static int __init pkvm_drop_host_privileges(void)
 {
 	int ret = 0;
+	void *flags;
 
 	/*
 	 * Flip the static key upfront as that may no longer be possible
 	 * once the host stage 2 is installed.
 	 */
 	static_branch_enable(&kvm_protected_mode_initialized);
+
+	flags = its_start_depriviledge();
 	on_each_cpu(_kvm_host_prot_finalize, &ret, 1);
+	its_end_depriviledge(ret, flags, &pkvm_init_its_emulation);
+
 	return ret;
 }
 
-- 
2.53.0.473.g4a7958ca14-goog


