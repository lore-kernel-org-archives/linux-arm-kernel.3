Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F510CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvZ7xBVFaIWlfxl/3gfs4VKaw5Sr61chB3pwbJcfuUs=; b=NTcU/UO1PteyNObWGjPv5e/+Sj
	PtouOfKsfeDNbMtXl6ti8s7sBGXsILJ9HtDHfuBkq/8xxPiFw94UHAsHQuWUj4k8S46Zx0osXx+AO
	DN1mjFxHdws81oMdArzROE7S2CzEhS2GC65zhZgHjuc2C2ozwSJxpZCNRJcKmSBaTI1JlJ9bBACuU
	hxQoxbE2D1soePOFIeYILTulUwUit7ZROh7c7Ijrs8mLAvmOzXQPLhqyM106lkP0A0Yd2iN6K3EAp
	Tz2AlLN5sJrOFkhcwIftcWYtysIvdjWn7OrJgIgkVXfpPDeFGiRnoyavS11BXABgkkaOyMk1B3uFH
	W832HjRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRM-0000000FdQ1-36Rq;
	Tue, 16 Jun 2026 10:54:44 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRR9-0000000FdGW-1Rl8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:54:32 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490abeb7298so49669155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781607269; x=1782212069; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IvZ7xBVFaIWlfxl/3gfs4VKaw5Sr61chB3pwbJcfuUs=;
        b=q09b9WnYzulyo5umGAMrR4nd7o01yHyxxL0vXabYW7STQIv+S54CnvCIl5BZ/211df
         n4vgMxTxMfS8zA6qKv902YBxHc+2aEXmvnjJt0izAY9j1m3SuQQIH0JUN6JohplMDN89
         ffFJ2Ol6a3s/6/CgIBA8r9EFM06fSCcT9JAqsKt7hB+PnLnEf72hg2dGE0WrUMMHh2yO
         R3uKpHL5gcxefiWwqsqkWgx7Rtb+M0Tq2sZm2GFhygqZZCiDltZK0KmynsQamklbWvag
         k44Qh+4zfY0oconleWRlm0QVSSgVKqQrBHoAK2lAsddds5yYRUtp/NaqL8eFf/LXarGB
         15SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607269; x=1782212069;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvZ7xBVFaIWlfxl/3gfs4VKaw5Sr61chB3pwbJcfuUs=;
        b=RN0ZTnXYmqAF+cdqizNK+Tafwsx39Y6k1oWw6DJjOkniK7ZVpZS2vJHa3A8eBNvCVo
         2gMzG0cTg61gj751ZcwqtTqHBBhqyVD26/1CNE8tbcizDl7mWrVvGu77rqw5Ek3NhjNa
         Yf4VcaGyGbvhn2v87s5+gn8iQxIlo27ctVf/fU6I/gi/zTsI2yNfGYGf6Pl1cBdgTtHC
         0+u0/Ity5BxDSlKghdBn0yQ14tPJ0tmGY3QAp12mkb6vqIsv+FdyD1vS3HtVRtnunkRt
         C1D27Mz07SwuwplnL/AeAotq4bSgB/QFCV/695iyzc9nrWssg/Yw7NBcQ1X0OE5ObFvm
         apbw==
X-Forwarded-Encrypted: i=1; AFNElJ/uvRYCtDVSb5lS6y41PGRjLLwIfz+aTSCykDIQ8TtAtePQIuNBoHWR3lw4KUeRmbg7MXzQ8yfzynPy+rAGMhDJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyrWODB1AcZx0VgdRLaLUuoYqgr/3e5pxA+aoUkLm+Px4V3fxKK
	uTdAmXBcCs2EIbq/Y0+exVnTcjhobMTyISoPsPtPNUbEURc3PrCzEHQRpcGwxGC2BY7TpVPNL1t
	NYa+XGoigcoopsggKs0pmJp5qQ5AemQ==
X-Received: from wmbg25.prod.google.com ([2002:a05:600c:a419:b0:48a:6051:b5af])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3512:b0:491:9969:739d with SMTP id 5b1f17b1804b1-4922011393fmr209070225e9.29.1781607269137;
 Tue, 16 Jun 2026 03:54:29 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:54:12 +0000
In-Reply-To: <20260616105417.2578670-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616105417.2578670-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616105417.2578670-6-sebastianene@google.com>
Subject: [PATCH v3 3/7] KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
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
X-CRM114-CacheID: sfid-20260616_035431_420938_0AF08E5C 
X-CRM114-Status: GOOD (  14.27  )
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
index dc7496ec295f..3d8ed829f558 100644
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
@@ -713,7 +715,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
@@ -929,6 +930,32 @@ static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
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
+	if (FIELD_GET(FFA_NOTIF_SENDER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
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
@@ -991,6 +1018,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
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


