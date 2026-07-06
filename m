Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47966C44502
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMzZELxNMWkvZmpbYeYedfqqEOctYU5iyYuamj2u6LM=; b=zgL23xOgywKjA3HPpXR1Cae5Md
	7MChXJFapDQQn7rqqX/QpTqJFr6Y7c6oo2reCaVc7RyAInewSeMjJgWoFbhveFwANhn5HeUYs0SyL
	h/y7JfZKbkJdYlr6IC+qzHmsD3T3BtgKUcH4zb1s1kv/S5x6wtUWT9gJNJSuHefQtzMQZkyA413OF
	TqKdnCcIMLd5oPFCEKaxGZsnHAEl2FI51pGRG2RyeTQCM28VJoEfDtY+YKkz+SJCzeGpA3KTV2VsD
	unSnUo7luo9zUJt9CVnWvnj4JQj+s8hDtuj9hcw+oD31w0MuOPEYrjV4Kk6CG/p2jNtQNgARUQOV+
	FM0EZaQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWl-0000000DFla-2S7C;
	Mon, 06 Jul 2026 17:54:43 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWZ-0000000DFbG-3jae
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:54:37 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-493c619bb52so23525385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360470; x=1783965270; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mMzZELxNMWkvZmpbYeYedfqqEOctYU5iyYuamj2u6LM=;
        b=C604P2a6qelUe5AzwRtKix45OWi4QRcBJE/b7Pd2tJjyg2YFvmW2vA44LdMtGnUW7m
         FBPgoYMHHy3Xo88jST3YJrtLHupyv0NWEe6Hq0V0Ug2d7PGXyYSijtxTtsnXa25W8WpC
         6TmbZqTBBGMUlTQbywQRw2E07trW9mqcnGDO3B/fIGBNvsBVG89JERw2XbmeCk2YiE8I
         xL1Az6utqjsRfXO3H2ySxHsmicSlkMqTu9L9FQXWTjFtHQjrBMn5u0uF+N1eql646rVd
         9DUrTi+/XJ9nGVVYJkBpDLazMxMDyntDd2bsKIpbAouArxVoAYFnstONrdMO7Hzqf4r6
         ItLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360470; x=1783965270;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mMzZELxNMWkvZmpbYeYedfqqEOctYU5iyYuamj2u6LM=;
        b=DJR4FU4NrG94q8WeAFkzkuHB71v0dfhEJnpfVfvMch4fhBOETTtwMGCO1Ba+N/BbqG
         MJJOFjD/RrUiVskLfsWUZdWeFbv2Rb+tdDnQ00wMDKLEYCfFPLSzx6Qqiv6/FTPZDlm3
         ZbfSyf/JuQNu/Rpa8SZscLihOAbNu/m8VICw5razmtZeN0gMa4EukgQMDwNyWjkRMYvL
         XrWa0aWO3P4fo6qyJIQqZz8yLDqc/0knPTNfzPtjIL65GG/0awMMf1r6FxSGtJE0DWo9
         TM4XyukRuh6R83FC0+Ygz2pP3SkIsg62FnubXIlEimuqK5NdhWZk3BhzMkqCM+wKOetB
         6y5A==
X-Gm-Message-State: AOJu0YyF9VKjA8oXsW+lTfcnycnB/U9JVJ6QCxY0AdSKZibikkV28NPX
	vTgsm81DsFgn+M2wvlFAlpLYBS6Pqa+KSs/ClRUrA0Z2y3UU2kHUtFF6sJTLJzEZp4xbEHqX+LJ
	QmLU5Jx0CpxKdnNaYAhe48w==
X-Received: from wmhf18.prod.google.com ([2002:a7b:cc12:0:b0:492:4659:9cd8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19c6:b0:493:b03c:5650 with SMTP id 5b1f17b1804b1-493df06d8cdmr18355405e9.19.1783360469509;
 Mon, 06 Jul 2026 10:54:29 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:54:04 +0100
In-Reply-To: <20260706175415.2604046-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175415.2604046-8-vdonnefort@google.com>
Subject: [PATCH v2 07/18] KVM: arm64: Add pkvm_hyp_req infrastructure
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_105432_007468_01DF402D 
X-CRM114-Status: GOOD (  18.17  )
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

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 870f7870bb62..0be1469e7874 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -203,6 +203,95 @@ struct pkvm_mapping {
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
index e2c8714e8ccc..5ba8b81b8c6c 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -16,6 +16,9 @@
 
 #include "hyp_constants.h"
 
+#define CREATE_TRACE_POINTS
+#include "trace_pkvm.h"
+
 DEFINE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
 
 static struct memblock_region *hyp_memory = kvm_nvhe_sym(hyp_memory);
@@ -617,3 +620,25 @@ bool pkvm_force_reclaim_guest_page(phys_addr_t phys)
 
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
index 000000000000..4bf57c12e7de
--- /dev/null
+++ b/arch/arm64/kvm/trace_pkvm.h
@@ -0,0 +1,37 @@
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
+	TP_printk("type: %u ret: %d",
+		  __entry->type, __entry->ret)
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
2.55.0.rc2.803.g1fd1e6609c-goog


