Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF548CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 17:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Date:Message-ID:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SkQ7J4HiIfhy5GjsiFNBhrW02z8RN1b9lERk9Mw2U7k=; b=nFmhLyAjvYNdx36bSmFBAyjf8C
	IzlsOH0hjxcL5r6HIHsfvdfVvT0kECCHhvDIqcAF/U9bO0seXpd+enIbhBEc/TKKUMAmbLcDXrjae
	gPsR2cisixXNdUajwg181D+T8OiZRmf0krgO2FFzLI9lJCV+cLZ5RV9O8Wy5HSpj9S7YBUny8/0O2
	pb744LQwnYoRiS/461WtAwGCnx2ubsY6ug1Mj0AYPyVew1kaPeYRRrxC0hMnD1sUvuPqUwSF07GNd
	p2cfpsGNP2ufphLpKQLuVtwexijtrDZaKyjUAw5zrUQyk5++v29Slmr2sp8ZoKTEFbdWed4eQwc20
	KxlGvCdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVi5-00000002ovr-2l69;
	Wed, 07 Oct 2026 17:45:45 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVi3-00000002ovW-00EO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 17:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Subject:Date:Message-ID:To:From; t=1791395136; bh=SkQ7J4HiIfhy5GjsiFNBhrW
	02z8RN1b9lERk9Mw2U7k=; b=kWFdxRr9VSO3G2dy8wPeBCVWP7MbuBCH549r5/0KHTwr2XBKb5
	rk6b/t1XVuSVnG5mqIAFGvEZXD3BFGK903ducAW5aq3HbIeH7asK11E+SskL8OzOOsx/Gk8TZLs
	5QnJylE501BpHi/K81vx0+wsLZhazq5KRoP84gzk8YEH2f1NFb7ffPZv/Fm5KAorWmHnwsub5K0
	weyFI4cH2EoCaXj2+DFcubOdDPaGffIJDnOdvGmpWq1oEILeu8GFbiwbfbVkMvutBO1RBnJKjkJ
	tbxphcolfOO+Ef9yXvhHaJo6FuEdwttim7e1k0b6e0Fcs9HQYf3TVXE6xNmKJBtvzBA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Subject:Date:Message-ID:To:From; t=1791395136; bh=SkQ7J4HiIfhy5GjsiFNBhrW
	02z8RN1b9lERk9Mw2U7k=; b=USJ5AV2n589YtAUYrSVhS8CziHjElDlwgCxLplG8cOEF8hYQoQ
	j/vSimlDpu+jvJpIcr2ljIyyq+KKlzfeb6Ag==;
From: Bradley Morgan <brads@mainlining.org>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, brads@mainlining.org
Message-ID: <20261007175231.1.mte-tmp2@mainlining.org>
Date: Wed, 7 Oct 2026 17:45:01 +0000
Subject: [PATCH] arm64: entry: drop the unused tmp2 argument of
 mte_set_kernel_gcr()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_104543_312428_63B55227 
X-CRM114-Status: UNSURE (   9.27  )
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

mte_set_kernel_gcr() takes a tmp2 argument the macro never uses. It
used to, the body passed \tmp and \tmp2 to mte_set_gcr, then
commit 82868247897b ("arm64: kasan: mte: use a constant kernel
GCR_EL1 value") swapped that for

    mov     \tmp, KERNEL_GCR_EL1

and tmp2 stayed in the declaration and in the one caller, which
passes x23 for it.

Drop it, both places.

Signed-off-by: Bradley Morgan <brads@mainlining.org>

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 0e1d9c3c6a93..2baefe7a82d3 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -171,7 +171,7 @@
 #endif
 	.endm

-	.macro mte_set_kernel_gcr, tmp, tmp2
+	.macro mte_set_kernel_gcr, tmp
 #ifdef CONFIG_KASAN_HW_TAGS
 alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
 	b	1f
@@ -258,7 +258,7 @@

 	apply_ssbd 1, x22, x23

-	mte_set_kernel_gcr x22, x23
+	mte_set_kernel_gcr x22

 	/*
 	 * Any non-self-synchronizing system register updates required for
---
 arch/arm64/kernel/entry.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index f63049ac32dc..c3106dee61e1 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -171,7 +171,7 @@ alternative_else_nop_endif
 #endif
 	.endm
 
-	.macro mte_set_kernel_gcr, tmp, tmp2
+	.macro mte_set_kernel_gcr, tmp
 #ifdef CONFIG_KASAN_HW_TAGS
 alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
 	b	1f
@@ -258,7 +258,7 @@ alternative_else_nop_endif
 
 	apply_ssbd 1, x22, x23
 
-	mte_set_kernel_gcr x22, x23
+	mte_set_kernel_gcr x22
 
 	/*
 	 * Any non-self-synchronizing system register updates required for
-- 
2.53.0

