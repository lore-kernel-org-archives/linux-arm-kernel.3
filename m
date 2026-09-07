Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34B0C79FA9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lMcv+fJIFUpeFRCmf9ya4J/neAxp4gqF2gal+tnA2+s=; b=lf/ivve+wZl3Op
	A57iLoSNczUXseEUeDTT5znAblHXglFSXvwNef8e//NiWHzLOLst5OZ77KCIw/2SbC+t4Z04VOVz9
	fGZHJMF4qJuvhXviXLcqaPpiFW91sTuMeopXAIxI5CXFxeiQFTPD3g6mfpE8czjRfolzJEUW443Bo
	tULVN6ai7eCJM9wxzKWjaogBAmKAUqQsITkMzz4zR/N2ljONeCI2GYSQxAWLjeeGqSs7cseqi8fZb
	xbNmUF60imrfCFd9gdARUG/3l6fnXJ2ITjb+6fHI40eta95xeYweXgKZBvTeHXOBpXiQPOgR8dKy0
	xp5CyGmHUcCMt0LzpWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cR3-00000007Mus-1vnR;
	Mon, 07 Sep 2026 16:43:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cR2-00000007Mtz-01gs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59BDA601DE;
	Mon,  7 Sep 2026 16:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE131F00A3A;
	Mon,  7 Sep 2026 16:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799387;
	bh=lMcv+fJIFUpeFRCmf9ya4J/neAxp4gqF2gal+tnA2+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cr7pWeK6EldNr1h/xUgngyA4ZLJ0dgvByNM6MeAoptHgqtSNTGn291nm6gxD7VRXg
	 M+jZxwgy4hu2Cyk1NOmEKWjcKJHdSBJ2YlP+H1eBCz78ruzLy2/8XIbRc6kGTBRpqw
	 LC2K8CyxlDoQYI/j+ULq7KdTDdKep4tSElijKtOQQzNAIqNpY1pg4A2qJ+n3uVW3yf
	 n/yXMGHOAJkMycYxkwGOGoysHB1zhQUfpomZiVAY2DKQT10cMLFoECo8ZDp0Ozque9
	 9mBnlbtRwC27zWvUlGOwPi5Fp0YAP/rNYk5Kye8CFPEUqlrW4wLeZy85Tgp0HYHMN1
	 wnaRaZVmL657Q==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 02/21] arm64: entry: Only check for stack overflow on exceptions from EL1
Date: Mon,  7 Sep 2026 17:42:27 +0100
Message-ID: <20260907164247.17223-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
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

Checking for kernel stack overflow on entry from EL0 is largely
pointless and gets in the way of using SPSel to switch to the overflow
stack. If the kernel stack overflows on entry from userspace, that
implies that it was unbalanced on the last exception return which means
we can't sensibly reason about the state of the system given that we
could've returned to an arbitrary virtual address in an arbitrary mode.

Remove the stack overflow check from the EL0 exception entry path.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/entry.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 59f045e496ec..b5d8277f608a 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -54,6 +54,8 @@
 	.endif
 
 	sub	sp, sp, #PT_REGS_SIZE
+
+	.if	\el == 1
 	/*
 	 * Test whether the SP has overflowed, without corrupting a GPR.
 	 * Task and IRQ stacks are aligned so that SP & (1 << THREAD_SHIFT)
@@ -64,8 +66,11 @@
 	tbnz	x0, #THREAD_SHIFT, 0f
 	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
 	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
+	.endif
+
 	b	el\el\ht\()_\regsize\()_\label
 
+	.if	\el == 1
 0:
 	/*
 	 * Either we've just detected an overflow, or we've taken an exception
@@ -96,6 +101,7 @@
 	sub	sp, sp, x0
 	mrs	x0, tpidrro_el0
 	b	el\el\ht\()_\regsize\()_\label
+	.endif
 .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
 	.endm
 
-- 
2.55.0.979.g7e5102b832-goog


