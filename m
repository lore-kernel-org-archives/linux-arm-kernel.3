Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695C4CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjWpwL/LE/VZqD55anKNHz7HfyCLzMU4NvzDqdhCqMQ=; b=HgxYlS78aZidOROSrk6o5S/qd5
	iuaKrHgXro4NX+sCkvU+BztRW993E2MzUEBhf/LoOstXUcEx1uYvryoLtIonXV17GIsK9GY/7r/xj
	Hi3m/fhf/xFIReU27USg/0wJWN/zAeH7m3PbAR5yx8ILekocj33CKV0yuF8U4RGmKw3w7tZLwVPR7
	J3CbhBGv5khL8wu3DwV2TEla6FNpsu5HuSWEJm9pRxy4g+BdQCmZnzZli3dL5d27MWPDqMHuxYjuZ
	OBdh7s4zqIKq4OdNcjrpdGu83RJtpmlZPMOOxpNQtygnNCrccOb0eoaC9vF0pBsOREtbo6KeiCSn4
	ttHSn3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipn-00000004zPA-0S99;
	Wed, 20 May 2026 15:27:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipb-00000004zCw-44O8
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 15:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QjWpwL/LE/VZqD55anKNHz7HfyCLzMU4NvzDqdhCqMQ=; b=m4okC0p+YzM1SBQfL8/kbiXF8x
	/cf5p29f5g2TkjNZ2trrKT4kahXfJxuggeCR+yTvIIhD73aIE0w+kliVTPO03+qGmCf02da0ojEu/
	wrqvHN7GoC4LxzC/SvAiTEWEnQvvH5n25eBehOsY/43KURPwvz2y0EcQgZB+2yQC+ZO2zNElniXZy
	IXVYbDoq8GHkJr0x7wDWTOf5BapaEcL+S4cB3ODIq2t4zYXzm6UHjD3+Il/a1D850EO5vrrHS5jZ/
	llVuzi0kcy3vdUvHf8s1rD1M7Mb8sVzfdutOUz3iVUnDNO4lTTAlMHG8YwlOVnjcbcxJQDGMS5lzX
	UQa4wlyg==;
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipZ-00000007J3H-0QWU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:27:34 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-bcbb3e56f10so492023066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290841; x=1779895641; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QjWpwL/LE/VZqD55anKNHz7HfyCLzMU4NvzDqdhCqMQ=;
        b=araBsIW9h2QolYwbqf0syPmLkFoqR+QHBoxPvDIvFEbsjosTlrZPhv+rz2Aewcq5m2
         Gmy9tg+mqcCj6WZ46H33rWacmFNgHhCNNnPz8a39mlDNM44y+plmXJPH97vIT/HDR5za
         JxiJxDT/+cKVtqtZ0PH3wNmNB1CJ43PEN0upQQodtJTaikzzd/xa5vZ6paon8L2SuGxd
         zfujQtAf3dJubq0H7hgTKMvD6ne8CeGPDqYi/R03W5cB90+ofeUVAitLdhkfm6x/Z0PA
         SvcJ6hjSy2NksfsTUW2Sh7i7R4NwcU8T/jI2xb8kOeDa9kUs7Cu1KMVjyxdS5SdZDPri
         JE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290841; x=1779895641;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QjWpwL/LE/VZqD55anKNHz7HfyCLzMU4NvzDqdhCqMQ=;
        b=MlqcFIgQBj1gIbTuVKrKKI9r5RTdd5NX2Dzdhk3PL3i/+aglAXA/c0pm4z+Y4DPQjI
         HdzNYCBCYXTVLjpZZbBUUP4NtXwA6SGct6ZS2xvznVbtV0UMidwdnz3iWYBKG7abaTp1
         2KgLTjY+29nJ9wUn0SmzjAPRxlTV5Y8UmtCPGs67Ynd3Fitpm3P1lKsnAuzVgexWksMc
         7JEP4kcqOKvGsyykrx8QXy37+bMD/dC8KmyJsrfYVItFJEBGBlMGslDapVg5KOFPRGBs
         n6U7qhx3eXRfMxHcAOsQ837V/nJ8bLv+hc1DObj/yrTfyiAjntB0e3hwR2SoK6Cm1ldz
         1+OA==
X-Gm-Message-State: AOJu0YyrWqYBCLXDnzRj2Vqpnbgc3ZDoD0VywEpy2AkWZ2gv75TF8yjh
	wVOgDFJAd3AyO9EanwxLfJ7ItqrN6+HJs+ePjlcTeO4f0wdt4mfG4ucf/JXQO7JqjLGKItiaNAl
	TPXpHUw4Gr+HfedXRxqxOrw==
X-Received: from edfg6-n2.prod.google.com ([2002:a05:6402:a246:20b0:687:381a:b147])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:d708:b0:bc8:b8cd:8a22 with SMTP id a640c23a62f3a-bd51791c807mr1230766166b.23.1779290840487;
 Wed, 20 May 2026 08:27:20 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:39 +0100
In-Reply-To: <20260520152650.4107895-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260520152650.4107895-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520152650.4107895-7-vdonnefort@google.com>
Subject: [PATCH 06/17] KVM: arm64: Add topup interface for the pKVM heap allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_162733_180025_19F9A939 
X-CRM114-Status: GOOD (  12.21  )
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

Introduce a host HVC interface and a host side helper to allow refilling
the pKVM heap allocator.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 043495f7fc78..681b7bf8ac08 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -114,6 +114,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
 	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_MAX)
 };
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 2954b311128c..879f1667ec67 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -17,6 +17,10 @@
 
 #define HYP_MEMBLOCK_REGIONS 128
 
+enum pkvm_topup_id {
+	PKVM_TOPUP_HYP_ALLOC,
+};
+
 int pkvm_init_host_vm(struct kvm *kvm, unsigned long type);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 06db299c37a8..38ce834ca840 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -15,6 +15,7 @@
 #include <asm/kvm_hypevents.h>
 #include <asm/kvm_mmu.h>
 
+#include <nvhe/alloc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -613,6 +614,30 @@ static void handle___pkvm_finalize_teardown_vm(struct kvm_cpu_context *host_ctxt
 	cpu_reg(host_ctxt, 1) = __pkvm_finalize_teardown_vm(handle);
 }
 
+static void handle___pkvm_hyp_topup(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(enum pkvm_topup_id, id, host_ctxt, 1);
+	DECLARE_REG(phys_addr_t, head, host_ctxt, 2);
+	DECLARE_REG(unsigned long, nr_pages, host_ctxt, 3);
+	struct kvm_hyp_memcache host_mc = {
+		.head = head,
+		.nr_pages = nr_pages,
+	};
+	int ret;
+
+	switch (id) {
+	case PKVM_TOPUP_HYP_ALLOC:
+		ret = hyp_alloc_topup(&host_mc);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	cpu_reg(host_ctxt, 1) = ret;
+	cpu_reg(host_ctxt, 2) = host_mc.head;
+	cpu_reg(host_ctxt, 3) = host_mc.nr_pages;
+}
+
 static void handle___tracing_load(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(unsigned long, desc_hva, host_ctxt, 1);
@@ -743,6 +768,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_vcpu_load),
 	HANDLE_FUNC(__pkvm_vcpu_put),
 	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
+	HANDLE_FUNC(__pkvm_hyp_topup),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8324a6a1bc48..7abdc250b633 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -85,6 +85,29 @@ void __init kvm_hyp_reserve(void)
 		 hyp_mem_base);
 }
 
+static int pkvm_hyp_topup(enum pkvm_topup_id id, unsigned long nr_pages)
+{
+	struct arm_smccc_res res;
+	struct kvm_hyp_memcache mc;
+	int ret;
+
+	init_hyp_memcache(&mc);
+
+	ret = topup_hyp_memcache(&mc, nr_pages);
+	if (ret)
+		return ret;
+
+	arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(__pkvm_hyp_topup), id, mc.head,
+			  mc.nr_pages, &res);
+	WARN_ON(res.a0 != SMCCC_RET_SUCCESS);
+
+	mc.head = res.a2;
+	mc.nr_pages = res.a3;
+	free_hyp_memcache(&mc);
+
+	return res.a1;
+}
+
 static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 {
 	if (pkvm_hyp_vm_is_created(kvm)) {
-- 
2.54.0.631.ge1b05301d1-goog


