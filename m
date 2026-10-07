Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7F3CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 18:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Date:Message-ID:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3jAENaBzyuwOwECaqvThTmnS/3VZ/IJOgHT6IsIY+E8=; b=ukI3d/HbDKvSMx4p1EYi4tObT4
	mKhLuGSfeXVhFvdE9VSuD+A+duqKMMInvpeISfCPYIKx8O5NiD+xIBBcUbxGednfhHb06hj09NIyj
	1zPgaztkzYZFk3MIbby4yfzjmUCoWGqe9WVP7NItU3KQN1qO+tqvL4b4L3K641py5fIHWdH+bRB/s
	pOFJgGLcJRbEYRpkAO6Y4uPYJ0iuHBRCI8QVxl81w1RkwuOAdj+MAbnkQEy+GF0e/Or5YtKt4jzg1
	JVHbA4cPgE/vjW3GtJPoYbPZG4kTx53ymJ/iIsypL8Rc3JlWgczwZcqnLUfuywjA0tHN7fT38Nxec
	T8WAsPYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVvz-00000002vau-4B0u;
	Wed, 07 Oct 2026 18:00:08 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVvx-00000002vaY-1tIW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 18:00:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Subject:Date:Message-ID:To:From; t=1791395994; bh=3jAENaBzyuwOwECaqvThTmn
	S/3VZ/IJOgHT6IsIY+E8=; b=T3Fcw7NJwKaAZr787tBc9HeDvTzo1v0pMd5h+UousMWy14qCfy
	VZo6ujBjwmur+lziGekbHEHcbjWPh23Z2KaPggEpAVHDLvfkrEJnKm0KsSuGubGTxwhKPDFeI/g
	/IP+sr5j3rJVeU6JNHWJZ3r6Bcl945szgNxUZeJ2K/GabiVakmlCahoc0BrwJQfoyBflU9yJMHN
	+bus2qPDioAFEmuHRTzRLPxE02KGmZwltg5k7h5bGRrLM48ugy3C9JebfMyofH3CYw/1+Nzv1Y6
	U0QOyYXtXkFqqWQBbHEXZz4cwVWHhzpwSE5UcYzmf70Hof1BuUTPCT/GwmSLS894Xbg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Subject:Date:Message-ID:To:From; t=1791395994; bh=3jAENaBzyuwOwECaqvThTmn
	S/3VZ/IJOgHT6IsIY+E8=; b=L0xrpi/0DxjUzLAoyfzqiuuqpBNzka2EZ/JYBGyxu9bD+jFvH8
	YnTMPianKzaRk1fY6q2MlrnNHkYjRT4LzFCQ==;
From: Bradley Morgan <brads@mainlining.org>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, brads@mainlining.org
Message-ID: <20261007185512.2.mte-tmp2@mainlining.org>
Date: Wed, 7 Oct 2026 17:45:01 +0000
Subject: [PATCH RESEND] arm64: entry: drop the unused tmp2 argument of
 mte_set_kernel_gcr()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_110005_642290_EF120A78 
X-CRM114-Status: UNSURE (   8.91  )
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
---
Resending, the first send's body got mangled.

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

