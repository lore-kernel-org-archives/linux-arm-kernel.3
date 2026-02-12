Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6338EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvVcO6BartKxz5hQoyho81ZeR5L/+lOP68DaWIU2J2Q=; b=oF84yqIIY/ySpWTplTWvYegxwu
	+F7vmNoFmX0F2p2MnzYAF9rRjGArWEy607ORAwk7BWGTDwQVSCBpMg3KMDB5NZKDG8Z5LKtakBXds
	0FuNqVJulYDnbDwOcGK8pp7u1uef9OuPWwW8/ImSPjWRS+Xp4BoaxvCl2vDh683OstnJNeXtd6biU
	HYGVh3dy1VdDo+Pd9YtDpSnvP5upbcOypj5FGcJmrT/pb8FPcalwUhYV/AenwZS0CgXerQfOhOTcj
	ozcGs6Hucn7o+kvQeKTjTm3sK9tUeIAi6CWleeuD84rF4FSkYQTrsLnE4f4H/4tpvcBYRStvTltH1
	e4dikD2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMr7-00000001P2g-178k;
	Thu, 12 Feb 2026 02:55:01 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMr3-00000001P0w-2uKs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864897; x=1802400897;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hvVcO6BartKxz5hQoyho81ZeR5L/+lOP68DaWIU2J2Q=;
  b=lABdFPZyW3PNiww7Mcdwgm0/I/vXBG7Hx6vjNK2ctDeixQqWuUMm19Kt
   NjjMVWCnUIHewNlcn2qzUvu4jOzwFNqCM2VJ4Zxtk2H4eI+8lEvHMZ8TS
   lKTHTtk5HaGnnYHLXnER2Zcm0KO8xehjrcuNHG5rXPK69PWZLxJmBcbYy
   WUZASHRdLo98FQ0tOqifWsBpARBjq+/ca/Cf7JoQ4Q6KJ0nOk5y2F1JkS
   yKbxb5xwA9l5Bwu+srt1WhckZuJJ3pmDhuHN6dRSlEJaFTMTwpnStQwyY
   WOa5egSZQ927B65C1qdm2z5o5ZINLrWuhntzgWXc6D/lwJFEhxS7yFhYA
   A==;
X-CSE-ConnectionGUID: +Rykoz2/SnKr09RbIkc48w==
X-CSE-MsgGUID: FsqPUuYxTb+CvFx38yBAUg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918045"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:54:57 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:3335]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id c0e30a81-a4d8-4277-8f24-085b6d4405ff; Thu, 12 Feb 2026 02:54:56 +0000 (UTC)
X-Farcaster-Flow-ID: c0e30a81-a4d8-4277-8f24-085b6d4405ff
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:54:56 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:54:56 +0000
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
Subject: [PATCH 029/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_DRBG crypto
Date: Thu, 12 Feb 2026 02:46:05 +0000
Message-ID: <20260212024725.11264-30-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D036UWB004.ant.amazon.com (10.13.139.170) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185458_261392_7144F9A4 
X-CRM114-Status: GOOD (  10.96  )
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

From: Vegard Nossum <vegard.nossum@oracle.com>

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_DRBG-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add drbg.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/drbg.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 4c87e141c961..25f0d9d56469 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -163,7 +163,7 @@ obj-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
 obj-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
 obj-$(CONFIG_CRYPTO_842) += 842.o
 crypto-objs-$(CONFIG_CRYPTO_RNG2) += rng.o
-obj-$(CONFIG_CRYPTO_DRBG) += drbg.o
+crypto-objs-$(CONFIG_CRYPTO_DRBG) += drbg.o
 obj-$(CONFIG_CRYPTO_JITTERENTROPY) += jitterentropy_rng.o
 CFLAGS_jitterentropy.o = -O0
 KASAN_SANITIZE_jitterentropy.o = n
diff --git a/crypto/drbg.c b/crypto/drbg.c
index 5e7ed5f5c192..f4eba9ef6d59 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -1882,8 +1882,8 @@ static void __exit drbg_exit(void)
 	crypto_unregister_rngs(drbg_algs, (ARRAY_SIZE(drbg_cores) * 2));
 }
 
-module_init(drbg_init);
-module_exit(drbg_exit);
+crypto_module_init(drbg_init);
+crypto_module_exit(drbg_exit);
 #ifndef CRYPTO_DRBG_HASH_STRING
 #define CRYPTO_DRBG_HASH_STRING ""
 #endif
-- 
2.47.3


