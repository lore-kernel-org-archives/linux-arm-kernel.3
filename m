Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCDDC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 22:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lw0BYcIVtbS/lcwkV5usTTnzZkltIczEemj2ZN+jhA4=; b=jyRBb6rvUfLQRkxaUuUoFgvYRc
	v5BtVS8urDZJqwg6Rxy8KHMxZhbslftsQD6P5xYZkLyeTfvpTZQTLx1r90TcYQ7if8oZ2+G2tyxYi
	Dv7I/58wSpzcCz2xr+Z0Jvly0e/J+B5or6ZsyZuOAkr+HbpNLYtlyo/0w9gnDWimHJZ2l+AuUchx1
	Ot4Xdz1ZjIgd8dbPr37L2MJlvggoxOHA8tnp0zMAktdkHWhaLBNCp3v8hyjuGr2kcyi07wRww0t13
	LL2HdfgNIHZIJHcYJywJYKEl9z8GCl5TDzMGGXTDwM/GFZvO30XehhM7brNVu7LN1XQSHuIBayliO
	lO5DUNCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctHb-0000000DWZd-0BJa;
	Fri, 18 Jul 2025 22:10:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctF7-0000000DWEj-31aI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 22:07:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E3918A5771A;
	Fri, 18 Jul 2025 22:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554CDC4CEEB;
	Fri, 18 Jul 2025 22:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752876468;
	bh=1CE6FSqwkeWvryzNivZ1ka0SgHoOi98KjNNJNBegE/Y=;
	h=From:To:Cc:Subject:Date:From;
	b=oJXjgCpIbic7ke/hk0PngNCG3uWEkILJVcf3B8OTheyN/vITGcfIDSj0j6uwd/w2l
	 DLz/SKzg7ImZa9o6BUT+8nkEG80zaHlefp70h6u2C8YyqjO2xCM5hn2+DlWFd0WyxB
	 dUSrTpB3cjJi7jZslFL6oDkl6CEMhYJWsHe8Hdd9Ntb0EguzT672XvJu8hLLDmWorD
	 DDxMFMJMtLKjXHHUThNUzbWTpMALLo/GUIXlEBEhPsNr4HxMA9ImT+L9Da+KS0dm3F
	 qA8/vh7HgEAQTyql2wZhOQsOxEMyoKMMKFY2shgz91if348VRs4YSXwl1zVLo87iFT
	 kWc2P8YpH0JFQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] lib/crypto: arm64/sha512-ce: Drop compatibility macros for older binutils
Date: Fri, 18 Jul 2025 15:07:06 -0700
Message-ID: <20250718220706.475240-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_150749_827270_68552784 
X-CRM114-Status: GOOD (  10.81  )
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

Now that the oldest supported binutils version is 2.30, the macros that
emit the SHA-512 instructions as '.inst' words are no longer needed.  So
drop them.  No change in the generated machine code.

Changed from the original patch by Ard Biesheuvel:
(https://lore.kernel.org/r/20250515142702.2592942-2-ardb+git@google.com):
 - Reduced scope to just SHA-512
 - Added comment that explains why "sha3" is used instead of "sha2"

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---

This patch is targeting libcrypto-next

 lib/crypto/arm64/sha512-ce-core.S | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/lib/crypto/arm64/sha512-ce-core.S b/lib/crypto/arm64/sha512-ce-core.S
index 7d870a435ea38..eaa485244af52 100644
--- a/lib/crypto/arm64/sha512-ce-core.S
+++ b/lib/crypto/arm64/sha512-ce-core.S
@@ -10,30 +10,17 @@
  */
 
 #include <linux/linkage.h>
 #include <asm/assembler.h>
 
-	.irp		b,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
-	.set		.Lq\b, \b
-	.set		.Lv\b\().2d, \b
-	.endr
-
-	.macro		sha512h, rd, rn, rm
-	.inst		0xce608000 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
-	.endm
-
-	.macro		sha512h2, rd, rn, rm
-	.inst		0xce608400 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
-	.endm
-
-	.macro		sha512su0, rd, rn
-	.inst		0xcec08000 | .L\rd | (.L\rn << 5)
-	.endm
-
-	.macro		sha512su1, rd, rn, rm
-	.inst		0xce608800 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
-	.endm
+	/*
+	 * While SHA-512 is part of the SHA-2 family of algorithms, the
+	 * corresponding arm64 instructions are actually part of the "sha3" CPU
+	 * feature.  (Except in binutils 2.30 through 2.42, which used "sha2".
+	 * But "sha3" implies "sha2", so "sha3" still works in those versions.)
+	 */
+	.arch		armv8-a+sha3
 
 	/*
 	 * The SHA-512 round constants
 	 */
 	.section	".rodata", "a"

base-commit: 66be847cc4c2e82fb50190b52b05b3bb0ef57999
-- 
2.50.1


