Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756C6C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNWWqDP8wryKVQyW/RhANsfyYEk02x1+HercPHdBo+Y=; b=4OX+wkxHTvjdxs
	+lqnVqLHvbNP56GmDg2LQ1oXwFUEpanrVWkkEq+HvVU9dXvRNwhsaewjFe17felUij3si4hFhmcgo
	UUHNIpsNCEiBxaUL6eFQMYuOIarqVxQOAVmD98QhcRR9Zr+hH4cNl+7qfIR6aoZhsYO8PB/MCilgI
	wGt7ByvVicBpxB7CqCm13whOs6UCojws51ty1QmBPrEZmiQOM27H9FkcXxIhzCsgB2W8B9o1lYjnJ
	C43wlZi21AOh9YsMqKqYs7Y6n1Iz7i01PfT3bsUMQ3Qw0nAZOOPD24aJ9ZRo5483ougC4lb0A7j8Z
	UZtgoI4o75cffJ668ZtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh69-00000005GQr-0EV1;
	Tue, 28 Jul 2026 12:39:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh65-00000005GPV-153Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:39:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CE621A9A;
	Tue, 28 Jul 2026 05:39:44 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B351C3F86F;
	Tue, 28 Jul 2026 05:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785242388; bh=TSKrCYwIYLAtwEuZITiFKuqghJNMJv2A7s4nheGUQQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nJLMT+tn6NZriNVutvjd5SvrSf775dyqYddSiw0VCO407rflM5lArTWXovtjxQu6J
	 F8V7yD2G1GbCqALnt7bN4vjX1+LGA9S8KU3lE7+b+vwAAxBsD51GmptCeTjnB6Xu0q
	 dXqWpN3LtJZJ8iEtfJLNP8ciMEfMhH1qVGpMBl/M=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 03/13] arm64: ptrace: Always inline pt_regs_[read,write}_reg()
Date: Tue, 28 Jul 2026 13:38:49 +0100
Message-Id: <20260728123859.2911495-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260728123859.2911495-1-mark.rutland@arm.com>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_053949_333617_4614A5DA 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

In subsequent patches we'll want to use pt_regs_read_reg() and
pt_regs_write_reg() in noinstr code.

To ensure noinstr safety, both functions must be inlined into their
caller. As both functions are marked as 'inline' rather than
'__always_inline', that's not strictly guaranteed, and the compiler is
permitted to generate out-of-line copies.

Mark both functions as '__always_inline' to ensure this.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/ptrace.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 39582511ad72f..a1aa668aad50e 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -268,7 +268,8 @@ static inline u64 regs_get_register(struct pt_regs *regs, unsigned int offset)
  * Read a register given an architectural register index r.
  * This handles the common case where 31 means XZR, not SP.
  */
-static inline unsigned long pt_regs_read_reg(const struct pt_regs *regs, int r)
+static __always_inline unsigned long
+pt_regs_read_reg(const struct pt_regs *regs, int r)
 {
 	return (r == 31) ? 0 : regs->regs[r];
 }
@@ -277,8 +278,8 @@ static inline unsigned long pt_regs_read_reg(const struct pt_regs *regs, int r)
  * Write a register given an architectural register index r.
  * This handles the common case where 31 means XZR, not SP.
  */
-static inline void pt_regs_write_reg(struct pt_regs *regs, int r,
-				     unsigned long val)
+static __always_inline void
+pt_regs_write_reg(struct pt_regs *regs, int r, unsigned long val)
 {
 	if (r != 31)
 		regs->regs[r] = val;
-- 
2.30.2


