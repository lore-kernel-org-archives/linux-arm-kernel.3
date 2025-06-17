Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35431C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 22:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibJBpJSW/307kYeexuLYz/lasfdOxv0YIqqNFr2Sz+A=; b=KxczFdoeqVDP3C08n1OslFHXbi
	Xm2V8g+kUAUm17iCTDjel8I4Fjw4CrRxI2jYpwSzDYkEJxDqbLgK0G1aSKsK/zcYZj1Ozd8PztJq7
	xYBLmKGK00YkFfwb0n0fnV1Y6CVwdo4GCy6QYsM7DlBY7WcYLWTJYEpmM4bXwvze4Foxwtg5ahTQ9
	s3OkDNkn9AMVydBhwVUUt+oKPXvFTp3QRC+ksxumjB1vZOQoKBuhFMLC+CqKU8mSMHH4RiI7yqaMH
	yAHDWwIk6eGtgFZFnSDL4KwRbpU68fUm1ll27ukMU5GRvgGvXsy/z0x/vtnPHFRqmxyPFa4NHGppG
	oNY/O4Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRev9-00000008XI4-3cXX;
	Tue, 17 Jun 2025 22:36:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReoa-00000008Vp1-1jdp;
	Tue, 17 Jun 2025 22:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D48F8629E5;
	Tue, 17 Jun 2025 22:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EE0C4CEE3;
	Tue, 17 Jun 2025 22:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199399;
	bh=Rnk2PwpW8Gu3iv/lRjgrxSUfjbCe7cqo5Kg5mCp+tec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n/EdaD8Zyxy5dyg5bAmDEr6kkTLTwsspZ77aZlKeN6R2pbgomC606am8X+Ea7qgoq
	 wfCxnVevVxbeN47HYmiSa7TebnsmsjlRcgR9BvQMMkeerD8+0V9escUwehU91SldVr
	 Lca/VLgV4DTAmEx+PRc5EtEdTRpWy4Eeiiv38uYr9TPoNt9G9ZFPOR+FGRD7JPY8qO
	 0uFe+DtlIYq3vTf8pcTNyyZ+8KVGBRAYoIYRU6bV8HU2zFEp5bcrWVDSqknZfyjJGn
	 pcYAGbC7srBvU4mNdXrndtYTL5zhosqb2AaphueSD989/jFzD6EUiYP82nhKMKudWC
	 /FNOfCxOanE6w==
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
Subject: [PATCH 4/9] lib/crypto/powerpc: move arch/powerpc/lib/crypto/ to lib/crypto/powerpc/
Date: Tue, 17 Jun 2025 15:27:21 -0700
Message-ID: <20250617222726.365148-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617222726.365148-1-ebiggers@kernel.org>
References: <20250617222726.365148-1-ebiggers@kernel.org>
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

From: Eric Biggers <ebiggers@google.com>

Move the contents of arch/powerpc/lib/crypto/ into lib/crypto/powerpc/.

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
 arch/powerpc/lib/Makefile                                       | 2 --
 lib/crypto/Kconfig                                              | 2 +-
 lib/crypto/Makefile                                             | 1 +
 {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Kconfig         | 0
 {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Makefile        | 0
 .../powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10-glue.c | 0
 .../powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10le-8x.S | 0
 .../lib/crypto => lib/crypto/powerpc}/poly1305-p10-glue.c       | 0
 .../lib/crypto => lib/crypto/powerpc}/poly1305-p10le_64.S       | 0
 .../powerpc/lib/crypto => lib/crypto/powerpc}/sha256-spe-asm.S  | 0
 {arch/powerpc/lib/crypto => lib/crypto/powerpc}/sha256.c        | 0
 11 files changed, 2 insertions(+), 3 deletions(-)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Kconfig (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Makefile (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10-glue.c (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10le-8x.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/poly1305-p10-glue.c (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/poly1305-p10le_64.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/sha256-spe-asm.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/sha256.c (100%)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 481f968e42c7b..27f8a01438603 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -1,12 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for ppc-specific library files..
 #
 
-obj-y += crypto/
-
 CFLAGS_code-patching.o += -fno-stack-protector
 CFLAGS_feature-fixups.o += -fno-stack-protector
 
 CFLAGS_REMOVE_code-patching.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_feature-fixups.o = $(CC_FLAGS_FTRACE)
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 43c44316fbbdc..f4f9a70dd0891 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -197,11 +197,11 @@ source "lib/crypto/arm64/Kconfig"
 endif
 if MIPS
 source "lib/crypto/mips/Kconfig"
 endif
 if PPC
-source "arch/powerpc/lib/crypto/Kconfig"
+source "lib/crypto/powerpc/Kconfig"
 endif
 if RISCV
 source "arch/riscv/lib/crypto/Kconfig"
 endif
 if S390
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 74331243b8c44..47c889b881b2a 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -104,5 +104,6 @@ obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
 libsm3-y					:= sm3.o
 
 obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
+obj-$(CONFIG_PPC) += powerpc/
diff --git a/arch/powerpc/lib/crypto/Kconfig b/lib/crypto/powerpc/Kconfig
similarity index 100%
rename from arch/powerpc/lib/crypto/Kconfig
rename to lib/crypto/powerpc/Kconfig
diff --git a/arch/powerpc/lib/crypto/Makefile b/lib/crypto/powerpc/Makefile
similarity index 100%
rename from arch/powerpc/lib/crypto/Makefile
rename to lib/crypto/powerpc/Makefile
diff --git a/arch/powerpc/lib/crypto/chacha-p10-glue.c b/lib/crypto/powerpc/chacha-p10-glue.c
similarity index 100%
rename from arch/powerpc/lib/crypto/chacha-p10-glue.c
rename to lib/crypto/powerpc/chacha-p10-glue.c
diff --git a/arch/powerpc/lib/crypto/chacha-p10le-8x.S b/lib/crypto/powerpc/chacha-p10le-8x.S
similarity index 100%
rename from arch/powerpc/lib/crypto/chacha-p10le-8x.S
rename to lib/crypto/powerpc/chacha-p10le-8x.S
diff --git a/arch/powerpc/lib/crypto/poly1305-p10-glue.c b/lib/crypto/powerpc/poly1305-p10-glue.c
similarity index 100%
rename from arch/powerpc/lib/crypto/poly1305-p10-glue.c
rename to lib/crypto/powerpc/poly1305-p10-glue.c
diff --git a/arch/powerpc/lib/crypto/poly1305-p10le_64.S b/lib/crypto/powerpc/poly1305-p10le_64.S
similarity index 100%
rename from arch/powerpc/lib/crypto/poly1305-p10le_64.S
rename to lib/crypto/powerpc/poly1305-p10le_64.S
diff --git a/arch/powerpc/lib/crypto/sha256-spe-asm.S b/lib/crypto/powerpc/sha256-spe-asm.S
similarity index 100%
rename from arch/powerpc/lib/crypto/sha256-spe-asm.S
rename to lib/crypto/powerpc/sha256-spe-asm.S
diff --git a/arch/powerpc/lib/crypto/sha256.c b/lib/crypto/powerpc/sha256.c
similarity index 100%
rename from arch/powerpc/lib/crypto/sha256.c
rename to lib/crypto/powerpc/sha256.c
-- 
2.49.0


