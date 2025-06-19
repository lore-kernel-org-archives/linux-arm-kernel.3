Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A453C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 20:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2M7+2gaUCp+pdGZ4iBUatFVr+vuRJYvrM+tTcvtPhY=; b=tuf9MUbCbC+QVislXdHzeBNRi/
	9c80b8XyqkfZS0Ts0fAs4JEtgyWBkX0zxIwJYnouj2o0FfowX1/7QmWe9ZHl19ZwPWzvIPsJcdYvr
	IJhZJ/eycHFFbqv5MYrOwXZ3bbYBnx5/bgyovVMW0soma68zZrFBaXbEsaXZ1BHjrasRBBGzpjl9X
	wVZiCL4oYZtvIKazm4zrsVuSwPW51Ha3SxzMhKJwLUBtfh0oPUYE0LlNtjd/wbadpVaTtcejwZzfN
	Dp8zlTuKruNLY8veMotNZ6wvFBF2eC3v1DIO6UIhETFaMoQOz2y3SsA9/PhbJf/XDLe4Bvl8wYHRG
	zeNRBACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLpQ-0000000EChg-2fVZ;
	Thu, 19 Jun 2025 20:25:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKq7-0000000E5Ar-1Lli;
	Thu, 19 Jun 2025 19:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=m2M7+2gaUCp+pdGZ4iBUatFVr+vuRJYvrM+tTcvtPhY=; b=oiQ5ANQ8xbDwrxkuBUYB/Eky+S
	u1BqFr8ASmIXjZzORBqYSbQ6TOUbwKIIdpJUmtE+nsQpcJ1FnGrOSCqko7jC7Rb1rb+S7amdNFl3J
	7u8EaNhR0ci8DKEEIr2//Rhv6MX1GPBJ2dvrg4jY9PD4aYRqZ4tiqS8DyswJMsc4K01YxSTS10kPC
	RdeJu9BvI4ByRzEpc6pzmiUhVsy6moUkfnkf/hODYTqpbCGbGHJNfOpHjCizPrN5BTRfnxgalBrMl
	R9ec0SsNkMakVtKOCN8d3mWhq5r4p72/P++UaC6m+eyecMOW33iXpuiaSMcxyX/GL/a7Q2/ob/8WF
	65LrlT9Q==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKpw-00000004YiL-12dV;
	Thu, 19 Jun 2025 19:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCBD84ACB6;
	Thu, 19 Jun 2025 19:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C698C4CEF2;
	Thu, 19 Jun 2025 19:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360928;
	bh=olGuQl6hXdBWJzjyuen1xpyitMxkK608OWYpY9JoADg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KgvoC/BReFq1Lm55icK7ABnxNL5KdGaV5L4vxKrywBy7UfLviPfht7YJ0+aDH8XkE
	 PykslUmioa2H8UJWvJJ3G0GfVQSNo7J81My9lz/C2tHV92+8y250WL3lyixxQCG63Y
	 alFfFntKrRy1O2+H0Jovai2Z69VT6/YjPmUxYE29HEcsdPRWt8BcQsqR+XlJFxY4gi
	 ll9qJvMNNdzgp9slPesfx6+JndPYMinTFvyQ/AZSjcSxLCRz0ICJk1P7FiRssZSozY
	 bbkdhtkDDRs1CgETKB7RMcQBlEd1Lql2PMTEEjQylAcS1/jqGv1rl5l8BpcMvWIAPp
	 trU2POGmbT9Yg==
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
Subject: [PATCH v2 5/9] lib/crypto: riscv: move arch/riscv/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:04 -0700
Message-ID: <20250619191908.134235-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
References: <20250619191908.134235-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_202212_850265_5F0DB32A 
X-CRM114-Status: GOOD (  13.26  )
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

Move the contents of arch/riscv/lib/crypto/ into lib/crypto/riscv/.

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
 arch/riscv/lib/Makefile                                         | 1 -
 lib/crypto/Kconfig                                              | 2 +-
 lib/crypto/Makefile                                             | 1 +
 {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig             | 0
 {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile            | 0
 .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c | 0
 .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S | 0
 .../crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S        | 0
 {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c            | 0
 9 files changed, 2 insertions(+), 2 deletions(-)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c (100%)

diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 0baec92d2f55b..b1c46153606a6 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y			+= crypto/
 lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index f4f9a70dd0891..a2b58ca2df0cc 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -200,11 +200,11 @@ source "lib/crypto/mips/Kconfig"
 endif
 if PPC
 source "lib/crypto/powerpc/Kconfig"
 endif
 if RISCV
-source "arch/riscv/lib/crypto/Kconfig"
+source "lib/crypto/riscv/Kconfig"
 endif
 if S390
 source "arch/s390/lib/crypto/Kconfig"
 endif
 if SPARC
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 47c889b881b2a..0fe9200a031d6 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -105,5 +105,6 @@ libsm3-y					:= sm3.o
 
 obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
 obj-$(CONFIG_PPC) += powerpc/
+obj-$(CONFIG_RISCV) += riscv/
diff --git a/arch/riscv/lib/crypto/Kconfig b/lib/crypto/riscv/Kconfig
similarity index 100%
rename from arch/riscv/lib/crypto/Kconfig
rename to lib/crypto/riscv/Kconfig
diff --git a/arch/riscv/lib/crypto/Makefile b/lib/crypto/riscv/Makefile
similarity index 100%
rename from arch/riscv/lib/crypto/Makefile
rename to lib/crypto/riscv/Makefile
diff --git a/arch/riscv/lib/crypto/chacha-riscv64-glue.c b/lib/crypto/riscv/chacha-riscv64-glue.c
similarity index 100%
rename from arch/riscv/lib/crypto/chacha-riscv64-glue.c
rename to lib/crypto/riscv/chacha-riscv64-glue.c
diff --git a/arch/riscv/lib/crypto/chacha-riscv64-zvkb.S b/lib/crypto/riscv/chacha-riscv64-zvkb.S
similarity index 100%
rename from arch/riscv/lib/crypto/chacha-riscv64-zvkb.S
rename to lib/crypto/riscv/chacha-riscv64-zvkb.S
diff --git a/arch/riscv/lib/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S b/lib/crypto/riscv/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
similarity index 100%
rename from arch/riscv/lib/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
rename to lib/crypto/riscv/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
diff --git a/arch/riscv/lib/crypto/sha256.c b/lib/crypto/riscv/sha256.c
similarity index 100%
rename from arch/riscv/lib/crypto/sha256.c
rename to lib/crypto/riscv/sha256.c
-- 
2.50.0


