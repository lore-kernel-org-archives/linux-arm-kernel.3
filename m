Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DBCEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHc1xX6Ny/1KQete+3SBOc4q1ddi9Vs8bpEGEtoXe6U=; b=kEjDA02TMHJK/c7x4bj86kZq38
	yy7lZUhOY3twNWFxvokMQYgugoNfEvgDONGNImWAE0BD/XqQKm/WMrChNCH/GyZ8rEOtCNgPP86Ef
	0dh33eO7YvHtx/gWCaSMikI3ds2HqsCKN6ud3t1OyzxWQHmdxObNEy0U7hCoUocK/9LyoPJUB8xKs
	vMEX0gOeq3l+ZIvtdEyjCbnbAMRRGzCJs6qx9nbHH8hcFyLJRXXQzVMZ3JEdXBCNC64lpImcoX0e6
	Fe58nrNN97zOViutKoMVYah9OWccAHsg/Aldmq4yncUbXrO79e45cWg5ltYP4DkB0CKC4fJYhBuot
	yX01snTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMob-00000001O3w-3TNA;
	Thu, 12 Feb 2026 02:52:25 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMoY-00000001O2t-3MUc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864742; x=1802400742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IHc1xX6Ny/1KQete+3SBOc4q1ddi9Vs8bpEGEtoXe6U=;
  b=Meytf1Ul+L6CcqgrgGocdPrkShAhqnlaRTFfC5uq4k10BtpCqL4VFH9k
   AMZZZ9vIoHGONFQrEcF65d8A7d/yh0v75ZjgztcEDPcwYCi6zDSyAtxpY
   Qvxf6etQapmU8S5YS/2rMRCZTol2EsiiYhzJmQgmlZXN8gElYB5+JINvN
   M7I0mbJ0E1yBYVGcapr/HQdC8G826SbgMc+IUM8qwfg8997vRHYHoAYIO
   FMuGDLAE43RQECF/pvMqDQ6wYOIB9v/ioMpZPfT3miifSvda1wyhmRA7x
   TZR6p1oyf6k0GJAHeyK70kQrojb1KqgOTLJR0r3VD4KQVAjPguvKw1ys3
   Q==;
X-CSE-ConnectionGUID: v9N6cePqQwi3BSYKvGOi0w==
X-CSE-MsgGUID: sMTwPccuT7G3uzl4uzIUFQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744052"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:52:22 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:29933]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 052a295b-db9f-4b93-9d72-fea55f17e200; Thu, 12 Feb 2026 02:52:22 +0000 (UTC)
X-Farcaster-Flow-ID: 052a295b-db9f-4b93-9d72-fea55f17e200
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:52:21 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:52:21 +0000
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
Subject: [PATCH 019/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SHA512 crypto
Date: Thu, 12 Feb 2026 02:45:55 +0000
Message-ID: <20260212024725.11264-20-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D039UWB004.ant.amazon.com (10.13.138.57) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185222_899115_BC4E5987 
X-CRM114-Status: GOOD (  11.56  )
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
CONFIG_CRYPTO_SHA512-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add sha512.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/sha512.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 45e055a8c0f4..47ff0136c7c5 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -81,7 +81,7 @@ crypto-objs-$(CONFIG_CRYPTO_MD5) += md5.o
 obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
 obj-$(CONFIG_CRYPTO_SHA1) += sha1.o
 crypto-objs-$(CONFIG_CRYPTO_SHA256) += sha256.o
-obj-$(CONFIG_CRYPTO_SHA512) += sha512.o
+crypto-objs-$(CONFIG_CRYPTO_SHA512) += sha512.o
 obj-$(CONFIG_CRYPTO_SHA3) += sha3.o
 obj-$(CONFIG_CRYPTO_SM3_GENERIC) += sm3_generic.o
 obj-$(CONFIG_CRYPTO_STREEBOG) += streebog_generic.o
diff --git a/crypto/sha512.c b/crypto/sha512.c
index d320fe53913f..6e40932862d5 100644
--- a/crypto/sha512.c
+++ b/crypto/sha512.c
@@ -404,13 +404,13 @@ static int __init crypto_sha512_mod_init(void)
 {
 	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
 }
-module_init(crypto_sha512_mod_init);
+crypto_module_init(crypto_sha512_mod_init);
 
 static void __exit crypto_sha512_mod_exit(void)
 {
 	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
 }
-module_exit(crypto_sha512_mod_exit);
+crypto_module_exit(crypto_sha512_mod_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Crypto API support for SHA-384, SHA-512, HMAC-SHA384, and HMAC-SHA512");
-- 
2.47.3


