Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28685C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 20:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bObyf0PMRftD1AZgix1PZKHNndftzWmGNOANt5WDf+c=; b=zWEZYN6g25EgTnA8tzuRS9zYeY
	ZcJmHNSk4JgN4RGRG6IB2ziu0ZmabCQOjh4IVNJ9ZJbSjXGENu3kpMfAoCjCXzN9VTANcChKOKMOP
	uOW/4zNbFsiIOVYQDAKBniYsGluZgoeBX/F65Pc2AX24gzLX3yyFedxwfepLbeyywT9ZEG+3m0pEq
	BQeVuItHxzerJX8wtR1eZl2JErZBjuX4MCPTDYqGDuywELtYJHMhbgqnNLi8jo7rMirzhv9fnJXVo
	njT0ghIF7PmNQX1Lo2kHzS77sBZEGIxbazXR3aT/d3YzASQC7H0eVMryUE3/KEsTzywSgNzYQu2DA
	PoLyIKIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLSO-0000000EAir-3hRW;
	Thu, 19 Jun 2025 20:01:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKps-0000000E558-2N5j;
	Thu, 19 Jun 2025 19:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 80EBDA5474F;
	Thu, 19 Jun 2025 19:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00851C4CEEA;
	Thu, 19 Jun 2025 19:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360927;
	bh=RMLJ2Mc60dhI22NguMJn4nG7jrjmEH17chdDqFFaLzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tGGN1SzUeo0PuplVPxRVxBWPvKtOHQGiUm/80p/SW+CPV1xWBJdQfrSAMxgeEPyWC
	 0K99EWQdzu7SPhal6ukdB6UbrOO1TNOaoUIZayhzCcHKW08Yz0l1dsGg9sIJZeDJ/n
	 jJjGnFhXhgXQe95KfsKkux/9i5OlxMTsThazJc3Kl4+Sckl6AJl1exj+7mJJlOnrlL
	 7VzPmwr1VvPKqsCQq0vaG9JEsFdKARjqyibpxTkuZjZr7X1v44mkO8jMFu6VkIFuFD
	 jOyoDqQ0tysL2Jg4xtbltA2P/Dq8gVdum9QCZTfkf8ILS0PdXQhJzbspvDWytj0KS/
	 AkStSCm+BjtFA==
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
Subject: [PATCH v2 2/9] lib/crypto: arm64: move arch/arm64/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:01 -0700
Message-ID: <20250619191908.134235-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
References: <20250619191908.134235-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_122208_736663_3F0238A1 
X-CRM114-Status: GOOD (  17.10  )
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

Move the contents of arch/arm64/lib/crypto/ into lib/crypto/arm64/.

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

Add a gitignore entry for the removed directory arch/arm64/lib/crypto/
so that people don't accidentally commit leftover generated files.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/.gitignore                                     | 4 ++++
 arch/arm64/lib/Makefile                                       | 3 ---
 arch/arm64/lib/crypto/.gitignore                              | 3 ---
 lib/crypto/Kconfig                                            | 2 +-
 lib/crypto/Makefile                                           | 3 ++-
 lib/crypto/arm64/.gitignore                                   | 2 ++
 {arch/arm64/lib/crypto => lib/crypto/arm64}/Kconfig           | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/Makefile          | 0
 .../arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-core.S  | 0
 .../arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-glue.c  | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-armv8.pl | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-glue.c   | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/sha2-armv8.pl     | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256-ce.S       | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256.c          | 0
 15 files changed, 9 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/lib/.gitignore
 delete mode 100644 arch/arm64/lib/crypto/.gitignore
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/Kconfig (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/Makefile (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-core.S (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-glue.c (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-armv8.pl (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-glue.c (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha2-armv8.pl (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256-ce.S (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256.c (100%)

diff --git a/arch/arm64/lib/.gitignore b/arch/arm64/lib/.gitignore
new file mode 100644
index 0000000000000..647d7a922e680
--- /dev/null
+++ b/arch/arm64/lib/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# This now-removed directory used to contain generated files.
+/crypto/
diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 027bfa9689c6a..d97e290619bc5 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -1,9 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-
-obj-y += crypto/
-
 lib-y		:= clear_user.o delay.o copy_from_user.o		\
 		   copy_to_user.o copy_page.o				\
 		   clear_page.o csum.o insn.o memchr.o memcpy.o		\
 		   memset.o memcmp.o strcmp.o strncmp.o strlen.o	\
 		   strnlen.o strchr.o strrchr.o tishift.o
diff --git a/arch/arm64/lib/crypto/.gitignore b/arch/arm64/lib/crypto/.gitignore
deleted file mode 100644
index 12d74d8b03d0a..0000000000000
--- a/arch/arm64/lib/crypto/.gitignore
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-poly1305-core.S
-sha256-core.S
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index e14bef8e87af2..fdeb91bf00328 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -191,11 +191,11 @@ config CRYPTO_LIB_SM3
 if !KMSAN # avoid false positives from assembly
 if ARM
 source "lib/crypto/arm/Kconfig"
 endif
 if ARM64
-source "arch/arm64/lib/crypto/Kconfig"
+source "lib/crypto/arm64/Kconfig"
 endif
 if MIPS
 source "arch/mips/lib/crypto/Kconfig"
 endif
 if PPC
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index ddf04e2270f1e..63ab907e8f53b 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -81,11 +81,11 @@ clean-files += arm/sha512-core.S
 AFLAGS_arm/sha512-core.o += $(aflags-thumb2-y)
 endif
 
 ifeq ($(CONFIG_ARM64),y)
 libsha512-y += arm64/sha512-core.o
-$(obj)/arm64/sha512-core.S: $(src)/../../arch/arm64/lib/crypto/sha2-armv8.pl
+$(obj)/arm64/sha512-core.S: $(src)/arm64/sha2-armv8.pl
 	$(call cmd,perlasm_with_args)
 clean-files += arm64/sha512-core.S
 libsha512-$(CONFIG_KERNEL_MODE_NEON) += arm64/sha512-ce-core.o
 endif
 
@@ -102,5 +102,6 @@ obj-$(CONFIG_CRYPTO_SELFTESTS)			+= simd.o
 
 obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
 libsm3-y					:= sm3.o
 
 obj-$(CONFIG_ARM) += arm/
+obj-$(CONFIG_ARM64) += arm64/
diff --git a/lib/crypto/arm64/.gitignore b/lib/crypto/arm64/.gitignore
index 670a4d97b5684..f6c4e8ef80dae 100644
--- a/lib/crypto/arm64/.gitignore
+++ b/lib/crypto/arm64/.gitignore
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
+poly1305-core.S
+sha256-core.S
 sha512-core.S
diff --git a/arch/arm64/lib/crypto/Kconfig b/lib/crypto/arm64/Kconfig
similarity index 100%
rename from arch/arm64/lib/crypto/Kconfig
rename to lib/crypto/arm64/Kconfig
diff --git a/arch/arm64/lib/crypto/Makefile b/lib/crypto/arm64/Makefile
similarity index 100%
rename from arch/arm64/lib/crypto/Makefile
rename to lib/crypto/arm64/Makefile
diff --git a/arch/arm64/lib/crypto/chacha-neon-core.S b/lib/crypto/arm64/chacha-neon-core.S
similarity index 100%
rename from arch/arm64/lib/crypto/chacha-neon-core.S
rename to lib/crypto/arm64/chacha-neon-core.S
diff --git a/arch/arm64/lib/crypto/chacha-neon-glue.c b/lib/crypto/arm64/chacha-neon-glue.c
similarity index 100%
rename from arch/arm64/lib/crypto/chacha-neon-glue.c
rename to lib/crypto/arm64/chacha-neon-glue.c
diff --git a/arch/arm64/lib/crypto/poly1305-armv8.pl b/lib/crypto/arm64/poly1305-armv8.pl
similarity index 100%
rename from arch/arm64/lib/crypto/poly1305-armv8.pl
rename to lib/crypto/arm64/poly1305-armv8.pl
diff --git a/arch/arm64/lib/crypto/poly1305-glue.c b/lib/crypto/arm64/poly1305-glue.c
similarity index 100%
rename from arch/arm64/lib/crypto/poly1305-glue.c
rename to lib/crypto/arm64/poly1305-glue.c
diff --git a/arch/arm64/lib/crypto/sha2-armv8.pl b/lib/crypto/arm64/sha2-armv8.pl
similarity index 100%
rename from arch/arm64/lib/crypto/sha2-armv8.pl
rename to lib/crypto/arm64/sha2-armv8.pl
diff --git a/arch/arm64/lib/crypto/sha256-ce.S b/lib/crypto/arm64/sha256-ce.S
similarity index 100%
rename from arch/arm64/lib/crypto/sha256-ce.S
rename to lib/crypto/arm64/sha256-ce.S
diff --git a/arch/arm64/lib/crypto/sha256.c b/lib/crypto/arm64/sha256.c
similarity index 100%
rename from arch/arm64/lib/crypto/sha256.c
rename to lib/crypto/arm64/sha256.c
-- 
2.50.0


