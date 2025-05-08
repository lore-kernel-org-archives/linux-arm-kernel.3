Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB34C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDdK3bMt6c6f13AufltgVL73ucc1d1dUcQAFYp7Jb/k=; b=HLgZvrfpIgufs9CDoB9WboWcvN
	jCLSGtn/ebkx3WYRzqSJnBXHG6B0uEjZpJvCsRRai7PmffCqWkqqEGB2XmXUO2sKh42qbUYYeSjjw
	V5WU3Au1lRbOKKRakx4p9aLXPKm1x8O5J7tDWedtCiMOjp4mIr8OIKg+S3ctVL+iIcYnEv/2lgMyI
	iu3Hb60YY/87OEH3KNHJS6RYSIkKxn/OQFrd+Aq6+pXP5RnEkQPnv2RItvku/shu/Nb+EGzNrbJif
	dypibwqAMOq6HLUzHAJFGjHmqTqUhmUlmAfdz/HL5P9VbWXCoSgDSBlEwS7C/VlAff7Ws0MsLGhhU
	0R5QcF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1sH-00000000r1t-0VfF;
	Thu, 08 May 2025 14:05:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1IA-00000000kXz-3S4W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:28:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B63101E2F;
	Thu,  8 May 2025 06:27:51 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B59163F58B;
	Thu,  8 May 2025 06:27:59 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	daniel.kiss@arm.com,
	david.spickett@arm.com,
	luis.machado@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	richard.sandiford@arm.com,
	sander.desmalen@arm.com,
	tabba@google.com,
	tamas.petz@arm.com,
	tkjos@google.com,
	will@kernel.org,
	yury.khrustalev@arm.com
Subject: [PATCH v2 17/24] arm64/fpsimd: ptrace: Do not present register data for inactive mode
Date: Thu,  8 May 2025 14:26:37 +0100
Message-Id: <20250508132644.1395904-18-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062802_948313_7FB84287 
X-CRM114-Status: GOOD (  19.81  )
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

The SME ptrace ABI is written around the incorrect assumption that
SVE_PT_REGS_FPSIMD and SVE_PT_REGS_SVE are independent bit flags, where
it is possible for both to be clear. In reality they are different
values for bit 0 of the header flags, where SVE_PT_REGS_FPSIMD is 0 and
SVE_PT_REGS_SVE is 1. In cases where code was written expecting that
neither bit flag would be set, the value is equivalent to
SVE_PT_REGS_FPSIMD.

One consequence of this is that reads of the NT_ARM_SVE or NT_ARM_SSVE
will erroneously present data from the other mode:

* When PSTATE.SM==1, reads of NT_ARM_SVE will present a header with
  SVE_PT_REGS_FPSIMD, and FPSIMD-formatted data from streaming mode.

* When PSTATE.SM==0, reads of NT_ARM_SSVE will present a header with
  SVE_PT_REGS_FPSIMD, and FPSIMD-formatted data from non-streaming mode.

The original intent was that no register data would be provided in these
cases, as described in commit:

  e12310a0d30f ("arm64/sme: Implement ptrace support for streaming mode SVE registers")

Luckily, debuggers do not consume the bogus register data. Both GDB and
LLDB read the NT_ARM_SSVE regset before the NT_ARM_SVE regset, and
assume that when the NT_ARM_SSVE header presents SVE_PT_REGS_FPSIMD, it
is necessary to read register contents from the NT_ARM_SVE regset,
regardless of whether the NT_ARM_SSVE regset provided bogus register
data.

Fix the code to stop presenting register data from the inactive mode.
At the same time, make the manipulation of the flag clearer, and remove
the bogus comment from sve_set_common(). I've given this a quick spin
with GDB and LLDB, and both seem happy.

Fixes: e12310a0d30f ("arm64/sme: Implement ptrace support for streaming mode SVE registers")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Spickett <david.spickett@arm.com>
Cc: Luis Machado <luis.machado@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 67f3843de51f5..a2075e1df27c6 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -775,6 +775,11 @@ static void sve_init_header_from_task(struct user_sve_header *header,
 		task_type = ARM64_VEC_SVE;
 	active = (task_type == type);
 
+	if (active && target->thread.fp_type == FP_STATE_SVE)
+		header->flags = SVE_PT_REGS_SVE;
+	else
+		header->flags = SVE_PT_REGS_FPSIMD;
+
 	switch (type) {
 	case ARM64_VEC_SVE:
 		if (test_tsk_thread_flag(target, TIF_SVE_VL_INHERIT))
@@ -789,19 +794,14 @@ static void sve_init_header_from_task(struct user_sve_header *header,
 		return;
 	}
 
-	if (active) {
-		if (target->thread.fp_type == FP_STATE_FPSIMD) {
-			header->flags |= SVE_PT_REGS_FPSIMD;
-		} else {
-			header->flags |= SVE_PT_REGS_SVE;
-		}
-	}
-
 	header->vl = task_get_vl(target, type);
 	vq = sve_vq_from_vl(header->vl);
 
 	header->max_vl = vec_max_vl(type);
-	header->size = SVE_PT_SIZE(vq, header->flags);
+	if (active)
+		header->size = SVE_PT_SIZE(vq, header->flags);
+	else
+		header->size = sizeof(header);
 	header->max_size = SVE_PT_SIZE(sve_vq_from_vl(header->max_vl),
 				      SVE_PT_REGS_SVE);
 }
@@ -832,6 +832,13 @@ static int sve_get_common(struct task_struct *target,
 	BUILD_BUG_ON(SVE_PT_FPSIMD_OFFSET != sizeof(header));
 	BUILD_BUG_ON(SVE_PT_SVE_OFFSET != sizeof(header));
 
+	/*
+	 * When the requested vector type is not active, do not present data
+	 * from the other mode to userspace.
+	 */
+	if (header.size == sizeof(header))
+		return 0;
+
 	switch ((header.flags & SVE_PT_REGS_MASK)) {
 	case SVE_PT_REGS_FPSIMD:
 		return __fpr_get(target, regset, to);
@@ -859,7 +866,7 @@ static int sve_get_common(struct task_struct *target,
 		return membuf_zero(&to, end - start);
 
 	default:
-		return 0;
+		BUILD_BUG();
 	}
 }
 
@@ -946,10 +953,7 @@ static int sve_set_common(struct task_struct *target,
 		goto out;
 	}
 
-	/*
-	 * Otherwise: no registers or full SVE case.  For backwards
-	 * compatibility reasons we treat empty flags as SVE registers.
-	 */
+	/* Otherwise: no registers or full SVE case. */
 
 	/*
 	 * If setting a different VL from the requested VL and there is
-- 
2.30.2


