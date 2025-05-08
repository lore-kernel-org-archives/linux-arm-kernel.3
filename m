Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2632C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtFJEioQsd3OKAo68vWEiarjH/wpk6KuqtxdvPmkkwE=; b=FDK2RSOIfdIGonm+Wn7L+EpNUQ
	8VnKHK9ix7TqYutVo/12hFskfEg6No2HJCxnCGBsiI2zFi2NUnpmrzU5Yl+Bvw88zKWrGV2ZGweKr
	cOtQCLJ6n3xA70jak5/MUJ1Ois/o9ozBmfHRJZt5art0QN/dSb30gfvoer0isOG8KMuA6MfJ+U5/G
	2++hmn7A9c6BDUWW2swNxzPeCK7nHYrkmMcSXB8Fbu9QtQutzEpmjF4EKgUXivWEMhnjoYUhSGm+j
	jVUecmpWQkvWAuykzBg1fVsymNaylydDHLkLe4BJXhVh+K+foYAXEgisHJ4Lk7jHEUGkGMWz1M8nA
	5gUW3MzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1gh-00000000pIM-3Ky6;
	Thu, 08 May 2025 13:53:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Ht-00000000kTO-2j6j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:27:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E32A6106F;
	Thu,  8 May 2025 06:27:34 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E25D33F58B;
	Thu,  8 May 2025 06:27:42 -0700 (PDT)
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
Subject: [PATCH v2 11/24] arm64/fpsimd: Consistently preserve FPSIMD state during clone()
Date: Thu,  8 May 2025 14:26:31 +0100
Message-Id: <20250508132644.1395904-12-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062745_727090_018B69E7 
X-CRM114-Status: GOOD (  13.38  )
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

In arch_dup_task_struct() we try to ensure that the child task inherits
the FPSIMD state of its parent, but this depends on the parent task's
saved state being in FPSIMD format, which is not always the case.
Consequently the child task may inherit stale FPSIMD state in some
cases.

This can happen when the parent's state has been modified by ptrace
since syscall entry, as writes to the NT_ARM_SVE regset may save state
in SVE format. This has been possible since commit:

  bc0ee4760364 ("arm64/sve: Core task context handling")

More recently it has been possible for a task's FPSIMD/SVE state to be
saved before lazy discarding was guaranteed to occur, in which case
preemption could cause the effective FPSIMD state to be saved in SVE
format non-deterministically. This has been possible since commit:

  f130ac0ae441 ("arm64: syscall: unmask DAIF earlier for SVCs")

Fix this by saving the parent task's effective FPSIMD state into FPSIMD
format before copying the task_struct. As this requires modifying the
parent's fpsimd_state, we must save+flush the state to avoid racing with
concurrent manipulation.

Similar issues exist when the parent has streaming mode state, and will
be addressed by subsequent patches.

Fixes: bc0ee4760364 ("arm64/sve: Core task context handling")
Fixes: f130ac0ae441 ("arm64: syscall: unmask DAIF earlier for SVCs")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/process.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 885c1adcf54ca..3bb7f65bf7b7c 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -344,7 +344,14 @@ void arch_release_task_struct(struct task_struct *tsk)
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 {
-	fpsimd_preserve_current_state();
+	/*
+	 * The current/src task's FPSIMD state may or may not be live, and may
+	 * have been altered by ptrace after entry to the kernel. Save the
+	 * effective FPSIMD state so that this will be copied into dst.
+	 */
+	fpsimd_save_and_flush_current_state();
+	fpsimd_sync_from_effective_state(src);
+
 	*dst = *src;
 
 	/*
-- 
2.30.2


