Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1D2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 18:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaqsx1T3+z+wsKZMt5BYMEFxX9Jh3Fvf/2DcN3lcP+o=; b=3Hk+0M3/j2731Q2/l8UtZz+2ey
	V5fGj9ey+5abZ/wl1MkHSU2lO214qGdKWg/ejftqA64Edq5XJw+J68fpBkhri/UxKodb1IatirfSp
	oBZOaAlUYyU5GP/pdYcc5buHUr6RcnaJ9e0nq7zuiGXggHCvLUGtwMGt7WbmeqXHG1s5IGJ2YSeTz
	4v+UmEGJ7nFO1Zw2Ov1apN6cIlug9ciJzIMO05Eizs0FoN3MUfaASkv6OTH70txxiGKMsBPp9MzgL
	Fm//8RAdguTrAvE22Qzg5NFHCDqDogwPpatyHyq8bEl2mtGJyGyi9dKi3rxf+sYTax0VFNCp3VG+p
	IdIa4uAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lMG-0000000CTxE-2iKf;
	Fri, 04 Apr 2025 18:01:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0l6A-0000000CRQe-26yM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 17:44:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65DCD1515;
	Fri,  4 Apr 2025 10:45:00 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E40B13F63F;
	Fri,  4 Apr 2025 10:44:56 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH 08/14] arm64/fpsimd: Avoid clobbering kernel FPSIMD state with SMSTOP
Date: Fri,  4 Apr 2025 18:44:29 +0100
Message-Id: <20250404174435.3288106-9-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250404174435.3288106-1-mark.rutland@arm.com>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_104458_589007_323ECA45 
X-CRM114-Status: GOOD (  12.70  )
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

On system with SME, a thread's kernel FPSIMD state may be erroneously
clobbered during a context switch immediately after that state is
restored. Systems without SME are unaffected.

If the CPU happens to be in streaming SVE mode before a context switch
to a thread with kernel FPSIMD state, fpsimd_thread_switch() will
restore the kernel FPSIMD state using fpsimd_load_kernel_state() while
the CPU is still in streaming SVE mode. When fpsimd_thread_switch()
subsequently calls fpsimd_flush_cpu_state(), this will execute an
SMSTOP, causing an exit from streaming SVE mode. The exit from
streaming SVE mode will cause the hardware to reset a number of
FPSIMD/SVE/SME registers, clobbering the FPSIMD state.

Fix this by calling fpsimd_flush_cpu_state() before restoring the kernel
FPSIMD state.

Fixes: e92bee9f861b466c ("arm64/fpsimd: Avoid erroneous elide of user state reload")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index b19736f354a71..4a0b0bb3a3fad 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1550,8 +1550,8 @@ void fpsimd_thread_switch(struct task_struct *next)
 		fpsimd_save_user_state();
 
 	if (test_tsk_thread_flag(next, TIF_KERNEL_FPSTATE)) {
-		fpsimd_load_kernel_state(next);
 		fpsimd_flush_cpu_state();
+		fpsimd_load_kernel_state(next);
 	} else {
 		/*
 		 * Fix up TIF_FOREIGN_FPSTATE to correctly describe next's
-- 
2.30.2


