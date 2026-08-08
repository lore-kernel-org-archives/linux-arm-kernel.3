Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41849C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 23:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9b4Bn/jCc6njmblrCdb5kz0LDKIkI3N8b9vqXSBZ44=; b=aRb+jtlVDo2FvkTYzEuESGWV3v
	EToE+XVYFJeubqrvZJoRtgteWSkBIfka2/+10bD8+nGYWbIDr9+MNZSeY5fZwYw77Jy3qZuvcbvA6
	sLWeZEXSUGaDQX7dq5KgpEoCauLxI+ibf8x+y9kR2xSnBZkXGi1iIzLPMkyeZCFp7PoItNspijYpz
	9Wd0/kDMw6nI3W8JMxR2FHarl+V32LyB1XRQCHK7+t4l0cI3b1sWHVSspYG0eY7dP3893lKuRRr98
	m1hqDE2u6Coi4BGwjaVrdrSffj+t6UlBqYcvqdOuhuP4CKsE079fwjYqQGNCAV0XO5U4gxIac4kXg
	fy19H4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJD-00000009m6R-2Eal;
	Sat, 08 Aug 2026 23:18:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJC-00000009m5o-0u4a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 23:18:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B5087415D8;
	Sat,  8 Aug 2026 23:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6931F00A3A;
	Sat,  8 Aug 2026 23:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786231109;
	bh=W9b4Bn/jCc6njmblrCdb5kz0LDKIkI3N8b9vqXSBZ44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TLnA1aXrDS1TAiKjspJeJ5UQ5kn2WXj2kjANeHma49+w4uagHC80MPMREog7bgEX6
	 5iOreJWSQX5FW++X656Vqxgv4LbLKxBNr1ck+QNclsIZGefnx/2jXSbz74ftM/ZbUK
	 WheyLyhpCPewVpA/mD60T1QtJfFSTvjBSFLvxBICEDejXHBXP7Dd7NxEurf1wUjvDX
	 nt3tnpc5lBgAFrPAUxMlR3CpEdNbQriINpeJW2a9j2cOsa0SAkCYxWH4x85GGXGVS0
	 Emz1G7XBnbhseVEd7iATvLEjFhPcqvT45pvvOr+c9eIec8ZXGZkXSy11/OCAvMH0uR
	 pQZ1QKNNOM+NA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v4 04/22] arm64: Fix EFI linking with -fdata-sections
Date: Sat,  8 Aug 2026 16:17:08 -0700
Message-ID: <7b18edbeb7bb68f3a69b8b0bb7ede12d834ad1d9.1786230311.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1786230311.git.jpoimboe@kernel.org>
References: <cover.1786230311.git.jpoimboe@kernel.org>
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

When building with -fdata-sections, the .init.bss section gets split up
into a bunch of .init.bss.<var> sections.  Make sure they get linked
into .init.data.

Acked-by: Song Liu <song@kernel.org>
Reviewed-by: Miroslav Benes <mbenes@suse.cz>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index af1d720209764..91b700e20badf 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -281,7 +281,7 @@ SECTIONS
 		INIT_CALLS
 		CON_INITCALL
 		INIT_RAM_FS
-		*(.init.altinstructions .init.bss)	/* from the EFI stub */
+		*(.init.altinstructions .init.bss .init.bss.*)	/* from the EFI stub */
 	}
 	.exit.data : {
 		EXIT_DATA
-- 
2.54.0


