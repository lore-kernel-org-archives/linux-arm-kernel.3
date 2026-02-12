Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9758BEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkYRmBeLlVK96xipe1wH+Gv+FhwFfQJv88wu7hrGthw=; b=ulNvDpQXXpHgvTJ0/Dol9y/8CT
	Cb+16yg2VTN2Clr8hFi1PJrnPYmExEo1pqv+D0Q7WckBBI5rjbOhOUbQF12MlVPjqGfrDPmur4F0E
	GPl0BGQ0fzrgPKXYa2WRY/JTO53t1gdhWPjD2yWYIpisABSt5wRgDve7GgxcoD92g86K3Wzq1UMeZ
	yaCMcoc76ZennqzPcKI4LpbLHyUuty94Vv2v0+t6NP1iunLusMmk1MyVP75sVXRRNgPDsAYZWQe5r
	ZzPx7I2DbPVOlKQ+gKCx5jDdEhO9IlWdDUbjq6pSpm2UHWz7Ar8SEhfCjLhnB3nRhU71edPknfQYn
	0zFwMknw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMld-00000001MpI-1iNx;
	Thu, 12 Feb 2026 02:49:21 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMla-00000001Mnx-1NXZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864558; x=1802400558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XkYRmBeLlVK96xipe1wH+Gv+FhwFfQJv88wu7hrGthw=;
  b=twKleUxrXivHKQgpKT+fZQg7BSGtKeyFYGDrE+qcFWd7VJoZ54ciPU/I
   jcLTUy5HGizqzdiyQJ4EhIZMA5wB28/1BCxMZtXet9NzWcUtXsANvvVKz
   MK8ZMKlL50IUMjTjCkwjYdkRKkvLgBfc/q3xE2L+AJyCnKAPeBY4HV6JW
   0N0oAxdkMTXppPhp+n4wIXcmgXJjzfCVAjnQEh0fhPD61+RArcAqnb8gK
   qARlmf/gc6MrB3MhIMZT37JQnjermwrpU5yyNZQJVHlAnrkurQ7zvh/71
   DLw3tOn4OFm0zG2iMiJvumOHL14YfBGPBFIi9/B+k64anN4IZZ2e/g07U
   A==;
X-CSE-ConnectionGUID: N8v+bGPXRWqD9L2z0DA0Qw==
X-CSE-MsgGUID: y2LGAyxbQVWddxKrLncY2g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12743911"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:49:17 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:11453]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 16bcda96-ab50-4cd2-beb5-55617a94c476; Thu, 12 Feb 2026 02:49:17 +0000 (UTC)
X-Farcaster-Flow-ID: 16bcda96-ab50-4cd2-beb5-55617a94c476
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:49:15 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:49:14 +0000
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
Subject: [PATCH 007/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ECHAINIV crypto
Date: Thu, 12 Feb 2026 02:45:43 +0000
Message-ID: <20260212024725.11264-8-wanjay@amazon.com>
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
X-CRM114-CacheID: sfid-20260211_184918_428065_EE345B8F 
X-CRM114-Status: GOOD (  10.92  )
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
CONFIG_CRYPTO_ECHAINIV-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add echainiv.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile   | 2 +-
 crypto/echainiv.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 4d6f1c927db4..f14758177ee3 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -27,7 +27,7 @@ crypto-objs-$(CONFIG_CRYPTO_SKCIPHER2) += bpf_crypto_skcipher.o
 endif
 
 crypto-objs-$(CONFIG_CRYPTO_SEQIV) += seqiv.o
-obj-$(CONFIG_CRYPTO_ECHAINIV) += echainiv.o
+crypto-objs-$(CONFIG_CRYPTO_ECHAINIV) += echainiv.o
 
 crypto_hash-y += ahash.o
 crypto_hash-y += shash.o
diff --git a/crypto/echainiv.c b/crypto/echainiv.c
index e0a2d3209938..d409b4169e83 100644
--- a/crypto/echainiv.c
+++ b/crypto/echainiv.c
@@ -145,8 +145,8 @@ static void __exit echainiv_module_exit(void)
 	crypto_unregister_template(&echainiv_tmpl);
 }
 
-module_init(echainiv_module_init);
-module_exit(echainiv_module_exit);
+crypto_module_init(echainiv_module_init);
+crypto_module_exit(echainiv_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Encrypted Chain IV Generator");
-- 
2.47.3


