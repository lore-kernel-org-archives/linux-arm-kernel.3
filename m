Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501B2C982E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nBLQSKemxDIktlR563dkf+XaG9PZ7B4rjq2+jvC9t0=; b=GquuY3AMZN6WKd
	2avIXhNOVIwfQYznIUi8CL8FeulQZJnKTzrpDvIqz+FXpP9//azAjkor9sgIoabtP2ByGyLp81GXB
	f+Into3LyP537Vid0NckFtc5uefGZj7bm6RS8s1v9DiJs7rpoHLWOG9ZqgbagMKpRid+V768K18Lc
	uNKnJgYKK1/xvvclyB7C3hm04joBk88+d6N8gm8x8TLO9DeIFpwJzIRO1okoaetLNC0QQqaCBuR69
	8iUcIkSNUCPeuQnjRtEAt37OqAQ/LsHvGD4cmjd82f9w/iuuFbwq8hzYOmeM+9NA7lOWCW1KnLuHO
	B1uH2MQVHfkaMDT3Ohrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bF7-0000000EzPY-0Kws;
	Fri, 18 Sep 2026 16:15:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEv-0000000EzGO-1dOw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:15:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A590401C5;
	Fri, 18 Sep 2026 16:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD191F00898;
	Fri, 18 Sep 2026 16:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748105;
	bh=8nBLQSKemxDIktlR563dkf+XaG9PZ7B4rjq2+jvC9t0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z/ffdFAMxmWA9YF2dCYlP4WVx8iG4pj2rNzJqqF7scRBaWTu8PUGnJ/RLD+kbIzDc
	 50DJpkxeP1moeVXfp135B87JcBo0uHGmXQWF2XKtqE8eL4xHRuAWOVbcKcx9av58Tp
	 BEVVhahBxZNv3dbKArxMlqTDUaWgwgFsx1qAYCJoHIBcAhdFqSJUPei3Bk5cu2Cynt
	 alJs+g5kiqed+FY6dL0LmkdsqqhwtG5O6qSMjqTNuiA+ZxtKmLHwty7AP7ML5f6okU
	 B+RhZ1XlPlYxzQqYg1cGypFhkVKuSEc7L6aAFLu15Yc86AHTtCcghi5l/LDZL5e0fA
	 XfWAtM9QciATA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 14/21] arm64: sdei: Support SDEI events from kernel handler and thread modes
Date: Fri, 18 Sep 2026 17:13:58 +0100
Message-ID: <20260918161407.2300-15-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Section 5.2.2 ("Event resume context") of the SDEI specification states
that, as a result of an SDEI_EVENT_COMPLETE_AND_RESUME call:

 | SPSR_ELc is set to the PSTATE when the event was taken

In preparation for making use of both thread and handler modes in the
kernel, adjust the SDEI event handler so that we return to the correct
kernel vector for the interrupted mode.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/sdei.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
index 778f2a1faac8..6337ce905593 100644
--- a/arch/arm64/kernel/sdei.c
+++ b/arch/arm64/kernel/sdei.c
@@ -208,7 +208,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 	int i, err = 0;
 	int clobbered_registers = 4;
 	u64 elr = read_sysreg(elr_el1);
-	u32 kernel_mode = read_sysreg(CurrentEL) | 1;	/* +SPSel */
+	u32 kernel_mode = read_sysreg(CurrentEL);
 	unsigned long vbar = read_sysreg(vbar_el1);
 
 	if (arm64_kernel_unmapped_at_el0())
@@ -233,7 +233,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 		pr_warn("unsafe: exception during handler\n");
 	}
 
-	mode = regs->pstate & (PSR_MODE32_BIT | PSR_MODE_MASK);
+	mode = regs->pstate & (PSR_MODE32_BIT | PSR_MODE_MASK) & ~PSR_MODE_h_BIT;
 
 	/*
 	 * If we interrupted the kernel with interrupts masked, we always go
@@ -251,7 +251,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 	 * address'.
 	 */
 	if (mode == kernel_mode)
-		return vbar + 0x280;
+		return vbar + (regs->pstate & PSR_MODE_h_BIT ? 0x280 : 0x80);
 	else if (mode & PSR_MODE32_BIT)
 		return vbar + 0x680;
 
-- 
2.55.0.1082.g2b9226bbc0-goog


