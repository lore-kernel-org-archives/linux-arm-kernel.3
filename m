Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3450C55170
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wsuOqKHaGTxzUJL+snlGIrtVveZ044LYCe43ttPNR0w=; b=zqtQXOGgXtz2wJVfVF01HMNTgd
	6E90d6JJC9uk9BWIglLmFzaF36mRNHwj3wE5nlaqVvnVcVcmfyVZyH2emk2IbcKJaxQUOrhHXkVUQ
	ccB+59iXPRnYzgvOTTS53mZ7ilqvjaDmGnGHpfhaWTrbaXn5wG773602z8/Sp4N9w4w+P5Ck5wIn/
	dxD0yPEBNgJdhIOcNpouUZMkUVKjw4qI+xFkADlAyE27J3AEYS8dJcag2ku3fszuCPZQ96MOuZ9qW
	S4jb+96ABheu46u9SYi1n7d4F8MoS59V23McPO8Pl1vvAPQI5gfSNYFX0rnr2Id5UqogQWC4IT3aA
	kBDiIfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMqi-0000000DWdA-2kka;
	Fri, 20 Feb 2026 09:31:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMqg-0000000DWbp-1eKH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 09:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CC3E416F8;
	Fri, 20 Feb 2026 09:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF15C116C6;
	Fri, 20 Feb 2026 09:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771579858;
	bh=i00VR8nbHSXfhHwpQuIQM4507Dk7wI0kfWldmcAEpOU=;
	h=From:To:Cc:Subject:Date:From;
	b=geSzuBlCPT/bOCa9ai8Siyml1FmhBIDD++0G8mCFj3k20ulcSqBDtgqWnGWwiijlC
	 TUbx61yQ2KAXmu/40Evlkkef8Mjl9gpsx7iG30nVC3/OV5hVcx5WUCVnJD0uZYpKw5
	 jta/qkmmJqxH6u2s8QRM7oBsFMuSIq4t9sb7E8FopUNE7Z0hTHIM1/nHk09IBr9OH7
	 3rs5t9axvQr6uZyE0Jcsz2IasVwmqHgslx8TGy7vD6fEUdR1EX4+0UIYL+4/TisoRW
	 RQHPr7sGKyY4djZjSuWInKYaz4rfew8cZhLJL5YB+1LabG60sG3n0QGql9v7jGeBcj
	 0UXwbbOxmZI7Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: remove ARCH_INLINE_*
Date: Fri, 20 Feb 2026 17:12:28 +0800
Message-ID: <20260220091228.1545-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_013058_475077_CE487EB4 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
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

Since commit 7dadeaa6e851 ("sched: Further restrict the preemption
modes"), arm64 only has two preemption models: full and lazy. Both
implies PREEMPTION, so !PREEMPTION is always false for arm64, it's
time to remove ARCH_INLINE_*.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/Kconfig | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..3d90f2d35a99 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -61,32 +61,6 @@ config ARM64
 	select ARCH_HAVE_ELF_PROT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_HAVE_TRACE_MMIO_ACCESS
-	select ARCH_INLINE_READ_LOCK if !PREEMPTION
-	select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
-	select ARCH_INLINE_READ_LOCK_IRQ if !PREEMPTION
-	select ARCH_INLINE_READ_LOCK_IRQSAVE if !PREEMPTION
-	select ARCH_INLINE_READ_UNLOCK if !PREEMPTION
-	select ARCH_INLINE_READ_UNLOCK_BH if !PREEMPTION
-	select ARCH_INLINE_READ_UNLOCK_IRQ if !PREEMPTION
-	select ARCH_INLINE_READ_UNLOCK_IRQRESTORE if !PREEMPTION
-	select ARCH_INLINE_WRITE_LOCK if !PREEMPTION
-	select ARCH_INLINE_WRITE_LOCK_BH if !PREEMPTION
-	select ARCH_INLINE_WRITE_LOCK_IRQ if !PREEMPTION
-	select ARCH_INLINE_WRITE_LOCK_IRQSAVE if !PREEMPTION
-	select ARCH_INLINE_WRITE_UNLOCK if !PREEMPTION
-	select ARCH_INLINE_WRITE_UNLOCK_BH if !PREEMPTION
-	select ARCH_INLINE_WRITE_UNLOCK_IRQ if !PREEMPTION
-	select ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE if !PREEMPTION
-	select ARCH_INLINE_SPIN_TRYLOCK if !PREEMPTION
-	select ARCH_INLINE_SPIN_TRYLOCK_BH if !PREEMPTION
-	select ARCH_INLINE_SPIN_LOCK if !PREEMPTION
-	select ARCH_INLINE_SPIN_LOCK_BH if !PREEMPTION
-	select ARCH_INLINE_SPIN_LOCK_IRQ if !PREEMPTION
-	select ARCH_INLINE_SPIN_LOCK_IRQSAVE if !PREEMPTION
-	select ARCH_INLINE_SPIN_UNLOCK if !PREEMPTION
-	select ARCH_INLINE_SPIN_UNLOCK_BH if !PREEMPTION
-	select ARCH_INLINE_SPIN_UNLOCK_IRQ if !PREEMPTION
-	select ARCH_INLINE_SPIN_UNLOCK_IRQRESTORE if !PREEMPTION
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 	select ARCH_USE_CMPXCHG_LOCKREF
-- 
2.51.0


