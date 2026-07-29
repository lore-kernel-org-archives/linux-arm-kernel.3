Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01A0C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZPPlW5g4w1AsF53iFpKYDXkhl/izo/iIyII9m7u4XM=; b=dmOG8HOcAwn4VyPNk4C4f2nAAH
	RaANtW8EoCY1cBF03XhdINQEh7sAkozIhDDDJ2LDtEzNY19TJdFcylbpLZJLz39G25doAVjYjAIf2
	WsjjQFd61QnQVb2iISJL7gMFvgufZXv1ztm4rnYuC6dz+8GGt67toaE++gKaQIYhCtvkwdVuMFH0G
	9ZO9p1PaYqDgE7pajHr7F5qDuT24a0uKFyKMkInOn+4j6iNEx8Sy+5yPtbZy46sxxK+qhrOCqYVMU
	1WGILtUhJPEqEO+19aKpvNQsZ09hVoS89tSZAC/hXI90mxKEcA2REq5/Ay0sC9PXG48KfOwi5c5w+
	Ihkojaeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3AY-00000007qm1-2A31;
	Wed, 29 Jul 2026 12:13:54 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3AK-00000007qd3-0lpr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:13:41 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-47f84ac1990so656882f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 05:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785327218; x=1785932018; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZPPlW5g4w1AsF53iFpKYDXkhl/izo/iIyII9m7u4XM=;
        b=mZurY+WcLsa8poEnyWOj0g7if5yUoKfjyXZ0jy7KkfEPVct8nL5C8KDII9hltrVIOS
         fIzdBjaB2apvUSs4QbMA8qOpeHq2CbFeI/NGkfqohuNKx/JKgD+I55aKJEoRIM1U/c+o
         nSHKGRmPiKb9bVPqKXxQcI2MORPeGD8Ylr/24wFbHy43koJRHR5GurirzMfCOjbu5hsU
         6B4atOnrLRUDJKMj1EYf4e7DtMz5qfjCcb+9I+NgEuD710w9A3UU79PTiRnGtJ2qVxa/
         PvgHHwYuztM1aKaFiqkEk2NbLZmGrntck7YbrdrXgKMkANw91oPvCzUV7EpLparFlNfq
         LT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327218; x=1785932018;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZPPlW5g4w1AsF53iFpKYDXkhl/izo/iIyII9m7u4XM=;
        b=ilh1uSn0PSWI4nmV143aMTW5bWGrc4IK6h5t99gUoyx/P1R0j4wjP2P0YF5IB++xXl
         0YG5OUJkURnmpgATp81miudrTk3xr4ZB81OqibNq4i1YbzE7H2ozPkWVrv3nGvrxl7/a
         UsfngNzQHkaVPIUOWt4c8AR1B4pkPCXixsmHNUboCiJ9wVIF4oHwfgvgNZR/orNUyaLk
         NioYG6an7PSA1NZE+9mendgGYnavZeDQ6y9KlfzLosdr6E9ZdTtKc9bRVpXH/myI+Fus
         Y5ppgpE2XAw37rGnt32+rFqwfsqIWEUfHWuVAkjbC+Ic6f9JZpuSk8PXO4U0i8DIathd
         WhRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2Yj1ZymYdsMdMhaBUdGOY6TJ1kKbc/PT05Q8rR8xKAuMxXXCshPtSkxQYPUPQjXm+Z9JLA/FsQOaBHwN+VQNP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1NtnkVpruY0Fmvj1flVdMO5eTP6lXIBc7XCJ6Eyaa6dmof6jK
	NwPonGXsoTYnxcwzs6/NZUMrt6lk4cOMi769czndPAUXaWXCZc1DAt8gRKG5lampSzO6PYC9VGx
	UR2s70acCRvPZx/B8Pv4PEXZaMocmNQ==
X-Received: from wmoi21.prod.google.com ([2002:a05:600c:4815:b0:495:5890:8f69])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b85:b0:496:c0f6:78d6 with SMTP id 5b1f17b1804b1-496c653e5e2mr81145145e9.2.1785327217395;
 Wed, 29 Jul 2026 05:13:37 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:13:03 +0000
In-Reply-To: <20260729121306.1519473-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260729121306.1519473-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260729121306.1519473-5-sebastianene@google.com>
Subject: [PATCH v8 3/7] KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
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
X-CRM114-CacheID: sfid-20260729_051340_241565_DD3C3EF7 
X-CRM114-Status: GOOD (  12.27  )
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

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 331d9d0d8287..d52d7c4d5e7f 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -678,7 +678,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
@@ -897,6 +896,27 @@ static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_unbind(struct arm_smccc_1_2_regs *res,
+				struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, reserved, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (reserved) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (FIELD_GET(FFA_NOTIF_RECEIVER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
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
@@ -962,6 +982,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BIND:
 		do_ffa_notif_bind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_UNBIND:
+		do_ffa_notif_unbind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.487.gaf234c4eb3-goog


