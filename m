Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30393C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 19:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TK6m69TwMliGj/CvHfc+rymQPAcop7juIiz5CEZEfBM=; b=j6ghDY7jzRKEs1jPhqbbpn/UX+
	ZgFsjZtjpcmO/bRfTxgvn2VSyWdwwlSk+2RYDQFJ/GyZXb56gwCIEFtOEGm4gnGwFRjMR9LJwFW9P
	p1V1tmow20pm83QJz6+1QoZ1koTfJ/sHuUcB93RPNgL5i8tjSiEJEZCd8kg3XaHqNJhD3Kev5pf92
	9D/p62p+hQ82wp1BAn/faAipThYcolm33kcyF7OEYWGkc4ZqKS1vmcYE5GGn8YGSLPl4/1HBDJUF3
	TsxAjK5StuB+lHwya7ONpPowXsyHaYLu5d/MQBYyzl40IYH6rW30Ng0/Nfqpgn7PXgjoYhFaiO3Cj
	krtq+IQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCO1P-0000000DExa-0qLL;
	Tue, 06 May 2025 19:32:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKBK-0000000CUPt-1oDT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:26:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59AF61007;
	Tue,  6 May 2025 08:25:56 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A11423F58B;
	Tue,  6 May 2025 08:26:03 -0700 (PDT)
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
Subject: [PATCH 10/20] arm64/fpsimd: Remove redundant task->mm check
Date: Tue,  6 May 2025 16:25:13 +0100
Message-Id: <20250506152523.1107431-11-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250506152523.1107431-1-mark.rutland@arm.com>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_082606_509070_41724507 
X-CRM114-Status: GOOD (  12.81  )
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
task_struct::mm to try to dinstinguish user threads from kernel threads.

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


