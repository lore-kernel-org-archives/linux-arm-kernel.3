Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B81C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQruuicz/6guQAq8w+QAJ7KPe6zCOEn9cupA41y8u7Y=; b=VLvgQkQlv57N1e7TsHxBu0r4/t
	EFSYyRZGjDHCeBm4rhvgnHql7E7jt5rJxmzc/x2KA0kgqwMVK8CVV3waLYUgm2Wgst7goTDL01s5O
	PPVgGztxNxOfafagulWa5nch9kl+yK2iFJstxoxRA2XwwY8mTNfpFQxbpEPJoSFiU/sVydml+c8zA
	dSEyGeW0quKGr7Zo89HMGnPO5zLLu6+ZyR23kAhITZyy8fNfS9itEPoyMRVGcSX1I1peP3FnQ3bUV
	6EUpvwaE+rtBpg1Ke0Gk0+FFqjZ50J2B5etsgJc0fctMTFMfFfHgtL1w+WIiluyM0p11f8gSLENC7
	8GZDF8hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZB-0000000BCpU-2DI5;
	Tue, 01 Sep 2026 08:10:01 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZ8-0000000BCkY-26lz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:09:59 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-47f6d70223dso3003295f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250196; x=1788854996; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQruuicz/6guQAq8w+QAJ7KPe6zCOEn9cupA41y8u7Y=;
        b=Ne9PBlezm7uGhvkqHjN13DaYASqQvXzZz17TTf6sBKwzWGXLtyBczWMsNBOEZpA8Mm
         asSBYf0VlX3lBU6FotiQQgYOAMralcE5Rtn7/txkyhDiDdzX8PbRvFJdupnUi2qmOXOd
         Ld8TKdCcBc7Z0WYscQvdYd6sLdK+Mkb1Fg5u7OWu5pkwFXAfCbdmhAxc8L4K6EVjQWRi
         g3It1h2PTXzo1SXs9QSyNxO5ICSpeKv6F60e9xIsdqWxCWFU0MOiVsQDuE4Zo3dI93hu
         6p3gtmW2E0FillFFOlZrnxOc34/yNycMcnmpYX/+1DHCT/loGmnx6yvSCRbWmSnA/pYx
         2KFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250196; x=1788854996;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQruuicz/6guQAq8w+QAJ7KPe6zCOEn9cupA41y8u7Y=;
        b=gkduu//od+Z3HdWxGm5ah5Q5+8kOUCBN/4M4F1TnGSlp13oMMDhVqtL5uQse3FVr8F
         8lxtV9Js5kddFH3oBfMmrO8pa8G+Jv4iTk6YwT/wK6BYGROImxRK/7+5FdhMPPIgakFC
         H7tjMRmKAmGuUMx90DoxPD3A07yrvM1O3ik7wkvpX3pq3rI7E65p86akfuA5Y+GQgQvV
         89dV17MRkn0aEhc/HMlaFxAO6kISCwPoPbkWbtObmTvNxNieEvIFDO1OcIg56i52Oly+
         l8PxhAO02OulThkrAf7ZnQSaoEKm9wVdD/2GQAjSM4gW0IQTDYcuqwqd8LYQyRiSQh1o
         sIxg==
X-Forwarded-Encrypted: i=1; AKwUvByuXwHJlTBW0n3pysxk6zPYWDDV20BxL+YMOS887De/3R+/JbruNxiO1oPRtXV5XW4wikP1GnTN4h71MdM+t4Q+@lists.infradead.org
X-Gm-Message-State: AFuF++kA4Kuoj0iBE5b072WFwcNX0mYtWa940K3Au4OTdh9Q8DvQntGU
	3ATl1/rQFLdk5fkU4VjAmCEuw+uPqNQ4VOohBntcrq++21Nr4EMvOLxe3pngq7U6Suzj3XxqxXB
	Q7p5RrP59LWHK6IRXufBqYg==
X-Received: from wrsc7.prod.google.com ([2002:adf:fb47:0:b0:47f:45e3:ffb0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:f68f:0:b0:482:f0ee:1390 with SMTP id ffacd0b85a97d-4844101d845mr9401575f8f.22.1788250195887;
 Tue, 01 Sep 2026 01:09:55 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:29 +0100
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-7-vdonnefort@google.com>
Subject: [PATCH v5 06/18] KVM: arm64: Add pkvm_hyp_req infrastructure
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_010958_619967_6F9FEBD2 
X-CRM114-Status: GOOD (  21.00  )
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
index beea00e693a0..19bddf261c82 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -205,6 +205,109 @@ struct pkvm_mapping {
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
+/**
+ * pkvm_call_hyp_req() - Issue an HVC that can return hypervisor requests
+ * @f: Hypervisor function symbol to call.
+ * @...: Arguments to pass to the hypercall.
+ *
+ * Re-issue an HVC and process any pending hypervisor request until completion
+ * or error.
+ *
+ * Only use this helper for HVCs whose hypervisor handlers format their return
+ * registers with pkvm_hyp_req_to_smccc().
+ *
+ * Return: Result of the hypercall or a negative error if the hyp request
+ * handling failed.
+ */
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
index e5200731a45b..11d9e2f70cd8 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -16,6 +16,9 @@
 
 #include "hyp_constants.h"
 
+#define CREATE_TRACE_POINTS
+#include "trace_pkvm.h"
+
 DEFINE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
 
 static struct memblock_region *hyp_memory = kvm_nvhe_sym(hyp_memory);
@@ -594,3 +597,25 @@ bool pkvm_force_reclaim_guest_page(phys_addr_t phys)
 
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
2.55.0.897.gb25b4bd76c-goog


