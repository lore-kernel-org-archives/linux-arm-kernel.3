Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17ECCF65DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5VGkgm1sA7YTajg4sL82LxwMLKcPOrXuXxlizx/7Ps=; b=47R0Q6xI+Ud4CZ2B0IjaRRiSV4
	mt7cKMcuS35z0EQ4ATrpngFe8vqcKP8wjBXUT3pSmjbFp2ewKEf+qIp1YxcmglJr+/rbRsntgzxQK
	Gpe4mFVlGM8Fy0pFAK8/EIyQowxRPAlPdX+N4mk3bxRhv19jnYWcL8Oz2C25SZdCSuq0zZAYvzOkr
	GZpkZP9Glc1cNswiMWjuEdgWzv9/NGxlfJIp0d5Osv6wlEDNeuM1872RhzitlIFjOXlwZDu7RPBdy
	5MLvAOghN/ot9CPm43kdU+xj7Y9jg9QrzSEk1UoMaBR7D1uKmcnRy3uStvhsqYBrpSA5jUvxTfSpf
	jm7wBtjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK6w-0000000CLGD-1wj1;
	Mon, 26 Jan 2026 10:46:22 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5T-0000000CJeN-3r6i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:56 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47edf8ba319so41867825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424289; x=1770029089; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D5VGkgm1sA7YTajg4sL82LxwMLKcPOrXuXxlizx/7Ps=;
        b=MramOsKXWV2VoG9kHNAJzVLZDEC2o9YKmsksS17b8nsPrkLlMA5Vcv0KHkWjhJJmoH
         qiEZk3I7Cub3bu64FzUcSfVjBCltPJdngMF3MH72n/eUKJU3WPhxKgry4AiXE81UIAkp
         sgXdYO0tRUmC+w+44n7o+oIU7CatweP/U9cMX1Wipt13aqDC/dBWrU+0Xf3FcMzujnRO
         yPX2vJQ14caFP3cBHFeMokUI9eSwOv3gAvthhiq1Q9ArEFqORKA0GghdZsBeGxdSBORQ
         O+SHvV9YjpQ162DUWnPc26m2xL2JZQ52ep86JHVHOJi3QxGDWC6byrvkutmFjSjAGE/F
         kbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424289; x=1770029089;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D5VGkgm1sA7YTajg4sL82LxwMLKcPOrXuXxlizx/7Ps=;
        b=VsGS2if9hj9iaH9tiHZ0Qq/IZ1rSSkBF8/aqFyX8MmVkRTAQaDnagn/Ra9GX66NbbI
         nd83a+tamdKFhN1L9Qrj50IwSDjJsE6RdFHUfWMweLuPb6NFqmON6eo5I0edkhoGtk3L
         /Pl+c45E8IfkIVbefXwx5ZkQnkIQlAuhLeqXl+SabYqJargV0LUxEmFzuC0/VZAcluR2
         4NcLbllTWEu0YwCDj1v+riVuzvZ7C62ADLmVq/8pifUIZFEZWlokWrW86TEgeUWr3Iqc
         iHAEKw7A6xKEGCX0DgYi14QxLVTCTJC2Fua5qhQoQ+kqypwRCkrc54I6PjIKTxPdDN8h
         9zYA==
X-Forwarded-Encrypted: i=1; AJvYcCUwCn1r85WwH3vguUmAGGmldbDv1QBOqoqZveFCvyjz5bOIVDiiAQzlAmHOQFxFKR9vVzwt0H8agD/Y6OgXinbl@lists.infradead.org
X-Gm-Message-State: AOJu0YyjzxqPFTIENBsYIPqfFikdgAAvqmQgaxkrkGIZ1Q6zQNSwjQH7
	uRwGva493KKllBoxf13cMzReVjzy/LjDywL/4s2cccafYdPUg0BizY+kXCgB9bZw/N/CuQgX4N/
	ivI1qZSU5RQ8IdJolTNkPdA==
X-Received: from wmfr9.prod.google.com ([2002:a05:600c:1589:b0:47e:db03:6850])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f8e:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-4805cf669d1mr57613505e9.20.1769424289565;
 Mon, 26 Jan 2026 02:44:49 -0800 (PST)
Date: Mon, 26 Jan 2026 10:44:15 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-27-vdonnefort@google.com>
Subject: [PATCH v10 26/30] KVM: arm64: Add trace reset to the nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20260126_024452_102697_8F6CA01C 
X-CRM114-Status: GOOD (  12.28  )
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

Make the hypervisor reset either the whole tracing buffer or a specific
ring-buffer, on remotes/hypervisor/trace or per_cpu/<cpu>/trace write
access.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 352ebbedaab2..c5cb2adde7ed 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -94,6 +94,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___tracing_enable,
 	__KVM_HOST_SMCCC_FUNC___tracing_swap_reader,
 	__KVM_HOST_SMCCC_FUNC___tracing_update_clock,
+	__KVM_HOST_SMCCC_FUNC___tracing_reset,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
index fd641e1b1c23..44912869d184 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
@@ -12,6 +12,7 @@ void __tracing_unload(void);
 int __tracing_enable(bool enable);
 int __tracing_swap_reader(unsigned int cpu);
 void __tracing_update_clock(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
+int __tracing_reset(unsigned int cpu);
 #else
 static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
 static inline void tracing_commit_entry(void) { }
@@ -21,5 +22,6 @@ static inline void __tracing_unload(void) { }
 static inline int __tracing_enable(bool enable) { return -ENODEV; }
 static inline int __tracing_swap_reader(unsigned int cpu) { return -ENODEV; }
 static inline void __tracing_update_clock(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
+static inline int __tracing_reset(unsigned int cpu) { return -ENODEV; }
 #endif
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9df0d37a494b..5acbd451efbd 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -625,6 +625,13 @@ static void handle___tracing_update_clock(struct kvm_cpu_context *host_ctxt)
 	__tracing_update_clock(mult, shift, epoch_ns, epoch_cyc);
 }
 
+static void handle___tracing_reset(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(unsigned int, cpu, host_ctxt, 1);
+
+	cpu_reg(host_ctxt, 1) = __tracing_reset(cpu);
+}
+
 typedef void (*hcall_t)(struct kvm_cpu_context *);
 
 #define HANDLE_FUNC(x)	[__KVM_HOST_SMCCC_FUNC_##x] = (hcall_t)handle_##x
@@ -671,6 +678,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__tracing_enable),
 	HANDLE_FUNC(__tracing_swap_reader),
 	HANDLE_FUNC(__tracing_update_clock),
+	HANDLE_FUNC(__tracing_reset),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index 97e9f6c1a52c..93475cc36640 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -287,3 +287,20 @@ void __tracing_update_clock(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
 	/* ...we can now override the old one and swap. */
 	trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
 }
+
+int __tracing_reset(unsigned int cpu)
+{
+	int ret = -ENODEV;
+
+	if (cpu >= hyp_nr_cpus)
+		return -EINVAL;
+
+	hyp_spin_lock(&trace_buffer.lock);
+
+	if (hyp_trace_buffer_loaded(&trace_buffer))
+		ret = simple_ring_buffer_reset(per_cpu_ptr(trace_buffer.simple_rbs, cpu));
+
+	hyp_spin_unlock(&trace_buffer.lock);
+
+	return ret;
+}
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 1e5fc27f0e9d..09bc192e3514 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -313,7 +313,7 @@ static int hyp_trace_swap_reader_page(unsigned int cpu, void *priv)
 
 static int hyp_trace_reset(unsigned int cpu, void *priv)
 {
-	return 0;
+	return kvm_call_hyp_nvhe(__tracing_reset, cpu);
 }
 
 static int hyp_trace_enable_event(unsigned short id, bool enable, void *priv)
-- 
2.52.0.457.g6b5491de43-goog


