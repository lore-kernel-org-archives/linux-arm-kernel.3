Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7549EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWX5ofroYvNSVuzjiSmeNYhcyx4hz+1VEJzFNsxrn2I=; b=nJfp6ERmHIZRZvv+DQl9TQ4q8p
	9LYpIJAfLylVnqIO/PsbKipxockAJAWp1ZMxpanTZTGIBHhtNW6E4bl4gjQ7Y8hZoWADTxRVyxQ/F
	EhrejfunA2AtKXr/dHvMoxLFiVw+BINsO4ZcVAvjtOKB+pbgxkzCr20ghD46K1CpTM3R4gl1siEzw
	LKjbqZrghUnTFiy/+TJXNqu8J7W05hPD4kV1GiXHaHzb+z3fSum6xMDYpfjYU8XLEj/XrkuYcvRmr
	EO1VoyrNbz1f5QBz3X/vPTwSRga9UuK/camanOTCB/nzBBDYUkG/D5PxDUuMr33eLTcC1Gr1nV4cy
	EXCr9b4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMrM-00000001PBJ-11W5;
	Thu, 12 Feb 2026 02:55:16 +0000
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.13.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMrJ-00000001P8v-0YEU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864913; x=1802400913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mWX5ofroYvNSVuzjiSmeNYhcyx4hz+1VEJzFNsxrn2I=;
  b=mRhovoMtyBEf1M8bRzTiPJwwXxBGVIrWURRw8T6KuEOGH7Ko5OOIIBQP
   r6OgfKLPhUZMiJdA0gUPHhE+7OddVC3cAD/QoydjTmx7udnCBtNpKjt+W
   gi7Xu3WP/JGqxqzAPpyI9S6Mr//Xjzn+nh2Ct//jW93tKuPlsBE/tMzEq
   VbzLT/EqomaMXsQuk0ey0Xs8EFlNjxYkdEmglcpCosntn07b4Ug+MWn8n
   D896V6MXSttp8ooVONU4rdg1MxFG1IQnea+3ISzSCEYYEnINwHYH8NJv+
   57XmQxkLO7h0aSEOidimHwApjQ38Auhvn0LrC6+aKfK1HsKNVwVseobX/
   Q==;
X-CSE-ConnectionGUID: Dp1DeoEYSEmbAvelI+iAhQ==
X-CSE-MsgGUID: czGbFl7IRt+wo000sLSx4A==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12917769"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:55:12 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:12025]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id 66fbff75-4d12-4c1d-9a38-6dcdd969ec6a; Thu, 12 Feb 2026 02:55:12 +0000 (UTC)
X-Farcaster-Flow-ID: 66fbff75-4d12-4c1d-9a38-6dcdd969ec6a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:55:12 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:55:11 +0000
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
Subject: [PATCH 030/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_JITTERENTROPY crypto
Date: Thu, 12 Feb 2026 02:46:06 +0000
Message-ID: <20260212024725.11264-31-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D043UWC004.ant.amazon.com (10.13.139.206) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185513_317551_9965787C 
X-CRM114-Status: GOOD (  10.94  )
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
CONFIG_CRYPTO_JITTERENTROPY-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add jitterentropy_rng.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              | 2 +-
 crypto/jitterentropy-kcapi.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 25f0d9d56469..1d5ee8dc24d9 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -164,7 +164,7 @@ obj-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
 obj-$(CONFIG_CRYPTO_842) += 842.o
 crypto-objs-$(CONFIG_CRYPTO_RNG2) += rng.o
 crypto-objs-$(CONFIG_CRYPTO_DRBG) += drbg.o
-obj-$(CONFIG_CRYPTO_JITTERENTROPY) += jitterentropy_rng.o
+crypto-objs-$(CONFIG_CRYPTO_JITTERENTROPY) += jitterentropy_rng.o
 CFLAGS_jitterentropy.o = -O0
 KASAN_SANITIZE_jitterentropy.o = n
 UBSAN_SANITIZE_jitterentropy.o = n
diff --git a/crypto/jitterentropy-kcapi.c b/crypto/jitterentropy-kcapi.c
index 7c880cf34c52..11115b8df694 100644
--- a/crypto/jitterentropy-kcapi.c
+++ b/crypto/jitterentropy-kcapi.c
@@ -361,8 +361,8 @@ static void __exit jent_mod_exit(void)
 	crypto_unregister_rng(&jent_alg);
 }
 
-module_init(jent_mod_init);
-module_exit(jent_mod_exit);
+crypto_module_init(jent_mod_init);
+crypto_module_exit(jent_mod_exit);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Stephan Mueller <smueller@chronox.de>");
-- 
2.47.3


