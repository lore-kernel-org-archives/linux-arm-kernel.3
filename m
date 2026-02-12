Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C31CEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhYhP9Nwc0ZhnGAnRt+3Lc67Lhm35xrT4r4Ii6JFG0I=; b=NBJFawjX/+cZIsT2tghiTz855f
	RTwzNvZ8BBKDZ2tRBDwjsAmQ/8bkVlltM5AGkAbLymIZhUErmuIm6KUqERzXJixgAyMaJtE0ebcXZ
	TThAUxOxB+yvmpKYQJPc1PNhD+8lVbe4vNtD12dbWCNsupYR8hA8BkF4BP8kzXowZSjfVlL/kf8KH
	N869is1YQ7gbwgyCuqqxwGotK9HFPqHjUA/cDoccWvk1a4jV1E64rQCuApLNbsNHb8mM/PsidiB4T
	O3L3fZzx5B++XS2L3vQo2T4/C0n3IpBvdCb2kME0Npc5tomsEHHotJuo2YPBgMK+zNNbJ6tUDKvv0
	+Jt/ESqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN9f-00000001Wor-1EzM;
	Thu, 12 Feb 2026 03:14:11 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN9c-00000001Wmw-01OY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866048; x=1802402048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BhYhP9Nwc0ZhnGAnRt+3Lc67Lhm35xrT4r4Ii6JFG0I=;
  b=juUwVSLICWEIZNcsc8VKd9YoOTkIfytQinmLDYH8LRl+8giMIUsZ/3lq
   CQvgqa22g1jn3ps9bVIDlxoHAohrL9TlorK0mEaTDa06LZWbuF4d6jmY9
   003ubLzkO2FIsd8+YWTeSVWQmJl7limZyIkPi1fagnAc2Np2Am2512ZfE
   xYrTZtib2TfAMpvjfRVe2ARbLyE9rWw7d7PAHOlFG5MIMHIbKpT3DwSFC
   4b1WIKxNJQp33LOtLO4KGDw1VTSCXN+h5UrN0aO01gYo8eFHNLmS873Go
   KNDLgDB5OcuEh/6HqovyVg2rFfZfjG++DzNEUHEiAuA1lTFNlMkOTWpqv
   Q==;
X-CSE-ConnectionGUID: K2SFhIq/Tw6BQcpYkbJqNw==
X-CSE-MsgGUID: +PseZSO7QA6C1V1vO05c+g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12727739"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:14:07 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:5626]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id a23d19c4-fc7d-406e-8c39-56ceed057616; Thu, 12 Feb 2026 03:14:07 +0000 (UTC)
X-Farcaster-Flow-ID: a23d19c4-fc7d-406e-8c39-56ceed057616
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:14:06 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:14:05 +0000
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
Subject: [PATCH 103/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_PKCS7_TEST_KEY crypto
Date: Thu, 12 Feb 2026 02:47:19 +0000
Message-ID: <20260212024725.11264-104-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWA003.ant.amazon.com (10.13.139.18) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191408_104213_16949DD2 
X-CRM114-Status: GOOD (  11.65  )
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
CONFIG_PKCS7_TEST_KEY-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/asymmetric_keys/Makefile         | 2 +-
 crypto/asymmetric_keys/pkcs7_key_type.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index 3fdd11ea399a..6a17f563c359 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -63,7 +63,7 @@ $(obj)/pkcs7.asn1.o: $(obj)/pkcs7.asn1.c $(obj)/pkcs7.asn1.h
 #
 # PKCS#7 parser testing key
 #
-obj-$(CONFIG_PKCS7_TEST_KEY) += pkcs7_test_key.o
+crypto-objs-$(CONFIG_PKCS7_TEST_KEY) += pkcs7_test_key.o
 pkcs7_test_key-y := \
 	pkcs7_key_type.o
 
diff --git a/crypto/asymmetric_keys/pkcs7_key_type.c b/crypto/asymmetric_keys/pkcs7_key_type.c
index b930d3bbf1af..a6921222ced1 100644
--- a/crypto/asymmetric_keys/pkcs7_key_type.c
+++ b/crypto/asymmetric_keys/pkcs7_key_type.c
@@ -4,8 +4,8 @@
  * Copyright (C) 2014 Red Hat, Inc. All Rights Reserved.
  * Written by David Howells (dhowells@redhat.com)
  */
-
 #define pr_fmt(fmt) "PKCS7key: "fmt
+#include <crypto/api.h>
 #include <linux/key.h>
 #include <linux/err.h>
 #include <linux/module.h>
@@ -91,5 +91,5 @@ static void __exit pkcs7_key_cleanup(void)
 	unregister_key_type(&key_type_pkcs7);
 }
 
-module_init(pkcs7_key_init);
-module_exit(pkcs7_key_cleanup);
+crypto_module_init(pkcs7_key_init);
+crypto_module_exit(pkcs7_key_cleanup);
-- 
2.47.3


