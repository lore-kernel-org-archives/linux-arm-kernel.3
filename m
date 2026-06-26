Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645F2CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Nwcle4m1xhjtWQ5cG6kqMRZxeBIvD7DoAMnMMXwmNs=; b=E/DZSW1yAsOBvQlxTQKNCHdI7N
	sKt8lDD4KCe+fN5X8xdBhAUgFlSy33fG3dI/F1GgT6Q/jm7gfHRWeXHPTMcTvIevgRL9q9PqKTM0v
	1/GQwN53y+G65oDxbc4cTj9Z3GT9bNA6o6NO2Zz2imJ2JvnpqsyTuGMH+X35EWiRyNtmgqAOSzjuE
	Vor8epGsb7Q57FmJwCWXKJue4Q86bZjxWtzKrK0q4oI8O1HmY9NZLTkIwSEva8URt9pEseDtKIzWW
	WLiKBO1Xijoy7qqP+cAZbPIbKP+QRG4RDMevGbTHrRMOSFJtHayxi0ZFNOOCA8tsZKAYwQNMr/jEJ
	+Lw7uqHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1GT-0000000AhjP-2c2Y;
	Fri, 26 Jun 2026 07:46:17 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1GG-0000000AhZU-3gaR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:46:06 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-46dc84ca722so356624f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 00:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782459962; x=1783064762; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Nwcle4m1xhjtWQ5cG6kqMRZxeBIvD7DoAMnMMXwmNs=;
        b=WIPhaPqhK74k/BuiJmJVMVu7HtDX9w6UQ/aNAhwBo6WxgX4VCq1w3SJ9S5ZCKA23rb
         UePK8qcZQBiR3VBrRL21lhQvQmlGAVoDMAlZHCxTr/uTfBAxGML4ihj7cjy6tHMWut5L
         zZY8gN7l7vG85qeTNGRyUDwAOXRJHIxlsJ1MzIqAc4Pp8KILanOMsDHfxZzpuhtDSmxk
         oqeqanMImdM8EtrNHMXLTQvnR3+PLl+2vok/mt4Rei1pRtTU3V4tbFnW4uExju9Loca8
         A9lDMmP+43f9EYJG+3pFLbZBSHhnCzq/TOEEOinvY30HU/4nQ+pm01zzXzfNGTyrlmnF
         E7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782459962; x=1783064762;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Nwcle4m1xhjtWQ5cG6kqMRZxeBIvD7DoAMnMMXwmNs=;
        b=Rx2KjQw017KvZNQR2+PNpgHbyV2yDYR2HGJ6CY0ZbYIY3FapXdUi7lVclGblPUbuOo
         1lAsc4YeHsOFW9OH46en7mpPJ5OY+ruSTwF2Iq2qmOHuzTRWJqsTpaA6qTCjfav1oj2f
         fySrG1TcvI3rP+ZJrnXmENNI5a0wzRcvEenCH1KNxGIIf981pAXfM+NndQXLM9XupitI
         Vjn47ShVQzQMjT3kuEyQtgHdAfRSRl0w7fFBvgjVIjUllXOk+/iE0ejb4V0sUhvWZPvI
         Iv7J/t7q19ASNBVr1lXCYovmyGWSvSoa9yz9gWYbzlCVHGPbZC5a2Qv51SK8OXxKODDX
         n5IA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9KIb7CPjEK6mo9Segq28BufJsTakZLIzNWjpjRotljtGFzn76uW3Dq5HnZ5BFnoqtsQe78DSA8G/yVdAI9+RO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy40E+n3G4WUZ+c5Vu6JWjy3bOMK0N/Mn3h/NEPfPVdHXE3/7SQ
	wdfTE7iwFJ8fLRZW/q98tQyoMps0MOfB4mPu8VaMlfEmL0u58Byt+HNbUfdq6mPMh+oeZVslq7D
	b7Tq2Biaa1ormnygCrmxDDPa9/FLspg==
X-Received: from wrbfy3.prod.google.com ([2002:a05:6000:2d83:b0:468:50b5:41e])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1acb:b0:462:6aa1:4393 with SMTP id ffacd0b85a97d-46dbfe8cd41mr9176038f8f.4.1782459961593;
 Fri, 26 Jun 2026 00:46:01 -0700 (PDT)
Date: Fri, 26 Jun 2026 07:45:41 +0000
In-Reply-To: <20260626074545.433234-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260626074545.433234-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626074545.433234-4-sebastianene@google.com>
Subject: [PATCH v6 3/7] KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
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
X-CRM114-CacheID: sfid-20260626_004604_947709_ABC12859 
X-CRM114-Status: GOOD (  11.77  )
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
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
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
2.55.0.rc0.799.gd6f94ed593-goog


