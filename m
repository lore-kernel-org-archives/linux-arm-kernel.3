Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65F3EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4ip65HcC4K5Rtzes+OqLMjVU82bAcTf+v3gpaBM6fQ=; b=ZQcXclTlwuagzLLIkiblrxrdj2
	ypuu2a796QoFnK2VZQQwsLYOQEnmfA47AQlbOiX+WFULel5kIQqtsQDZXEdv6uZNyhGLnEwsRqAOr
	17PdQd23S9SRGT91f72EiEoE6Rwd5vq/UMiIPg0Gntn7nIIfXEcnA0wDh+X+/tFgMaWhzmxZ53zQY
	eNJVs8BISgtRWGzZjThbnRpxUq8dx/PONC9bbmQf/R2np+d5NOLIWsNR1+tff79qP9vdubi9gnQkl
	K9Pl90eyl1cghpbkgKBmYtT6Y6VGMoRrc+lyECxSJsaMpQ1jqBxefyKzSgoyCC0R8ZYZ8IfTlDOhD
	Rm7OkpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN1B-00000001TIJ-1djS;
	Thu, 12 Feb 2026 03:05:29 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN15-00000001TFi-1uyI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865519; x=1802401519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k4ip65HcC4K5Rtzes+OqLMjVU82bAcTf+v3gpaBM6fQ=;
  b=DzvBiCAVtBeK615AkzXIDbF5QNBVX7EDvrTsd8NDWE1bQHf5m1FrK+/T
   p4EKeF/XODauB49vCt8/usLFDtaHB83fepZjindRWw+VEwdzy5IzsPKH8
   6CKhNApZhQA8rrML4MQUoquA6ObVikY4NEQkItt2YsbZSycvACkeicg+j
   emqgB9Hp78b/rrGNxf5InC0MO6F4dU04Pyz5YGcE+yvE9pCVU1XHRKhdy
   tPlUHVR4Luwc2yJ0YsSZfIvF3mKHuQuOO50JO+Bk/fQgzMRzUgNK/j7nU
   UL1ur0HyhSjs0lo4k3JEmmXDy+4M7ASwigLaocyk7EcGq3oHVgsTSoHnn
   g==;
X-CSE-ConnectionGUID: SHcBt/WGTuuRn+YIjefTMg==
X-CSE-MsgGUID: bPy54Q/WQQWrT7gyChNnUQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12697039"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:05:19 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:3269]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id e4a55836-53d3-4332-b1a5-7f5de677f26a; Thu, 12 Feb 2026 03:05:18 +0000 (UTC)
X-Farcaster-Flow-ID: e4a55836-53d3-4332-b1a5-7f5de677f26a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:05:18 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:05:17 +0000
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
Subject: [PATCH 069/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ARC4 crypto
Date: Thu, 12 Feb 2026 02:46:45 +0000
Message-ID: <20260212024725.11264-70-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D037UWC002.ant.amazon.com (10.13.139.250) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190522_276988_52E7C48E 
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
CONFIG_CRYPTO_ARC4-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/arc4.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 7635fd4b698c..623651445612 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -141,7 +141,7 @@ crypto-objs-$(CONFIG_CRYPTO_CAMELLIA) += camellia_generic.o
 crypto-objs-$(CONFIG_CRYPTO_CAST_COMMON) += cast_common.o
 crypto-objs-$(CONFIG_CRYPTO_CAST5) += cast5_generic.o
 crypto-objs-$(CONFIG_CRYPTO_CAST6) += cast6_generic.o
-obj-$(CONFIG_CRYPTO_ARC4) += arc4.o
+crypto-objs-$(CONFIG_CRYPTO_ARC4) += arc4.o
 obj-$(CONFIG_CRYPTO_TEA) += tea.o
 obj-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
 obj-$(CONFIG_CRYPTO_ANUBIS) += anubis.o
diff --git a/crypto/arc4.c b/crypto/arc4.c
index 1608018111d0..f2bad33acb74 100644
--- a/crypto/arc4.c
+++ b/crypto/arc4.c
@@ -73,8 +73,8 @@ static void __exit arc4_exit(void)
 	crypto_unregister_lskcipher(&arc4_alg);
 }
 
-module_init(arc4_init);
-module_exit(arc4_exit);
+crypto_module_init(arc4_init);
+crypto_module_exit(arc4_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("ARC4 Cipher Algorithm");
-- 
2.47.3


