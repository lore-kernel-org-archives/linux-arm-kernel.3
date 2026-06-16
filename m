Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBCCCD98E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkEKjP1Wo3utwvpO8El//6ig/85bmiEc+30pFMiWQQA=; b=wFNTkMBS0SzPjMz+vO7I4aQGNC
	YnZqF+/yZonBlbFNqi2CbV1UFYSXtLMIfi5XEevm/q8q24lwxEttsQSsIqqGoNbfPayGTs1yL6E/N
	XuqjyVq2Gi1fe9sm0LrTtiij8kxxc4dlAL2EL07b7klhTZ7LK6Q8ygEEMatKis9ZP380J6W2AEFPb
	8bZUN+yhomrJ6LXDzBXKOpA7NnQ+XMA+jCR3IfyHnacNDb7iJuAFbE5zywMfSAkeUgH74ta69HSlt
	yrN16e8KsyU2v1fbmTFBmW24DLo9rptqTmMug2W5uF7qHuoc4MRR78PhljOYKpGmmlxSJuyb9Td5A
	fyH4Owiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRO-0000000FdS8-2GEd;
	Tue, 16 Jun 2026 10:54:46 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRE-0000000FdK9-3AFg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:54:37 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490b7959b9fso45010495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781607274; x=1782212074; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkEKjP1Wo3utwvpO8El//6ig/85bmiEc+30pFMiWQQA=;
        b=aGgvHaOdo04wT0WfWn8lAX7w6e7XRxK5CHKpdzyN65eQKKsS9eN1TT9wuBHedNepou
         mX8VDB4Ds50FHz4W5raeicdNyn38RW7dW+bA8JNWRBrPmvgNdWOOXrM0HGzMIpMbs8Tn
         j+3iUt1rcD9hUHXYpUsJ9dxkdHmxG661hCBrB3HVaLi97ii1N/2INVpZ262JfcoWlkiB
         GZumPG4KHv/fken+Rv0ryqvo/twmB+yW3ThsRBZbrvmE3sGHITvNVt2P8QS8H69T4NQZ
         im4g9ryfy8KQuYHq5fRfw6cPJYq85aPnk+FequEs8/TS6x6UiApA/p4yuXwRwz8HyAlC
         snzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607274; x=1782212074;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkEKjP1Wo3utwvpO8El//6ig/85bmiEc+30pFMiWQQA=;
        b=tWeq5hlFgNgWLn0MFzOrMjfgSOXibgh9x9amWZEm2BkdilFXsQRoXB9+3LssBEq13T
         CnAPOiTgT0GF2JXj4DOXG+xw+LSD2I9emOGBQ26uw/zxpduHhjkfS7iqc8/fePdV1kQG
         Fo0uC1IZVeG9QN2Q/4O4XyoRtrsfIoAtKfrU/vg7odBvsgCZ0CJNzADyLjEo7rwZArZS
         zNGCkYfCheXTlumwjR93LRKEA0Wiyxw8EnoFmKjjGfqRL+6aDR3lnY5w8NVgTz8IrHHn
         BFLBQZyIwFxCv8RGCdoBO8L0fwl8O0zEJdu+GuSesfzNyQa2em8Kuo/Ie/SsS5/IucB3
         R3fw==
X-Forwarded-Encrypted: i=1; AFNElJ+pP0gvFZpndKog9a3hvoEwUDmx+aDdr1tViTvgG5UaczbA3w4NNsrlecwJNxHXQtTzAMPwbmnZyLsaJCl6eq36@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt+2Zh1ZfQEuY5O2AwrJ38NXojeq6m9x7w8R53A6OGFeVxlDBX
	xZVOFCzyQAnkUC2Amxnuxvp1Ar0JWbENg2TkP+dIdpp4vyUyXCrMpBZOniM+sQ5wET/lCTVpquz
	mw8vaCEbVVfLBuUT0F0S9KS0uNKu+UQ==
X-Received: from wmsk20-n2.prod.google.com ([2002:a05:600d:8494:20b0:490:b475:af3a])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6214:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-4922ff93874mr45013535e9.9.1781607274059;
 Tue, 16 Jun 2026 03:54:34 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:54:16 +0000
In-Reply-To: <20260616105417.2578670-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616105417.2578670-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616105417.2578670-10-sebastianene@google.com>
Subject: [PATCH v3 7/7] KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
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
X-CRM114-CacheID: sfid-20260616_035436_883120_3A706CAB 
X-CRM114-Status: GOOD (  12.22  )
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
index 549250ff8f82..dac30a5fcf5a 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -714,8 +714,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
-       /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
 	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
@@ -1020,6 +1018,20 @@ static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
 	arm_smccc_1_2_smc(args, res);
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
+	arm_smccc_1_2_smc(args, res);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res;
@@ -1094,6 +1106,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
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


