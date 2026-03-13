Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A4F105F78C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 12:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7WQCu0rUeOFzyIbOJ6I94X5cQIu6gaHB+E8ZleiPx50=; b=bjpFV7p6x3i0wQAPGReHN9toud
	tq5Im3MJiTat+NwTzFDTHAFJ1BuUN9ucDDMmH8tcqrOUK4epSWNgHPe/UXLc5BfrBQ2kY2wR+OIpO
	mQ/CXUyxd7QvR2JDodExtZBQY7Sczx3rVwq63C8YyJvIxeRAjdcusAjtc+LOAL/cZaOMSzrErwo16
	cOb2s5gtAtHPKWq/9G4Ds4Sg9EpEUJdPtAjW0mUzmtKWBDH7LdXawceRew40u/gDBTEAWl99jtMKn
	PRXHF5Ic8tUx1hqbXEp6RxTtkMfcbZGoZLdBa5hqjwvLo2H3cGBFSzJaswHbHQzpqQ6MWkNVyyQ7d
	pGuUVwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11gq-000000007uQ-2Tlm;
	Fri, 13 Mar 2026 12:32:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11go-000000007tw-4B69
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 12:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BAE260132;
	Fri, 13 Mar 2026 12:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC529C19421;
	Fri, 13 Mar 2026 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773405146;
	bh=WUNJvT/z6UUIXknAszOlG8gIUujbZdQCTpct4zEEDko=;
	h=From:To:Cc:Subject:Date:From;
	b=qfhNbFPcaFLwP7FFfupCm5mHersfLqJ1SQ09Q3jv7qH+pCV81B259bhbNFezkbgGo
	 4vIACVWaQFBo4f04UflwxT7r2sBqP31z40YP4rJBiHvJtk34jkWJdDIWylcwAmmO80
	 Ty0fTIcBCqcpfvrd9XsqykEkpAh6QMFAQ1UNP7Mt1upHEsyyXYvoZWIATYw0d30oG8
	 ih/VwqiVskYMRtrV5DjMWzVJPNb2kxh8jHeXwJgWFlJErSvGhoDZdbB+DRFfHlgT+l
	 ti98NY8LOtYZV++1luTPDoyl+t9E/4aVG3ofCgf/I2uVfckMMQ+Wf0LjXi1z+/uCj7
	 TrlIhLokdy5hw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH] arm64: scs: Remove redundant save/restore of SCS SP on entry to/from EL0
Date: Fri, 13 Mar 2026 12:32:19 +0000
Message-ID: <20260313123220.29878-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When returning to userspace, the SCS is empty and so the SCS SP just
points to the base address of the SCS page.

Rather than saving and restoring this address in the current task, we
can simply restore the SCS SP to point at the base of the stack on entry
to EL1 from EL0.

Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/scs.h | 8 ++++++++
 arch/arm64/kernel/entry.S    | 4 +---
 2 files changed, 9 insertions(+), 3 deletions(-)

I just spotted this by inspection when I was hacking on our exception
entry code.

diff --git a/arch/arm64/include/asm/scs.h b/arch/arm64/include/asm/scs.h
index 0fbc2e7867d3..a15a2968e7b6 100644
--- a/arch/arm64/include/asm/scs.h
+++ b/arch/arm64/include/asm/scs.h
@@ -10,6 +10,11 @@
 #ifdef CONFIG_SHADOW_CALL_STACK
 	scs_sp	.req	x18
 
+	.macro scs_load_current_base
+	get_current_task scs_sp
+	ldr	scs_sp, [scs_sp, #TSK_TI_SCS_BASE]
+	.endm
+
 	.macro scs_load_current
 	get_current_task scs_sp
 	ldr	scs_sp, [scs_sp, #TSK_TI_SCS_SP]
@@ -19,6 +24,9 @@
 	str	scs_sp, [\tsk, #TSK_TI_SCS_SP]
 	.endm
 #else
+	.macro scs_load_current_base
+	.endm
+
 	.macro scs_load_current
 	.endm
 
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index f8018b5c1f9a..ab476ba060d1 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -273,7 +273,7 @@ alternative_if ARM64_HAS_ADDRESS_AUTH
 alternative_else_nop_endif
 1:
 
-	scs_load_current
+	scs_load_current_base
 	.else
 	add	x21, sp, #PT_REGS_SIZE
 	get_current_task tsk
@@ -378,8 +378,6 @@ alternative_if ARM64_WORKAROUND_845719
 alternative_else_nop_endif
 #endif
 3:
-	scs_save tsk
-
 	/* Ignore asynchronous tag check faults in the uaccess routines */
 	ldr	x0, [tsk, THREAD_SCTLR_USER]
 	clear_mte_async_tcf x0
-- 
2.53.0.851.ga537e3e6e9-goog


