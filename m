Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1350CD98E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOHLtsQ7Dkg79lD0jO5Fo0V8aU+vyRvk3bi+qkulMVA=; b=3o2Uf4/sHqRhDy410ygEICxKns
	mfNHMMoGZnojEFwt+ibVHzWeYA2mTamIbDC/jylva74+3BIeRWKT9uOaQdXZ2dGZsHUX5N2JbzUbU
	fVRLPJgNJlsrteykqEOnTn5BO+3XBiuVroru0eqZ/XBqHa8geqXvhiaW2hxOZs8jOTb3RAPVI/uN0
	Fo7QMyi83O5/c0Jukdv9Yim3BNEkyiLtC9pxjvd4kRfxokI45xzvnToxsfFD88C4vcMgAtAbtKZzU
	4fFzhmFEzW4Ut1v62BzeECwnzzhQFluaooCu4GVLP6mPRdCLSiLLRykLAl4XkkcfELIFwSqVpT6Ml
	6FWRZgyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRO-0000000FdR0-0rLF;
	Tue, 16 Jun 2026 10:54:46 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRB-0000000FdHf-3U9k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:54:34 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490ae016853so32741395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781607272; x=1782212072; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rOHLtsQ7Dkg79lD0jO5Fo0V8aU+vyRvk3bi+qkulMVA=;
        b=YB7/8ifgVH9cPSVeTclUqLPOPpeup7HoOyjmZDLnM4UaRJUW5DKA9RHXJUjNRPss5B
         57IV+MkSMgZcS80M1JM0iOL3+UiX3cuZ+hZuUb7OmcyT/tUwNlbsAFdtzbKvT6COiNVS
         PfVEbn/rKw8VwjjYHb/n+MGyY/PtOOFp7q+EGNwkOOxxGQv2DHpZJWsB/d7UYui0XB/U
         JBZ892jUOluGIZk9cfm8L+9J5Q1bwTWeatHy1JanE9jxHW2YDMPr1LcVQalNR4cXMdVV
         XjrOlR8Wfi+7+exduGYncKL83kidFz/SjvZctySL3uaoAce0t/X2VoMo5piWS/4dQZyM
         3r8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607272; x=1782212072;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOHLtsQ7Dkg79lD0jO5Fo0V8aU+vyRvk3bi+qkulMVA=;
        b=oOJjDkiKTfc1EK9/rE0SEC4Zekg+Um+42LAU6g2Y6AU5s5KaSrhaRlu3t6YGhMp7Jn
         ewnGUvckAXwLqgR6e2HfWRQREvsVCAQ6hgANegwUP1FSwUqQDsToZgT4EX1ukY6KomGu
         bIEKpn/4LjL187NyJJwlAqu/X2k5QfqsBGfG1oChs0b8hwQZ9oL+jE6o6hk3ozXYyGVd
         adAjH2mhOcEoIxurBXkMEsN37TUyjVE+dBkKfx6rtSt2bW3nk9o2eGNdfg8hlKNnDF6H
         sL4KUBGfR6BfwKalDrEuXzadggIUGdF9llx2OMJJpj4PhEpHD40FIegLKwFbrZvqnMv0
         fGJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Vi46McorJmYhJb7DFnAMbiHdg+PFIO6k9UV2gBQLNujmIHUteEgz1P2U2P5tHfWIMdwYu6VZ7Yb1o0IDh2l16@lists.infradead.org
X-Gm-Message-State: AOJu0YytRFn717zhf1ENRJ7t2qV1tsh9JuKbEg01wdeU50ldgkuQLw8W
	+Uh8m2hHQWDT8kmDxy1y0NkZ+pUOzXN8Uxq3g5n5445CH5uji8+ddLxdOpQq0F/UKAWWULLTtuq
	85JC9AAyQmIVeKADXYhbSU10szI+9/g==
X-Received: from wmjq15.prod.google.com ([2002:a7b:ce8f:0:b0:490:7e29:9cea])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d08:b0:492:2e93:1199 with SMTP id 5b1f17b1804b1-4922e9311a5mr65735675e9.15.1781607271681;
 Tue, 16 Jun 2026 03:54:31 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:54:14 +0000
In-Reply-To: <20260616105417.2578670-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616105417.2578670-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616105417.2578670-8-sebastianene@google.com>
Subject: [PATCH v3 5/7] KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
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
X-CRM114-CacheID: sfid-20260616_035433_894999_0BC9C3BD 
X-CRM114-Status: GOOD (  11.81  )
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
index 9ec9bc9a8622..fcfaa441770d 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -715,7 +715,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
@@ -976,6 +975,32 @@ static void do_ffa_notif_unbind(struct arm_smccc_1_2_regs *res,
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
@@ -1044,6 +1069,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
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


