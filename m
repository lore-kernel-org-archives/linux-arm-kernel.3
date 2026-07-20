Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BEFC44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEuOwiudoWWTi/wv3fiL2ZzwS4iTMOnI0AtYPMOpiXE=; b=hYVGN97tnxq59PqHfmr9lF9TX3
	bpkir2SnVUaELFe4UkBuTR9wXAR940xKI1FxddQfe5n2vpzuw5B5lJjYZpAyZFWMDA/Dg1DGb3n2X
	k+bjErO3TXqUj3NjUYUvvH84DWmeiwOCejdfLM7S6MkAdj3rTVzRQkFGSteXNq57NxXx9gMH2c65s
	GhgG5iN5hvizwsVAKzNDIMBJoQYtn6atxLINxcohFG4K2NAXkDubarL01Aaw73yo2kaxp/3qznidn
	3v1bD20isPQu4mRI6cHyu2VKb7OwburcV17sSHl5nblGL+2XfPsapJ3KqV4FGzUBL44H1Z39w8/KU
	M1d/XmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrac-00000007UvA-2mT2;
	Mon, 20 Jul 2026 17:15:38 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlraU-00000007Ul6-01GT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:15:31 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-476608a9fefso3884459f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 10:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784567727; x=1785172527; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QEuOwiudoWWTi/wv3fiL2ZzwS4iTMOnI0AtYPMOpiXE=;
        b=cMPdgoQOYAZghIRnOLYQ4RiOCJ081n/ZntFph/ZyzA3TTJrG0mBeot+dZDhul95ggl
         /Nv6BD9QZ0tceEI3NvjoMwgnrgQhVAC1rbR/4Grl7u3Uv4xqfKpbUscMBIA87yhgpe7r
         +bOo2YI5Yp89gjbcuOB5BAut4N99rYcTmH6CuMf9x7pPHrFUhL/wgY9h9efHDCZZqAJB
         P3Evw9f58Bv9ct1rr5z7z/PCIZXiAKibwJEcQsFj+WOTTT9uLaVNRLR0SWPHEl0e4WhP
         WPO8bl87qUhaeu0Hd2CbYaRnNyki64OhZ4nn0C/egN/QSfd21kNMhtLWJ7q6BxA42M6/
         01rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567727; x=1785172527;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEuOwiudoWWTi/wv3fiL2ZzwS4iTMOnI0AtYPMOpiXE=;
        b=WrE05jqsTwWgYcYSsF58KpnQMNO8zoveBcNOzJaFpvEEsphaqmNe3umbB/GbYXIukg
         57+5Hccm8/IQOUFFdIelZRK/Pj7rivDBf9/yJ14/3gMGeVqUnlmlK0ysgXQpdeCJ1MQP
         WoD2jr71vutvHar2HVcdtnV84luq4N5l/KoTWUUQStwCS8j92kFSP9SXtIoCJUbBKgds
         DLByogHu3I8IGDZG6rL6TCnPlrwp6LM8rV7ZS0xqZ8vKOoeQHk7Y8ZKS3nJaiczcEBWg
         Q36YzCjdZbrETlOyEEXHXQivb+4OdI4BVjhrk9EArMV2jtxG+ATOLeXZ1V/GuPsHrf16
         nDnw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9NQXdrQ/Eza86oH4Ov20O/oF3tmmw/eDhWgPxlP68U+d/kMXUDdiA6GpXyLJQJ5yvqDlD333O1lxBfHKL0Nga@lists.infradead.org
X-Gm-Message-State: AOJu0YykeTV1J0Fad/eXm2CBycW92U2TLkFl3gHIPpMkqo4U7DvrZ24s
	k3BMP8L8hW86wm3SVzW8PDINM5zH2Zl8yLBLZ6dHZpBqHDD/VQtUPhGE6+zBUhvv4H6TbGbxlUy
	K7gvlCJZkwxioqyj0iJHARg==
X-Received: from wrtc5.prod.google.com ([2002:a5d:4cc5:0:b0:47f:6d90:86fa])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2404:b0:47f:7926:90c3 with SMTP id ffacd0b85a97d-47f7926913bmr5497612f8f.30.1784567726608;
 Mon, 20 Jul 2026 10:15:26 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:15:03 +0100
In-Reply-To: <20260720171513.1415357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720171513.1415357-8-vdonnefort@google.com>
Subject: [PATCH v3 07/17] KVM: arm64: Add PKVM_HYP_REQ_HYP_ALLOC request
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_101530_069932_CBC25F0E 
X-CRM114-Status: GOOD (  14.95  )
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
2.55.0.229.g6434b31f56-goog


