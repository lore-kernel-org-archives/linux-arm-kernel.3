Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA12C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3D0xuQZnlofHgVx2W5KKpDjK2IflolNZaSZteTp/rM=; b=wAaCs8dFFq7DPGBNPS+QQ5JUqS
	/Kn8hAazDkYR7nPT5TC12SYru7KxwU8TlfhlYHZVSKI7lvRzM6LTMvg8ImPWE141LwV2QFcbl5jMS
	CjlqCIo7cf2aBIj31AunkdELno/sdiVShCiANuXezHUipVST5IZJZPE6AVC27TzxhdzM/DXd+ybBC
	mHk8VecHt8OpBbhmpdd9Ci/WDvASZSV/Zxylmmybs0PUbFRJGkCp+TqPE/Uq1R21ltk5nnowJSitW
	CwnA035HQZmirqn8Ze0aoSKomc0tNjs0u/Ai8mDdioQox4jYGMCJ/3IeLRRGQ6z7nNcVmQ6NQ6PbR
	HD5RHkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Pq-0000000EBaC-1Gey;
	Mon, 29 Jun 2026 09:36:34 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Pc-0000000EBTF-1Cr1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:36:21 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-49271013dcdso17902985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 02:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782725778; x=1783330578; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A3D0xuQZnlofHgVx2W5KKpDjK2IflolNZaSZteTp/rM=;
        b=oympYBJx289a4XfWrMWS5x/bbEaufKaq2yYeFDd1ABJI+nGR0f/q3Mkny93u++9PpK
         jOQjsG3GGUCrfBjt4+jXmS5xqqJxBSXmKpv9Mxz/nSm1tZbO352vVVTuhk8QmzQuuckO
         aKvJl5o8GMrxOTPLvhT/G5R25wSYJle8x10jvpglECAJpS2hzTAlVZj61pgfv4WheupZ
         uMlLYfUnM0ebulG4KFkkdEKYhAYmLPA9CW5uVbP2cZIhHELae/NvT7reBABlN2WJ8QKv
         UpstehzYmBs3JuJue1FpC6vZg2GHa199sRvWxZtliFxH6wXcg8BsYfMdd0uIohzKPxsw
         +95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725778; x=1783330578;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A3D0xuQZnlofHgVx2W5KKpDjK2IflolNZaSZteTp/rM=;
        b=sWi8lnmqnmnP1NWH3lk1d4VMhuZlrazqjezcx4YaR7kNpIVhRgqJK6qAqd6wCdW68b
         c68sI+PXYFFcHDk35yJznwdHo1hJygH6yluQdgXKnlS0oMEG+9Ym7pz649uNc6Blmy6E
         eQuTuAEGZwwgIrGDenxAqSYjccptzmUUQdwhMsntupE+eHXl6h8twETVGOyR6AHw/ZuJ
         byhBQz0X02MOaxXNupm5nWJO46K6iWQ8izpN3Nn0PpZqsTEyglZhq0Qs35q/manxDagK
         DYQC8Fxlu41dcwp9sLZ6DEsU/BsRCDk5yMrlTjWRDajBrg0T78pa99MXQ7ixdFvXeKf4
         pg3A==
X-Forwarded-Encrypted: i=1; AFNElJ+fCbB86sK6vplPThlCeqYwka8JEzlb38yJT6K4yu6lH12m1cpabLN2FAlq/MR7UaCetjs2+F/s1Sv4mSyk5gHR@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ9wmFwajnMbuz4MXGu7vosyavmgYGJwKcl6+82Z4b1w4XDwBs
	KP38hTfMcODsoFVXc5W03xSJ5mOb3SdwifTjxe4s7LAYLzmSP5McNzhu8N/jnvVN/eeKwGrcv07
	6IKF/ZDOY3rn4BDxncBINx+X4ZnBrtg==
X-Received: from wmnk7.prod.google.com ([2002:a05:600c:1687:b0:493:b0fe:519e])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3552:b0:492:700b:deea with SMTP id 5b1f17b1804b1-492700bdef5mr174973385e9.13.1782725777696;
 Mon, 29 Jun 2026 02:36:17 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:35:56 +0000
In-Reply-To: <20260629093558.2425257-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260629093558.2425257-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260629093558.2425257-6-sebastianene@google.com>
Subject: [PATCH v7 5/7] KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
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
X-CRM114-CacheID: sfid-20260629_023620_336387_D4361404 
X-CRM114-Status: GOOD (  12.58  )
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
hypervisor to Trustzone and verify the arguments sent from the host
driver.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 2bb16aa414f9..c22fe4514741 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -679,7 +679,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
@@ -938,6 +937,27 @@ static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
+			     struct kvm_cpu_context *ctxt)
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
+	if (flags & GENMASK(31, 4)) {
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
@@ -1009,6 +1029,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_SET:
 		do_ffa_notif_set(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_GET:
+		do_ffa_notif_get(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.rc0.799.gd6f94ed593-goog


