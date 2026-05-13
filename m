Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B947CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SeUdOrR4OtdVBrkSmJmrBp1YGFSNi466XwEf/8cRfo=; b=IneSHpWBYf2gwcIjo3fY8kxxby
	B7fblSV2ZJFd1vNE9KAQJYK4RacAFAwh1M1TbzOUu+S//2ehqHL4B8Ozar39lImtpcMOR1pD0Sfza
	0zc0mxQvFT16a5nASscyMX0b7zoUqT58peVIXgMJ6Z9kxUrq1qSR9mAGdeLNbDv+gscPdnyju/kzq
	ytIue/SQ6oe+3Gpbsc0ImrfzZL2IVekZWuoxXP6DAOa8Q3+RSjjM4jnY32hK9wy0v2+lYDlly800S
	PLSPuQxHb97dzLmZ9PLq76hit5HeUwiKaJHlvXib9tjT1wFSjYFn2+i4xcW42A20Ift0W3SCMfTQO
	xHLJ+Jtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mr-000000013lT-0pU0;
	Wed, 13 May 2026 03:34:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Ml-000000013fr-1mLO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DBB1060580;
	Wed, 13 May 2026 03:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AA1C2BCC9;
	Wed, 13 May 2026 03:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643274;
	bh=l/Ci/bQZJNfrCn5KEXNZpm9m+7qL/TrCFKOnkDayqLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tvWWrvr3vNY1RHGCbwUIoeM7vpXEUIjvC/y+t1fFTd8vCbl4oLyTY+QbRiDylioNy
	 M8USGIkz/qOjDOS3rjVBs1VtEu/G5+9XhEJRROe6yxEKZRqyoj/y38yB0ExGNCeOTW
	 zlmqrMoprmqD7jT0ORFHmGirMPzAJv0z+XSbRniG8XA3QnUxdW7XLHamkQ5aGj2ORr
	 zIRxT919KRnpwccWrx8C/uH7+7lWHwhEl78BRPDIdVBA3iaLcuNSmZCplg9Ds2zaR2
	 iwzNfgVnk51VZH0eXCSDGISTVeeaXyk0HQzpQ2Kl+Suw7mcDL6ETogyMOWtr70jhVn
	 sSh5OP/xYmOAA==
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
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v3 07/21] crypto: arm64: Move data to .rodata
Date: Tue, 12 May 2026 20:33:41 -0700
Message-ID: <3757f0bdb8117c875c2085dc42b6becd28b4285b.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
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

Data embedded in .text pollutes i-cache and confuses objtool and other
tools that try to disassemble it.  Move it to .rodata.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 lib/crypto/arm64/sha2-armv8.pl | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/lib/crypto/arm64/sha2-armv8.pl b/lib/crypto/arm64/sha2-armv8.pl
index 35ec9ae99fe16..e0ee2d5367e72 100644
--- a/lib/crypto/arm64/sha2-armv8.pl
+++ b/lib/crypto/arm64/sha2-armv8.pl
@@ -207,12 +207,13 @@ $func:
 ___
 $code.=<<___	if ($SZ==4);
 #ifndef	__KERNEL__
+	adrp	x17,.LOPENSSL_armcap_P
+	add	x17,x17,:lo12:.LOPENSSL_armcap_P
 # ifdef	__ILP32__
-	ldrsw	x16,.LOPENSSL_armcap_P
+	ldrsw	x16,[x17]
 # else
-	ldr	x16,.LOPENSSL_armcap_P
+	ldr	x16,[x17]
 # endif
-	adr	x17,.LOPENSSL_armcap_P
 	add	x16,x16,x17
 	ldr	w16,[x16]
 	tst	w16,#ARMV8_SHA256
@@ -237,7 +238,8 @@ $code.=<<___;
 	ldp	$E,$F,[$ctx,#4*$SZ]
 	add	$num,$inp,$num,lsl#`log(16*$SZ)/log(2)`	// end of input
 	ldp	$G,$H,[$ctx,#6*$SZ]
-	adr	$Ktbl,.LK$BITS
+	adrp	$Ktbl,.LK$BITS
+	add	$Ktbl,$Ktbl,:lo12:.LK$BITS
 	stp	$ctx,$num,[x29,#96]
 
 .Loop:
@@ -286,6 +288,7 @@ $code.=<<___;
 	ret
 .size	$func,.-$func
 
+.pushsection .rodata
 .align	6
 .type	.LK$BITS,%object
 .LK$BITS:
@@ -365,6 +368,7 @@ $code.=<<___;
 #endif
 .asciz	"SHA$BITS block transform for ARMv8, CRYPTOGAMS by <appro\@openssl.org>"
 .align	2
+.popsection
 ___
 
 if ($SZ==4) {
@@ -385,7 +389,8 @@ sha256_block_armv8:
 	add		x29,sp,#0
 
 	ld1.32		{$ABCD,$EFGH},[$ctx]
-	adr		$Ktbl,.LK256
+	adrp		$Ktbl,.LK256
+	add		$Ktbl,$Ktbl,:lo12:.LK256
 
 .Loop_hw:
 	ld1		{@MSG[0]-@MSG[3]},[$inp],#64
@@ -648,7 +653,8 @@ sha256_block_neon:
 	mov	x29, sp
 	sub	sp,sp,#16*4
 
-	adr	$Ktbl,.LK256
+	adrp	$Ktbl,.LK256
+	add	$Ktbl,$Ktbl,:lo12:.LK256
 	add	$num,$inp,$num,lsl#6	// len to point at the end of inp
 
 	ld1.8	{@X[0]},[$inp], #16
-- 
2.53.0


