Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB895C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVVEe2v94X37XoAXlkcm9aniJA/o6px1+9bLk7AemEs=; b=W2c6MIxRYp0t2z/AxELcql8rAz
	N2owbyJMu3yToEyqlPEqIGi4NtAVucmdlQpWaZtTJ6VMzTfozwyW5enxnNqMfSRXm7EvdIcNG57/6
	Q7lljrx6NVx+AAsCXBcjw1fVHZeQQCIvtq4W5cJjYg28wslpHzFiETA797WDx4kZ4WQE7A+hHxfJb
	584J2LWnDf0DZC0aN/D5BV9nszn7/46HvQQjSRwwYoa8N4FLWPRs3lXpHC//cCqGzZL7QRFWoYs96
	b///I9ivxqN4omtF9C3YlpQC7FMdG1j03ei67Usghopxoj8dpU7+OeYkENKJqsSwRtp+vE1LgFu+J
	4mTBvO4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLY-0000000CjfQ-39Z4;
	Fri, 31 Jul 2026 14:36:24 +0000
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLE-0000000CjTx-3JBx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:36:06 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-698b899b53cso1001902a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785508562; x=1786113362; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVVEe2v94X37XoAXlkcm9aniJA/o6px1+9bLk7AemEs=;
        b=Feus+KyL0fCcHvXKrut0es9umbjH/Ui0hKNNvkTGl3Cr87iN+gp8O3+c4DJu7apXym
         uJK8hc8teceMUO8p3FHCyoQc8nJL3t6s9fUpMZ9utCgRL/2F1jD181htZmJxSu+ONszJ
         OY/UO7fFTWZ4Ov22sySB2WePehfdpUX5pdwt/+cNWGrfWbniSsNHf815F20983HlGTnt
         vWh4H0EBIm/DB1y3MTqThXD69yJmy7JmufL103RWeKGdS64an39J9C9dj1uO2mnNWVFt
         8pl83cNS5AkAGebKm15kcUvzQuGAGOGR0dvsA6/38FZkiN1xZNKq1GJK6rqo5EMSqBHY
         Il9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508562; x=1786113362;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVVEe2v94X37XoAXlkcm9aniJA/o6px1+9bLk7AemEs=;
        b=YHvp+G1uoYpmdYv1WYzMeG1+ZH7YC3Td7A7GDP1xc0sNkqlh57j0qKkuX09F9IKDQD
         wCG+G6IqjT1ItV8WSyKNkSz7QPWPBi9Hv7PwvUB7RiR/EpYU+EjBfNN5aseuFsLeemes
         HpAuSNmrPyOFLMXt9y2VFK79I0HQ07uLIebWkSYQyjG1otw7krFMVe9zf73xj1gqYrvk
         5zHD7oKZAq9vYvmNIfb8BzsdjIGk1HIGPHp8MpW1Qeg5GWsU8qWV2Uq2WTyyaSHrPP63
         8IgriNYULkaDUqd77BM+BswRpyb4ygkKYEDquQLvreU1gnjT59ZuEEj3YyAlGaXbnhik
         4Gnw==
X-Forwarded-Encrypted: i=1; AHgh+RrxR4ityQP/cGMwSzH87AW+958PXIgz4FGQ8bVTk2Gz/JHrdXJyUzOEFVap2OfGDmop+WcYkBIMepljXx+zzCz8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/luymdm5OvHR4lDJMj/ZY8gFzWsivkXFdTJuiCV9/WDnFvK2p
	4NiFRzasOIPB/+DaI0Hae5fv1Dj0AzNRs4cSGapruB7Zgt5osXaH/6DB+V1K1/9t3ptSXKWe1tY
	gplW/SVtdod3ApU6rvOSWXw==
X-Received: from wmbdr14.prod.google.com ([2002:a05:600c:608e:b0:493:af1f:8829])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:d08f:b0:c15:deea:a178 with SMTP id a640c23a62f3a-c1fd21646e7mr152160966b.25.1785508561650;
 Fri, 31 Jul 2026 07:36:01 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:35:30 +0100
In-Reply-To: <20260731143541.956291-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731143541.956291-7-vdonnefort@google.com>
Subject: [PATCH v4 06/17] KVM: arm64: Add pkvm_hyp_req infrastructure
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073605_479077_8B5C1A16 
X-CRM114-Status: GOOD (  18.07  )
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

Introduce a struct pkvm_hyp_req to enable the pKVM hypervisor to request
resources from the host.

Provide serialisation helpers to transport these requests via SMCCC
registers (starting from a2):

  pkvm_hyp_req_to_smccc() to encode into the SMCCC args.
  smccc_to_pkvm_hyp_req() to decode them.

When the hypervisor raises a request, the host must handle it and retry
the HVC. To automate this sequence, introduce the pkvm_call_hyp_req()
macro. This intercepts pending requests, invokes the handler and retries
the HVC.

Additionally, introduce a trace event to track the handling of these
requests.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 74fedd9c5ff0..6c2497047f8d 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -199,6 +199,95 @@ struct pkvm_mapping {
 	u64 __subtree_last;	/* Internal member for interval tree */
 };
 
+enum pkvm_hyp_req_type {
+	PKVM_HYP_NO_REQ = 0,
+	__PKVM_HYP_REQ_TYPE_MAX,
+};
+
+#define PKVM_HYP_REQ_SMCCC_ARG_SIZE_MAX \
+	(sizeof(struct arm_smccc_res) - offsetof(struct arm_smccc_res, a2) - 1)
+
+struct pkvm_hyp_req {
+	u8 type;
+	union {
+		struct {
+			u32	nr_pages;
+		} mem;
+		struct {
+			/* Helper for SMCCC encoding/decoding */
+			u8	args[PKVM_HYP_REQ_SMCCC_ARG_SIZE_MAX];
+		} args;
+	};
+};
+
+static inline size_t pkvm_hyp_req_arg_size(u8 type)
+{
+	switch (type) {
+	case PKVM_HYP_NO_REQ:
+		return 0;
+	default:
+		WARN_ON(1);
+	}
+
+	return 0;
+}
+
+/* Encode the pending pkvm_hyp_req type into the SMCCC args */
+static inline void
+pkvm_hyp_req_to_smccc(struct kvm_cpu_context *host_ctxt, struct pkvm_hyp_req *req)
+{
+	u8 *dst, type = req->type;
+	size_t size;
+
+	if (type == PKVM_HYP_NO_REQ || type >= __PKVM_HYP_REQ_TYPE_MAX) {
+		host_ctxt->regs.regs[2] = 0;
+		return;
+	}
+
+	size = pkvm_hyp_req_arg_size(type);
+	if (WARN_ON(size > PKVM_HYP_REQ_SMCCC_ARG_SIZE_MAX))
+		return;
+
+	dst = (u8 *)&host_ctxt->regs.regs[2];
+	*dst = type;
+
+	memcpy(dst + 1, &req->args, size);
+}
+
+/* Return true if a pkvm_hyp_req has been decoded from the SMCCC args */
+static inline bool smccc_to_pkvm_hyp_req(struct pkvm_hyp_req *req, struct arm_smccc_res *res)
+{
+	u8 *src = (u8 *)res + offsetof(struct arm_smccc_res, a2);
+	u8 type = *src;
+
+	if (type == PKVM_HYP_NO_REQ || type >= __PKVM_HYP_REQ_TYPE_MAX)
+		return false;
+
+	req->type = type;
+	memcpy(&req->args, src + 1, pkvm_hyp_req_arg_size(type));
+
+	return true;
+}
+
+int __pkvm_handle_smccc_req(struct arm_smccc_res *res);
+
+#define pkvm_call_hyp_req(f, ...)								\
+({												\
+	struct arm_smccc_res __res;								\
+	int __ret;										\
+	do {											\
+		__ret = -1;									\
+		arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(f), ##__VA_ARGS__, &__res);		\
+		if (WARN_ON(__res.a0 != SMCCC_RET_SUCCESS))					\
+			break;									\
+		__ret = __res.a1;								\
+		if (!__ret)									\
+			break;									\
+		__ret = __pkvm_handle_smccc_req(&__res);					\
+	} while (!__ret);									\
+	__ret;											\
+})
+
 int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			     struct kvm_pgtable_mm_ops *mm_ops);
 void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index d2681da0b629..a626978dc91f 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -16,6 +16,9 @@
 
 #include "hyp_constants.h"
 
+#define CREATE_TRACE_POINTS
+#include "trace_pkvm.h"
+
 DEFINE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
 
 static struct memblock_region *hyp_memory = kvm_nvhe_sym(hyp_memory);
@@ -590,3 +593,25 @@ bool pkvm_force_reclaim_guest_page(phys_addr_t phys)
 
 	return !ret || ret == -EAGAIN;
 }
+
+static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
+{
+	int ret = -EINVAL;
+
+	switch (req->type) {
+	}
+
+	trace_kvm_handle_pkvm_hyp_req(req, ret);
+
+	return ret;
+}
+
+int __pkvm_handle_smccc_req(struct arm_smccc_res *res)
+{
+	struct pkvm_hyp_req req;
+
+	if (smccc_to_pkvm_hyp_req(&req, res))
+		return pkvm_handle_hyp_req(&req);
+
+	return res->a1;
+}
diff --git a/arch/arm64/kvm/trace_pkvm.h b/arch/arm64/kvm/trace_pkvm.h
new file mode 100644
index 000000000000..3966c111e3ad
--- /dev/null
+++ b/arch/arm64/kvm/trace_pkvm.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#if !defined(_TRACE_PKVM_ARM64_KVM_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_PKVM_ARM64_KVM_H
+
+#include <linux/tracepoint.h>
+#include <asm/kvm_pkvm.h>
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM kvm
+
+TRACE_DEFINE_ENUM(PKVM_HYP_NO_REQ);
+
+#define PKVM_HYP_REQ_TYPES \
+	{ PKVM_HYP_NO_REQ, "NO_REQ" }
+
+TRACE_EVENT(kvm_handle_pkvm_hyp_req,
+	TP_PROTO(struct pkvm_hyp_req *req, int ret),
+	TP_ARGS(req, ret),
+
+	TP_STRUCT__entry(
+		__field(u8,	type)
+		__field(int,	ret)
+	),
+
+	TP_fast_assign(
+		__entry->type = req->type;
+		__entry->ret = ret;
+	),
+
+	TP_printk("type: %s ret: %d",
+		  __print_symbolic(__entry->type, PKVM_HYP_REQ_TYPES),
+		  __entry->ret)
+);
+
+#endif /* _TRACE_PKVM_ARM64_KVM_H */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace_pkvm
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.55.0.508.g3f0d502094-goog


