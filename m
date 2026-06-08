Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB156CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNn/w8nYqQgrzocdn7kSQyhyTudAsTnVKcbXP36Ndz4=; b=mRdvuyc09s+/H3wmG4SZgQvMb6
	NxIsC1mV1ujokKbjsxPN+G2NGI6HcPjhlCOPStVH3YuwWkf6zc3iB7XeRaDUTOSIObpajPNkL3fyj
	L6AT9wc6UncyD9jwXaeIBbu7oFkTXefMAiiCLbTKY+wZz155xcqTpz9pqYfnD5QBQvTT5bjnjgVuv
	4dffdlQ44X57l0T8n/gws2NE0XiM67rPnRSVPnfnuGhI6KV0IG8Z15WmTmfReTjVsVlGokRacrsrS
	cemkU5ryvF3KOyB2hM1mQ9Xhr7z6adlWxH2o6swlluCVt5qoZmNfakDouAlZrG7Pdn8Tkc3xz6iYa
	AiO1hFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGg-000000047PA-33qx;
	Mon, 08 Jun 2026 16:56:06 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGe-000000047L5-0MIz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:56:05 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490c840efe6so20041165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780937761; x=1781542561; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UNn/w8nYqQgrzocdn7kSQyhyTudAsTnVKcbXP36Ndz4=;
        b=GXM07/Teq1BmCOsOD3lFAW4SiYHxy0wpJx5Lzf4sXn1rQbSnupMiPTqa+P1R/j3H9L
         S7F7d24g/W8zYhbL5UpRkyIpS9mWXxw7hmvgVjAwMGOi0lmwOltYNSXHtaG6pdtdY4yq
         6oLURKP+4P7zEkytTojkHagJEg8x4gn0d0UpZvlp8GuoqjEhD6IfU31yDP7PgC/twtGD
         xsd3tVXLNyjPZSDMhhWl+gWV6TR4ctQW8xCf3fKWdnv6SImrkoaYIehu8CYSoRw/I9XF
         isKQ47u13JQRBb4RjVLNMup+hBmzxGyWrY8XmWNxcr9xTKLSQesRzpXN6wgGEK2IFPiH
         wiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780937761; x=1781542561;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNn/w8nYqQgrzocdn7kSQyhyTudAsTnVKcbXP36Ndz4=;
        b=q6dhMDJeK8tVKycWV86bpphL8DZN7NFpv0JjYDNDuUl39ichPDt0PkoR8p2rbEebWF
         4eU9KjsneqCJgOLCImUFrcQoR+uc1e/mmWK3GCXB8bZb8xR9tVqgWjmdkU+yYQb9vMsI
         4EJQT2ZfRzzNy1b26uO5tPq+YHwEC2vTD+A4uSgynS+pOswnooD6MSPNJ5XDFNd3+Ree
         1tjZghmT7j7DxhbMmgYTaj8YX8bByb4p1uUU9v5sm1A4fXu657w+Iezeg5evF3C+XGv+
         KJtIvEnUWQyJKOpfJ3fGe5s7yjsBIlDBeZA+Sujkj2kbzITqYOZvgFzbB9Iu/TjD4aOY
         gzxA==
X-Forwarded-Encrypted: i=1; AFNElJ9HW8ZV/dpDMTC0kl3z6p1Lo1+CYi0c8Xk4jzAETuf3hDADnR/AYNXQSBNbACF1hjbgY0oX2qoSAZ6cTH39I1t8@lists.infradead.org
X-Gm-Message-State: AOJu0YwtQmX9SJiamvxDZRNLBt+8dJps36gi4mNulHAwxUtjnaOVHRKI
	B/vAy/tOGYJZD0zjVhjYX8YmnzNFhqj8VY/LjbJMelo2uETAWYP5pz047RslqveCxAUGbnYl054
	q9RiQRu+bSm2zc4psyGViI0smHvpEcQ==
X-Received: from wmpg21.prod.google.com ([2002:a05:600c:4c95:b0:490:aefa:cdf])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c29:b0:490:7df7:9190 with SMTP id 5b1f17b1804b1-490c2ceb6f6mr241823035e9.8.1780937761024;
 Mon, 08 Jun 2026 09:56:01 -0700 (PDT)
Date: Mon,  8 Jun 2026 16:55:47 +0000
In-Reply-To: <20260608165549.1479409-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260608165549.1479409-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
Message-ID: <20260608165549.1479409-6-sebastianene@google.com>
Subject: [PATCH v2 5/7] KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
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
X-CRM114-CacheID: sfid-20260608_095604_141560_934A9C72 
X-CRM114-Status: GOOD (  12.25  )
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
 arch/arm64/kvm/hyp/nvhe/ffa.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index ca285e89516e..3270381679b4 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -690,7 +690,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
@@ -959,6 +958,32 @@ static void do_ffa_notif_unbind(struct arm_smccc_1_2_regs *res,
 	arm_smccc_1_2_smc(args, res);
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
+	arm_smccc_1_2_smc(args, res);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res;
@@ -1029,6 +1054,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_UNBIND:
 		do_ffa_notif_unbind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_SET:
+		do_ffa_notif_set(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1064.gd145956f57-goog


