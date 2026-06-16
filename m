Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B185DCD98E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCFbezIeGawe2Un5+cxPY6PY3SKM8v7J2hVjyNVIFYQ=; b=dgNwgplKMxMBUdL4Pk0Ya35fjG
	EatzneJTIMpb4LafoOtICfCTsZDKPFENPbfn15D+klRy+YghH4hLw82A78SL/c1JH70kHJK3B7YnY
	O4HfIr2RaLeW+GE2tNMq1j01DYSva5AGxdMFKDyx4uojW9O+5EsfDljq0L0oz32V3x/Wmvt6J3ypO
	YONhUcRrCeZwtpJfyYWYnerUa89yGZOdMd3mkRGt8Rw4/JRVUGFKZfCdz9mNqbUJYE4npCKuub0IW
	XqmqGbTlMoDkGxO5CwQXxThTvo7b2V1sjVdUbysfoBJNMUs0xr+zYIn0R7YwacmHh6ZnihkUbxlCo
	BG1DramQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVvi-0000000G2FW-2xSq;
	Tue, 16 Jun 2026 15:42:22 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVve-0000000G2Ar-3p8c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:42:20 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490dad70f95so48414665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 08:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781624537; x=1782229337; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCFbezIeGawe2Un5+cxPY6PY3SKM8v7J2hVjyNVIFYQ=;
        b=QDY7sfLMoneU6XWRDTPcNwDZsxBFScBQ0L7YBAvdRj/Cr294Zzwc97WN9PtPGsXyO5
         V6+o93cfVq/kUgtP4IVPgSrTLm5RDmxp41enPCUDU+kH4q38YPM9qI9+SQ1w9l1b0kPt
         lOuNJBzVVtnM6pDskAbPyaDqVZU9HxGja+46vbbwrnzhtfrW5j0OP/zgqhqXm8t+3dq0
         uwe85RhHSpPWUjdD3w26fVerGB0Hqv577EPY3vmTWMU+TIuo3v4AWM5XV42bZMsgbruX
         PUpjiZ8EQVXc4KBjbWYdOL5Q4iMeTB677i/7TqatnSDKFxp71E+TyB20L1ly+2GmrlsO
         C7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781624537; x=1782229337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCFbezIeGawe2Un5+cxPY6PY3SKM8v7J2hVjyNVIFYQ=;
        b=elPpIFLFAWIICN7ykkVV6Umkg+tkPLWk3pv7YXiVErkqvUXoc1wTRwY1+DBlTUk9hA
         FwF2r+nUtkWne5fSfTq2qPlIfSzOwyQmCnbrJNkVYIXQ2hvMNFCgfI2eUv2WFnl6AWZc
         biUl/ye1fmxnnCOyN1d3X2PLvSOL5voOnbYQr/tZtEf3J4NJ5RoFcVWllPoaT6WlKmM6
         eSmtzRQ8fiS+N3ehcfakhZUhsg2JqGAX8+feSM+DsQ2SmUcB91jlR6MzcMJ0JYM2jAiQ
         xniVJnzdXMdBUD9J6OPog1P3f1r6YTix9SEx7HPNFildPSHRF7T6HPXosqGovnXi2FKL
         Cz0w==
X-Forwarded-Encrypted: i=1; AFNElJ9PdWL1bfsLSv5/LdHOw0Sv9zzAxtPY14WPKpP3n0CoyVS+nP/XUogHy3cy/k3UpJrE1Fp4ANE4rSPE4NAj2XbQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxbA/sJ5vP2mATK+UgunyBZsP2EAkmGJoBiMfyZ0AEIqL1rtxXI
	AhL1V8WD8SewtTADTPUvmM8GyFKec7VB49Uya0RRZRiwM6+ah5rFDhKW7IdF1dJwuy1PCTpCEW5
	9wTT0r0Y1LcN4Zz0/fCQs2eXncvniBg==
X-Received: from wmf9.prod.google.com ([2002:a05:600c:2289:b0:490:3def:63b9])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c08b:b0:490:bb20:de64 with SMTP id 5b1f17b1804b1-4923339fd46mr929915e9.5.1781624536623;
 Tue, 16 Jun 2026 08:42:16 -0700 (PDT)
Date: Tue, 16 Jun 2026 15:41:47 +0000
In-Reply-To: <20260616154149.2763214-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616154149.2763214-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616154149.2763214-6-sebastianene@google.com>
Subject: [PATCH v4 5/7] KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
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
X-CRM114-CacheID: sfid-20260616_084218_974036_F60F3167 
X-CRM114-Status: GOOD (  13.34  )
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

Allow FF-A notification SET messages to be proxied from the pKVM
hypervisor to Trustzone and enforce MBZ/SBZ fields.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index adf8680f3266..fdf1e5fb6726 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -43,6 +43,7 @@
 #define HOST_FFA_ID	0
 
 #define FFA_NOTIF_RECEIVER_ENDP_MASK	GENMASK(15, 0)
+#define FFA_NOTIF_SENDER_ENDP_MASK	GENMASK(31, 16)
 
 /*
  * A buffer to hold the maximum descriptor size we can see from the host,
@@ -715,7 +716,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
@@ -975,6 +975,32 @@ static void do_ffa_notif_unbind(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
+			     struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, flags, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (FIELD_GET(FFA_NOTIF_SENDER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (ffa_check_unused_args_sbz(ctxt, 5)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (flags & GENMASK(15, 2)) {
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
@@ -1043,6 +1069,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_UNBIND:
 		do_ffa_notif_unbind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_SET:
+		do_ffa_notif_set(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1136.gdb2ca164c4-goog


