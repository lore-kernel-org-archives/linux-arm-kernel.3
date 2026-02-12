Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20E3EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hH2tH6xkr3A879ixKLGX+Ri2Yt7DrS4xVYJlhMwU1fk=; b=WjQew5V50WHAdhjiMxldaQ/Vtk
	TuLk2KhxbkiPc+EjmKxaAwbyBq/FOY9GAFO4eBQ2+VCAROTfpnRWyr8X48Tr0TMjeK9JwKyrTubcE
	6l/MKpYisUGFurfaSR4WCsK4OObS7nNxsNQrHrkNI4FFyNuDsdf2csEur5Aj6qJCrWc3oRantuo1W
	7J9omY8vBSxHJd4EeuaWZAOB1T6v8tKT4rq7mdbr0URdBBQPjEV3KfA71woROQzI/JpQY2AbChrKy
	3cUV6vpB2xlx2j4puBHj7pGHuVNiHh0GsHYra38W69mAiCBs+TE38TzGwjsooUeQ4l4tcPcrZIjj1
	B7Xia0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMvc-00000001Qzt-0nY2;
	Thu, 12 Feb 2026 02:59:40 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMvZ-00000001QyB-1HKS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865177; x=1802401177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hH2tH6xkr3A879ixKLGX+Ri2Yt7DrS4xVYJlhMwU1fk=;
  b=T9yBkrO2A6wpywQWXSvSZboYrMWi0aJ9SDu7RYlLWWZyAiLp/tIHq2CT
   iUGt/YscIdTm9fCuBc57NyHZE7X1EfyqO9xlfsC2jhvN0kk/v0OXJFrl1
   JO6zqUSE+CTbMuBxmtE20/k6Gq9pUQ+ZN72uzzQLPKgWIbh7Iif0gWY4z
   2aNzoakr0YFi7stWA6EIMM7/vxQYqVvm4jXHHZwdx4Lp40X4qZvMJYuDU
   lbU7VhCV7PmkMPsDul8oW5PUX1HrmZl7oL3/Fl6vUaIljS8bkCHId1lHo
   XhSmU6spKAMN39vm1w2OW/uP3+UOnlRA+tvhU+SByNAJfSzEV7pDjBmLg
   Q==;
X-CSE-ConnectionGUID: YFMtRFFXSSyEPQ1e/9EbRw==
X-CSE-MsgGUID: gjLO+XAOQYijfet4sFquCA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12914618"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:59:36 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:7592]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id d6c2b9b7-c67a-4478-b42a-1310688a15d5; Thu, 12 Feb 2026 02:59:36 +0000 (UTC)
X-Farcaster-Flow-ID: d6c2b9b7-c67a-4478-b42a-1310688a15d5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:59:36 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:59:36 +0000
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
Subject: [PATCH 047/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_STREEBOG crypto
Date: Thu, 12 Feb 2026 02:46:23 +0000
Message-ID: <20260212024725.11264-48-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D044UWA003.ant.amazon.com (10.13.139.43) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185937_397143_2BED18AD 
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
CONFIG_CRYPTO_STREEBOG-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile           | 2 +-
 crypto/streebog_generic.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 64df3408cca0..c83ad9bb4324 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -84,7 +84,7 @@ crypto-objs-$(CONFIG_CRYPTO_SHA256) += sha256.o
 crypto-objs-$(CONFIG_CRYPTO_SHA512) += sha512.o
 crypto-objs-$(CONFIG_CRYPTO_SHA3) += sha3.o
 crypto-objs-$(CONFIG_CRYPTO_SM3_GENERIC) += sm3_generic.o
-obj-$(CONFIG_CRYPTO_STREEBOG) += streebog_generic.o
+crypto-objs-$(CONFIG_CRYPTO_STREEBOG) += streebog_generic.o
 obj-$(CONFIG_CRYPTO_WP512) += wp512.o
 CFLAGS_wp512.o := $(call cc-option,-fno-schedule-insns)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
 obj-$(CONFIG_CRYPTO_BLAKE2B) += blake2b.o
diff --git a/crypto/streebog_generic.c b/crypto/streebog_generic.c
index 57bbf70f4c22..1ed42a26bec9 100644
--- a/crypto/streebog_generic.c
+++ b/crypto/streebog_generic.c
@@ -1061,8 +1061,8 @@ static void __exit streebog_mod_fini(void)
 	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
 }
 
-module_init(streebog_mod_init);
-module_exit(streebog_mod_fini);
+crypto_module_init(streebog_mod_init);
+crypto_module_exit(streebog_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Vitaly Chikunov <vt@altlinux.org>");
-- 
2.47.3


