Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01740EDF022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2Rpzps0Oa5rg5hYsgU73AtKwAF+xz1ix5AubhMOHf8=; b=fYINk+n1MtXoh/pWW9EETywDAb
	gLS8ZB2f3Rnuj0Roqm1Huh2yQfk2CxkUtzCL79pTcY6vTbSkrEowe5uOn9yz5lAQjZorc+27ag4wJ
	daewc00JO6sBYzFPXAKzFQSakpx8zvQVNXW34XD4tTvHbkC+wnLBXTlIa+zkeuczXLX3zhbFM2p6S
	ZVGKtBzd20nR7G1Yc2BeZBczyRJPWAEBidMZdi5RR4Z3WnDnQ4bwFNZPGBESbS7cd3fvgOptoD+fv
	fvYgba0Rr4IJDoY/ieHcTUP337UgOsdW8KFZ7bh4yhkJIMUUI5KB8VCM3NmDONmOj9GsD54qdgwAm
	7ofxF7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN4u-00000001Upw-0JxI;
	Thu, 12 Feb 2026 03:09:16 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN4r-00000001Uns-0cyd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865753; x=1802401753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S2Rpzps0Oa5rg5hYsgU73AtKwAF+xz1ix5AubhMOHf8=;
  b=dUOsMKU60qmj1sbSN23NeEaEGBZhs3wfKlN8tR0B/LWxFAyezH/Ugw/E
   Sk3bIVoz7VX89vwkN36Ze+jYt/A6F8v31jquIu7XOi8cTEcIwryJbSnjX
   OgpnJZA6gEf3RhxLy7/SvF+Qe7n7z64xXHoOEO1uTW2qYLG8/RBZ16l3Y
   KyC0GSWJlH+8no8uI5v0RoowVyjT5Z3dfumu3gLJtDnWk7Qsn/Jy5QiUX
   sRGdz6cK1/z6fq7yWIdH++dD4aqsQcjo6foZ6A08DgQcq1DyXmZEDqrTC
   QEFlG/nfM48OM93zpCHJ98f/w0hIZy8+xBtV4BSqlaHZ8BvBxnIvrNtZg
   w==;
X-CSE-ConnectionGUID: odrC3xJ6RU61Ri2tcYCfwA==
X-CSE-MsgGUID: /zHWV04WQuulNwhDtABq4Q==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919576"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:09:12 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:24085]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id fd432ae4-86c1-441e-b6a9-bb7247355fe2; Thu, 12 Feb 2026 03:09:12 +0000 (UTC)
X-Farcaster-Flow-ID: fd432ae4-86c1-441e-b6a9-bb7247355fe2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:09:11 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:09:10 +0000
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
Subject: [PATCH 084/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE crypto
Date: Thu, 12 Feb 2026 02:47:00 +0000
Message-ID: <20260212024725.11264-85-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D036UWC003.ant.amazon.com (10.13.139.214) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190913_247181_317D1958 
X-CRM114-Status: GOOD (  13.25  )
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

Unlike most patches, we do not add a DECLARE_CRYPTO_API() wrapper for the
exported function in crypto/jitterentropy.h. This is because this header is
used by both jitterentropy_rng.o and jitterentropy-testing.o, but the
compilation flags for jitterentropy_rng.o do not support declaration of a
static call key.

This is acceptable since the only user of this exported function is
jitterentropy_rng.o itself. The jitterentropy-testing.o code will naturally
either be included alongside jitterentropy_rng.o in the crypto kernel
module, or it will be disabled.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 66319c92a983..d1db3a1e3b3b 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -169,7 +169,7 @@ CFLAGS_jitterentropy.o = -O0
 KASAN_SANITIZE_jitterentropy.o = n
 UBSAN_SANITIZE_jitterentropy.o = n
 jitterentropy_rng-y := jitterentropy.o jitterentropy-kcapi.o
-obj-$(CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE) += jitterentropy-testing.o
+crypto-objs-$(CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE) += jitterentropy-testing.o
 obj-$(CONFIG_CRYPTO_BENCHMARK) += tcrypt.o
 crypto-objs-$(CONFIG_CRYPTO_GHASH) += ghash-generic.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API) += af_alg.o
-- 
2.47.3


