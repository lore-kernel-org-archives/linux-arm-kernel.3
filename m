Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A41EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKekGaHkY9fyNUE3F7u6mii6wirT5AB2k2+JZzcvE8M=; b=Is3+NGfbMUN4T8+GbWLBlyogbx
	My6u/BBd/KLrAjDb+TrbIUM9PcnYgUShH3M3VuUFd95XiyC01na1md7qmSexSUXzDmx37c0m2gU7o
	ceoOfrBVT2XsBD5geLCLcpv4218CdroNxyWyBmyvvvdkd1grB4RK1ZN8vaAsF9Njs3BXujBsctpTL
	k+K2Wj8KOZO4c5+h/I2y3D8Tb82qQiGwe4/Mmm2gxdtuHYqdEbG6ouSPjsnv4nsRJFRrUQS7rh/ji
	t2yko8Vv+3ohcBffuwBkNFW196kzL6MIoc0I7fLMGujM8FBPWm9oisROhTSL4/fMlMwwMThgIOFwu
	vXYTcm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNBc-00000001XXv-1a3w;
	Thu, 12 Feb 2026 03:16:12 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNBa-00000001XX1-0wNF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866170; x=1802402170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LKekGaHkY9fyNUE3F7u6mii6wirT5AB2k2+JZzcvE8M=;
  b=VRlzJhoAVKWMzkqAK5kqNJAvKqMVGggH7CRxMBP011mYl1PQkXBuSIaC
   ek7FszeHQwvWxGue8nEzz/8nmqyL1XUBxLVo5FQvqAump8VpHMXOkUkjx
   0fvkSh/qgIi5bJT2SXZd26FP4tau3U98D0j3GnhdnDQyy+kGCTnkRuEVa
   JigYbHgEybzgrNgYZAMPZoepCdlaIRhq2IAkOKPg9G82nqsPUCQmO0BDb
   5gVq3dpxU0dAKoZkomABDTkls3KorrFrOjsF26kovslKPpPiO+7EqMhuv
   o6HAlzy/9U+J5yqi5pOZ+rJ+Man/HQHSrwfhCUsMZ4yGWFBmiEBAiMbwN
   Q==;
X-CSE-ConnectionGUID: tNB0Y13qSi+0/ah4RJSkLg==
X-CSE-MsgGUID: 50nH3G+FQau4XB4d4wDD/A==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12697578"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:16:09 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:21170]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id 52878b05-dfb2-4564-858c-1d5a74177643; Thu, 12 Feb 2026 03:16:09 +0000 (UTC)
X-Farcaster-Flow-ID: 52878b05-dfb2-4564-858c-1d5a74177643
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:16:08 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:16:08 +0000
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
Subject: [PATCH 03/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_TWOFISH_X86_64_3WAY crypto
Date: Thu, 12 Feb 2026 03:15:01 +0000
Message-ID: <20260212031521.2124-4-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D038UWC002.ant.amazon.com (10.13.139.238) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191610_309959_423A525D 
X-CRM114-Status: GOOD (  11.26  )
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
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              |  2 +-
 arch/x86/crypto/fips140/fips140-api.c | 13 +++++++++++++
 arch/x86/crypto/twofish.h             | 13 +++++++++----
 arch/x86/crypto/twofish_glue_3way.c   |  4 ++--
 4 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index ed8958bffbc9..f224f5206bbb 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -6,7 +6,7 @@ obj-$(CONFIG_CRYPTO_TWOFISH_586) += twofish-i586.o
 twofish-i586-y := twofish-i586-asm_32.o twofish_glue.o
 crypto-objs-$(CONFIG_CRYPTO_TWOFISH_X86_64) += twofish-x86_64.o
 twofish-x86_64-y := twofish-x86_64-asm_64.o twofish_glue.o
-obj-$(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY) += twofish-x86_64-3way.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY) += twofish-x86_64-3way.o
 twofish-x86_64-3way-y := twofish-x86_64-asm_64-3way.o twofish_glue_3way.o
 obj-$(CONFIG_CRYPTO_TWOFISH_AVX_X86_64) += twofish-avx-x86_64.o
 twofish-avx-x86_64-y := twofish-avx-x86_64-asm_64.o twofish_avx_glue.o
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index bb8ca949caef..a1a207fa34cd 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -8,4 +8,17 @@
 DEFINE_CRYPTO_API_STUB(twofish_enc_blk);
 DEFINE_CRYPTO_API_STUB(twofish_dec_blk);
 
+#endif
+
+/*
+ * arch/x86/crypto/twofish_glue_3way.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY)
+
+#include <arch/x86/crypto/twofish.h>
+
+DEFINE_CRYPTO_API_STUB(__twofish_enc_blk_3way);
+DEFINE_CRYPTO_API_STUB(twofish_dec_blk_3way);
+DEFINE_CRYPTO_API_STUB(twofish_dec_blk_cbc_3way);
+
 #endif
\ No newline at end of file
diff --git a/arch/x86/crypto/twofish.h b/arch/x86/crypto/twofish.h
index c44d2f53ee11..3ee4caa05428 100644
--- a/arch/x86/crypto/twofish.h
+++ b/arch/x86/crypto/twofish.h
@@ -16,11 +16,16 @@ DECLARE_CRYPTO_API(CONFIG_CRYPTO_TWOFISH_X86_64, twofish_dec_blk, asmlinkage voi
 	(ctx, dst, src));
 
 /* 3-way parallel cipher functions */
-asmlinkage void __twofish_enc_blk_3way(const void *ctx, u8 *dst, const u8 *src,
-				       bool xor);
-asmlinkage void twofish_dec_blk_3way(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY, __twofish_enc_blk_3way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src, bool xor),
+	(ctx, dst, src, xor));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY, twofish_dec_blk_3way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 /* helpers from twofish_x86_64-3way module */
-extern void twofish_dec_blk_cbc_3way(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY, twofish_dec_blk_cbc_3way, void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 #endif /* ASM_X86_TWOFISH_H */
diff --git a/arch/x86/crypto/twofish_glue_3way.c b/arch/x86/crypto/twofish_glue_3way.c
index 8ad77725bf60..996753732402 100644
--- a/arch/x86/crypto/twofish_glue_3way.c
+++ b/arch/x86/crypto/twofish_glue_3way.c
@@ -161,8 +161,8 @@ static void __exit twofish_3way_fini(void)
 	crypto_unregister_skciphers(tf_skciphers, ARRAY_SIZE(tf_skciphers));
 }
 
-module_init(twofish_3way_init);
-module_exit(twofish_3way_fini);
+crypto_module_init(twofish_3way_init);
+crypto_module_exit(twofish_3way_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Twofish Cipher Algorithm, 3-way parallel asm optimized");
-- 
2.47.3


