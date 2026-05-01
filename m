Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1530CFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 05:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKLqTGzU5ANiZo2GehnX1jbysz4ijS7QkoDKhOLbCQc=; b=iw98Fpr9ZMOupf1JpBQie1yJPc
	HSQK7qUsWRxvQUb1c2rd+1A+3jf3rxqdfVMJtrCGoEqKTmP1ikhciehDZjsA+Q6NHIxbYFddftSNN
	LN02n0W1mYnFLwSmJ3UPtM+R9wzrAeH1sjgD6OppnVSoqQUG//7oYd27vp0J2XpuKqjfxIOmYuGl9
	SX1EtMo8w/N7S1HVbpW0VNKz+zs3XX2TmkEFXqmIiI2bUOdcMW9oRhZ51O7Rx5948D2Tirdyva29f
	U4BQUZdXecu8DU3TTyjX9qKyp7QC3uBrJrQ/Zak5tyAktXb38M185QXwf5jJ+l6rLg/w3/e2Am3dH
	MVN4Hc6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIgWa-00000006NnW-2NFu;
	Fri, 01 May 2026 05:34:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIgWS-00000006NlY-2JMd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 05:34:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B61354352A;
	Fri,  1 May 2026 05:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F347C2BCF4;
	Fri,  1 May 2026 05:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777613682;
	bh=02hritkuRia/NUsILyAl+fwkSTtmm8nIN99AHP1vLTE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LxIKvIzwuPld8RUi9+MCpj3Gpfi7CH9jql5Lc0Y9H4aZf5A0hAhyaAPwm3nHyIRoa
	 TC3VgZwM21LA+8exLBg7jRDBo8+4usx7DnXZ02aFbRU/voSW9ZRdOgDMpeLDVBtNp8
	 z2zcybNEfyP7R7MCrG3HlOGvlanAS02HIDmqedpS8B/TIc7abNLc29xTpW1Pz1RWSV
	 f3dNVWCm7zkzuzliO49VuvBbuDqr/ZDlAkoigIAaw7FddjytCje9P6P5xooEh6SVBT
	 dR0lue9CCekQnKMSxqPQRQpwOtzwN6/1jnxM2lGr1Wy/n+ilbUfaNzgU+1AbM8ez8r
	 8I3lCwliMZaLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F149CD3423;
	Fri,  1 May 2026 05:34:42 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Fri, 01 May 2026 05:34:33 +0000
Subject: [PATCH v6 2/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in
 host handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-host-direct-messages-v6-2-3f4af727ed85@google.com>
References: <20260501-host-direct-messages-v6-0-3f4af727ed85@google.com>
In-Reply-To: <20260501-host-direct-messages-v6-0-3f4af727ed85@google.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777613681; l=2811;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=D52fxn/RTqq+qOlfiavgPL69WPcwS2YzoibHOHlzoKs=;
 b=lZWOdEHB5Rvp2EAxkToend0R76LiDEzi0pu+a914eZw/0wOL0GKZPr8ZeUugB8DouPbhrCPgq
 3OUwR3WhkavBg2JcAvGO0GOoP4wgmMJlNBGuwFwhcX1i1UKb8CnzcDg
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_223444_660186_13D5ABB4 
X-CRM114-Status: GOOD (  12.03  )
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
index 3a58e01d255f..e5718c0f1c31 100644
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
@@ -865,6 +866,7 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
 			      struct kvm_cpu_context *ctxt)
 {
+	DECLARE_REG(u64, func_id, ctxt, 0);
 	DECLARE_REG(u32, endp, ctxt, 1);
 	DECLARE_REG(u32, flags, ctxt, 2);
 
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
 		do_ffa_direct_msg(&res, host_ctxt);
@@ -951,6 +961,7 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	if (ffa_call_supported(func_id))
 		return false; /* Pass through */
 
+out_not_supported:
 	ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
 out_handled:
 	ffa_set_retval(host_ctxt, &res);

-- 
2.54.0.545.g6539524ca2-goog



