Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B81CCCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXzGf2UIzsE9vtnsTrMx+m6Cqky190jMXVJHzI/NpsI=; b=JU3MV4i4f9vRS7323gkkqsfZLK
	4jUrFkC50zqUEk+7dAtR05LpEUgvcU22kwU0VqbLnCkP1lZjeiPAm+Wje7In1gXAWlEnJfvUdjW4r
	XiNlkX6nxBzQJ8YA9q3H/2LaU8hy4H/1GK/Z3HzUcDfSAkoYfwJ09MQg85EFcYYLrNMOisx2WK3dL
	T1peri1rB8YBFoVMVY+1FD8usD3XlGGDdO1MVg6iYMvmA3rO1G3UTVosEuwX6ZTfjPPd41zGeVomv
	7zvWeqQSs3KbtGAcMxxWodkX4ZGgRxjNIBFGXxBZ3Pp6rvgEfV1PZ0950r2po1Mry3SqPWIQsTsnl
	t9vPc3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIwz-0000000Gzmt-2OPz;
	Fri, 07 Nov 2025 09:40:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIwC-0000000Gynv-1G07
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 09:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mXzGf2UIzsE9vtnsTrMx+m6Cqky190jMXVJHzI/NpsI=; b=OK/a3kDdlbRDAElBxpPN6cyVFy
	GxYja3E+RE4SqfWC249fv0DdksW0kZNSlkDe90R2Iw+P50byCkTXy6bIMQbuYRgZAnYCk9w9ZL9XN
	8r6Cta3mt8xIbXKi40d6wdIGlEgaUANZt3JdfW+SxYEnF/7tR4V7gC1T9ToFuFcZMLgo+2qaZxLWi
	d5TAzXx3krygx2iF412CeTU4+l+4AX4biaPv7plY3aCRHwq3nIH+IHusC3SvJJoIP7OjcYmFMk6dn
	UwaFlipog6tvAV+7xt74qVjycTrUDA/Cbd83OAo+povxPyT1TIMyOGjh33DI79uaWrzYfBqpz25xK
	RfhdM7MA==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI4P-000000064mP-26l5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:43:48 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3ecdb10a612so348019f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508350; x=1763113150; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mXzGf2UIzsE9vtnsTrMx+m6Cqky190jMXVJHzI/NpsI=;
        b=lHsZ9+25s2X/5kcQDd5sgSID20+ukd/8zakytMEliFwBclbsXmX1xyPKHrDsPFZCKh
         bp7EsrGlj14vmn1vI19VaLJXOKJKH5kreOyE0opEXe6YrcA5hinHp7LJvBb/7BzztGUX
         6KrYHOFK7c8sgPIMLih54yG4s3Yea+0PEPwahCSluC0Mz8rLg4WQtlUz7XK+YbJI/e+x
         3OW7TvdHPihlLH+uwM6qtYyQOg2aYRM5hEC7XXRPo6uGJTv61XFT6xOTPVNFQjh9CdZ9
         Y2EnY9D66WunPuiwsFfLQPaMjdgPXFjXgeg6rZOIWy7WtgqGfUNj5OzMlaGlyLGtnwJh
         WrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508350; x=1763113150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mXzGf2UIzsE9vtnsTrMx+m6Cqky190jMXVJHzI/NpsI=;
        b=PnznPUnWFtulzgbsArrXqsf5wCw+t1jusF66Y5XeV01dnFe1M6srT+wao94QrbwP2T
         hWJHlRp7qFgOZIZiOZSXzIrno8aCAgAybhyGxq2Ck3C+Sa+N7VBFthfOf5kgWVAVjCPk
         s3lUBZy2MZ2OjxcLlQjxX/M+rC6s3RaD3UCG6D2tm+6W48sMd8YGwokvJtS7oXgobv4I
         zVRmhmogd3ooGiGa/rg1OR5cuA7AQ1H7+bwBaoWN0ghnpQbg6Tq+lMaOjkEpNoOqazGX
         ou3P1bHhVAfHRS1o3okWByvgRmBh6EB9+wSNsUQyMenaisF0qOAXXPFw169EhwQ9hkuh
         vKeA==
X-Forwarded-Encrypted: i=1; AJvYcCWJUHBLGxugb0p0azYXn7PBV4BD9XJ9Qxen45vbVJeJOdz1hxRUD8vJqrFA2CcpKlob/haP9GUSBB1Vd6wDBbE7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3/edAn1Su3lBs/kjjfUzkQkY95RXTrEvRfJv5S5LHnaoCYOIt
	Tm/8+Crd7Z55UaILLKyBLtldqHrbA2gKhVGtk4/1VnAMK/o8/XVjxcUs8Qq35aMY5x48at1HTly
	HjzvZiFbmwW5jpwZ8Q4p0QQ==
X-Google-Smtp-Source: AGHT+IHkRp/N9BfpTVKwGlWfyc4Y1rtqqdCtN6rhng36wKjtc+HvLOewKvEx2dD8PFbJvsAmqePp4tbQ3CaaD1np
X-Received: from wrui2.prod.google.com ([2002:a5d:6302:0:b0:429:de3f:8287])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1869:b0:429:c93b:7f6b with SMTP id ffacd0b85a97d-42ae5ae8b68mr2108050f8f.53.1762508350492;
 Fri, 07 Nov 2025 01:39:10 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:36 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-25-vdonnefort@google.com>
Subject: [PATCH v8 24/28] KVM: arm64: Add trace reset to the pKVM hyp
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
X-CRM114-CacheID: sfid-20251107_084346_900242_4AC99363 
X-CRM114-Status: GOOD (  11.91  )
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
index b6e016584de7..4faabf398881 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -93,6 +93,7 @@ enum __kvm_host_smccc_func {
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
index d13ab9baceb6..8adad701fc76 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -620,6 +620,13 @@ static void handle___pkvm_enable_tracing(struct kvm_cpu_context *host_ctxt)
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
@@ -672,6 +679,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_load_tracing),
 	HANDLE_FUNC(__pkvm_unload_tracing),
 	HANDLE_FUNC(__pkvm_enable_tracing),
+	HANDLE_FUNC(__pkvm_reset_tracing),
 	HANDLE_FUNC(__pkvm_swap_reader_tracing),
 };
 
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index d146ac3046de..1fd9b32950fe 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -236,6 +236,25 @@ int __pkvm_enable_tracing(bool enable)
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
index 4f154ec743f3..1062b4310f8c 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -302,7 +302,7 @@ static int hyp_trace_swap_reader_page(unsigned int cpu, void *priv)
 
 static int hyp_trace_reset(unsigned int cpu, void *priv)
 {
-	return 0;
+	return kvm_call_hyp_nvhe(__pkvm_reset_tracing, cpu);
 }
 
 static int hyp_trace_enable_event(unsigned short id, bool enable, void *priv)
-- 
2.51.2.1041.gc1ab5b90ca-goog


