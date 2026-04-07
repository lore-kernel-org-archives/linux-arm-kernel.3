Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D09BFEEF34
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQ1/QU6bB1fVMZAszRGUyNoOMsBZeQGdHVPM66SLFoU=; b=anB3dzi0cLnZMa
	MlHJM1P8LPrue82pQpPJnEd5E4s69dJX7fdV+OYzruqOx31XhAgXkX5w8qBaew+4uQG7Fa3J8cmIa
	sFtTU02E38jKTxEQd/wMuW+Psce70spcZyREOO86jlhj+9OvkFL2s+4zdwDJzIJ40tEA1hHgeDsD5
	NRBaWlzyTItzgDPds8F6dtzzbxGa3yaM8YeEOAvA4levw8VZVI2XIursfzcWwvzFvFbiBHZmoCbt7
	MmLlzaSXrGrYelylFk7zNn76uiKSdTSQdMdT+7CIPoQqj0Yy3QdDXlKcvh+fBv5cMKGJWBR4lj/cY
	mGMyFzKl97RTjp2vS/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6KP-00000006VXb-2GcJ;
	Tue, 07 Apr 2026 13:18:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6KM-00000006VWe-21eF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:18:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4572A1BB2;
	Tue,  7 Apr 2026 06:18:40 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2299C3F7D8;
	Tue,  7 Apr 2026 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775567926; bh=i+c6ra3/8cZfXlo5XIHBX2j6T0++N9EkiOZ/PzP/xNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OshVwYxTFGTFGSawa5bRFmJFGOmv6oo9ggoXahGU2HPlPekNW42uksSRVLBHgshN8
	 qhZpaqGD1kCOGOzH4tumL/B5WziD4rsw2/JXT82fF7Q8r43PJjDMf9hYWNsdIEA2kC
	 lj69fBtqTtoymQnq/o18Itvj/tC4do9loaIRqu0I=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 08/10] arm64: entry: Use irqentry_{enter_from,exit_to}_kernel_mode()
Date: Tue,  7 Apr 2026 14:16:48 +0100
Message-Id: <20260407131650.3813777-9-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260407131650.3813777-1-mark.rutland@arm.com>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_061846_591429_B486C2A5 
X-CRM114-Status: GOOD (  12.99  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, tglx@kernel.org, luto@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The generic irqentry code now provides irqentry_enter_from_kernel_mode()
and irqentry_exit_to_kernel_mode(), which can be used when an exception
is known to be taken from kernel mode. These can be inlined into
architecture-specific entry code, and avoid redundant work to test
whether the exception was taken from user mode.

Use these in arm64_enter_from_kernel_mode() and
arm64_exit_to_kernel_mode(), which are only used for exceptions known to
be taken from kernel mode. This will remove a small amount of redundant
work, and will permit further changes to arm64_exit_to_kernel_mode() in
subsequent patches.

There should be no funcitonal change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/entry-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 3d01cdacdc7a2..16a65987a6a9b 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -39,7 +39,7 @@ static noinstr irqentry_state_t arm64_enter_from_kernel_mode(struct pt_regs *reg
 {
 	irqentry_state_t state;
 
-	state = irqentry_enter(regs);
+	state = irqentry_enter_from_kernel_mode(regs);
 	mte_check_tfsr_entry();
 	mte_disable_tco_entry(current);
 
@@ -55,7 +55,7 @@ static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
 					      irqentry_state_t state)
 {
 	mte_check_tfsr_exit();
-	irqentry_exit(regs, state);
+	irqentry_exit_to_kernel_mode(regs, state);
 }
 
 /*
-- 
2.30.2


