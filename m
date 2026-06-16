Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277F7CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDR37+e/e3c1wPMzPsYmqv2c5CPvU7koE8nHI68hmNM=; b=jaUMTiX0finvHxnnZP0dIEVxWC
	xl6EriSCtlNBuY64IKxyURZa4704XN62fQBdH9pkTSFa8lpHKNecHIDIwhyz4N0aD6azRXMnMOMzL
	8jYCwNc+KlQ8vgmVoF4rMprU+a484rp0yOe2+uipCF7Fs0wd245mCw8FfcEaRsC873ozMAH60ZfGv
	AV8UV0+yGlLG6Ct5mc8d0/sNOvgRGyro2JeZBpWV/VrKav6WKHJdanvnlVObmKUP6Os0IyH7GgQBz
	wLgn0iiUY5HQvL35T/Jt/pPhJa+V5BjGQYMKqtBAZBrFgYfwCIJLlxAEeSskycFFXBkh/rujLtwdX
	VIO2SZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRM-0000000FdQD-3V3L;
	Tue, 16 Jun 2026 10:54:44 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRA-0000000FdH0-3OWE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:54:34 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490afe64f26so20302545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781607271; x=1782212071; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YDR37+e/e3c1wPMzPsYmqv2c5CPvU7koE8nHI68hmNM=;
        b=WeGI/AOlqFjssGiP/6IvRCExiQmFe3KEhsQIXNYSQf7JhcNiPZwu86Zur9x5Zj4/2V
         YADD0DZGgAD1mITif/kpG2qPBI8ERG9yCMVMHq6L0AeXjFiuMQShDj/tRVKggj5PKio4
         e4FvMBuWtmPrl3rvO9GvOrgBC2tci9XEhRnV704k/1m+VVcxzKpRfh3ChzzBAxreU6Ab
         7w8278ULTfAldEAUMZh+kam/BWHz1Y8FXpvv9PaoRqFHMAKx8DfDoYS9ecZVpUdKQrVs
         Wiktey9hg1+b2TFCyfprtzMYfpcWvALOi3gTj9TU2RvITRWvC7QpYqMDJNoAYZ8MgtBb
         pRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607271; x=1782212071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YDR37+e/e3c1wPMzPsYmqv2c5CPvU7koE8nHI68hmNM=;
        b=F9BmwrkP6Z4hQlyXDY4FXmtbP/NiJs9JTLgBYWpiN+JIo09mqambZBdr+ldVAX1h0F
         Qw0L5KhNoBZJUzKJSlxJqGlK3m8s/cQDuW5hGtMTw91yZE+7ywis9jqTxe3+opM7ARd8
         BNI4nuul33OB1BD6xzAxOF85LfxXzqP2i4P1MK4luKaMuqFDS53i7AQshI7ZuAgQLijD
         VK+o9kduuI6VeCasaoN5ADdDSvA/xeKW4iiOQ7ych7G4TbDsagPytMjFwEHGaZwxU/hk
         7V1O5Dp15OlJlkna91d8lXkQaMUNFdPhAT1gD/rr0hTexb3akXRBXkpOC4eC9Nt2dUb3
         1d2A==
X-Forwarded-Encrypted: i=1; AFNElJ8e21VuLMP9nBz68p75MAc0+N6AKBJNlzlFKADPN10dZNLzr46Zjk2F/st+dCRmXgbK2tP9FLxuz0CB8Hz18gs7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz9SHrkzYgtSqth8OprxGOqMh9dp850nzt8P7EKgiq/vzf5CXT
	DRd2wDwOm6X8oYSVssmQlND9GVQx+J14rGE+5piZJFp7vbYdJYYJuccA4U4vowf0wdilWcCqxxR
	yN7BI0gW3v6/EaDGKF4WDEXBb+4qUPA==
X-Received: from wmkg1.prod.google.com ([2002:a7b:c4c1:0:b0:490:d981:b3df])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:821a:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-4922faf12edmr43932515e9.13.1781607270458;
 Tue, 16 Jun 2026 03:54:30 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:54:13 +0000
In-Reply-To: <20260616105417.2578670-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616105417.2578670-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616105417.2578670-7-sebastianene@google.com>
Subject: [PATCH v3 4/7] KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
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
X-CRM114-CacheID: sfid-20260616_035432_886598_9BEC26C5 
X-CRM114-Status: GOOD (  12.35  )
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
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 3d8ed829f558..9ec9bc9a8622 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -715,7 +715,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
@@ -956,6 +955,27 @@ static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_unbind(struct arm_smccc_1_2_regs *res,
+				struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, reserved, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (ffa_check_unused_args_sbz(ctxt, 5) || reserved) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (FIELD_GET(FFA_NOTIF_SENDER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
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
@@ -1021,6 +1041,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BIND:
 		do_ffa_notif_bind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_UNBIND:
+		do_ffa_notif_unbind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1136.gdb2ca164c4-goog


