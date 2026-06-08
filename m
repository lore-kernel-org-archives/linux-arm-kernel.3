Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C26CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkWcCN/UbsW6dNVoLGt/rV/ZPDLec4SNUxgFyMxD3Hs=; b=v0HgBmahtHvDDPefQCoxP3h7LJ
	wnh0sZLDueEdQ0urAJiD8Fe08h60Iq4+DBoIrhvhAaK6FMx9iY1ZRc53ZYYX+Ya5h9ju4Hs8HnXfJ
	kp3LNlvT8g+3/IhggAKfiq/2wrhV2FtcDrPdJ6UP2pJGkFdAuncXQwGFSPEUDkZjMvPdV/hMec2oM
	qaQTVhcGcNTQEulwFUFuPIh/MQQluBOSW3azaWmm+EoWmul288t4ICJlgj2gZr2VMDDIVpiStUYlQ
	RTXO1NCybK5TyUEJftaOlej2xKg+1/Qoj6ImQPCyeb3IazplI0HXlVdNl7/8lvMTav4WUxNlXAuRj
	2vx0Rq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGm-000000047UP-0ExL;
	Mon, 08 Jun 2026 16:56:12 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGf-000000047ML-0xj0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:56:06 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45eee3f9f03so4469586f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780937762; x=1781542562; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fkWcCN/UbsW6dNVoLGt/rV/ZPDLec4SNUxgFyMxD3Hs=;
        b=sjxZZrkdnnVaO9o0U3Ya5BJKlPlS3GPK5Y3K6SljgARWfvFPiNbo29XuFwuIR+vyXi
         8gtUE8o8JwLwKfqfm5K3lxkJG2cyVcbrolKreJI3I/8x0okOqwFalNokw+/6lkD5cACw
         jfMZTHyHLH6l5gujxunFhPn6GI2FWpbRh0Z3Jg9AaXoxMkxtVlOHLScJA91JnMt718P7
         oxvxSesPnn6qNIKgI+ABcB+hsi2BnIBTLyWfubWFECBMSw2GMfm1QR6rlBw27v5ClNSO
         /34WdV0XpZoMEMeTfr8APwvqymb5In7BEO3GrZ6OjtKGSt7bBZ5/v1h/4bpMMXz6ukEm
         JHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780937762; x=1781542562;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkWcCN/UbsW6dNVoLGt/rV/ZPDLec4SNUxgFyMxD3Hs=;
        b=TijEkEmTvtn4CkVmBS5s3hDqL2sSDKn5GIegbAC8xTy50GvLbbAyqbeWFvted5SZEs
         oC5OSUIjuJVIPh1wS6yokaOl7TyOle9PmZ6BAjyDSvq3lls6xhkehkPppmXem0yDBSdw
         7knx9mhT8Gj0grxwMWpzTmSrvGUVq7IIeuHVY/nAFRTk2Zb1bXHPoxPu/It5lNF9J+oY
         kWx8+zGZJtMHexh3VxhOj9Way6TLiE0jk2zsMrb5Z7H+VjALeM+zOWJBxU9e45QHsJ32
         +G062j2UrbU/Yq3Dd5lH0AjxBMLCTCyUeSqueC78g+7YvzRxFU5se+8m4iLScCQSL0UB
         gijg==
X-Forwarded-Encrypted: i=1; AFNElJ9tdYEU3KW1GXGf1AH3CUXNlSalDKyL9jMeE1L5PDwVh7TrPrrcsBhpxKtRiIiIqMH4WWgsgUv36d/tN4IcmMN5@lists.infradead.org
X-Gm-Message-State: AOJu0YwNmcFBC/oRKj/H8BdpiOE2AzAKS/KSf7zXijZKKz8kvELICe49
	oxgDqdzUnPVLcr1ZYDXIuAjdl4VhTCqlmcnIswWRuRksAZ61fi+JrHPGznmkfiBvTJV7lG9+S7s
	p51VP/k0BnTRSuGEH6dibtjvyzv8mGw==
X-Received: from wroz2.prod.google.com ([2002:adf:f1c2:0:b0:45e:8fa3:14f7])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4697:b0:45e:739b:3e43 with SMTP id ffacd0b85a97d-46030186d90mr16953340f8f.0.1780937762410;
 Mon, 08 Jun 2026 09:56:02 -0700 (PDT)
Date: Mon,  8 Jun 2026 16:55:48 +0000
In-Reply-To: <20260608165549.1479409-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260608165549.1479409-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
Message-ID: <20260608165549.1479409-7-sebastianene@google.com>
Subject: [PATCH v2 6/7] KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
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
X-CRM114-CacheID: sfid-20260608_095605_276286_9C027BA8 
X-CRM114-Status: GOOD (  12.41  )
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
hypervisor to Trustzone and enforce MBZ/SBZ fields.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 3270381679b4..28b6cb0e14c4 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -690,7 +690,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
@@ -984,6 +983,26 @@ static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
 	arm_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
+			     struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, flags, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (ffa_check_unused_args_sbz(ctxt, 3)) {
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
+	arm_smccc_1_2_smc(args, res);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res;
@@ -1057,6 +1076,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_SET:
 		do_ffa_notif_set(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_GET:
+		do_ffa_notif_get(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1064.gd145956f57-goog


