Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE14CEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9xVZl3sdeGF6Ya902sDlUVvmuvw7uaw3NmZceFV1g0=; b=CnT08iXKNMgP8V6Ero6R7j+hda
	HnDG8hPLfEdkjHlSIXCsIhdy1nn7CqJTzvxiMF3sza5DrQlVZrX9GWMptsy3mQD00ciPHgA3DQqUV
	rlf4n9pzvFebUIpjoYbHgVZ6qJD4zrgiJKtsPftO/zLgSGZiNlA0V/LtE1c/macIne1u5r8cutplX
	JBL2lSncg4bGvdy5OM2Rx+kAAWZ9YJEjOJJz/WMkrLqg/Mc35u1vfZS/b/RybldCAGB2kJdLfuHSV
	GLAEZTKUHEzRQ+dYfMCu1EcFl8ARnfadag49ppRecjAVO6TVTaaXDsgUqJ9gY4cy5520lG8NtK69B
	roEa9t+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNC7-00000001Xmd-2JuG;
	Thu, 12 Feb 2026 03:16:43 +0000
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.35.192.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNC5-00000001XlL-1PPd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866201; x=1802402201;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C9xVZl3sdeGF6Ya902sDlUVvmuvw7uaw3NmZceFV1g0=;
  b=hju7VmTC6KOKhmFyAY9wDP8vwXbr3dDxCQzFgaBd6RnJdbMiS9I948H+
   b0hTVEiIIPcUCYfzzL4kW7kgqCvG9xXtJ1az+Ect8UKyQ4wDEDMllYp88
   o5SrRtKdtGEMu8A1XBMRQs5M/Ox3tNxmnUAfPxIPS1XnoB9FM/LVKsrBK
   TqeQQy45RFQ4j+7pzlg58fWrDVBaNostFvxfgwGG/nrX4OOU2pHoRQfIx
   8g51Z/V3XeDBhhsd3Nj1tTjcDP/kdESJj/0thv/eQDdeD4XpTdKoo8icZ
   vDv2Z6875p1/pHLGNd2GUaEEOf5gA1ZTq9g3FfoYdQjBS/AfRyK3cVI5+
   A==;
X-CSE-ConnectionGUID: RglpM7AJQkGzp0DYzHYivg==
X-CSE-MsgGUID: nWLJa0aHTce18tyZmGBIkQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12699062"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:16:40 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:26714]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id eb866636-a431-4b16-a96b-8a686dda8811; Thu, 12 Feb 2026 03:16:39 +0000 (UTC)
X-Farcaster-Flow-ID: eb866636-a431-4b16-a96b-8a686dda8811
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:16:39 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:16:39 +0000
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
Subject: [PATCH 05/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SERPENT_SSE2_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:03 +0000
Message-ID: <20260212031521.2124-6-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWB001.ant.amazon.com (10.13.139.187) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191641_428676_BA040CC2 
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
CONFIG_CRYPTO_SERPENT_SSE2_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile            | 2 +-
 arch/x86/crypto/serpent_sse2_glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index c1236012784d..986ed1d64b51 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -13,7 +13,7 @@ twofish-avx-x86_64-y := twofish-avx-x86_64-asm_64.o twofish_avx_glue.o
 
 obj-$(CONFIG_CRYPTO_SERPENT_SSE2_586) += serpent-sse2-i586.o
 serpent-sse2-i586-y := serpent-sse2-i586-asm_32.o serpent_sse2_glue.o
-obj-$(CONFIG_CRYPTO_SERPENT_SSE2_X86_64) += serpent-sse2-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_SERPENT_SSE2_X86_64) += serpent-sse2-x86_64.o
 serpent-sse2-x86_64-y := serpent-sse2-x86_64-asm_64.o serpent_sse2_glue.o
 obj-$(CONFIG_CRYPTO_SERPENT_AVX_X86_64) += serpent-avx-x86_64.o
 serpent-avx-x86_64-y := serpent-avx-x86_64-asm_64.o serpent_avx_glue.o
diff --git a/arch/x86/crypto/serpent_sse2_glue.c b/arch/x86/crypto/serpent_sse2_glue.c
index 80ee17ec21b4..0091c88d26cf 100644
--- a/arch/x86/crypto/serpent_sse2_glue.c
+++ b/arch/x86/crypto/serpent_sse2_glue.c
@@ -116,8 +116,8 @@ static void __exit serpent_sse2_exit(void)
 	crypto_unregister_skciphers(serpent_algs, ARRAY_SIZE(serpent_algs));
 }
 
-module_init(serpent_sse2_init);
-module_exit(serpent_sse2_exit);
+crypto_module_init(serpent_sse2_init);
+crypto_module_exit(serpent_sse2_exit);
 
 MODULE_DESCRIPTION("Serpent Cipher Algorithm, SSE2 optimized");
 MODULE_LICENSE("GPL");
-- 
2.47.3


