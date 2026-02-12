Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4491EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkJvXXIDKm7o6lblg8CrOwWM/CEj39eFZHF/RazxHyQ=; b=NaucCLug5quXzThbz+PO7NKwTf
	oGhgk6aBHTbzAN4LjT/zuWbsLo/V0qj19ZjZsBFrUeQ9FWdqKZTnJo++d7Q61Hx/qX/T/+Yl65vrN
	QS5evzv0gS7oohkbI8gEQJuYU2mCa49udG36dQ1Y0RRoHOEyLQdrlpJvNWkP6LbC9zGPHPoAhNiOq
	X+8JNJEg6KhaMGlWrV1GFRsfMxCAHdA5vZANXmV+/hkfglgT/ZrGacUnjiCFJIU9kgCF1FzHVZ28I
	+Pv9B9l/rNFIJ8uPiXtKmLVGYdmHTmE+M4/kqIt2g9KmQBcMcpYZWHE88QMMEcByaLuJIozRhcKI3
	lo2ohyhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN5g-00000001V9m-2DrM;
	Thu, 12 Feb 2026 03:10:04 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN5d-00000001V8W-3JYR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865801; x=1802401801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DkJvXXIDKm7o6lblg8CrOwWM/CEj39eFZHF/RazxHyQ=;
  b=mFJVo9G8kcetG2D82KuN9pbPrCqrLurl5dArOSyRouV/LRqrqBlq56Kq
   qYpDi3wzDr5mwX6Hf5dMXCbxWjjC/7KXbKeVZZ0+aHzMhe7Fy1lCbEaxr
   CmvNtXt5QLSegfvPVtJK1o64qt0a/D8j9trXHPTVflKgFQZgUWhBLmhr2
   DdXFViAjqyou5F8calZT2J6yeMJ8Gf8HAEadBdjVZbPZhasiKzMXmBaE0
   2nZcuZA8d1d0Oo2GIQz4TAnu4bFlf075BfszcKYAerLPvPSUq3h6XhTMC
   D3f0MiLpIO1RbWJu3yskX8NYUXE7E5tbK7YzmUxKHdwjp3n90DEeMRSWn
   Q==;
X-CSE-ConnectionGUID: 1WXS6G2BSZSVYgZD+ZCSpQ==
X-CSE-MsgGUID: 3wtRhC/JQO2Oful13B9EaA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12727574"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:10:01 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:30846]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id 90327bb5-1600-43f4-8e95-262f633d390c; Thu, 12 Feb 2026 03:10:01 +0000 (UTC)
X-Farcaster-Flow-ID: 90327bb5-1600-43f4-8e95-262f633d390c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:09:57 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:09:57 +0000
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
Subject: [PATCH 087/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_USER_API_RNG crypto
Date: Thu, 12 Feb 2026 02:47:03 +0000
Message-ID: <20260212024725.11264-88-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D033UWC001.ant.amazon.com (10.13.139.218) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191001_886885_CA63178E 
X-CRM114-Status: GOOD (  10.94  )
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
CONFIG_CRYPTO_USER_API_RNG-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile    | 2 +-
 crypto/algif_rng.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 13d0ee856885..9d96e67cdfdf 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -175,7 +175,7 @@ crypto-objs-$(CONFIG_CRYPTO_GHASH) += ghash-generic.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API) += af_alg.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
-obj-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
+crypto-objs-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
 obj-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
 obj-$(CONFIG_CRYPTO_ZSTD) += zstd.o
 crypto-objs-$(CONFIG_CRYPTO_ECC) += ecc.o
diff --git a/crypto/algif_rng.c b/crypto/algif_rng.c
index 1a86e40c8372..1604b164d973 100644
--- a/crypto/algif_rng.c
+++ b/crypto/algif_rng.c
@@ -335,5 +335,5 @@ static void __exit rng_exit(void)
 	BUG_ON(err);
 }
 
-module_init(rng_init);
-module_exit(rng_exit);
+crypto_module_init(rng_init);
+crypto_module_exit(rng_exit);
-- 
2.47.3


