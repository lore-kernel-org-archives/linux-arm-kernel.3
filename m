Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFCACA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 10:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Anc7yfsrkZjtmAwVlWu/raMXGnSP49ufLfjdUKF9Bzs=; b=bXgoN305XoYuo3aenGThEZqZhd
	C+drlKy3kScWzCWj77QR3AtaAEq5kSmhktZMbinlxBTBhHn/Xeo1Bjzxq2kiTao0PqbHX6SnH625A
	FFuKeuPNMXYJyjpUcZyCCUaaNaq9Kn2h/K9ZZIkY813egddEz2HKim5VdPGL7tVRoR6xmSs4RCPXr
	FdS+oOW6xg52eFK+M3ztMRfTUdyPdmZcIR3AWnUPWbbXN1D5ylDTdIUbguYrioG1CHrx9u63pWQNy
	Y5hCjXgHDaY9f0ShBNkTx1q9mJQjbDG2pTVWRSN3K9jA1XA1FOXBAAatkSDYWRH1seIFZcOl9lL23
	pVBiGK2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2HH-0000000GYHd-0n0U;
	Thu, 21 Aug 2025 10:12:15 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0Rg-0000000GCkV-1Ehi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:14:53 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b9e41475edso464207f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755764090; x=1756368890; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Anc7yfsrkZjtmAwVlWu/raMXGnSP49ufLfjdUKF9Bzs=;
        b=lFtZtCES2A0YBiaF598HDqTtElP/MPkpjSLyTDDHfrD9nm5dDHrEzws/EUwaHLhC+j
         2+MKLMdJFi+vcNkyEKbZTQUEoW9z9iI5F3HeUtTayM64Mcou3V9X4FCDYWWrxjDldV/y
         IhxuCaqDk2IlP4glVt3p3Sg5tmQSQqfY/7rs01K3NRln8fOLcDyzVpGM+N5qmYqEwDU0
         aK7ix0uQrGXWmJSin1qDAEIKGOHpiyKgyAND/5O5wzopcP4QaR4cYQ+uAYAo0kQ6Zo8j
         5UQ+BQwuY+yXFUpVfohJ2EWaScbCEX4kMInuAdkCKVu/RT+y6b8yGCC/drE57cGWR2JP
         kbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764090; x=1756368890;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Anc7yfsrkZjtmAwVlWu/raMXGnSP49ufLfjdUKF9Bzs=;
        b=iT+1Z9PLnWCmGriwYZrjcbDWCrFGEYPRaC5diMlkPRZ0SIV+DH1B52CS7EpRzCAeth
         stHw+MngtLsw0uDfjAzsFWTfieXXQk0bzvodhUXF245IwFPPLt1bJDe4LgknhrVULSGT
         ALT3sXaME0268FtBNtv6yDl7o3ylbdo5ire9EIEN2M/W41KM97wxhpiATwFa34ON2Kyw
         t1bgAuwrLvwpw/emCD722ZlMJ0h55jLJbKWH10OwVG8HV4TPOfNwjJM+Mg52sZ6n4o/P
         pUqxyMVr5o6hn4wVBokTRE3ciJiCrfSddykFq2w/GOq+KWKKahUhS1kL8mTTrwxgZ70g
         eiyg==
X-Forwarded-Encrypted: i=1; AJvYcCXaHb4+6FaW497WU7/AvYsPT1RPCvuGFiu9H/78Th6/QopBFtCDOwUvAXXCqW3scRZvgoIHL1wUMZXcspLnl9ZQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl1+hXuFWcvHPMH+4ibUDaujxT0El+2HiBJzSY4J0JaFDl5naU
	8rl3E15wvQ9a+LOD7pExCbRiV1d0rKqFup4Hzp476cX5Ycoutm/KCibvUxrDDGXHKoI8GiUYzQG
	P+ak6CJyTtQGv5F7NC9Cfqw==
X-Google-Smtp-Source: AGHT+IFe/ozybAk7VIdtcz4OiVN8ypSFB84+/HqOqWcPlIw7lP5kraFDV++Jsyd/28g3gn+e5nGHBsqAwfa7Z6+X
X-Received: from wmbet4.prod.google.com ([2002:a05:600c:8184:b0:459:ddf8:fed5])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a8d:b0:3c3:5406:12b8 with SMTP id ffacd0b85a97d-3c497836ba0mr1259766f8f.60.1755764090639;
 Thu, 21 Aug 2025 01:14:50 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:14:08 +0100
In-Reply-To: <20250821081412.1008261-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250821081412.1008261-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821081412.1008261-21-vdonnefort@google.com>
Subject: [PATCH v6 20/24] KVM: arm64: Add trace reset to the pKVM hyp
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
X-CRM114-CacheID: sfid-20250821_011452_331513_C1AD1A66 
X-CRM114-Status: GOOD (  12.47  )
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
index 36a263422e4e..a7c5e9fc27a0 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -608,6 +608,13 @@ static void handle___pkvm_enable_tracing(struct kvm_cpu_context *host_ctxt)
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
@@ -658,6 +665,7 @@ static const hcall_t host_hcall[] = {
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
2.51.0.rc2.233.g662b1ed5c5-goog


