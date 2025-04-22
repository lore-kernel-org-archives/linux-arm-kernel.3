Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EB1C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTbO3bkLwy7G2nJqTkGEYXUtBveaaxyR2UC7H7HLcoU=; b=DfIQMVBQLo4H0qSVg7eqh/weLv
	h7By4EzU4zyx8uHqlBFKUeOAA/3q77Q0w6yXRLMwSq9pMsyVmm68EPSmuJB/nlM8Zm96F0ASJMwet
	4F8m4GJQratMOMobIU87s9eUMXlIielNot64Z/AY94mMMwkaKVDNWg6f9LkPddd5WM6LHNV0B3TjV
	XxlXRXQI4CokWN/N8wWSev2iYfuN3iX3YHjtg3ksq3yjgmXWOhPiE0p2KbQXIQLdaSA0x1KcsSRAL
	wUM4WsWOR+PEzlkJx5QGW5uM2ujlX12A5/WStAD3YX7K/wWU8Z14z4Y3kiVS6wTLTvLS2ZWUxY6B3
	0AbQhQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I9K-000000086tK-19AO;
	Tue, 22 Apr 2025 18:15:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FXv-00000007iTp-3dmH;
	Tue, 22 Apr 2025 15:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JTbO3bkLwy7G2nJqTkGEYXUtBveaaxyR2UC7H7HLcoU=; b=odtHhwMVef4p/Hw9wbxq5360K3
	InjTX2M5e8s8uXjcRm/Vt7mywLS+JYI1H23Xl6zqIwI/Bn5FO9E9d6KpIxQITQOyUVs1Z3A6ekJ1k
	yeWpGGPxIp31QfggP5VIko8QtYlSZ+D9X/fcirG4Qw9Hc2swfwf51G/89xz/u6jgwybHPkL9nVtmL
	lhEw9QRphgJPTDnWOYdrnY/B+AP09SzTatuRNTBvzxT50rEEQDBK1JjX4TgivpoJO7tqEXYxFExET
	H4XRVuxyFAXiw94g2FJJ4MK5CFWYoSk544SbAElZvrYA4TiGewBmxttRGXuc37msPnOulI0e/GoUv
	6L9mgWMQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7FXp-0000000BFWZ-3kXM;
	Tue, 22 Apr 2025 15:28:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E0DC4A957;
	Tue, 22 Apr 2025 15:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87429C4CEE9;
	Tue, 22 Apr 2025 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335698;
	bh=JceMeyvHZFS3hU3osMnM8DtDXrhU/UjeqoFMt/NCYhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S1Iqr1h9HcAr7bVNT5cba2ArhH18ZszXuXxOULo1zOhqYgh93BeDmZmHR/LwJsF7b
	 dhj8C+xJh4XhDT2g2eWx7IzOWw1s2s3vyJ6hz4uAM5jSnIcp07jjdJszZrqTUv20bS
	 A4bMr1hXWDqFBHAU3/BabcvlSFb65cZFqD5VpKVjHDz2iPn7goCrvRJGSiSGjJOq08
	 fG1/R2TuLkBGrejtmZ4GemCxXYilTCCNeo0uNnYhgCiJ4TpYBKNFEWgtZq6U5cAqYr
	 taRybWcMEKlFRSxFM9HBqPP0OEHH06GdOtPd+jUapb+VTerV7yzqXLVE36IbD8U6Jj
	 a9MwsvOLwBXFQ==
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
Subject: [PATCH v3 09/13] crypto: riscv - move library functions to arch/riscv/lib/crypto/
Date: Tue, 22 Apr 2025 08:27:12 -0700
Message-ID: <20250422152716.5923-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422152716.5923-1-ebiggers@kernel.org>
References: <20250422152716.5923-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_162822_401727_18C078D8 
X-CRM114-Status: GOOD (  15.71  )
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
crypto infrastructure by moving the riscv ChaCha library functions into
a new directory arch/riscv/lib/crypto/ that does not depend on CRYPTO.
This mirrors the distinction between crypto/ and lib/crypto/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/crypto/Kconfig                         | 7 -------
 arch/riscv/crypto/Makefile                        | 3 ---
 arch/riscv/lib/Makefile                           | 1 +
 arch/riscv/lib/crypto/Kconfig                     | 8 ++++++++
 arch/riscv/lib/crypto/Makefile                    | 4 ++++
 arch/riscv/{ => lib}/crypto/chacha-riscv64-glue.c | 0
 arch/riscv/{ => lib}/crypto/chacha-riscv64-zvkb.S | 0
 lib/crypto/Kconfig                                | 3 +++
 8 files changed, 16 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/lib/crypto/Kconfig
 create mode 100644 arch/riscv/lib/crypto/Makefile
 rename arch/riscv/{ => lib}/crypto/chacha-riscv64-glue.c (100%)
 rename arch/riscv/{ => lib}/crypto/chacha-riscv64-zvkb.S (100%)

diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index 27a1f26d41bde..4863be2a4ec2f 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -16,17 +16,10 @@ config CRYPTO_AES_RISCV64
 	  - Zvkned vector crypto extension
 	  - Zvbb vector extension (XTS)
 	  - Zvkb vector crypto extension (CTR)
 	  - Zvkg vector crypto extension (XTS)
 
-config CRYPTO_CHACHA_RISCV64
-	tristate
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	select CRYPTO_LIB_CHACHA_GENERIC
-	default CRYPTO_LIB_CHACHA_INTERNAL
-
 config CRYPTO_GHASH_RISCV64
 	tristate "Hash functions: GHASH"
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_GCM
 	help
diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
index 247c7bc7288ce..4ae9bf762e907 100644
--- a/arch/riscv/crypto/Makefile
+++ b/arch/riscv/crypto/Makefile
@@ -2,13 +2,10 @@
 
 obj-$(CONFIG_CRYPTO_AES_RISCV64) += aes-riscv64.o
 aes-riscv64-y := aes-riscv64-glue.o aes-riscv64-zvkned.o \
 		 aes-riscv64-zvkned-zvbb-zvkg.o aes-riscv64-zvkned-zvkb.o
 
-obj-$(CONFIG_CRYPTO_CHACHA_RISCV64) += chacha-riscv64.o
-chacha-riscv64-y := chacha-riscv64-glue.o chacha-riscv64-zvkb.o
-
 obj-$(CONFIG_CRYPTO_GHASH_RISCV64) += ghash-riscv64.o
 ghash-riscv64-y := ghash-riscv64-glue.o ghash-riscv64-zvkg.o
 
 obj-$(CONFIG_CRYPTO_SHA256_RISCV64) += sha256-riscv64.o
 sha256-riscv64-y := sha256-riscv64-glue.o sha256-riscv64-zvknha_or_zvknhb-zvkb.o
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index b1c46153606a6..0baec92d2f55b 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-y			+= crypto/
 lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
diff --git a/arch/riscv/lib/crypto/Kconfig b/arch/riscv/lib/crypto/Kconfig
new file mode 100644
index 0000000000000..46ce2a7ac1f2c
--- /dev/null
+++ b/arch/riscv/lib/crypto/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_CHACHA_RISCV64
+	tristate
+	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	select CRYPTO_LIB_CHACHA_GENERIC
diff --git a/arch/riscv/lib/crypto/Makefile b/arch/riscv/lib/crypto/Makefile
new file mode 100644
index 0000000000000..e27b78f317fc8
--- /dev/null
+++ b/arch/riscv/lib/crypto/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_CHACHA_RISCV64) += chacha-riscv64.o
+chacha-riscv64-y := chacha-riscv64-glue.o chacha-riscv64-zvkb.o
diff --git a/arch/riscv/crypto/chacha-riscv64-glue.c b/arch/riscv/lib/crypto/chacha-riscv64-glue.c
similarity index 100%
rename from arch/riscv/crypto/chacha-riscv64-glue.c
rename to arch/riscv/lib/crypto/chacha-riscv64-glue.c
diff --git a/arch/riscv/crypto/chacha-riscv64-zvkb.S b/arch/riscv/lib/crypto/chacha-riscv64-zvkb.S
similarity index 100%
rename from arch/riscv/crypto/chacha-riscv64-zvkb.S
rename to arch/riscv/lib/crypto/chacha-riscv64-zvkb.S
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 4b3e94ed84bb6..0b06c25eb38a5 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -166,8 +166,11 @@ if MIPS
 source "arch/mips/lib/crypto/Kconfig"
 endif
 if PPC
 source "arch/powerpc/lib/crypto/Kconfig"
 endif
+if RISCV
+source "arch/riscv/lib/crypto/Kconfig"
+endif
 endif
 
 endmenu
-- 
2.49.0


