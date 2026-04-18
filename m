Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26042F99C6E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 00:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ij2ZLCWKyx3FI3ftIkMWOkapg5XDdRnguHlYGirPSgU=; b=fPrkbUuvRuSaA0F3H9ev4mO4Wj
	655NfBhwnzcP6CqvR5YZ5cQ+nBMqWfOuYZRoULpS7IT0DMmcqJwmWrAJ7RTeUSYemOw6XKMpPZe9B
	RNnhLLjizmHRCw5XErgVOvigQjQ1frmtdvkIUalwPTn7e4jHiBehWnMuUdUdyGBpk9d5FcAdytSyI
	Ebn9hUqkV/2EOVJY/vSkAEG0jMliVgus11FOhKinGO4prr7NDVgcwVf4+n1V3ZPTQh/FcrMk0GGyM
	5RH66/ou2/QbgoqAny2emuj/qWBc80mFFRLU5gN/mjZH6h3+lOxnFW3ZZrVB5/gC/vWluIlGu42Kl
	MKQE6Aaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtUg-00000004cD2-1Jol;
	Sat, 18 Apr 2026 00:25:06 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtUc-00000004cAN-1mhL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 00:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471902; x=1808007902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ij2ZLCWKyx3FI3ftIkMWOkapg5XDdRnguHlYGirPSgU=;
  b=E0RiM6pvFBIBFsaq7d/PHf9DDawFNXf4B5E5cl3aMgA8s6x9Msv5Bk1z
   IZAEHsrwGRXUuWST5e0eTThN0hy/5SykT911+FpFNaFvvu09nLo2syCt7
   d7iN7GF0cxlIF0b1yDFn9bQd0MdQdbAKms++qN6ByVDVkjn9wtFRy0xpN
   A/0XVQmJspztZ1XFGztm2KdNte1M5kgBDawHqDSq5Kuh9E+ZfNHPOZWTO
   6F5vUSzutvQdW9jHDE4c7cGpKfyy/MfjSKqVccWgFha/zj1nSzglA22z6
   cYwMSf/zx4axUzb/jYQK0O46oZDFb2tmGmhXUCvPSlkvUx61rLJ1sVMrK
   g==;
X-CSE-ConnectionGUID: BEP6Bi5uQVOIY4h7du4YcA==
X-CSE-MsgGUID: H/U+dGGPR0W50mhTBP1Kug==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17399352"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:24:59 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:30456]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.82:2525] with esmtp (Farcaster)
 id 21fb3888-86aa-48b4-9af6-82200b889620; Sat, 18 Apr 2026 00:24:59 +0000 (UTC)
X-Farcaster-Flow-ID: 21fb3888-86aa-48b4-9af6-82200b889620
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:24:58 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:24:58 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>, Masahiro Yamada
	<masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Bjoern Doebel <doebel@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
	Benjamin Herrenschmidt <benh@amazon.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
	<hpa@zytor.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
	<petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
	<samitolvanen@google.com>, David Howells <dhowells@redhat.com>, "David
 Woodhouse" <dwmw2@infradead.org>, Jarkko Sakkinen <jarkko@kernel.org>, "Ignat
 Korchagin" <ignat@linux.win>, Lukas Wunner <lukas@wunner.de>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-modules@vger.kernel.org>
Subject: [PATCH v2 17/19] x86/crypto: convert exported symbols in x86 crypto to pluggable symbols
Date: Sat, 18 Apr 2026 00:20:25 +0000
Message-ID: <20260418002032.2877-18-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418002032.2877-1-wanjay@amazon.com>
References: <20260418002032.2877-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D041UWA003.ant.amazon.com (10.13.139.105) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_172502_585440_69ADBE8C 
X-CRM114-Status: GOOD (  15.15  )
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

Include x86 architecture-specific crypto source files in
fips140.ko by converting their Makefile rules from obj-y to
crypto-objs-y, and apply the pluggable interface introduced
in the earlier patch so that symbols defined in fips140.ko
can still be referenced by vmlinux.

For exported function symbols, the --wrap linker mechanism
automatically redirects all references in vmlinux to
trampolines, so no source tree modifications are needed
beyond ensuring each function has an EXPORT_SYMBOL.

For exported variable symbols, an architecture-specific
fips140-var-redirect.c is introduced under
arch/x86/crypto/fips140/ to hold DEFINE_CRYPTO_VAR_STUB()
definitions. This file is compiled twice: once for vmlinux
(as the "outlet" providing the placeholder pointers) and
once for fips140.ko (as the "plug" populating them with
real addresses via the __crypto_var_keys section).

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile                      | 41 ++++++++++---------
 arch/x86/crypto/fips140/Makefile              | 14 +++++++
 .../x86/crypto/fips140/fips140-var-redirect.c |  0
 3 files changed, 36 insertions(+), 19 deletions(-)
 create mode 100644 arch/x86/crypto/fips140/Makefile
 create mode 100644 arch/x86/crypto/fips140/fips140-var-redirect.c

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index e04ff8718d6b6..e957739e80df1 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -4,42 +4,42 @@
 
 obj-$(CONFIG_CRYPTO_TWOFISH_586) += twofish-i586.o
 twofish-i586-y := twofish-i586-asm_32.o twofish_glue.o
-obj-$(CONFIG_CRYPTO_TWOFISH_X86_64) += twofish-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH_X86_64) += twofish-x86_64.o
 twofish-x86_64-y := twofish-x86_64-asm_64.o twofish_glue.o
-obj-$(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY) += twofish-x86_64-3way.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY) += twofish-x86_64-3way.o
 twofish-x86_64-3way-y := twofish-x86_64-asm_64-3way.o twofish_glue_3way.o
-obj-$(CONFIG_CRYPTO_TWOFISH_AVX_X86_64) += twofish-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH_AVX_X86_64) += twofish-avx-x86_64.o
 twofish-avx-x86_64-y := twofish-avx-x86_64-asm_64.o twofish_avx_glue.o
 
 obj-$(CONFIG_CRYPTO_SERPENT_SSE2_586) += serpent-sse2-i586.o
 serpent-sse2-i586-y := serpent-sse2-i586-asm_32.o serpent_sse2_glue.o
-obj-$(CONFIG_CRYPTO_SERPENT_SSE2_X86_64) += serpent-sse2-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_SERPENT_SSE2_X86_64) += serpent-sse2-x86_64.o
 serpent-sse2-x86_64-y := serpent-sse2-x86_64-asm_64.o serpent_sse2_glue.o
-obj-$(CONFIG_CRYPTO_SERPENT_AVX_X86_64) += serpent-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_SERPENT_AVX_X86_64) += serpent-avx-x86_64.o
 serpent-avx-x86_64-y := serpent-avx-x86_64-asm_64.o serpent_avx_glue.o
-obj-$(CONFIG_CRYPTO_SERPENT_AVX2_X86_64) += serpent-avx2.o
+crypto-objs-$(CONFIG_CRYPTO_SERPENT_AVX2_X86_64) += serpent-avx2.o
 serpent-avx2-y := serpent-avx2-asm_64.o serpent_avx2_glue.o
 
-obj-$(CONFIG_CRYPTO_CAMELLIA_X86_64) += camellia-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_X86_64) += camellia-x86_64.o
 camellia-x86_64-y := camellia-x86_64-asm_64.o camellia_glue.o
-obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64) += camellia-aesni-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64) += camellia-aesni-avx-x86_64.o
 camellia-aesni-avx-x86_64-y := camellia-aesni-avx-asm_64.o camellia_aesni_avx_glue.o
-obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64) += camellia-aesni-avx2.o
+crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64) += camellia-aesni-avx2.o
 camellia-aesni-avx2-y := camellia-aesni-avx2-asm_64.o camellia_aesni_avx2_glue.o
 
-obj-$(CONFIG_CRYPTO_BLOWFISH_X86_64) += blowfish-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_BLOWFISH_X86_64) += blowfish-x86_64.o
 blowfish-x86_64-y := blowfish-x86_64-asm_64.o blowfish_glue.o
 
-obj-$(CONFIG_CRYPTO_CAST5_AVX_X86_64) += cast5-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAST5_AVX_X86_64) += cast5-avx-x86_64.o
 cast5-avx-x86_64-y := cast5-avx-x86_64-asm_64.o cast5_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_CAST6_AVX_X86_64) += cast6-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAST6_AVX_X86_64) += cast6-avx-x86_64.o
 cast6-avx-x86_64-y := cast6-avx-x86_64-asm_64.o cast6_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_AEGIS128_AESNI_SSE2) += aegis128-aesni.o
+crypto-objs-$(CONFIG_CRYPTO_AEGIS128_AESNI_SSE2) += aegis128-aesni.o
 aegis128-aesni-y := aegis128-aesni-asm.o aegis128-aesni-glue.o
 
-obj-$(CONFIG_CRYPTO_AES_NI_INTEL) += aesni-intel.o
+crypto-objs-$(CONFIG_CRYPTO_AES_NI_INTEL) += aesni-intel.o
 aesni-intel-y := aesni-intel_asm.o aesni-intel_glue.o
 aesni-intel-$(CONFIG_64BIT) += aes-ctr-avx-x86_64.o \
 			       aes-gcm-aesni-x86_64.o \
@@ -47,17 +47,20 @@ aesni-intel-$(CONFIG_64BIT) += aes-ctr-avx-x86_64.o \
 			       aes-gcm-vaes-avx512.o \
 			       aes-xts-avx-x86_64.o
 
-obj-$(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64) += sm4-aesni-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64) += sm4-aesni-avx-x86_64.o
 sm4-aesni-avx-x86_64-y := sm4-aesni-avx-asm_64.o sm4_aesni_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64) += sm4-aesni-avx2-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64) += sm4-aesni-avx2-x86_64.o
 sm4-aesni-avx2-x86_64-y := sm4-aesni-avx2-asm_64.o sm4_aesni_avx2_glue.o
 
-obj-$(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64) += aria-aesni-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64) += aria-aesni-avx-x86_64.o
 aria-aesni-avx-x86_64-y := aria-aesni-avx-asm_64.o aria_aesni_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64) += aria-aesni-avx2-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64) += aria-aesni-avx2-x86_64.o
 aria-aesni-avx2-x86_64-y := aria-aesni-avx2-asm_64.o aria_aesni_avx2_glue.o
 
-obj-$(CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64) += aria-gfni-avx512-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64) += aria-gfni-avx512-x86_64.o
 aria-gfni-avx512-x86_64-y := aria-gfni-avx512-asm_64.o aria_gfni_avx512_glue.o
+
+# FIPS 140 kernel module
+obj-$(CONFIG_CRYPTO_FIPS140_EXTMOD) += fips140/
\ No newline at end of file
diff --git a/arch/x86/crypto/fips140/Makefile b/arch/x86/crypto/fips140/Makefile
new file mode 100644
index 0000000000000..a7a5259a43ab6
--- /dev/null
+++ b/arch/x86/crypto/fips140/Makefile
@@ -0,0 +1,14 @@
+
+crypto-objs-y += fips140-var-redirect-fips.o
+
+obj-y += fips140-var-redirect-main.o
+
+# Explicit rules to compile same source to different objects
+$(obj)/fips140-var-redirect-main.o: $(src)/fips140-var-redirect.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+$(obj)/fips140-var-redirect-fips.o: $(src)/fips140-var-redirect.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+CFLAGS_fips140-var-redirect-main.o += -I$(srctree)
+CFLAGS_fips140-var-redirect-fips.o += -I$(srctree)
diff --git a/arch/x86/crypto/fips140/fips140-var-redirect.c b/arch/x86/crypto/fips140/fips140-var-redirect.c
new file mode 100644
index 0000000000000..e69de29bb2d1d
-- 
2.47.3


