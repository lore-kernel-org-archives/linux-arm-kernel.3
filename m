Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE49BCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKil37HAzALzonWw/7fqaOm1BrpCO8SF3FKst/evun4=; b=ufriNNgo7EJdbt6K9cekaDM+Yt
	qNa8qjz0idAM/m4DEXAK0SHrVNpIA2cU1CztU0fk8czfF3EUSfpkl2/700yHclQXuOBqWmhOgpjlP
	nRszA3bamn8Kp3kWycumnfjT1e8LsA6tMxIa8ZT0vMWMrgME5eKXHQplfpVuPZor68Daz0UfaF4lY
	U2yK5fqsXe8jP5SJcPeI+5NIvIafO0lrav1XJxUQInIWSF1rdSkF45DFsTO/4ciZkx8aHi1vR+eP8
	WaDcHV0fmYnMmUOb2iQkw3cWSVolxxY118upy75QfjwsmxaNOLFf3l4K2Zw3YGHXIEQx3C2V+q/HS
	iQPGkaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVvi-0000000G2F7-17ln;
	Tue, 16 Jun 2026 15:42:22 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVvc-0000000G29d-34L1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:42:17 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-46010bc0f1eso2784222f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 08:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781624534; x=1782229334; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wKil37HAzALzonWw/7fqaOm1BrpCO8SF3FKst/evun4=;
        b=N5pTReCGHoG13VW2ihbwKuO/KXCXzQCKV5iIYgJLlQBFw7lS4VLHrCC7ulzxjSGitw
         P/q2fCrtM6q1M6JEejQ2bnOUOUcnRY8T64Bj1bOTARKmXUBttaLbzZWdOOpZyqDGXrai
         GKoPIO4afA6Gl6JGrparjCdqCRGgdcH0MQEr7IueIvWF+UOjuU59pkd7JNSUAnZptjHl
         Ed6QagpzQYgHiik/s7FFRFMz3QoeY3qvONZmx/7FoAl2JUZxmz4qRPGWN95gcy/VlfpL
         T9uZCSpPNYgXw3wnjwcC/ytCHEH8/Aj3sg6lO4/JI5r0Nn3VsZ8LrYv4rEoykGZOqgS0
         HR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781624534; x=1782229334;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wKil37HAzALzonWw/7fqaOm1BrpCO8SF3FKst/evun4=;
        b=OdZJglgwYXxmU4haU2aSm/nH3aqXjdhx5VSz+heBy/RfXbtovSJSvDpMRaP1JmzvDF
         FPgogFwlHalUvXYcDt8wY26Wjc8CktKV/DH6Txpx4MDFI+WWJehI9KO7AhwA/dphPuzz
         loD3WCdhoTLuxDhiFjKCTpyP6HWNayFmx3SrW/XRN/Xa6Jl6QWLI9OAJqF6V95oFHws5
         NrgkfCwP/XtPKdSxMIS8OFmV/+Cs2QG+qf+MjLcS4fPYalZ3Mx6GlmqqyemgCVkX+8T8
         sGElnX45nLSLx2kFG0vuO8GiZ+yCa25Z6LxV3Uqz+FAghNZkbIW1RXJvlXSmoz1MAwJO
         BvxQ==
X-Forwarded-Encrypted: i=1; AFNElJ85enNGQUfBOwRI2yc/GKWWhw6c0sWWuXMwLqqj0j2tmDHMaiOHSYTV4rzVxen5vmgG1kfKQ/rhg8vIjcFCFUYG@lists.infradead.org
X-Gm-Message-State: AOJu0YxD+iDyvAuP4xB2hOvtaACbKbW8sOj0lnVq1DS/dtivElCRO6ge
	FEHb1XZu7kt9OeZXCyw8Z08eteG/9F7JdgN7FOln5ART4QcEZ+R5Ru6VFqKrDdxnRob+8eX+FtG
	apA69NSE+1sQ2zG6lTGznL4oOJK0lRg==
X-Received: from wmxb10-n1.prod.google.com ([2002:a05:600d:844a:10b0:490:bb60:cdf4])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0c8:b0:490:b446:fb8 with SMTP id 5b1f17b1804b1-492333af102mr792995e9.11.1781624534173;
 Tue, 16 Jun 2026 08:42:14 -0700 (PDT)
Date: Tue, 16 Jun 2026 15:41:46 +0000
In-Reply-To: <20260616154149.2763214-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616154149.2763214-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616154149.2763214-5-sebastianene@google.com>
Subject: [PATCH v4 4/7] KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
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
X-CRM114-CacheID: sfid-20260616_084216_789942_17027054 
X-CRM114-Status: GOOD (  12.24  )
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
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1f38ad008675..adf8680f3266 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -715,7 +715,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
@@ -955,6 +954,27 @@ static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
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
@@ -1020,6 +1040,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BIND:
 		do_ffa_notif_bind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_UNBIND:
+		do_ffa_notif_unbind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1136.gdb2ca164c4-goog


