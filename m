Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4761FEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HEF96UIvuLZhOLdF7TvA/7nxzM5j6DQ/cqq0XHjHL8=; b=uKwfQGCXMHRivQbCygWyNaN7oc
	x+PS5uckzmcvUGnGBUvsjasN8AseZWtuScGocv1utvdW4sL3j2C98P93npOQRsD3yMla5ECNyXFo7
	8BIa4M9ctZLfJkNTsFauhXFhNPhRY3Hrl2E1mIDdz2VDYzC6lafqO58RTZ0+CbQEyBl2YResRtlfz
	HvHzKAZBeGiUi4bk/pY5Frj16DetxkdrQTmwbni+w9D+XHdiSonuWyom/4POpkPY2+aGsdMDdEjgz
	Gch4SLZLlW0LqMGkjM5Vljl83SBpWdI1bmII4n3g15gw4OMbkFLHCezkOZ9lEsuDxUwOiKx0CVpIX
	1AMn437A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMoL-00000001Nvk-44wW;
	Thu, 12 Feb 2026 02:52:09 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMoJ-00000001Nud-2n3v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864727; x=1802400727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1HEF96UIvuLZhOLdF7TvA/7nxzM5j6DQ/cqq0XHjHL8=;
  b=fITDwESqHKhObg7E9hDIo8igxiz9BUmTMRnIJykvEsWD7GUsjRAF88z4
   FsfyTjtoQImDwsopHyUZlXem3P5V7bdyQatAfQqlNC7LNX2mtgDATVQqC
   HgXNDnWAaQOK4Lc2eV+4hZBBlEng54/uO5fzno3kgbS/JYx/LiXUstcbz
   KOw1JQh6TMJe+MiDn8x9TRWUW+WBS9DHkIlnsb3tOugFmGc5SoCxD/n2S
   bZxP3HuCfX/jTbVatx3ixsOYSD0dxyDjDF0lmMm9xer0QMYNDq9afzdBF
   UzOefK0LhbWWKg9bvRAb6BQ/heA92tHFS/FXbZwb0JXJ7IECbC9tuZ/NW
   w==;
X-CSE-ConnectionGUID: 1AUlMe85RDOCETdGzNj39g==
X-CSE-MsgGUID: HABY2pL9QvSCrcWycpG9ZQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12913179"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:52:07 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:9276]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id c457d180-bfb4-47ce-8f37-b11207a9e75f; Thu, 12 Feb 2026 02:52:06 +0000 (UTC)
X-Farcaster-Flow-ID: c457d180-bfb4-47ce-8f37-b11207a9e75f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:52:06 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:52:05 +0000
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
Subject: [PATCH 018/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SHA256 crypto
Date: Thu, 12 Feb 2026 02:45:54 +0000
Message-ID: <20260212024725.11264-19-wanjay@amazon.com>
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
X-CRM114-CacheID: sfid-20260211_185207_758013_FC47B41C 
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
CONFIG_CRYPTO_SHA256-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add sha256.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/sha256.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 6310c3e88e4b..45e055a8c0f4 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -80,7 +80,7 @@ obj-$(CONFIG_CRYPTO_MD4) += md4.o
 crypto-objs-$(CONFIG_CRYPTO_MD5) += md5.o
 obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
 obj-$(CONFIG_CRYPTO_SHA1) += sha1.o
-obj-$(CONFIG_CRYPTO_SHA256) += sha256.o
+crypto-objs-$(CONFIG_CRYPTO_SHA256) += sha256.o
 obj-$(CONFIG_CRYPTO_SHA512) += sha512.o
 obj-$(CONFIG_CRYPTO_SHA3) += sha3.o
 obj-$(CONFIG_CRYPTO_SM3_GENERIC) += sm3_generic.o
diff --git a/crypto/sha256.c b/crypto/sha256.c
index fb81defe084c..26ae39b4c1db 100644
--- a/crypto/sha256.c
+++ b/crypto/sha256.c
@@ -398,13 +398,13 @@ static int __init crypto_sha256_mod_init(void)
 {
 	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
 }
-module_init(crypto_sha256_mod_init);
+crypto_module_init(crypto_sha256_mod_init);
 
 static void __exit crypto_sha256_mod_exit(void)
 {
 	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
 }
-module_exit(crypto_sha256_mod_exit);
+crypto_module_exit(crypto_sha256_mod_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Crypto API support for SHA-224, SHA-256, HMAC-SHA224, and HMAC-SHA256");
-- 
2.47.3


