Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCD6CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30SECTmCnn+4kzr0vbGgOTAIATrBPzmK56JstesJefI=; b=OQdEO4sFbkOKww2u4XW7p6kvhs
	EiB8TaKWRHARpEdKOpKtqfPnIBiL/YpqEAsEObu6/oBmOnXnw7wKQipSTYKPkzJOvwLdYZ1dwkeCZ
	yWxh3cJ7NaQ6eY8Rm5mF4uApOnIOyl7C2RbtrmYNtb0FXuuR/EAQqAebAtxo3FlCv813p8R+TDn3M
	gOcEr2nd3lasZJb/sybZ+iBf27T5GeZghDz3UO8VKQa6melVy0H5dzCJEFHCQKHqP1SKXRDXcNkvc
	c7bBipcnp8tiBpJo2Jau4LEsXc4MGmUOQ7nksjCZTXgVAGyWkKG8rMC5H6FdZFB1/ORTi7xRyHCBY
	vgg40+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipo-00000004zRp-0fOf;
	Wed, 20 May 2026 15:27:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiph-00000004zGb-3ROW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 15:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=30SECTmCnn+4kzr0vbGgOTAIATrBPzmK56JstesJefI=; b=lDRGIg7UGveZAjiF5WbaQTjQRp
	dCk89wkYWzdS8SVH9Lsx2OBYNRgrLkOj3mfACsLfCzwH0lEvRwhMpkGfslmTXBteLGj1vta8tBbn3
	JofASuNAKqxXI1cyg1VaDj6GZYpr7bcGaSe4NlqdiIxkjhsRXN/VGUaZwuY9XkWMaD5t1gpV/Kwv6
	nsm2HWQfWwNjrZtaMr1pngNdbTBwx58KKvJjq8rrQzWPdodwiEawaqXZCGJ6B1mMUv/7WDqeFLkHo
	thdk0T8T95zbk2qeiiVPFILvi0SS2SSHcjS40ebHkKJk0HObVcJ1OxmvFkPfck8iisMTOqy+wlyDi
	0LsLk33w==;
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipc-00000007J3p-1YKv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:27:40 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b8ff07df5e4so364095466b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290854; x=1779895654; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=30SECTmCnn+4kzr0vbGgOTAIATrBPzmK56JstesJefI=;
        b=EA7M3ofgmSvgNWISpWaVKdTd40qEfOm6T76sgLnjNTODociNVbJ/66x4to3GkLrqE6
         Wss6xWLxWVgYdsc7UkOPvkvQXjS7JJuCKwDIMYk1++nf0/cnnmdhUG+kab2noSF9CrhS
         E1EsyjHIvzfYjV2ivnZarEVRVWYTgagC7vTg7T2aA106mGj2CjCuogOZezwyOL+mkJch
         FqNki+w4mihmeW46hciQ2IO+ObMcRaUDMnflojUTTs4Aun2uTO3N1iR/CfRTKhrcgRZM
         Lb4sY3ThYjtNQ3hboUotopKotixn6ohj8Lxsp7qRmaAM1wmDSEgMN1q9pvVy0FbGHB/o
         6pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290854; x=1779895654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=30SECTmCnn+4kzr0vbGgOTAIATrBPzmK56JstesJefI=;
        b=EVV5IBW8roMsVr5LESjLEOd5gZs8zerRPIthaSBDfWepQO6JclviIbi+PZfSHdUdYa
         VkbBgRBpnJqz7/MXgkPV7cbniJUAqJSpWZFDcCuGZbpxKkv72e80dLOUYMTKzsFdA7kl
         eYdzf2ed3ge2mQQ7IFWjpfc8l23Ey/07cz/JDaKGXqYjsmjb8lhOWSMHmD7Qm7B8ALi3
         7RaijciwuFUg0vofZsN7KJddhuD8R9+jIgNLuy6qLu/pgbwoKLj6G9fSwkd0Et49doBq
         4178SU+2IBm74xC6aDSDnsIOT78FZk95QFNJZ2wSbxTH2T6/NPoKajts6SgSb8xl79Dl
         Rtbw==
X-Gm-Message-State: AOJu0YxPGdzgKjrGubf8dPRuwuZnAZ1n09F5/Os6JsUDxMEyzwpHYgnl
	WS2tyGvnQnV1/whsYkXokegIusfoD+g235oXKRsFFTXgoTwDDPXJ1wxHjNgJic7Kbl+3C65UEk7
	4ymb4JYM1bGYVGFWdlk1jZg==
X-Received: from edaa23.prod.google.com ([2002:a05:6402:24d7:b0:687:ae7:6e81])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:7946:b0:bd5:18e8:1ac1 with SMTP id a640c23a62f3a-bd518e822d4mr1267540866b.5.1779290853617;
 Wed, 20 May 2026 08:27:33 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:50 +0100
In-Reply-To: <20260520152650.4107895-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260520152650.4107895-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520152650.4107895-18-vdonnefort@google.com>
Subject: [PATCH 17/17] KVM: arm64: Alloc simple_buffer_page using pKVM hyp allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_162737_225404_7B165048 
X-CRM114-Status: GOOD (  18.17  )
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
index 8d7e44e657eb..376bf0fd2a2d 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -725,7 +725,7 @@ static void handle___tracing_load(struct kvm_cpu_context *host_ctxt)
 	DECLARE_REG(unsigned long, desc_hva, host_ctxt, 1);
 	DECLARE_REG(size_t, desc_size, host_ctxt, 2);
 
-	cpu_reg(host_ctxt, 1) = __tracing_load(desc_hva, desc_size);
+	errno_to_smccc(__tracing_load(desc_hva, desc_size), host_ctxt);
 }
 
 static void handle___tracing_unload(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index a6ca27b18e15..680fe1cdf4a2 100644
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
+
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
 
-	memset(start, 0, size);
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
 
@@ -164,19 +184,20 @@ static int hyp_trace_buffer_load(struct hyp_trace_buffer *trace_buffer,
 	return ret;
 }
 
-static bool hyp_trace_desc_validate(struct hyp_trace_desc *desc, size_t desc_size)
+static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_size)
 {
 	struct ring_buffer_desc *rb_desc;
 	unsigned int cpu;
-	size_t nr_bpages;
 	void *desc_end;
 
+	if (!is_protected_kvm_enabled())
+		return true;
+
 	/*
-	 * Both desc_size and bpages_backing_size are untrusted host-provided
-	 * values. We rely on __pkvm_host_donate_hyp() to enforce their validity.
+	 * desc_size is an untrusted host-provided value. We rely on
+	 * __pkvm_host_donate_hyp() to enforce its validity.
 	 */
 	desc_end = (void *)desc + desc_size;
-	nr_bpages = desc->bpages_backing_size / sizeof(struct simple_buffer_page);
 
 	for_each_ring_buffer_desc(rb_desc, cpu, &desc->trace_buffer_desc) {
 		/* Can we read nr_page_va? */
@@ -187,17 +208,11 @@ static bool hyp_trace_desc_validate(struct hyp_trace_desc *desc, size_t desc_siz
 		if ((void *)rb_desc + struct_size(rb_desc, page_va, rb_desc->nr_page_va) > desc_end)
 			return false;
 
-		/* Overflow bpages backing memory? */
-		if (nr_bpages < rb_desc->nr_page_va)
-			return false;
-
 		if (cpu >= hyp_nr_cpus)
 			return false;
 
 		if (cpu != rb_desc->cpu)
 			return false;
-
-		nr_bpages -= rb_desc->nr_page_va;
 	}
 
 	return true;
@@ -212,8 +227,10 @@ int __tracing_load(unsigned long desc_hva, size_t desc_size)
 	if (ret)
 		return ret;
 
-	if (!hyp_trace_desc_validate(desc, desc_size))
+	if (!hyp_trace_desc_is_valid(desc, desc_size)) {
+		ret = -EINVAL;
 		goto err_release_desc;
+	}
 
 	hyp_spin_lock(&trace_buffer.lock);
 
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 8b7f2bf2fba8..afc8c3ea68f5 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -13,6 +13,7 @@
 #include <asm/kvm_host.h>
 #include <asm/kvm_hyptrace.h>
 #include <asm/kvm_mmu.h>
+#include <asm/kvm_pkvm.h>
 
 #include "hyp_trace.h"
 
@@ -157,10 +158,18 @@ static void __unshare_page(unsigned long va)
 
 static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_buffer, size_t size)
 {
-	int nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
 	size_t backing_size;
+	int nr_bpages;
 	void *start;
 
+	/* pKVM uses hyp_alloc() to allocate struct simple_buffer_page */
+	if (is_protected_kvm_enabled()) {
+		trace_buffer->desc->bpages_backing_start = 0;
+		trace_buffer->desc->bpages_backing_size = 0;
+		return 0;
+	}
+
+	nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
 	backing_size = PAGE_ALIGN(sizeof(struct simple_buffer_page) * nr_bpages *
 				  num_possible_cpus());
 
@@ -176,6 +185,9 @@ static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_
 
 static void hyp_trace_buffer_free_bpages_backing(struct hyp_trace_buffer *trace_buffer)
 {
+	if (!trace_buffer->desc->bpages_backing_start)
+		return;
+
 	free_pages_exact((void *)trace_buffer->desc->bpages_backing_start,
 			 trace_buffer->desc->bpages_backing_size);
 }
@@ -262,7 +274,7 @@ static struct trace_buffer_desc *hyp_trace_load(unsigned long size, void *priv)
 	if (ret)
 		goto err_free_buffer;
 
-	ret = kvm_call_hyp_nvhe(__tracing_load, (unsigned long)desc, desc_size);
+	ret = pkvm_call_hyp_req(__tracing_load, (unsigned long)desc, desc_size);
 	if (ret)
 		goto err_unload_pages;
 
-- 
2.54.0.631.ge1b05301d1-goog


