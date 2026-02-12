Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD9DEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2U4r6CnCmOGklDeQL0VSJ/YoQSeZj8SWz4ge6xbTqqY=; b=vhsg3tt2ruO6CGtH9PyJaL+Hqr
	lWNieub428bo6iFLwEknsWw+3GqXpBLFEwJbXg2xwsk0/QXELmTdL6DnoLbpbjRPPZZgcgblnTVQq
	jbErdO8KGEcDgFTczOwDJ+UDExqK6fpYf9MnSeM8pgM/jfvO5pHjrF3ZkEeSNQZiGzxJL/Xz8lhIr
	/r3o6SXWIcdxDkw8jwcKdhiyn5g5GOzhNnCSgAzHYZU1nPWLJk1FjYh2Ta5ZfiLaI9DZ8j+SlSue7
	zTydR5cnKWcM/dfXYVp479C18pg0mH4RY5/QJ/e1P8BIITfa5OIJcXLz6+DP71QXQMLZ8IOjDYaAv
	ceLr+Pow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNGs-00000001Zqd-0Uxw;
	Thu, 12 Feb 2026 03:21:38 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNGo-00000001Zoz-3FnH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866494; x=1802402494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2U4r6CnCmOGklDeQL0VSJ/YoQSeZj8SWz4ge6xbTqqY=;
  b=g4Bqsz93SEGe8y5R0tk5MnYxULrSifAuXlpdgWxQBt/hdCanC/I3wSzD
   Msxx7kmy+FEjn5leUZp/A6gupq+31gHFYxOAZLk/LlupxL3neTNIJRBMp
   lvwLLTI56elHjMSN1a/li18bhwwDnOem2O05MYHS+lZSxXqYV+Gp3r0hd
   2obbKmi6gWcrSxaxtqzvft2WmXt8KeCWPqSDhXLK/9+Bm7K0ygZsfI6BP
   OfSeiZDzpt1crR6s91wnHY0lbc9SwiJn86XfB8PZiU6oZB39wwf+KoyPf
   8MFOoRxlU2KtuVB/xn1vOX8GQ4gExa1ox09Pjwjn0xTq3oxsdiaCPvKZH
   Q==;
X-CSE-ConnectionGUID: 8kDFm9ogQF6n6C0xe9Y24w==
X-CSE-MsgGUID: cIskVJMhQ/ChfrSyljuIxA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12914408"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:21:33 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:10522]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id 7ec5cc9f-4e1a-4edd-bed2-5bec3bd12a0b; Thu, 12 Feb 2026 03:21:33 +0000 (UTC)
X-Farcaster-Flow-ID: 7ec5cc9f-4e1a-4edd-bed2-5bec3bd12a0b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:21:33 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:21:33 +0000
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
Subject: [PATCH 01/12] arm64: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SM3_NEON crypto
Date: Thu, 12 Feb 2026 03:21:01 +0000
Message-ID: <20260212032117.9166-2-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212032117.9166-1-wanjay@amazon.com>
References: <20260212032117.9166-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D040UWA001.ant.amazon.com (10.13.139.22) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192135_400079_1D6809C2 
X-CRM114-Status: GOOD (  10.88  )
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
CONFIG_CRYPTO_SM3_NEON-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile        | 2 +-
 arch/arm64/crypto/sm3-neon-glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 9f7106424d66..3dcde982c0cc 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -5,7 +5,7 @@
 # Copyright (C) 2014 Linaro Ltd <ard.biesheuvel@linaro.org>
 #
 
-obj-$(CONFIG_CRYPTO_SM3_NEON) += sm3-neon.o
+crypto-objs-$(CONFIG_CRYPTO_SM3_NEON) += sm3-neon.o
 sm3-neon-y := sm3-neon-glue.o sm3-neon-core.o
 
 obj-$(CONFIG_CRYPTO_SM3_ARM64_CE) += sm3-ce.o
diff --git a/arch/arm64/crypto/sm3-neon-glue.c b/arch/arm64/crypto/sm3-neon-glue.c
index 15f30cc24f32..d388e3adfad4 100644
--- a/arch/arm64/crypto/sm3-neon-glue.c
+++ b/arch/arm64/crypto/sm3-neon-glue.c
@@ -58,8 +58,8 @@ static void __exit sm3_neon_fini(void)
 	crypto_unregister_shash(&sm3_alg);
 }
 
-module_init(sm3_neon_init);
-module_exit(sm3_neon_fini);
+crypto_module_init(sm3_neon_init);
+crypto_module_exit(sm3_neon_fini);
 
 MODULE_DESCRIPTION("SM3 secure hash using NEON instructions");
 MODULE_AUTHOR("Jussi Kivilinna <jussi.kivilinna@iki.fi>");
-- 
2.47.3


