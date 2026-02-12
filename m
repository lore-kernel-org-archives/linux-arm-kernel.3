Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBFCEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WebAd8ZfZh59r/og+/x6xPoxpPJTiWqB/2oQVhSiDRQ=; b=FGX4aOwb9+JT+SAN5Via5oAuy6
	SZ8xp2Jn48qmxy92CQcmScz2zK7Wa+v1PXagzpnbH7a1ENJFRkYYL1ociIc8LAv79xIJM9t7tZ4Fc
	aIXBKpkLDxHSeXV3/nBCgPtkmOfo2z0oAYP4lUVjSqxJOxa4YhEYYvnkWwMvcYnkf1iNw8sl+FCit
	OP9pqu/osLAgUQLaXFYR/7bUhI035hVsiRpxTRzHxcny7glEVNzF5SWTBDFo0jua2r4fgBHhtMmep
	u7EfdPnGr0i336+ofO7b4l1iW542g8awcKJw2oceP318sl/v1BuSVtqTJmCKsGbfRQS6Q/6ZkP8in
	qMuf53fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN6P-00000001VRy-0UJU;
	Thu, 12 Feb 2026 03:10:49 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN6L-00000001VQk-2R2e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865845; x=1802401845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WebAd8ZfZh59r/og+/x6xPoxpPJTiWqB/2oQVhSiDRQ=;
  b=mAnnpgafNxcZml+zMu9E8tq73Mdxbd5diSXcNtRj+aWxs+uyD1NCCSCU
   Ee2ZBhnDTh4YnYjpwWZOmwJViFNqYX8JejyonIEvVe7nO1S7OiONWYZM0
   TXhnsTlC/um9e81AMT8BU9bkPYHWWIttH1MfawrWIHLv1VM1vMTwLev74
   CcP+RzrMsDRu/tvsiLQPnJUHAbjp1WRdhRUtRo93Uc+SMch+gKLNSuE2x
   HyxV8UYMtRQxj1KSfZA/hOPQaxcajYzRn8Mw+DuzxwPUHlYo5B1thv4wH
   uSjNr3uDTMbyFt0JnS0IWfYq5YZww5Ui1BZ+HMfwv/FqArxwY/4LbgD1F
   g==;
X-CSE-ConnectionGUID: VAJK1QSWRxGag43g3nY5TQ==
X-CSE-MsgGUID: xmtkpD24TiOYq/UaJVGmQg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12697327"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:10:45 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:12283]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id ba555cae-571b-489b-b04b-3b4080f45ca8; Thu, 12 Feb 2026 03:10:44 +0000 (UTC)
X-Farcaster-Flow-ID: ba555cae-571b-489b-b04b-3b4080f45ca8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:10:44 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:10:44 +0000
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
Subject: [PATCH 090/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ESSIV crypto
Date: Thu, 12 Feb 2026 02:47:06 +0000
Message-ID: <20260212024725.11264-91-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D039UWB002.ant.amazon.com (10.13.138.79) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191045_672659_4AD4603C 
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
CONFIG_CRYPTO_ESSIV-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/essiv.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index c4516e1943a7..3247d53c1fc6 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -179,7 +179,7 @@ crypto-objs-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
 crypto-objs-$(CONFIG_CRYPTO_ZSTD) += zstd.o
 crypto-objs-$(CONFIG_CRYPTO_ECC) += ecc.o
-obj-$(CONFIG_CRYPTO_ESSIV) += essiv.o
+crypto-objs-$(CONFIG_CRYPTO_ESSIV) += essiv.o
 
 ecdh_generic-y += ecdh.o
 ecdh_generic-y += ecdh_helper.o
diff --git a/crypto/essiv.c b/crypto/essiv.c
index a47a3eab6935..859486b9b063 100644
--- a/crypto/essiv.c
+++ b/crypto/essiv.c
@@ -639,8 +639,8 @@ static void __exit essiv_module_exit(void)
 	crypto_unregister_template(&essiv_tmpl);
 }
 
-module_init(essiv_module_init);
-module_exit(essiv_module_exit);
+crypto_module_init(essiv_module_init);
+crypto_module_exit(essiv_module_exit);
 
 MODULE_DESCRIPTION("ESSIV skcipher/aead wrapper for block encryption");
 MODULE_LICENSE("GPL v2");
-- 
2.47.3


