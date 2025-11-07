Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F62CCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzSbvCoyRd3FGYJr55LhJEZSqZw8LMGRkH6K9VmYm6g=; b=pzfa5G1CE5okfQqu/ashM8Z/WU
	yPhEiOyyfadzdbszrC8H5T9Im9mQAEakXL0MDmFoREQQxjdD7uxQzEQzeVgk/LRKO8emZGIycIDOA
	a9IWEQ39bKCtnbKciBimU38Ry89+a/ghFErgq5CB5JaaETF0JbO2pRMliSQpycZ6GoGVJHYFyhs/t
	eFSJTZSu87OyTVPSzzYE3saUXVRX4+9LpUxzyIDhVHUyFxpjo8AIkxil95Z40FD/mtFhsHJ9FkxvM
	Be8keDVTxTAArenDlxwq6UHopdz0O+sYnIJlUGjrbFzYnUDS3+gIKd+qVeCdwAz96hxZmrNCKaE1u
	x5Ygvolw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIws-0000000Gzcz-0i1b;
	Fri, 07 Nov 2025 09:40:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIwD-0000000Gyo3-15O6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 09:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IzSbvCoyRd3FGYJr55LhJEZSqZw8LMGRkH6K9VmYm6g=; b=W6DIzQzqmKFaz1RJOJlOVIizW0
	hwUNpJwo0r7ucyWcnBD3QQ7/cexRTtey3QkOd7hITrcVNGnNh7YVWFixvOjjh5+51zNh/z/zzwedY
	sSN7izI30Y7CJmkUnUCe5Yrov7on5ffJP+2EDXsWWoUlf1x/bAsbxuc+M9ej+4WhSj2H9sgwzTIHN
	nEx7K58CSxblt1/O66M5yIshiIgHMUTIX13tWW8M8h2r7Q9RobI8LVgrnRr/nPUBnE2zkepmBkvqL
	M/SfiAHnZIGGMtsDq8xex0ShX0pJQLJ5lvrEmlcR0kfIsoj9kPw7nU2tov+pczwKl5aKqsF3VQJga
	jdmEBHsw==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI4R-000000064mj-0Fdx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:43:49 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-471001b980eso4102365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508353; x=1763113153; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IzSbvCoyRd3FGYJr55LhJEZSqZw8LMGRkH6K9VmYm6g=;
        b=i+yLHNqtV3VT2Wp1tHLaegmiiWHvAJOwRbNHXCjsIaO26IcVOX56UijBf5kFi0PleQ
         lp3v5Cj6a889ritdIf0k05By/3uuC8o80DJt0fHt1SRIDpa8Fph9wo/cjmjjtMLagHDR
         nEefe4vLhCdXNloFW8+8f3BWDJUw7W1sTzirHpMuYnCiykAjGiEk1ZVnuiNaLmCJk+41
         bBXrVfGu52IF7xK/FP/dgV04W2pAWUAiJVgNA3jusbTc7HuJbCvregs51BCIXXEZpAcY
         xmVUAk7YyJznaVV+uzlRYlmuLNo7+zDPcIVgf2svdlb7sUwqXs+kQbOtuRijAJ3wnJi3
         amPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508353; x=1763113153;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzSbvCoyRd3FGYJr55LhJEZSqZw8LMGRkH6K9VmYm6g=;
        b=XiLeLdrjw9PTrQd5qpxV1zs7TKq2/ns0xUiIGDe+m/w+Zm7/BGQ/vC6GRhh5iT8b10
         7lv0Mquuc5WzEe2uu2zMQn5RN/CiA7z4/TjNzQGwj/Hy8VNpMxPn5v8pcG8RlgZoj6Yh
         6KJuW8XyWQsMYdDtmYM/t9X63xHPy62VaYKgqXO5reh2TkPJlLwUm6m260M2vng59sXK
         WMOEAbW0p0MnzSWXHukVPLW2zJ1MSrptx/++pjiCK0PcpbTewFxWuktsWMqMVBXoy8m2
         Vfrnm62b6eqSo+tRENONU25tc2F9csg+UcDzQkb+Rw6KNUltahPtq8CCdwnlXdYijS88
         OnCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnq6N9hlAvLd6xJpBpFi1acsLX3oLsoeen/kIYHzMSx6ywpSEL6cM8dJQoJ0dESjzrxp8bA5dRa50PGKlc7r3/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8855qSiUcJNZzQTLMYVhc0R1ADUzby5urs/Bb6mgA8o2ddqV7
	hbOssD9o8s7MURPnGqHIBKM/dnjEzpHU9wk7Pao6TTnlP4FSjxvi+263WM7ybcJ5sDbES4BKLv/
	CmRtMWsHYyew6tsy5yiIUKQ==
X-Google-Smtp-Source: AGHT+IHRenEHXyYIy4IoMIcdau+Nnz1ftxc/Oi7hyGApizwWEX7Pr4oijAuPLmdKqmXUqtdQd094bxrM7rGZ4qDG
X-Received: from wmim9.prod.google.com ([2002:a7b:cb89:0:b0:46e:1f26:9212])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:2211:b0:46f:b42e:edce with SMTP id 5b1f17b1804b1-4776bd0e051mr12002045e9.39.1762508352970;
 Fri, 07 Nov 2025 01:39:12 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:38 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-27-vdonnefort@google.com>
Subject: [PATCH v8 26/28] KVM: arm64: Add hyp_enter/hyp_exit events to pKVM hyp
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
X-CRM114-CacheID: sfid-20251107_084347_601712_C94DC9A0 
X-CRM114-Status: GOOD (  13.66  )
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
index 4e16f9b96f63..aee829acd3dd 100644
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
index 5e4b519e5204..bb81906878c9 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -12,6 +12,7 @@
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_host.h>
 #include <asm/kvm_hyp.h>
+#include <asm/kvm_hypevents.h>
 #include <asm/kvm_mmu.h>
 
 #include <nvhe/ffa.h>
@@ -730,7 +731,9 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
 
 static void default_host_smc_handler(struct kvm_cpu_context *host_ctxt)
 {
+	trace_hyp_exit();
 	__kvm_hyp_host_forward_smc(host_ctxt);
+	trace_hyp_enter();
 }
 
 static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
@@ -754,6 +757,8 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
 {
 	u64 esr = read_sysreg_el2(SYS_ESR);
 
+	trace_hyp_enter();
+
 	switch (ESR_ELx_EC(esr)) {
 	case ESR_ELx_EC_HVC64:
 		handle_host_hcall(host_ctxt);
@@ -768,4 +773,6 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
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
2.51.2.1041.gc1ab5b90ca-goog


