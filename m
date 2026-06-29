Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1342C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/ufGm0/gR8nHfEhXcbUb8L6QO2HXRkkGS5TfPgnqx4=; b=Zm44WtfUuouK232rZOygnryF3i
	D4RCDtr1Ue0a1YNl4H4slqmSZLYQq1lVQJxLXhB+K/gjiK1AyVTZ3xe7XgqyMo6Tpoi//SCvnvWyF
	M/FOdfLQ6OCn30Tp+P3DeG3tVJqIFP9VwiAuKBb1JLmh5uM3E1sC3zSU7nLT7JDDitR3YFuahYVoR
	GCh12iC48JzPHUp8DLvlC/EoM9ICYAj45A3oLd3XDllOl6zj6QtgBWsi4jo//tH69vQdIDm4BAPEb
	e4bzMohY0Yx/TTchvCoDHrUX6OgypOfnusqDKa1uxCTa7Iry+f2p4GTYl52wjv8hhe0mUqrIklzZw
	iORZdU2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Pc-0000000EBUD-2jxe;
	Mon, 29 Jun 2026 09:36:20 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8PW-0000000EBP3-0brm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:36:15 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4926d371224so18396095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 02:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782725771; x=1783330571; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x/ufGm0/gR8nHfEhXcbUb8L6QO2HXRkkGS5TfPgnqx4=;
        b=WJNx06/JfpvqnEKZBIGP4TUr9JuV6R/rnbEM17+MGbrr53fQ34hXND1pwLUCMLtorx
         bf6MCzPlCyFBtVEc4WXhNWpDppxD9WBbtqFQTkWCzuPH5a4gi4bEr7xtdyaDHve5pRJ0
         rRLIdKe6tX8MnlOHX3xPSh6DRUxYhx6mSdpgOIJoIgRHxInWM9r+BND+qpEg3WKpQLra
         foxLAdhUSBUJvoig8GJOTIoObCyXQ3LmA7PYwevjnLQv7clYflf4WDFWziVPbQE20Kew
         akpJ58DnWXQ/ylJsIpm1PraMhYHSgoR+x05xkKgSciLdKZW+ryMRUYCnsj3xVgOwyZms
         nObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725771; x=1783330571;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/ufGm0/gR8nHfEhXcbUb8L6QO2HXRkkGS5TfPgnqx4=;
        b=X5Ded8SY1EE4LrwRVTpcMse1crGAkvBjwwJsIuI4UV1OCPjyQsDWUpBSbYRnayIQxP
         JidJst22M2QVkXjH6ic+7upS5bPrbkLLQSKcZlDMk855/kPAaWuWssSvftl/ncTWZ+pK
         pq1T2gHSDbD+5wvgE8xUsHLsODiono+cZg7etd10TUzt790pQjcyaqry8H70rn3ACkn/
         7RE8wdbEgP5/iovk8TScXnwy0fa0bgH90jb6mJHvbkywrFt7BFLdn5rsF0wSwq18I216
         d3kEu0hVxP/4x05R5xXPVBdTCYMkVRP6JTMezLhT7cY1hPuVenV1y/TopxI8RrCNJz42
         xPuA==
X-Forwarded-Encrypted: i=1; AFNElJ9aCatKgzCqTHBMNf8JrktDT55d5aOIjV6oxU2UKigNC7gJfGxzUbVKPME1ijrRTO/71Rt/EqBlRX1eUSXOiqOc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4fs1CyCcHm0bvGY2KIAVdfC36xxioDk4KcRZZpLnv+Qu/T1K0
	SbwwsQTlh4UFtx36Huivu3b6b4/LeBwM0bAXlY0+K1eceNYC+r7YwBLyhH9BBsXcWheEfzl8/MC
	V6ebtexyPMS6FEIOaI8OkL8KWT8F49g==
X-Received: from wmro8.prod.google.com ([2002:a05:600c:3788:b0:492:49e7:fff3])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e4b:b0:492:7078:4ead with SMTP id 5b1f17b1804b1-49270784ee4mr134371805e9.25.1782725770867;
 Mon, 29 Jun 2026 02:36:10 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:35:53 +0000
In-Reply-To: <20260629093558.2425257-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260629093558.2425257-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260629093558.2425257-3-sebastianene@google.com>
Subject: [PATCH v7 2/7] KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
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
X-CRM114-CacheID: sfid-20260629_023614_206852_5F64746A 
X-CRM114-Status: GOOD (  14.63  )
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


