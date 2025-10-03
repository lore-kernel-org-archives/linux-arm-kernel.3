Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C43BCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQ6Qb9wj3BQ6hl/5CAj5rOPQ6CxI9L5MDgZi8E/svdg=; b=1EaDZIdmV4fb8z11WMYUq8a1LP
	Ygdhe8XT+zzReAwCHwJa7RPpcnND+39wSs5eIIHGTVDfZzwlcn8Hr3WSO6CyLAg6f2aD8ATphVHGf
	EnAAi4fvpvFUrQAIyCkyn7t4qbvbVsidFI6rQBfIr9U36lqGUdAzKXq41M36JThHnrmuucQjwAHJ2
	clox14BOqZTvSuSldjiFf2AuEcR1QWcrYh9xHdO0cbv4Suz06tBQR4UeuJe3Zz26Ui2v/Q8eh6v3f
	kOrsjIpccfhn20bpRXbjZmKVUGkPG6bWuO/wzS1L+aOz60Zrm0jAsxw7QLxiTdFw0uxzZLdCwlLzd
	Et60gxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0k-0000000CRDu-3xiY;
	Fri, 03 Oct 2025 13:39:51 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0F-0000000CQOc-1ge8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:26 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3f924ae2a89so1961290f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498757; x=1760103557; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RQ6Qb9wj3BQ6hl/5CAj5rOPQ6CxI9L5MDgZi8E/svdg=;
        b=PDqF482nQvKu1t/GesSmjN+Lix6P1MtbMfXdjKHMLdgXFuKfxXjZNRRYN6Q7lUQ13U
         CSQpylUjEb3nZP0LwOoI7W7FozWuN+Rye3XtrdIYSEvS3WzbM9g+u1LzKXESG/lZ2ubc
         gG6S6CcvCb+IE7P3b+JOcxoRSh1vl8DvYNMd6+XuwP4H7v4tJ1neR6UhVNptyWG6rGFg
         PtP6UDgQMr+z5f5Wrt+sgUjGX/aCtyTHYswa/9/Bo4/ph9ntNj9nigVm8j5/Bx4KYN3n
         Cd3Plt8jgiQNqQzrOFEZFt8BVDdPgQ5Eoifkbr9ZlYb2buL1uKHNX4EHnLeqNOOCu65T
         vyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498757; x=1760103557;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQ6Qb9wj3BQ6hl/5CAj5rOPQ6CxI9L5MDgZi8E/svdg=;
        b=MbrylJVUZWxvMSiRA215g+ugTcFF+QRDF/xsca6xRLi+hFeU/jbOuCMsac3+fYjsjW
         UUusMpNiqsddanNVj7HAnlCw4L0oU8IKmm570ytBEjpHpdpAL1ZueNdMOA61RPvaaULI
         DYGmQh9OUaUVD3Jd1MSkckWOR8SVvAXsq+dpvog7jP1Vxa+ufR7XByM/CcYLwmADE4TV
         H9UIVUyQYr6BwFlNUXNErRjJ5N503u54mU0hLwMaito2578VequnMtyM8LlNT8zGJgou
         SsTepi3/2NH2X3LZOhTimXlJz4oBuKE3o12aIG6/9gmqEAXjuQu1o8cRrXNPfUrkJAie
         fNIg==
X-Forwarded-Encrypted: i=1; AJvYcCVG1sXIHMkOLwllagxwkgU7/ovr5qb0bOxCG/gWNl24SrX5znqB4psEqMOFgznSmwfpbzj2MeypzKxiaOd39bZH@lists.infradead.org
X-Gm-Message-State: AOJu0YyDMeBb4JChWu3Ct4IKdh4b1+vUmu7R5vHU2WXaNIYe70z76AH2
	WVjtX8akyZ+g5OYBljhR3DdHQVpscSVb4ZDmDO6xak2bL79eqvyqrSrwmDMeA4DGYyne0QDtFFh
	rtY9XMh6k75kuMA3xdthbuA==
X-Google-Smtp-Source: AGHT+IGsl5FnF7HkLitsp8rwH907TghuzS3HhWu90DM6qRMXoLyGeXaVam0onlElR+MiPphNI6wwWN6X+pllVfED
X-Received: from wmht10.prod.google.com ([2002:a05:600c:41ca:b0:46e:34af:fbab])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3551:b0:46d:27b7:e7ff with SMTP id 5b1f17b1804b1-46e7115c811mr23866335e9.36.1759498756792;
 Fri, 03 Oct 2025 06:39:16 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:18 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-22-vdonnefort@google.com>
Subject: [PATCH v7 21/28] KVM: arm64: Add tracing capability for the pKVM hyp
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
X-CRM114-CacheID: sfid-20251003_063919_611890_8722A5B2 
X-CRM114-Status: GOOD (  21.02  )
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

When running with protected mode, the host has very little knowledge
about what is happening in the hypervisor. Of course this is an
essential feature for security but nonetheless, that piece of code
growing with more responsibilities, we need now a way to debug and
profile it. Tracefs by its reliability, versatility and support for
user-space is the perfect tool.

There's no way the hypervisor could log events directly into the host
tracefs ring-buffers. So instead let's use our own, where the hypervisor
is the writer and the host the reader.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index bec227f9500a..437ac948d136 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -87,6 +87,10 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
 	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
+	__KVM_HOST_SMCCC_FUNC___pkvm_load_tracing,
+	__KVM_HOST_SMCCC_FUNC___pkvm_unload_tracing,
+	__KVM_HOST_SMCCC_FUNC___pkvm_enable_tracing,
+	__KVM_HOST_SMCCC_FUNC___pkvm_swap_reader_tracing,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/include/asm/kvm_hyptrace.h b/arch/arm64/include/asm/kvm_hyptrace.h
new file mode 100644
index 000000000000..9c30a479bc36
--- /dev/null
+++ b/arch/arm64/include/asm/kvm_hyptrace.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ARM64_KVM_HYPTRACE_H_
+#define __ARM64_KVM_HYPTRACE_H_
+
+#include <linux/ring_buffer.h>
+
+struct hyp_trace_desc {
+	unsigned long			bpages_backing_start;
+	size_t				bpages_backing_size;
+	struct trace_buffer_desc	trace_buffer_desc;
+
+};
+#endif
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 713248f240e0..06e948d066ac 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -82,4 +82,11 @@ config PTDUMP_STAGE2_DEBUGFS
 
 	  If in doubt, say N.
 
+config PKVM_TRACING
+	bool
+	depends on KVM
+	depends on TRACING
+	select SIMPLE_RING_BUFFER
+	default y
+
 endif # VIRTUALIZATION
diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
new file mode 100644
index 000000000000..996e90c0974f
--- /dev/null
+++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ARM64_KVM_HYP_NVHE_TRACE_H
+#define __ARM64_KVM_HYP_NVHE_TRACE_H
+#include <asm/kvm_hyptrace.h>
+
+#ifdef CONFIG_PKVM_TRACING
+void *tracing_reserve_entry(unsigned long length);
+void tracing_commit_entry(void);
+
+int __pkvm_load_tracing(unsigned long desc_va, size_t desc_size);
+void __pkvm_unload_tracing(void);
+int __pkvm_enable_tracing(bool enable);
+int __pkvm_swap_reader_tracing(unsigned int cpu);
+#else
+static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
+static inline void tracing_commit_entry(void) { }
+
+static inline int __pkvm_load_tracing(unsigned long desc_va, size_t desc_size) { return -ENODEV; }
+static inline void __pkvm_unload_tracing(void) { }
+static inline int __pkvm_enable_tracing(bool enable) { return -ENODEV; }
+static inline int __pkvm_swap_reader_tracing(unsigned int cpu) { return -ENODEV; }
+#endif
+#endif
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 607357e36026..e640f12808f7 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -28,7 +28,7 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
-hyp-obj-$(CONFIG_PKVM_TRACING) += clock.o
+hyp-obj-$(CONFIG_PKVM_TRACING) += clock.o trace.o ../../../../../kernel/trace/simple_ring_buffer.o
 hyp-obj-y += $(lib-objs)
 
 ##
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 3206b2c07f82..02b2fdd9a8e4 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -18,6 +18,7 @@
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
 #include <nvhe/pkvm.h>
+#include <nvhe/trace.h>
 #include <nvhe/trap_handler.h>
 
 DEFINE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
@@ -573,6 +574,35 @@ static void handle___pkvm_teardown_vm(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __pkvm_teardown_vm(handle);
 }
 
+static void handle___pkvm_load_tracing(struct kvm_cpu_context *host_ctxt)
+{
+	 DECLARE_REG(unsigned long, desc_hva, host_ctxt, 1);
+	 DECLARE_REG(size_t, desc_size, host_ctxt, 2);
+
+	 cpu_reg(host_ctxt, 1) = __pkvm_load_tracing(desc_hva, desc_size);
+}
+
+static void handle___pkvm_unload_tracing(struct kvm_cpu_context *host_ctxt)
+{
+	__pkvm_unload_tracing();
+
+	cpu_reg(host_ctxt, 1) = 0;
+}
+
+static void handle___pkvm_enable_tracing(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(bool, enable, host_ctxt, 1);
+
+	cpu_reg(host_ctxt, 1) = __pkvm_enable_tracing(enable);
+}
+
+static void handle___pkvm_swap_reader_tracing(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(unsigned int, cpu, host_ctxt, 1);
+
+	cpu_reg(host_ctxt, 1) = __pkvm_swap_reader_tracing(cpu);
+}
+
 typedef void (*hcall_t)(struct kvm_cpu_context *);
 
 #define HANDLE_FUNC(x)	[__KVM_HOST_SMCCC_FUNC_##x] = (hcall_t)handle_##x
@@ -612,6 +642,10 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_vcpu_load),
 	HANDLE_FUNC(__pkvm_vcpu_put),
 	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
+	HANDLE_FUNC(__pkvm_load_tracing),
+	HANDLE_FUNC(__pkvm_unload_tracing),
+	HANDLE_FUNC(__pkvm_enable_tracing),
+	HANDLE_FUNC(__pkvm_swap_reader_tracing),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
new file mode 100644
index 000000000000..def5cbc75722
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Vincent Donnefort <vdonnefort@google.com>
+ */
+
+#include <nvhe/clock.h>
+#include <nvhe/mem_protect.h>
+#include <nvhe/mm.h>
+#include <nvhe/trace.h>
+
+#include <asm/percpu.h>
+#include <asm/kvm_mmu.h>
+#include <asm/local.h>
+
+#include <linux/simple_ring_buffer.h>
+
+static DEFINE_PER_CPU(struct simple_rb_per_cpu, __simple_rbs);
+
+static struct hyp_trace_buffer {
+	struct simple_rb_per_cpu __percpu	*simple_rbs;
+	unsigned long				bpages_backing_start;
+	size_t					bpages_backing_size;
+	hyp_spinlock_t				lock;
+} trace_buffer = {
+	.simple_rbs = &__simple_rbs,
+	.lock = __HYP_SPIN_LOCK_UNLOCKED,
+};
+
+static bool hyp_trace_buffer_loaded(struct hyp_trace_buffer *trace_buffer)
+{
+	return trace_buffer->bpages_backing_size > 0;
+}
+
+void *tracing_reserve_entry(unsigned long length)
+{
+	return simple_ring_buffer_reserve(this_cpu_ptr(trace_buffer.simple_rbs), length,
+					  trace_clock());
+}
+
+void tracing_commit_entry(void)
+{
+	simple_ring_buffer_commit(this_cpu_ptr(trace_buffer.simple_rbs));
+}
+
+static int hyp_trace_buffer_load_bpage_backing(struct hyp_trace_buffer *trace_buffer,
+					       struct hyp_trace_desc *desc)
+{
+	unsigned long start = kern_hyp_va(desc->bpages_backing_start);
+	size_t size = desc->bpages_backing_size;
+	int ret;
+
+	if (!PAGE_ALIGNED(start) || !PAGE_ALIGNED(size))
+		return -EINVAL;
+
+	ret = __pkvm_host_donate_hyp(hyp_virt_to_pfn((void *)start), size >> PAGE_SHIFT);
+	if (ret)
+		return ret;
+
+	memset((void *)start, 0, size);
+
+	trace_buffer->bpages_backing_start = start;
+	trace_buffer->bpages_backing_size = size;
+
+	return 0;
+}
+
+static void hyp_trace_buffer_unload_bpage_backing(struct hyp_trace_buffer *trace_buffer)
+{
+	unsigned long start = trace_buffer->bpages_backing_start;
+	size_t size = trace_buffer->bpages_backing_size;
+
+	if (!size)
+		return;
+
+	memset((void *)start, 0, size);
+
+	WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(start), size >> PAGE_SHIFT));
+
+	trace_buffer->bpages_backing_start = 0;
+	trace_buffer->bpages_backing_size = 0;
+}
+
+static void *__pin_shared_page(unsigned long kern_va)
+{
+	void *va = kern_hyp_va((void *)kern_va);
+
+	return hyp_pin_shared_mem(va, va + PAGE_SIZE) ? NULL : va;
+}
+
+static void __unpin_shared_page(void *va)
+{
+	hyp_unpin_shared_mem(va, va + PAGE_SIZE);
+}
+
+static void hyp_trace_buffer_unload(struct hyp_trace_buffer *trace_buffer)
+{
+	int cpu;
+
+	hyp_assert_lock_held(&trace_buffer->lock);
+
+	if (!hyp_trace_buffer_loaded(trace_buffer))
+		return;
+
+	for (cpu = 0; cpu < hyp_nr_cpus; cpu++)
+		__simple_ring_buffer_unload(per_cpu_ptr(trace_buffer->simple_rbs, cpu),
+					    __unpin_shared_page);
+
+	hyp_trace_buffer_unload_bpage_backing(trace_buffer);
+}
+
+static int hyp_trace_buffer_load(struct hyp_trace_buffer *trace_buffer,
+				 struct hyp_trace_desc *desc)
+{
+	struct simple_buffer_page *bpages;
+	struct ring_buffer_desc *rb_desc;
+	int ret, cpu;
+
+	hyp_assert_lock_held(&trace_buffer->lock);
+
+	if (hyp_trace_buffer_loaded(trace_buffer))
+		return -EINVAL;
+
+	ret = hyp_trace_buffer_load_bpage_backing(trace_buffer, desc);
+	if (ret)
+		return ret;
+
+	bpages = (struct simple_buffer_page *)trace_buffer->bpages_backing_start;
+	for_each_ring_buffer_desc(rb_desc, cpu, &desc->trace_buffer_desc) {
+		ret = __simple_ring_buffer_init(per_cpu_ptr(trace_buffer->simple_rbs, cpu),
+						bpages, rb_desc, __pin_shared_page,
+						__unpin_shared_page);
+		if (ret)
+			break;
+
+		bpages += rb_desc->nr_page_va;
+	}
+
+	if (ret)
+		hyp_trace_buffer_unload(trace_buffer);
+
+	return ret;
+}
+
+static bool hyp_trace_desc_validate(struct hyp_trace_desc *desc, size_t desc_size)
+{
+	struct simple_buffer_page *bpages = (struct simple_buffer_page *)desc->bpages_backing_start;
+	struct ring_buffer_desc *rb_desc;
+	void *bpages_end, *desc_end;
+	unsigned int cpu;
+
+	desc_end = (void *)desc + desc_size; /* __pkvm_host_donate_hyp validates desc_size */
+
+	bpages_end = (void *)desc->bpages_backing_start + desc->bpages_backing_size;
+	if (bpages_end < (void *)desc->bpages_backing_start)
+		return false;
+
+	for_each_ring_buffer_desc(rb_desc, cpu, &desc->trace_buffer_desc) {
+		/* Can we read nr_page_va? */
+		if ((void *)rb_desc + struct_size(rb_desc, page_va, 0) > desc_end)
+			return false;
+
+		/* Overflow desc? */
+		if ((void *)rb_desc + struct_size(rb_desc, page_va, rb_desc->nr_page_va) > desc_end)
+			return false;
+
+		/* Overflow bpages backing memory? */
+		if ((void *)(bpages + rb_desc->nr_page_va) > bpages_end)
+			return false;
+
+		if (cpu >= hyp_nr_cpus)
+			return false;
+
+		if (cpu != rb_desc->cpu)
+			return false;
+
+		bpages += rb_desc->nr_page_va;
+	}
+
+	return true;
+}
+
+int __pkvm_load_tracing(unsigned long desc_hva, size_t desc_size)
+{
+	struct hyp_trace_desc *desc = (struct hyp_trace_desc *)kern_hyp_va(desc_hva);
+	int ret;
+
+	if (!desc_size || !PAGE_ALIGNED(desc_hva) || !PAGE_ALIGNED(desc_size))
+		return -EINVAL;
+
+	ret = __pkvm_host_donate_hyp(hyp_virt_to_pfn((void *)desc),
+				     desc_size >> PAGE_SHIFT);
+	if (ret)
+		return ret;
+
+	if (!hyp_trace_desc_validate(desc, desc_size))
+		goto err_donate_desc;
+
+	hyp_spin_lock(&trace_buffer.lock);
+
+	ret = hyp_trace_buffer_load(&trace_buffer, desc);
+
+	hyp_spin_unlock(&trace_buffer.lock);
+
+err_donate_desc:
+	WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn((void *)desc),
+				       desc_size >> PAGE_SHIFT));
+	return ret;
+}
+
+void __pkvm_unload_tracing(void)
+{
+	hyp_spin_lock(&trace_buffer.lock);
+	hyp_trace_buffer_unload(&trace_buffer);
+	hyp_spin_unlock(&trace_buffer.lock);
+}
+
+int __pkvm_enable_tracing(bool enable)
+{
+	int cpu, ret = enable ? -EINVAL : 0;
+
+	hyp_spin_lock(&trace_buffer.lock);
+
+	if (!hyp_trace_buffer_loaded(&trace_buffer))
+		goto unlock;
+
+	for (cpu = 0; cpu < hyp_nr_cpus; cpu++)
+		simple_ring_buffer_enable_tracing(per_cpu_ptr(trace_buffer.simple_rbs, cpu),
+						  enable);
+
+	ret = 0;
+
+unlock:
+	hyp_spin_unlock(&trace_buffer.lock);
+
+	return ret;
+}
+
+int __pkvm_swap_reader_tracing(unsigned int cpu)
+{
+	int ret;
+
+	if (cpu >= hyp_nr_cpus)
+		return -EINVAL;
+
+	hyp_spin_lock(&trace_buffer.lock);
+
+	if (hyp_trace_buffer_loaded(&trace_buffer))
+		ret = simple_ring_buffer_swap_reader_page(
+				per_cpu_ptr(trace_buffer.simple_rbs, cpu));
+	else
+		ret = -ENODEV;
+
+	hyp_spin_unlock(&trace_buffer.lock);
+
+	return ret;
+}
-- 
2.51.0.618.g983fd99d29-goog


