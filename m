Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FEDF4180F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KM8z/si7HcTp05zjHIB0T7h5Dhh3bTdr1CGW99HQcs=; b=WlL/bWwK1Pk3vNM8eXbVo9B7G3
	ZVYiMLRpvVUtIT39SXxb4Rl6bh6x8oXbcGeoPNEeFMMtWj7MdWl3rGZ4mlfEprH1sqNkXH+giAQTB
	GHNKvoI8Viu5ldoDdmqcvtZV330eRvXJHYOs5scLjHOeiAJScqc2ZtAet1+Xrl4NgmxQmbHkFziC0
	/aMbWySvItRT4MgsG8YHaNkTWDkO94WeQOSNInmMPWwT/yAwe6mn0GQGDKp3M3vFBtpTpM7/0OZB9
	3JUWcMXIW3vN8ZZ+86TqFzVnBKnGkm0AHMhgYav/hSd30gmzVm4r3WcjGxa0SXWq7ZKknZ1ZWenYl
	DxcbK3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdRP-00000007hkr-3fBR;
	Mon, 09 Mar 2026 16:26:47 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdR1-00000007hAm-3pIp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:26:25 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48531e6012bso15162965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073582; x=1773678382; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2KM8z/si7HcTp05zjHIB0T7h5Dhh3bTdr1CGW99HQcs=;
        b=VhXq8bpFhXbsNws9G8MjLXRWFJOEpNOdwqwP01rHlj2ywqJGv2mKDTHveCmrquhSgX
         4nY8dUauL3fgYorYPBZzCms9Lpp4zghwDrwe2AZQldyprV+1pOa2/ZYkLSteLOnUDTOz
         WVN1YVdpL8R+ClmmfNoNCdzIejmOhqvlBaIPO9acii9JwKqMBnm/D+z8wRb73xYd5EM8
         gemlIvN2lasZSfYEPYWBtVyUCjRcZnTmvgzm1gv42uTAIWImNfHoJOps70kvfBDHesoL
         Mug16olge7D2Dlugn+x7RtRHrLvrXBGKsf18XvfWikAjrAsrDH0d4WXqkZbB7w7xXxAo
         lVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073582; x=1773678382;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KM8z/si7HcTp05zjHIB0T7h5Dhh3bTdr1CGW99HQcs=;
        b=ByBEoEiY1AioR4+oYcmsTqFlXzgbOh+NR8/vjiOCFHIL0y1pLvWazZxaDYVSSF8Jrc
         XSh7PQBJhdHvZzoLtk1GlrNL6m3oMa13z6tvyN1fqR+7bri7eCkBS62W31TVIS9FLFs/
         IkFZ0XnOiBj9DFTnot536gB6N5irILAqnoNi+mIkbvPtGhGI/eH7yIOyg3QB8xGyo4YG
         rnclMWd32jSdEABr4DNj4BzXp9WwoZ3HbNhfziQBtW05mG1Uc06t8SzmmMRINO5I+Tlz
         JxuYWohCHgUMrDvzmDjKDcwX2J/6PBXPc8D+NU8ZtCzkRiSX6QScJzn2Q19uMZT6aU2D
         3XIw==
X-Forwarded-Encrypted: i=1; AJvYcCUSfhVu59kswaspiT0J/DyiuQp2l+mrWS/bIsnq1NXWU+AZAxxZG/qGufwq25FHYK5J6zNUh3LtoRzTuAtVyNfm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6d3KV64ffnqNzGMcfd3lb6gzcYSA97JnzuIeG1wJPeWkP0VS0
	HYVFbCbME5Eqdh5b6OyntRrQ9tpp3EnpVsU6EDzN90wEppeqzUlp0aXYNT7TRA0JOlywmE7epCr
	kBOxVREsLsXf1IP56x5WvnA==
X-Received: from wmv11.prod.google.com ([2002:a05:600c:26cb:b0:485:3539:bc05])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:138a:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-4852691c5bamr216470615e9.5.1773073581753;
 Mon, 09 Mar 2026 09:26:21 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:25:07 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-22-vdonnefort@google.com>
Subject: [PATCH v14 21/30] KVM: arm64: Initialise hyp_nr_cpus for nVHE hyp
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
X-CRM114-CacheID: sfid-20260309_092623_993051_F0F53E25 
X-CRM114-Status: GOOD (  12.62  )
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

Knowing the number of CPUs is necessary for determining the boundaries
of per-cpu variables, which will be used for upcoming hypervisor
tracing. hyp_nr_cpus which stores this value, is only initialised for
the pKVM hypervisor. Make it accessible for the nVHE hypervisor as well.

With the kernel now responsible for initialising hyp_nr_cpus, the
nr_cpus parameter is no longer needed in __pkvm_init.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index 76ce2b94bd97..4bf63025061e 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -129,8 +129,7 @@ void __noreturn __hyp_do_panic(struct kvm_cpu_context *host_ctxt, u64 spsr,
 #ifdef __KVM_NVHE_HYPERVISOR__
 void __pkvm_init_switch_pgd(phys_addr_t pgd, unsigned long sp,
 		void (*fn)(void));
-int __pkvm_init(phys_addr_t phys, unsigned long size, unsigned long nr_cpus,
-		unsigned long *per_cpu_base, u32 hyp_va_bits);
+int __pkvm_init(phys_addr_t phys, unsigned long size, unsigned long *per_cpu_base, u32 hyp_va_bits);
 void __noreturn __host_enter(struct kvm_cpu_context *host_ctxt);
 #endif
 
@@ -147,5 +146,6 @@ extern u64 kvm_nvhe_sym(id_aa64smfr0_el1_sys_val);
 extern unsigned long kvm_nvhe_sym(__icache_flags);
 extern unsigned int kvm_nvhe_sym(kvm_arm_vmid_bits);
 extern unsigned int kvm_nvhe_sym(kvm_host_sve_max_vl);
+extern unsigned long kvm_nvhe_sym(hyp_nr_cpus);
 
 #endif /* __ARM64_KVM_HYP_H__ */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 410ffd41fd73..1371f9b3ecea 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -35,6 +35,7 @@
 #include <asm/kvm_arm.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_emulate.h>
+#include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nested.h>
 #include <asm/kvm_pkvm.h>
@@ -2465,7 +2466,7 @@ static int __init do_pkvm_init(u32 hyp_va_bits)
 	preempt_disable();
 	cpu_hyp_init_context();
 	ret = kvm_call_hyp_nvhe(__pkvm_init, hyp_mem_base, hyp_mem_size,
-				num_possible_cpus(), kern_hyp_va(per_cpu_base),
+				kern_hyp_va(per_cpu_base),
 				hyp_va_bits);
 	cpu_hyp_init_features();
 
@@ -2674,6 +2675,8 @@ static int __init init_hyp_mode(void)
 		kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu] = (unsigned long)page_addr;
 	}
 
+	kvm_nvhe_sym(hyp_nr_cpus) = num_possible_cpus();
+
 	/*
 	 * Map the Hyp-code called directly from the host
 	 */
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 5f9d56754e39..f8a7b8c04c49 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -30,8 +30,6 @@ enum pkvm_component_id {
 	PKVM_ID_FFA,
 };
 
-extern unsigned long hyp_nr_cpus;
-
 int __pkvm_prot_finalize(void);
 int __pkvm_host_share_hyp(u64 pfn);
 int __pkvm_host_unshare_hyp(u64 pfn);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index e7790097db93..8ae3c348ed81 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -486,17 +486,15 @@ static void handle___pkvm_init(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(phys_addr_t, phys, host_ctxt, 1);
 	DECLARE_REG(unsigned long, size, host_ctxt, 2);
-	DECLARE_REG(unsigned long, nr_cpus, host_ctxt, 3);
-	DECLARE_REG(unsigned long *, per_cpu_base, host_ctxt, 4);
-	DECLARE_REG(u32, hyp_va_bits, host_ctxt, 5);
+	DECLARE_REG(unsigned long *, per_cpu_base, host_ctxt, 3);
+	DECLARE_REG(u32, hyp_va_bits, host_ctxt, 4);
 
 	/*
 	 * __pkvm_init() will return only if an error occurred, otherwise it
 	 * will tail-call in __pkvm_init_finalise() which will have to deal
 	 * with the host context directly.
 	 */
-	cpu_reg(host_ctxt, 1) = __pkvm_init(phys, size, nr_cpus, per_cpu_base,
-					    hyp_va_bits);
+	cpu_reg(host_ctxt, 1) = __pkvm_init(phys, size, per_cpu_base, hyp_va_bits);
 }
 
 static void handle___pkvm_cpu_set_vector(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 90bd014e952f..d8e5b563fd3d 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -341,8 +341,7 @@ void __noreturn __pkvm_init_finalise(void)
 	__host_enter(host_ctxt);
 }
 
-int __pkvm_init(phys_addr_t phys, unsigned long size, unsigned long nr_cpus,
-		unsigned long *per_cpu_base, u32 hyp_va_bits)
+int __pkvm_init(phys_addr_t phys, unsigned long size, unsigned long *per_cpu_base, u32 hyp_va_bits)
 {
 	struct kvm_nvhe_init_params *params;
 	void *virt = hyp_phys_to_virt(phys);
@@ -355,7 +354,6 @@ int __pkvm_init(phys_addr_t phys, unsigned long size, unsigned long nr_cpus,
 		return -EINVAL;
 
 	hyp_spin_lock_init(&pkvm_pgd_lock);
-	hyp_nr_cpus = nr_cpus;
 
 	ret = divide_memory_pool(virt, size);
 	if (ret)
-- 
2.53.0.473.g4a7958ca14-goog


