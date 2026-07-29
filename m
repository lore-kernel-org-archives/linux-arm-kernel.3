Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B3FC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7K7ZYeh7lQNhDrmBvEZsQ9iIG9GUxmgOrfHofOc6bGs=; b=hza8PUEOdrkkXe9IcpUgkAtdFT
	6N4ytihlWsbIWN4RTenL2/JoSlno7hEKJI5g1jgQrzRZhSSWkP/ULE/AtbYdg3DYfgQNUjGLSJbvw
	k6AvV/f0llR+A/w//wFlEZbsMgFzonVbP9EMUugz4ZT2E9s1K2LD1rQ+c5Zo8fUL5rCA5S5k7mBWp
	r7NNqlDF1+X0cV128NssRMUGjQyOoYoQJ1iou4QdIN7f7/C6iszauq4XcfbZlEwCyvSD48qbRT4Lv
	TI0ahte+nn/WUlgYtEApVTvAvtLZ/FbSkX2urx7bFDCKHpt1se64U6+7p4r9ssTabmn3i5g/Xg7qh
	qnFb2+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3AL-00000007qee-1b3q;
	Wed, 29 Jul 2026 12:13:41 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3AH-00000007qc5-3xVm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:13:39 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c15ce19923fso85876866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 05:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785327215; x=1785932015; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7K7ZYeh7lQNhDrmBvEZsQ9iIG9GUxmgOrfHofOc6bGs=;
        b=Q9B7aFM649FMxJDknnHns0XulI9UsLbnnoxhmtPQyZv1usKeZHee4yYeabaKtTw1Kg
         qSaaslsDaMVBzD0Aq05DqJiXzDs4r/tBOLTpQ8Zhr27dEECmK9/hjEu8wDRu0U/Xs6Up
         pGeqV11fdW0NfYmIeAfEeu60HYDrlNEA+XrqhMhZmgGa353TZUFJaSlOs0q0f4A8x1Xd
         FQLN7YetoGTeQCgRA96LyyaMfQ7X5RFTw3/BEMdrTVZo1+D1Eq5DbYjs6p6NAb2rMYLe
         VCvXcYa0HBZrVZwSHJRsfKVWeR+uICFgGoSUQiWyNp2IRq1IZWyQDBJ+ZlBnHobH+83Y
         h5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327215; x=1785932015;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7K7ZYeh7lQNhDrmBvEZsQ9iIG9GUxmgOrfHofOc6bGs=;
        b=ULsK38hTjyOnHgchKOgiBwAqpfWC55Pb++6klQVb96D2iZO35k0NPzIa5ApBy/mhPC
         HFHTnQleVKu2sjSfBZdaRPv4SpVgWnqRRqUCkgetaFUKYopmBn+fRflEyl3ERTlfve7Y
         MZ8Z+SmNgQ4LV0bJSLW/HT0mh5/BaOU/VmTkze+TfrbRyNRa3OWOCk1K12+zOjfyC1fG
         iufRvcTl94oicinnKgmGrThTgSzduu0ALhldM1Ovu3/PXcWmSrfpskqUMIDdHOZORgwZ
         qf7uTS7CT+fJScBlU5yDa5l18rI5pYA1d88IARuNIKNA2n3Jz9a+Qxln9tXPipsjlUH3
         71uQ==
X-Forwarded-Encrypted: i=1; AHgh+RqC6ODUHqZEq4Kc+rLbYd2hh/yW+W4iVmPzAPXUk5Ye+ZEtMH5AdipOj7qU0OwQnyjiBEUcvDt31CP15a+hvusO@lists.infradead.org
X-Gm-Message-State: AOJu0YyMwSHl3A6I4jvHd5HohXfRhgmQ271DznlmPeKRW93zuU33vwfx
	czH2zmf7D32vAnMRGdcstaL/QOtyeBC64Xjq+ctn5v41nKvw8b6bT4ePT4VpFiDP+pBDd4Pbc5E
	hq/HirriUxgTS7KwL5e2r1XHSXHiMbw==
X-Received: from ejchk15.prod.google.com ([2002:a17:907:3ccf:b0:c12:5229:7355])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:960c:b0:c1c:2ee9:5e6d with SMTP id a640c23a62f3a-c1f71d7baf9mr364618066b.17.1785327214844;
 Wed, 29 Jul 2026 05:13:34 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:13:02 +0000
In-Reply-To: <20260729121306.1519473-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260729121306.1519473-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260729121306.1519473-4-sebastianene@google.com>
Subject: [PATCH v8 2/7] KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
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
X-CRM114-CacheID: sfid-20260729_051338_004754_890A23CF 
X-CRM114-Status: GOOD (  14.51  )
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

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index ecc13b795f2c..331d9d0d8287 100644
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
@@ -676,7 +678,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
@@ -875,6 +876,27 @@ static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
+			      struct kvm_cpu_context *ctxt)
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
@@ -937,6 +959,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BITMAP_DESTROY:
 		do_ffa_notif_bitmap(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_BIND:
+		do_ffa_notif_bind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.487.gaf234c4eb3-goog


