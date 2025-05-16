Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE18EC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUFR7mX34CGfKgUCmeQsVwEXViGiZ8lwRuzfDv0/YGY=; b=3I1SW+2Z1y4++0iQi2uT0A1iQG
	phVpsOOE2JZjSu74EZi/samX24z1cQ8J0QuZSRWrsLcBP8q1Wuj2E72B4G5oKFwucBspC/GMe2lbo
	85paVTJN3Ke6FPihYEZ4QF/SYdAiGiq4TNeNyquSnA2QqaqJkwU8vDaAspNw9RuKwFz4QPn3qajJA
	L+79YR8v9WBy7TXI0WovWzxWLRHLp4bNfU46soL/9GMtGYFh6lckLo42QlRdl4Zpgb/+53mCb8z9i
	P25S7tOBdQgaQbFwX2A7+1BO/wUzY0iqNWnQ1elGp0tdfaI1+QWRo1BeYiY53TbFxgIM67WiJvBGu
	wZBxrk7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFw0y-00000003f62-0N0s;
	Fri, 16 May 2025 14:26:20 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvJK-00000003Xy7-2wNW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:41:15 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a0b5d18cb7so1142396f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402873; x=1748007673; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lUFR7mX34CGfKgUCmeQsVwEXViGiZ8lwRuzfDv0/YGY=;
        b=WAlHvPldEwNLbGaa2bzDXV8HcrGtL4857Zj6OC0MYefztj9Dfuq6ae6176Pe/IZC/4
         eNmd37gTWa3plbZ9MANEfdajYjTzsCCJwz3xG0XHhOmKcYdYWCopKmSNe97tvQkr3+SO
         +DQZ6c84kU4uGcR27M13CILIWh5u9eB+c/IPSsZXV4lGqMS1RsUvmUe4ysvIa+m3S5O+
         mHRkmfzxVGRBiHHoJwD1vE/vew1PxF+vT0Jl2FwnlwP7V7XUybQ6/Z9ZLWZLCXAOSoSV
         daukuR41C5phRUdpTZ0KO8+d/ycy9UereugwZdQFTyz6bgjsf8J1fVfeE+BFl5E2mBtB
         Ip4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402873; x=1748007673;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lUFR7mX34CGfKgUCmeQsVwEXViGiZ8lwRuzfDv0/YGY=;
        b=viQlXlvufOz+9PjYg2d0/+GxRC6ZUICttK9sVS6Z8vGbVNb3jfkNyMSIo67+qTU3Sy
         0kXFPOx9uBiYirZ4sEDYQPIvOxd6CZ3DUMKEsy7a0Y3j1TmhTy35RePoWdWOEiKEs2sW
         +xHdHZt7U97z0YE8umS7FG1bsmpA+p5LnHvIiOuTdh81NSQN/Zxs+UTdcsdQZAyuOB1R
         bWegc2gZ7Mg2+wCjmhhVOOGGOgvRNcGbT3aYw1WDDP+CR0y4i1t4HLkZUpMFw2/J3Cxg
         nUEIPWgWg6GZGUTy+kL7vKX0T2nDyvuv87Iuox4PJTp2zA9936sE9qFih807iXDs+HBa
         KFRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkBsC5S0+nNpvQqZx/O5KVNu36N3w7v2VvvIyz27Z7njTfheBfQ/pHJhcFV0xxISFTysJCw7sglQjH+HGVgN5V@lists.infradead.org
X-Gm-Message-State: AOJu0YwVdjPBY/UPH8Nn5eJaBBYkQ20IbxVr/t+G0zBOxqRBko92KvcK
	SM2mrtNg19Q6LNuGPItJAf239GPalFAR4hX+f5tVE5ByQ3rvvFYnLMEW9NWN7tySSCDBf+pP2P7
	IyDj5i1DUpFjEG2wYLA3j+g==
X-Google-Smtp-Source: AGHT+IGVC4fNdiNzu3iXYOkrkXpo832GHFE68H+xlkXG8UXT/PiO3x3xWk/shQQW7MtLSB2W1QhSu6ppGBlSn/hS
X-Received: from wmbhc21.prod.google.com ([2002:a05:600c:8715:b0:440:5d62:5112])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:598f:0:b0:3a2:1f1:c3ad with SMTP id ffacd0b85a97d-3a35fe92b09mr2272113f8f.26.1747402873067;
 Fri, 16 May 2025 06:41:13 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:27 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-22-vdonnefort@google.com>
Subject: [PATCH v5 21/25] KVM: arm64: Add trace reset to the pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_064114_736876_AC762604 
X-CRM114-Status: GOOD (  11.85  )
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

Let the hypervisor reset the trace buffer when triggered from the
tracefs file remotes/hypervisor/trace.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index d122d79718a0..c40820a4b049 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -91,6 +91,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_load_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_unload_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_enable_tracing,
+	__KVM_HOST_SMCCC_FUNC___pkvm_reset_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_swap_reader_tracing,
 };
 
diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
index 4e11dcdf049b..0d2732f0d406 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
@@ -11,6 +11,7 @@ void __pkvm_update_clock_tracing(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cy
 int __pkvm_load_tracing(unsigned long desc_va, size_t desc_size);
 void __pkvm_unload_tracing(void);
 int __pkvm_enable_tracing(bool enable);
+int __pkvm_reset_tracing(unsigned int cpu);
 int __pkvm_swap_reader_tracing(unsigned int cpu);
 #else
 static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
@@ -21,6 +22,7 @@ void __pkvm_update_clock_tracing(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cy
 static inline int __pkvm_load_tracing(unsigned long desc_va, size_t desc_size) { return -ENODEV; }
 static inline void __pkvm_unload_tracing(void) { }
 static inline int __pkvm_enable_tracing(bool enable) { return -ENODEV; }
+static inline int __pkvm_reset_tracing(unsigned int cpu) { return -ENODEV; }
 static inline int __pkvm_swap_reader_tracing(unsigned int cpu) { return -ENODEV; }
 #endif
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index c73229fb5e1b..65260bfd33ac 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -605,6 +605,13 @@ static void handle___pkvm_enable_tracing(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __pkvm_enable_tracing(enable);
 }
 
+static void handle___pkvm_reset_tracing(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(unsigned int, cpu, host_ctxt, 1);
+
+	cpu_reg(host_ctxt, 1) = __pkvm_reset_tracing(cpu);
+}
+
 static void handle___pkvm_swap_reader_tracing(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(unsigned int, cpu, host_ctxt, 1);
@@ -655,6 +662,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_load_tracing),
 	HANDLE_FUNC(__pkvm_unload_tracing),
 	HANDLE_FUNC(__pkvm_enable_tracing),
+	HANDLE_FUNC(__pkvm_reset_tracing),
 	HANDLE_FUNC(__pkvm_swap_reader_tracing),
 };
 
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index 32fd889315f0..b6d97237a7a0 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -230,6 +230,25 @@ int __pkvm_enable_tracing(bool enable)
 	return ret;
 }
 
+int __pkvm_reset_tracing(unsigned int cpu)
+{
+	int ret = 0;
+
+	if (cpu >= hyp_nr_cpus)
+		return -EINVAL;
+
+	hyp_spin_lock(&trace_buffer.lock);
+
+	if (hyp_trace_buffer_loaded(&trace_buffer))
+		ret = simple_ring_buffer_reset(per_cpu_ptr(trace_buffer.simple_rbs, cpu));
+	else
+		ret = -ENODEV;
+
+	hyp_spin_unlock(&trace_buffer.lock);
+
+	return ret;
+}
+
 int __pkvm_swap_reader_tracing(unsigned int cpu)
 {
 	int ret;
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index a6664a03f8a9..5c115c3a26a1 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -301,7 +301,7 @@ static int hyp_trace_swap_reader_page(unsigned int cpu, void *priv)
 
 static int hyp_trace_reset(unsigned int cpu, void *priv)
 {
-	return 0;
+	return kvm_call_hyp_nvhe(__pkvm_reset_tracing, cpu);
 }
 
 static int hyp_trace_enable_event(unsigned short id, bool enable, void *priv)
-- 
2.49.0.1101.gccaa498523-goog


