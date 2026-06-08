Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5952CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2857N0FYewLMeBt8Nj5klxJIE+MPtxOFSZN9bVePZ7w=; b=YL31X5m5IeWUKx7GwpVMuChhBV
	QE1lR4Jb6cizPO44dVM4REczZFbVgpT+AOtKhAgd6Zi/db+2egdwFr+geJpuCfsM/c8aR62vqflJ8
	ORVlKlZrdTlZzHsZ5fhsAYgBKrAbGX1hDvPaV+n6H7PZr1vIQPg2ji0LtfqT4jKDX1qrAdVdpFRX9
	NwGBqspHjO2wxPWQ0dqglp1R9GIgnuBmN8GkAGGV4NO11noacTLAhCj9aOppOcUfB0Ff0F2B7/994
	CgBif/Qz1glM+mZ6tgv+rOj6aX4MKKwAh9lXVmjn+DsIGpi+51vhuJfaXaKhtm+MVY90G5BZg5L28
	hlbjoLTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGg-000000047Ot-2Q9n;
	Mon, 08 Jun 2026 16:56:06 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGc-000000047KV-1HGT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:56:03 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b5d2e394so33347335e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780937760; x=1781542560; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2857N0FYewLMeBt8Nj5klxJIE+MPtxOFSZN9bVePZ7w=;
        b=CXk+YE2SU/kbjXS1iMFEOqBKbf2wV3wK/xY3K26w2K/1JnHhZTSiYZmZWZJCu8qUrm
         vsKgpt5r7KPziCejHmWjZMVkYfhelMZVFKF6wZ9iq4ahH+V5lSkdoJBJA/6z1F4170xQ
         qdhg2cE36fIxHuwf/zqB+rD+rsWkYFoEqqw0d2LUEVutv4gaR2+RMPUIrYqoPCodmAJZ
         pwQJ4SK4OJlmSjbCKR9+WVXn5XJvmJt977hwGMeccig6QNt+zky9DUaorKsr2C1BsyJH
         wOr+sSWOrh8Y0V+WG+hO80GD7czP2V8vnu9uNwNRCmPyfzhiDv0Wk+zYSX/Ek8K4EfM9
         wQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780937760; x=1781542560;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2857N0FYewLMeBt8Nj5klxJIE+MPtxOFSZN9bVePZ7w=;
        b=My4oIynZhoZA5GmTqSuLMClzJlrktAaZTNYr+Y2sh7OXtbyd5bJxZOIXb49yl2FuOh
         zrEOkFfc2jZCo27wE4cZiPW0YildZ4GAGrvw5tQwrlj9+psJ5THc3Helzy/XwoZ1/onI
         7XHECz43eOEvNLl7EaF/PoByxsZoq+az30112lIaMBCOBJaG/cIbDCddDfep8DXfKLVm
         JZxuy7Q8k0FUfUBElk4ulXDzVyZBTFVqy/xG21jrvAF+u9/x979DD+z5DHF6Bi8POaFG
         CJ2/YGiDg+I/p+rHYantfPIcUyvw19m5Bo6UW/7eK3v0j/SlsZIXZ/htgioqwpLJUYaC
         6EVw==
X-Forwarded-Encrypted: i=1; AFNElJ9FOIreP9EY10yymHG7DI7kUtnXqYq5xa7WsyVeXf/mxhCRvySeElpsA6NfE0uKMIao7gZLtAl1uiKGi5gZYFlO@lists.infradead.org
X-Gm-Message-State: AOJu0YxbOuVxG9BZbL3vCJkMHCFAnR7WzX1n6ivzZ31FwByB4YbCgy61
	jkItgZPZ5hQY0Zqoemvv8Al5DaiEOXIdff1zHEZeBYYAqS35zVWi4DdNObEt/KkAZvVq0i51IW8
	T5P5+KwE9ZmLqNgJHJh7TKghPhKvetQ==
X-Received: from wmqi7.prod.google.com ([2002:a05:600c:3547:b0:490:5e18:ff1c])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34d2:b0:490:bbc4:76a6 with SMTP id 5b1f17b1804b1-490c25eea30mr291402965e9.21.1780937759935;
 Mon, 08 Jun 2026 09:55:59 -0700 (PDT)
Date: Mon,  8 Jun 2026 16:55:46 +0000
In-Reply-To: <20260608165549.1479409-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260608165549.1479409-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
Message-ID: <20260608165549.1479409-5-sebastianene@google.com>
Subject: [PATCH v2 4/7] KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
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
X-CRM114-CacheID: sfid-20260608_095602_374503_1986FE73 
X-CRM114-Status: GOOD (  12.79  )
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
index eedb01955a45..ca285e89516e 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -690,7 +690,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
@@ -939,6 +938,27 @@ static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
 	arm_smccc_1_2_smc(args, res);
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
@@ -1006,6 +1026,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BIND:
 		do_ffa_notif_bind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_UNBIND:
+		do_ffa_notif_unbind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1064.gd145956f57-goog


