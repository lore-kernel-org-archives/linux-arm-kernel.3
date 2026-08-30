Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44353C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 23:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/NSj5hQUhlAxRrEX8D7l8WQ7OI6pFZruvfsUr5n4dg=; b=k2owMAvZnOPMp8VjxOnNT9ydAO
	8PcV/uVJltjD75I7IiuTaRj7+2Yo51BeJhwOVgSzp+W7EoO1Jr/GSb8RSAzF1ZaNhOnYsz5BmKIAJ
	gHMoIGzHbhZpni7jkG0Ok9iGPQMqiHX2yCVVeZt4gA4k6sR6KxyfwW8+pfhL/39X4e8fHXnaeuFsl
	XIUV+uvTWRP1ywVVY3fsfH/LFhbsskWwgfJyXFMfwulkYa7ua0tP/ganNjv/6E5GtF2av41/pSsok
	DCSDLeZcY1oGoiDFahYIis0YzrFm3GKAGnonYsk9A6r/1LeXa0ZgX0fa9KAsG1bafCbh0OR1yfmVW
	6/wBUYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0odi-00000008Cl8-1hYr;
	Sun, 30 Aug 2026 23:08:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0odh-00000008Ckd-0fN1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 23:08:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D83B601DB;
	Sun, 30 Aug 2026 23:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D6A6C2BCFC;
	Sun, 30 Aug 2026 23:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788131316;
	bh=TNNJ/C/qEw4KyhnlvAu82dE0ffiDedqwMDh+oVE2Ne0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sPtJbT2d85sgiROoP7vavZD1YHEkNPVkdXyobo3uMSSK/cfU/EY206jlRdkpHD0VJ
	 sFyn/ryIiujT5sYM2x5fmsTfVIRfgk2t5eBqAyZuQYQP4jWUCG7SU+eeJ4NCfAjazu
	 Aj3ccBk4v5c9c/YmPEkijZptvBobxHqxczyRHb7jz5IaRxNCoNHNpr6tsQ13vtApGg
	 mJ4cEV61DVHvay9xOdD6XYsTG/Yajs5NqHZUC28EK5mQlLcB2msIojH2tb/nlbMj1f
	 alXoqEWJB0BTIt/zOXZuP3y1kZ65cTKG89555sz+hd2R0ZD/AssRdBNAMc7vCgp329
	 z8bqWGxwRXDJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D3AC61DF1;
	Sun, 30 Aug 2026 23:08:35 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Sun, 30 Aug 2026 23:08:15 +0000
Subject: [PATCH v7 3/3] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in
 host handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-host-direct-messages-v7-3-45f6e6db72c2@google.com>
References: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com>
In-Reply-To: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Sebastien Ene <sebastianene@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Per Larsen <perlarsen@google.com>, 
 Fuad Tabba <fuad.tabba@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788131315; l=2862;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=nnwVuYK389tkxvmLcVFxyVM3lQJCgHwgjV/Ux8ncI+U=;
 b=B75pX6j34kDpulGyZCb2fOLdzdqf4Xz1eBSV9Ek8GgCprbLn+K3pZaRwIjYFOMPJnbpiB2eq9
 bC5KQxSFqbRD+6xQVwHLGI5tN0I3xE+UbBqJULS9j5oqUyyJt1P9Dac
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
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
Reply-To: perlarsen@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Per Larsen <perlarsen@google.com>

FF-A 1.2 adds the DIRECT_REQ2 messaging interface which is similar to
the existing FFA_MSG_SEND_DIRECT_{REQ,RESP} functions and can use the
existing handler function. Add support for FFA_MSG_SEND_DIRECT_REQ2 in
the host ffa handler.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Per Larsen <perlarsen@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 96cf6be969de..eeb8d5b6f3e0 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -702,11 +702,12 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
-	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
 	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
 	case FFA_CONSOLE_LOG:			/* Optional per 13.1: not in Table 13.1 */
 	case FFA_PARTITION_INFO_GET_REGS:	/* Optional for virtual instances per 13.1 */
 		return false;
+	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
+		return hyp_ffa_version >= FFA_VERSION_1_2;
 	}
 
 	return true;
@@ -880,7 +881,8 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	hyp_spin_unlock(&host_buffers.lock);
 }
 
-static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
+static void do_ffa_direct_msg(const u64 func_id,
+			      struct arm_smccc_1_2_regs *res,
 			      struct kvm_cpu_context *ctxt)
 {
 	DECLARE_REG(u64, endp, ctxt, 1);
@@ -894,8 +896,12 @@ static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
 		return;
 	}
 
-	/* filter out framework messages and validate SBZ/MBZ bits */
-	if (flags) {
+	/*
+	 * filter out framework messages and validate SBZ/MBZ flag bits.
+	 * FFA_MSG_SEND_DIRECT_REQ2 implies flag-less partition message.
+	 */
+	if ((func_id == FFA_MSG_SEND_DIRECT_REQ ||
+	     func_id == FFA_FN64_MSG_SEND_DIRECT_REQ) && flags) {
 		ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
 		return;
 	}
@@ -961,15 +967,20 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_PARTITION_INFO_GET:
 		do_ffa_part_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_MSG_SEND_DIRECT_REQ2:
+		if (!ffa_call_supported(func_id))
+			goto out_not_supported;
+		fallthrough;
 	case FFA_MSG_SEND_DIRECT_REQ:
 	case FFA_FN64_MSG_SEND_DIRECT_REQ:
-		do_ffa_direct_msg(&res, host_ctxt);
+		do_ffa_direct_msg(func_id, &res, host_ctxt);
 		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
 		return false; /* Pass through */
 
+out_not_supported:
 	ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
 out_handled:
 	ffa_set_retval(host_ctxt, &res);

-- 
2.55.0.897.gb25b4bd76c-goog



