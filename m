Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8ECC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrVadIZuKWV0X7sTw0kh2j8tsXk6grXgxs5xYjL8YJ8=; b=Xa713WMQpPu9lB/AeD4zKtjQzv
	Y+y9/R2/82QpeYZFKWxxCFQsThYMsUfvCy4cbNoaDhVYgEm8wbg0+gBJ9ZTl6TDQy1R7pXopHSq+g
	IVrCpARqXnMdug2d4jnNoOe5ZXXY7zRIdEFgNRWz2ofucpVt8GVbh6JdSLXl47jAAjEVZfpUOSbeK
	ndCYtxEOX7QZuNMmT7ex9Y4WtdkJTkv+s8JWZz0k0q5HVzxObWHFJL05U2gKnO6OUCJHsdsCQmIDO
	diDnz3sF9kCgDRYMnUzCAe1RvpsJRevVp5EobhTPZT612Q7O2W6MYo+dGKyq6uF+Rs/1ZYrWoEFS4
	wRcpJjVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3AY-00000007qmn-3LR8;
	Wed, 29 Jul 2026 12:13:54 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3AO-00000007qgB-2Hx2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:13:45 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4954fd771baso13035455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 05:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785327222; x=1785932022; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZrVadIZuKWV0X7sTw0kh2j8tsXk6grXgxs5xYjL8YJ8=;
        b=mvPgtxG1EauLDa56BjEkXpogw59+1VQskQn88Xv0mNuNVM3Sfpe3iwP6aXEZkR4Jaa
         avBrPcke/t0FScEeta35sFIo44lFD3+BqpW7nrhVV8eTxiHO4f3E/u20L9utd3qWNSHI
         NugA2fWN6IrjSa9VElZ7IuK/wkAh1js8XXVsWh9EOlzxXX1QiN7etilA7wvW+sXamvkE
         SUkG1zWwu8SVsc598P6GXPd3qGdy0HtTskFvgJ5NuD+SEE7EUxMt1bVDkaaT5JcXblaM
         UoAP9GfkAgPTCLAwQua/tSYH95fcdGDJSl/Etj4MkMef8SvFSeBlJoFjQFZer4T1dyFz
         mq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327222; x=1785932022;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrVadIZuKWV0X7sTw0kh2j8tsXk6grXgxs5xYjL8YJ8=;
        b=IF2ojxAWXIe6tdfsKzY+JyF6RxUMaTzNxo8gWuxh4AgKDQ4h09zeWObihCaVVRfOzC
         rhaFDAgUJUE7BKPd2eUntFOdMFKLw5I0p5q49BNoXEMbJP/bCMkXYaa7duyeZl+fwATZ
         9Kvkq3uynS6IdoZGOTh4kYbCmqUvhWL46p5DyLPRYuflyC974o9kuI3gEg1PObAik7Hd
         +W6Is/UcLc6WSzr+3GIjKrpm4+hY1+w/Dws5PV49XosF/hMtfq5bUSuyAG6hVDVVa548
         TmxIRK9C/o7ZF5waKt23b3ZMAaIzxudBciP7MTeTu5EhxsfcQ6Z7+DntnkeDERQuFPBO
         VhEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpl1/b56qAIDzVBrAI95nH++cYiE0wwxaI6dNa68PTu65JHdTeMRLzCGhTtRpRDifsh+mQg1pXZbSxJiOtzT1KA@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb0WJg6J+o16ZdfPD0uMAUnAQHWyTrFVMHZnRnsTTOw1iT63d8
	BbIFZxEdJ3lILilOc+xJbTq3OW1Zs0lQDc4U+WfBohsTGZpTpczpObqQ3RIKecBKWPfC/DPjV70
	N2RiBt/4VlNv/nxHZ42qk5Mb1YjKnrw==
X-Received: from wmfq2.prod.google.com ([2002:a05:600c:2e42:b0:493:dccc:9e0c])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e89:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-497fd2fa920mr22738175e9.6.1785327221965;
 Wed, 29 Jul 2026 05:13:41 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:13:05 +0000
In-Reply-To: <20260729121306.1519473-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260729121306.1519473-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260729121306.1519473-7-sebastianene@google.com>
Subject: [PATCH v8 5/7] KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	fuad.tabba@linux.dev, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_051344_604250_69E5DAF5 
X-CRM114-Status: GOOD (  12.68  )
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
hypervisor to Trustzone and verify the arguments sent from the host
driver.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 2bb16aa414f9..c22fe4514741 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -679,7 +679,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
@@ -938,6 +937,27 @@ static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
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
@@ -1009,6 +1029,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_SET:
 		do_ffa_notif_set(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_GET:
+		do_ffa_notif_get(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.487.gaf234c4eb3-goog


