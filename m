Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76771C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+4lYyJcKTJOchk+se+lVEomgvpRiM8J/+K3xgMhvyo=; b=ER1jxwlTdKF4Bo
	4hWlsXUd5dM2rN6HSHE63/kp0MBxSoZ8g5zqBDltn8HYzomFyExYfsbMDv5ZIt79TEuWW1CdzJO0+
	u51a0/P4zxanrsKCTAvIpXdAfb+9a1pQoFXleXssHbM0br1ZagBesSFishjDGQ4OrLSFqE+bqE3pU
	5VMFu4FGaxVH1njQFZSgFAmIAvTLbmqFYhTSkkctZHvO+qBTLcDsfqFPVS9HajpVvDA7/tHK+82RL
	7F8oXSo1NhKkj0elogAE+IDYm0oLvNOY1C8nTLeX6JvzQxeeiPEQ7YJqJK+fcCk8l0akiz2CYXRmz
	1Ybd3UocTMVwuP5wq38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIaL-00000002Q1M-1LFd;
	Tue, 04 Aug 2026 17:05:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIaJ-00000002PzO-119U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:05:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62B3E1684;
	Tue,  4 Aug 2026 10:05:40 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 701EA3F632;
	Tue,  4 Aug 2026 10:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785863144; bh=qCT1jKAmGgSsjUkSBt87PeNx7fLkJ1u97Bx7EBNo5ig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AldYjHIZREaNdW3I478USfBmmV6zy7HwhSWsviRWmDn4FUWgSPnKHO6CUnQTWy7Mu
	 2T4oCUzs+ttK9zwjJ/JKyizO+/v+0IMx3JFTpYDFwtGZIavG1OnLSrVareartAH2a3
	 7hO2gj1N/mdbCMur3aEwBjP+AwWC0v4ZuQpYP4pI=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 07/20] arm64: ptrace: Always inline pt_regs_[read,write}_reg()
Date: Tue,  4 Aug 2026 18:04:50 +0100
Message-Id: <20260804170503.3513916-8-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260804170503.3513916-1-mark.rutland@arm.com>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_100547_419231_1D96199D 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
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
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
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


