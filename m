Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4706BC624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eptbgNmTS4rkLSwMh/pJm6Fg1kYiL08r3P/b5PdQUAE=; b=17TxJYA1TLRL36gsEvDD7Q8eos
	Cbxo4YpQASB5YSYtLehYMx6UjqgjYzlFRZsNm0XUuuUY0U3VRvKpSrddlsXX+LaRBkNO9z5N3yuAT
	c+Ntr2c0S64yMgRBf2kU4/RPZNFTFhF2qssGBSWQT/YBZKSHNbPET9QDwFCUp0d6l5fU1bthFPmt1
	/gnc856NfT/5nG26j5I8FPHb7RNaN1A98AaJnYZ/ql2Q73DH//3dVU9oSbjyR0zrU8J0ulpZ/p4b1
	TQ6BlLHTIjuojCe56YoH5VNiR8AhvBcmGuz/gw7oQeO/aC2wWh7r2Tuk2Zl4NXPChkaCAXZNCZT9Q
	x3a7Fjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZB-0000000BCpp-2iis;
	Tue, 01 Sep 2026 08:10:01 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZ8-0000000BCku-40mY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:10:00 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6a178080182so4805430a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250197; x=1788854997; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eptbgNmTS4rkLSwMh/pJm6Fg1kYiL08r3P/b5PdQUAE=;
        b=X6MnDNZRaEot+yqLoYsS8CuwYjp18Wc9Lz6qw8941eug9mw4wOUS50fetGQg2M7QEn
         hynfVeFkta94/W9yAHGBcKpMV8eYJUwBW77jbjAst4LNlRLq/H/X3JWT2Fs5B8YCSBKF
         qLSNV3TU75uggiT4K8Fin0/l1TX5DXz94Kw65zw8FOMh31uHD/raOrYuvT11JTr8yqV3
         xlPIZGr//Qno+qiSfGFePbPl2GMhBWKK0Pc4Gqd468Sn7UAxkC0Bim7dZcCSaSJuhSXP
         gm95DAYzHNKzXDQgGbPTStg+xQ++Kum3/Knr8/s9kH/89X2OjOG4J/8VIp/G52pr8Ell
         A1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250197; x=1788854997;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eptbgNmTS4rkLSwMh/pJm6Fg1kYiL08r3P/b5PdQUAE=;
        b=NZpi45V49SC7F9cTk+kVzVKJhheNY8sqlC/AiNOUT9YGv5REnCc9cepI85pSID2NOD
         eucKVpnGOL2VczDVVqg0dSXfcuc7ijb7YB2TiWYlh4yPoszThPHoywKObAc7AGvo3PBc
         VSUeNgYQk3zkIj3HYWQNtlmIVrK67Es+a4EpGKS3+motMll7apAA9o7VvNOzkbblJEZ1
         UY8rOcT7cI6gLfkdFbXDmcQlHObRPMzU8OPj9koQjm1co5sodAfqYYi8SuSguQ56I8T4
         w4JcaevlVKunJIZNiEQCkOWNyD1v8qSmG+5r66gLVTmNvc4ikL//6GOpTQCQ8Abkxc5g
         n3Gw==
X-Forwarded-Encrypted: i=1; AKwUvBztSZljzSgBJTCwtl82W9mUvV08Sr93yzw8apQfj48DpKScuJLPdkfK0Hl11r/MxQhJKGIUrabCAWXKW08JCaln@lists.infradead.org
X-Gm-Message-State: AFuF++mok1YWqr0Z0i3b28raFb3qzdx5+8oNRs4dFhLYnpzn5jWGsWIV
	PeeCP7Xjmo3zZtIUSBXMqGcXPeGZTX8vbPvO6CXD4BKyXpm8la2YQOYDaoW45rvbEUunwdm6tLR
	hoedkeWVxNHDwMQ6WPXAiCg==
X-Received: from edgi18-n2.prod.google.com ([2002:a05:6402:a592:20b0:6a6:72b4:df94])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4285:b0:6a5:dd97:23ea with SMTP id 4fb4d7f45d1cf-6a60d3715b5mr20153705a12.11.1788250196848;
 Tue, 01 Sep 2026 01:09:56 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:30 +0100
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-8-vdonnefort@google.com>
Subject: [PATCH v5 07/18] KVM: arm64: Add PKVM_HYP_REQ_HYP_ALLOC request
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_010959_170084_F606ACC3 
X-CRM114-Status: GOOD (  16.17  )
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
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index e5b92ac09e69..de59e89318fa 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -89,6 +89,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_PKVM_ONLY),
 
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 19bddf261c82..5ea5633705ef 100644
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
@@ -207,6 +211,7 @@ struct pkvm_mapping {
 
 enum pkvm_hyp_req_type {
 	PKVM_HYP_NO_REQ = 0,
+	PKVM_HYP_REQ_HYP_ALLOC,
 	__PKVM_HYP_REQ_TYPE_MAX,
 };
 
@@ -228,9 +233,13 @@ struct pkvm_hyp_req {
 
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
index 9a3b92e626ad..0e590261f1cc 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -17,6 +17,7 @@
 #include <asm/kvm_hypevents.h>
 #include <asm/kvm_mmu.h>
 
+#include <nvhe/alloc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -826,6 +827,30 @@ static void handle___pkvm_finalize_teardown_vm(struct kvm_cpu_context *host_ctxt
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
@@ -934,6 +959,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
 	HANDLE_FUNC(__vgic_v5_save_apr),
 	HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
+	HANDLE_FUNC(__pkvm_hyp_topup),
 
 	HANDLE_FUNC(__pkvm_host_share_hyp),
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 11d9e2f70cd8..9cd23978481c 100644
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
@@ -603,6 +630,9 @@ static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
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
2.55.0.897.gb25b4bd76c-goog


