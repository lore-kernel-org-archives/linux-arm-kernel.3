Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CE3CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ougsD+RhXFLaa2VDqlr9/ENvAMMCUbH7DpXmssZWL6k=; b=CnWSyoJ5BdSmN3lwyFfKkI76zK
	yTO9NCMzwMKCPf1UxAUPOStsiVUVOBqdQomSgM/+NR4//lQry3w5tgfi98CSfquysqlO0agjYpZ0D
	CtEVIg6WmMDQZTbyqVCiMzdPvEPtW2yzJUyY9yJry80UeP2BChqLhHXeSSzfr31SMsTKgpbnyMnlz
	kTrAyNR+Ak0S9GR68pGwllEsydh3WJKH6WOU4Y6mcgV4wuGndPivqtfwvkTSEcYg+iyyeOIcyzkcu
	UU6RAoxaKE5U2Pvqh05SUBcGzBdcBjY0Pr3RtjQBGLzhnxkfZa0Q+TsxYU62J8vlRq2LkLlQX3bnR
	LWbMviQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVvr-0000000G2Lu-0cIT;
	Tue, 16 Jun 2026 15:42:31 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVvk-0000000G2FJ-0ix9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:42:25 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-68d233bf9easo4775358a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 08:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781624542; x=1782229342; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ougsD+RhXFLaa2VDqlr9/ENvAMMCUbH7DpXmssZWL6k=;
        b=JKgl5Vzbq87jx5BOxqf3edq9nlX0GKHWOZntH6ejBOleHNaDnHY6S1Bkj+u9bd8UNH
         Sqfr0qgpgh+g4BOF4vYJNZzrYwU/Ijqy+CqDjMhUjD6efaxL80jaUJhHxcTHolETrJuI
         pZJcn3tW1hyZdD2xu2V/pE2KYXrSbeYotUEv0wkJj6nLityQOZX/mla6+5P9ItkQvrHN
         hF5DA/606ZYEEWbWZqOGJ+aHoXXKmKqm1asRaefyhrUigwUsLnNuqBDY+rMWyS4YuJrI
         3L03Wx2NQXl/AoHkkaJQE1Lkxfi3XnknGlf+H5ggCJubsGFDBwdOjLoYtzaH2Ed8tp3f
         6N9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781624542; x=1782229342;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ougsD+RhXFLaa2VDqlr9/ENvAMMCUbH7DpXmssZWL6k=;
        b=Uhw8nFocASmT2xByuJvbBW1btDsE8UDlwUVysIKdKsPARDBsjehPik22K0L++qeznQ
         Q+dbEJ1MD3xv3oR392C2wUpQz6q5wNoLBtRBYk1XUFC/giUnHpufakfACav+1ISKjE7q
         eHR02iGBvyvInTNjoOgUaTAd47iuyNGeLa9HJ7GxDnovyRoLAz2TWvfs4aCojososkSF
         bEweDbKYsOJzsQNF7H404273Rn7KIAKC29fI/2g/t1MUFOxEW9DxiYwqiKDwLk0DTgt0
         F/T2JLnrTu3Yt8T85ErPe+r6SCtGSm4Kd7B1hhZAP1GBTjodrXeONIRj9XW7Kfw4JV7l
         D4Vw==
X-Forwarded-Encrypted: i=1; AFNElJ9yiIfwW9CZE1oNIucLn8uyquoOQM7hD60MV0whnhyIrhNrzeJfSuukQVegjmO/oY6M+tonWb1OmncXV7P9Ogbe@lists.infradead.org
X-Gm-Message-State: AOJu0YzzN+Eq0uYi9dYrTPP851TO0XYV3HpWHdrQNzQSeAM7rZA9cKvM
	VJW9BePjspsW/S+ONxFBlyywwZ9FURF8vZRgvfCRAj9DBK5aI1u8edGP4aO3VSRWEaecJxjMphA
	3ZWF3uI29pdcpdXNDvB78W2fz2t/ozQ==
X-Received: from edxf19.prod.google.com ([2002:a05:6402:14d3:b0:695:4685:bee5])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5202:b0:689:816a:5367 with SMTP id 4fb4d7f45d1cf-693c696b2e2mr7055459a12.0.1781624541532;
 Tue, 16 Jun 2026 08:42:21 -0700 (PDT)
Date: Tue, 16 Jun 2026 15:41:49 +0000
In-Reply-To: <20260616154149.2763214-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616154149.2763214-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616154149.2763214-8-sebastianene@google.com>
Subject: [PATCH v4 7/7] KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
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
X-CRM114-CacheID: sfid-20260616_084224_545105_91000314 
X-CRM114-Status: GOOD (  12.01  )
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
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index de4794338388..ffb6d44b5010 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -715,8 +715,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
-       /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
 	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
@@ -1026,6 +1024,20 @@ static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
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
@@ -1100,6 +1112,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_GET:
 		do_ffa_notif_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_INFO_GET:
+		do_ffa_notif_info_get(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1136.gdb2ca164c4-goog


