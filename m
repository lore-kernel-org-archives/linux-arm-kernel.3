Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4975BC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 20:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoifR3L0F6KCwbKGtz/D0/P7CUUwCCQ0xZh+WHZ6kgI=; b=teNAv8PxnHyuJ/El9jy42OUiQL
	stPwsqQ33l06ROYLT1xhaQqcJ1Jm9s6Rcy0tTdaXujRITvoD/9QNFLR6PT5egwk5JkCkIz36NMota
	nUN6ixL7AW0SJyvZtjsGBVFCJklaHDLvQFFRZZodZHKCYiiV/fLvMd4dlLh9ck2gAbtR7BAXmG+Gm
	pEzH6O3MhYUq4bhnN99IxdFg7U1KbYPP9A9RQRlxaKI7ShhdkhFCxOIAX3g77LUCMToDwIxpRB862
	5nIbP7SrYELMi0DzsA/COj21fvpkVHGKoAEw0IaWZD/zOnj5ShF4a6Qu2MhZ8HaMVBzhwT4zyLHuL
	2kLIuweg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLpM-0000000ECdO-0IW4;
	Thu, 19 Jun 2025 20:25:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKpu-0000000E56k-2kwp;
	Thu, 19 Jun 2025 19:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E89B0A54758;
	Thu, 19 Jun 2025 19:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69858C4CEED;
	Thu, 19 Jun 2025 19:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360929;
	bh=kUVhngdCHpSMNtk0i1v0SVNnjxwdD/3jWEooeOamq10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t+9eGIBC2JDa5DBQqAnw528r9ACWVj+Qr17A54ciB4TVHa1eLZ+Cw/tv4tJe3qmmu
	 CWLfxIkUEzwdqVlNIiGwx5Bzb+kZ1SMWxgAgqqYfslDii+7pCSH2VfWxr2ABGHVZjL
	 9NEvxT+rF0Mq1lA/MD4+yRkBdaYERMN5l5JlW4/bbiyiLfYF0lg/9VIM1f6jZ23kZb
	 BSUZGerbrfDxB8isVNt5CoRE7prpNbtHPX2VquHxJSou2QE3ZgjbzVzIOHMsIyQsY3
	 cTZiTne87ZdJEDTIPCgGIdHOXjYtICNzsMQSHbLOzkBUNHtR6AczWJzS8dJRbfIQ9c
	 TBRr1sB+g/jow==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 7/9] lib/crypto: sparc: move arch/sparc/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:06 -0700
Message-ID: <20250619191908.134235-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
References: <20250619191908.134235-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_122210_841458_E9D2DBCA 
X-CRM114-Status: GOOD (  13.24  )
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

From: Eric Biggers <ebiggers@google.com>

Move the contents of arch/sparc/lib/crypto/ into lib/crypto/sparc/.

The new code organization makes a lot more sense for how this code
actually works and is developed.  In particular, it makes it possible to
build each algorithm as a single module, with better inlining and dead
code elimination.  For a more detailed explanation, see the patchset
which did this for the CRC library code:
https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
Also see the patchset which did this for SHA-512:
https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/

This is just a preparatory commit, which does the move to get the files
into their new location but keeps them building the same way as before.
Later commits will make the actual improvements to the way the
arch-optimized code is integrated for each algorithm.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/sparc/lib/Makefile                                  | 1 -
 lib/crypto/Kconfig                                       | 2 +-
 lib/crypto/Makefile                                      | 1 +
 {arch/sparc/lib/crypto => lib/crypto/sparc}/Kconfig      | 0
 {arch/sparc/lib/crypto => lib/crypto/sparc}/Makefile     | 0
 {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256.c     | 0
 {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256_asm.S | 0
 7 files changed, 2 insertions(+), 2 deletions(-)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/Kconfig (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/Makefile (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256.c (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256_asm.S (100%)

diff --git a/arch/sparc/lib/Makefile b/arch/sparc/lib/Makefile
index 5cf9781d68b40..ef8860eb3f3d1 100644
--- a/arch/sparc/lib/Makefile
+++ b/arch/sparc/lib/Makefile
@@ -2,11 +2,10 @@
 # Makefile for Sparc library files..
 #
 
 asflags-y := -ansi -DST_DIV0=0x02
 
-obj-y                 += crypto/
 lib-$(CONFIG_SPARC32) += ashrdi3.o
 lib-$(CONFIG_SPARC32) += memcpy.o memset.o
 lib-y                 += strlen.o
 lib-y                 += checksum_$(BITS).o
 lib-$(CONFIG_SPARC32) += blockops.o
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 278b7ef5ec4f9..b98543c7ef231 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -206,11 +206,11 @@ source "lib/crypto/riscv/Kconfig"
 endif
 if S390
 source "lib/crypto/s390/Kconfig"
 endif
 if SPARC
-source "arch/sparc/lib/crypto/Kconfig"
+source "lib/crypto/sparc/Kconfig"
 endif
 if X86
 source "arch/x86/lib/crypto/Kconfig"
 endif
 endif
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 4cda1f5cd21d4..748d1fc6b6be2 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -107,5 +107,6 @@ obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
 obj-$(CONFIG_PPC) += powerpc/
 obj-$(CONFIG_RISCV) += riscv/
 obj-$(CONFIG_S390) += s390/
+obj-$(CONFIG_SPARC) += sparc/
diff --git a/arch/sparc/lib/crypto/Kconfig b/lib/crypto/sparc/Kconfig
similarity index 100%
rename from arch/sparc/lib/crypto/Kconfig
rename to lib/crypto/sparc/Kconfig
diff --git a/arch/sparc/lib/crypto/Makefile b/lib/crypto/sparc/Makefile
similarity index 100%
rename from arch/sparc/lib/crypto/Makefile
rename to lib/crypto/sparc/Makefile
diff --git a/arch/sparc/lib/crypto/sha256.c b/lib/crypto/sparc/sha256.c
similarity index 100%
rename from arch/sparc/lib/crypto/sha256.c
rename to lib/crypto/sparc/sha256.c
diff --git a/arch/sparc/lib/crypto/sha256_asm.S b/lib/crypto/sparc/sha256_asm.S
similarity index 100%
rename from arch/sparc/lib/crypto/sha256_asm.S
rename to lib/crypto/sparc/sha256_asm.S
-- 
2.50.0


