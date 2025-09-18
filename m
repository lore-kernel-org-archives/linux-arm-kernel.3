Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76796CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 17:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bkhhJ2LfZIdo9Nb1gzmtF/6iqCynxQwtZT4kutVgwpI=; b=Bvxm0tZFc/BGl3ZsfR7M7YyiAY
	plD19ZKEq3nkjxCLj3BLs/AOodBnWR+dD+F1rz6XpXPSYU7z3fHQGJCLkk/0da3/qEmBXPgFvHzVD
	JkIKPXfp3IrBeVZb5mKdzBA6uPf3xPZKl7jFgkd5Ly79Q8NMfyMam87DPaV9umRUXaQlyeLDI6810
	XpBRqvIexX68mdEboX0CX89nVyUl50q+G/2EgAaXz6E7vfX7SlbUWUXQu3Ivt+XHvTGXck4bp2OGC
	gCMV9ib1qF8SzQtAlus36Da2YtL3uG7rwajhjZguadW89LjWVVRWnAyA2HL3R1IfK1YcixlJbqd+7
	3I4Jv+aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIpz-00000000odg-3LDy;
	Thu, 18 Sep 2025 17:54:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIpw-00000000odL-2BhI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 17:54:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AE12176C;
	Thu, 18 Sep 2025 10:54:19 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EE4C3F673;
	Thu, 18 Sep 2025 10:54:27 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	liaochang1@huawei.com,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH] arm64: probes: Fix incorrect bl/blr address and register usage
Date: Thu, 18 Sep 2025 12:54:24 -0500
Message-ID: <20250918175424.3483164-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_105428_595878_A7B9FEE8 
X-CRM114-Status: GOOD (  10.32  )
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

The pt_regs registers are 64-bit on arm64, and should be u64 when
manipulated. Correct this so that we aren't truncating the address
during br/blr sequences.

Fixes: efb07ac534e2 ("arm64: probes: Add GCS support to bl/blr/ret")
Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 arch/arm64/kernel/probes/simulate-insn.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/probes/simulate-insn.c b/arch/arm64/kernel/probes/simulate-insn.c
index 97ed4db75417..89fbeb32107e 100644
--- a/arch/arm64/kernel/probes/simulate-insn.c
+++ b/arch/arm64/kernel/probes/simulate-insn.c
@@ -145,7 +145,7 @@ void __kprobes
 simulate_br_blr(u32 opcode, long addr, struct pt_regs *regs)
 {
 	int xn = (opcode >> 5) & 0x1f;
-	int b_target = get_x_reg(regs, xn);
+	u64 b_target = get_x_reg(regs, xn);
 
 	if (((opcode >> 21) & 0x3) == 1)
 		if (update_lr(regs, addr + 4))
@@ -160,7 +160,7 @@ simulate_ret(u32 opcode, long addr, struct pt_regs *regs)
 	u64 ret_addr;
 	int err = 0;
 	int xn = (opcode >> 5) & 0x1f;
-	unsigned long r_target = get_x_reg(regs, xn);
+	u64 r_target = get_x_reg(regs, xn);
 
 	if (user_mode(regs) && task_gcs_el0_enabled(current)) {
 		ret_addr = pop_user_gcs(&err);
-- 
2.50.1


