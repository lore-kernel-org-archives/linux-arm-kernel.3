Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA08D7976B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klNtZXITSNnjVXJK4UiBawa/P+I9Z7pdBnip+Ybnk/g=; b=EstmR41huZsesNlzyMBF44isev
	xGZf6FXz/SG4zkZgtQHvzbgPoq5GJGNfn7Iy7leHOzCRXwd6nCymAy0oEyo1Ag1AADR8si3Cd+TL9
	tv04CAjyr42+gV4cNjuPja4TOeYltApOCw5fASPMYjBuGnpjfczNAOc3y2DDB9MgfK12DvOaaaH57
	X/OgkyNPCqWZLnka8rfSJzLo2Ef8P3FzKbme5TNReXsX2J9Sndtsjlk/+2A5IN63bMNXTvsbnESQD
	u/F09p2co+UBEoX1tViUk1CqRx9b29Aw/HqUSVsZAQITmn8riXkjMuYgw/GdGKKdfDA5NiX7NtZLl
	z++UENMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB43-00000002cyI-0FWr;
	Sat, 31 Jan 2026 13:31:03 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2q-00000002c4q-2RiY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:50 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-658bd4186b2so3741568a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866186; x=1770470986; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=klNtZXITSNnjVXJK4UiBawa/P+I9Z7pdBnip+Ybnk/g=;
        b=assI6Y3QONN8R1CG7eeE6XhX8sD+4AyCOkOhW7YxqzKR+qUz6OQZ+Cjc2Jy1rf/Cdy
         7fPU5JEbtCRkIa4XLn7R97Xr20xrOypXgJdwRvsyatf2VI24t7WPrOlNWzS5A04WM1ob
         PnMjT42awHTe+1eOnM2O524D8tFB0dW/t2DTWlIGl+qFuMVycsd9Ufz4qRjxv/KOQ45W
         mA1hEcgiuujNaPntWj3M1k9iJxy2LvsGQGBbZ+mR/cASkjWZoBtV0J4XYcLeQYb7UFXJ
         eAKN/gSewad8G8lTOzzTgmnnPUQPNGtwQxAbtcbsIsdQwtG4MiY5ertMvdQMmG/aVu9e
         dz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866186; x=1770470986;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=klNtZXITSNnjVXJK4UiBawa/P+I9Z7pdBnip+Ybnk/g=;
        b=M4U2M5Y2g2raqbbI+QxbtYyO28W6iW5zhG1IkvCO/2l/qSriP+IG2JgSJr/B7zur64
         0VhVyLBZpD52az5G0N0N/gWtbYsK1yES+BrglMVtrGKIFTyDJ8y1qCVJSA3dFti+/elo
         BeRcnAmSFNxplF98HAybsXkszKcoPaObN+WqZ9Vwhdobboxg1OZV/QfqyJajj7IEYRp2
         Wu5YlQFbdMVowUVuLL71Jv1ZPiOUXmhV3I66bBOsIylrOIn44yi5gXSrlH6VNup+wKIS
         4xE2aBgapiMVJq4CcdxNEMGaMREy/Fwbhxc+P90fivLBNpGo0osJmVkfVjk9Gf0CgQXw
         ky6w==
X-Forwarded-Encrypted: i=1; AJvYcCWHALSGiwXXgVqFeUy5V6jf7hhhvBLXM9kgR3nLilS+/dhQNhaUbaqJq+Cj8rzRQVWfyFAkEnBrBMhkY09xnBFm@lists.infradead.org
X-Gm-Message-State: AOJu0YyLHyA50lzCxni7t6SAzR8hIEClBpFOHj7l2XxNnifeW7xBq020
	5YlSocSCYhno/3vTzD+oHTpbv74pQa/iDGSrDD45489uj+iOVQjbOL4ZGMsKv8qhIZlQIKx18Ok
	3O3GfnpqsRT+mm4A4Je7k4w==
X-Received: from ejbze20.prod.google.com ([2002:a17:906:ef94:b0:b73:9000:7e99])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3c92:b0:b87:225f:2e74 with SMTP id a640c23a62f3a-b8dff5dbcbbmr368357266b.14.1769866186355;
 Sat, 31 Jan 2026 05:29:46 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:44 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-27-vdonnefort@google.com>
Subject: [PATCH v11 26/30] KVM: arm64: Add trace reset to the nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20260131_052948_644379_4FC01A68 
X-CRM114-Status: GOOD (  11.59  )
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
2.53.0.rc1.225.gd81095ad13-goog


