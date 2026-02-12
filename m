Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79873EDF023
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUt3E0bw1JOFhiOnnpZ3GNQ3ovfILofeZPuYyuxvGCQ=; b=RZmaBkVe7xMw3Q4kBgTYboO8uf
	FRhKRbE7/grbKoAthgAAgk22tH2JjillBnwIp946f9U0NAaeRaEBmTxwpN9RRVy1SIL3ZNXJ7hM1U
	7C0oOCK44fvhOo0v1cPwzYMeNRdhAmABEQ4/DqQBZUp3H5CRZ2DxjyM8IEx7IcFz7ZCpfIUr68AiF
	gSwZ66RaasUEF0NE9CJdTm8Y8KODYLNi9OG1EOV64O6wCiKvUoctmv4h3LsCac1I4RFpOuwgvOAtC
	jHxN42QAe/EeFNqr0QhiXrkVprU6UM28P0PezTmzusylXgNMae2jJiq1+aKiVy3DR9X7ARQmOiM4Y
	9Tyvm6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN68-00000001VMR-3PhF;
	Thu, 12 Feb 2026 03:10:32 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN66-00000001VKf-11lx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865830; x=1802401830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oUt3E0bw1JOFhiOnnpZ3GNQ3ovfILofeZPuYyuxvGCQ=;
  b=cXVsR+oMutXo3Zs1TaDfFdiU6GPdVgHineYvsMO2CFA0uYkt5x4YFTi9
   GUOlTJemxOyW51W3RVZHxYilddDNHhRXynKzMx1nWkS2tTpkVsJcYQE1Q
   NC+acBDlUy+nMGsVSKz7DFBWcK4z1KxlDTcGJI31Xo+UD4y5t9E8LeCNt
   7vYvNrwph/1XrJ6BXYqIpXkDYgzbOQ+8mA3KpqfsueUzSwzBu4yrLTLle
   zzI1ePBbB960GCNr2sBiggv7IrETnGi+dioONydjL8xjq7WrMvyjeGpbf
   WYvUzOGZXxFqDykGpEWnuJDFTmxLh3iTz+gyI85UFyQxOKLsVCYzhcoMN
   A==;
X-CSE-ConnectionGUID: G82QdE3cQBW4zod7BXqXLA==
X-CSE-MsgGUID: FSXSqSsXQRCId5lJU1Si8g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744640"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:10:29 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:25373]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.165:2525] with esmtp (Farcaster)
 id 66029a14-84c5-4afd-943d-452e9121052e; Thu, 12 Feb 2026 03:10:29 +0000 (UTC)
X-Farcaster-Flow-ID: 66029a14-84c5-4afd-943d-452e9121052e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:10:29 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:10:28 +0000
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
Subject: [PATCH 089/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ZSTD crypto
Date: Thu, 12 Feb 2026 02:47:05 +0000
Message-ID: <20260212024725.11264-90-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191030_568327_ECA44A53 
X-CRM114-Status: GOOD (  10.57  )
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
CONFIG_CRYPTO_ZSTD-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/zstd.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 3f4cd954ef06..c4516e1943a7 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -177,7 +177,7 @@ crypto-objs-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
-obj-$(CONFIG_CRYPTO_ZSTD) += zstd.o
+crypto-objs-$(CONFIG_CRYPTO_ZSTD) += zstd.o
 crypto-objs-$(CONFIG_CRYPTO_ECC) += ecc.o
 obj-$(CONFIG_CRYPTO_ESSIV) += essiv.o
 
diff --git a/crypto/zstd.c b/crypto/zstd.c
index cbbd0413751a..3b9fe204c68c 100644
--- a/crypto/zstd.c
+++ b/crypto/zstd.c
@@ -307,8 +307,8 @@ static void __exit zstd_mod_fini(void)
 	crypto_acomp_free_streams(&zstd_streams);
 }
 
-module_init(zstd_mod_init);
-module_exit(zstd_mod_fini);
+crypto_module_init(zstd_mod_init);
+crypto_module_exit(zstd_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Zstd Compression Algorithm");
-- 
2.47.3


