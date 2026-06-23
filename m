Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BF8CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gM0gY06Xu5IO976P3K6XmNc5FNoYV9i9exHGc/fednc=; b=MuwOL8pNusmTh3ddtRiN2QPaMK
	AHh3vER0rdTybeoganhJDB6B68Hk737Leu0GsaTy/l6oS5wvYJ33FFmxkzfXWYNUlrJzrcHoD/U+V
	iIfDsPysJSgLe9r9BUlDJhFrFCJoaobsD6ENpwmKl4siPUbnmbKNTbM8ZgBFskiehna13BEYC1KHt
	pgxw062x3J4CMc9z1dCMyoxmNMAzh78fOJ/QVbEWxu4LRGlwR0RofLMsJHwONDhbZ37p638LRi05v
	upF3t/VC8Xw/nTUna6J+ID8MD3Ar2NQUAwTMzOLsVxWuiEbv0yNXbS/6mmfIqgi3CF0J45Lx4T60s
	JG7QM65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhx-00000006D9i-2RV4;
	Tue, 23 Jun 2026 11:54:25 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhv-00000006D6H-0E2K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:54:24 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b4d3d3e6so34981275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782215661; x=1782820461; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gM0gY06Xu5IO976P3K6XmNc5FNoYV9i9exHGc/fednc=;
        b=lXz4D2yKBEAEVxo+QnH5UmLX2QBT3EWqXsetytcdMYcLsIwtVnUxHQDUp7Kms00ksi
         KC+kEcgXdNOWwWFw2D8nmOPGXRuq8kO4pBA2x75NeWE5ReU4KJ9nTA6xX4pm1t7crd3X
         Fk0uiYIBQ3FAALHOTQKqT2DTSdLtYiZQDuvmCn5G+4OPNGTdiCLjRg394Yup5F5Cir32
         C22/QtG57n+Jv3AqPWmg3SJMgHaYbvp/YgTl+Ij11vJIRXWlbzbDaVGmBZLxbeZeGKVh
         wwC76GedLV6DdmC8h58BRWhSWFapdFVN+1pZq5T3nBVbixlSPjKzLzW7Luj5uW0OSoYP
         CFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215661; x=1782820461;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gM0gY06Xu5IO976P3K6XmNc5FNoYV9i9exHGc/fednc=;
        b=QO8iPS2HZQmhp/7PtnHlgZJDQsjLCi9FDTv06tvisSIRJ4c7EatTJh7FU7wtMdmbJk
         Lk2EjKMrKEFGjUbzORyfnZvz67qJnJWnIqayYfcsV9l/ygg1oxF1D9DmEVw5qV64K1x6
         jxw5Dpp2ZmfeNIv8YG9cGze2HjBHaLYBJ/+xLRSqrJJAsmziNoBSPpgA31VbQNOEVVEC
         q8sY7oplwexQO7zxhX6xlpQAMR2XX0kwthRYW8a3pwmBuBMuNPUOyIhR1wPxBOodFMUQ
         5khNUSXLkhicskswax9Ogs5dg0WYqE8vcIILoziiY1196JdY95HoWscQEpe7VjMEulkM
         c4yA==
X-Forwarded-Encrypted: i=1; AFNElJ8uzZXlAxgUMTh3ZKFytqj96wYCHNhwax0DiO1nCutKGLtNKTaLxJnhhlgoShfXeJbNqNTJC75ulSrwmqLvbkt1@lists.infradead.org
X-Gm-Message-State: AOJu0YzEjpL4j9PTAtj9IaVxlCEnn6Dt7pFf27tyqeM9wVuaiNOoONwp
	ovq8B25I8JXagETLoAbiSvEhGSW3O4ArsNGJE3tb89bbPDluidO9C9cPJdJsr10W9tTBfc2BbVQ
	ambgbby21S4OvlWk8vzU+7IwO4a7PKQ==
X-Received: from wmim8.prod.google.com ([2002:a7b:cb88:0:b0:492:2b56:8534])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a51:b0:492:379c:32ee with SMTP id 5b1f17b1804b1-49249083c09mr240289965e9.6.1782215660598;
 Tue, 23 Jun 2026 04:54:20 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:53:54 +0000
In-Reply-To: <20260623115354.632361-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260623115354.632361-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260623115354.632361-8-sebastianene@google.com>
Subject: [PATCH v5 7/7] KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
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
X-CRM114-CacheID: sfid-20260623_045423_107027_4EE37DE4 
X-CRM114-Status: GOOD (  12.09  )
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

Allow the host to query the FF-A notifiction status and proxy the info
get message to Trustzone. Make sure that the SBZ fields are enforced.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 053efd99bf11..5539fb0d246e 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -717,8 +717,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
-       /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
 	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
@@ -1028,6 +1026,20 @@ static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_info_get(struct arm_smccc_1_2_regs *res,
+				  struct kvm_cpu_context *ctxt)
+{
+	struct arm_smccc_1_2_regs *args;
+
+	if (ffa_check_unused_args_sbz(ctxt, 1)) {
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
@@ -1107,6 +1119,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_GET:
 		do_ffa_notif_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_INFO_GET:
+	case FFA_FN64_NOTIFICATION_INFO_GET:
+		do_ffa_notif_info_get(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.rc0.786.g65d90a0328-goog


