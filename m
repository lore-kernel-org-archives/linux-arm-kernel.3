Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFDCEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiIBNcAcIxrdaW3m7D7ahOyrJ+i9keD2+i0anDLbbtM=; b=FhrGhUsJ0XZTFFZM+qWXNkmhXE
	QztT0RnrC1/lV+ANJeJc2fKWQk3jYhTIU/yij1r1azMol1qEA+LvmefkXAURNvpqdn7a6b81P6/DD
	TqwAYmCIbARUh10ZJcTm6jAFrYsuNFpfob1tx3iodrpOBNCvU098rwVRwL+ibsFtqGrytsc5c2z8r
	RwyTiaUieNARJ9xpV7oEbkLY3cMan0so5EcFXcpx3oVYb6xSzKuZ8taj+/5Q/O1jKB+Tj2haUsYuX
	Tz8qzK9Sh06tHyCOm7r98uCNRG1Q2Ae/ZUpGGLOmERhJpYUabDJpttRPw9ItOqAokQkUuMBKgY3yI
	AGi8dD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMqh-00000001Ot0-2JJc;
	Thu, 12 Feb 2026 02:54:35 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMqe-00000001Op5-0Tok
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864872; x=1802400872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yiIBNcAcIxrdaW3m7D7ahOyrJ+i9keD2+i0anDLbbtM=;
  b=UZGVWA08ML9becuAQ9lc1Z3TOVc6ER3Y0u0tz/3ZntGONM0ZjCDcaUWR
   EezRFbc5rqrC3XShVpnvhMjkDWj3Lb27MTfg/PZ1BzYuvN2NdjFdBCgvj
   bMP75oNswQViHUuhuZ1pyW8WRHqPYq8Lo7O9hVCn7QAOOHV81XfD04p4t
   KxeQ8PfQZk8cYi/oJbDPrVKF0bdGP8CFXKwsts/eJhu6mWonymTjvlyN2
   j6+8iUQ+7VfJox/fkmVb+hVSfk5JygdCDUoFQU9ca8+fxNktzab5Z9yET
   pN5zeBq7MMXOZ3rqQSDAJ5KgIPOOd2uo5NPpTQpBFX3izJH2cLxZM0BAl
   A==;
X-CSE-ConnectionGUID: fPPsmGLVSN+9b3DVkrevhw==
X-CSE-MsgGUID: h8pG9CDuSt2vegK9oKHYLQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12726735"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:54:26 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:5251]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id 3adbd6c3-6971-44b5-936d-e3f1998bdde6; Thu, 12 Feb 2026 02:54:25 +0000 (UTC)
X-Farcaster-Flow-ID: 3adbd6c3-6971-44b5-936d-e3f1998bdde6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:54:25 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:54:25 +0000
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
Subject: [PATCH 027/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_LZO crypto
Date: Thu, 12 Feb 2026 02:46:03 +0000
Message-ID: <20260212024725.11264-28-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D036UWB001.ant.amazon.com (10.13.139.133) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185432_200745_427E2EA2 
X-CRM114-Status: GOOD (  10.68  )
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
CONFIG_CRYPTO_LZO-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile  | 2 +-
 crypto/lzo-rle.c | 4 ++--
 crypto/lzo.c     | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 3a2da61b4581..647797922678 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -157,7 +157,7 @@ obj-$(CONFIG_CRYPTO_CRC32) += crc32-cryptoapi.o
 crc32-cryptoapi-y := crc32.o
 crypto-objs-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
 obj-$(CONFIG_CRYPTO_KRB5ENC) += krb5enc.o
-obj-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
+crypto-objs-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
 obj-$(CONFIG_CRYPTO_LZ4) += lz4.o
 obj-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
 obj-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
diff --git a/crypto/lzo-rle.c b/crypto/lzo-rle.c
index 794e7ec49536..10af97e741fa 100644
--- a/crypto/lzo-rle.c
+++ b/crypto/lzo-rle.c
@@ -93,8 +93,8 @@ static void __exit lzorle_mod_fini(void)
 	crypto_unregister_scomp(&scomp);
 }
 
-module_init(lzorle_mod_init);
-module_exit(lzorle_mod_fini);
+crypto_module_init(lzorle_mod_init);
+crypto_module_exit(lzorle_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("LZO-RLE Compression Algorithm");
diff --git a/crypto/lzo.c b/crypto/lzo.c
index d43242b24b4e..e1f9bc40f89f 100644
--- a/crypto/lzo.c
+++ b/crypto/lzo.c
@@ -93,8 +93,8 @@ static void __exit lzo_mod_fini(void)
 	crypto_unregister_scomp(&scomp);
 }
 
-module_init(lzo_mod_init);
-module_exit(lzo_mod_fini);
+crypto_module_init(lzo_mod_init);
+crypto_module_exit(lzo_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("LZO Compression Algorithm");
-- 
2.47.3


