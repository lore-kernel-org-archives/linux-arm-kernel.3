Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963B1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4EfVBc50lUCroHSqgZJB5SUi0BLXJhXfaoHAl0D6DQ=; b=CPLns9s5mjNSSqYrlLjZ+U0XDJ
	2igPbXqF1OBsTGL2FQAahXVy4hkuK5QHnNSOEgOaZUjret4QdptvNbTHsWqr1enh6I7/G0rCSJ5Ff
	mHWSx8Bw3ONJ8EQ81ub5TdL6LhcsXaZZUT1HhXJ1JkXABWIsPzzblaJNjka2b/vWavu+2Mc7SlKnR
	fi/oLHQ4A8SVTWrWNX/H1nPRnQ+7ZrC8u6cO7wqrqcdE+3chACgcZmJVTyuIbWhPJDZZvLC0pidQA
	FWGFcDEQNBq8Y7DBrxl4Oa+DZTgCZRmMVdbv2FCQUf+RzmIVfyCarppVX9OamrGJIFC3xi116jYvq
	40ZLMTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTYg-000000055lF-1Oge;
	Wed, 21 Jan 2026 08:27:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTYe-000000055kg-2ETE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 08:27:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A502060122;
	Wed, 21 Jan 2026 08:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54989C16AAE;
	Wed, 21 Jan 2026 08:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768984039;
	bh=r68ZJJJ1c7EdvRJdPd1/xrzeCtM1H4vRuF8Sk5sagfo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d8bqYrmyq14J/TY1vZXDknH7w87TyZyLl+S14hUghuModX9AJ2mzrEJGgnzd5slwM
	 fu2WfP10uH3NltgSh3BYcWAtbaNoduPhJ5viLDRHV5o4bCB6lyBzD5fnYF+m4/A6mj
	 hCciz9vBQvDIP6rQvGRa8g5L/Sex4MJCu0w9yid9QjH3gPPhqn+hxXQhyT20ss2JIm
	 fgqigz3FxthYHqDAmw5WEmc0IeONopl3ZthjYWZLg7PIWVdyNCyP+SRyjjuiaV/BVu
	 VTevcnHjtkNYhW/QbYozbIem1R7ydqCLgwAmKijiG3OIZfxJL+qd9wy7wzRE5bebK8
	 vYS5t6qoia5bw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AEEC44500;
	Wed, 21 Jan 2026 08:27:19 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Wed, 21 Jan 2026 08:27:13 +0000
Subject: [PATCH v5 2/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in
 host handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-host-direct-messages-v5-2-2c1614c94e80@google.com>
References: <20260121-host-direct-messages-v5-0-2c1614c94e80@google.com>
In-Reply-To: <20260121-host-direct-messages-v5-0-2c1614c94e80@google.com>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Armelle Laine <armellel@google.com>, 
 Sebastien Ene <sebastianene@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Per Larsen <perlarsen@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768984038; l=2874;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=qhcYKwAWcN8zYuALz8BfQQd2qzT5+68uMqM1AI8ru7s=;
 b=wDNdZFgbPAKqh1Dj89bs6SryRSDS5CvEDvRzSjZaKAPy0slJ3E9kCleOP7/iPjEB4/da2+K3r
 ymUkX9NRNvfCfCo/ixmNyp4fFXE9K07y+kkhLDTnbJgeG+MhqOTLQzi
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
 arch/arm64/kvm/hyp/nvhe/ffa.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 9967916278a7ca051500946ef2fcfe7bb40e0e8d..17b92f7faaf68e56aef0ebbe58710b7485a87231 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -684,11 +684,12 @@ static bool ffa_call_supported(u64 func_id)
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
@@ -866,6 +867,7 @@ static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
 			      struct kvm_cpu_context *ctxt,
 			      u64 vm_handle)
 {
+	DECLARE_REG(u64, func_id, ctxt, 0);
 	DECLARE_REG(u32, flags, ctxt, 2);
 
 	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
@@ -875,8 +877,12 @@ static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
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
@@ -942,6 +948,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_PARTITION_INFO_GET:
 		do_ffa_part_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_MSG_SEND_DIRECT_REQ2:
+		if (!ffa_call_supported(func_id))
+			goto out_not_supported;
+		fallthrough;
 	case FFA_MSG_SEND_DIRECT_REQ:
 	case FFA_FN64_MSG_SEND_DIRECT_REQ:
 		do_ffa_direct_msg(&res, host_ctxt, HOST_FFA_ID);
@@ -951,6 +961,7 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	if (ffa_call_supported(func_id))
 		return false; /* Pass through */
 
+out_not_supported:
 	ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
 out_handled:
 	ffa_set_retval(host_ctxt, &res);

-- 
2.52.0.457.g6b5491de43-goog



