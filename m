Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BAAEDF022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wv5uBZN7AGEzCLoYq2GhjRdJJtr3r5ZhMOJL4OyOMMg=; b=yvWPrQKgRsA1zTtxLtKNduoaf2
	k2blIUX0fUhyl4bvKmNp9cyoRuMD+S6c8OklNSTH9jdVoWlVmJorx76+jD/8IcMhVubffwBiDcAhV
	rI5DEfn6lxaS8dAMRBRZwPQ+5mMsHgNrEH75xhfTb/HSyjbZTtF1aPyNeHBtgNTEEvw4sN2Juuo51
	IxJlqSjrjz3zlAPBgp3WhsBbfjfc8xhnZlcUPqO1o/znJ+b8EmgD/wveCvkGgOgltN4Uc6GVj0+Z4
	uTAAccZ+d59HpMcSFl7sb8EgrnFdwh6xuGv9y6ODLFItcMaNehFiOaPeI8XMXN3EafJN86YurBIWU
	1ktfafYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMwN-00000001RJ9-2rjd;
	Thu, 12 Feb 2026 03:00:27 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMwJ-00000001RHg-39tm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865223; x=1802401223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wv5uBZN7AGEzCLoYq2GhjRdJJtr3r5ZhMOJL4OyOMMg=;
  b=f9zQHDzQICDsVPhtW/WQXi9ZRijQFHOZ8mB57j1pm3am6hKniBtgF1FL
   lA8cdVRdUObu56D1gJossEaZpjLDH5z/95BXPSGXYRAN+H2D2ionPQ75I
   I5BJ0P9aPYWD1E8sItMXasdHpYiXx4jki4p60bhdPebbQX81nRqTezaEU
   7TcfC4yclGPkAwH4GtuOr1mDwQWM69h5MNK1s6bwPx5QYBfixxsM3b2C0
   9lvsyOijzbymXqfPxrpgsbOWAzoV3FiJsq7YNr0ENCCnFj7BvXcLQU5YG
   5bbtgmbRFyfLFULkpAQ8glh9wSTdT2G9hj5P+d4RUJt6ynmlbpW8Rj2YP
   Q==;
X-CSE-ConnectionGUID: J/aw7rlaSSSFoFKmNVHg7w==
X-CSE-MsgGUID: M1KCh34QQ4GD9wocY39Lcw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918317"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:00:23 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:11760]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id 0e499385-4917-45a7-9a15-8af9415d510e; Thu, 12 Feb 2026 03:00:23 +0000 (UTC)
X-Farcaster-Flow-ID: 0e499385-4917-45a7-9a15-8af9415d510e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:00:22 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:00:22 +0000
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
Subject: [PATCH 050/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_PCBC crypto
Date: Thu, 12 Feb 2026 02:46:26 +0000
Message-ID: <20260212024725.11264-51-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D043UWA004.ant.amazon.com (10.13.139.41) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190023_854904_C577A15A 
X-CRM114-Status: GOOD (  10.83  )
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
CONFIG_CRYPTO_PCBC-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/pcbc.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index dfcfcd0601dd..6515459115d8 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -90,7 +90,7 @@ CFLAGS_wp512.o := $(call cc-option,-fno-schedule-insns)  # https://gcc.gnu.org/b
 crypto-objs-$(CONFIG_CRYPTO_BLAKE2B) += blake2b.o
 crypto-objs-$(CONFIG_CRYPTO_ECB) += ecb.o
 crypto-objs-$(CONFIG_CRYPTO_CBC) += cbc.o
-obj-$(CONFIG_CRYPTO_PCBC) += pcbc.o
+crypto-objs-$(CONFIG_CRYPTO_PCBC) += pcbc.o
 obj-$(CONFIG_CRYPTO_CTS) += cts.o
 obj-$(CONFIG_CRYPTO_LRW) += lrw.o
 obj-$(CONFIG_CRYPTO_XTS) += xts.o
diff --git a/crypto/pcbc.c b/crypto/pcbc.c
index d092717ea4fc..a0f3e16f049f 100644
--- a/crypto/pcbc.c
+++ b/crypto/pcbc.c
@@ -186,8 +186,8 @@ static void __exit crypto_pcbc_module_exit(void)
 	crypto_unregister_template(&crypto_pcbc_tmpl);
 }
 
-module_init(crypto_pcbc_module_init);
-module_exit(crypto_pcbc_module_exit);
+crypto_module_init(crypto_pcbc_module_init);
+crypto_module_exit(crypto_pcbc_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("PCBC block cipher mode of operation");
-- 
2.47.3


