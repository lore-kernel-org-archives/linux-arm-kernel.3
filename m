Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2D3EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=319tCJAPzApml1aFj+kf+ZB/EmPdDNhoGau5ahSPZ1c=; b=aokXueEIZzh8jTQB/A+NFHBSL4
	qogq4UJ186ode+6YsZ1w1EF4msLxEgkirAL91Ip8+T+k2elGV6SdPm16xD0n8ziqM1WUDMNkp9QUi
	BObQ88U/wz3hWYOT10MStwPgdcqv7dv+8/35ItgGXdmlnF0HT+bkoSBWBKVqjVBKtenjArdhfJRym
	zdb0sC+xsOpLADGLJfJjCv/Tw8jShIwp7Y/xgVVkHA5/shI4tglmfgQj+MvKLkCgd4uXmRx/Ge5hp
	TAI5nitSBimJD2aMFEjxJQOuNKUmKuwA4AKdwWMOObgbYCLyOcCbSvQD0ZEHnCbfyuAvppcwbSkfI
	+Zpao8dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNE8-00000001YgW-16Ep;
	Thu, 12 Feb 2026 03:18:48 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNE4-00000001YeP-3Nvi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866324; x=1802402324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=319tCJAPzApml1aFj+kf+ZB/EmPdDNhoGau5ahSPZ1c=;
  b=s5Zn7p+XFbcWqRLZ1KeHxpwyV5qVTbTsD8MWtNOKSqUr3M5XCSxXm0vx
   +dpsnmkdAYN0qzHMY0uAUsy8g/6WjI+tujreb37Bx//Tg500YUqld17TF
   HnXfQeZhLBHZ27xX/+9XEqYgcQZI4CYMarWLZsRf9DzUnrq5DkyLHE7re
   FM3GQieogfnEdek/oVy048O1P6jHA9FwAMskZc+I7DWel5+ao3gRXcT1n
   1whkOe7N8gi5tZuNqfiUcjyEThRG+EjxFRbMHpqw/Fp5ndbiKoRK5/ix3
   P6/TAgiiRpFHpr5RR69xXIcNeexiOB12wqUHYf0pqCxgO+qRbIjHjJgxh
   Q==;
X-CSE-ConnectionGUID: 6MSooECPSYesyqd49qi6Ng==
X-CSE-MsgGUID: l8WSV7JKTa+nDEUCMcGpCA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744907"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:18:44 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:11484]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id b6835c7f-22ed-4649-b1c7-9322ccfd9e37; Thu, 12 Feb 2026 03:18:44 +0000 (UTC)
X-Farcaster-Flow-ID: b6835c7f-22ed-4649-b1c7-9322ccfd9e37
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:18:43 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:18:43 +0000
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
Subject: [PATCH 13/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_BLOWFISH_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:11 +0000
Message-ID: <20260212031521.2124-14-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWB004.ant.amazon.com (10.13.139.164) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191845_192872_DA5000B0 
X-CRM114-Status: GOOD (  10.74  )
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
CONFIG_CRYPTO_BLOWFISH_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile        | 2 +-
 arch/x86/crypto/blowfish_glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 7e68f6bcfa29..cfef8fbfba8f 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -30,7 +30,7 @@ camellia-aesni-avx-x86_64-y := camellia-aesni-avx-asm_64.o camellia_aesni_avx_gl
 crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64) += camellia-aesni-avx2.o
 camellia-aesni-avx2-y := camellia-aesni-avx2-asm_64.o camellia_aesni_avx2_glue.o
 
-obj-$(CONFIG_CRYPTO_BLOWFISH_X86_64) += blowfish-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_BLOWFISH_X86_64) += blowfish-x86_64.o
 blowfish-x86_64-y := blowfish-x86_64-asm_64.o blowfish_glue.o
 
 crypto-objs-$(CONFIG_CRYPTO_CAST5_AVX_X86_64) += cast5-avx-x86_64.o
diff --git a/arch/x86/crypto/blowfish_glue.c b/arch/x86/crypto/blowfish_glue.c
index 26c5f2ee5d10..48b20bc3bd54 100644
--- a/arch/x86/crypto/blowfish_glue.c
+++ b/arch/x86/crypto/blowfish_glue.c
@@ -187,8 +187,8 @@ static void __exit blowfish_fini(void)
 				    ARRAY_SIZE(bf_skcipher_algs));
 }
 
-module_init(blowfish_init);
-module_exit(blowfish_fini);
+crypto_module_init(blowfish_init);
+crypto_module_exit(blowfish_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Blowfish Cipher Algorithm, asm optimized");
-- 
2.47.3


