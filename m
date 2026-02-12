Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34134EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v30rZp4i+5voMyaGtVYP7bAFYIxv6GrOaq3WTbl/qhw=; b=h3rdVWc25TJN87m7Rb3BUXjl+D
	QZvlboO4dAbObsFSFBmB4mKz3JoCrn5jnmSGabxveCW2LN9AUJ1bL4K0GUm+3QCHT+MSf/PJnaRxn
	D7w0ZuHUYA4igx/eBQ3ujJlvqY1YtdXxJDyhmvGyYXzxPo1FvAbtbP9uPPGFuLKrEKYsZV+DLWtnf
	D0ocYWn7+NrbCONlJgAVl6SCh+Q+4yYZUjkUY5aFNDxSD1iXtvowcBYt+as9OoZEO92rRgQ32Wv0b
	aJ/DHcGqIdUQov0ZHgMk1bMx78UWKet1l35hcnwvCpssBGzsb9jOjzfKAa8ThzcNB0pJfxHmxZv2x
	gXaI1atg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMpN-00000001OMy-3Uy3;
	Thu, 12 Feb 2026 02:53:13 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMpK-00000001OLY-2Vgb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864790; x=1802400790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v30rZp4i+5voMyaGtVYP7bAFYIxv6GrOaq3WTbl/qhw=;
  b=DAzAefgLVchKBiRnWu/McEP43MDW/9xnaz5xCttos8+GyMMrl4IeXwOT
   +F5+tycePwC+bd6o9UhecDN1FeyniNPEK2dS2H1h809hbPn16cWFXUN0E
   o3Tjjyo3huRZXxNXcONN2zska/ZTznkNkgL381fvThjDfVWXkoxQJlqxk
   9mtGpcf6n+YjLj4N+sXdSwg5JsQAqCvCZ+wFSHX1Y0x3VgaqWkvzC0bFX
   sWOH3VpQHyN04cL/lFU1v6G7Y+RUKcX+wZJd5Z1cIiMnEJh1yfEVxU/Gh
   w5GA6qiC1oE67ukXjwyODmonm+SwiNPeXn+6S04TWalAMOcSHMARXvz8W
   Q==;
X-CSE-ConnectionGUID: amvACGz8Qq+fiuzZS9zCEg==
X-CSE-MsgGUID: 6ddnNv3kQo2hJM3GoIBlHg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12696481"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:53:09 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:17579]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id 10896a61-78a7-42bf-abff-cbcd0e54b5fb; Thu, 12 Feb 2026 02:53:09 +0000 (UTC)
X-Farcaster-Flow-ID: 10896a61-78a7-42bf-abff-cbcd0e54b5fb
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:53:08 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:53:07 +0000
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
Subject: [PATCH 022/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CBC crypto
Date: Thu, 12 Feb 2026 02:45:58 +0000
Message-ID: <20260212024725.11264-23-wanjay@amazon.com>
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
X-CRM114-CacheID: sfid-20260211_185310_686748_5CFC36B0 
X-CRM114-Status: GOOD (  10.63  )
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
CONFIG_CRYPTO_CBC-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add cbc.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/cbc.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 11a6714dee42..354ce7a46a0a 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -89,7 +89,7 @@ obj-$(CONFIG_CRYPTO_WP512) += wp512.o
 CFLAGS_wp512.o := $(call cc-option,-fno-schedule-insns)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
 obj-$(CONFIG_CRYPTO_BLAKE2B) += blake2b.o
 crypto-objs-$(CONFIG_CRYPTO_ECB) += ecb.o
-obj-$(CONFIG_CRYPTO_CBC) += cbc.o
+crypto-objs-$(CONFIG_CRYPTO_CBC) += cbc.o
 obj-$(CONFIG_CRYPTO_PCBC) += pcbc.o
 obj-$(CONFIG_CRYPTO_CTS) += cts.o
 obj-$(CONFIG_CRYPTO_LRW) += lrw.o
diff --git a/crypto/cbc.c b/crypto/cbc.c
index ed3df6246765..03ee7008ab12 100644
--- a/crypto/cbc.c
+++ b/crypto/cbc.c
@@ -179,8 +179,8 @@ static void __exit crypto_cbc_module_exit(void)
 	crypto_unregister_template(&crypto_cbc_tmpl);
 }
 
-module_init(crypto_cbc_module_init);
-module_exit(crypto_cbc_module_exit);
+crypto_module_init(crypto_cbc_module_init);
+crypto_module_exit(crypto_cbc_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("CBC block cipher mode of operation");
-- 
2.47.3


