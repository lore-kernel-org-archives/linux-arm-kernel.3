Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2323AEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6R+WJeNWz557jM/PqZlqQw/Mxz686fCKn/ZBf5ChNQ=; b=qub6hFQLCB4pN88e2a9bHWqGrZ
	58Z0bDN4mkhhI0UBbQcnhDVmYFPA4ZZAcuV2sYM52b+ESDTbMAQm+3Hml6LBYdjvovdK12NOcsnzy
	GNWfI+lectelKKsoSvzlcOxE+GdgF8fGu3FivtH6gdNZD54FQ533ktrndxz5VOuLpgG6v/+dHwTU8
	4P6DJGsmGNBVChVWHbwXuCrEkVinc62ol5wkvnNlj6XWPZJs4ae39UeyhMt2ZS6Xn5QSM2yXB2Cfo
	2lEpDIMHW1jDhC/owxN/Eropzp4wjKYJ0oshY463E0bV2+HgKiIsrpSLZ9tangG0BKvA/4SAXaiHi
	0IyqNm7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN1c-00000001TSD-2NG1;
	Thu, 12 Feb 2026 03:05:52 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN1a-00000001TQy-0F2o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865550; x=1802401550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q6R+WJeNWz557jM/PqZlqQw/Mxz686fCKn/ZBf5ChNQ=;
  b=mMftGT1FYLZEwk8LlKisEfpeoKQsVW6hz//HKaQFfrlPd3N34d6okMiY
   jS+TGS95b3dE56t9WcIoVGmZGcdCfgNIWAItl+vZOXuBLWWfGj2nYa5+S
   B/YTiBNlGch86F2PNeAwdAPzmXmG/90qSchgVCNlb6aaxL4v8QZRVgfFC
   3gQMaGHqt7IG4Oaye95TbQdVGVwR6uBudBDSh34EjHRyt/usdDzc1Na4x
   cKqDQer4Rh9yyUJvVYsy12eOgHTBoboogucXOrNAsRZ3/3Ujiodb0Szk0
   VQVoGaIaE+YVtG9BshV/EIr7VE80WZvRCZNzqS4cHjCLszPn5JV9FSvgv
   w==;
X-CSE-ConnectionGUID: ZQRwMihiR36JSztvng71aA==
X-CSE-MsgGUID: Tcoi77cLSnysFiAIV0ucVA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12803769"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:05:49 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:5863]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id 53d11213-d454-4e6a-8e18-b2a18c4142ac; Thu, 12 Feb 2026 03:05:49 +0000 (UTC)
X-Farcaster-Flow-ID: 53d11213-d454-4e6a-8e18-b2a18c4142ac
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:05:49 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:05:48 +0000
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
Subject: [PATCH 071/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_USER_API_SKCIPHER crypto
Date: Thu, 12 Feb 2026 02:46:47 +0000
Message-ID: <20260212024725.11264-72-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D042UWB002.ant.amazon.com (10.13.139.175) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190550_142280_D2F19664 
X-CRM114-Status: GOOD (  10.84  )
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
CONFIG_CRYPTO_USER_API_SKCIPHER-related crypto to convert them into
pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile         | 2 +-
 crypto/algif_skcipher.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 5c363d865b45..a7ad0f5dd1d9 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -174,7 +174,7 @@ obj-$(CONFIG_CRYPTO_BENCHMARK) += tcrypt.o
 crypto-objs-$(CONFIG_CRYPTO_GHASH) += ghash-generic.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API) += af_alg.o
 obj-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
-obj-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
+crypto-objs-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
 obj-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
 obj-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
 obj-$(CONFIG_CRYPTO_ZSTD) += zstd.o
diff --git a/crypto/algif_skcipher.c b/crypto/algif_skcipher.c
index 125d395c5e00..8fbfb6c7ba14 100644
--- a/crypto/algif_skcipher.c
+++ b/crypto/algif_skcipher.c
@@ -435,7 +435,7 @@ static void __exit algif_skcipher_exit(void)
 	BUG_ON(err);
 }
 
-module_init(algif_skcipher_init);
-module_exit(algif_skcipher_exit);
+crypto_module_init(algif_skcipher_init);
+crypto_module_exit(algif_skcipher_exit);
 MODULE_DESCRIPTION("Userspace interface for skcipher algorithms");
 MODULE_LICENSE("GPL");
-- 
2.47.3


