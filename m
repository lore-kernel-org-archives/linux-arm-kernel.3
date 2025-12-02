Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC51D11701
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEnANpDqC7DUDnEr2ekaLVgf0v4JzeZNFTwI2/AeuLE=; b=0fZi3PZ04WbKCUTxMWVJnN5G5A
	GBmGYRcdmkFHFYAEgdw9ZlB0iMo1ROlMzuwJ+L4CqoSK7fBCr7IXT1JKLc/WO8wkSMxVMgduQXUD4
	bTu7uTe/IVCcQOVx2u0DKgRKCmsc7lkjdrMQs2QfNYVJt+d9M7UwH0zzyfyPisuovrYmd6YgTaCyX
	mllB+PjBfMmTRoEwIbu/x0mGqbjtCOouzVrklOn38mKo7eszdKF9Y43dZOgS57L5NHiNwjqJkTJpt
	tDFZgqeDNBAY+mSHumlh9JRyB2rownhp4SaRPpA6fZuNSWVdgkE6UQoc2jJCduFU1vhfabFrDllUd
	E+fqEkWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMp8-0000000591N-2Mig;
	Tue, 02 Dec 2025 09:37:30 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMod-000000058Ly-2UnV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:37:06 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477b8a667bcso58839215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668217; x=1765273017; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bEnANpDqC7DUDnEr2ekaLVgf0v4JzeZNFTwI2/AeuLE=;
        b=2Qr7Ix3bRbLow5uOQJ/QUJV7ybzOOvSIggxTTYIfclzieVQfU/sjyysPo+JGkrjN/n
         oGWqFr7Y8xZ1NwmUyg/mGrgVfarCuOKgjAuQej5hzukqiap2rzkXdA+BFBZHgIagXAUE
         /m3RO2Zg5yvzjIf1tkXA2ziu+Yr4IzAMwWRO0Q+yCGXfMFnBy5b1ypQsfyP6pUa6I4nj
         9KJW8f655JQy1qQuvplUM30sbYHFeTAG3SHErwNkql5v0dwbIAC++Ulwt0fj6FI7Rfy0
         cOApk/LbSO0KTkj7AWl89zHKQjaHvRCgEosgVbnGfHEWaFj3dxZYCwzdIr3naOHlWp4y
         Yarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668217; x=1765273017;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bEnANpDqC7DUDnEr2ekaLVgf0v4JzeZNFTwI2/AeuLE=;
        b=gLaq+KnJ6KwobKi3yKPaW7JgWyUi9R4vZSp+WCsXCApUw2nF7vcRbZSiyU4lKJKvb9
         YQkE44KZMO3yqP6mayvvZak/rRZrUJZpbWSgnzA9VtqlDrfeVrlWURUMHxk7GY3/klDO
         w7Jdf1/tJROu89tqJtUerNRGq5woY2MLhoiFtdQmbKJeiwkEQpzxeSDJFYuHwQoAP5gB
         TCc7nXhuuARbbYrQzBngNBfo5/L6aq0u6IMG1QQeiuYArQ11rz5I4dvEhcW7JtTxLzyB
         FsuTD2Hnk/egBQla4WYBZz3DFHQ/wGhIROh9kawdf7euaYF+4s1V8VkwrHM9Aemt7zp5
         fNSw==
X-Forwarded-Encrypted: i=1; AJvYcCUlqZMqvFAkuyixPx+EXITHEgH2jaiXKkbnBm4pQEePsQuO0P6OsQcoi7K+AgjuW2NizXK0WEJ9LXDiRtbKABg3@lists.infradead.org
X-Gm-Message-State: AOJu0YwMoni04TnpzpHhMvCX9wLs/IYOK2AXtClYrH25EEkjtO1xgz5i
	1JQFJMk++5MigQhd+4lD7kD3jDZQ+arZem0Xe+AR+m+JUNyFt/y/VPzSGeDw+mSdX2US6wIvoyO
	FWbSScUiXOaCwjrQNXD7oBw==
X-Google-Smtp-Source: AGHT+IER9UhUXOk0INPeDjv7f9jwsIm3/XwUKhMfyM3LlqPp5ud54kE4SsIEfAALA0iAVFhbNzkMQB7hQXqYJZIE
X-Received: from wmga5.prod.google.com ([2002:a05:600c:2d45:b0:477:aa1e:920c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c8f:b0:471:989:9d7b with SMTP id 5b1f17b1804b1-47904b160e3mr277571685e9.21.1764668216619;
 Tue, 02 Dec 2025 01:36:56 -0800 (PST)
Date: Tue,  2 Dec 2025 09:36:19 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-27-vdonnefort@google.com>
Subject: [PATCH v9 26/30] KVM: arm64: Add trace reset to the nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20251202_013659_811172_594590D8 
X-CRM114-Status: GOOD (  12.34  )
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
index 375607c67285..a28b072125ec 100644
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
index 45b8f70828de..f92e82cbfcb4 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -625,6 +625,13 @@ static void handle___tracing_update_clock(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = 0;
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
2.52.0.107.ga0afd4fd5b-goog


