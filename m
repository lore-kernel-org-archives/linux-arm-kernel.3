Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40750EDF022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+V2quRZlGdrIOdi+q0YW/XxutMNjAuj5pi8P6bpEJ/I=; b=KxtalRYq7DBMMoFeDVFHiPDl4S
	aC8461THXY/crFgaaZZT9DVFpO534E83TaU4Oe+8fvBk4qnZV4sPZxU5HR4rXerSMQGqlrrGFsTNH
	kF0WhoSGw/COpmyHCjIY/A0DY6r+HUkIKwso3Rwl3GdHFK8SOnbjh56UgeON6wTgxNewNS6oqH82j
	iqMdyNWLcehUwR4egOgrHV6YHSGsKUi6IUAJrrg1oZsKbkACXdmGhYTCKL4coWwjb+8q5b9GecUan
	BXPzmA2g6K2tzjnZW7OAhXvxvcIxVb0hey5EBO6D8Om+uo9SQeFcMA4N9ABJPMe7r2BKEmeP1WiCS
	JTgcgbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN4R-00000001Uee-0UCo;
	Thu, 12 Feb 2026 03:08:49 +0000
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.68.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN4M-00000001UcX-2AUY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:08:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865722; x=1802401722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+V2quRZlGdrIOdi+q0YW/XxutMNjAuj5pi8P6bpEJ/I=;
  b=k1H4Fhib6zTenici8kV8v2J8Va8QfK8vYZoo3eGIvHCesk4Bn/19z+Dk
   qzXMM1m7MulEQ7WPwvnU1KOhrxuuXgQR7vcuBaa8Z807sFz5wrKy/onHl
   J5O+QhkUxByKu+V/6kDQ/xFeiS2bvM76UNx0F5FcITkzGg8BBVPTxNAVI
   hQFw8XU/cSzeNJvDMLemjT34aKG49SGmTW07FrPbJyCt4eMQi/cnt6zhs
   zn3T1e4XUMqY4XXXdAIFv8jmZLvGwe+l5mrZpJgUaM3HNJvXaWJB/PxcK
   Fotwmbd9xK3LV6qBtrLfKilSgnswtwYcncswEMPUzPq+n1xjV70KlyWJc
   w==;
X-CSE-ConnectionGUID: gL/DgmoITdSJXJcTUJP9AA==
X-CSE-MsgGUID: u8WqoBR5RIqpHa8zZwPCYw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12925908"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:08:42 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:27150]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.165:2525] with esmtp (Farcaster)
 id 7faf14d3-b066-4081-9f1f-a3021f9d8bb6; Thu, 12 Feb 2026 03:08:41 +0000 (UTC)
X-Farcaster-Flow-ID: 7faf14d3-b066-4081-9f1f-a3021f9d8bb6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:40 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:39 +0000
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
Subject: [PATCH 082/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_XXHASH crypto
Date: Thu, 12 Feb 2026 02:46:58 +0000
Message-ID: <20260212024725.11264-83-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D043UWA002.ant.amazon.com (10.13.139.53) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190842_617275_FFF11544 
X-CRM114-Status: GOOD (  10.93  )
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
CONFIG_CRYPTO_XXHASH-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile         | 2 +-
 crypto/xxhash_generic.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 665299fd5a5a..6dc023d0851c 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -160,7 +160,7 @@ crypto-objs-$(CONFIG_CRYPTO_KRB5ENC) += krb5enc.o
 crypto-objs-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
 crypto-objs-$(CONFIG_CRYPTO_LZ4) += lz4.o
 crypto-objs-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
-obj-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
+crypto-objs-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
 obj-$(CONFIG_CRYPTO_842) += 842.o
 crypto-objs-$(CONFIG_CRYPTO_RNG2) += rng.o
 crypto-objs-$(CONFIG_CRYPTO_DRBG) += drbg.o
diff --git a/crypto/xxhash_generic.c b/crypto/xxhash_generic.c
index 175bb7ae0fcd..4e41c4d213df 100644
--- a/crypto/xxhash_generic.c
+++ b/crypto/xxhash_generic.c
@@ -96,8 +96,8 @@ static void __exit xxhash_mod_fini(void)
 	crypto_unregister_shash(&alg);
 }
 
-module_init(xxhash_mod_init);
-module_exit(xxhash_mod_fini);
+crypto_module_init(xxhash_mod_init);
+crypto_module_exit(xxhash_mod_fini);
 
 MODULE_AUTHOR("Nikolay Borisov <nborisov@suse.com>");
 MODULE_DESCRIPTION("xxhash calculations wrapper for lib/xxhash.c");
-- 
2.47.3


