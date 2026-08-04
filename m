Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5761C55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKBNvPGnxnletea9DBl4kwadOMngwkMc+J2PddjHVpg=; b=fGcJJfqltXnVpc
	1Jpyo+7I6T0id5Vzg/xsI9zrRAhA4ykBZAqLEGlRuSyseFBniIWh4J0JDSdi0eImcjaGLHPs00vCH
	Kc6lAQcaAqhwfAxiHVJHgK9TcynpRbDnw+fPlbY8yIPKgBLuT+Xnb+W5fG5ki3mu1aeWPy6S9WmZE
	HAFTMDdRKl0yxTKYGREX+EOSDNtDSFMHewj+Y8+BI2bu/PmnhpbhtB0MhJhJie2GI75v3EVXyYxNY
	BwFyXEtr+zz2wEV8sZ/W1HyOewCZzIIoCATUmQEnd5/9qoWXTKaoBPmryFRH5jqegufqYA3u+KpW/
	tS3FybQYMdXCALxYC3Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIad-00000002QLF-05og;
	Tue, 04 Aug 2026 17:06:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIaa-00000002QIc-2Fk5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:06:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71618165C;
	Tue,  4 Aug 2026 10:05:58 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F2123F632;
	Tue,  4 Aug 2026 10:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785863162; bh=GqzmHYtgEjIxP+UFJ5lv+pjfRoiYR8pz4lfNF7Y/PDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UlPHatFpFMdOgqcQWfYHzrMdjUt79Sfy0Ff+qU5+ZnEd8m3jhkDW3sDvmzIuVtK0w
	 5psWaaTxQ//79YuRn6MHKbcmcNl71Ze84eaKNC8kmIWw04biRbKgQQqsdmnLkhH03B
	 WbqTiRb56B1eYGuymjgHrrCnAraSqEupi4MDnMgA=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 11/20] arm64: entry: sdei: Restore all clobberable GPRs
Date: Tue,  4 Aug 2026 18:04:54 +0100
Message-Id: <20260804170503.3513916-12-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260804170503.3513916-1-mark.rutland@arm.com>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_100604_619099_AC8EA1EF 
X-CRM114-Status: GOOD (  10.72  )
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

Currently __sdei_asm_handler() avoids restoring x20 to x27, as these are
not be clobbered by existing code. This is correct today, but it makes
it awkward to rework __sdei_asm_handler(). Given the rarity of SDEI
events, restoring x20 to x27 should not have a measurable impact.

Restore x20 to x27 when returning from an SDEI event handler. This will
free up those GPRs for usage in __sdei_asm_handler() prior to return.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/kernel/entry.S | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index e0db14e9c843a..eadf4e74e72a8 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -1048,10 +1048,14 @@ SYM_CODE_START(__sdei_asm_handler)
 	bl	__sdei_handler
 
 	msr	sp_el0, x28
-	/* restore regs >x17 that we clobbered */
+	/* restore regs >x17 that firmware won't restore */
 	mov	x4, x19         // keep x4 for __sdei_asm_exit_trampoline
-	ldp	x28, x29, [x4, #SDEI_EVENT_INTREGS + 16 * 14]
 	ldp	x18, x19, [x4, #SDEI_EVENT_INTREGS + 16 * 9]
+	ldp	x20, x21, [x4, #SDEI_EVENT_INTREGS + 16 * 10]
+	ldp	x22, x23, [x4, #SDEI_EVENT_INTREGS + 16 * 11]
+	ldp	x24, x25, [x4, #SDEI_EVENT_INTREGS + 16 * 12]
+	ldp	x22, x27, [x4, #SDEI_EVENT_INTREGS + 16 * 13]
+	ldp	x28, x29, [x4, #SDEI_EVENT_INTREGS + 16 * 14]
 	ldp	lr, x1, [x4, #SDEI_EVENT_INTREGS + S_LR]
 	mov	sp, x1
 
-- 
2.30.2


