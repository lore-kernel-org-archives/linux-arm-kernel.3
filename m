Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ACEEDF022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcIM2QPZHzjzuquzQlPp2viA2Y2/npOOMsN3iH0l2+0=; b=2fHZryardX/N8QHv7pX4l/vwFg
	yd+rb+av7OIiTrUs0Dl4UfIJJHGTWmuQO2lnCJe+zjPMa4Vt48Rvg0j1QKUfloPCOfl591vyiWILy
	j3bP3zSZ7spXUQld5u5NqL6KajCKubpP1Vt4KCN0dDNPxk/y5wejfzBQ1IA3FjcCrjO1mPNDwn/56
	BtLgsEThqJIaIC5fLYlRgsgti9d8sLbU8WQrzq2RBHfugBYCEMmTcPjQfXBNNZryVdGNObBcG+SsB
	0JrBQ6olM3qBe9905KZXqhvvluy0MS1qufolWWpYlxbFiEISiNlEXqHR1ZQvByGxHCMnYkRowLqbw
	2bsIQCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMxN-00000001Rey-0HcY;
	Thu, 12 Feb 2026 03:01:29 +0000
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.13.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMxJ-00000001RdY-3gDd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865285; x=1802401285;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hcIM2QPZHzjzuquzQlPp2viA2Y2/npOOMsN3iH0l2+0=;
  b=dO6kUhBnliEgvZszOSeRLiKj0+dc67ugcjnsL+kdIMwNngx3Xnv8aWZT
   C32Izj+ZKdFrkrWkKE0sGxLxUyrsJwr+5iM37DOY+Y0Do5hIRKNOYMKST
   6EAxSkzcjGfTzxdnusCrTs6eeZKWKXaR7nt/tSv+p9u5PCwg7KRLhtPoO
   64JJWw2u4tnDMgYFFpLue/MuIg7B5AFIj4JKkymzzNeIT/aSkcdWh5x3Z
   8bGDP97AnsQ2Kkqn6HGQKJvvRrvzdolDDWKXoKCMn3OhOasGh+PjK1v3n
   VyUugz1bK7TuhffR3ACCTC5S2vBhqF3v5e7UIDAC+AQjy8yk+gp5M9GFW
   A==;
X-CSE-ConnectionGUID: oWQ5xUBZR+yjjKtxMzMC7A==
X-CSE-MsgGUID: 7FKYcYEnR3aD+dH9Xu/5cg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918024"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:01:25 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:21642]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id d9355a1b-c65f-4f57-984b-ca1499704078; Thu, 12 Feb 2026 03:01:25 +0000 (UTC)
X-Farcaster-Flow-ID: d9355a1b-c65f-4f57-984b-ca1499704078
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:01:25 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:01:24 +0000
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
Subject: [PATCH 054/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_XCTR and CONFIG_CRYPTO_HCTR2 crypto
Date: Thu, 12 Feb 2026 02:46:30 +0000
Message-ID: <20260212024725.11264-55-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D033UWC001.ant.amazon.com (10.13.139.218) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190126_535929_A441DB08 
X-CRM114-Status: GOOD (  10.49  )
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
CONFIG_CRYPTO_XCTR- and CONFIG_CRYPTO_HCTR2-related crypto to convert
them into pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 4 ++--
 crypto/hctr2.c  | 4 ++--
 crypto/xctr.c   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 33e4e3a03c40..c3b0de034a47 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -95,8 +95,8 @@ crypto-objs-$(CONFIG_CRYPTO_CTS) += cts.o
 crypto-objs-$(CONFIG_CRYPTO_LRW) += lrw.o
 crypto-objs-$(CONFIG_CRYPTO_XTS) += xts.o
 crypto-objs-$(CONFIG_CRYPTO_CTR) += ctr.o
-obj-$(CONFIG_CRYPTO_XCTR) += xctr.o
-obj-$(CONFIG_CRYPTO_HCTR2) += hctr2.o
+crypto-objs-$(CONFIG_CRYPTO_XCTR) += xctr.o
+crypto-objs-$(CONFIG_CRYPTO_HCTR2) += hctr2.o
 obj-$(CONFIG_CRYPTO_ADIANTUM) += adiantum.o
 crypto-objs-$(CONFIG_CRYPTO_GCM) += gcm.o
 crypto-objs-$(CONFIG_CRYPTO_CCM) += ccm.o
diff --git a/crypto/hctr2.c b/crypto/hctr2.c
index f4cd6c29b4d3..78c0fc9faee5 100644
--- a/crypto/hctr2.c
+++ b/crypto/hctr2.c
@@ -472,8 +472,8 @@ static void __exit hctr2_module_exit(void)
 					   ARRAY_SIZE(hctr2_tmpls));
 }
 
-module_init(hctr2_module_init);
-module_exit(hctr2_module_exit);
+crypto_module_init(hctr2_module_init);
+crypto_module_exit(hctr2_module_exit);
 
 MODULE_DESCRIPTION("HCTR2 length-preserving encryption mode");
 MODULE_LICENSE("GPL v2");
diff --git a/crypto/xctr.c b/crypto/xctr.c
index 607ab82cb19b..e3dee674b941 100644
--- a/crypto/xctr.c
+++ b/crypto/xctr.c
@@ -182,8 +182,8 @@ static void __exit crypto_xctr_module_exit(void)
 	crypto_unregister_template(&crypto_xctr_tmpl);
 }
 
-module_init(crypto_xctr_module_init);
-module_exit(crypto_xctr_module_exit);
+crypto_module_init(crypto_xctr_module_init);
+crypto_module_exit(crypto_xctr_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("XCTR block cipher mode of operation");
-- 
2.47.3


