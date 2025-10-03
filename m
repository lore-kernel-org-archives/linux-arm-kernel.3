Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47583CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQpWFI+mvDhlS6QzvPWKy0HH/MqUOwvvkoBBWzfvzIQ=; b=CBnSFsY59Bk2zfUf+x5wLI4dDY
	fLQUnSCjWUi1dRSUBocbJWyy9HCsidxNIE4a2UKZlXhr01fUNFKPSauxvR4mRK4KlPRr/0rqIxlFq
	jf10OZjjuIdXGcjNA5go5xfBpeKccFzfirTBO0hINGrIYZyqtaT/s6sXiu8RZKFmZweBzbKSsbCwR
	YHada7weMaUKbxFOlf7ktjiwYFvp9n7zXzljwtqMudZCkT1u+xQH/N4NmbEcErgjQdSFEQbw+L3WW
	9iByyxaH0yXh9QHpYeLTEG1Nn7Ho3O1FKblkoQTIuP1Djf66WCQO67sFtwAQB9hHhH3OK1n6ivzlN
	N0BNd9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0t-0000000CRQP-2IoK;
	Fri, 03 Oct 2025 13:39:59 +0000
Received: from mail-wr1-f73.google.com ([209.85.221.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0L-0000000CQWd-1PBn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:29 +0000
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-401dbafbcfaso1446502f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498761; x=1760103561; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zQpWFI+mvDhlS6QzvPWKy0HH/MqUOwvvkoBBWzfvzIQ=;
        b=JKfu2m8QwNemtx7diY7xI2J2oeWiNRfSEqPdAzg7S+xN3xxqvuvTmri5MglwrU2s4k
         AHUGZVxhqM/S/p+A90udKg7Fxc3o8Wh8MSuXv4YdxcPPLoj111CthIBwHjcsqfXEjIe8
         vh9bpBBx8yuHkbdLtyf5+7Vtvag2eSd4psCmsv2rfqLJu7ld6+qCyf1bVy3Ty2hg8ZjO
         NLfMPmWWGjQLq7kGGpLgui8SStSoxcs/4dAUew++dQ435I8gwztkVHssP7Mq09oUzg6l
         DBA69ndXA0NYsWatvuH+O3ilg0l4QR0YJKMH+2jQ0UmeuTbqsvF+DPW/srmPyi3aXXbu
         V64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498761; x=1760103561;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQpWFI+mvDhlS6QzvPWKy0HH/MqUOwvvkoBBWzfvzIQ=;
        b=M1XBTOUP49LVyIcYfLy7Pbt+zzx4mq1cPfaSNFDhnwHk+voTbwxNU6fVBZcxdX3/gW
         hC3/O15u4GXSf/UDAGdK+m4VFxYOF6riAH/zDaSO+Pf7rFZB0+xySMpv6XVZz9tOVpXl
         5Q1SvkirTMs5uzEaxUSmVkR9JPR/NxTgNWNqtzeei0GNKtjTLWEcUKbQ4cxm8fsaWpi1
         xVTFJ3BtqqSfvX+s60Z+lhSG3oHNYwqJOZICrbq+bjH1lTKojYPAY66eT296+1W5c4mB
         HpGsk+laL9t/sg8nCt7x7KbPiiCFqDsr3xoLV0v7UYGSTyiQBAF0915fI94RTzkcrUdp
         BBBw==
X-Forwarded-Encrypted: i=1; AJvYcCW5jD3VTniMoIS+vgEQRyxejL4eL4T6IfnNsu9Jii9lu+mRjKDtzQxQ98qBNL8ZTuZfoKNSftlFdibJDIy2WKCg@lists.infradead.org
X-Gm-Message-State: AOJu0YyY4/TPwm8qZiMciOl2URBuxE1slQlxFdJfX4lx5JeDcmW1DZwW
	lQrksCyVH1tmq1L8aykPFU541DBTAX0dF9SGuFq7S/t5kISZ+3EakucJdcEhValjMAxp1F9ntq3
	F9HUWO2C0yhypxVeQhshC0Q==
X-Google-Smtp-Source: AGHT+IG52bRYhXeAJFDgF8uvfHA2+/FCR+eKvs+CIPgd7e1dd8btx3CvmT6Gt+2L3xnnRQYWHWkcwf2OxLo8X/Rp
X-Received: from wmpj2.prod.google.com ([2002:a05:600c:4882:b0:46e:684e:1977])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5885:0:b0:3ee:13b1:d70e with SMTP id ffacd0b85a97d-425671aa0b6mr2309114f8f.40.1759498761198;
 Fri, 03 Oct 2025 06:39:21 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:23 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-27-vdonnefort@google.com>
Subject: [PATCH v7 26/28] KVM: arm64: Add hyp_enter/hyp_exit events to pKVM hyp
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
X-CRM114-CacheID: sfid-20251003_063925_454841_EED53D75 
X-CRM114-Status: GOOD (  14.01  )
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
index d3b9ec8a7c28..66ed30135815 100644
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
@@ -308,10 +308,13 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
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
2.51.0.618.g983fd99d29-goog


