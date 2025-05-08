Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2011C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLXqKUZsoGMOj9z7WgfqnwOZLQ0qB+doznGR8iiZjkc=; b=orYZfTzMp8sf+yQzsW/yW+lioh
	h8vP2KI71NsuNvX6100FNqEcOntbByi6pGT4ki52K/fbaw6Z1iLF+vOQ/yecvPx2QSuHP5qhkdlVm
	C0k2T36fbaELp0JSM3Xo1JTD0aQiiABvQu6K6TfQcnIgoRa4QE2etmXjetrEVq1rM6Dfurdv4c5JQ
	UpOivUtyVs4EL/2rif4zD4SY5p0s6YEzTvbx4HRX12thElssRo0g1/Fr4uxQoR7lw1y2GRnyMJQMr
	cAfiGgeP9QqPYorWD7g0tLSrpbvzAEUx/bNqKDsSf3wwUIAhmRNQQJFYuW83HJLQSe2MuxTeQYogx
	eYt0HiMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1em-00000000p2x-0VSv;
	Thu, 08 May 2025 13:51:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Hq-00000000kSr-3cfu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:27:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FEED106F;
	Thu,  8 May 2025 06:27:32 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1ED113F58B;
	Thu,  8 May 2025 06:27:39 -0700 (PDT)
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
Subject: [PATCH v2 10/24] arm64/fpsimd: Remove redundant task->mm check
Date: Thu,  8 May 2025 14:26:30 +0100
Message-Id: <20250508132644.1395904-11-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062742_942126_78AAE54C 
X-CRM114-Status: GOOD (  12.78  )
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

For historical reasons, arch_dup_task_struct() only calls
fpsimd_preserve_current_state() when current->mm is non-NULL, but this
is no longer necessary.

Historically TIF_FOREIGN_FPSTATE was only managed for user threads, and
was never set for kernel threads. At the time, various functions
attempted to avoid saving/restoring state for kernel threads by checking
task_struct::mm to try to distinguish user threads from kernel threads.

We added the current->mm check to arch_dup_task_struct() in commit:

  6eb6c80187c5 ("arm64: kernel thread don't need to save fpsimd context.")

... where the intent was to avoid pointlessly saving state for kernel
threads, which never had live state (and the saved state would never be
consumed).

Subsequently we began setting TIF_FOREIGN_FPSTATE for kernel threads,
and removed most of the task_struct::mm checks in commit:

  df3fb9682045 ("arm64: fpsimd: Eliminate task->mm checks")

... but we missed the check in arch_dup_task_struct(), which is similarly
redundant.

Remove the redundant check from arch_dup_task_struct().

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/process.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 42faebb7b7123..885c1adcf54ca 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -344,8 +344,7 @@ void arch_release_task_struct(struct task_struct *tsk)
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 {
-	if (current->mm)
-		fpsimd_preserve_current_state();
+	fpsimd_preserve_current_state();
 	*dst = *src;
 
 	/*
-- 
2.30.2


