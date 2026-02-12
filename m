Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9967EEDF023
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmFZJZLh+VrOYGfoIXopF4QjcZTypEUNkKPNha+2uEA=; b=aivPiGbBpUJPjCHQLF7etR7gh8
	o1lRM1WXIhwAorwwDEKhJoKm9Psrd2+H4590IMS/hxeXBem2++ZJgYE5271GMBzy11RDybCOyIuT1
	5xOM8+ZFQqYp/5riXvTi3jr+MMJg1MHFlcHX87kUPLq26A8ax+EHu+byKe7fhPt62kEjt0XP9pM/o
	B6pU+Ju0E+I5diszGajuM/OPXVldi/U/jKMVVIJJ4gEPVC0ybizf37TiYAurSnb9KdbTcHqJtUf/F
	ee+/ZJRto/CcIn5lXbZNd8YQD3VVUn8Wjw+10oKFdOkotwdaQl3TW7JLSVo6ln4+AxUVp/aVK8PW3
	YtkqyEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN5s-00000001VFd-1WSu;
	Thu, 12 Feb 2026 03:10:16 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN5q-00000001VDw-0ob3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865814; x=1802401814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GmFZJZLh+VrOYGfoIXopF4QjcZTypEUNkKPNha+2uEA=;
  b=FCb3uIrzOd5awfvj2j22EMAS9AbjLr0wTkrlpsXG21h3FslZv78Za3Wg
   8l6Z9MFi3NwlLh7LR/DUszHeFpg1+JK7cO8Cf+rXa5quLrDfko7HhU77R
   Kz30rDtNM1I+OcDcF/vXY9h1qtO0VhJYPDw8NE6BqFUvM9NoivVXSRMQB
   QmPZL3liMukDcJfeYUfEs0S1zqR7S6l5tbjJiGC705QOZFsuhxfO9yzmJ
   JlRx3wFqb6KTXJLAxZGa9FvFOAR/TLjOpwPGJzwL4xMHyRcoCMeTzU6Qi
   qqYI1XeEANkEJvay4EfqI+mbFrvDxf/x9MetgR16JUEN5r3Zkfnd/OE4g
   Q==;
X-CSE-ConnectionGUID: uHiUjtzvSwSenqpsMZqtRw==
X-CSE-MsgGUID: wXNhRV7sSFaKj7E9MomjPA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919622"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:10:13 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:24188]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id 7bccf9d2-13eb-4a39-a412-5df6718e5e91; Thu, 12 Feb 2026 03:10:13 +0000 (UTC)
X-Farcaster-Flow-ID: 7bccf9d2-13eb-4a39-a412-5df6718e5e91
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:10:13 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:10:13 +0000
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
Subject: [PATCH 088/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_USER_API_AEAD crypto
Date: Thu, 12 Feb 2026 02:47:04 +0000
Message-ID: <20260212024725.11264-89-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D042UWA002.ant.amazon.com (10.13.139.17) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191014_293017_F5C53967 
X-CRM114-Status: GOOD (  10.85  )
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
CONFIG_CRYPTO_USER_API_AEAD-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile     | 2 +-
 crypto/algif_aead.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 9d96e67cdfdf..3f4cd954ef06 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -176,7 +176,7 @@ crypto-objs-$(CONFIG_CRYPTO_USER_API) += af_alg.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
-obj-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
+crypto-objs-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
 obj-$(CONFIG_CRYPTO_ZSTD) += zstd.o
 crypto-objs-$(CONFIG_CRYPTO_ECC) += ecc.o
 obj-$(CONFIG_CRYPTO_ESSIV) += essiv.o
diff --git a/crypto/algif_aead.c b/crypto/algif_aead.c
index 79b016a899a1..59df4eabd2f5 100644
--- a/crypto/algif_aead.c
+++ b/crypto/algif_aead.c
@@ -521,8 +521,8 @@ static void __exit algif_aead_exit(void)
 	BUG_ON(err);
 }
 
-module_init(algif_aead_init);
-module_exit(algif_aead_exit);
+crypto_module_init(algif_aead_init);
+crypto_module_exit(algif_aead_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Stephan Mueller <smueller@chronox.de>");
 MODULE_DESCRIPTION("AEAD kernel crypto API user space interface");
-- 
2.47.3


