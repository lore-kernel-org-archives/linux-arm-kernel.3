Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB8CFCB601
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZNlRO5e/MGzFMVxx7Ks/cRDmNOcF7u1/X5pARmyFgQ=; b=c0+bMmAq6M3YLCymuwL0QyH5sb
	eJtH55cSIC2ken+fWWSMwUQv8Vyju0uFXMfSo7VC+dp9HPv08k52s/z09AiaItxfIcgZeXAj46ZWs
	rd6f6gzSupRGj6ErUBz94TXeYrhfVXjCZFLKgqPwZcv7WqVR1MpKSUnfxnSlKMgdp3LDwKUlp8puL
	baMlxQX1gUDOFGNP4p2rOjbpGMwtXwBo035y8Wmx1jsO/a7/QVbWEuB+yp/K6e6Mk5WQjzfKuBl6I
	xe/wlZnqHhfWGCusgXWueJlUlX1cFadlQCWSaNswdb79aNLAbMKq3PgODSY4c/5exDSgdbcZrmO20
	qe7XmJkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWIa-00000003wDi-2wys;
	Fri, 06 Mar 2026 14:37:04 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHt-00000003vHt-1ZaR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:27 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48379489438so93305155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807779; x=1773412579; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wZNlRO5e/MGzFMVxx7Ks/cRDmNOcF7u1/X5pARmyFgQ=;
        b=Nwa3b+kARZG9xL7nAF9iV4ctABlyOSe2rmD0xliVO/rYpI2K96pp6Hfbq8v+cW8n31
         apztfebw9J166UVTPvq2GHUFIyhArzJFVNbgjXQUB8oEXOOdssPF0jv8WPVViXtSyEOc
         ckhRC3aVTyRcW5+v/OoGTbFiwE3MVGC4arP6cwMC89vSF/ARi9c7GYt2ZG5GM/MhnA/e
         dlrrj4TMIwORgrGF0WD83ZkCmYHQ/cLG9jEmPx53heM77pkquQMIjsT1n169v0Dqguau
         4db7f50hqat1rzYsyJHNihA41N5K5u6nqEpcOBp+X2Ig1iSYMIzvTmPOD4i1uqTsgpsB
         vASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807779; x=1773412579;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wZNlRO5e/MGzFMVxx7Ks/cRDmNOcF7u1/X5pARmyFgQ=;
        b=qDTnCG1Rn8Rcc4clwNg60C8QcaEZWl4EgN9Zbbq64WswRcvyW9d1cAVKyPKOZdZ7TH
         WIl1wIvui6cpNYN3snB3DEyMH8AMF4yR1pVoIgHPrM7FbNtRnACZaLARq8dyzr4rR6l0
         2ZtMhsSIlR1d+hvRnep6DKO4Yi88kXuGU2/EcKA/npyg0e6KvMCJYiU8bUbLbAhf0whA
         oN4d5ol5mBsFeE3q/c702E8kJ7/glVcTIYOnkRwr6EERc/zrKhjo/QEg7GdvBKGCYGOb
         hV45577W/TJSZUJZYBkyGqA3u2xIu/Wahq3DcQWRZ8Ay3g8eZ5Gt/W5Jv71dsmQ3Z/Nu
         k5gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw0TS2UcZEs+LSy1xYvgRkZe1clzDhBDLlVGQCDp6NsiKS6ytXK8bhMM0R/h8QUr2w9vJj0euS5ELXlI0a62KM@lists.infradead.org
X-Gm-Message-State: AOJu0YyhsAWYVmBg8z0nOpJIZPXAqYQiINU/yN9ZKKgDkYCsPZBq3XpC
	nNUi9jgYujGfqYNdWCkMQsAtXN6uSRpYUSv7uF5yW3kRYRkrh8MfPp+o9+n8xA4cSf0A6sa9owh
	d3qBia4MiUKb8/ibP+pg2nw==
X-Received: from wmbdv11.prod.google.com ([2002:a05:600c:620b:b0:483:7c8d:ed1d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5253:b0:483:456a:514b with SMTP id 5b1f17b1804b1-4852692f158mr38056235e9.12.1772807778854;
 Fri, 06 Mar 2026 06:36:18 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:30 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-27-vdonnefort@google.com>
Subject: [PATCH v13 26/32] KVM: arm64: Add trace reset to the nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20260306_063621_459278_8D77F501 
X-CRM114-Status: GOOD (  11.68  )
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
index 9c4fe3bfbfff..66abf77cf371 100644
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
index 02d5271199d5..9b05f0c87586 100644
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
index 2c8e6f49d7de..a6ca27b18e15 100644
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
2.53.0.473.g4a7958ca14-goog


