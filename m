Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FF5CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOOiG7cLZKBESZTZeStp41m8GGWKdLGa2fPTwW93Dnw=; b=FaofPqLmx18UTslJB9r1XXgTzh
	BYAT26+ONr5cm6vliP4J+L8tBX8k/nTYzknG0lJbM8E7Hq6N4zGyNmqfqCAcg1eLcbmf5nRDTphKv
	HSej5W9MYfsUSGGTVqrHKpGMc9d6GoFDf69fYgdv6s91oZedzE8OnCemtahGfhMdwA5Ze2UgOQqjX
	TlEhdtIqFGra6zTfQg083GFElUkHqEDn+sEm5p6Oru4iP/ilCxxXC2XihqytCBDG0A/4wQaQwXqad
	6NvlU743KlGZkyFXXUPMeW2Yi4VNN4P0pVPAnD80HqbgK5YmcTSSF3Z+VBHQlVWV7T9ieo9PoQNqV
	no6AXLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGg-000000047Od-1tdx;
	Mon, 08 Jun 2026 16:56:06 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGb-000000047Js-0avS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:56:02 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490ae016853so30208505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780937759; x=1781542559; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WOOiG7cLZKBESZTZeStp41m8GGWKdLGa2fPTwW93Dnw=;
        b=Daqmp1k0SilH94+IhenYKvnj8DRw//4pdXaJzmCzYInMFqi61nTe8qVoTJWRAIpiAy
         EhCxarPgefjfrDxL6M3UYJooDoZ/XDVq1g74e2UJqmm+mAzKEQXiJCPOzodQT6HwIjeF
         5x/anq+MlPDfJYdZKE6nNjyYLTh6LqI1QGQ7zDRiGlP1hCUNt3rOO0RE2zt0CaB76SE5
         3EDBPUZy52tov9UHZMBkXdkWW3PAykrydwb9pyIaccJD7OhpmQ3RxUHt5Z+355Lw9liw
         GZpHuLUnRx2eJzQJ52WLpbKkrq0aiqEQ0yFBysZJ6IkYxqC5WticykaSfecTchNiGZbG
         w7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780937759; x=1781542559;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOOiG7cLZKBESZTZeStp41m8GGWKdLGa2fPTwW93Dnw=;
        b=joJKMNZmZmObHCF+Fikhz32UAD+RoAheGZnbwNTPj99PKTSedR3fdHJXFJ8GCyKr3J
         6x68xl5bRtI3HJOUoytP47bG0BOoTnvNi9ph798lg2npWQpyujsH0nH5KNskYuqk+/uh
         udqzI33a6NIlHLsfkEpPSZPGU81brGWU/5Pavpr69NEjLRUYX9LOXZwVigwBaLl00d2j
         Yu/93XM7motxZ1h9OGlFS22/Vtrze2D2z6FMrYJfHz+MkWoXkkHxkcGxO80+qf6Y3z7r
         uY/lat0FfWDMfvU9vGuHlM2tDgNW0hQ9N9iFaTW1a0C2Npq9wiDGkSMHv5LAhJFj5UQl
         2oTg==
X-Forwarded-Encrypted: i=1; AFNElJ9Htq80EV4VNXUoVD4ogjNxjim9UmaYDXXwH8DHKNPcnSTLETmXonvRAYdi1aJlpYcpLxJECE9ycVyYADE6XQpF@lists.infradead.org
X-Gm-Message-State: AOJu0YzVUC82TCAHPss/EROCDOBIjiwfeHojyGerIPeopSU3OdLgQlI5
	6/cOtf81b8qph42SXMmfw93iM/n6lgrI5GgGGM3Z5CRlfd4/IjdG8CkaduUaY6y9z2Yrrdmvx9d
	ZgqWAOGnyK1RBWZCS0FAfk+g9dzlplA==
X-Received: from wmjv24.prod.google.com ([2002:a7b:cb58:0:b0:490:aeab:32d1])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8518:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-490c4993bdbmr293970365e9.24.1780937758833;
 Mon, 08 Jun 2026 09:55:58 -0700 (PDT)
Date: Mon,  8 Jun 2026 16:55:45 +0000
In-Reply-To: <20260608165549.1479409-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260608165549.1479409-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
Message-ID: <20260608165549.1479409-4-sebastianene@google.com>
Subject: [PATCH v2 3/7] KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
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
X-CRM114-CacheID: sfid-20260608_095601_198835_655B6BEA 
X-CRM114-Status: GOOD (  14.68  )
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

Verify the arguments of the FF-A notification bind call and forward the
message to Trustzone.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 91e89d889c44..eedb01955a45 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -42,6 +42,8 @@
  */
 #define HOST_FFA_ID	0
 
+#define FFA_NOTIF_SENDER_ENDP_MASK	GENMASK(31, 16)
+
 /*
  * A buffer to hold the maximum descriptor size we can see from the host,
  * which is required when the SPMD returns a fragmented FFA_MEM_RETRIEVE_RESP
@@ -688,7 +690,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
@@ -912,6 +913,32 @@ static void do_ffa_notif_bitmap_destroy(struct arm_smccc_1_2_regs *res,
 	arm_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
+			      struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, flags, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (ffa_check_unused_args_sbz(ctxt, 5)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (FIELD_GET(FFA_NOTIF_SENDER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (flags & GENMASK(31, 1)) {
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
@@ -976,6 +1003,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BITMAP_DESTROY:
 		do_ffa_notif_bitmap_destroy(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_BIND:
+		do_ffa_notif_bind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1064.gd145956f57-goog


