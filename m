Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C5ACD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TDzPlo+obG7Khugzgn+eWzESFaACPnZFWLiw8gSSDQ=; b=UPAwds5Woq2ubw6r3VrRk71jqK
	4MDCHOc7gVZZWpAUkG9lLRqo2OMGdwWy69NTG6fL/vcjE5PwayGK6O1GbyGHwRWxYzt/eLXSZ6jcn
	/yy1l6/CHEDpzPHMUMQ8hAFDxIL2CrQ+Kib8HWuJVwjnZ4FexC9ngGUfmZVJcDcFI47MV1dtknQLg
	dujQQLBiFPTJ2Rkti+voVdmqCuy4LnCDqX4ZW7DH+qzjbL5u6wEtqY/I3INXZ+jpb3C8kL3QAkXkh
	fyDA3bL+Th8QM4VmOR97ms9NGe2+P1GGYTAlbWfH/zDlx8LEpMgYwYdFb1lftp5zMgiSphkS284j7
	T1DGGsLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRO-0000000FdRe-1fQU;
	Tue, 16 Jun 2026 10:54:46 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRD-0000000FdJI-25zG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:54:36 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-bed3550917eso355962366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781607273; x=1782212073; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2TDzPlo+obG7Khugzgn+eWzESFaACPnZFWLiw8gSSDQ=;
        b=Vr2m0t/NGCIIYNBp9F6cJAU35DHa0yaIldvn+qZxkrO/Y/pLP9Gc20QEkkhSXOeCNK
         E2vOzPJGqxAexR0qJg35DGct7790JgAC571OrW1mfED3Nq+iCN609q8bVkbEZcautwsh
         v46QEa5vaITbp1YnJd8pOY8WXIpGAOVWywaBs+DtIbRrNXunvdE96z3AhxH6fQ+s18ty
         ru1K2apw6biEIZNl1Q1Qiv3q05LP+nwwBpm2eWl9oPc/dvAkcFAOscHABJd4pNB49Qp/
         RPt6+Drjq5lzqiKow0xsS1lL2BAx/6jXGchIl4pSJifVqP1K5ilsExkzasSHPHnldzqM
         w7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607273; x=1782212073;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2TDzPlo+obG7Khugzgn+eWzESFaACPnZFWLiw8gSSDQ=;
        b=ZNOE5dGaeBWbF7hibRBsEh0GHp9kQXHAAv6E6M5eBU7zf8GJGzP0RS7rOExZoTmzWV
         k0AbfhreA3kTczo0ON4TLBMjbwx+uvjOvXJvuJGxvudE7WwFbaxahCc8nzgbek0FoAfo
         bfmWePk2w+s2mAFFa0gwJbTBd2nxD4bNOs25zTTxYzLkRk0640WGES3wVRXywA2n+V8s
         XMjNnfAfdFNKcN+TTjtJU3IOFo2dyxqzQOXT2iTqIPq7qn8fZuh7ox+vWeEZ0rOHzom0
         rsTXwtC8EWYSdnTkagmIxvs85wuzaejENkKFM7hSr2OOFws/FiqCqiC8aON8aoApSQV+
         B7AQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oPt56ao/c/h6iMnnQ9mdgHYna68uHqMH6pF0mIFafpCID63bPDmZH2l8H8h63z/hN350xyb8qjn5q1EY34Mt9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Nq7yy0UEcCusoux8nIoXgVZKa/vNN+K9dKGWMF1h24KsNoQe
	b4dMSwd1Ld7BZA49bI8Fo/i2kMpYDDm1m4+wSC22VKjaPb75unS+p6Cc9z26Of/+7czpNu+a2Cs
	YeYQIGLMeGv4OzE1nFLQjCg2xPLAKug==
X-Received: from ejcjl3.prod.google.com ([2002:a17:907:75c3:b0:c04:5e68:2b37])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:8a72:b0:c00:f408:c8b7 with SMTP id a640c23a62f3a-c043ee23d0emr122018466b.28.1781607272779;
 Tue, 16 Jun 2026 03:54:32 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:54:15 +0000
In-Reply-To: <20260616105417.2578670-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616105417.2578670-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616105417.2578670-9-sebastianene@google.com>
Subject: [PATCH v3 6/7] KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
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
X-CRM114-CacheID: sfid-20260616_035435_563930_29B7DE4C 
X-CRM114-Status: GOOD (  11.97  )
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
index fcfaa441770d..549250ff8f82 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -715,7 +715,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
@@ -1001,6 +1000,26 @@ static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
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
@@ -1072,6 +1091,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_SET:
 		do_ffa_notif_set(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_GET:
+		do_ffa_notif_get(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1136.gdb2ca164c4-goog


