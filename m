Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3E3CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46ZjMqvd2ZQFHV75B9sJuMZVM4j/Z6Yee1Bq8pCu1gk=; b=PnX9zb8w4QCKEUO7v0DB72e3Fy
	uUzfouwjlMRMJ1+FSVOfQN85fNRUJ1QJQGfSHwVEt4fVqy0+JIwPevYA9cxtYPsHEXa2ZJXlIaV6M
	Lq5lVmdowTuFs2J2+vlJNnTeHrh6xQ2DBIhUpsSU41TtuPKGBDb1shS6UPxWxQCb0eXUNoZWoJQFT
	qbrneNhlJ3ER+drg7pwiRsx8Jy/I/CyonLXM+yZzoAj6LW+1zwegNWvAmRiw06FcZnOpkfOwItb6o
	WyhdoxkXrLeIgEFxwBT/yu52oKTg3aVwSdBGqRiSQ5uVN4KDvWaKo8wBneQOhpadi1oU0XftIBvLG
	2VAd0PBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhw-00000006D87-3h8x;
	Tue, 23 Jun 2026 11:54:24 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhm-00000006D2a-3zL9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:54:16 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-465874136a7so2760978f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782215653; x=1782820453; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=46ZjMqvd2ZQFHV75B9sJuMZVM4j/Z6Yee1Bq8pCu1gk=;
        b=WZTAPtH+hTgbUNIXBzncMTlylVDWEK+WctHGDcbUAfFtNGzevn0MYuXImyfc/KM9Xf
         0obXqw7E7NnuXVSIVyiXyPsFVD2iNQ8DBnUsBl/l3oV+4W6xaDbkdG9V33qmawxF/1Tj
         9/4a1iJsN/xYpb/De6jhSc0V9NzbX6OB61TuKSGi6mlSO9+vsUXAV0OifUNPtPrOs2Pp
         4Y+ejYPbUjkJDZ+FINCTdgSywWEyuu1kRsoeEwUzuRX7VK2hgrjmnSnS49aautHD3qey
         FITv6d3JG8kfE6tYAtSRsNgMokxtl6Kizzbjbm1vduoo2FS5GQ5YMsxQ5YTmwvXH+Qs+
         lWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215653; x=1782820453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46ZjMqvd2ZQFHV75B9sJuMZVM4j/Z6Yee1Bq8pCu1gk=;
        b=WRdX/5z9zJRwUkbgP1HqgKuG9fyEl1uo0c+QIbUOMwt8cGwBTnCVoOa3cxTlVFM2bb
         0LKM0NngT6MHtXO3iwkTin8rkOBdcKcn+K7ulSPl4f6wl60RZdgBtMvnemeDOeQMJFbK
         Z5DOq1hgzozI5HIoq8KeQLbpQO4L9xSOty8FcLzEr2qLsZgx8sscI+Cl+sPIipR1lhqZ
         z3khMYsGd1gw/sFdidjyahohgKyutvs8Fh8lrcvXcSPl2XpD4x6EWIleV70/L3a0VYV1
         IEGgA4bjmdtfV4ybdd41ekSt3UKKlOzD80ym64hsKXhsaddGOYvjj9vGxVpU8Jk+9AC0
         XbvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9u2cqQApaZ0yM6fJKQ2R86Rng+seV1LFhJ/bfvCpc6OE5cApni3VMRJwjeNKdyxzY8uAqa7U9ppu8EJCoxlsmI@lists.infradead.org
X-Gm-Message-State: AOJu0YxF66FXodNkPN0FRoClA/So8PwVWB99lt9aBs2EERVw3PR5Anut
	XqMnVhHEuiqDiIGWGkUUhLsJVj9m/oEqIYrDi7vEupfHGwz8fqGM89gRMn5OoxmTgkTXYXvDCvC
	iKY3BGenWJii9p0D1lPf4vwcf4sL1Vg==
X-Received: from wmoo9.prod.google.com ([2002:a05:600d:109:b0:490:ae4c:a69b])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:609a:b0:492:3fbc:556f with SMTP id 5b1f17b1804b1-49249083b99mr219423035e9.2.1782215652335;
 Tue, 23 Jun 2026 04:54:12 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:53:50 +0000
In-Reply-To: <20260623115354.632361-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260623115354.632361-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260623115354.632361-4-sebastianene@google.com>
Subject: [PATCH v5 3/7] KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
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
X-CRM114-CacheID: sfid-20260623_045415_006543_8943B0D7 
X-CRM114-Status: GOOD (  14.13  )
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
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index cc10f48915fa..c7910ee4000d 100644
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
@@ -715,7 +717,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
@@ -930,6 +931,32 @@ static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
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
@@ -997,6 +1024,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BITMAP_DESTROY:
 		do_ffa_notif_bitmap(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_BIND:
+		do_ffa_notif_bind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.rc0.786.g65d90a0328-goog


