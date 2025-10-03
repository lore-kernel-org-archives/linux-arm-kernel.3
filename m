Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0944CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKoVOt7SfjBg9tHla8UyfyracQ+ttFmAkYCdQchY/Cw=; b=ojR+iGRyHTr5mXnVATwTN+vsaJ
	C2Q0Tz+kdBYBXCJYKbtofBCpL5SUQMXiBLV/wUea2Zx9XQIMBv9y9TvWpOPSO4bdiNgwfHTNLWFNj
	ByXc4iKTGHsNIiZtVkT3OPjH7fesWpDdOkAYHnIKqG2d5cP2D4WaY2oA4LC7hVSyHTdKvLQbw2XB7
	5noTpvz5FbgTUrffOabXwRrOECj/2Mu6ATFEZdOazNT9TalPYZgirrtomE1y3xNob3HLKtgA6aNDR
	WWJqx8TLrh+iB/7Gcwqll8p/NKZlagWQMIbF6yQ/wRwDcbVpaH2QPOWN+QJ9jtPOfYMsYz+1mdmD0
	pm8NELUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0q-0000000CRMW-3ltl;
	Fri, 03 Oct 2025 13:39:56 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0I-0000000CQSn-2LLM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:28 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4255d025f41so1512192f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498759; x=1760103559; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CKoVOt7SfjBg9tHla8UyfyracQ+ttFmAkYCdQchY/Cw=;
        b=W3sVkONRty+brcG3M07zSwNTWpoGJAJtDyyKQrFl9kTg6AgSy7moXznS+l26ph/M2L
         nzSIhXIwDh7Cwt9p8sU5YJ1heVLI/Kl7Isww5SEhV9HxjTMg2ufTxpN34IwwP5lDnRj6
         frNwxKQCziWAUIZWbZqbxFiciPiHy7qYucRjcvfk/7qQzBMJLOlPSK9ds7F0ZeKp847T
         6PoeNLxMsVLxJd2osiY+aTlUXxgp0JJcBAEMO+fnaMzOpcmCtWPLI0RX1+kPcnqdEnfP
         joQSzvLHysCsfPWfRMVhjJnP8VgD7GrJ3ylCQgyy+rnhRxP5HZSgP3Ndcn/1xKYWuJe1
         xwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498759; x=1760103559;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CKoVOt7SfjBg9tHla8UyfyracQ+ttFmAkYCdQchY/Cw=;
        b=aCJfCSRkGPB/lmeGOSDf//MHcH3vc0EfgT1mmoEdDz510OmzbS79fLefww5LhqIg2h
         JHgsahzIaNf6uVT+pSugVr2CHxc7gIgbio7bbsyuYEa0ePpzW9RIIfHnv4vMI3GQwqOO
         BPWYBwnP56b06wMd2iudCErxGH0EReloWiXR704gwMYuz80GV6+AS0GaJlsqiRg50dV/
         aHzfB98DTm06ntSa+d3A2/borb/fjU+KlwjPxqF7iK9WuPtdd5Ffa+2Ya3tOIs3+pjuU
         Kuh1+qM34uv79RZbr8WVel+1h+/Injgu0HixZoNomiUx39IbHanfcRE25g3Fo95B3iyq
         lacA==
X-Forwarded-Encrypted: i=1; AJvYcCVUdYPFnDDbYqzVuTiDr1LEy2rZzk7sUvydr7SEiUX19RK82d1vOfP1fPvUj21L1iuQtCp3tWcSlGP7mnsYdlSD@lists.infradead.org
X-Gm-Message-State: AOJu0YzwR2MoAL91Bjg7mbH0B2Wqota4VkiixWveQykrsiyGD3k5R5hj
	eDLzxZ+r3lccc+1sHYM32rWCZ2PbblJjAbWAWkYddSrXlXr4RBuWdUx1ixV0ZLclgTBY51+s+P7
	yXe6iyU20k+4VOTwkMQRgyA==
X-Google-Smtp-Source: AGHT+IF3XrIOuZLzr95zLbd7FnCvuwGAUE/NKipTgwAL9Vm4NhQ+xCaEbNPY72ptqM5YQLLSLemYx+UklOwNUX8Q
X-Received: from wmoe6.prod.google.com ([2002:a05:600c:4486:b0:46e:67c8:72a6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3551:b0:46d:27b7:e7ff with SMTP id 5b1f17b1804b1-46e7115c811mr23867565e9.36.1759498759672;
 Fri, 03 Oct 2025 06:39:19 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:21 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-25-vdonnefort@google.com>
Subject: [PATCH v7 24/28] KVM: arm64: Add trace reset to the pKVM hyp
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
X-CRM114-CacheID: sfid-20251003_063922_701579_9E97A4C9 
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
2.51.0.618.g983fd99d29-goog


