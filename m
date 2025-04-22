Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0329C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gkre60zXNPIPeH0+K/IDcEfnGFbHo643ocDxg7xLzek=; b=ODLU/hyDQNC8TMSOZIUmOEHSIt
	YEQtmVPhFh8FJeY1mAD6bC18krra67FqY/twMz4pnHBVA8NvAQo4u1t1rINH6Lq6skDbNNpBtTUs3
	WoM2fERPaQnmiqhlUrOJo3o8xXf6M6E41XRC2VKMa9xLmD3GlAYVL3jV6NtBIdNujdcdWGBw/tZrs
	NkBlspWt+qSyXEM6RN3TswDyhs3PBdI2VD4/ExMy8W2J2Srru8CkiOxB6ZABhAd10ulGOsMt/8RVr
	3YTeeIvmrpYEO72v533ls3B8aD6y2P0r2gDyU09JykfJ6n0V33Zhg8/y/o+eXhXKOGHyY5+n7cp7R
	qQ4iP3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I9G-000000086mc-1LBm;
	Tue, 22 Apr 2025 18:15:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FXu-00000007iTL-45Mg;
	Tue, 22 Apr 2025 15:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Gkre60zXNPIPeH0+K/IDcEfnGFbHo643ocDxg7xLzek=; b=nt0HobQ2+I56GZg6WNPTmpqM6Z
	4fLqup/IG1aUF4U2Q9Gw3DNTPVS+JkEk7K6IuV8N0QvvAA4EB+aS/+36Gi1iyV4aLpbPhpu/ZgfSw
	Dy1BzS0kkqcmUGzPPkVygCPwb8cV4EvpE3U2S1SOPbOcLIjNtYCCuadDePoc+MynkMIFpnkx4DNw1
	rcsxsN+p5Y7gZGFh7csHjTVzEWTudL8CqAoFD0SblG0P/UsdYpUi6H2iCrpt6srGYtWd1ZEiBlUou
	70b+zZEH4xkR8wno8ndgMlRSR8sjPGGUrtNceOO07NItEQy0rDzZd/SrGZGr+6cT8TuNhW+miPVaW
	+VCaky3w==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7FXp-0000000BFWb-3TjN;
	Tue, 22 Apr 2025 15:28:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 136D85C5CCB;
	Tue, 22 Apr 2025 15:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6C1C4CEEF;
	Tue, 22 Apr 2025 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335699;
	bh=5jzPL09SfE4WESjYxnB172zEQMoguedQXb5qi2BK7CI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ijwuPSljLUCro4FgzubwMtFH7ikucOxhOmnwpK6MBIXki/ne1ecDcVhjsr6xzQvuh
	 L0mtGc60L0lm36lPD5HzNCMl5zZkE2nKIUzHSoJN3xOKsEQmTFrBFfzBylPKyPaxfT
	 qm4pWQkhKvgvN53FRAScHg0rKhXDla860Iw1OSU05S+d9q+5FrAe49ZsC/3tga9M3C
	 M1WXUCOradICSVIHOwp0kpNxqXWO8/wXK0q0Fk+Qn6KnfL4y/jcUXimTK9ErrttADo
	 rhsPaa4wEQ33r+g2jpElI+q94Xu3SNQhsSq9JpxDS1jq45FeL8zQ9p0FsEw4u5NgWl
	 OXjLODS4asp5Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v3 11/13] crypto: x86 - move library functions to arch/x86/lib/crypto/
Date: Tue, 22 Apr 2025 08:27:14 -0700
Message-ID: <20250422152716.5923-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422152716.5923-1-ebiggers@kernel.org>
References: <20250422152716.5923-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_162822_303960_921FC183 
X-CRM114-Status: GOOD (  14.91  )
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

Continue disentangling the crypto library functions from the generic
crypto infrastructure by moving the x86 BLAKE2s, ChaCha, and Poly1305
library functions into a new directory arch/x86/lib/crypto/ that does
not depend on CRYPTO.  This mirrors the distinction between crypto/ and
lib/crypto/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/crypto/Kconfig                       | 25 ------------------
 arch/x86/crypto/Makefile                      | 15 -----------
 arch/x86/lib/Makefile                         |  2 ++
 arch/x86/lib/crypto/.gitignore                |  2 ++
 arch/x86/lib/crypto/Kconfig                   | 26 +++++++++++++++++++
 arch/x86/lib/crypto/Makefile                  | 17 ++++++++++++
 arch/x86/{ => lib}/crypto/blake2s-core.S      |  0
 arch/x86/{ => lib}/crypto/blake2s-glue.c      |  0
 .../x86/{ => lib}/crypto/chacha-avx2-x86_64.S |  0
 .../{ => lib}/crypto/chacha-avx512vl-x86_64.S |  0
 .../{ => lib}/crypto/chacha-ssse3-x86_64.S    |  0
 arch/x86/{ => lib}/crypto/chacha_glue.c       |  0
 .../crypto/poly1305-x86_64-cryptogams.pl      |  0
 arch/x86/{ => lib}/crypto/poly1305_glue.c     |  0
 lib/crypto/Kconfig                            |  3 +++
 15 files changed, 50 insertions(+), 40 deletions(-)
 create mode 100644 arch/x86/lib/crypto/.gitignore
 create mode 100644 arch/x86/lib/crypto/Kconfig
 create mode 100644 arch/x86/lib/crypto/Makefile
 rename arch/x86/{ => lib}/crypto/blake2s-core.S (100%)
 rename arch/x86/{ => lib}/crypto/blake2s-glue.c (100%)
 rename arch/x86/{ => lib}/crypto/chacha-avx2-x86_64.S (100%)
 rename arch/x86/{ => lib}/crypto/chacha-avx512vl-x86_64.S (100%)
 rename arch/x86/{ => lib}/crypto/chacha-ssse3-x86_64.S (100%)
 rename arch/x86/{ => lib}/crypto/chacha_glue.c (100%)
 rename arch/x86/{ => lib}/crypto/poly1305-x86_64-cryptogams.pl (100%)
 rename arch/x86/{ => lib}/crypto/poly1305_glue.c (100%)

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index b4df6cf37e0ea..9e941362e4cd5 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -333,17 +333,10 @@ config CRYPTO_ARIA_GFNI_AVX512_X86_64
 	  - AVX512 (Advanced Vector Extensions)
 	  - GFNI (Galois Field New Instructions)
 
 	  Processes 64 blocks in parallel.
 
-config CRYPTO_CHACHA20_X86_64
-	tristate
-	depends on 64BIT
-	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
-
 config CRYPTO_AEGIS128_AESNI_SSE2
 	tristate "AEAD ciphers: AEGIS-128 (AES-NI/SSE4.1)"
 	depends on 64BIT
 	select CRYPTO_AEAD
 	help
@@ -371,38 +364,20 @@ config CRYPTO_NHPOLY1305_AVX2
 	  NHPoly1305 hash function for Adiantum
 
 	  Architecture: x86_64 using:
 	  - AVX2 (Advanced Vector Extensions 2)
 
-config CRYPTO_BLAKE2S_X86
-	bool "Hash functions: BLAKE2s (SSSE3/AVX-512)"
-	depends on 64BIT
-	select CRYPTO_LIB_BLAKE2S_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_BLAKE2S
-	help
-	  BLAKE2s cryptographic hash function (RFC 7693)
-
-	  Architecture: x86_64 using:
-	  - SSSE3 (Supplemental SSE3)
-	  - AVX-512 (Advanced Vector Extensions-512)
-
 config CRYPTO_POLYVAL_CLMUL_NI
 	tristate "Hash functions: POLYVAL (CLMUL-NI)"
 	depends on 64BIT
 	select CRYPTO_POLYVAL
 	help
 	  POLYVAL hash function for HCTR2
 
 	  Architecture: x86_64 using:
 	  - CLMUL-NI (carry-less multiplication new instructions)
 
-config CRYPTO_POLY1305_X86_64
-	tristate
-	depends on 64BIT
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-	default CRYPTO_LIB_POLY1305_INTERNAL
-
 config CRYPTO_SHA1_SSSE3
 	tristate "Hash functions: SHA-1 (SSSE3/AVX/AVX2/SHA-NI)"
 	depends on 64BIT
 	select CRYPTO_SHA1
 	select CRYPTO_HASH
diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 2f22b381f2445..fad59a6c6c26f 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -40,13 +40,10 @@ obj-$(CONFIG_CRYPTO_CAST6_AVX_X86_64) += cast6-avx-x86_64.o
 cast6-avx-x86_64-y := cast6-avx-x86_64-asm_64.o cast6_avx_glue.o
 
 obj-$(CONFIG_CRYPTO_AEGIS128_AESNI_SSE2) += aegis128-aesni.o
 aegis128-aesni-y := aegis128-aesni-asm.o aegis128-aesni-glue.o
 
-obj-$(CONFIG_CRYPTO_CHACHA20_X86_64) += chacha-x86_64.o
-chacha-x86_64-y := chacha-avx2-x86_64.o chacha-ssse3-x86_64.o chacha-avx512vl-x86_64.o chacha_glue.o
-
 obj-$(CONFIG_CRYPTO_AES_NI_INTEL) += aesni-intel.o
 aesni-intel-y := aesni-intel_asm.o aesni-intel_glue.o
 aesni-intel-$(CONFIG_64BIT) += aes-ctr-avx-x86_64.o \
 			       aes-gcm-aesni-x86_64.o \
 			       aes-xts-avx-x86_64.o
@@ -61,23 +58,16 @@ obj-$(CONFIG_CRYPTO_SHA256_SSSE3) += sha256-ssse3.o
 sha256-ssse3-y := sha256-ssse3-asm.o sha256-avx-asm.o sha256-avx2-asm.o sha256_ni_asm.o sha256_ssse3_glue.o
 
 obj-$(CONFIG_CRYPTO_SHA512_SSSE3) += sha512-ssse3.o
 sha512-ssse3-y := sha512-ssse3-asm.o sha512-avx-asm.o sha512-avx2-asm.o sha512_ssse3_glue.o
 
-obj-$(CONFIG_CRYPTO_BLAKE2S_X86) += libblake2s-x86_64.o
-libblake2s-x86_64-y := blake2s-core.o blake2s-glue.o
-
 obj-$(CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL) += ghash-clmulni-intel.o
 ghash-clmulni-intel-y := ghash-clmulni-intel_asm.o ghash-clmulni-intel_glue.o
 
 obj-$(CONFIG_CRYPTO_POLYVAL_CLMUL_NI) += polyval-clmulni.o
 polyval-clmulni-y := polyval-clmulni_asm.o polyval-clmulni_glue.o
 
-obj-$(CONFIG_CRYPTO_POLY1305_X86_64) += poly1305-x86_64.o
-poly1305-x86_64-y := poly1305-x86_64-cryptogams.o poly1305_glue.o
-targets += poly1305-x86_64-cryptogams.S
-
 obj-$(CONFIG_CRYPTO_NHPOLY1305_SSE2) += nhpoly1305-sse2.o
 nhpoly1305-sse2-y := nh-sse2-x86_64.o nhpoly1305-sse2-glue.o
 obj-$(CONFIG_CRYPTO_NHPOLY1305_AVX2) += nhpoly1305-avx2.o
 nhpoly1305-avx2-y := nh-avx2-x86_64.o nhpoly1305-avx2-glue.o
 
@@ -99,12 +89,7 @@ obj-$(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64) += aria-aesni-avx2-x86_64.o
 aria-aesni-avx2-x86_64-y := aria-aesni-avx2-asm_64.o aria_aesni_avx2_glue.o
 
 obj-$(CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64) += aria-gfni-avx512-x86_64.o
 aria-gfni-avx512-x86_64-y := aria-gfni-avx512-asm_64.o aria_gfni_avx512_glue.o
 
-quiet_cmd_perlasm = PERLASM $@
-      cmd_perlasm = $(PERL) $< > $@
-$(obj)/%.S: $(src)/%.pl FORCE
-	$(call if_changed,perlasm)
-
 # Disable GCOV in odd or sensitive code
 GCOV_PROFILE_curve25519-x86_64.o := n
diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 1c50352eb49f9..4f0d57a354267 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -1,10 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for x86 specific library files.
 #
 
+obj-y += crypto/
+
 # Produces uninteresting flaky coverage.
 KCOV_INSTRUMENT_delay.o	:= n
 
 # KCSAN uses udelay for introducing watchpoint delay; avoid recursion.
 KCSAN_SANITIZE_delay.o := n
diff --git a/arch/x86/lib/crypto/.gitignore b/arch/x86/lib/crypto/.gitignore
new file mode 100644
index 0000000000000..580c839bb1776
--- /dev/null
+++ b/arch/x86/lib/crypto/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+poly1305-x86_64-cryptogams.S
diff --git a/arch/x86/lib/crypto/Kconfig b/arch/x86/lib/crypto/Kconfig
new file mode 100644
index 0000000000000..f83aa51dd9129
--- /dev/null
+++ b/arch/x86/lib/crypto/Kconfig
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_BLAKE2S_X86
+	bool "Hash functions: BLAKE2s (SSSE3/AVX-512)"
+	depends on 64BIT
+	select CRYPTO_LIB_BLAKE2S_GENERIC
+	select CRYPTO_ARCH_HAVE_LIB_BLAKE2S
+	help
+	  BLAKE2s cryptographic hash function (RFC 7693)
+
+	  Architecture: x86_64 using:
+	  - SSSE3 (Supplemental SSE3)
+	  - AVX-512 (Advanced Vector Extensions-512)
+
+config CRYPTO_CHACHA20_X86_64
+	tristate
+	depends on 64BIT
+	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_LIB_CHACHA_GENERIC
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+
+config CRYPTO_POLY1305_X86_64
+	tristate
+	depends on 64BIT
+	default CRYPTO_LIB_POLY1305_INTERNAL
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305
diff --git a/arch/x86/lib/crypto/Makefile b/arch/x86/lib/crypto/Makefile
new file mode 100644
index 0000000000000..c2ff8c5f1046e
--- /dev/null
+++ b/arch/x86/lib/crypto/Makefile
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_BLAKE2S_X86) += libblake2s-x86_64.o
+libblake2s-x86_64-y := blake2s-core.o blake2s-glue.o
+
+obj-$(CONFIG_CRYPTO_CHACHA20_X86_64) += chacha-x86_64.o
+chacha-x86_64-y := chacha-avx2-x86_64.o chacha-ssse3-x86_64.o chacha-avx512vl-x86_64.o chacha_glue.o
+
+obj-$(CONFIG_CRYPTO_POLY1305_X86_64) += poly1305-x86_64.o
+poly1305-x86_64-y := poly1305-x86_64-cryptogams.o poly1305_glue.o
+targets += poly1305-x86_64-cryptogams.S
+
+quiet_cmd_perlasm = PERLASM $@
+      cmd_perlasm = $(PERL) $< > $@
+
+$(obj)/%.S: $(src)/%.pl FORCE
+	$(call if_changed,perlasm)
diff --git a/arch/x86/crypto/blake2s-core.S b/arch/x86/lib/crypto/blake2s-core.S
similarity index 100%
rename from arch/x86/crypto/blake2s-core.S
rename to arch/x86/lib/crypto/blake2s-core.S
diff --git a/arch/x86/crypto/blake2s-glue.c b/arch/x86/lib/crypto/blake2s-glue.c
similarity index 100%
rename from arch/x86/crypto/blake2s-glue.c
rename to arch/x86/lib/crypto/blake2s-glue.c
diff --git a/arch/x86/crypto/chacha-avx2-x86_64.S b/arch/x86/lib/crypto/chacha-avx2-x86_64.S
similarity index 100%
rename from arch/x86/crypto/chacha-avx2-x86_64.S
rename to arch/x86/lib/crypto/chacha-avx2-x86_64.S
diff --git a/arch/x86/crypto/chacha-avx512vl-x86_64.S b/arch/x86/lib/crypto/chacha-avx512vl-x86_64.S
similarity index 100%
rename from arch/x86/crypto/chacha-avx512vl-x86_64.S
rename to arch/x86/lib/crypto/chacha-avx512vl-x86_64.S
diff --git a/arch/x86/crypto/chacha-ssse3-x86_64.S b/arch/x86/lib/crypto/chacha-ssse3-x86_64.S
similarity index 100%
rename from arch/x86/crypto/chacha-ssse3-x86_64.S
rename to arch/x86/lib/crypto/chacha-ssse3-x86_64.S
diff --git a/arch/x86/crypto/chacha_glue.c b/arch/x86/lib/crypto/chacha_glue.c
similarity index 100%
rename from arch/x86/crypto/chacha_glue.c
rename to arch/x86/lib/crypto/chacha_glue.c
diff --git a/arch/x86/crypto/poly1305-x86_64-cryptogams.pl b/arch/x86/lib/crypto/poly1305-x86_64-cryptogams.pl
similarity index 100%
rename from arch/x86/crypto/poly1305-x86_64-cryptogams.pl
rename to arch/x86/lib/crypto/poly1305-x86_64-cryptogams.pl
diff --git a/arch/x86/crypto/poly1305_glue.c b/arch/x86/lib/crypto/poly1305_glue.c
similarity index 100%
rename from arch/x86/crypto/poly1305_glue.c
rename to arch/x86/lib/crypto/poly1305_glue.c
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index db19a7acc2fbf..f321fe1a8681b 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -172,8 +172,11 @@ if RISCV
 source "arch/riscv/lib/crypto/Kconfig"
 endif
 if S390
 source "arch/s390/lib/crypto/Kconfig"
 endif
+if X86
+source "arch/x86/lib/crypto/Kconfig"
+endif
 endif
 
 endmenu
-- 
2.49.0


