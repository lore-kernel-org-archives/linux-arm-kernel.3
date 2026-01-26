Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D0FCF65D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Al13JaelPda1kGCRstUr7fjERPDoFgto1bxv0RZMN4A=; b=3pLg93Rc8BTgp5f6b4yRC8uhuh
	df7gT095K28M034cnfeNu+f4araQ+im9t0/AlwXm+j7jk7rCmUmdUbGtk/mWXUivqb+W+9CeybnHl
	DwFhXgdtln+VaLUdIfTIazGNlJzTs/3FkgLqCCKhrRqs5ND/AYkmdMf3LGuQFRL1bgw3WB5qT8MxF
	OgmhrZW+HfSeF+Md4QUCEdlF/CcMEW7sNANyiIlO47Mk1vmmEEPmAp22nuzzqx+/n+gnZfv/j6/8b
	UDTWxHuaF+mF40MebveeGGzQO38tDNu0/kcBWbIryG2CgIXE6OIe0mTU0jgHNAPayaxWNCXG9EKoy
	6Xt6ZCXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK6z-0000000CLJK-3WFB;
	Mon, 26 Jan 2026 10:46:25 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5S-0000000CJcG-17jL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-480600391e2so7885605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424288; x=1770029088; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Al13JaelPda1kGCRstUr7fjERPDoFgto1bxv0RZMN4A=;
        b=Azzcwze4iRnqNyknpjS9TlTKKVtk+HYv4Ce0nPJJmPcVLDRIiH8OFcDjZccbiAWuBn
         NzAkA0TaDzkIxINSnWQZ5cY0sO90+OwbWnhNHao7z4LQAgThzg5Ia7qYKVQ5sxgiuNMo
         PC9U8WkWYamxnhPkuoGSt1jbWU+pbLoSpDSa3IBBUpAQOZ5jCnss9PcarXCjDDm9ivK9
         QiIOTjp/0A7/sNoGw4cvQnHXY8TONYs589tr9sTdiad8Thl1w8DJMM3XZ5nKGvZyTrEI
         swz2XcH+jZDT0IzCKaywvPYfs/8/DLVTQ9jw70zgvgkiF9w5KSIUAhULISoAg/y5WqwG
         mHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424288; x=1770029088;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Al13JaelPda1kGCRstUr7fjERPDoFgto1bxv0RZMN4A=;
        b=jjRX7TTlc2FQCvTksssxN3d+ENfHYMZqOzryLze9FFtNtC6+T0Lq96/5yJq4tokO+b
         Rkm0V66jbJvf45sWCUVWJ4/Dptn/uo/AvmR0PJN/RbwqWHbFlhlpLagFwkc6kZqv01/2
         dv/M35MO7x8IpAr1GXgCPZoURrH4MYBVRSQSZdexgoz9XlkaRb91HfXtneL7HlsjdEC5
         K2x7lj6dz12Z+pULQqkiNi9GpFGSjNd+p6RlL6SSb6ttZ9WMTXKGHMzrtJh28pMu5yRS
         Nrz4znON//CIZzbYCOH4NbHJz4QcHXs4oEdQWx43Sm1ns+U6BYq1NwN1xhWk+uW/F3GY
         AeUA==
X-Forwarded-Encrypted: i=1; AJvYcCX7ZRZfrRdLruJ4aB8oCViWOQrT4ecLwA8ZxLN3xZmo4/qYJFMnDPMkWyrOuuzGAobtt+JcrTk7hnt4Ph1k0I8X@lists.infradead.org
X-Gm-Message-State: AOJu0YwgG41cWWZXCnLMEJl1jMhAK38xMZDgA0Qn/nePx8TWhfH+5UVD
	Bm2ZHjDNYuAKvxCGFF3jufVKbsnslzSc3yBcoaZ9NfcLyeKnPHsypdyQnMRV2IiR+6GTjWe3Len
	9JhjC8RDPuGpqsvjZbrCPBw==
X-Received: from wmgg15.prod.google.com ([2002:a05:600d:f:b0:47e:db37:5b6b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b6b:b0:480:1c53:208b with SMTP id 5b1f17b1804b1-4805d07366fmr68436035e9.36.1769424288058;
 Mon, 26 Jan 2026 02:44:48 -0800 (PST)
Date: Mon, 26 Jan 2026 10:44:13 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-25-vdonnefort@google.com>
Subject: [PATCH v10 24/30] KVM: arm64: Add trace remote for the nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20260126_024450_494255_4E09EFC5 
X-CRM114-Status: GOOD (  19.01  )
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

In both protected and nVHE mode, the hypervisor is capable of writing
events into tracefs compatible ring-buffers. Create a trace remote so
the kernel can read those buffers.

This currently doesn't provide any event support which will come later.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index c7f50492f2cf..aad0228f24db 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -76,6 +76,7 @@ if NVHE_EL2_DEBUG
 config NVHE_EL2_TRACING
 	bool
 	depends on TRACING
+	select TRACE_REMOTE
 	default y
 
 config PKVM_DISABLE_STAGE2_ON_PANIC
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 3ebc0570345c..59612d2f277c 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -30,6 +30,8 @@ kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
 kvm-$(CONFIG_PTDUMP_STAGE2_DEBUGFS) += ptdump.o
 
+kvm-$(CONFIG_NVHE_EL2_TRACING) += hyp_trace.o
+
 always-y := hyp_constants.h hyp-constants.s
 
 define rule_gen_hyp_constants
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index be1fd6c5f74c..f7f222ecaf88 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -24,6 +24,7 @@
 
 #define CREATE_TRACE_POINTS
 #include "trace_arm.h"
+#include "hyp_trace.h"
 
 #include <linux/uaccess.h>
 #include <asm/ptrace.h>
@@ -2361,6 +2362,10 @@ static int __init init_subsystems(void)
 
 	kvm_register_perf_callbacks(NULL);
 
+	err = kvm_hyp_trace_init();
+	if (err)
+		kvm_err("Failed to initialize Hyp tracing\n");
+
 out:
 	if (err)
 		hyp_cpu_pm_exit();
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
new file mode 100644
index 000000000000..2866effe28ec
--- /dev/null
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Vincent Donnefort <vdonnefort@google.com>
+ */
+
+#include <linux/trace_remote.h>
+#include <linux/simple_ring_buffer.h>
+
+#include <asm/kvm_host.h>
+#include <asm/kvm_hyptrace.h>
+#include <asm/kvm_mmu.h>
+
+#include "hyp_trace.h"
+
+/* Access to this struct within the trace_remote_callbacks are protected by the trace_remote lock */
+static struct hyp_trace_buffer {
+	struct hyp_trace_desc	*desc;
+	size_t			desc_size;
+} trace_buffer;
+
+static int __map_hyp(void *start, size_t size)
+{
+	if (is_protected_kvm_enabled())
+		return 0;
+
+	return create_hyp_mappings(start, start + size, PAGE_HYP);
+}
+
+static int __share_page(unsigned long va)
+{
+	return kvm_share_hyp((void *)va, (void *)va + 1);
+}
+
+static void __unshare_page(unsigned long va)
+{
+	kvm_unshare_hyp((void *)va, (void *)va + 1);
+}
+
+static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_buffer, size_t size)
+{
+	int nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
+	size_t backing_size;
+	void *start;
+
+	backing_size = PAGE_ALIGN(sizeof(struct simple_buffer_page) * nr_bpages *
+				  num_possible_cpus());
+
+	start = alloc_pages_exact(backing_size, GFP_KERNEL_ACCOUNT);
+	if (!start)
+		return -ENOMEM;
+
+	trace_buffer->desc->bpages_backing_start = (unsigned long)start;
+	trace_buffer->desc->bpages_backing_size = backing_size;
+
+	return __map_hyp(start, backing_size);
+}
+
+static void hyp_trace_buffer_free_bpages_backing(struct hyp_trace_buffer *trace_buffer)
+{
+	free_pages_exact((void *)trace_buffer->desc->bpages_backing_start,
+			 trace_buffer->desc->bpages_backing_size);
+}
+
+static void hyp_trace_buffer_unshare_hyp(struct hyp_trace_buffer *trace_buffer, int last_cpu)
+{
+	struct ring_buffer_desc *rb_desc;
+	int cpu, p;
+
+	for_each_ring_buffer_desc(rb_desc, cpu, &trace_buffer->desc->trace_buffer_desc) {
+		if (cpu > last_cpu)
+			break;
+
+		__share_page(rb_desc->meta_va);
+		for (p = 0; p < rb_desc->nr_page_va; p++)
+			__unshare_page(rb_desc->page_va[p]);
+	}
+}
+
+static int hyp_trace_buffer_share_hyp(struct hyp_trace_buffer *trace_buffer)
+{
+	struct ring_buffer_desc *rb_desc;
+	int cpu, p, ret = 0;
+
+	for_each_ring_buffer_desc(rb_desc, cpu, &trace_buffer->desc->trace_buffer_desc) {
+		ret = __share_page(rb_desc->meta_va);
+		if (ret)
+			break;
+
+		for (p = 0; p < rb_desc->nr_page_va; p++) {
+			ret = __share_page(rb_desc->page_va[p]);
+			if (ret)
+				break;
+		}
+
+		if (ret) {
+			for (p--; p >= 0; p--)
+				__unshare_page(rb_desc->page_va[p]);
+			break;
+		}
+	}
+
+	if (ret)
+		hyp_trace_buffer_unshare_hyp(trace_buffer, cpu--);
+
+	return ret;
+}
+
+static struct trace_buffer_desc *hyp_trace_load(unsigned long size, void *priv)
+{
+	struct hyp_trace_buffer *trace_buffer = priv;
+	struct hyp_trace_desc *desc;
+	size_t desc_size;
+	int ret;
+
+	if (WARN_ON(trace_buffer->desc))
+		return ERR_PTR(-EINVAL);
+
+	desc_size = trace_buffer_desc_size(size, num_possible_cpus());
+	if (desc_size == SIZE_MAX)
+		return ERR_PTR(-E2BIG);
+
+	desc_size = PAGE_ALIGN(desc_size);
+	desc = (struct hyp_trace_desc *)alloc_pages_exact(desc_size, GFP_KERNEL);
+	if (!desc)
+		return ERR_PTR(-ENOMEM);
+
+	ret = __map_hyp(desc, desc_size);
+	if (ret)
+		goto err_free_desc;
+
+	trace_buffer->desc = desc;
+
+	ret = hyp_trace_buffer_alloc_bpages_backing(trace_buffer, size);
+	if (ret)
+		goto err_free_desc;
+
+	ret = trace_remote_alloc_buffer(&desc->trace_buffer_desc, desc_size, size,
+					cpu_possible_mask);
+	if (ret)
+		goto err_free_backing;
+
+	ret = hyp_trace_buffer_share_hyp(trace_buffer);
+	if (ret)
+		goto err_free_buffer;
+
+	ret = kvm_call_hyp_nvhe(__tracing_load, (unsigned long)desc, desc_size);
+	if (ret)
+		goto err_unload_pages;
+
+	return &desc->trace_buffer_desc;
+
+err_unload_pages:
+	hyp_trace_buffer_unshare_hyp(trace_buffer, INT_MAX);
+
+err_free_buffer:
+	trace_remote_free_buffer(&desc->trace_buffer_desc);
+
+err_free_backing:
+	hyp_trace_buffer_free_bpages_backing(trace_buffer);
+
+err_free_desc:
+	free_pages_exact(desc, desc_size);
+	trace_buffer->desc = NULL;
+
+	return ERR_PTR(ret);
+}
+
+static void hyp_trace_unload(struct trace_buffer_desc *desc, void *priv)
+{
+	struct hyp_trace_buffer *trace_buffer = priv;
+
+	if (WARN_ON(desc != &trace_buffer->desc->trace_buffer_desc))
+		return;
+
+	kvm_call_hyp_nvhe(__tracing_unload);
+	hyp_trace_buffer_unshare_hyp(trace_buffer, INT_MAX);
+	trace_remote_free_buffer(desc);
+	hyp_trace_buffer_free_bpages_backing(trace_buffer);
+	free_pages_exact(trace_buffer->desc, trace_buffer->desc_size);
+	trace_buffer->desc = NULL;
+}
+
+static int hyp_trace_enable_tracing(bool enable, void *priv)
+{
+	return kvm_call_hyp_nvhe(__tracing_enable, enable);
+}
+
+static int hyp_trace_swap_reader_page(unsigned int cpu, void *priv)
+{
+	return kvm_call_hyp_nvhe(__tracing_swap_reader, cpu);
+}
+
+static int hyp_trace_reset(unsigned int cpu, void *priv)
+{
+	return 0;
+}
+
+static int hyp_trace_enable_event(unsigned short id, bool enable, void *priv)
+{
+	return 0;
+}
+
+static struct trace_remote_callbacks trace_remote_callbacks = {
+	.load_trace_buffer	= hyp_trace_load,
+	.unload_trace_buffer	= hyp_trace_unload,
+	.enable_tracing		= hyp_trace_enable_tracing,
+	.swap_reader_page	= hyp_trace_swap_reader_page,
+	.reset			= hyp_trace_reset,
+	.enable_event		= hyp_trace_enable_event,
+};
+
+int __init kvm_hyp_trace_init(void)
+{
+	if (is_kernel_in_hyp_mode())
+		return 0;
+
+	return trace_remote_register("hypervisor", &trace_remote_callbacks, &trace_buffer, NULL, 0);
+}
diff --git a/arch/arm64/kvm/hyp_trace.h b/arch/arm64/kvm/hyp_trace.h
new file mode 100644
index 000000000000..c991b1ec65f1
--- /dev/null
+++ b/arch/arm64/kvm/hyp_trace.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ARM64_KVM_HYP_TRACE_H__
+#define __ARM64_KVM_HYP_TRACE_H__
+
+#ifdef CONFIG_NVHE_EL2_TRACING
+int kvm_hyp_trace_init(void);
+#else
+static inline int kvm_hyp_trace_init(void) { return 0; }
+#endif
+#endif
-- 
2.52.0.457.g6b5491de43-goog


