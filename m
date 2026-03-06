Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85CDFCB603
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KM8z/si7HcTp05zjHIB0T7h5Dhh3bTdr1CGW99HQcs=; b=AE+FXH5NVq0teJ2o3u/z4Mt5zO
	xpf4IHOor3GQSz9NllWG1Dbp2+fM1kHJ9XGKQ4zzM2Qrg8ECRn8nuJaxX1VvDi0GzAfZtyvop6wfK
	33sU/AkVid4fRj5aG6GXtmYSqWDZLONL4uJ7Dr1i7y+t3e+UjvVI5PnNm7LOqIP7S/bwoDs9LiRgb
	I76UUt1xz2W32PV+GEaRdgHz0bNNbWGut9TgtW526iOcJXNWFtfAnVLKN1RA2WrY01XCCiZlSUOe1
	creLtvGpIWqKbh2xYOyu93ZNlFazZeAbvUfsjL2nqr0wnqL9UtoqEUNJu5urD00W/AvxwDi6dWWNU
	W/0sI65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWIN-00000003vwg-1PLy;
	Fri, 06 Mar 2026 14:36:51 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHo-00000003vDi-1IK4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:23 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-66142e57280so2349700a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807774; x=1773412574; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2KM8z/si7HcTp05zjHIB0T7h5Dhh3bTdr1CGW99HQcs=;
        b=mF/CRCxOV0V9jBYLkWqMFbS5Qe/rI/N1vh8VjIy7UXkU53ilD6PNDTxE1UlJlIcXSM
         f5i9hnHjXcFSlW/D9hh48EctpMhT02zYqBdmT6ycV+dWUQEJFSLmTMNa7oc2CIoPEWiS
         r+ceXUZPhnk5acCT/3+Dxhiy3wwFfweUzwRRODbqNfbQSoOL03Fnuq7B0TMpeadyodFv
         UJe9txXA6zmjl4xCSJzKxrqJovq9oTLdgDFYPhGV0/79qgPF3o4OQObcd3+4gmS0OB/V
         obPKn2NfsV9Js7xZp6QRqUtd+X7WJhZpecVPmklbu3i+LkO3bVRMGBicO5im+byguZ1J
         kwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807774; x=1773412574;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KM8z/si7HcTp05zjHIB0T7h5Dhh3bTdr1CGW99HQcs=;
        b=rIpX8Y6fRLE8o2lUGi39sIqOBbeLNh4fOUEOLE4unRZigRMNVT8YaqpmBEn4k9AXmE
         fxmrtn5/RucX8tSim0GDEzHgpu3EUA5Gw2SCGv9st2mTJR3zO3lr3Q3KLKf72KVceGqW
         CIF/INrCpbBHxaRupzGbIi0yTqu7YTKnXbvi6bl6b5kbRARtVX6k4x2+EVxPIR2dafHK
         00yBmyV/BrHhBMe8gxza0JiQdi4J6hjRTm0zhCl4j4XricZXRx5Lb07ZtBqJ9lOZrTYv
         ZoWMFKoC5O/3OUnWMarc9xIfEgePbUQdY2tKtaKtNJLir6C9GqKur0eDRwkqdr1sOcUh
         8GFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWL3+WAbWkXW+G1mc9nnidTWMYgdVkVCEa2Q2m6v/jCnQdH7eV2NKrWYcSU01OjC0MpQstVD+iJwQYezZmc9Vr@lists.infradead.org
X-Gm-Message-State: AOJu0YwOmqqul5YyWyIaV0nkMGgADS3LGR+gYGXhT+zaUfb5sPyKrzDK
	0bl0EnsNJzR1BPXAk/V7lM0mWdDsAhoRo1ZoY0IpWiHUOTuX6vlXutgz+LYpkiE5SWUuUBJVssn
	od486fo3GyIIsU4fBVdFfdQ==
X-Received: from edbio12-n2.prod.google.com ([2002:a05:6402:218c:20b0:661:1191:6d3a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:51ce:b0:660:ce49:f6b3 with SMTP id 4fb4d7f45d1cf-6619d52e969mr1236686a12.30.1772807773593;
 Fri, 06 Mar 2026 06:36:13 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:25 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-22-vdonnefort@google.com>
Subject: [PATCH v13 21/32] KVM: arm64: Initialise hyp_nr_cpus for nVHE hyp
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
X-CRM114-CacheID: sfid-20260306_063616_407524_CFE61F2C 
X-CRM114-Status: GOOD (  11.99  )
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


