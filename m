Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDFCCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 10:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJuYw9YtOUTxOKcJe9GYPUdg6A5eauGTuxfSWUfKtck=; b=ympcij8NwupjFPwLaAcbf9i6v0
	qXb+wzkYmW+fiuBmm6Hya278m9UJWGfbGCvIuIwIivaboPR9/ZzkeShrgjnjKzBCuIPtCcN4YaKGu
	VKR3O9o3+DbwADk3aZB7N0EFtRqWYvv+iQ6MBVlBbZ0oQM1ttyFmi3p5a/tjlNEN7cn2hNkO6kcfw
	yfudqT3eKhBF0k/rNU+cZ+JTePtTgcRC3Wia/ewsDb4PXZ+xvFtCn32nxmoTLAxBqvEsrjf0JmUzN
	P9BYyLAemJ92cnKa4fsxL/JrWMPVZ2j92XTiJBi1AK/az3FykEVmQ7BSgxfRU0bUyaf8dUIysVYtd
	MmkRHWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2MQ-0000000GYyA-3RvF;
	Thu, 21 Aug 2025 10:17:34 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0Rj-0000000GClA-2WWK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:14:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b05d8d0so4076345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755764094; x=1756368894; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VJuYw9YtOUTxOKcJe9GYPUdg6A5eauGTuxfSWUfKtck=;
        b=cVA6P251gfMTf9vtOq8ss7T/39oKVnW8qREwRn8KwPwXxFcxw3VB++rxu407wA2t3o
         p2MTjXmT2ritI/45LETKNfRc0/pG3pBof0SUqOi/oL6gQ7ztHfp0g8D5pXKYsDOi7h4c
         eJ0Ru2huN6E627xQ6VQFAOrVg0AJNB9gbOPBLtGsObKsUWNc0s5aCysiSwi9tKrugJfv
         AVxqkjdAAtYSKWntsqKxGgo6QABT2nGsiBg4Vw978fQd3FcxyJVucq3u9Rn6Ayh3wWCz
         J/rg5ntKHprRHG09UhcY2T/xTanuq7tRmRrF1eRqJeMWmvspgnUaCH0dbXqagMNwMn5A
         32gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764094; x=1756368894;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VJuYw9YtOUTxOKcJe9GYPUdg6A5eauGTuxfSWUfKtck=;
        b=cEo72QZ6JcUz6Ge2LNgSJJ1qZ3BSDlC3JCPB+5NGhaHJaioJvkNoVaSo9WtRBgFUlV
         xDFvWFPsPqAa6N+D2tj774qANP6z1tCu+PDhUunc/ya7j14ObI3bfJzAbXxga0NAjKRl
         pFDVFuDWiIGD62DDLfMvVASuPOROcdGhJv05JjXOOzYqBVf3WMRuT3GfMj6yMU/MHlbZ
         yVBn2St7zUEUQ/Akp1FBWj7GwOeXd1i/Sn1njXnbUYajFFIZi3IrciDMtqA2zBMfS7N3
         oi3AvCR+R3xFsXLkwBdalXNkdi/bbM2slP9IQM/m4yiW5D427qnYm3D78tewxnKQKDFY
         y9iQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6UVaQm1PrbCWGFlgHthQWOW9CFUTfQsVR7Ob70Hd0VRdJANhaIl+8KlM8MKOFxoy91b7PWsHHkugN2PZM1wo5@lists.infradead.org
X-Gm-Message-State: AOJu0YxeTrQqLriEM4cJXFJpauCjxgPNlCAfW5Xghhk90rnLsecSuVaX
	b2UYwsnFF4o3M8ysjUT5kdo2/HTlKIrZrA0gk3Ducla77vAoGoeJPbk4dHIHyXcMulG34ug8l2i
	iX1swsKSwjWIjCZqIcIYOJQ==
X-Google-Smtp-Source: AGHT+IEinA++oc/gQDS+j3wuYMFfToMe5DnZzzdAdhRTYs5/w3tHItN2vCEdHVa+TZ6bcaADQEZqE25FZvUvHW2b
X-Received: from wrbcm4.prod.google.com ([2002:a5d:5f44:0:b0:3a5:648f:da85])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2404:b0:3c3:973a:fe3d with SMTP id ffacd0b85a97d-3c497838009mr1125897f8f.59.1755764093978;
 Thu, 21 Aug 2025 01:14:53 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:14:10 +0100
In-Reply-To: <20250821081412.1008261-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250821081412.1008261-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821081412.1008261-23-vdonnefort@google.com>
Subject: [PATCH v6 22/24] KVM: arm64: Add hyp_enter/hyp_exit events to pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_011455_641471_92B56DA0 
X-CRM114-Status: GOOD (  14.22  )
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

The hyp_enter and hyp_exit events are logged by the hypervisor any time
it is entered and exited.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
index d6e033c96c52..ce3953bc884a 100644
--- a/arch/arm64/include/asm/kvm_hypevents.h
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -7,4 +7,21 @@
 #include <nvhe/trace.h>
 #endif
 
+HYP_EVENT(hyp_enter,
+	HE_PROTO(void),
+	HE_STRUCT(
+	),
+	HE_ASSIGN(
+	),
+	HE_PRINTK()
+);
+
+HYP_EVENT(hyp_exit,
+	HE_PROTO(void),
+	HE_STRUCT(
+	),
+	HE_ASSIGN(
+	),
+	HE_PRINTK()
+);
 #endif
diff --git a/arch/arm64/kvm/hyp/include/nvhe/arm-smccc.h b/arch/arm64/kvm/hyp/include/nvhe/arm-smccc.h
new file mode 100644
index 000000000000..4b69d33e4f2d
--- /dev/null
+++ b/arch/arm64/kvm/hyp/include/nvhe/arm-smccc.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <asm/kvm_hypevents.h>
+
+#include <linux/arm-smccc.h>
+
+#undef arm_smccc_1_1_smc
+#define arm_smccc_1_1_smc(...)					\
+	do {							\
+		trace_hyp_exit();				\
+		__arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__);	\
+		trace_hyp_enter();				\
+	} while (0)
diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 3369dd0c4009..e00931fd194f 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -26,10 +26,10 @@
  * the duration and are therefore serialised.
  */
 
-#include <linux/arm-smccc.h>
 #include <linux/arm_ffa.h>
 #include <asm/kvm_pkvm.h>
 
+#include <nvhe/arm-smccc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/memory.h>
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index aebed41f7de7..f8361520967b 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -12,6 +12,7 @@
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_host.h>
 #include <asm/kvm_hyp.h>
+#include <asm/kvm_hypevents.h>
 #include <asm/kvm_mmu.h>
 
 #include <nvhe/ffa.h>
@@ -716,7 +717,9 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
 
 static void default_host_smc_handler(struct kvm_cpu_context *host_ctxt)
 {
+	trace_hyp_exit();
 	__kvm_hyp_host_forward_smc(host_ctxt);
+	trace_hyp_enter();
 }
 
 static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
@@ -740,6 +743,8 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
 {
 	u64 esr = read_sysreg_el2(SYS_ESR);
 
+	trace_hyp_enter();
+
 	switch (ESR_ELx_EC(esr)) {
 	case ESR_ELx_EC_HVC64:
 		handle_host_hcall(host_ctxt);
@@ -754,4 +759,6 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
 	default:
 		BUG();
 	}
+
+	trace_hyp_exit();
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index c3e196fb8b18..64d1d418df1d 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -6,11 +6,12 @@
 
 #include <asm/kvm_asm.h>
 #include <asm/kvm_hyp.h>
+#include <asm/kvm_hypevents.h>
 #include <asm/kvm_mmu.h>
-#include <linux/arm-smccc.h>
 #include <linux/kvm_host.h>
 #include <uapi/linux/psci.h>
 
+#include <nvhe/arm-smccc.h>
 #include <nvhe/memory.h>
 #include <nvhe/trap_handler.h>
 
@@ -205,6 +206,7 @@ asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on)
 	struct psci_boot_args *boot_args;
 	struct kvm_cpu_context *host_ctxt;
 
+	trace_hyp_enter();
 	host_ctxt = host_data_ptr(host_ctxt);
 
 	if (is_cpu_on)
@@ -221,6 +223,7 @@ asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on)
 	write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
 	write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
 
+	trace_hyp_exit();
 	__host_enter(host_ctxt);
 }
 
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index ccd575d5f6de..e51f431e8b23 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -7,7 +7,6 @@
 #include <hyp/switch.h>
 #include <hyp/sysreg-sr.h>
 
-#include <linux/arm-smccc.h>
 #include <linux/kvm_host.h>
 #include <linux/types.h>
 #include <linux/jump_label.h>
@@ -21,6 +20,7 @@
 #include <asm/kvm_asm.h>
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_hyp.h>
+#include <asm/kvm_hypevents.h>
 #include <asm/kvm_mmu.h>
 #include <asm/fpsimd.h>
 #include <asm/debug-monitors.h>
@@ -302,10 +302,13 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	__debug_switch_to_guest(vcpu);
 
 	do {
+		trace_hyp_exit();
+
 		/* Jump in the fire! */
 		exit_code = __guest_enter(vcpu);
 
 		/* And we're baaack! */
+		trace_hyp_enter();
 	} while (fixup_guest_exit(vcpu, &exit_code));
 
 	__sysreg_save_state_nvhe(guest_ctxt);
-- 
2.51.0.rc2.233.g662b1ed5c5-goog


