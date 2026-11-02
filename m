Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDD9606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=39809zmm;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mkhTKPLq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fsQ32GKuLmzAYlUfpffrwu5U1YenErwOGmC3ihKQLW0=; b=39809zmm3gn0cJf7QKkNaXDk55
	1uhBqFiBvLzrpzrIAKFEPiR/MictMAKadKYPcjPRyIqu4Pgo7c2wPqdMKhLK1ACoycazfraee0ecJ
	6rMYJ56uuKKGjkktM/fjDK14ruilwgILYf4yNsUNXIa75C3LZlZOLk/tqy2gxu1EzkLLd3Lmwj7C3
	sguXS82hXsVxWcsZ0zX74AlmDluICSeCkLMSLaYQUecmWLsRDkmVOtGwEtPozi/DFx0DZZCe1hmBB
	Wb3yMMrfrsYOR2tA7HEjNhVOAk8gSjJravWUhDlHwwjryKS/90JS1Ilb+3OcIIArsX8XDFpDHIYaH
	+eKitfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNywF-00000000O3B-34fa;
	Mon, 02 Nov 2026 20:47:31 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyw7-00000000NnK-05o3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:24 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-48b01a74792so2300977f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652440; x=1794257240; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsQ32GKuLmzAYlUfpffrwu5U1YenErwOGmC3ihKQLW0=;
        b=mkhTKPLqDQE2I+R5bTRGgf3TXe52cOAdE9zLE4g4iRLvXnr0yYtKLuUzRuWsj2yijI
         cP++QwD/gfTnHAPm0DXhBo9/Umme/aZB6SIezdYq5WsEnIi+WoxDA7fluljdpFOo9gXD
         3R9bh/vcrVOO8RF/thWPXu+/Wj2JGHJlL4xf5TpnJh9n20blSncw6O6q9+saxp7LuaMl
         pSlrjrj0gTYbnOpVq9xGRLq/MIOUBvBP0hZQmzbkMBXGopKx3GWeRFseAyfvRHNEFl/4
         wLGx8pZWjB9WvPfU+2qbNY1loG09TqeSq19vWyPxkSA5gGuycHFYdulUxXMc40ZMS+wu
         qSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652440; x=1794257240;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsQ32GKuLmzAYlUfpffrwu5U1YenErwOGmC3ihKQLW0=;
        b=lL9mctd2w8Os++i8HOse3NWZdAUU28lzDuy9US2Cq380dLcWDTVlT2GJNVH6ieLOhC
         roP5dBCPcwv1/S9TNcKgu6Wvtw/ittxBGO0QxN7aKm7Y78OJSCEVL6vokbd7lUcDta47
         8kodQZz89hKZEbA9E4/cRe5aj6MWYcaXdU3KjYq3w+y4XEpUsfHQu8g7w39rRxm6xgbM
         If7sYOJfTS1u7z/vCpDLYriI4oGHxFUPLQ6LershAHxP+JNBwIKc/h+aXyGQjMHDSbRr
         mBJ81Fn/fxsvCKXF2EpnVB6WCMfJ9OK7W9CRsqcnhElLb/136G9D73QHfYm7rVSiZX+5
         G4vA==
X-Forwarded-Encrypted: i=1; AKwUvBytKjEebENqI/9hvOONcyfud4iiUiY7w1Vs1Z+Z2W8Y6M3f9QtAelYObgW2jqdJX87RTV5kmF1Sxc6W958xWBjg@lists.infradead.org
X-Gm-Message-State: APuU4Z8iRKotOPJ3IvV0OIUe14NQbCfEcX0dUbd6owD5VfXDK6ru2ZFT
	U0JDux9MuOaMSnpAotCXIdRITmpLKZ+rR6IjbzA7PY8qZq615h3pkTdMRsfjcvgWzwwGhiFq82p
	ccZjBTITGvZabbFXWtnNCHg==
X-Received: from wrty13.prod.google.com ([2002:a5d:614d:0:b0:48d:ee1f:7396])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2388:b0:48e:b1a:fa6 with SMTP id ffacd0b85a97d-48e6e3002cfmr25287477f8f.40.1793652439854;
 Mon, 02 Nov 2026 12:47:19 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:22 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-18-vdonnefort@google.com>
Subject: [PATCH v3 17/23] KVM: arm64: Add vcpu conduit for pkvm_hyp_req
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124723_236199_CC5BA291 
X-CRM114-Status: GOOD (  20.85  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The pKVM hypervisor depends on the host for a lot of operations like
memory allocation. It can raise a request by populating a pkvm_hyp_req
on the extra registers when returning a SMCCC call.

Add a new conduit, using a per-vCPU pkvm_hyp_req, populated on
ARM_EXCEPTION_PKVM_HYP_REQ. This allows processing the request later, in
a less restrictive context than the one from where the __kvm_vcpu_run
HVC is called, just like the other exceptions are handled.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_asm.h   | 10 ++++++----
 arch/arm64/include/asm/kvm_host.h  | 26 ++++++++++++++++++++++++++
 arch/arm64/include/asm/kvm_pkvm.h  | 24 +-----------------------
 arch/arm64/kvm/handle_exit.c       |  3 +++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c |  2 ++
 arch/arm64/kvm/pkvm.c              |  9 +++++++--
 6 files changed, 45 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 3efc63e1a823..872185f9ac53 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -17,10 +17,11 @@
 #define ARM_EXCEPTION_IS_TRAP(x)  (ARM_EXCEPTION_CODE((x)) == ARM_EXCEPTION_TRAP)
 #define ARM_SERROR_PENDING(x)	  !!((x) & (1U << ARM_EXIT_WITH_SERROR_BIT))
 
-#define ARM_EXCEPTION_IRQ	  0
-#define ARM_EXCEPTION_EL1_SERROR  1
-#define ARM_EXCEPTION_TRAP	  2
-#define ARM_EXCEPTION_IL	  3
+#define ARM_EXCEPTION_IRQ		0
+#define ARM_EXCEPTION_EL1_SERROR	1
+#define ARM_EXCEPTION_TRAP		2
+#define ARM_EXCEPTION_IL		3
+#define ARM_EXCEPTION_PKVM_HYP_REQ	4
 /* The hyp-stub will return this for any kvm_call_hyp() call */
 #define ARM_EXCEPTION_HYP_GONE	  HVC_STUB_ERR
 
@@ -28,6 +29,7 @@
 	{ARM_EXCEPTION_IRQ,		"IRQ"		},	\
 	{ARM_EXCEPTION_EL1_SERROR, 	"SERROR"	},	\
 	{ARM_EXCEPTION_TRAP, 		"TRAP"		},	\
+	{ARM_EXCEPTION_PKVM_HYP_REQ,	"PKVM_HYP_REQ"	},	\
 	{ARM_EXCEPTION_HYP_GONE,	"HYP_GONE"	}
 
 /*
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 97332ffcb130..0161bcb8123b 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -138,6 +138,29 @@ u32 __attribute_const__ kvm_target_cpu(void);
 void kvm_reset_vcpu(struct kvm_vcpu *vcpu);
 void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu);
 
+enum pkvm_hyp_req_type {
+	PKVM_HYP_NO_REQ = 0,
+	PKVM_HYP_REQ_HYP_ALLOC,
+	PKVM_HYP_REQ_HYP_ALLOC_SELFTEST,
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
 struct kvm_hyp_memcache {
 	phys_addr_t head;
 	unsigned long nr_pages;
@@ -1006,6 +1029,9 @@ struct kvm_vcpu_arch {
 	/* Pages to top-up the pKVM/EL2 guest stage-2 pool */
 	struct kvm_hyp_memcache stage2_mc;
 
+	/* To be read on ARM_EXCEPTION_PKVM_HYP_REQ */
+	struct pkvm_hyp_req pkvm_hyp_req;
+
 	/* Virtual SError ESR to restore when HCR_EL2.VSE is set */
 	u64 vsesr_el2;
 
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index b75dc3d03a98..3e51337f2d9e 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -22,6 +22,7 @@ int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
 void pkvm_destroy_hyp_vm(struct kvm *kvm);
 int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu);
+int __pkvm_handle_vcpu_req(struct kvm_vcpu *vcpu);
 
 /*
  * Check whether the specific capability is allowed in pKVM.
@@ -231,29 +232,6 @@ struct pkvm_mapping {
 	u64 __subtree_last;	/* Internal member for interval tree */
 };
 
-enum pkvm_hyp_req_type {
-	PKVM_HYP_NO_REQ = 0,
-	PKVM_HYP_REQ_HYP_ALLOC,
-	PKVM_HYP_REQ_HYP_ALLOC_SELFTEST,
-	__PKVM_HYP_REQ_TYPE_MAX,
-};
-
-#define PKVM_HYP_REQ_SMCCC_ARG_SIZE_MAX \
-	(sizeof(struct arm_smccc_res) - offsetof(struct arm_smccc_res, a2) - 1)
-
-struct pkvm_hyp_req {
-	u8 type;
-	union {
-		struct {
-			u32	nr_pages;
-		} mem;
-		struct {
-			/* Helper for SMCCC encoding/decoding */
-			u8	args[PKVM_HYP_REQ_SMCCC_ARG_SIZE_MAX];
-		} args;
-	};
-};
-
 static inline size_t pkvm_hyp_req_arg_size(u8 type)
 {
 	struct pkvm_hyp_req *req;
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 9931192735d4..2030675304ca 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -18,6 +18,7 @@
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nested.h>
+#include <asm/kvm_pkvm.h>
 #include <asm/debug-monitors.h>
 #include <asm/stacktrace/nvhe.h>
 #include <asm/traps.h>
@@ -464,6 +465,8 @@ int handle_exit(struct kvm_vcpu *vcpu, int exception_index)
 		return 1;
 	case ARM_EXCEPTION_TRAP:
 		return handle_trap_exceptions(vcpu);
+	case ARM_EXCEPTION_PKVM_HYP_REQ:
+		return __pkvm_handle_vcpu_req(vcpu);
 	case ARM_EXCEPTION_HYP_GONE:
 		/*
 		 * EL2 has been reset to the hyp-stub. This happens when a guest
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index c322ef4432c9..41817f45115d 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -734,6 +734,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	case ARM_EXCEPTION_IRQ:
 	case ARM_EXCEPTION_EL1_SERROR:
 	case ARM_EXCEPTION_IL:
+	case ARM_EXCEPTION_PKVM_HYP_REQ:
 		break;
 	case ARM_EXCEPTION_TRAP:
 		/* Nothing was marshalled for this trap, see sync_hyp_vcpu(). */
@@ -803,6 +804,7 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu, u32 exit_reason)
 		break;
 	case ARM_EXCEPTION_EL1_SERROR:
 	case ARM_EXCEPTION_IL:
+	case ARM_EXCEPTION_PKVM_HYP_REQ:
 		break;
 	default:
 		BUG();
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index ae53c701206a..c55b6d442d0e 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -765,7 +765,7 @@ bool pkvm_force_reclaim_guest_page(phys_addr_t phys)
 	return !ret || ret == -EAGAIN;
 }
 
-static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
+static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req, struct kvm_vcpu *vcpu)
 {
 	int ret = -EINVAL;
 
@@ -788,7 +788,12 @@ int __pkvm_handle_smccc_req(struct arm_smccc_res *res)
 	struct pkvm_hyp_req req;
 
 	if (smccc_to_pkvm_hyp_req(&req, res))
-		return pkvm_handle_hyp_req(&req);
+		return pkvm_handle_hyp_req(&req, NULL);
 
 	return res->a1;
 }
+
+int __pkvm_handle_vcpu_req(struct kvm_vcpu *vcpu)
+{
+	return pkvm_handle_hyp_req(&vcpu->arch.pkvm_hyp_req, vcpu) ?: 1;
+}
-- 
2.56.0.385.gac671c819a-goog


