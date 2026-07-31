Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B0BC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aq7OL9INhErui4mdU1lyC65L9SJ7juDhRrdFW2tdhO4=; b=cmqh9CzXFnltYmqfM8AK8bme8M
	HEHuWkzrx8iMXu87u4y2oZl7n8htzWWDm2+ucJEqpV6p6NPypYeAtkyYB893fboJZmC/u2M20ceDu
	JqEUQvS84KkZHD1IJVOPun2LwxFbFQ3wpN9V9ol5JKmgMMArlsx6nbF8ruttQQ1H29npUpQObGHn8
	m1HFiMA3od2FYNWEJF0slBPr3PFiAWjYsWE84gQ+HLF2EKRdPcsNL0cUCahJInletj7jI0Aku3rO9
	U7XhDHH1R9YW6Yhvgk6dK050h8QX2RwVEyvL95nPn8EmtV/pWbYVx2p8b8U/0iVimlXxf03WbgAuS
	U4z0RjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLY-0000000Cjfn-3et0;
	Fri, 31 Jul 2026 14:36:24 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLF-0000000CjU7-2IYr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:36:07 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-69e3aaf5ea3so1316317a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785508563; x=1786113363; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aq7OL9INhErui4mdU1lyC65L9SJ7juDhRrdFW2tdhO4=;
        b=L1UU9rfaZ/IXmmpuK9eQCTloVSdqqiZYmBuHgIasSNjTPv7OqBUZ2Cd9/RF5LG0pAu
         r/To8pqFmCGmqIb0ojW/suokVgC5wJOgQ7oyk+o3W0NoZblcWoM/CjHiN8xzfd0V2S/K
         eYcQGDAGUxqw27UTCVr4/ylYvxFb1dNg19OMkO7QgIPOjJlooJHpidUorFCPAJf6z/BZ
         PuxqculDry8syyK/0sbPE1cIDrFiZ+ZoVnztZtUeqeGLfOdIavYYtaKGrNOWsq5aFs35
         XXm4jEJG6ta62q9F5p3Fq0eUkjpsPBnOtf4Gy3V4IN6ctoLufEKtfrSrLjP332fezH/z
         NcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508563; x=1786113363;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aq7OL9INhErui4mdU1lyC65L9SJ7juDhRrdFW2tdhO4=;
        b=FuWux3C/z+raHIHc4r+fAId6ZiScIJJLjT8St1WDO1Yb4BAC3txHXhiwSO/OjvDd0O
         OC+mzjAQOzo0Rgiesu44f+fbAEX920ALfapx2719xbxnARjLG23C22lTMX4kBW6Cnxys
         RGR50SOwqjxSbZvlCdwMga7ApjtDs9lj9OZHFYQ9G0325WOYXN68hJKCIf1PX/CP4MCy
         9I/Vs/gnK8xkHIG6TU12xvd43K3jHUIHOuaLwX4WjG9pXzSiO90sU8GybPjOs1y6vX5l
         MEaquCplhfjUkbZoKUSmbNpWepv6LZAe4yMAy0t1qcBKM7ok1LVpeMyPJBR1JcrqrZGx
         mUzg==
X-Forwarded-Encrypted: i=1; AHgh+RqHF7kndtjjjukpdmUFn8sGkSUxzyzlQkVTU3VwGaCa4RxoK3S5vaWBMUBVl5ant4ywOyTUGA/A1zxw9ITJEjA7@lists.infradead.org
X-Gm-Message-State: AOJu0YyTcVVoNxrb/f70uNj/2zjY276QLcjqV2jrAYVrO8albNUlV/qW
	85xe42v9sKqITs3dHqGrveVAtIGwKGjUg4S4q64Aao2Bv3r7eZ7HD2jlvrAsOVO7idz7hikwAdu
	ByM6aG4e/mq53GN9eaVzEZg==
X-Received: from wmdv2.prod.google.com ([2002:a05:600c:12c2:b0:493:c481:d8e9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4316:b0:698:ac05:5b2f with SMTP id 4fb4d7f45d1cf-6a098c9da58mr1450065a12.4.1785508562624;
 Fri, 31 Jul 2026 07:36:02 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:35:31 +0100
In-Reply-To: <20260731143541.956291-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731143541.956291-8-vdonnefort@google.com>
Subject: [PATCH v4 07/17] KVM: arm64: Add PKVM_HYP_REQ_HYP_ALLOC request
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073605_621508_546BE3DF 
X-CRM114-Status: GOOD (  14.86  )
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

Introduce a new pkvm_hyp_request type asking the host to top up the pKVM
heap allocator.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 043495f7fc78..b77acfd7d1c8 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -89,6 +89,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_PKVM_ONLY),
 
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 6c2497047f8d..99daa985856f 100644
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
@@ -201,6 +205,7 @@ struct pkvm_mapping {
 
 enum pkvm_hyp_req_type {
 	PKVM_HYP_NO_REQ = 0,
+	PKVM_HYP_REQ_HYP_ALLOC,
 	__PKVM_HYP_REQ_TYPE_MAX,
 };
 
@@ -222,9 +227,13 @@ struct pkvm_hyp_req {
 
 static inline size_t pkvm_hyp_req_arg_size(u8 type)
 {
+	struct pkvm_hyp_req *req;
+
 	switch (type) {
 	case PKVM_HYP_NO_REQ:
 		return 0;
+	case PKVM_HYP_REQ_HYP_ALLOC:
+		return sizeof(req->mem);
 	default:
 		WARN_ON(1);
 	}
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d3c69de698f4..439b91fc8aec 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -15,6 +15,7 @@
 #include <asm/kvm_hypevents.h>
 #include <asm/kvm_mmu.h>
 
+#include <nvhe/alloc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -632,6 +633,30 @@ static void handle___pkvm_finalize_teardown_vm(struct kvm_cpu_context *host_ctxt
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
@@ -740,6 +765,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
 	HANDLE_FUNC(__vgic_v5_save_apr),
 	HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
+	HANDLE_FUNC(__pkvm_hyp_topup),
 
 	HANDLE_FUNC(__pkvm_host_share_hyp),
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index a626978dc91f..d26e7435d34d 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -88,6 +88,33 @@ void __init kvm_hyp_reserve(void)
 		 hyp_mem_base);
 }
 
+static int pkvm_hyp_topup(enum pkvm_topup_id id, unsigned long nr_pages)
+{
+	struct kvm_hyp_memcache mc;
+	struct arm_smccc_res res;
+	int ret;
+
+	init_hyp_memcache(&mc);
+	ret = topup_hyp_memcache(&mc, nr_pages);
+	if (ret)
+		goto err;
+
+	arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(__pkvm_hyp_topup), id, mc.head,
+			  mc.nr_pages, &res);
+	if (WARN_ON_ONCE(res.a0 != SMCCC_RET_SUCCESS)) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = res.a1;
+	mc.head = res.a2;
+	mc.nr_pages = res.a3;
+
+err:
+	free_hyp_memcache(&mc);
+	return ret;
+}
+
 static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 {
 	if (pkvm_hyp_vm_is_created(kvm)) {
@@ -599,6 +626,9 @@ static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
 	int ret = -EINVAL;
 
 	switch (req->type) {
+	case PKVM_HYP_REQ_HYP_ALLOC:
+		ret = pkvm_hyp_topup(PKVM_TOPUP_HYP_ALLOC, req->mem.nr_pages);
+		break;
 	}
 
 	trace_kvm_handle_pkvm_hyp_req(req, ret);
diff --git a/arch/arm64/kvm/trace_pkvm.h b/arch/arm64/kvm/trace_pkvm.h
index 3966c111e3ad..493225e3282d 100644
--- a/arch/arm64/kvm/trace_pkvm.h
+++ b/arch/arm64/kvm/trace_pkvm.h
@@ -9,9 +9,11 @@
 #define TRACE_SYSTEM kvm
 
 TRACE_DEFINE_ENUM(PKVM_HYP_NO_REQ);
+TRACE_DEFINE_ENUM(PKVM_HYP_REQ_HYP_ALLOC);
 
-#define PKVM_HYP_REQ_TYPES \
-	{ PKVM_HYP_NO_REQ, "NO_REQ" }
+#define PKVM_HYP_REQ_TYPES				\
+	{ PKVM_HYP_NO_REQ, "NO_REQ" },			\
+	{ PKVM_HYP_REQ_HYP_ALLOC, "HYP_ALLOC" }
 
 TRACE_EVENT(kvm_handle_pkvm_hyp_req,
 	TP_PROTO(struct pkvm_hyp_req *req, int ret),
-- 
2.55.0.508.g3f0d502094-goog


