Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E3BCF65D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alMoUf2aUYBx210TxkyVF25XJBvAOIVS4skWHmMgVOg=; b=Um3899pau4It4zeTFySlsCL7RK
	pVt74xF58lS93TwTVQEYdFRJvyp1UADR57K4JMul7MFjDfojIdLamvL42xxT+U+q1R7WeCe/hhMZu
	YcokJDvmPOR6OPNqxQOKcEoGYJ2rI69zhxXsMVWutkNbeG/iNWiTdTtLxnNwS0SWXaL1CApcES7UF
	yJVG5412bDkgTPz1k/3kElCPGux+a08WD/hh3qmn++QoyFYGVAXY/fBhDzoWVhr8RriJ5pekXTze3
	GDFbekzIBIG5ByxmNFWr5NN30kogQqbZK3/V6R7ovq9QZDG3CYuKKBp41tzGKQqN2BB1IeS2v7Azz
	R+6lYAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5x-0000000CKC6-25P5;
	Mon, 26 Jan 2026 10:45:21 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5P-0000000CJZH-4BeL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:49 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-432c05971c6so3233290f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424285; x=1770029085; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=alMoUf2aUYBx210TxkyVF25XJBvAOIVS4skWHmMgVOg=;
        b=HLMLQAm1FkCG2FEa8Jb5Ufgg3aRld3pJo3YuRU5oiyUgC9pq2/BcwBz+pXdxRgM9KG
         DI6xTHc8upfkvvCuS1hAj0f+DRJtdoGKtP8awbOMdfsVODvDjT5+g+MiwWC5rZxtGEy4
         CnKHjHdqViqSDNinE5GdW7N2xc2fgfynHtxjypeUyyrjUQRSHCKrzHSITAi1nV8PpiT1
         jyUBK0J4ajgRs4ACnJj6OR8GO7LiCEXjsoWjnebHaa6m3th55TlVQfj0FG10jIJwpvLu
         qtCTMro06icBCt2GjkiWQJmEs/xJl0QEfOTqc0DZTF2ocs1kwR1+aoK2/Kffmfv/jI0K
         3Htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424285; x=1770029085;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alMoUf2aUYBx210TxkyVF25XJBvAOIVS4skWHmMgVOg=;
        b=T6jgdj52k7tZsuSQ5sGYpolCG29H74xiEtd0HiTHVX9eHyTVDfBSHN0vekn1JQm+ab
         3PL3Gm7Q3UNr6v2XUPZ/hdsYYgvaCWctbBfvu0jYTvCufFlGsFGfWXg8l3PMCs7DwHDH
         n/IxcP2+/HG71Ix1T6f2uIp0CISYyGOwq3/WlwrcubYB6v8wgKhzyNBzFSgOxodyjXcI
         54Y/p6ntWSHksOW/FgTlp1ndBUSfVEP/g4je/D1OQqFhzdpKRAyOjt5uSFv98EFQN4mR
         S2j2jojjtwPKPWf7UHOaYDSQforoEm5EJlSeyYCQl6p5Ut33oTI36jLmohViySvvwlUI
         gIUA==
X-Forwarded-Encrypted: i=1; AJvYcCWvNI6CU2l8QuDmT1dlhEDTvuRJJ9cQ/wsYMv76/3B9ioQiy9kQ9NDkhPifuBl5R/2QxxwAAtopWlAtO4z9jOB4@lists.infradead.org
X-Gm-Message-State: AOJu0YzTSEGKE+VZHJCv9PBM6CaicmTpI7UmcE6tjO7abamIaiIUWlvP
	3KN7sa4YQEUnOlOfSYwpOG6lGsZK6Y1iBufQFmQzJKJ5STiggeNmOyS33V2aifcg6imuOAeigW2
	1ytMFU5Kv0HD27Y3VGj/eRA==
X-Received: from wrbgx14.prod.google.com ([2002:a05:6000:470e:b0:432:c17a:bedb])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2508:b0:435:932e:f932 with SMTP id ffacd0b85a97d-435c9a9bce1mr6750834f8f.7.1769424285177;
 Mon, 26 Jan 2026 02:44:45 -0800 (PST)
Date: Mon, 26 Jan 2026 10:44:10 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-22-vdonnefort@google.com>
Subject: [PATCH v10 21/30] KVM: arm64: Initialise hyp_nr_cpus for nVHE hyp
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
X-CRM114-CacheID: sfid-20260126_024448_219518_82447741 
X-CRM114-Status: GOOD (  12.59  )
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
index 620a465248d1..be1fd6c5f74c 100644
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
@@ -2411,7 +2412,7 @@ static int __init do_pkvm_init(u32 hyp_va_bits)
 	preempt_disable();
 	cpu_hyp_init_context();
 	ret = kvm_call_hyp_nvhe(__pkvm_init, hyp_mem_base, hyp_mem_size,
-				num_possible_cpus(), kern_hyp_va(per_cpu_base),
+				kern_hyp_va(per_cpu_base),
 				hyp_va_bits);
 	cpu_hyp_init_features();
 
@@ -2620,6 +2621,8 @@ static int __init init_hyp_mode(void)
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
index 8ffbbce5e2ed..5559b622ea57 100644
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
2.52.0.457.g6b5491de43-goog


