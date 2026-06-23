Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B865CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rDVjRX05LswWm3CoIhO4tKCfKLIFEXEGSybtuh+IOM=; b=R3KsXxc6j5oItuDlhMldQNPXtw
	NCzl9j7dA/N9/EvxbZ2+StQGjVQ6KswX95dvV/m95FffM9HqwSKMnmsTUdWxxr2OcA7B3+zELeTNd
	h98BDKGvBXC67efTMtmPk885E3ayJM5zHDHadIj1+/1KATPZERgXkB6WfnxJuskCMhRXJt/wNcCs3
	i7rTRDTLJvpxgR3Luszc7wbD2P6nJAKb9r+3YU7cLZ3SOGSWCaxJPFZE1Ut12XHQWoWM2y+VGZkGW
	wLpp+1YTBbxpdlgJAPTr+KvgGCa18XwxKWz0wnbJpqTlkKn+r/CYbBH0AfYex6VGPKwrKWH3u3rB9
	lUz/GhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhw-00000006D8R-46Kr;
	Tue, 23 Jun 2026 11:54:24 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhp-00000006D2z-07VB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:54:19 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490bae3a39bso49141955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782215655; x=1782820455; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rDVjRX05LswWm3CoIhO4tKCfKLIFEXEGSybtuh+IOM=;
        b=CkwnYV7NfynHCksG35mWB8aGJCgqjUWPExGqYqTkhSfkZFlZ3rSkGAt9q7YwhXSJic
         DG1IrntPuH7xTqwmWw5fytP+dB8lXhXA2iZDLFrhX34HgiNgb4Z9BsOBNnkF3edYPQyb
         ZzSumKb822lAOC3pgMztzjybm43c+HAJVGWirGdAYklr1OJihSiENFykE6YWqYhTwmsJ
         AoUH5ZwRmNtaaYYV7RXUoL1c2nN9j2Vq/XPGlie6VggwproFi0kErZjHe6RH2Izzcl0L
         avXAQ0gpWlLSr1rf8RrjFDleeW0gGC+v9dh+jvPLSdXS3JB5xKjLy03NhDj1mDomnGf2
         U8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215655; x=1782820455;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rDVjRX05LswWm3CoIhO4tKCfKLIFEXEGSybtuh+IOM=;
        b=m8IkKax7+36ow9UQDPcChklC99qofmR1UgqntndNQwKv3N0KgDK2aqxQE86+sxnnWC
         XYWpSt9t20aQOU6cyZ+IakmE9qtrSNlgMKY4AAbAZ6T6bEl94zxH4zZf3sMFKn0TbEpK
         sm9tUtSwFz39r19wIGZy555m7N9MZ0csc3k1PW9JJ3uUz7LaPjSUwhV0K3CV/MLhusHG
         tbF59tcQf6cpiX5zRrOSPgt2a1d1Nou79UPeoyz1aOazDNe98tjWHhnpvxmGs4BNoxpe
         5V7OlNw+sZ9oZGp5y/ZFECzg6k+o95XdjhRw0AL7Hk/7yXO5fHhevFXd/qRLPBTFDWoG
         vXZw==
X-Forwarded-Encrypted: i=1; AFNElJ/AUmrQ6VggO09AARVOYPKXOWtPEFmtZfW0DaMuOr+vtQ4TnI0VDnTd3aMnTZF2utgH7E9+vgm0xsI18DPf16Ov@lists.infradead.org
X-Gm-Message-State: AOJu0YynAU7En+EeG82gpKq0Ft5AMhk9clGcYKq5sIkFxT52x2Mc+aBB
	mnWxlGgmnBYIwhkEywGcgaLrTNZhrnBHTwfErQirGJjSpOx95lYd6AC97ewySb5jfQuWmYEE2rO
	B6SkFZNOFa43b0aoBkUxjO5w214cqGw==
X-Received: from wrus3.prod.google.com ([2002:a5d:6a83:0:b0:462:fc9c:4a7a])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3acb:b0:490:44eb:c1dd with SMTP id 5b1f17b1804b1-4925b38682emr29908865e9.29.1782215654493;
 Tue, 23 Jun 2026 04:54:14 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:53:51 +0000
In-Reply-To: <20260623115354.632361-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260623115354.632361-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260623115354.632361-5-sebastianene@google.com>
Subject: [PATCH v5 4/7] KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
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
X-CRM114-CacheID: sfid-20260623_045417_086214_F9300FBC 
X-CRM114-Status: GOOD (  12.11  )
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
index c7910ee4000d..4b9e2b6b7143 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -717,7 +717,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
@@ -957,6 +956,27 @@ static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
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
@@ -1027,6 +1047,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BIND:
 		do_ffa_notif_bind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_UNBIND:
+		do_ffa_notif_unbind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.rc0.786.g65d90a0328-goog


