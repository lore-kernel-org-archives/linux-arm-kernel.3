Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4D8EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Khd4IrezYwBcwL4fTfPoA/BZFLTNYjIcAIt3G2bI1ns=; b=0tGVWTaDEpNr+eDFaD5Il5fQTP
	2p+IKLtwQx1hUCX5tgiu4Iyr2wV35pxuwg4FcaEqq+YBBZpWAnLqZ0EAx+Kncar/Lvxrqj/QO/tnH
	6rd2rNbteYzSNLx9aOlQQPGKdYLpO/QV477zRCSCGJbcZAThpaI78UBuTf901tc4SBOvv+MZIQTNO
	nk8GTS3nE1DAHdYB3k+Ur6ehS9gRtpHsAHoUY8RH/eYKGv7orVErMMEjMZc5tExyF/UpfqP7mcEaY
	UrIIa8L6daUOhp2m0PCcw7+QGyv9OQE1lZoq0EzhuavY+3JrwYBRsT020cTt3OUxOVarx4CzlokRu
	wZI89U+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNBO-00000001XTC-2yts;
	Thu, 12 Feb 2026 03:15:58 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNBJ-00000001XRW-3KON
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866153; x=1802402153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Khd4IrezYwBcwL4fTfPoA/BZFLTNYjIcAIt3G2bI1ns=;
  b=Or5Xa0FRoDrHh4YxU+IoBNK1p7VCRJqiS7xKNP9GsbVy1VM+mUopO/eD
   ifPDb3JcKErXuS4rkEmZUjDXxtHQuGOUCjHr0vUuGnGwDUyh42MZgDUDj
   SU8pRlw7mYvA26LC2YLD1KGNu/88bSqSiXj2dWdkDjJB0i7phn3Eaj3y4
   ZOZRKB0SfxzU9vHB+4IfjF95DI7XqR+L4ujEjUmHC/ATv9iqYuQ2BAMuE
   2tV0cW0aQcPQYYFYVMUxw+j8/srBs7nxzUq62LrVXRjX7yHiRTjRjMLWi
   eKHfqMZqsfyodMZluDtFcVnfGanuc2M+ciALzpveQbAm7R2luM5gjC2yh
   Q==;
X-CSE-ConnectionGUID: BxlQrjRxRTCucEGKREG5Pg==
X-CSE-MsgGUID: 9KUPbNLtS9ezzM8XwSsBzw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919961"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:15:53 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:13910]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id ac7124a3-aca6-461a-b62d-dcdaec4fba08; Thu, 12 Feb 2026 03:15:53 +0000 (UTC)
X-Farcaster-Flow-ID: ac7124a3-aca6-461a-b62d-dcdaec4fba08
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:15:53 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:15:52 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Luis Chamberlain
	<mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kbuild@vger.kernel.org>, <linux-modules@vger.kernel.org>
Subject: [PATCH 02/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_TWOFISH_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:00 +0000
Message-ID: <20260212031521.2124-3-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D043UWC004.ant.amazon.com (10.13.139.206) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191553_882874_402F7C04 
X-CRM114-Status: GOOD (  12.71  )
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

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_TWOFISH_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              |  2 +-
 arch/x86/crypto/fips140/fips140-api.c | 11 +++++++++++
 arch/x86/crypto/twofish.h             |  9 +++++++--
 arch/x86/crypto/twofish_glue.c        |  4 ++--
 4 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 27010cb2326c..ed8958bffbc9 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -4,7 +4,7 @@
 
 obj-$(CONFIG_CRYPTO_TWOFISH_586) += twofish-i586.o
 twofish-i586-y := twofish-i586-asm_32.o twofish_glue.o
-obj-$(CONFIG_CRYPTO_TWOFISH_X86_64) += twofish-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH_X86_64) += twofish-x86_64.o
 twofish-x86_64-y := twofish-x86_64-asm_64.o twofish_glue.o
 obj-$(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY) += twofish-x86_64-3way.o
 twofish-x86_64-3way-y := twofish-x86_64-asm_64-3way.o twofish_glue_3way.o
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index e69de29bb2d1..bb8ca949caef 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -0,0 +1,11 @@
+/*
+ * arch/x86/crypto/twofish_glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_TWOFISH_X86_64)
+
+#include <arch/x86/crypto/twofish.h>
+
+DEFINE_CRYPTO_API_STUB(twofish_enc_blk);
+DEFINE_CRYPTO_API_STUB(twofish_dec_blk);
+
+#endif
\ No newline at end of file
diff --git a/arch/x86/crypto/twofish.h b/arch/x86/crypto/twofish.h
index 12df400e6d53..c44d2f53ee11 100644
--- a/arch/x86/crypto/twofish.h
+++ b/arch/x86/crypto/twofish.h
@@ -2,13 +2,18 @@
 #ifndef ASM_X86_TWOFISH_H
 #define ASM_X86_TWOFISH_H
 
+#include <crypto/api.h>
 #include <linux/crypto.h>
 #include <crypto/twofish.h>
 #include <crypto/b128ops.h>
 
 /* regular block cipher functions from twofish_x86_64 module */
-asmlinkage void twofish_enc_blk(const void *ctx, u8 *dst, const u8 *src);
-asmlinkage void twofish_dec_blk(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_TWOFISH_X86_64, twofish_enc_blk, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_TWOFISH_X86_64, twofish_dec_blk, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 /* 3-way parallel cipher functions */
 asmlinkage void __twofish_enc_blk_3way(const void *ctx, u8 *dst, const u8 *src,
diff --git a/arch/x86/crypto/twofish_glue.c b/arch/x86/crypto/twofish_glue.c
index 8e9906d36902..8787a1d2cec4 100644
--- a/arch/x86/crypto/twofish_glue.c
+++ b/arch/x86/crypto/twofish_glue.c
@@ -91,8 +91,8 @@ static void __exit twofish_glue_fini(void)
 	crypto_unregister_alg(&alg);
 }
 
-module_init(twofish_glue_init);
-module_exit(twofish_glue_fini);
+crypto_module_init(twofish_glue_init);
+crypto_module_exit(twofish_glue_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION ("Twofish Cipher Algorithm, asm optimized");
-- 
2.47.3


