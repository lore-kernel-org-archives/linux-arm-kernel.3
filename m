Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB77EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgWXkyIPLdLVrz1oYfmfohyYibJRTPWePEj/hR07ubo=; b=H7PatP+g+OvInpToA+gPiwuKVo
	iIXOkPz1AqkxzAwN3Jp+GpnGx/CN3inLI1/PaL/XTasd63UpgfDipCN3fH354TOCsSMK+sekhUGN4
	D16x7KaktAHeEjmzbkAgQUXda2ugWAeSM5+CUwfYTgSNGdHX+F5eQE7WFafIgy4fWZhtXiOddqGfX
	Jd3wCWRerKx1f7E2W8Ai4KFu6VB0JB+ehjaIhVp1lcdgBISYW2AR9QmfOLPc6X9oVyi0d2ftwGL0F
	9koP+aA0/rhHXGxX0C5VzO+iz0ldLb5frmulVA9CO1N7M69lkfKJPNhVl7NyrDigiqiO+FQBJ3kpU
	tWaOYz3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNBw-00000001Xh9-11VD;
	Thu, 12 Feb 2026 03:16:32 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNBr-00000001Xfe-2mjs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866187; x=1802402187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dgWXkyIPLdLVrz1oYfmfohyYibJRTPWePEj/hR07ubo=;
  b=CE7MKtt7IgNn6LphgtNKN4d4e9dm3Ut5/EJACCXT5W9YVuRdI30b/kFO
   kU0yZPXZ52R2jTiiMqYyJ1oyuGEJZ8NVEbbfUZmnffNP9fHnk+Tb+H4DJ
   y/Qvf7dmZwZ4lpFdBBIGFQvOt72FrKIBPxYUzsUbYJqiCO1fKaIb5846f
   IAbZN5pRvxgbnn5KokY/fVQlBG1Pa4fChNyeijkx/fCtezzI3MGBLfEZy
   gmTbST4CLVy4nPaYf+rDQ00lLRMcV+NBIyAneBxclb2FWyOCbhcyPNr7m
   YyDGihPewEpJGUHFNJ1PRKVfpOc2554kNVcLhxq6dHlSGfiwpXUTo6Eku
   A==;
X-CSE-ConnectionGUID: B59D4Q1zQr+Ghw8kprTntw==
X-CSE-MsgGUID: z+EsdPFUS7+Voj26JOr8kw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12920579"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:16:25 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:8901]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id ed760514-683c-4f1f-8b51-b90f17febc78; Thu, 12 Feb 2026 03:16:25 +0000 (UTC)
X-Farcaster-Flow-ID: ed760514-683c-4f1f-8b51-b90f17febc78
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:16:24 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:16:23 +0000
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
Subject: [PATCH 04/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_TWOFISH_AVX_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:02 +0000
Message-ID: <20260212031521.2124-5-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWB003.ant.amazon.com (10.13.139.174) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191629_916044_40A7E9EF 
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
CONFIG_CRYPTO_TWOFISH_AVX_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile           | 2 +-
 arch/x86/crypto/twofish_avx_glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index f224f5206bbb..c1236012784d 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -8,7 +8,7 @@ crypto-objs-$(CONFIG_CRYPTO_TWOFISH_X86_64) += twofish-x86_64.o
 twofish-x86_64-y := twofish-x86_64-asm_64.o twofish_glue.o
 crypto-objs-$(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY) += twofish-x86_64-3way.o
 twofish-x86_64-3way-y := twofish-x86_64-asm_64-3way.o twofish_glue_3way.o
-obj-$(CONFIG_CRYPTO_TWOFISH_AVX_X86_64) += twofish-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH_AVX_X86_64) += twofish-avx-x86_64.o
 twofish-avx-x86_64-y := twofish-avx-x86_64-asm_64.o twofish_avx_glue.o
 
 obj-$(CONFIG_CRYPTO_SERPENT_SSE2_586) += serpent-sse2-i586.o
diff --git a/arch/x86/crypto/twofish_avx_glue.c b/arch/x86/crypto/twofish_avx_glue.c
index 9e20db013750..0446ce446634 100644
--- a/arch/x86/crypto/twofish_avx_glue.c
+++ b/arch/x86/crypto/twofish_avx_glue.c
@@ -118,8 +118,8 @@ static void __exit twofish_exit(void)
 	crypto_unregister_skciphers(twofish_algs, ARRAY_SIZE(twofish_algs));
 }
 
-module_init(twofish_init);
-module_exit(twofish_exit);
+crypto_module_init(twofish_init);
+crypto_module_exit(twofish_exit);
 
 MODULE_DESCRIPTION("Twofish Cipher Algorithm, AVX optimized");
 MODULE_LICENSE("GPL");
-- 
2.47.3


