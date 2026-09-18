Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007E2C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5WKKe+LbffkRYv2t0YaLabQ2JHUtS1RbnFSIgfXllw=; b=TK1KlClyeSEE1q
	uXvCgIikq4Pvwy6DDkEW8bOQtUmclp6/dP7WGY4e8grOMgRtwUZ5NdTNaTcvQlsOGXcVttJz3QYTn
	6UrjtrjntKsmt39KuTHoUEJ7uaxw9/92G52CsZDv2rW48ML+g6pVDSiSgffsvIRnAXBcivmnFLz8D
	80uKYSRv3k8o0RLuSRBavkWaR9ImKwq66PoTITtTBeyrn/2C60+ZeZ0TiJwmSfvYqD+LCUxLkEyTj
	pzggE9pfN0n++85JJgGwJQAKKWK7ksBAV/25Xxs1h/T5TQA58q5KRRDawE3xjYK0r1goZ2QHs9I4f
	VoYog3Em0LchWN9Opqyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEK-0000000EyrV-32e1;
	Fri, 18 Sep 2026 16:14:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEF-0000000Eyq1-2sKw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:14:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F36CA43EF9;
	Fri, 18 Sep 2026 16:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA0B1F000FF;
	Fri, 18 Sep 2026 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748062;
	bh=i5WKKe+LbffkRYv2t0YaLabQ2JHUtS1RbnFSIgfXllw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iO+7mL8MmOAWCnP2p3vRnFMM5ydmWe2icNPmTsVcjHbvOU4rLqVzrXS1I1k9+MNA/
	 stDBU1VLeerXsSEA79KxaRJfyuseqKhc/45qU5CE8iArvQfC1cex21xq4Ln+N7GlkO
	 AI+9Du1UY0pbV2grKzZGatPldtNLu9TRu2KXF9Oy5rp6aobHqB+OeDZW+0JPi7yp7R
	 CWpM7VuSdumgLkcopP9B4/1sMj3oKRkahBkCJCb1REtr5b5FW40SjT8wUAlXCwFNrf
	 hYh04brISd5qnnXlIVIOC2dohJl4KOUP0BFyvi00G5LYlpq/6vqN2VXUPQ3Lm2V2gd
	 Hh8dZa1uEyOrA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 02/21] arm64: entry: Only check for stack overflow on exceptions from EL1
Date: Fri, 18 Sep 2026 17:13:46 +0100
Message-ID: <20260918161407.2300-3-will@kernel.org>
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
2.55.0.1082.g2b9226bbc0-goog


