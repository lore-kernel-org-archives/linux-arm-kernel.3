Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33279EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwZFjq+S0uRR8QDDwjcLsgW/2X9ZB1S8cu6kr/SXELs=; b=uyJJM6fEXPpL5My91xVo1ZZLHW
	jaW2LrLJ0LDsTyLDTESoKcfxwAPQz2gI7WutaAfoAFkw8Pl7ZXDNyajpS6qbdagw77AieO3AJbkfQ
	R9LcEcjXamrEZAOc31tmcltG0V802UuXZcAhRjK8DWI7tQZR1zcV3vtpOP6L7AgMTerq51RLx0rbR
	7ETC7PSAkMCNn0La71BIDN5gCxAxi14DpD4vbEB8nRfV/Xs1wYwlVUW6oCyA9k21VZ8du0GhyGGyg
	f/Eu8tMVmCsf73pEbXBdKT6fdyJaTyPDSuT2lN+v7bkent4z3HKPcJogqX+C3SCmBqE9wltbhWwyV
	Zks03mcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNHF-00000001ZzL-1s67;
	Thu, 12 Feb 2026 03:22:01 +0000
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.35.192.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNH7-00000001Zws-1ATY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866513; x=1802402513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PwZFjq+S0uRR8QDDwjcLsgW/2X9ZB1S8cu6kr/SXELs=;
  b=ChX4ZQb3cMDppOGv422lhZQVksmWshCd8cfGHEyjfITCUycFVReSbgsT
   Y9AfNrSdxBRayQdAvHoWkiwFAnGzOQzVEJa04n9SS4GJ08v3dI7fC07pj
   uMlhO2NcDR3WrYK+bf/5DxbLlRGdWlETvR3x8sZU86NEaEEiovobUrmbJ
   Q4oJgLa7bWNM6nFgP1Di6nUStfxwcczH1bDEKxUYrI9MTOMLNt9lAhB3g
   DVh4kl1bSsK+BAuiK0DdLCKrkK0UUPiU66EZyAFjV/yAhR6vkdnmkg26D
   vKnmnUQSR8vh/+DgcBDYWXZtXJj1zWjJT6iHWelij1D6dLtkOHhbpSsiH
   Q==;
X-CSE-ConnectionGUID: ctdhjBoIRkGEjEE/oOwAEQ==
X-CSE-MsgGUID: fs+NQk9VQjW5iEHQD/ReoQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12699269"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:21:49 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:26885]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.165:2525] with esmtp (Farcaster)
 id af46ee4a-3863-4b84-9eaf-e1619e8b7813; Thu, 12 Feb 2026 03:21:49 +0000 (UTC)
X-Farcaster-Flow-ID: af46ee4a-3863-4b84-9eaf-e1619e8b7813
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:21:48 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:21:48 +0000
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
Subject: [PATCH 02/12] arm64: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SM3_ARM64_CE crypto
Date: Thu, 12 Feb 2026 03:21:02 +0000
Message-ID: <20260212032117.9166-3-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212032117.9166-1-wanjay@amazon.com>
References: <20260212032117.9166-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D036UWB004.ant.amazon.com (10.13.139.170) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192158_040142_082923CA 
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
CONFIG_CRYPTO_SM3_ARM64_CE-related crypto to convert them into
pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile      | 2 +-
 arch/arm64/crypto/sm3-ce-glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 3dcde982c0cc..43cac8d5738f 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -8,7 +8,7 @@
 crypto-objs-$(CONFIG_CRYPTO_SM3_NEON) += sm3-neon.o
 sm3-neon-y := sm3-neon-glue.o sm3-neon-core.o
 
-obj-$(CONFIG_CRYPTO_SM3_ARM64_CE) += sm3-ce.o
+crypto-objs-$(CONFIG_CRYPTO_SM3_ARM64_CE) += sm3-ce.o
 sm3-ce-y := sm3-ce-glue.o sm3-ce-core.o
 
 obj-$(CONFIG_CRYPTO_SM4_ARM64_CE) += sm4-ce-cipher.o
diff --git a/arch/arm64/crypto/sm3-ce-glue.c b/arch/arm64/crypto/sm3-ce-glue.c
index 24c1fcfae072..01d13f44c17e 100644
--- a/arch/arm64/crypto/sm3-ce-glue.c
+++ b/arch/arm64/crypto/sm3-ce-glue.c
@@ -66,5 +66,5 @@ static void __exit sm3_ce_mod_fini(void)
 	crypto_unregister_shash(&sm3_alg);
 }
 
-module_cpu_feature_match(SM3, sm3_ce_mod_init);
-module_exit(sm3_ce_mod_fini);
+crypto_module_cpu_feature_match(SM3, sm3_ce_mod_init);
+crypto_module_exit(sm3_ce_mod_fini);
-- 
2.47.3


