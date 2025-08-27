Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7531CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OxMz+nT96YCqWuzSAnnRndybboKeX5myd1nHFZIPNk=; b=vafig1iKTgiQfp03VNB2GapFFs
	rX+YqmelwlSf8eIvAvycAWk/hbNGsp/c+zU6c9CxBF/UKMljhJm1j7w2KMI0v9601fl9BjwTogaHy
	Vjj98DNv/a3J3XBu52qDUSkSCngeGzED0561PsUxyCfMyPEr+SrgmR5qxwlUyd3bNozOE2YsQHyn0
	F5isyE2ndxPzXB2LMUYwcaTbLn7x6YP1vs2e/8xYtXWV7z4AKUSDwsBPzZ7ZljvWb7kd3HnfmSphz
	dFRm9MJV118wL4afqM94rePEUhFjPrO+7fU7s8X2/Jz2PJqduWs1bgPMdRSsGSnVrcXfn0P4GfHnH
	xMc7rDjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urK7u-0000000GL8l-2V1u;
	Wed, 27 Aug 2025 17:40:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHrZ-0000000FsjQ-0MZU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 15:15:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAA4E44B53;
	Wed, 27 Aug 2025 15:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2BEBC4CEFA;
	Wed, 27 Aug 2025 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756307700;
	bh=/bCBdkNC8TXSkbBvU6E1D99TNf2kUrJ7+Uwzrv5HTbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U0+Mrc0GvdK47J+B9pHg7oS6KkzCJc+rHz0gATPkd06pRx+qBTm+5j+6ezuV4DAn5
	 3IEq+i3Nwts/qBGRXqaYGRa4BfVL/XrkHthWHsFIMTSaljOZs2NJumga+k1pdNvan9
	 IsctHfkMml8XmEL1m7sfvwUxX6OjxmAjvJaw+GJNvl4f+4sKYgWKkh6+DvfjZv7LYe
	 tRjt9fMhk54cROJd/kBpiHp0E0SS6uJmRUKUsDIgT1BLj7AfmfB46tW4PEEeRck9Ff
	 R+2Qlv+J8cj/odJYvH9XboqSmusDiSu0piCQMVegVR0EzzCH3CJ8cNv7XLt9uoHyDH
	 6C3AclQJBLyIA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 09/12] lib/crypto: blake2s: Always enable arch-optimized BLAKE2s code
Date: Wed, 27 Aug 2025 08:11:28 -0700
Message-ID: <20250827151131.27733-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827151131.27733-1-ebiggers@kernel.org>
References: <20250827151131.27733-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_081501_184263_76561878 
X-CRM114-Status: GOOD (  15.59  )
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

When support for a crypto algorithm is enabled, the arch-optimized
implementation of that algorithm should be enabled too.  We've learned
this the hard way many times over the years: people regularly forget to
enable the arch-optimized implementations of the crypto algorithms,
resulting in significant performance being left on the table.

Currently, BLAKE2s support is always enabled ('obj-y'), since random.c
uses it.  Therefore, the arch-optimized BLAKE2s code, which exists for
ARM and x86_64, should be always enabled too.  Let's do that.

Note that the effect on kernel image size is very small and should not
be a concern.  On ARM, enabling CRYPTO_BLAKE2S_ARM actually *shrinks*
the kernel size by about 1200 bytes, since the ARM-optimized
blake2s_compress() completely replaces the generic blake2s_compress().
On x86_64, enabling CRYPTO_BLAKE2S_X86 increases the kernel size by
about 1400 bytes, as the generic blake2s_compress() is still included as
a fallback; however, for context, that is only about a quarter the size
of the generic blake2s_compress().  The x86_64 optimized BLAKE2s code
uses much less icache at runtime than the generic code.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm/Kconfig | 2 +-
 lib/crypto/x86/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/crypto/arm/Kconfig b/lib/crypto/arm/Kconfig
index 740341aa35d21..a5607ad079c4f 100644
--- a/lib/crypto/arm/Kconfig
+++ b/lib/crypto/arm/Kconfig
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config CRYPTO_BLAKE2S_ARM
-	bool "Hash functions: BLAKE2s"
+	def_bool y
 	select CRYPTO_ARCH_HAVE_LIB_BLAKE2S
 	help
 	  BLAKE2s cryptographic hash function (RFC 7693)
 
 	  Architecture: arm
diff --git a/lib/crypto/x86/Kconfig b/lib/crypto/x86/Kconfig
index eb47da71aa6b6..ffa718321369f 100644
--- a/lib/crypto/x86/Kconfig
+++ b/lib/crypto/x86/Kconfig
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config CRYPTO_BLAKE2S_X86
-	bool "Hash functions: BLAKE2s (SSSE3/AVX-512)"
+	def_bool y
 	depends on 64BIT
 	select CRYPTO_LIB_BLAKE2S_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_BLAKE2S
 	help
 	  BLAKE2s cryptographic hash function (RFC 7693)
-- 
2.50.1


