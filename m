Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51856EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ks5RRjIgkxTbfasAWkG78UQ32BoSv39pFoWSn/7AVNI=; b=EthQgIWfU5dwImpUSK49bGe/GI
	N6+6fR78K9ZZfIQdI0Gnr9mbvweF81HBvRqJSfnm6Io0AKPSGnxAFERXD+4hxhykSgLv5ZzwCNKjh
	RDZFUNnbRKwLKzjKbWzJAbGNuP+tXxRpVTJ/5zAmnBketgL0Mr7zr4q+d2d2PD99c3HHvVO8Ecy4r
	j3oh9UStrPND+nf88TjIoXN/C1pM/U7Wd4SZTJK8ne9FV2z8VGVdKL/jNEF/2azXiBENv3V70KPB5
	wyPlmQJzHxV7YNrsxNyqFtuQA5KrFmz3XvzsPv4dDlhq2ZiikzPmhwuElbephc0qXNCoWrbtcVEti
	aESG2TeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNCr-00000001Y8W-1ZtA;
	Thu, 12 Feb 2026 03:17:29 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNCp-00000001Y6m-0XQx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866247; x=1802402247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ks5RRjIgkxTbfasAWkG78UQ32BoSv39pFoWSn/7AVNI=;
  b=HcWxPFfY5Xx4A0ZqjaSrkjPJmeRxTTLOPokRmSuENWJCIg9uAKwhRJKx
   sZZ3QeUsAJ9OZboEC9PtRXnSGwUgv+/AImbPStMGdo+y957Gx5Hljk7Xm
   una0EuSQqnmdRKJGPC8LjpoCT0UjMZn3HUMsTUl20tM3Zmh5LxE4ZUYnG
   BsLmUndQ8x4lRNJprE3FCRckI/GPduGJRQ6mWxw62Qr3tHm71Ei3rezkQ
   ia+txZU/+maQBqW4WlfO0DZzB4HSQ67Fz63fjoTA0gjCcAxAmARL7JLGD
   7blke37jx1jNzdYx0j825ZLpNqtwxCk6BT7sqOBzpqf1L5X+2TGZLJ+RL
   A==;
X-CSE-ConnectionGUID: oQvgtM6sRpOitCMX/AZjzw==
X-CSE-MsgGUID: 9ldyTFF4Tiq3Er7oO076KQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12804115"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:17:26 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:25165]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 7a096068-6ef6-4dd8-8351-a0bdce9aad5a; Thu, 12 Feb 2026 03:17:26 +0000 (UTC)
X-Farcaster-Flow-ID: 7a096068-6ef6-4dd8-8351-a0bdce9aad5a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:17:26 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:17:25 +0000
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
Subject: [PATCH 08/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_DES3_EDE_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:06 +0000
Message-ID: <20260212031521.2124-9-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D032UWA002.ant.amazon.com (10.13.139.81) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191727_217000_E613D6FA 
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
CONFIG_CRYPTO_DES3_EDE_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile        | 2 +-
 arch/x86/crypto/des3_ede_glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 5f7d35f8d313..7118a7dba3c6 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -20,7 +20,7 @@ serpent-avx-x86_64-y := serpent-avx-x86_64-asm_64.o serpent_avx_glue.o
 crypto-objs-$(CONFIG_CRYPTO_SERPENT_AVX2_X86_64) += serpent-avx2.o
 serpent-avx2-y := serpent-avx2-asm_64.o serpent_avx2_glue.o
 
-obj-$(CONFIG_CRYPTO_DES3_EDE_X86_64) += des3_ede-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_DES3_EDE_X86_64) += des3_ede-x86_64.o
 des3_ede-x86_64-y := des3_ede-asm_64.o des3_ede_glue.o
 
 obj-$(CONFIG_CRYPTO_CAMELLIA_X86_64) += camellia-x86_64.o
diff --git a/arch/x86/crypto/des3_ede_glue.c b/arch/x86/crypto/des3_ede_glue.c
index 34600f90d8a6..1d1ce0f862ff 100644
--- a/arch/x86/crypto/des3_ede_glue.c
+++ b/arch/x86/crypto/des3_ede_glue.c
@@ -381,8 +381,8 @@ static void __exit des3_ede_x86_fini(void)
 				    ARRAY_SIZE(des3_ede_skciphers));
 }
 
-module_init(des3_ede_x86_init);
-module_exit(des3_ede_x86_fini);
+crypto_module_init(des3_ede_x86_init);
+crypto_module_exit(des3_ede_x86_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Triple DES EDE Cipher Algorithm, asm optimized");
-- 
2.47.3


