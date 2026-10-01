Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257EACA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8x+WOwJb8ZYQgifj5DAZhtg6Tqmw4UwJVTgrA3MagC4=; b=ymgVBh4KDXygj9Y0sIQLeT7t6y
	Oy+sJFEt9s9ukJnerk0dhU0OEMjb/hhIBvUOfnKdIUuCp5waV/B+ntAmOZhukhFGucVPtkNS5PCjf
	5mQuMtQENP1Wi34fa8NMbpAv/6i4dalWyMucssq4dR7SufbP1Nj93whkWuyXza7qdgs32XGjzildN
	B00v5gd0UY4k2BAZm4mF2HMA470a8NCxhVyGCYM8dLlOO5fXTtDklyHJhlNfsRpqJfN+/Naz1+aP9
	qxd8B3UtSGPeXwot0O95fvJev2ucrV+lr1mxyVo7Iwt1C8MF0J0bT2yvo3qKPq0HGMi2tWw4Tquq1
	5LnluvtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmZ-00000009NHh-41DU;
	Thu, 01 Oct 2026 14:29:11 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmW-00000009NBp-35WM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:10 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a004b70f99so26723685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864946; x=1791469746; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8x+WOwJb8ZYQgifj5DAZhtg6Tqmw4UwJVTgrA3MagC4=;
        b=BRQuuLVDAg4aJdwqF+d19A7EULZ1rtj5SbTCyxGIQBjEzW57TPKRUwhoiDgo/gQYKs
         AwNXdo6osRe2565/bW2yekVZKVLDlfQq7q5oNBC0lkXfD6jxPdpz8G6D5nqxqcI65aZF
         gT1cG1HN8huTaIZIMh91clALbUjKv7Jpm1mUeXAtz/qp7VUvVgiyJL96eNyZyDJwfOCA
         sXDMDivZ4WaeLIhfUHF+ccIeLS0wme4HXibYJjKWu1IlGb1N5qcuDqF0uAL2Qrqm7zhf
         0tYkdPWKK2WqINVRUk4AyzwGHdLpU2Ji9iliY7FUcBLK9HiCb36Dx1lRZWw3FFXO1gqS
         CJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864946; x=1791469746;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8x+WOwJb8ZYQgifj5DAZhtg6Tqmw4UwJVTgrA3MagC4=;
        b=UOxKng7YOxgL+xveq1Dnb7Kz2sK44ui6Nm+wW/isXlrpnG7bCdPZ3Cg/ZK/7oqPMDX
         52KXOgFnKtBE2xFQqxGepn7fZYBszGzZ9k17nxUpzWkOrCHJ648uMe5e5iTPCwa70g27
         +lIkt4h2GNRpF/mBtulvPSwoUDZtk95vYSy0qKmHxUkqChBcSvcMSZLaIH9gUzWDm4kS
         OTMC7zOEBqkRKqMokEMURJF0njPUM9N+Bur4xYhDs+Ejat+Ms27zjc2m4SlpOEIQW16a
         B+dnZtlNM9/QABmz+URiWicUeiPSfS4HPZUs+L3UU/XpxjPndfFs79XPxnhc8q+X0G4R
         rh0g==
X-Forwarded-Encrypted: i=1; AKwUvBwsR0E0Syp9e0zAr965OkTYekjch75OwA44mRHGx/dKxjAGU59Psjxz7f14djntg8Sh52o7vzdsR12QPuW5cEh1@lists.infradead.org
X-Gm-Message-State: AFuF++kZI+Wyh4hlx5To8DL0NMsZZXWMiOfwrruCvlWtQTc3Kc3ByYmE
	dp/8/TACDx6fdUVRB2wqNsgWxrsqE5bt7ljVTgKn6mU/Boc0t7IDYvKtsIhs48rMdn0vzs8HpTI
	BPsmPHxJepjeCYQ4Bovu2JQ==
X-Received: from wmqg19.prod.google.com ([2002:a05:600c:4ed3:b0:4a0:334:56b4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e42:b0:4a0:1d:3ac4 with SMTP id 5b1f17b1804b1-4a01aff06d5mr80499015e9.6.1790864945476;
 Thu, 01 Oct 2026 07:29:05 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:38 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-8-vdonnefort@google.com>
Subject: [PATCH v6 07/18] KVM: arm64: Add PKVM_HYP_REQ_HYP_ALLOC request
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072908_841698_0A3BE9BB 
X-CRM114-Status: GOOD (  19.67  )
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
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_asm.h   |  1 +
 arch/arm64/include/asm/kvm_hcall.h |  6 ++++++
 arch/arm64/include/asm/kvm_pkvm.h  |  5 +++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 26 ++++++++++++++++++++++++++
 arch/arm64/kvm/pkvm.c              | 30 ++++++++++++++++++++++++++++++
 arch/arm64/kvm/trace_pkvm.h        |  6 ++++--
 6 files changed, 72 insertions(+), 2 deletions(-)

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
 
diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
index 9f06af58a4b0..6d6f12400e94 100644
--- a/arch/arm64/include/asm/kvm_hcall.h
+++ b/arch/arm64/include/asm/kvm_hcall.h
@@ -22,6 +22,10 @@
 
 typedef u16 pkvm_handle_t;
 
+enum pkvm_topup_id {
+	PKVM_TOPUP_HYP_ALLOC,
+};
+
 struct kvm;
 struct kvm_s2_mmu;
 struct kvm_vcpu;
@@ -193,6 +197,8 @@ DECLARE_KVM_HOST_HCALL(void, __vgic_v5_save_apr,
 	struct vgic_v5_cpu_if __kern *, cpu_if)
 DECLARE_KVM_HOST_HCALL(void, __vgic_v5_restore_vmcr_apr,
 	struct vgic_v5_cpu_if __kern *, cpu_if)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_hyp_topup,
+	enum pkvm_topup_id, id, phys_addr_t, head, unsigned long, nr_pages)
 
 /* Hypercalls that are available only when pKVM has finalised. */
 DECLARE_KVM_HOST_HCALL(int, __pkvm_host_share_hyp,
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 19bddf261c82..c338178d6bb2 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -207,6 +207,7 @@ struct pkvm_mapping {
 
 enum pkvm_hyp_req_type {
 	PKVM_HYP_NO_REQ = 0,
+	PKVM_HYP_REQ_HYP_ALLOC,
 	__PKVM_HYP_REQ_TYPE_MAX,
 };
 
@@ -228,9 +229,13 @@ struct pkvm_hyp_req {
 
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
index 91e74a1a334f..2b89eb274482 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -17,6 +17,7 @@
 #include <asm/kvm_hypevents.h>
 #include <asm/kvm_mmu.h>
 
+#include <nvhe/alloc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -799,6 +800,30 @@ DEFINE_KVM_HOST_HCALL(int, __pkvm_finalize_teardown_vm,
 	return __pkvm_finalize_teardown_vm(handle);
 }
 
+DEFINE_KVM_HOST_HCALL(int, __pkvm_hyp_topup,
+	enum pkvm_topup_id, id, phys_addr_t, head, unsigned long, nr_pages)
+{
+	struct kvm_cpu_context *host_ctxt = host_data_ptr(host_ctxt);
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
+	cpu_reg(host_ctxt, 2) = host_mc.head;
+	cpu_reg(host_ctxt, 3) = host_mc.nr_pages;
+
+	return ret;
+}
+
 DEFINE_KVM_HOST_HCALL(int, __tracing_load,
 	void __kern *, desc_hva, size_t, desc_size)
 {
@@ -893,6 +918,7 @@ static const hcall_t host_hcall[] = {
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
2.56.0.rc1.315.gc6ed9934b7-goog


