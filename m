Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64840C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aaAd31UDXH9bs1boQRQZHdL78fKXsUHWnXu4JHCDpw=; b=dyjEBo/WJ5MRusWDxSmi31hluV
	osghj9QH0/Sk7s+m8Al8SrBic+Ath9CYYaMlb1cHGpsZxlsg0ldt9BLc/hxZsVbIyw3DPizbA0nQI
	r9MOHBjX0lyMLChDHYiT2NxtqowoLHrZ9kefp5imb+W8ttoPe9Sa+JLuFoc13PrikHxcKVDIcTGE0
	zMARxPMMip4yDLsdOQ4ha7TvNFrI3cjkNXoAPLpLq4Vp59zykqFOgk64pERFMfEBdFp+C/WKzdJX6
	4dySCFnj9rGrPaW0rNb3Og9zwNHZ+Lb7eMse9lRzssw3GEEALtGnbZRbw5B7ky/IB+wUvt6quyh3m
	TmUkTAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1id-00000000pex-21em;
	Thu, 08 May 2025 13:55:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Hw-00000000kUK-204D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:27:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2D261E2F;
	Thu,  8 May 2025 06:27:37 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B19EF3F58B;
	Thu,  8 May 2025 06:27:45 -0700 (PDT)
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
Subject: [PATCH v2 12/24] arm64/fpsimd: Clear PSTATE.SM during clone()
Date: Thu,  8 May 2025 14:26:32 +0100
Message-Id: <20250508132644.1395904-13-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062748_556950_25B320F4 
X-CRM114-Status: GOOD (  14.68  )
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

Currently arch_dup_task_struct() doesn't handle cases where the parent
task has PSTATE.SM==1. Since syscall entry exits streaming mode, the
parent will usually have PSTATE.SM==0, but this can be change by ptrace
after syscall entry. When this happens, arch_dup_task_struct() will
initialise the new task into an invalid state. The new task inherits the
parent's configuration of PSTATE.SM, but fp_type is set to
FP_STATE_FPSIMD, TIF_SVE and SME may be cleared, and both sve_state and
sme_state may be set to NULL.

This can result in a variety of problems whenever the new task's state
is manipulated, including kernel NULL pointer dereferences and leaking
of streaming mode state between tasks.

When ptrace is not involved, the parent will have PSTATE.SM==0 as a
result of syscall entry, and the documentation in
Documentation/arch/arm64/sme.rst says:

| On process creation (eg, clone()) the newly created process will have
| PSTATE.SM cleared.

... so make this true by using task_smstop_sm() to exit streaming mode
in the child task, avoiding the problems above.

Fixes: 8bd7f91c03d8 ("arm64/sme: Implement traps and syscall handling for SME")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/process.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 3bb7f65bf7b7c..27a5b0c7ec60b 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -355,16 +355,13 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	*dst = *src;
 
 	/*
-	 * Detach src's sve_state (if any) from dst so that it does not
-	 * get erroneously used or freed prematurely.  dst's copies
-	 * will be allocated on demand later on if dst uses SVE.
-	 * For consistency, also clear TIF_SVE here: this could be done
-	 * later in copy_process(), but to avoid tripping up future
-	 * maintainers it is best not to leave TIF flags and buffers in
-	 * an inconsistent state, even temporarily.
+	 * Drop stale reference to src's sve_state and convert dst to
+	 * non-streaming FPSIMD mode.
 	 */
+	dst->thread.fp_type = FP_STATE_FPSIMD;
 	dst->thread.sve_state = NULL;
 	clear_tsk_thread_flag(dst, TIF_SVE);
+	task_smstop_sm(dst);
 
 	/*
 	 * In the unlikely event that we create a new thread with ZA
@@ -393,8 +390,6 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 		clear_tsk_thread_flag(dst, TIF_SME);
 	}
 
-	dst->thread.fp_type = FP_STATE_FPSIMD;
-
 	/* clear any pending asynchronous tag fault raised by the parent */
 	clear_tsk_thread_flag(dst, TIF_MTE_ASYNC_FAULT);
 
-- 
2.30.2


