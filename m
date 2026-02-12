Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9326EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+DDGQ4ZUzmd3O/crIGH4EYx7vvVuN0RHu7GW85gsdA=; b=E5ivBJ74ognQWpFNkiGs53mr7R
	0kd1mW6El3+nfHJXe4BFaSdGwx/z+gf0Qs6pu8xMjWxSOFSGZhdTkMuzK2J5rOfY6XwarJ73YGvlS
	rKpAvFQ9ZS2OWtMeJe2+143gagEXDa2SrK5vwQ09+bz9wH/JIxHIpDirAKGNaDhk/U6knjXhZN2q6
	KGIS9PjcgoAExM7vsAExh+2BUewsE0WAZiDjVg9Lw5lqNNqVDcJ2c4yjz2xK/FLwhK5GsnGJNVukt
	YN4ia3fC2pyTiIBi8dzfEpndjUZymiTzAxJbY8AUU5dom+hHDWTakuF3NP6CClzm0IbgBLIBPSofz
	1ZlOHsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMkP-00000001MJM-1etL;
	Thu, 12 Feb 2026 02:48:05 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMkJ-00000001MGC-0gri
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864479; x=1802400479;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z+DDGQ4ZUzmd3O/crIGH4EYx7vvVuN0RHu7GW85gsdA=;
  b=io4lCCZXWyYTHowgHohocQ5my52nofTdSa4gp8/puJAhrjUhTF+Gg78+
   PBsEHo0wSxB09Ta04WSEQbLr2LG/NBovVfPXLihzIJaQGv5ja2l05F4wM
   oFe4ggyZyjTH6YOb9X8hcka7gKrRvbimb3hSTkN+/XVuvoknFl3MVcrWS
   jQ7C302YllE/uf/YhNmMTkBXf4vTowjRNpa4DVfBGkTXQkmW/A4K+HGgk
   OGz6EN6jyqCxi7jL1GxRmwy16pweiUqg/nAPdbQZ9Ve6iXg+iIrAHax7j
   VSxXkPhGE5xshIVL2cdPpzplwXI7z3K+o368BfG8Y5/oYNTGXOvpagU5E
   g==;
X-CSE-ConnectionGUID: 8dsy0XEqRoOSA2AB/q9Peg==
X-CSE-MsgGUID: r/+a/rWQQV6ZLMTAXCU8hg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12696253"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:47:58 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:30164]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id a67cd5c3-a7a0-47f5-983c-d19430df9733; Thu, 12 Feb 2026 02:47:58 +0000 (UTC)
X-Farcaster-Flow-ID: a67cd5c3-a7a0-47f5-983c-d19430df9733
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:47:57 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:47:57 +0000
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
Subject: [PATCH 002/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_AES crypto
Date: Thu, 12 Feb 2026 02:45:38 +0000
Message-ID: <20260212024725.11264-3-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D032UWA004.ant.amazon.com (10.13.139.56) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_184759_255692_06EFBF01 
X-CRM114-Status: GOOD (  13.89  )
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
CONFIG_CRYPTO_AES-related crypto to convert them into pluggable
interface.

This patch is partially based on work by Vegard Nossum, with
modifications. Unlike the original, we do not include
DEFINE_CRYPTO_API since only one copy of the crypto symbols is
kept, either in the crypto module or in the main kernel, and we ensure
such wrapper do not have impact on crypto already chosen built as
module.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/aes.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 88de6dcbd7c4..da5a7a4aa59b 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -134,7 +134,7 @@ obj-$(CONFIG_CRYPTO_TWOFISH) += twofish_generic.o
 obj-$(CONFIG_CRYPTO_TWOFISH_COMMON) += twofish_common.o
 obj-$(CONFIG_CRYPTO_SERPENT) += serpent_generic.o
 CFLAGS_serpent_generic.o := $(call cc-option,-fsched-pressure)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
-obj-$(CONFIG_CRYPTO_AES) += aes.o
+crypto-objs-$(CONFIG_CRYPTO_AES) += aes.o
 obj-$(CONFIG_CRYPTO_SM4) += sm4.o
 obj-$(CONFIG_CRYPTO_SM4_GENERIC) += sm4_generic.o
 obj-$(CONFIG_CRYPTO_CAMELLIA) += camellia_generic.o
diff --git a/crypto/aes.c b/crypto/aes.c
index ae8385df0ce5..bda6a1cba552 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -52,13 +52,13 @@ static int __init crypto_aes_mod_init(void)
 {
 	return crypto_register_alg(&alg);
 }
-module_init(crypto_aes_mod_init);
+crypto_module_init(crypto_aes_mod_init);
 
 static void __exit crypto_aes_mod_exit(void)
 {
 	crypto_unregister_alg(&alg);
 }
-module_exit(crypto_aes_mod_exit);
+crypto_module_exit(crypto_aes_mod_exit);
 
 MODULE_DESCRIPTION("Crypto API support for AES block cipher");
 MODULE_LICENSE("GPL");
-- 
2.47.3


