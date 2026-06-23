Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71FECDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ruH570qazxtSF3aFB7lL9Qp3QXgfyQrybu1/V/Yxmg=; b=KiNxQhzYAkj4SVRjfVMFIJECRb
	g1nuE/7j5k2Mr1kT2otm8oktmci2aI71um5NhHxzyg3YZod57gLb39mUo6eseocPWvxnt6MXDNOKK
	nH8h1ftuXms748NSegObodUVvsAqJLHxZqT+t0qVOQwvqDdkuxVuF8n3wB5kvdfuOIoP9PAVD9WNd
	aeI2i0OoRGhb4ji6Qx4UpntzL6UkPhTgmMnGjiyWSwgjM7pL9qrd8j/Gmi3eOQ0mTQPFI1mlLttei
	GdOSCRaGuvJarAhG/dGj8pLI+F1T63fn1/TC2WekkK6zwdIwqF95eiq6BfYeIK/+rrTRaKOfesCIw
	0OtGx/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhx-00000006D98-1jL7;
	Tue, 23 Jun 2026 11:54:25 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzht-00000006D5m-1IXK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:54:22 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-c0cb08b20b2so315941766b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782215659; x=1782820459; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ruH570qazxtSF3aFB7lL9Qp3QXgfyQrybu1/V/Yxmg=;
        b=pLVCLHbnxRhSu08hEnTp60VO0QNXPeSnyQpk7I8Hm3pRMLxr8QVQ8AmmU5zCIoqlTK
         ZAjF0LW/ULK6Adm+sH7Eed3sbsHBmXaRkXpD1siTF2gB6JQ6nK9FFwAD3ia0+G/XJmIP
         ZBnPyAwaUOFSsMFtZ1OPs+Lgan+OL+1aupQgfj/Mm7sUco6dcBaN6T3B/Onk1gxG8fLN
         z4nwVp5yAJM3OKqLQAPyw/5mjWapUgpeJ063CxrOFjXAhk7argmkjUvxF8u1reNouf0m
         m++Vznnn7PCe3BwK90O5hEeolx+AmfvEzbvSXbNaxV53u/7BB7SCLjUSNVwsGrJB16qf
         +WSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215659; x=1782820459;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ruH570qazxtSF3aFB7lL9Qp3QXgfyQrybu1/V/Yxmg=;
        b=Bo+Jw4SMZdNybL4GIcbzCkZXoc32sRsETOpIgliGuKPm0RHfWJV0ReYFtNm6t6yHao
         8mkTlbN/Rt0Rq3RCxh217R38jp2ECzWm26wZeHgkvdAgqYym0kPaHDB9VotjeKOVoCQC
         T1ALo2rSj/5QxRYyzwLyooBc5qmofGBDdH1FgyU0RNaWhf8KTT3ygFWHho4q8acjoSz6
         4uprYNr60iO8m9678glxYSjknNKOh5wJbLjGOrfsnNyVOBLgJtoTsemChgVtPPvATunR
         nz9L7J7udJHRMMDPAo2ryTXMrmXr7yI0bkdPRVdY0Z9u5zIGg0P95mvdRLl1Ko72e8EV
         odiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XbCQoXEfyVtNCK0aq2L9iRwr9vXrdpcnnAdwFoOh2yoyFWSPkeo8FJtL4NrG6RBNZaO9abKAUUgofhveiskqg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/nt183xIVQn3itZd2eRiCHGh6pGpzCtiQbWO5Hu9xotN+v7ue
	bK/FU7PgaD0WFuI5Xn4+PqS4w4QpB4P5ly7HLPxaRi0sBc+jQpvDo4NoQPbSZEk80xJYI1Hb+mr
	kBEebxdBPAwEhNycJ5TMCYORwSnyFXA==
X-Received: from ejbmf19.prod.google.com ([2002:a17:906:cb93:b0:beb:c090:4709])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:f585:b0:bed:7f50:c724 with SMTP id a640c23a62f3a-c0c660cedaemr680222866b.37.1782215658302;
 Tue, 23 Jun 2026 04:54:18 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:53:53 +0000
In-Reply-To: <20260623115354.632361-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260623115354.632361-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260623115354.632361-7-sebastianene@google.com>
Subject: [PATCH v5 6/7] KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
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
X-CRM114-CacheID: sfid-20260623_045421_363553_3EF79CD5 
X-CRM114-Status: GOOD (  11.64  )
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

Allow FF-A notification GET messages to be proxied from the pKVM
hypervisor to Trustzone and enforce MBZ/SBZ fields.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index b30dfc192d09..053efd99bf11 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -718,7 +718,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
@@ -1003,6 +1002,32 @@ static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
+			     struct kvm_cpu_context *ctxt)
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
+	if (ffa_check_unused_args_sbz(ctxt, 3)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (flags & GENMASK(31, 4)) {
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
@@ -1079,6 +1104,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_SET:
 		do_ffa_notif_set(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_GET:
+		do_ffa_notif_get(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.rc0.786.g65d90a0328-goog


