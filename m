Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65369CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiJTpHe0EoFyzEzrXyY6n13kVh9yVUaMFhDd94X4zOQ=; b=4qtOVaX4DMSWAyQ7/j4InIteUG
	V2Auq5qs0mW0Q2V/B5q5P+7qHtdRovi7Y2aGUbcOrS6tgwgxrG/k48de2HeKjhf7hPhmG5tUGdc1G
	6r4iVzyWHuk1r5KSaPCBVkl8ZD4TCl9vXolyg8v3bYpI2aeBqWasGnASgXCys6UbHchD+ixJtOhBi
	WC2j02hlzUh+KxtfgOKuciLMyoMiKXlI8cE91RAIYhr9FGQesFDKuI4ZmdjEOIuIDmcmfExYqm/ep
	b0ta/AxILBs60Nw9qZT3YX0Ni0lAPqjzvVfcbMssNZLXzVyBC7IHCpJhozn1X0hNNHljz4Pw9Lc1S
	mZ4dmIKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGg-000000047OI-1Bnm;
	Mon, 08 Jun 2026 16:56:06 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGZ-000000047JF-25wq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:56:00 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490b5d2e394so33347205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780937758; x=1781542558; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fiJTpHe0EoFyzEzrXyY6n13kVh9yVUaMFhDd94X4zOQ=;
        b=ebodewYkYv+OWaotcoAiQxVU3xJZj6FvNeqUWhfeL0tjm11AdHwOy7QIeg1tEthXCh
         PA4T7mIcBGy2o/FfoFdUvfRF58PgyZ1gpcQs9STxHBzCZyEGltlRFuDcx3Gc3sbEgvob
         LHfJlFHCuMhVzCegUbq9Z/oobwmK3XbwmseuNLfd8NQsy4JC+uQlr/fUc17XFIqwDQus
         zc0IpERtbAMEf1/0OOqNgdIpfmtkfMfo9ybmbBQzPdNRX9REhxC7DrXwzTAhCmzVjjGC
         wfr2DMtDkyTcWYP6eFEaFn1AvoyeTS7osczNxnU6a2j1zJQ1WJV17J+InrWshGBQgI52
         zmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780937758; x=1781542558;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fiJTpHe0EoFyzEzrXyY6n13kVh9yVUaMFhDd94X4zOQ=;
        b=RUx8k4U3V5l6Lj5UVNP3Cn0T1dc3G+PGza8XBx0cyerIA/of4w3JMLyjVB+MnVshGr
         JWd6Iz8v7CvmSq0DoVF55YPxjxLQHLZjH1VQ+a8PeEJzYXLj1Ftdl51qTrSXAM9zj0aV
         mWz/Td+J25AwrLl3TKf2EJ4sTP9l8eOcQAIUaXhTrtHN/Ie9/TS/2izDfUk9arRVa0Lb
         +KmqltWpochiE//Mbi3437CNkv/jrGRzayduqKonFalByPT2otpsTrIBr9sYUS7VxfGp
         iLk89bsqsLkInujkhKzqbAJJo/Hy6ljQi44SHgpRpGmvQ2TOrseHiKi1ECnI5VV3hDZL
         4V8A==
X-Forwarded-Encrypted: i=1; AFNElJ/8qN1rmXEvhS707Dn7hS1+fcmsjNuT/HqQvVo1mg8A4y6zygc7gLNtcqhK1QBcVqiSCzDI54LKR38rlzmxIdMv@lists.infradead.org
X-Gm-Message-State: AOJu0YxcpSreqtz/X4lL+vsZs1PQH+DbVSFnb9+f4eHuM7btJXSeSmjA
	YJWHG7gngjda2tZotq0NvpMTR3FLaRMPdHjRUZ6SDNRDrWmb7KXau8AkRnaslpEwEMKpRZMxLTM
	2OOPWc0394D++FHa8xK/ifjCSpfXnTQ==
X-Received: from wmot17.prod.google.com ([2002:a05:600c:4511:b0:490:b9f9:d4b8])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f90:b0:490:c032:ae92 with SMTP id 5b1f17b1804b1-490c2610b21mr273574485e9.33.1780937757698;
 Mon, 08 Jun 2026 09:55:57 -0700 (PDT)
Date: Mon,  8 Jun 2026 16:55:44 +0000
In-Reply-To: <20260608165549.1479409-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260608165549.1479409-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
Message-ID: <20260608165549.1479409-3-sebastianene@google.com>
Subject: [PATCH v2 2/7] KVM: arm64: Support FFA_NOTIFICATION_BITMAP_DESTROY in
 host handler
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
X-CRM114-CacheID: sfid-20260608_095559_542322_909F1A71 
X-CRM114-Status: GOOD (  12.47  )
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

Allow FF-A notification bitmap destruction messages to be forwarded to
Trustzone from the host.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index c20d45191085..91e89d889c44 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -688,7 +688,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BITMAP_DESTROY:
 	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
@@ -893,6 +892,26 @@ static void do_ffa_notif_bitmap_create(struct arm_smccc_1_2_regs *res,
 	arm_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_bitmap_destroy(struct arm_smccc_1_2_regs *res,
+					struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, vmid, ctxt, 1);
+	struct arm_smccc_1_2_regs *args;
+
+	if (ffa_check_unused_args_sbz(ctxt, 2)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (vmid != HOST_FFA_ID) {
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
@@ -954,6 +973,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BITMAP_CREATE:
 		do_ffa_notif_bitmap_create(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_BITMAP_DESTROY:
+		do_ffa_notif_bitmap_destroy(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1064.gd145956f57-goog


