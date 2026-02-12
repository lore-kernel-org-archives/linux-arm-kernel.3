Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE353EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cf5xMhPaTzUvZY+QOd1rtkTKbEHRWxhzTBxa1aBZ9A=; b=e0A6OJLsHPIb2avkgUZqQ4o2EV
	TFS6ZfrjurtnLJnzysRBwG9NpmPoy9wcF6767GOT5OpS1qKpK/TJXpW+ZBgov852GzF5+yN9EMLsZ
	HozV3zHFDeSD3EbyZqjdvyK1a5bqYscdbqfUiTEUZzV0wpj7HJlW2SjBUhhx93ROfdZelwwcQ+W31
	NdeBf2O6DGj01FiajyM+WbDj+iSwEmumOYg+Uc76IL+I1aN2S6jTqYjiCxw+0zIcW8Mf+ul3nFgFV
	YnQZ+G+C42SRaHwEWBqyYvN3VNGfaA/dg2fV+T6TPcAKxhXE9XHbsUegGe0F+kPgJGzSKsAtvGspo
	pTMdwVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMur-00000001Qeo-31Ia;
	Thu, 12 Feb 2026 02:58:53 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMup-00000001QdX-07RZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865131; x=1802401131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9cf5xMhPaTzUvZY+QOd1rtkTKbEHRWxhzTBxa1aBZ9A=;
  b=dCWRxTAq7c+EiaMyeJWOYRv2EQfihg/17DKXJTk52ULlMYwSMYZyPk8h
   6+R8C9rS1S74AhJqz80ZjQ0xn7xk+s6lLhSYoCqUInOrIFcVmKWiSHalX
   H8nhAnQNDnQsuY3TEqJT/Ho4CqVqd/8lthIp/s0bo//O+vZalA+bd8u8f
   +Z6qIZmdxYBEuTvi3s2P6K6VcaVxFEUt3Yc89D32t2/BrGg++92X9P4df
   a2fzhzjRMjh70UWZ+2GveHh8j7o8gVyee1tMxO+SA84w+pqSufwCaa1Tv
   KB6hfHUQ9CU1X9zUr+r69E6ycLsomW/E9/isZ7q29UEcHVC9Lxr8wCUTv
   A==;
X-CSE-ConnectionGUID: lPWNgdz6Scuwx5jfRxduKQ==
X-CSE-MsgGUID: ymlN53C4RsSElsaYwnDWQw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919659"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:58:50 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:7648]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id 2ba7dc71-98cf-42ac-a794-02aef3cebc62; Thu, 12 Feb 2026 02:58:50 +0000 (UTC)
X-Farcaster-Flow-ID: 2ba7dc71-98cf-42ac-a794-02aef3cebc62
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:58:49 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:58:49 +0000
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
Subject: [PATCH 044/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_RMD160 crypto
Date: Thu, 12 Feb 2026 02:46:20 +0000
Message-ID: <20260212024725.11264-45-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185851_115523_B1299340 
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
CONFIG_CRYPTO_RMD160-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/rmd160.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 32f038ff47de..45f0ae639ccd 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -78,7 +78,7 @@ crypto-objs-$(CONFIG_CRYPTO_XCBC) += xcbc.o
 crypto-objs-$(CONFIG_CRYPTO_NULL) += crypto_null.o
 crypto-objs-$(CONFIG_CRYPTO_MD4) += md4.o
 crypto-objs-$(CONFIG_CRYPTO_MD5) += md5.o
-obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
+crypto-objs-$(CONFIG_CRYPTO_RMD160) += rmd160.o
 obj-$(CONFIG_CRYPTO_SHA1) += sha1.o
 crypto-objs-$(CONFIG_CRYPTO_SHA256) += sha256.o
 crypto-objs-$(CONFIG_CRYPTO_SHA512) += sha512.o
diff --git a/crypto/rmd160.c b/crypto/rmd160.c
index 9860b60c9be4..0d68e7b763d8 100644
--- a/crypto/rmd160.c
+++ b/crypto/rmd160.c
@@ -342,8 +342,8 @@ static void __exit rmd160_mod_fini(void)
 	crypto_unregister_shash(&alg);
 }
 
-module_init(rmd160_mod_init);
-module_exit(rmd160_mod_fini);
+crypto_module_init(rmd160_mod_init);
+crypto_module_exit(rmd160_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Adrian-Ken Rueegsegger <ken@codelabs.ch>");
-- 
2.47.3


