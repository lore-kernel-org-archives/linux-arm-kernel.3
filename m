Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4734FCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOaGjTb4ag+IPG6k0DLB6nE7+R/nX4tnydOkOxde2U4=; b=m2eumb9/nEE0NOZEoOuQtlsCjE
	wkV52gxJGE4nWovf8CypHk6x2riSkh2IIVcjmOvxdybhIdOBWZtuZ2og3O/tjthj+Os1YENArocuM
	VooOPiTFxjVDuzjA3Fd/A32BcHq8VCzsWCfaHvavDgNCP++28SnW/jwRg+i4vTiS+kp5qgcvDndCk
	ll+7tG2Q3yjNoIteJLWBs3AhfAp2A7EWfZBiSIYFZWXo6Qv0rsBhOSfLdht1BEFp9/q6xsrua6as7
	aU8ZrSfCX3zy7sHAZSL3GqxKmMb0YIoyumu+5GXBQxZyO2Etu55pYtEwTIK9EL1r29F9LgAIq952y
	tZbI/MtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVvo-0000000G2KG-3hL1;
	Tue, 16 Jun 2026 15:42:30 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVvh-0000000G2DI-2BgY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:42:23 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490ae3bcf4cso23576165e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 08:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781624539; x=1782229339; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OOaGjTb4ag+IPG6k0DLB6nE7+R/nX4tnydOkOxde2U4=;
        b=gnVFbUN9bA5719s5fHrKbPHzIpdYdtT9AVWevpxSakkWcgdAT4BpKBtRWLMVYCOgPV
         nv4bi+P9gFGV5a32HMjqoqU//tvJ30JQJOAByAObPqS64ig8+XkQkxh7dfXTBb+VdLEn
         cmJXntApCBnndvvJVISMOaBbg0UDSnG3z61O4TcXV+Az01j972UOjK897T5nQIDyD+UV
         ArWGfTFQF0L6b40n4XnIZGn4T3FeJ/fOSHHKG3HZJMA231XB800+Km3Z+WZLE8CWGwGN
         RTJ8AfC38QSBR7Vw1JVuq3bMJl5tArp5HTJA/V0CrBpcIdynyQptBpsXUR8feWB7jQTT
         Mp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781624539; x=1782229339;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOaGjTb4ag+IPG6k0DLB6nE7+R/nX4tnydOkOxde2U4=;
        b=q+bFiw1QayLeHeIXD0c28pY1YRog0xtKhmdImlSc7mGQH/n0pk+DlHIdKqevabKr7G
         ewEtzWuHBe/Scz3aqwewGvW2lyv/tNq0l2VhxSsJlPehGnFIZphBvE6QrI1uph+i0xeJ
         nluTZStBhCSr8rCIZ7cFSIPnq6e2eldECgFFHvXqkQkYlcl98GsmHBoIX+tpEDtzBzxM
         Er72lRAXYnShO5RVuWpXLvZkz+TmwCKqjKTKMG6ea+qCC2x66qrwue3F/Mdg3hQ037e+
         ytmDfhTQXz4uC361TG2KbrxIr9FTQ024dzLRvXWkwn0+v670hrQsHBnGv8n3+rx5yRlX
         V7PA==
X-Forwarded-Encrypted: i=1; AFNElJ8/w8JzuqUX0QLiyguCWPusfe6LjycL+5GDSslQjLXqHBKDbAdtZBo2iXPW+Tkc/ly1UyCfl/sx+yL4j04cHa7F@lists.infradead.org
X-Gm-Message-State: AOJu0YxduBrd6BJm7/ovRvME4A4HLj9O4G8q1jhnKbJggOFcExYASd1T
	43pvR0jOXM/sSGPDtf/0L19TY0PezEEBnba+k9BhTOyO99GNqh+NNRfNaV1TXOZ9G4wAIaokqMm
	A0zxQ17e8ilJOPI+KfB4hzBQit61mHQ==
X-Received: from wmxb4-n2.prod.google.com ([2002:a05:600d:8444:20b0:490:4477:50d3])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:628c:b0:48e:6db3:ff2e with SMTP id 5b1f17b1804b1-492333a8f49mr1025675e9.15.1781624538850;
 Tue, 16 Jun 2026 08:42:18 -0700 (PDT)
Date: Tue, 16 Jun 2026 15:41:48 +0000
In-Reply-To: <20260616154149.2763214-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616154149.2763214-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616154149.2763214-7-sebastianene@google.com>
Subject: [PATCH v4 6/7] KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
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
X-CRM114-CacheID: sfid-20260616_084221_573616_37B57E6F 
X-CRM114-Status: GOOD (  11.77  )
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
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index fdf1e5fb6726..de4794338388 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -716,7 +716,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
@@ -1001,6 +1000,32 @@ static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
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
@@ -1072,6 +1097,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_SET:
 		do_ffa_notif_set(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_GET:
+		do_ffa_notif_get(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1136.gdb2ca164c4-goog


