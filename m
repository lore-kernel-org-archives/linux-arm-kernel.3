Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C561093170
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 04:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3NR8y7GC4X70P9CkLq4GMIe6LurEIJ4yxL+sZ9xhtk=; b=2gEHtttaOw4WvJEx5XhoBAL3yF
	3Zubd8YxTSm6T2Vwm8Yd2bAPDSHAEMrR08CfVkvLKRppppGoOmNVh9QzyyP5N/EqXClsKNeoZG3o/
	1Xf1x1SLib25rjYpEueFPcCnS6XAQm5Z1gCxwAlA16y9LEUjd81NiMaZeK2NoQyf8dos1viX7v290
	T+EwQmNAGAUJN12SXEKfTDnIA4VyaUUfYzsgUzYoJQ9vZQUfZQpEsn2h0Zt5lRiTDSdaKSknl9Mjx
	XJkQnIUQNTFq92v4Uc4BP1G2KzlldXaPdDYiBJEUJNc1afUvi63b1PZtMxewYcTW2jlTrl3svX4TY
	1cXkDdYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3nh1-0000000DzUM-2A2Z;
	Sat, 21 Mar 2026 04:12:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ngu-0000000DzOW-3fxX;
	Sat, 21 Mar 2026 04:12:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5306944361;
	Sat, 21 Mar 2026 04:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73E3C2BCAF;
	Sat, 21 Mar 2026 04:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774066319;
	bh=ipRy61QkII6mmLQ3AcgziVnasyTR9cLbB+H7Xuzzsf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lFF2gtLrU7QkE2C3FHSOeTD3PlaAtNGWnNQ1fD9IhBbB/w20IyVZG4xBXpl33PqoQ
	 v+AWxz8a+etWbDzWLYaXfbI9g1J7s0SxPnNWn1SQo0UsDSM2udCwuLdEmlSBpA1z8y
	 fbRjQdzqGIvKEchylCaIF29ZMKSV+CyXL0om3T3tcu9+uz22l4RlsgFH6jzQ1SX3sl
	 iVZh3l5886ENZuvCnsFuK5rzwmFAT0UIC4ubFss4JEDwcSUcAL+0MPBHV3GMWXN55f
	 SwJnq8aQlAkHYm2+KW9HbBjSuDFtWScL/qWtqMnNoPAmzVhfISJLguN4Rkfljfx7NK
	 7GsF60j/6OknA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 03/12] crypto: sm3 - Rename CRYPTO_SM3_GENERIC to CRYPTO_SM3
Date: Fri, 20 Mar 2026 21:09:26 -0700
Message-ID: <20260321040935.410034-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321040935.410034-1-ebiggers@kernel.org>
References: <20260321040935.410034-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_211200_960784_3477072B 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

The kconfig options for generic crypto API modules have traditionally
*not* had a "_GENERIC" suffix.  Also, the "_GENERIC" suffix will make
even less sense once the architecture-optimized SM3 code is moved into
lib/crypto/ and the "sm3" crypto_shash is reimplemented on top of that.

Thus, rename CRYPTO_SM3_GENERIC to CRYPTO_SM3.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/loongarch/configs/loongson32_defconfig | 2 +-
 arch/loongarch/configs/loongson64_defconfig | 2 +-
 arch/m68k/configs/amiga_defconfig           | 2 +-
 arch/m68k/configs/apollo_defconfig          | 2 +-
 arch/m68k/configs/atari_defconfig           | 2 +-
 arch/m68k/configs/bvme6000_defconfig        | 2 +-
 arch/m68k/configs/hp300_defconfig           | 2 +-
 arch/m68k/configs/mac_defconfig             | 2 +-
 arch/m68k/configs/multi_defconfig           | 2 +-
 arch/m68k/configs/mvme147_defconfig         | 2 +-
 arch/m68k/configs/mvme16x_defconfig         | 2 +-
 arch/m68k/configs/q40_defconfig             | 2 +-
 arch/m68k/configs/sun3_defconfig            | 2 +-
 arch/m68k/configs/sun3x_defconfig           | 2 +-
 arch/s390/configs/debug_defconfig           | 2 +-
 arch/s390/configs/defconfig                 | 2 +-
 crypto/Kconfig                              | 2 +-
 crypto/Makefile                             | 2 +-
 drivers/crypto/Kconfig                      | 2 +-
 drivers/crypto/starfive/Kconfig             | 2 +-
 security/integrity/ima/Kconfig              | 2 +-
 21 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/loongarch/configs/loongson32_defconfig b/arch/loongarch/configs/loongson32_defconfig
index 276b1577e0be..7abbb21f4f8f 100644
--- a/arch/loongarch/configs/loongson32_defconfig
+++ b/arch/loongarch/configs/loongson32_defconfig
@@ -1078,11 +1078,11 @@ CONFIG_CRYPTO_SEED=m
 CONFIG_CRYPTO_SERPENT=m
 CONFIG_CRYPTO_SM4_GENERIC=m
 CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_DEFLATE=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/loongarch/configs/loongson64_defconfig b/arch/loongarch/configs/loongson64_defconfig
index a14db1a95e7e..51ccd18ecdae 100644
--- a/arch/loongarch/configs/loongson64_defconfig
+++ b/arch/loongarch/configs/loongson64_defconfig
@@ -1111,11 +1111,11 @@ CONFIG_CRYPTO_SEED=m
 CONFIG_CRYPTO_SERPENT=m
 CONFIG_CRYPTO_SM4_GENERIC=m
 CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_DEFLATE=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 31d16cba9879..03a8c192a7a3 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -579,11 +579,11 @@ CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index c0c419ec9a9e..0aee1939ac7a 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -536,11 +536,11 @@ CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 2b7547ecc4c4..756256770afc 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -556,11 +556,11 @@ CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 0b63787cff0d..8cfb75bb0add 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -528,11 +528,11 @@ CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 308836b60bba..b2f5c9749e9b 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -538,11 +538,11 @@ CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 97e108c0d24f..c4fddaaa6a86 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -555,11 +555,11 @@ CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 7e9f83af9af4..926f12bc3d1d 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -642,11 +642,11 @@ CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 2fe33271d249..e507012dbbc1 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -528,11 +528,11 @@ CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 4308daaa7f74..6195cedd914b 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -529,11 +529,11 @@ CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 36eb29ec54ee..9087bd9e3c35 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -545,11 +545,11 @@ CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 524a89fa6953..25115bda7c8a 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -526,11 +526,11 @@ CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index f4fbc65c52d9..15a086634ba5 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -526,11 +526,11 @@ CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index 98fd0a2f51c6..271d683e7959 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -795,11 +795,11 @@ CONFIG_CRYPTO_SEQIV=y
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MD5=y
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA3=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_CRC32=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index 0f4cedcab3ce..e9b64c0d4bcc 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -779,11 +779,11 @@ CONFIG_CRYPTO_SEQIV=y
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MD5=y
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA3=m
-CONFIG_CRYPTO_SM3_GENERIC=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_CRC32=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
diff --git a/crypto/Kconfig b/crypto/Kconfig
index b8608ef6823b..79234fd42eb4 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -979,11 +979,11 @@ config CRYPTO_SHA3
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SHA3
 	help
 	  SHA-3 secure hash algorithms (FIPS 202, ISO/IEC 10118-3)
 
-config CRYPTO_SM3_GENERIC
+config CRYPTO_SM3
 	tristate "SM3 (ShangMi 3)"
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SM3
 	help
 	  SM3 (ShangMi 3) secure hash function (OSCCA GM/T 0004-2012, ISO/IEC 10118-3)
diff --git a/crypto/Makefile b/crypto/Makefile
index 04e269117589..28467f900c9a 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -81,11 +81,11 @@ obj-$(CONFIG_CRYPTO_MD5) += md5.o
 obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
 obj-$(CONFIG_CRYPTO_SHA1) += sha1.o
 obj-$(CONFIG_CRYPTO_SHA256) += sha256.o
 obj-$(CONFIG_CRYPTO_SHA512) += sha512.o
 obj-$(CONFIG_CRYPTO_SHA3) += sha3.o
-obj-$(CONFIG_CRYPTO_SM3_GENERIC) += sm3_generic.o
+obj-$(CONFIG_CRYPTO_SM3) += sm3_generic.o
 obj-$(CONFIG_CRYPTO_STREEBOG) += streebog_generic.o
 obj-$(CONFIG_CRYPTO_WP512) += wp512.o
 CFLAGS_wp512.o := $(call cc-option,-fno-schedule-insns)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
 obj-$(CONFIG_CRYPTO_BLAKE2B) += blake2b.o
 obj-$(CONFIG_CRYPTO_ECB) += ecb.o
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 8d3b5d2890f8..9960100e6066 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -841,11 +841,11 @@ config CRYPTO_DEV_CCREE
 	select CRYPTO_CBC
 	select CRYPTO_ECB
 	select CRYPTO_CTR
 	select CRYPTO_XTS
 	select CRYPTO_SM4_GENERIC
-	select CRYPTO_SM3_GENERIC
+	select CRYPTO_SM3
 	help
 	  Say 'Y' to enable a driver for the REE interface of the Arm
 	  TrustZone CryptoCell family of processors. Currently the
 	  CryptoCell 713, 703, 712, 710 and 630 are supported.
 	  Choose this if you wish to use hardware acceleration of
diff --git a/drivers/crypto/starfive/Kconfig b/drivers/crypto/starfive/Kconfig
index 0fe389e9f932..11518ca3eea1 100644
--- a/drivers/crypto/starfive/Kconfig
+++ b/drivers/crypto/starfive/Kconfig
@@ -8,11 +8,11 @@ config CRYPTO_DEV_JH7110
 	depends on HAS_DMA
 	select CRYPTO_ENGINE
 	select CRYPTO_HMAC
 	select CRYPTO_SHA256
 	select CRYPTO_SHA512
-	select CRYPTO_SM3_GENERIC
+	select CRYPTO_SM3
 	select CRYPTO_RSA
 	select CRYPTO_AES
 	select CRYPTO_CCM
 	select CRYPTO_GCM
 	select CRYPTO_ECB
diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
index 976e75f9b9ba..862fbee2b174 100644
--- a/security/integrity/ima/Kconfig
+++ b/security/integrity/ima/Kconfig
@@ -109,11 +109,11 @@ choice
 		bool "WP512"
 		depends on CRYPTO_WP512=y
 
 	config IMA_DEFAULT_HASH_SM3
 		bool "SM3"
-		depends on CRYPTO_SM3_GENERIC=y
+		depends on CRYPTO_SM3=y
 endchoice
 
 config IMA_DEFAULT_HASH
 	string
 	default "sha1" if IMA_DEFAULT_HASH_SHA1
-- 
2.53.0


