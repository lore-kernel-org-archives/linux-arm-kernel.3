Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F378DEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hk8aIeqQVvLJ0nmwJ0daEeASLXAHH3hxvdDrvQ89TGg=; b=Nmfn/zrCKwDPB/OboHYkGyMJaT
	RRpkrYmT9a2cLPIshcJlLV5BGISnYbawPngIXlbcYR2fBiYfy87oPAFoTuJO8oQNh33FI4ORg1fmE
	3FE715HmaVT0vVMwqIiE+meeryYxqNj6bgNp/xCHkUpnxnkAjVK/6fzTQTg5CeFw3TZpOWa8JF9S5
	w8qRVa7XonfTq8chlbEfpQT71iavEuqemVK+TR52zuYJ9H02Gk+PeTPWvPImshYJ412esNZ/sSYAN
	IEH+H71ST2GDjMFSonihfJo4T1PgwZCW7jV+RNYhFGZa0wWyRQOAYrY6dz0060AeNekDJBRRvZ6iD
	jM64l1eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNIN-00000001abX-30Yb;
	Thu, 12 Feb 2026 03:23:11 +0000
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.12.53.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNIJ-00000001aYA-1Qsv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866587; x=1802402587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hk8aIeqQVvLJ0nmwJ0daEeASLXAHH3hxvdDrvQ89TGg=;
  b=roFrWUeNiJOlZIXLJPJzjAPWONyZop7/iF1YtPVbNuLuULyEbS60k9QT
   3UbiGPrLmtYxcTezjciz8Wyot+oaULplbfEjDDX4cVKUjecL+wKAZtGCJ
   8HnpfLUMxuNMjVPjOXQhnhIBhNoVe9mY0cdGhk3SejfiP8vW4GyvryxJj
   0B//tRv29Qq+2bhncwwG+1ckkPhSZj05R1Kyk2V0a0DUT8j0A51qLdx11
   7rcUroIOpJF773DoA4rvNwoSXCGEHjdsmWfOdLXHo3to5lqHkRkVEdiRq
   xNf0sxVvblW9tVpF+YRf+KbCAJ9/LhXvKg4CuUxACm+atezSgrli5PkB8
   w==;
X-CSE-ConnectionGUID: PMspcWGkT2+/tqKzK78s/g==
X-CSE-MsgGUID: TnrUv36MRnCTr6cWo4AVjA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12794560"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:23:06 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:25222]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id 029c520c-8ed9-4e17-959b-244389c4057b; Thu, 12 Feb 2026 03:23:06 +0000 (UTC)
X-Farcaster-Flow-ID: 029c520c-8ed9-4e17-959b-244389c4057b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:23:06 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:23:06 +0000
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
Subject: [PATCH 07/12] arm64: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SM4_ARM64_NEON_BLK crypto
Date: Thu, 12 Feb 2026 03:21:07 +0000
Message-ID: <20260212032117.9166-8-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212032117.9166-1-wanjay@amazon.com>
References: <20260212032117.9166-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D039UWB003.ant.amazon.com (10.13.138.93) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192307_441858_395E06B0 
X-CRM114-Status: GOOD (  11.12  )
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
CONFIG_CRYPTO_SM4_ARM64_NEON_BLK-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile        | 2 +-
 arch/arm64/crypto/sm4-neon-glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 807994fa9a3f..48042cf5bb13 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -23,7 +23,7 @@ sm4-ce-ccm-y := sm4-ce-ccm-glue.o sm4-ce-ccm-core.o
 crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE_GCM) += sm4-ce-gcm.o
 sm4-ce-gcm-y := sm4-ce-gcm-glue.o sm4-ce-gcm-core.o
 
-obj-$(CONFIG_CRYPTO_SM4_ARM64_NEON_BLK) += sm4-neon.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_NEON_BLK) += sm4-neon.o
 sm4-neon-y := sm4-neon-glue.o sm4-neon-core.o
 
 obj-$(CONFIG_CRYPTO_GHASH_ARM64_CE) += ghash-ce.o
diff --git a/arch/arm64/crypto/sm4-neon-glue.c b/arch/arm64/crypto/sm4-neon-glue.c
index e944c2a2efb0..b18a6b11b3a8 100644
--- a/arch/arm64/crypto/sm4-neon-glue.c
+++ b/arch/arm64/crypto/sm4-neon-glue.c
@@ -235,8 +235,8 @@ static void __exit sm4_exit(void)
 	crypto_unregister_skciphers(sm4_algs, ARRAY_SIZE(sm4_algs));
 }
 
-module_init(sm4_init);
-module_exit(sm4_exit);
+crypto_module_init(sm4_init);
+crypto_module_exit(sm4_exit);
 
 MODULE_DESCRIPTION("SM4 ECB/CBC/CTR using ARMv8 NEON");
 MODULE_ALIAS_CRYPTO("sm4-neon");
-- 
2.47.3


