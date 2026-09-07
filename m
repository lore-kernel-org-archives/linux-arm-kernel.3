Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697FAC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNLhfgvrYwznedAczU/yoh7OJ0T71JIKxZfqgfryA8Y=; b=1dRCimwnetIsAbIFlLqgluMxtF
	gbGpdw+q2U2vOBkgE0kUa2sh2wMCe7YWNIQzIEj91SLLOK0C5MgRDQYp6N2jsS2vmOBCpGlyY/LmQ
	OQ1jEW+VfIHtIBbiAvFxci20IsVT+q6EvsBy6RDQ6A3hMDz5O9uLSxF58l9CV/bZRbeDyna1sVpfZ
	MhXickRBIm8a3UKTZfKn/QTHO5Yec7m9XPDmHQzI72kOROyGvVffOHtOB3TiKdRMu9q94DkVqcpmv
	Lz9RAb4t6W7rs+Nz3Vgj9bGpGkgstzWT29vJefZ6Idpsi9t8/ExOfWe38zLaP/X/A2O9P5kiF3YWy
	c7O1wNyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d0Z-00000007Sz8-3IQf;
	Mon, 07 Sep 2026 17:19:51 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d0T-00000007Su5-0xGD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:19:46 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49554715277so37163925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 10:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788801581; x=1789406381; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNLhfgvrYwznedAczU/yoh7OJ0T71JIKxZfqgfryA8Y=;
        b=MbpeW7gk8Kk5CFqTn9OBQrYMf1h+EsGgJvhYRjExVQApm9oyv0UK8C/iC8BfCdmhmM
         DnVFR1dx3AZrG6CZy7+US0oULxM52QONVTMmCNhQFuKU9+2cH4OwjkvOAeQI8JuDnZs3
         qjZfbKy9Xtq1fYINGDzgnicr78iLRQVqtNdnffgclKaJ1dBTn1UsVT+E5xRb7JXepQwr
         lvGslP+c2ne7BxeewY6T+ttH26xXJfzOoPeWfuaAudWqIoqZ1gKG+FZXPVF5e9KgWwUu
         ayECIYyH+Uhh6FTbgpAYTy+AF8xGT/WwGE2lT/rbPB9j+EKIibt1bEhj8ewXmwEfkCFF
         CsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801581; x=1789406381;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNLhfgvrYwznedAczU/yoh7OJ0T71JIKxZfqgfryA8Y=;
        b=catnVHNCccDiuM1KjNMfTLfiKgsmbcMM4f+4Ee3zH/45RBQZl81TxXQF2wELgVbX+a
         lUDWB1wBW7Cr6szVQ2xHMiKdVqWjJwRXIW7g6IDjRyCFxjQQ3PloZFljHwgpwKHVWVak
         81UydM8NNAEyVNa+6ukR9g0T1+3Mv4jccHafGVmY9NSHTEgNutoaGM9EklS9MgQ8zLvm
         P1K0Ny92WbB3dTx3oNrCyDnOa8ZdSk8+ns8cR43pB/+HC8MZxS+fP9yBkEh+nhKFL5R1
         hQjvQLIOKM2ns94xcoWN/eoeqjAm9ZPEI/JOO/yOGyyo6OkXd4e8KQ9ZhH9lvcGaoHOq
         IWDg==
X-Forwarded-Encrypted: i=1; AKwUvBw6MyFJJ3uigk7/YlugyWuHCO5rubfd+l+OwvoW115EUzBLfu6qQbGmN3Z8r3gZYEoa/iIEgN2p78SXjuNs4wJo@lists.infradead.org
X-Gm-Message-State: AFuF++mPRqtN3WNs4zgmViTiYwkYRP2zhzibuiNWBe7btZRNtizD8V2e
	7RQY2Vbwm6UfL/TZ3F3aT5f9WJOXF9rqrxFMEcoQkW3yFYP1DFcwr5+nKpmhjNKW7WP2o3J+Foi
	rLdnhS6ATh7ckKl/AA2IJ4r4OZWgRqw==
X-Received: from wmco24.prod.google.com ([2002:a05:600c:a318:b0:49c:caed:426c])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6306:b0:49c:f5c0:aa76 with SMTP id 5b1f17b1804b1-49cf81e366amr589515835e9.5.1788801580595;
 Mon, 07 Sep 2026 10:19:40 -0700 (PDT)
Date: Mon,  7 Sep 2026 17:19:25 +0000
In-Reply-To: <20260907171930.4037166-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260907171930.4037166-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907171930.4037166-4-sebastianene@google.com>
Subject: [PATCH v9 3/7] KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
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
X-CRM114-CacheID: sfid-20260907_101945_299856_F3176B76 
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

Verify the arguments of the FF-A notification unbind call and forward
the message to Trustzone.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 89872e12f9d4..a1ba4463d1ef 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -694,7 +694,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
@@ -913,6 +912,27 @@ static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
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
 	struct arm_smccc_1_2_regs res = {0};
@@ -978,6 +998,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BIND:
 		do_ffa_notif_bind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_UNBIND:
+		do_ffa_notif_unbind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.979.g7e5102b832-goog


