Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7043EDF022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoPmFpm9N8PVSdQbWTHgmeK+0qipWTL5L3vL+6JEhVw=; b=eTTu8oQy/7BZrAysdhS8o9hRi/
	C4OjNl0Z9uxh3FMkxLog+VGw2cWvaX8CptATVZep5FmkzB/TYbkHlVmu2WkW0cDuX2SNJ2fLQ+hIN
	EMWRGslUdjbOeHNQ05s1J2+1CyoXmaguCWfNZAvD+vOQ5afn0Fy5MGIi7C5NH2Wp78PskHzUglj58
	q6MHGRHQzcp4z4uyKoaxq6bkDBFHNudU8h8NfjKwWKc/MzGZJZBnzthmfvfRt0qcfc0zrcHa7sZ7o
	RJbLSXejjfsLsyrR42/sY5PqJelLM9DZZFFbkMqy56fiY3FMvay6zL/ZKPA8tHtB+ciVUY/lFv8SB
	r9ATTigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN4f-00000001UjE-0m8u;
	Thu, 12 Feb 2026 03:09:02 +0000
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.68.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN4a-00000001Uh5-318C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865736; x=1802401736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WoPmFpm9N8PVSdQbWTHgmeK+0qipWTL5L3vL+6JEhVw=;
  b=T7KYLLvchN3Caiv6wX7P3OxHWTqdK763IBthzwLwwS6HQJh7AxBrL7H6
   /ho2P3GfzymVv86vvQdEbuki+IsaCl4YqcBVUzuVKHRdYHEEGSJOJncfA
   diLl6WLW4E7LQiDJprN97kgrLuC5S1gSAOCWn/vR3z9sE9YDfQZg1d96M
   gvqxMcY2wfRMtdgUFFkVCR2ddGvkdw4sAsdlLlPjQywLi3wOaGMhBrLy4
   ASmAbZXezo86bCoS+AAo89Knw3zJmA3b4XwG9y/fQdbasyHJRyCf44q6/
   I1NaWmLriTVElRq8j+oAwSh7GRnl6kdOTpxp9o29eQKuITgOGDBUUamgA
   A==;
X-CSE-ConnectionGUID: lD/xf+3TRR2P1PsZ7o7kLA==
X-CSE-MsgGUID: 5GLoAUTvQSado51svUKZ6w==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12925927"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:08:56 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:29936]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id ec550a5e-460a-44dc-a4e2-d7753333fc80; Thu, 12 Feb 2026 03:08:55 +0000 (UTC)
X-Farcaster-Flow-ID: ec550a5e-460a-44dc-a4e2-d7753333fc80
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:55 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:55 +0000
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
Subject: [PATCH 083/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_842 crypto
Date: Thu, 12 Feb 2026 02:46:59 +0000
Message-ID: <20260212024725.11264-84-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D042UWB004.ant.amazon.com (10.13.139.150) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190858_734639_89742DF3 
X-CRM114-Status: GOOD (  11.40  )
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
CONFIG_CRYPTO_842-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/842.c    | 4 ++--
 crypto/Makefile | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/842.c b/crypto/842.c
index 4007e87bed80..965f0f8dbc43 100644
--- a/crypto/842.c
+++ b/crypto/842.c
@@ -72,13 +72,13 @@ static int __init crypto842_mod_init(void)
 {
 	return crypto_register_scomp(&scomp);
 }
-module_init(crypto842_mod_init);
+crypto_module_init(crypto842_mod_init);
 
 static void __exit crypto842_mod_exit(void)
 {
 	crypto_unregister_scomp(&scomp);
 }
-module_exit(crypto842_mod_exit);
+crypto_module_exit(crypto842_mod_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("842 Software Compression Algorithm");
diff --git a/crypto/Makefile b/crypto/Makefile
index 6dc023d0851c..66319c92a983 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -161,7 +161,7 @@ crypto-objs-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
 crypto-objs-$(CONFIG_CRYPTO_LZ4) += lz4.o
 crypto-objs-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
 crypto-objs-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
-obj-$(CONFIG_CRYPTO_842) += 842.o
+crypto-objs-$(CONFIG_CRYPTO_842) += 842.o
 crypto-objs-$(CONFIG_CRYPTO_RNG2) += rng.o
 crypto-objs-$(CONFIG_CRYPTO_DRBG) += drbg.o
 crypto-objs-$(CONFIG_CRYPTO_JITTERENTROPY) += jitterentropy_rng.o
-- 
2.47.3


