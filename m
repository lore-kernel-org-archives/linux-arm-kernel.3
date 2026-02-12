Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE9CEDF022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H24b9NbQmIPZ7x8DsV1W6Gp6H2uPR71iqVVMu1piz/8=; b=Y2xsQbctG0gYpD3QB32rQwADro
	pxybFoO8RTq3fbQA7PF8nJQmwKMVguU847mRmqzWM/y9HqBQqlEYB9eG18wlQdByGrad0JovW8EpC
	mR0EQv3PprDVxDpITg4+g6Lgk5hkzBHJUNHTmK8kHYQXYx7q4fzT8lEBQS6Jq/pOm1teux2Ir/2t3
	8IlJ6jJFK4L1dIgzXYkJIu8SyaFqa4+r7tcwG8PqL1i4Q77a7IIdyqEOQFVPGZdvVWV3M4wikIJ2N
	i2W2tQFRuFwv1evg+4UFp7VDfuTvxcO836SK8RLzc6oAOgS/dcwgOjL/P1e54rPFLslRkICEiWcgO
	lm8hIbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMxE-00000001Rb9-48b8;
	Thu, 12 Feb 2026 03:01:21 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMx6-00000001RZ6-03Mb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865272; x=1802401272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H24b9NbQmIPZ7x8DsV1W6Gp6H2uPR71iqVVMu1piz/8=;
  b=CknXGbpm5xXNm/x6qB7/arsnSqyQzNnXTpANau4fTEBZ+ZdxDJcZJdsR
   nQcDvd7lq+QVDdqhHWpePKOCPKddZoH2OpRpPLNaW68txmY+T9qigXR6s
   3rSjgMq9C7UmowXqtJLyg/o8+N3Winxm1LuDgiz9MzxHqEQ+g+ckCjNww
   x7d3HlWgJRP43jaal14sYH7Gzkvd/hm95jwnTdT4LfwQusj5P2Wosov0U
   WFEDK4CbXdbprWwhNEsOnw8iQHcX3wQZ7kTMWjj+0/o9dLmO/w7P7rzR1
   PI2sBV/hrYFwwLJguGgjegfLc43uI2INKl0DdElmvdek+9Ch65zqrbBVg
   A==;
X-CSE-ConnectionGUID: cbW6MUqmRZ2RXJ2jsirDSA==
X-CSE-MsgGUID: rorEgPC6QU6gTtrgqgUcwQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12803560"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:01:11 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:19058]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id a253ba3b-c276-4167-a844-fba602f81218; Thu, 12 Feb 2026 03:01:11 +0000 (UTC)
X-Farcaster-Flow-ID: a253ba3b-c276-4167-a844-fba602f81218
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:01:09 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:01:09 +0000
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
Subject: [PATCH 053/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_XTS crypto
Date: Thu, 12 Feb 2026 02:46:29 +0000
Message-ID: <20260212024725.11264-54-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D045UWA004.ant.amazon.com (10.13.139.91) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190114_580463_ED452ADC 
X-CRM114-Status: GOOD (  10.65  )
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
CONFIG_CRYPTO_XTS-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/xts.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 73c700538792..33e4e3a03c40 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -93,7 +93,7 @@ crypto-objs-$(CONFIG_CRYPTO_CBC) += cbc.o
 crypto-objs-$(CONFIG_CRYPTO_PCBC) += pcbc.o
 crypto-objs-$(CONFIG_CRYPTO_CTS) += cts.o
 crypto-objs-$(CONFIG_CRYPTO_LRW) += lrw.o
-obj-$(CONFIG_CRYPTO_XTS) += xts.o
+crypto-objs-$(CONFIG_CRYPTO_XTS) += xts.o
 crypto-objs-$(CONFIG_CRYPTO_CTR) += ctr.o
 obj-$(CONFIG_CRYPTO_XCTR) += xctr.o
 obj-$(CONFIG_CRYPTO_HCTR2) += hctr2.o
diff --git a/crypto/xts.c b/crypto/xts.c
index 3da8f5e053d6..97e499893292 100644
--- a/crypto/xts.c
+++ b/crypto/xts.c
@@ -466,8 +466,8 @@ static void __exit xts_module_exit(void)
 	crypto_unregister_template(&xts_tmpl);
 }
 
-module_init(xts_module_init);
-module_exit(xts_module_exit);
+crypto_module_init(xts_module_init);
+crypto_module_exit(xts_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("XTS block cipher mode");
-- 
2.47.3


