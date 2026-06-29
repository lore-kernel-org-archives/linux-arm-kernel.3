Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7527BC44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Nwcle4m1xhjtWQ5cG6kqMRZxeBIvD7DoAMnMMXwmNs=; b=Mvyq1qSqfkliihyGUENcw6g12c
	vmyEk5gPAr2X1mhCHbGMfLAPM2NOM7Yb54hrtubNfRrK6pSJSDTYOF1iHsPEsNEzi2rBAm0EDguFr
	LnLugC3C5jgSNPiQVnlYnzMa4XFLrg8RHx3LHev/F/oKh66eS+98mkfR0di6SBqdH5UgE1EYa+ZUv
	gK0GzXxUW8s+ZHC/8YDQ9TGZhd1qjKIWQQIaI/C0fcboWCE6QaQEIawJ++fZscpIikigexraVRDNY
	2oN/kROZ4xEW/rEpKtgs0t2jnMYfdIU41B0T3127rxg6/Gh2hcNh5Ee6+a2HxidHgpn8NA+vau84D
	YjXs+K+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Pq-0000000EBZX-0Mwz;
	Mon, 29 Jun 2026 09:36:34 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8PY-0000000EBQ6-3C8T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:36:17 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso25506275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 02:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782725773; x=1783330573; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Nwcle4m1xhjtWQ5cG6kqMRZxeBIvD7DoAMnMMXwmNs=;
        b=NcPjECBOt+MuukqVtZu4MXwIRuoihFNGCkOxDoWab+vCgdmwNvd9fl7vO4fQbFg9SP
         jzV+nJ9tjJOfU+OJaDV+9HvUWs/i8XbK5Cn017Vh7j4gACKy1W9jG2/3KCT8HlFSJHHv
         Ia70Uv3jnmzYPcb2KlTOFloihXB/Zf1STxWtaCn0W4zqNLDaFR9smHyXfZjeGJbxOTQk
         0O7OWled7dDsYJhB1on47Jh4NIh7EDL+o+0khIvfIni26+yrJBx3KH/rWt3wzb2XEKNa
         d0xZkPufncDr57OhdPMbJGDyRvHQ5EeWYwVJCDVLgE2PeEoO/KJlPZJxzjH8D5QyU/qV
         pd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725773; x=1783330573;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Nwcle4m1xhjtWQ5cG6kqMRZxeBIvD7DoAMnMMXwmNs=;
        b=b94IW6eXssKWij2CvYPl2ywuJu6dC4ft0lYASUkRfrpRUFL3Q2a1RKwMgggdQ3avVQ
         jjY2RkF80ExN+SaRDHENoQ9WiLUSQbiD8OC6ZfDA4zCJQpWLyqKwvzO6l2AWxEpy3+UQ
         Z32gElEMMTTcssOJ+dOrKBmHHn7dnIS91b1mEjKhxohQFJewiWIwkdQ+Hj25vVc4Ak09
         E/kNQ9UW75+FUy0QRcV82F/G8wZSj9dDoWyW5J7cNBrBp5WyyolZbq6rO5HVzcB1RpHT
         NS0u03S11jt6Dlb2Qp/epuJAV1NcBqFCQO0vFWcnrIF7+4sysYdQJCGpdvkiykeQFFgZ
         amuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QVJCJf2Gt47pQLKz5/dU6zyBI2i6cidWK3wPKU80rcyIrcg7tYsxPhzEktuxcaCCvrneyk79EYe8E4sUUCdW4@lists.infradead.org
X-Gm-Message-State: AOJu0YxC3k/e/avF2/PbrtmDnpWthGZknn/6ueA3vt2c4UzXcBs6F33u
	Cw2qr+RUM5SlfqWpQPH4rw1uldoALPuhPrVJzxIAGY3VZpLZbr7f4Vst+JUlDLD0rrmH9j7sW/x
	Zj9oZpfM7490/3CRImA8Kh7c2PDSWLg==
X-Received: from wmnk7.prod.google.com ([2002:a05:600c:1687:b0:493:b0fe:519e])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1554:b0:493:b307:6777 with SMTP id 5b1f17b1804b1-493b307689dmr19016065e9.22.1782725773023;
 Mon, 29 Jun 2026 02:36:13 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:35:54 +0000
In-Reply-To: <20260629093558.2425257-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260629093558.2425257-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260629093558.2425257-4-sebastianene@google.com>
Subject: [PATCH v7 3/7] KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
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
X-CRM114-CacheID: sfid-20260629_023616_817134_4539C3C2 
X-CRM114-Status: GOOD (  12.38  )
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

Verify the arguments of the FF-A notification unbind call and forward
the message to Trustzone.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 331d9d0d8287..d52d7c4d5e7f 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -678,7 +678,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
@@ -897,6 +896,27 @@ static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_unbind(struct arm_smccc_1_2_regs *res,
+				struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, reserved, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (reserved) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (FIELD_GET(FFA_NOTIF_RECEIVER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
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
@@ -962,6 +982,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BIND:
 		do_ffa_notif_bind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_UNBIND:
+		do_ffa_notif_unbind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.rc0.799.gd6f94ed593-goog


