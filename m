Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5051CC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 22:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kpTQhR8PS8vWZj7/H4xa7Vk6pMuU7Ofhqj+e41q5QY=; b=WRIoydm+EEfvqbL+l4Ng3qyunH
	Q9lLlLNddAmqUg1eBT5L6KlMzYegVDpIy5vDfyj3y0TQVSl3EpJnN2/RIyPeKeQ9qFmqCaJ8BRoxA
	4qb+SRjEyBvdgaXBw2NO5rUJjELy7c4cjToINq8cNGs7ZVVK8vvjDtBSK+gHDI5TwjCoxYzWUPrU7
	tKeTe+nd5P1ExJSOTUST8UlOLjS44gdESkEThJLlB9F7zXyeXOhA7FjxUYeTgKF2nIGDI8qRSnScA
	dbiVXFi82c8xUqYQFoPGhYvixdarV+CE/mwNqXb4MYspv0mb946T2h/iicnk5VF4vX9+BcsRULzYJ
	b5jP1EnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRezW-00000008Xb5-3uel;
	Tue, 17 Jun 2025 22:41:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReob-00000008Vq9-1Tj1;
	Tue, 17 Jun 2025 22:30:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C55C962A2B;
	Tue, 17 Jun 2025 22:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D9CC4CEED;
	Tue, 17 Jun 2025 22:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199400;
	bh=DB9DhLYVRPJOFC4JEDOQxgYzL630xncYTvwWN0gUiiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GIYerzvn7TkQv8UhdzsGR2rqziJPgfgOG4h6rMYjV8i2fmyJZx/y5nf8WTbs/GG8Y
	 a0X7Aw26Sj1eUD4YljIGP3krHppMca79SDg/cuVSv/C24zdNrwXqys4sFBrqKx5Ll5
	 jQ7gPM5IBYyanhR7gaWs9tUP8/eVTid9ipCEr50gEhwbMbGfxY3/PAhYc7lhYYM8mW
	 iOEzkysYJZNdPW+5uNlmUz5sgbCLC2R+oRoDR2XpiV9v0SJehI6MYubs3zbFM4hn7K
	 7bAbHLTtuG2cBs/Way1kxZ5fJh7a5QYUAqIYo6PU1t57pY0T0mmdVJ/DRgt5wf+s1Q
	 YGJcjLKKLAAsQ==
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
Subject: [PATCH 6/9] lib/crypto/s390: move arch/s390/lib/crypto/ to lib/crypto/s390/
Date: Tue, 17 Jun 2025 15:27:23 -0700
Message-ID: <20250617222726.365148-7-ebiggers@kernel.org>
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

Move the contents of arch/s390/lib/crypto/ into lib/crypto/s390/.

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
 arch/s390/lib/Makefile                                  | 1 -
 lib/crypto/Kconfig                                      | 2 +-
 lib/crypto/Makefile                                     | 1 +
 {arch/s390/lib/crypto => lib/crypto/s390}/Kconfig       | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/Makefile      | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/chacha-glue.c | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.S | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.h | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/sha256.c      | 0
 9 files changed, 2 insertions(+), 2 deletions(-)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/Kconfig (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/Makefile (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-glue.c (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.S (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.h (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/sha256.c (100%)

diff --git a/arch/s390/lib/Makefile b/arch/s390/lib/Makefile
index cd35cdbfa8713..271a1c407121c 100644
--- a/arch/s390/lib/Makefile
+++ b/arch/s390/lib/Makefile
@@ -1,11 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for s390-specific library files..
 #
 
-obj-y += crypto/
 lib-y += delay.o string.o uaccess.o find.o spinlock.o tishift.o
 lib-y += csum-partial.o
 obj-y += mem.o xor.o
 lib-$(CONFIG_KPROBES) += probes.o
 lib-$(CONFIG_UPROBES) += probes.o
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index a2b58ca2df0cc..278b7ef5ec4f9 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -203,11 +203,11 @@ source "lib/crypto/powerpc/Kconfig"
 endif
 if RISCV
 source "lib/crypto/riscv/Kconfig"
 endif
 if S390
-source "arch/s390/lib/crypto/Kconfig"
+source "lib/crypto/s390/Kconfig"
 endif
 if SPARC
 source "arch/sparc/lib/crypto/Kconfig"
 endif
 if X86
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 0fe9200a031d6..4cda1f5cd21d4 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -106,5 +106,6 @@ libsm3-y					:= sm3.o
 obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
 obj-$(CONFIG_PPC) += powerpc/
 obj-$(CONFIG_RISCV) += riscv/
+obj-$(CONFIG_S390) += s390/
diff --git a/arch/s390/lib/crypto/Kconfig b/lib/crypto/s390/Kconfig
similarity index 100%
rename from arch/s390/lib/crypto/Kconfig
rename to lib/crypto/s390/Kconfig
diff --git a/arch/s390/lib/crypto/Makefile b/lib/crypto/s390/Makefile
similarity index 100%
rename from arch/s390/lib/crypto/Makefile
rename to lib/crypto/s390/Makefile
diff --git a/arch/s390/lib/crypto/chacha-glue.c b/lib/crypto/s390/chacha-glue.c
similarity index 100%
rename from arch/s390/lib/crypto/chacha-glue.c
rename to lib/crypto/s390/chacha-glue.c
diff --git a/arch/s390/lib/crypto/chacha-s390.S b/lib/crypto/s390/chacha-s390.S
similarity index 100%
rename from arch/s390/lib/crypto/chacha-s390.S
rename to lib/crypto/s390/chacha-s390.S
diff --git a/arch/s390/lib/crypto/chacha-s390.h b/lib/crypto/s390/chacha-s390.h
similarity index 100%
rename from arch/s390/lib/crypto/chacha-s390.h
rename to lib/crypto/s390/chacha-s390.h
diff --git a/arch/s390/lib/crypto/sha256.c b/lib/crypto/s390/sha256.c
similarity index 100%
rename from arch/s390/lib/crypto/sha256.c
rename to lib/crypto/s390/sha256.c
-- 
2.49.0


