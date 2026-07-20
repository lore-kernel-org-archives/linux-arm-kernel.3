Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F39CC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIusGyrzkh2pBQ28oN0s33T1oJ/W4D/Kdho2pNnQGJM=; b=yIz4iobzY26uupHsSJ90x3ko2H
	u1j2CZ9eJe4GES/XnHSUocaZ/FQKOpRWLTAEZuHpZJnqnslFf0VVaABj5Cr3N13BE56sHshqYFMBk
	e1GcRp53w/60xeiD0PW2c8BNwnJKK8emrDOmk1khCNz8l+EOA9/e2zHAGjMQtwo8NVjgLOCKCoQqG
	NG9G3DkaeGHmQeBeuYMzI0ntw8TNZMS1YpdKRgRC6uTw8Xhjn90xYKj/zCtcIiJvNCR0EUPvkJ2Uc
	LPfTPSR21IbDiJtuCzl1eaDKBPPzCHqUaL2Y9ZxylO1T8+bGFK31Fy1MDkUHNXoHoujkRRdz90kE8
	zxBdXTqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrbO-00000007Vg2-3EF0;
	Mon, 20 Jul 2026 17:16:26 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrag-00000007Uzn-0ggt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:15:43 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49244130073so104172055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 10:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784567740; x=1785172540; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eIusGyrzkh2pBQ28oN0s33T1oJ/W4D/Kdho2pNnQGJM=;
        b=SLLeM4so8YPbKnZyCjCAdre3uZJuwWic16K9WFMgwu14zI7UzNeK/iiyye/P/PVudd
         UU+ikfqB40HdQJFCOZveYexeQgJTdf2fJxTF7CI4QsoP/J9uWoyYm5jwkIDMby5mDT1g
         aAccE1zQyFANXYW/AQYf/QgSIbiAYOE0BzrUk6T987nl4spX8LEW2AhmaRN1asMAAOFg
         0eSc0rHdJPpGnScnLJfEWaytl+agCI3lQSwwWtNk7jaFWB3sChk90sKu0o823ly/a/Fx
         ACrXnjsTL910tL/6RHh0fyu4U40EsDPr7yfrbN/6qpqs6IKaWPhvj4JudiHtRQrT9sza
         cCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567740; x=1785172540;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIusGyrzkh2pBQ28oN0s33T1oJ/W4D/Kdho2pNnQGJM=;
        b=qJ8BCysAOlcYctq1Exu7NLEp2UK7+LFmrOS/UX6xZNbVhP8ffpJpzkXSriSC3oEiwl
         s3Znb2kiNecJ6VnhODu2o4Fk+2GtwuVu/7cin9OqOybVEwaiu2Ex8Ktzfo5/J/T9GbtR
         40oyIp0qOqggfGV7sUt2+TRd9RutjcGGLY9ORpcGFTxNDAkPwDR029kVKe29OgIv/a1E
         yovMXqo6SD8kmkHeQVU+rV3vsQY9L4YZvZTUEGL+UH1vGLq2QpxYXL96KGh7aP2MR4Og
         ao38LjLKSXF6Vs6RH/s9xrGyeVy812bRiKaQSAW/+vqdxEv9iAzK6U4/Enhad/cnVji0
         eO7w==
X-Forwarded-Encrypted: i=1; AHgh+RrZ898gKpRzE45cOjirxOZlazDAZUTBZTGb1I7ubTt1MvpRin44kRCvTcMg41EV67mnH0HkhSPC3s011DgTqiEV@lists.infradead.org
X-Gm-Message-State: AOJu0YxuDVf2/XwKZPewhGG8cEwLPqe6dGwTxViUk8TZgpL8vwgN20KN
	FOLL1EYraWc74/oK4SxrjiHCgkmBYKobAvYbH6HfwW8APzrB+ZMIFDGo5Gx6OXCfpOcIuQkXLAr
	oUn4CdJ8ovGgQ8Z36+BPB4g==
X-Received: from wmbep17.prod.google.com ([2002:a05:600c:8411:b0:493:bba5:775a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524c:b0:495:4e17:cad5 with SMTP id 5b1f17b1804b1-4954e17caeemr159603755e9.26.1784567739745;
 Mon, 20 Jul 2026 10:15:39 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:15:13 +0100
In-Reply-To: <20260720171513.1415357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720171513.1415357-18-vdonnefort@google.com>
Subject: [PATCH v3 17/17] KVM: arm64: Alloc simple_buffer_page using pKVM hyp allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_101542_245244_88BE8403 
X-CRM114-Status: GOOD (  18.54  )
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

In protected mode, transition the allocation of the simple_ring_buffer
structures from the host to the hypervisor using the new pKVM heap
allocator.

Previously, the host allocated and donated a contiguous backing memory
for these structures. In pKVM the hypervisor can now allocate them
dynamically.

Use the pkvm_call_hyp_req() wrapper in the host to invoke
__tracing_load, which automatically handles any top-up requests if the
hypervisor runs out of heap memory during allocation.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 01e7ffc489f5..a5b740d152be 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -745,7 +745,7 @@ static void handle___tracing_load(struct kvm_cpu_context *host_ctxt)
 	DECLARE_REG(unsigned long, desc_hva, host_ctxt, 1);
 	DECLARE_REG(size_t, desc_size, host_ctxt, 2);
 
-	cpu_reg(host_ctxt, 1) = __tracing_load(desc_hva, desc_size);
+	errno_to_smccc(__tracing_load(desc_hva, desc_size), host_ctxt);
 }
 
 static void handle___tracing_unload(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index 96afa3d6de2f..5ff19d210508 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -4,6 +4,7 @@
  * Author: Vincent Donnefort <vdonnefort@google.com>
  */
 
+#include <nvhe/alloc.h>
 #include <nvhe/clock.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -62,18 +63,34 @@ static void __release_host_mem(void *start, u64 size)
 	WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(start), size >> PAGE_SHIFT));
 }
 
-static int hyp_trace_buffer_load_bpage_backing(struct hyp_trace_buffer *trace_buffer,
-					       struct hyp_trace_desc *desc)
+static int hyp_trace_buffer_alloc_bpages(struct hyp_trace_buffer *trace_buffer,
+					 struct hyp_trace_desc *desc)
 {
-	void *start = (void *)kern_hyp_va(desc->bpages_backing_start);
-	size_t size = desc->bpages_backing_size;
+	void *start;
+	size_t size;
 	int ret;
 
-	ret = __admit_host_mem(start, size);
-	if (ret)
-		return ret;
+	if (is_protected_kvm_enabled()) {
+		struct ring_buffer_desc *rb_desc;
+		int cpu;
 
-	memset(start, 0, size);
+		size = 0;
+		for_each_ring_buffer_desc(rb_desc, cpu, &desc->trace_buffer_desc)
+			size += rb_desc->nr_page_va * sizeof(struct simple_buffer_page);
+
+		start = hyp_alloc(size);
+		if (!start)
+			return hyp_alloc_errno();
+	} else {
+		start = (void *)kern_hyp_va(desc->bpages_backing_start);
+		size = desc->bpages_backing_size;
+
+		ret = __admit_host_mem(start, size);
+		if (ret)
+			return ret;
+
+		memset(start, 0, size);
+	}
 
 	trace_buffer->bpages_backing_start = start;
 	trace_buffer->bpages_backing_size = size;
@@ -81,7 +98,7 @@ static int hyp_trace_buffer_load_bpage_backing(struct hyp_trace_buffer *trace_bu
 	return 0;
 }
 
-static void hyp_trace_buffer_unload_bpage_backing(struct hyp_trace_buffer *trace_buffer)
+static void hyp_trace_buffer_free_bpages(struct hyp_trace_buffer *trace_buffer)
 {
 	void *start = trace_buffer->bpages_backing_start;
 	size_t size = trace_buffer->bpages_backing_size;
@@ -89,9 +106,12 @@ static void hyp_trace_buffer_unload_bpage_backing(struct hyp_trace_buffer *trace
 	if (!size)
 		return;
 
-	memset(start, 0, size);
-
-	__release_host_mem(start, size);
+	if (is_protected_kvm_enabled()) {
+		hyp_free(start);
+	} else {
+		memset(start, 0, size);
+		__release_host_mem(start, size);
+	}
 
 	trace_buffer->bpages_backing_start = 0;
 	trace_buffer->bpages_backing_size = 0;
@@ -128,7 +148,7 @@ static void hyp_trace_buffer_unload(struct hyp_trace_buffer *trace_buffer)
 		simple_ring_buffer_unload_mm(per_cpu_ptr(trace_buffer->simple_rbs, cpu),
 					     __unpin_shared_page);
 
-	hyp_trace_buffer_unload_bpage_backing(trace_buffer);
+	hyp_trace_buffer_free_bpages(trace_buffer);
 }
 
 static int hyp_trace_buffer_load(struct hyp_trace_buffer *trace_buffer,
@@ -143,7 +163,7 @@ static int hyp_trace_buffer_load(struct hyp_trace_buffer *trace_buffer,
 	if (hyp_trace_buffer_loaded(trace_buffer))
 		return -EINVAL;
 
-	ret = hyp_trace_buffer_load_bpage_backing(trace_buffer, desc);
+	ret = hyp_trace_buffer_alloc_bpages(trace_buffer, desc);
 	if (ret)
 		return ret;
 
@@ -168,18 +188,16 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
 {
 	struct ring_buffer_desc *rb_desc;
 	unsigned int cpu;
-	size_t nr_bpages;
 	void *desc_end;
 
 	if (!is_protected_kvm_enabled())
 		return true;
 
 	/*
-	 * Both desc_size and bpages_backing_size are untrusted host-provided
-	 * values. We rely on __pkvm_host_donate_hyp() to enforce their validity.
+	 * desc_size is an untrusted host-provided value. We rely on
+	 * __pkvm_host_donate_hyp() to enforce its validity.
 	 */
 	desc_end = (void *)desc + desc_size;
-	nr_bpages = desc->bpages_backing_size / sizeof(struct simple_buffer_page);
 
 	if (desc->trace_buffer_desc.nr_cpus != hyp_nr_cpus)
 		return false;
@@ -197,17 +215,8 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
 		if ((void *)rb_desc + struct_size(rb_desc, page_va, rb_desc->nr_page_va) > desc_end)
 			return false;
 
-		/* Overflow bpages backing memory? */
-		if (nr_bpages < rb_desc->nr_page_va)
-			return false;
-
-		if (cpu >= hyp_nr_cpus)
-			return false;
-
 		if (cpu != rb_desc->cpu)
 			return false;
-
-		nr_bpages -= rb_desc->nr_page_va;
 	}
 
 	return true;
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 2411b4c32932..859a926c815f 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -13,6 +13,7 @@
 #include <asm/kvm_host.h>
 #include <asm/kvm_hyptrace.h>
 #include <asm/kvm_mmu.h>
+#include <asm/kvm_pkvm.h>
 
 #include "hyp_trace.h"
 
@@ -157,10 +158,17 @@ static void __unshare_page(unsigned long va)
 
 static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_buffer, size_t size)
 {
-	int nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
 	size_t backing_size;
+	int nr_bpages;
 	void *start;
 
+	if (is_protected_kvm_enabled()) {
+		trace_buffer->desc->bpages_backing_start = 0;
+		trace_buffer->desc->bpages_backing_size = 0;
+		return 0;
+	}
+
+	nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
 	backing_size = PAGE_ALIGN(sizeof(struct simple_buffer_page) * nr_bpages *
 				  num_possible_cpus());
 
@@ -176,6 +184,9 @@ static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_
 
 static void hyp_trace_buffer_free_bpages_backing(struct hyp_trace_buffer *trace_buffer)
 {
+	if (!trace_buffer->desc->bpages_backing_start)
+		return;
+
 	free_pages_exact((void *)trace_buffer->desc->bpages_backing_start,
 			 trace_buffer->desc->bpages_backing_size);
 }
@@ -264,7 +275,7 @@ static struct trace_buffer_desc *hyp_trace_load(unsigned long size, void *priv)
 	if (ret)
 		goto err_free_buffer;
 
-	ret = kvm_call_hyp_nvhe(__tracing_load, (unsigned long)desc, desc_size);
+	ret = pkvm_call_hyp_req(__tracing_load, (unsigned long)desc, desc_size);
 	if (ret)
 		goto err_unload_pages;
 
-- 
2.55.0.229.g6434b31f56-goog


