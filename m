Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B46C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzBN8oLenEhtYK3k0GqK0Qcx+e9V+BXk82b1WTsle7I=; b=BvaDdIQSgF1Ot9YPa7dD2ox6Sf
	Zfyws2VNRA7H3hZ9k9v51fmkLgZeWf5D3AWV6D13N6EGsnBrEL83uNEqA/9LmqIuRYdxhNuPqTMW7
	Ua0gzBCRXjKlx3kXQ1z64sLpZy/KcerkN26vCKn73NUmx5WiRB5g0Hop1L7gIzNXfAjcUzlbjGg/p
	72pUSXuLJWaPjg2REh7hMjELzw9Tre7JFIiGv24U4DvHzZJniAZy/lYacj6FI/oZh7QsCspOMIbaT
	5zHeSlyX+asvfJomrx7p7SZR4ETsh/opGv7/Y1PP3s+/Jzhml+h3NSbAHyJmuHIbkzXhIG61G3VlC
	/JN4mM8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpde-0000000GnIJ-47c5;
	Mon, 03 Aug 2026 10:11:19 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdb-0000000Gn6m-1GEI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:11:17 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4955b84e25eso13268425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751873; x=1786356673; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzBN8oLenEhtYK3k0GqK0Qcx+e9V+BXk82b1WTsle7I=;
        b=Et0JTArqegeOBVqC/a0UTdFXADeQxi4ARdE+wTBOrimgPMPTUgc+Hjg3TNAPMcg2No
         zxY4h9wBmkGRv5/QMnPJEvWqHqz1gr6U3GNzaLHKDQWAuJNgX2I7FeOTb33FFkMlKfWL
         UPMv/CAGDTSyyQji1+oWP7e5HkjyTajTUCuWKNNTUcoek7KFiUu6QHx78WOQ02lpbOEw
         QKTuFpW5z0PBmf2JpXdv4DmacL0stMB70jrXmTttA6LworDKBXRgnw+Zb6fM7whSp505
         KWIbKs4SZb1jOx5wvsc/xSd0vs67cdsbMXKbTGQTBiM4xfX7mmYwwAkbfAwKUfhXGeZL
         Cm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751873; x=1786356673;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzBN8oLenEhtYK3k0GqK0Qcx+e9V+BXk82b1WTsle7I=;
        b=isbJdc0ItohO6ZyHl23Yl78wx61k8KIWKWRMYMdy4b0ToooxBYTp0hs8pGpLjHBrU8
         4ioLFTfGbLy/ao22HzJ5QnTEsEIijhOf54X+i5D0hVT7gofxIYGXFLdoklYyJ9zXjKfc
         pj9C0E1fjtCuWhtMTJewsRrtdfsPphTqsiHW4M0UJ+2aW/XD/wDquJDeP/hRxtWFSBOv
         L4K1rT/92OE+IXYgMBIl61XxWJJZZTwKRVbeUGvN+3VXMjUubCJpgsQunvk5W9IBD42x
         VBmUfJh9tgD1GTCpVFQsyOEepH50/KaQAU5UCX0UyjSgct+fwYzPdVHoFk0wJqdBYvjf
         v0Uw==
X-Forwarded-Encrypted: i=1; AHgh+RqRBurIb8C3fmb3nY9n3yjofLGJXLxYQbTwvfrWmvLiSJDe2uTwQaqSIRPEPk4kE6sMq7uqQr+XO7K6UhEgxGtp@lists.infradead.org
X-Gm-Message-State: AOJu0YxRtfijBOez1ZO534gQI+BlMa9HLZ1HIfpMSDpqsdOnkN/bzomC
	oDpT9kM0PhTPPpsWEjXDh1EsEDWveQfH3f521xCzM7rPpZvw/IYseUmpK2tbPXRdjXFtYpUKDV7
	0/HA6jUCMEzoNJkPtGl64Cg==
X-Received: from wmpe20.prod.google.com ([2002:a05:600c:4b94:b0:495:5762:2123])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:e557:10b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4980c64b824mr137177625e9.7.1785751872686;
 Mon, 03 Aug 2026 03:11:12 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:08:59 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-16-vdonnefort@google.com>
Subject: [PATCH 15/20] KVM: arm64: Add pkvm_hyp_req infrastructure
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031115_384177_6314B73A 
X-CRM114-Status: GOOD (  17.19  )
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

The pKVM hypervisor depends on the host for a lot of operations like
memory allocation. Introduce a struct pkvm_hyp_req to enable the pKVM
hypervisor to request resources from the host.

Additionally, introduce a trace event to track the handling of these
requests.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 37c5e22fac98..00ba99c85874 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -17,10 +17,11 @@
 #define ARM_EXCEPTION_IS_TRAP(x)  (ARM_EXCEPTION_CODE((x)) == ARM_EXCEPTION_TRAP)
 #define ARM_SERROR_PENDING(x)	  !!((x) & (1U << ARM_EXIT_WITH_SERROR_BIT))
 
-#define ARM_EXCEPTION_IRQ	  0
-#define ARM_EXCEPTION_EL1_SERROR  1
-#define ARM_EXCEPTION_TRAP	  2
-#define ARM_EXCEPTION_IL	  3
+#define ARM_EXCEPTION_IRQ		0
+#define ARM_EXCEPTION_EL1_SERROR	1
+#define ARM_EXCEPTION_TRAP		2
+#define ARM_EXCEPTION_IL		3
+#define ARM_EXCEPTION_PKVM_HYP_REQ	4
 /* The hyp-stub will return this for any kvm_call_hyp() call */
 #define ARM_EXCEPTION_HYP_GONE	  HVC_STUB_ERR
 
@@ -28,6 +29,7 @@
 	{ARM_EXCEPTION_IRQ,		"IRQ"		},	\
 	{ARM_EXCEPTION_EL1_SERROR, 	"SERROR"	},	\
 	{ARM_EXCEPTION_TRAP, 		"TRAP"		},	\
+	{ARM_EXCEPTION_PKVM_HYP_REQ,	"PKVM_HYP_REQ"	},	\
 	{ARM_EXCEPTION_HYP_GONE,	"HYP_GONE"	}
 
 /*
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index bae2c4f92ef5..d01e6954d363 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -85,6 +85,15 @@ u32 __attribute_const__ kvm_target_cpu(void);
 void kvm_reset_vcpu(struct kvm_vcpu *vcpu);
 void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu);
 
+enum pkvm_hyp_req_type {
+	PKVM_HYP_NO_REQ = 0,
+	__PKVM_HYP_REQ_TYPE_MAX,
+};
+
+struct pkvm_hyp_req {
+	u8 type;
+};
+
 struct kvm_hyp_memcache {
 	phys_addr_t head;
 	unsigned long nr_pages;
@@ -925,6 +934,9 @@ struct kvm_vcpu_arch {
 	/* Pages to top-up the pKVM/EL2 guest pool */
 	struct kvm_hyp_memcache pkvm_memcache;
 
+	/* To be read on ARM_EXCEPTION_PKVM_HYP_REQ */
+	struct pkvm_hyp_req pkvm_hyp_req;
+
 	/* Virtual SError ESR to restore when HCR_EL2.VSE is set */
 	u64 vsesr_el2;
 
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index c53869cb6be1..41813bb93b2e 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -22,6 +22,7 @@ int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
 void pkvm_destroy_hyp_vm(struct kvm *kvm);
 int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu);
+int __pkvm_handle_vcpu_req(struct kvm_vcpu *vcpu);
 
 #ifdef CONFIG_NVHE_EL2_DEBUG
 void pkvm_ownership_selftest(void);
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 54aedf93c78b..d7f7bbe5db5c 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -18,6 +18,7 @@
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nested.h>
+#include <asm/kvm_pkvm.h>
 #include <asm/debug-monitors.h>
 #include <asm/stacktrace/nvhe.h>
 #include <asm/traps.h>
@@ -464,6 +465,8 @@ int handle_exit(struct kvm_vcpu *vcpu, int exception_index)
 		return 1;
 	case ARM_EXCEPTION_TRAP:
 		return handle_trap_exceptions(vcpu);
+	case ARM_EXCEPTION_PKVM_HYP_REQ:
+		return __pkvm_handle_vcpu_req(vcpu);
 	case ARM_EXCEPTION_HYP_GONE:
 		/*
 		 * EL2 has been reset to the hyp-stub. This happens when a guest
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 4d41a16cd596..2dc67e8d1aaa 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -16,6 +16,9 @@
 
 #include "hyp_constants.h"
 
+#define CREATE_TRACE_POINTS
+#include "trace_pkvm.h"
+
 DEFINE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
 
 static struct memblock_region *hyp_memory = kvm_nvhe_sym(hyp_memory);
@@ -628,3 +631,20 @@ bool pkvm_force_reclaim_guest_page(phys_addr_t phys)
 
 	return !ret || ret == -EAGAIN;
 }
+
+static int pkvm_hyp_req_handle(struct pkvm_hyp_req *req, struct kvm_vcpu *vcpu)
+{
+	int ret = -EINVAL;
+
+	switch (req->type) {
+	}
+
+	trace_kvm_handle_pkvm_hyp_req(req, ret);
+
+	return ret;
+}
+
+int __pkvm_handle_vcpu_req(struct kvm_vcpu *vcpu)
+{
+	return pkvm_hyp_req_handle(&vcpu->arch.pkvm_hyp_req, vcpu) ?: 1;
+}
diff --git a/arch/arm64/kvm/trace_pkvm.h b/arch/arm64/kvm/trace_pkvm.h
new file mode 100644
index 000000000000..3966c111e3ad
--- /dev/null
+++ b/arch/arm64/kvm/trace_pkvm.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#if !defined(_TRACE_PKVM_ARM64_KVM_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_PKVM_ARM64_KVM_H
+
+#include <linux/tracepoint.h>
+#include <asm/kvm_pkvm.h>
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM kvm
+
+TRACE_DEFINE_ENUM(PKVM_HYP_NO_REQ);
+
+#define PKVM_HYP_REQ_TYPES \
+	{ PKVM_HYP_NO_REQ, "NO_REQ" }
+
+TRACE_EVENT(kvm_handle_pkvm_hyp_req,
+	TP_PROTO(struct pkvm_hyp_req *req, int ret),
+	TP_ARGS(req, ret),
+
+	TP_STRUCT__entry(
+		__field(u8,	type)
+		__field(int,	ret)
+	),
+
+	TP_fast_assign(
+		__entry->type = req->type;
+		__entry->ret = ret;
+	),
+
+	TP_printk("type: %s ret: %d",
+		  __print_symbolic(__entry->type, PKVM_HYP_REQ_TYPES),
+		  __entry->ret)
+);
+
+#endif /* _TRACE_PKVM_ARM64_KVM_H */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace_pkvm
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.55.0.508.g3f0d502094-goog


