Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87750C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePdWTj+f7Kqu7+m9jiLxrLe0rAI9On0cOEvt/oNt0Dg=; b=R0/yNX4mFYtWkJX/ITtCtFUb7Q
	y3hajgYi0vswxm/RIHezj0xW5ws7Ps2gSBrG2aa/E1pI5dek2xccUjHfuRrRnWApStH/hr1LtN5n1
	NBLl9CYBzuHKNm982U6sCziFeuPfhPV/th+gv54SSgBWSsCqWIyEvRwmUKBH3ZQVNkHyEMBUCQzCp
	RmQy/brpxo5Q+hXIzcPJbdOZECpqrxpJfLbfA09Se64ebPBlXNe+aGtHsw6BVWuCwuwww9zuikmOu
	AW41KNvBhI4bQtdlBvTOc5lxXkDyp4oUDRZbe6cU1d9MWzk+dp5ku1J7tRXoqAusVMlE9g7Bf1Uv6
	cI6BCZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQiE-0000000DZDy-3OBz;
	Tue, 06 May 2025 22:24:30 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLTq-0000000Ck2s-1Qgi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:49:19 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so45951935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550156; x=1747154956; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ePdWTj+f7Kqu7+m9jiLxrLe0rAI9On0cOEvt/oNt0Dg=;
        b=fQaewe/I2TKNtoePfLkInfwOIme6xIAW6AbFM7JRMCNRHvYo2czLPXhu5qJ+ibQeud
         NaC4WBMmXi0zn5x9iB+isTzd/i01vk7Dr8gCjL8ljRJXipEWictK3oVC3KQOHOGStAhL
         j7ujA49Rl6TEGyx3IyWhTwgEH+AGRNljB8O7XzWpFCUodtga5fZTZhvprChVREaBb3la
         1N8PmGlYGikepyovDorGWe5Bul/pekPk4Wf17EVuw6oOGbAN9WFHS1PhMZ38ZqBzWfOh
         157QL8Cmw9h1SrCEOmSMP4jxl2Ciox/aHBON4ydtnofOZFMA0gacKWX4C52J6zpc1XIz
         bg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550156; x=1747154956;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePdWTj+f7Kqu7+m9jiLxrLe0rAI9On0cOEvt/oNt0Dg=;
        b=PPi1lz+CEnGbTGafl+b3D+HHeb2V+Mu/wINx5hAuzYiKJymdalUpsQLOUqVnqONai0
         2rUMMPueIBJh5g6gFAwRjEs1EvW846n3auEkjEMq14Le71KkApOYfYCbzLXWiB859NJq
         FHNPFL20c8G9yeAT6ojkoZdgOcXiTyOFcnes538O/zE4iAmFUpwGlKpiy3px5UXMF1Dk
         8DVFTSE+GAEda2yT93p2UICQm97sglcAoWwZMkbsMARd20tBqmx+LpfjiZCGh1uHJDU4
         t0DklWKBiBF4HZJyEoepeJr1EBt3H+Dhu98QCrgHgkASjkVcxk01pxH7u/8moSzPje47
         NHKg==
X-Forwarded-Encrypted: i=1; AJvYcCU8NT3+NOuePpxU1oqrpaN7+yit6r0WoVXC3Dy4z+CnnFPv2EgJHWv5uDC7nM3uxsnGXjEVk9q8zukeoBwJa+b6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfo7MyKLzUGzuzZYKU2Mc3h0JiLHgFoNOqX6BH0nmt1CkEBRfo
	7LFtlG0xbbCQm3d7zs8ffkVyWhxPR3ovoFtrXiLWbEw/Bva+dSHx9+9S5xOQA6UgawObY+Z6kfg
	EYVp2sBVoUy+Aw9P7vA==
X-Google-Smtp-Source: AGHT+IE88CHvP/t9XPxkguhLrXPQmG2IBHH3TFTt5TaGD8MyAacD97EJhOSmz1XBYyXVpAsyCZjhZpA0WwLhBaP+
X-Received: from wmbhg21.prod.google.com ([2002:a05:600c:5395:b0:43b:d6ca:6dd3])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e48:b0:43d:98e7:38dc with SMTP id 5b1f17b1804b1-441c48aa36bmr110506395e9.5.1746550156444;
 Tue, 06 May 2025 09:49:16 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:16 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-21-vdonnefort@google.com>
Subject: [PATCH v4 20/24] KVM: arm64: Add trace reset to the pKVM hyp
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
X-CRM114-CacheID: sfid-20250506_094918_376856_21031AE1 
X-CRM114-Status: GOOD (  12.24  )
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
index 516d6c63c145..c7ad36212a7d 100644
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
2.49.0.967.g6a0df3ecc3-goog


