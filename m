Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C20E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8Aoqn8UeoyisKs5heWso8axoywS653i0/sfLBOPKoY=; b=XwxkSq/FdeqFB8VMk9LvedCMd9
	sN3j6vUYugRrW4MaqmY2cPipLajy/sbFPEB6GyqrNoIqEuTmdMgGwcy+zUfWLNeCOBDAJvaA06Ihc
	YHRJyjI7AVRkFVe430MmX9tg0a4sX0yKKf/Zeb4C2V8hkG07OBKl5V3V1xNYZyYpIsvWARBQbTL8Y
	yQBdSfBSwxrE144dzYit6XcnEQp2z+8YtNgkSXFzqFYMhEOYDqLhDUCQ6wHsjAbAVSj4gSP6eKf6+
	lnZl+s4XzGSpYrGPneUUrU9okLwjQL3gtcP2IhTnkvW272uXobU8Hmgqj2zihYip5v3gUYkkVWc6P
	+t7eA43g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5a4-0000000BW2Y-2SNs;
	Thu, 19 Feb 2026 15:04:40 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5ZN-0000000BVDH-34T7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:04:01 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48069a43217so9676745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513435; x=1772118235; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s8Aoqn8UeoyisKs5heWso8axoywS653i0/sfLBOPKoY=;
        b=KVNOZm/eU4lRNZlpEPbU7kePpsbSHPpOl4Ufxwgnrv12ccwA3E/O64wIztJggg4NRD
         gznNFx+NZ2wPepmcXxwG6hlTDBZEHWAXDxIbY088+iA0YxQ28IqGhR1cw2Q2BltiG0LJ
         TO48VWStjjrPVoCzdF5ncTXhE/2QS6CMUnTVv6xK1xtnD26k+0R8lRkizalgQ4oOlNQk
         ALs2ViFxSfg5HUtajt/C3YIPEJsA2QLKMjr+DUCSWBze9mM12h4HLVjj9xJdNDaOKxQ9
         xzut8RqKzWKOZNGI7B4NbR+XOx612ofMG6wCpr54ASyxfNzCRFeMvEy5kFAgudeEorRq
         66wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513435; x=1772118235;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s8Aoqn8UeoyisKs5heWso8axoywS653i0/sfLBOPKoY=;
        b=bYdMdQo4ouYuN+X1AFA+7BiT/GRbgBMNQz8TWfqc8KyE3hFpzlvUMyrVEZGguxiUJh
         pyIztVakKOIRlbKN0qgkA8EfMbpGWNni2l0CfAPIQJMBzilJZ6T34rZjLyyYZmjggkw7
         jJ6egGEZ/+GhQyQXOvf0F3pqu7/4gCzaRCrulN8JQKDsuoDSZkdR1QXCiGFY2mQqw1XL
         Ro2a35FO2gPypSKBeAWqxxqwdXoKgsCb9U/LWkaaEn4Js9rXUwWZInTbQhiBeztu/fx6
         Ki63/2duq7aXP8XxVJdyeAFwBVIoF1zaKVTxyuLss02w56m0/7wZy7V82HToHodYHb9b
         ttXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeoNFUTDUSKb0ZXzWgbUWrRVSMtdA+kKIDUzhxbgY7sAYm3lGFfodhM5EXzk+EjpIehTN/9BTNL+H6IJ4qahsN@lists.infradead.org
X-Gm-Message-State: AOJu0YwOpR+xc+0NXV+HCCOTqVDf3jOU+XDUQcXB9NVeivhVFdfhPI8+
	hg0z+3khfYa2v0SCMmG8gJzenLPSjUqS2wvz8UGOuvGo3aTQY67Rc70Des1EIhwxwl+Ck3F3eI1
	U/8VS+9pnhgfCKa1dwq2XSw==
X-Received: from wmcn19.prod.google.com ([2002:a05:600c:c0d3:b0:483:6ff0:11a0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:314c:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-48379b318f6mr273945815e9.0.1771513434848;
 Thu, 19 Feb 2026 07:03:54 -0800 (PST)
Date: Thu, 19 Feb 2026 15:03:03 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-27-vdonnefort@google.com>
Subject: [PATCH v12 26/30] KVM: arm64: Add trace reset to the nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20260219_070357_874986_4D40CE22 
X-CRM114-Status: GOOD (  12.21  )
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
2.53.0.335.g19a08e0c02-goog


