Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCB1CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edc7Ld3Q1CWSVNPfr5TXV9CytVBJ6mK62PgjuDOMsL0=; b=4rZx8TjBYTRBrCBAJUUJ2+Y6KA
	dUBIsyRVL0WfI9XeuxpC8A1KatLBcSUfuyYbYy1HmzlInLhbNDCSbXZgfX2uQ9EROpLPrCIq8j7mZ
	CpoMUWasnNfeAHxOIFfXwiB63C2TebPXz+ip825zQ4P9q5PubWcAoCI83YxLRKwqJdRmQMk4Hya1N
	E1VnSa+hDuzlduCfN/4FX2asdLtFaQvZa4uZPEjL8ZBjeYZ3DVVqVuii01sJ65jpXlCzdjHjrX6FE
	6VcJNj/EG2NyS73sMBwmQg2InxU+FAKnBDOTFOPXCOph931eELXq1Izz5FKmvfKfiLL+CraPtN+3G
	bxcEIktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVve-0000000G2BS-0gtg;
	Tue, 16 Jun 2026 15:42:18 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVvZ-0000000G27v-1Fzb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:42:14 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b9cd54f3so27956455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 08:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781624531; x=1782229331; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=edc7Ld3Q1CWSVNPfr5TXV9CytVBJ6mK62PgjuDOMsL0=;
        b=AqmQ9Nmj1E9oL1BOYv0AMde0xxZedrg/AEyzmhBy+eRnXOieqqPSjizAfbvidaLJss
         KtIVEyKUkhVLpfi2nl6GzDWMHcJpxKaoADfjmvDWcuqz5ULJKIXFJBVa0eSB2ZajRedv
         IeLIgOGE3uMqut0qInL35ZkBX7ZjxtdOvgN8V51oiTNDRClCjdnTtfCjT8xuSJs96ITT
         JGFj1FVdSt0cq0p6jAlwKAYIq1wac4/nFstBw/0C7QdJ4JVE3C/JDModCUrHXP1/AYb0
         uJo+KteHtNHD5MNCH3/u+2OOrSCO9MJ1L2I1ST3IeZOW828//L5BAkiYO/WX0IAhFZm/
         HPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781624531; x=1782229331;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=edc7Ld3Q1CWSVNPfr5TXV9CytVBJ6mK62PgjuDOMsL0=;
        b=FXhPj3TYZZGUqDy5NOrAnqscdzJ3kwUwB7qFTNtJ4GnSWhdySGWFU8CXpYaCHLfUZ7
         rCxrjyqqSLufNUXi9wTq3+mLYfOsUbytj85C0qT5+uXFeS9lgfeF4fy864C5zs6O2fxH
         XZyXK4BMeMoz3XVtclHAkgu8rtexwg44/V0RZpH1aP7HnPFjCNmoFEbiFFOQluXh657e
         qatWJOhZE/PHk9YjMhiOvuy8NDz1Q0LXMqRnEIZEtr0o3qpY7L1gnGn04cKXYysexcJP
         C8DU5xmxr2k/b2JNmC2QfRS1Up4mCxyoeJA8lMVEBwiarrrp0KUcZBCfG21nugDl1T/K
         wA3w==
X-Forwarded-Encrypted: i=1; AFNElJ+QfUkIHZ4qn7l91Gq8NMU6QRRysueKMf9mNRMVtWdrD//D8hkZO4RVE2PRnSeKRkNujfGf39F8+IjZ/0/imIw2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe3GNpBPsXB4o1xUDcNJC1WB29F9kgL6HZ7TnNBkC6GmrgNO32
	W8278BfhQL+CCSVFb3veVbTiAJhO4FKbmXhxc4t2GL5EfFdMwYgcSMxD7/cKde98KWHCFjZeV1j
	F9mb5jiy94BpxXn1yMozyh0MRNcBs9w==
X-Received: from wmv21.prod.google.com ([2002:a05:600c:26d5:b0:48a:79a9:335c])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8a1b:20b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-492333ecc7fmr75895e9.25.1781624531168;
 Tue, 16 Jun 2026 08:42:11 -0700 (PDT)
Date: Tue, 16 Jun 2026 15:41:45 +0000
In-Reply-To: <20260616154149.2763214-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616154149.2763214-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616154149.2763214-4-sebastianene@google.com>
Subject: [PATCH v4 3/7] KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
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
X-CRM114-CacheID: sfid-20260616_084213_352795_ACF897DA 
X-CRM114-Status: GOOD (  14.26  )
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
index a72f6d4b62f0..1f38ad008675 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -42,6 +42,8 @@
  */
 #define HOST_FFA_ID	0
 
+#define FFA_NOTIF_RECEIVER_ENDP_MASK	GENMASK(15, 0)
+
 /*
  * A buffer to hold the maximum descriptor size we can see from the host,
  * which is required when the SPMD returns a fragmented FFA_MEM_RETRIEVE_RESP
@@ -713,7 +715,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
@@ -928,6 +929,32 @@ static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
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
+	if (FIELD_GET(FFA_NOTIF_RECEIVER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (flags > 1) {
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
@@ -990,6 +1017,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BITMAP_DESTROY:
 		do_ffa_notif_bitmap(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_BIND:
+		do_ffa_notif_bind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1136.gdb2ca164c4-goog


