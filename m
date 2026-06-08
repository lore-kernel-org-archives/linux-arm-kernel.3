Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58907CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvv+an6xLDGNzBLnOXXROxXfLkjVhoP4StmbjGm4UyM=; b=a3iuWolXisVcecgQ4fBQN6JJR4
	vIjJFSBPaKxEK/2yFB2a/o5YrWhC2WftD3APCSKSGVjzgIAairxg67n55As+njt3rlXQnaM5Pmd/g
	IQqEsrve4TZQl0NUjJLi9lw8NZxT+BiaLTTqNrWL+6JibUOfBZt14KKe3UVKH+IDm9392Pxenb13c
	EMMzohKQz4B4fw5HVAW8ENKWIJm2hRr8cBPJPYqckXZArpIgvJKA3yzm6plQMo45+0N2rznSvjbq2
	RYoVZGhebnF8sVB1A/9UEaMC/uSLHrdWuF3/SsA9qpITX01NFt3C8tVHnhsm6BkS5FdzZZ2iluFvi
	8wJpIOiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGm-000000047Ug-0bym;
	Mon, 08 Jun 2026 16:56:12 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGf-000000047Mv-34xU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:56:06 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45efb6e60e4so4257185f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780937764; x=1781542564; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zvv+an6xLDGNzBLnOXXROxXfLkjVhoP4StmbjGm4UyM=;
        b=SIlqqQCD2L95vuNL4SnzttCA1hzlG1RC9EhwSineUzg8GstBz1qrRwHR+bT33xvWag
         ENk9347J/B1EmoFpdGokMw7ZsKzgs1FmsJOHht+N069VCgEpSpW2Ofa46XaZiduURXlS
         ApehFpPnXgdUjkcrDDgTdbpAJmgdLN+YE5KEvhVwxKuJ3t+jLhNMOAMcBkz0SwovA8ul
         33XsBguA8kR9TZAo7roxt1XxWMt96Lzj5jXq6mYgics4SS8OoZiU3gP6B//RFVj58MvQ
         25VRyPKRPpYopYikITgfdq2HP+g/Dh8sYljTns8uIAvwNnGcJmiVWLYewlMgdYSFYO2C
         x2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780937764; x=1781542564;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zvv+an6xLDGNzBLnOXXROxXfLkjVhoP4StmbjGm4UyM=;
        b=DD8u0vgOWdKiChuWJ2qGreQg6TwrLgrPIFtsV6SFKsP2D6MeWugExFGyi8DX2N9jS3
         GXIN9MRGI4YtK0dftqkpoUAg7Xo9HjEJhTjX+ggWcoJCcSib61U4IeypGjGntC/RoJgw
         VKHPEk9Fx7W/w+ygN00WuXPQzTDdpsC9CTS+I3QiE4zIAwwG2rOLNWofYpNhn9k0z3Jt
         j0tHlHQa73FOH5SjYlDCmuLrcy+uQQrwEkKB/LvgD4eWH+XEQg5wN8yqV24IheZRe8bb
         buXZ59H+9gdOWO6Yo1nbDGCtZMsexNtFwpSNbuQeHmb+LGmtDvudCkmiOVP2BuM5J9gT
         LVaA==
X-Forwarded-Encrypted: i=1; AFNElJ8qexwdyAYRk81j80GoLpknwQs85oAFz0nd88R52+AerO/OQGjyWg53fmzNofb6D3KH9s2TyjWUc7/EVidEEvNy@lists.infradead.org
X-Gm-Message-State: AOJu0YxqJW2o87LndMChF6aJe1tzlOFxN+iLyix/hRThsnYNyPum6HEE
	rKJmR9kE8YlaFXJKF0HyQ1433g+UU/vvtKC6YYfEA+wOv8n+uf9Kj59oRMFZalbE6WliETo5bQ5
	uh+5lZywcbMVml2QmeFiQ4ZhtfV8+9Q==
X-Received: from wrop15.prod.google.com ([2002:adf:f20f:0:b0:43b:4453:39d8])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e906:0:b0:43d:77f4:7145 with SMTP id ffacd0b85a97d-46030506818mr19157420f8f.19.1780937763520;
 Mon, 08 Jun 2026 09:56:03 -0700 (PDT)
Date: Mon,  8 Jun 2026 16:55:49 +0000
In-Reply-To: <20260608165549.1479409-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260608165549.1479409-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
Message-ID: <20260608165549.1479409-8-sebastianene@google.com>
Subject: [PATCH v2 7/7] KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
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
X-CRM114-CacheID: sfid-20260608_095605_780963_33EDB901 
X-CRM114-Status: GOOD (  12.56  )
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
index 28b6cb0e14c4..463a845557f9 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -689,8 +689,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
-       /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
 	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
@@ -1003,6 +1001,20 @@ static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
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
@@ -1079,6 +1091,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_GET:
 		do_ffa_notif_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_INFO_GET:
+		do_ffa_notif_info_get(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1064.gd145956f57-goog


