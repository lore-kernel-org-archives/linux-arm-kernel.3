Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E99CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgEdqVZzkg8EdfvsvaTXXYI6aDMdt2t7UIchiBP7OMQ=; b=g/suJ9vCEfwY/AF0qCNSVvSq07
	GS03PAy0WLyYNjlWQMbOE5P3MdZXL2B9bjWFm15YqucWqNk1WwFz/teC6Y1E0LLktZdwGQuvV0zrS
	yMtgfGJTteCcYdPUAD8YNBh9K36Gks0PiMoFtcxm+UoE69PPOtofT80JuxLpsLO+RKC90r8RKv5WQ
	kUdZ/UopDrL5UdxtdwGIfbdCMIs/KYVmmbaSn4eebOeS5krH5iE1gCQuYr/BRCZGUu2tLrSac8Fij
	8xVHF4FDP0nAdex+xBT4qos1qph+NcuP6P2tw3GdMF4MrNjrHxWpGo/5RilwEZR6qWwrHdO5EUluw
	ia3dMPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1GT-0000000Ahjm-38DG;
	Fri, 26 Jun 2026 07:46:17 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1GJ-0000000Ahaz-2UlX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:46:09 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-c1227d8635aso35205966b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 00:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782459965; x=1783064765; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mgEdqVZzkg8EdfvsvaTXXYI6aDMdt2t7UIchiBP7OMQ=;
        b=LdRYXNIob39TwXct3pM3WQON0qgi11Dqy/Z3wGKBROf/sYDLf3sWVPcxGc+uOpvkZE
         E3nTBOZuJdf+44CIdiAOnJ+FX53h5tsLTAFj4Y/OLgCT46+Z5LgyUuT2hmY7kYLsCPbh
         tGNTcc5o7PjogtXXXzEdy/e8TWmVhfpuSzwa3SEjMtHxjpmyb5qxCdJ5uDjgUUBeAAOM
         YHDoEARYE4seMWKy9kZWB9YE5h2LYRrB4nXxvpmm0UkA+t8eUYSl77BXrKvGj26mAz9R
         fBQeTfCZ00wkwdQzBWvQfnBeU4HhVwK7VFy6RfoZElYMUSwkG+zOpDOQMo4D22xNmkD4
         AvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782459965; x=1783064765;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgEdqVZzkg8EdfvsvaTXXYI6aDMdt2t7UIchiBP7OMQ=;
        b=RyIWo9vO2CzB5hmogovTg9YHbDrgeAt9dsmr47elJmdzITG+Phv+6MiX3X9qnDBKuY
         YNVhzl6VH5elDB9y12VCMSenG1SdtQ9OpS6LkiSCR3T53fOvk7bt9nl3R0uRNlCv8fU3
         mxL7NDos0gvHDjuvI3tV/qw3iqQShDbCsEu5Ljgto6uxyKqfejXIPmmdw/3Hwak8fzy/
         cPlmhcTfuhaXPhJFJaln3Pf5hSgEVDePzFFpok5MxW1YY2+MAoPtLk/IYmGrH54p8grQ
         G408OySWxP4zg3ZdfjloPFrxaxM5E7q4HPZhvNMnDmDYJQWBMZM5LCgR9e8jkhDPEjtX
         g0sg==
X-Forwarded-Encrypted: i=1; AHgh+RoR9JgtVqerbaPOehcJuXy+HTPTrIzFcokV3fZpw253nIamKntcOecD6I38MaGW8FWGFaw8I+jubcGMHz3KfQki@lists.infradead.org
X-Gm-Message-State: AOJu0YzHN4lOetzP21X+UBATPW4MdARHOdeToIIEgzQUrPEYVMHYKOy5
	qpbQPp1Sl5hotM70JATcsQEx9D8ETrS4aP71UyMsGhPr4oPWoAFXtublY1U/U16tStGZhFLUXRT
	GyGBp/V+2DnA88miCe5wzHgr1YNnwEw==
X-Received: from ejeb22.prod.google.com ([2002:a17:906:1956:b0:bef:4b4a:fd4c])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:702:b0:c12:1651:17b2 with SMTP id a640c23a62f3a-c1216511edamr222936566b.9.1782459964269;
 Fri, 26 Jun 2026 00:46:04 -0700 (PDT)
Date: Fri, 26 Jun 2026 07:45:42 +0000
In-Reply-To: <20260626074545.433234-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260626074545.433234-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626074545.433234-5-sebastianene@google.com>
Subject: [PATCH v6 4/7] KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
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
X-CRM114-CacheID: sfid-20260626_004607_657213_CA9EE3F7 
X-CRM114-Status: GOOD (  13.17  )
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
hypervisor to Trustzone and verify the arguments.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index d52d7c4d5e7f..2bb16aa414f9 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -43,6 +43,7 @@
 #define HOST_FFA_ID	0
 
 #define FFA_NOTIF_RECEIVER_ENDP_MASK	GENMASK(15, 0)
+#define FFA_NOTIF_SENDER_ENDP_MASK	GENMASK(31, 16)
 
 /*
  * A buffer to hold the maximum descriptor size we can see from the host,
@@ -678,7 +679,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
@@ -917,6 +917,27 @@ static void do_ffa_notif_unbind(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
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
+	if (flags & GENMASK(15, 2)) {
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
@@ -985,6 +1006,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_UNBIND:
 		do_ffa_notif_unbind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_SET:
+		do_ffa_notif_set(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.rc0.799.gd6f94ed593-goog


