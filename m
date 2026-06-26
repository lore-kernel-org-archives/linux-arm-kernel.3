Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79ABCDE00E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/ufGm0/gR8nHfEhXcbUb8L6QO2HXRkkGS5TfPgnqx4=; b=K0qWW4C0+Dse+zGFoQctIQmo6P
	YDMWfwJavarR6lkTH8pp/JM/NGHi7DS53j0uvu39mgRYgo6qDp7a49XqpcrJpVyZ+YOi4aog7JKr7
	dJMwY+GTMShoEnDOVNEwAjE2tnJYYQpTJYi4GgWqypzFFPtJf+RViahPLndsKZyGHMiM58Hfe6Jjz
	NcDjLqPoCXrv/+qVQsi79GocNLuJV+NLMrgE+kZ45/mTJhjfhaer8OqCSLPfVCn6gO1ParT2s8nHI
	iL+5PE2WBhUsTuf/ROCat+D6ZFiEC9pjlQF6gdHKqQgys/8WVT3Uh4CgTpO/Rt1c40AsEj/7mU31o
	eFmNpeag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1GI-0000000Ahbi-1nc3;
	Fri, 26 Jun 2026 07:46:06 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1GE-0000000AhYI-1YDX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:46:03 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4642a5651d4so516541f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 00:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782459960; x=1783064760; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x/ufGm0/gR8nHfEhXcbUb8L6QO2HXRkkGS5TfPgnqx4=;
        b=QNecLeecmgk4Mxl8JqlbIvSUA8g0IN/BqKLt1/CPEnWUsg2d6XPd57RSD63mX992Ss
         n6xpFdWUhWPpkwc/iV67i6R0uIZsrZn7oE2CcwWMinXKyix6LCMxfokjq5sbAEzTH3qP
         yc0vjgzD64SNzuiJwc1mQvWVNueuXAeCm+NFdruydZX0ZwacOgwPmNR4tuvSAKgMLFNn
         lhYtApIj+xsHJO492shyyV4yZAAle6ZR/y3v7NwPFSM9XXwNjopSt9MkK0E6FRTjlaY/
         /tTw5jGFiZdXr9SH94O0dzAXnY0qt6FXf7Bq75Ox6sC/lALbfkpOrlOJ5L8xTujm/BQU
         bVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782459960; x=1783064760;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/ufGm0/gR8nHfEhXcbUb8L6QO2HXRkkGS5TfPgnqx4=;
        b=LswJAuA4ysHVNSSyfa09FPkAYKuFB6nCj27USN1BsNWw9JfABrwpXO2Yf+ipffx9aH
         EDzGH6UJ7N3+H6J4noHc/8/zx5Q1hVRkNupi5/AU9LHjNgnerR38ogRcFpck2p/82kNC
         xgXNa+svLI9uHp8t4jpe/yDd8Z9Od4s7aej0eqcMEbMWTH2Og1sg0dqqOJ2zHtC0WrBN
         Awb9C6hODQFkgKdguguUEgLAebVw+HajGZtEqAS5VcsjfQumt7TPOOIm2j9Pyf+naEBC
         Lb3pTv+Spobbztx67SQTv9TCIXVwNz7UqDrwGXHcvYwivS2pAsasmTxYttx8CRsnonTA
         Veag==
X-Forwarded-Encrypted: i=1; AFNElJ+LL7GDoNhcTFeSFGjTl4oRiDkkHNoAdR6ZmUmnqdMB0eID8x7IT0AlaVAx1jINaBcbDSSy92kOItiwakkus0hc@lists.infradead.org
X-Gm-Message-State: AOJu0YyHIYm8gGadDZslX8/CplbpsOH3Q+HQ4e6QEOI7LuAnfvlpLRyy
	WGOuK+ZcsCB2Dv+O/Ce9+dMgpjWpBLLOjq9KyX85Enx+G2Z2d0NW3epX0z7HE90p1I4lRtVMQxM
	noWHFLCR2aNtbQFQlE40gClXompQrHg==
X-Received: from wmbjp13.prod.google.com ([2002:a05:600c:558d:b0:492:48ca:10da])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c3:b0:492:699e:3113 with SMTP id 5b1f17b1804b1-492699e319cmr34534395e9.35.1782459959740;
 Fri, 26 Jun 2026 00:45:59 -0700 (PDT)
Date: Fri, 26 Jun 2026 07:45:40 +0000
In-Reply-To: <20260626074545.433234-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260626074545.433234-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626074545.433234-3-sebastianene@google.com>
Subject: [PATCH v6 2/7] KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_004602_438421_BACF4D0D 
X-CRM114-Status: GOOD (  14.01  )
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

Verify the arguments of the FF-A notification bind call and forward the
message to Trustzone.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index ecc13b795f2c..331d9d0d8287 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -42,6 +42,8 @@
  */
 #define HOST_FFA_ID	0
 
+#define FFA_NOTIF_RECEIVER_ENDP_MASK	GENMASK(15, 0)
+
 /*
  * A buffer to hold the maximum descriptor size we can see from the host,
  * which is required when the SPMD returns a fragmented FFA_MEM_RETRIEVE_RESP
@@ -676,7 +678,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
@@ -875,6 +876,27 @@ static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
+			      struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, flags, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (FIELD_GET(FFA_NOTIF_RECEIVER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (flags > 1) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	args = (void *)&ctxt->regs.regs[0];
+	hyp_smccc_1_2_smc(args, res);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res;
@@ -937,6 +959,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BITMAP_DESTROY:
 		do_ffa_notif_bitmap(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_BIND:
+		do_ffa_notif_bind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.rc0.799.gd6f94ed593-goog


