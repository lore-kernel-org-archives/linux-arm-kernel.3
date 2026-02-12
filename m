Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69998EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NI2PfmD6OuyEoTp2u9rN9HWYc/bWOUYLMyNOSV5ios=; b=xU6QcZ0z9Qn6VofakmMSF7LWUO
	RJXbnS/xQkwTuMn3AheafgSwRhsdfVRI0DPO+6k/3k0DHpSvG6VbD+RwwCOE/+zJHzKMSx3ytwToI
	lBHC9GVyq2UdF/NYXOE9OVI6GnJXQ6j9TLGs3hbe03J3WiKIt7ZNqxIljHdKaBNjcySQFCTMTFl/a
	U7DFQiGNCsckCJfv0BIigPwdZa7+RxhJW80ybFnNW7bFyghN42oKO8WlJEHtJ/3kSu/COY+SxCrdK
	ElqxHT16bkCx/XD1kjPKTk1GRjCti2JLDOF8GUF/QsdD9R9aWhb59hQKzmScq5/HkMi+E5QUCygVO
	DOBiUi2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMuA-00000001QMX-2zzt;
	Thu, 12 Feb 2026 02:58:11 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMu7-00000001QL4-4Bep
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865088; x=1802401088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/NI2PfmD6OuyEoTp2u9rN9HWYc/bWOUYLMyNOSV5ios=;
  b=VC6/QT7SxBLDo5lxarizvAgi5bT8FjsU7IDoi0iOgGHvBSq7VC4f42XH
   3ztaMZIjb7aD5XD/k06K12Uq0Uw4G/uyL3Ju5S8ZBtVVdxrS82lJWtvDB
   goDd1EYjV84W2JCN2ucHhV8g1I1sl9226ADGFVGs4PJuEbnIcxHYslSPT
   tngj+xTX8tyu//odHf9dSQsvRtRUjykMJpiLOmFShFE6klrsd2+qZ3R6Q
   INy7NBIoz/RIuH0h40i0jpQJXJyL5xFNm1ooiItJxnjWSnzso4u/DcrIF
   KChJf6hlRdjfrtP9pp3XsoVkbob9BE18uYmrKVko6F70GxvGL//+D4jU1
   Q==;
X-CSE-ConnectionGUID: iY17iKHqRii/0rwsUreXAQ==
X-CSE-MsgGUID: OLoTjgcMQj++yJMF1IUxQg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12721724"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:58:07 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:5793]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 90e4dd92-6de5-4519-8f52-cbf819f55310; Thu, 12 Feb 2026 02:58:07 +0000 (UTC)
X-Farcaster-Flow-ID: 90e4dd92-6de5-4519-8f52-cbf819f55310
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:58:03 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:58:02 +0000
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
Subject: [PATCH 041/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_XCBC crypto
Date: Thu, 12 Feb 2026 02:46:17 +0000
Message-ID: <20260212024725.11264-42-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWB001.ant.amazon.com (10.13.139.187) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185808_098405_96081232 
X-CRM114-Status: GOOD (  10.72  )
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
CONFIG_CRYPTO_XCBC-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/xcbc.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 390d38d17e4b..c98e6a397159 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -74,7 +74,7 @@ crypto-objs-$(CONFIG_CRYPTO_MANAGER2) += cryptomgr.o
 crypto-objs-$(CONFIG_CRYPTO_USER) += crypto_user.o
 crypto-objs-$(CONFIG_CRYPTO_CMAC) += cmac.o
 crypto-objs-$(CONFIG_CRYPTO_HMAC) += hmac.o
-obj-$(CONFIG_CRYPTO_XCBC) += xcbc.o
+crypto-objs-$(CONFIG_CRYPTO_XCBC) += xcbc.o
 obj-$(CONFIG_CRYPTO_NULL) += crypto_null.o
 obj-$(CONFIG_CRYPTO_MD4) += md4.o
 crypto-objs-$(CONFIG_CRYPTO_MD5) += md5.o
diff --git a/crypto/xcbc.c b/crypto/xcbc.c
index 6c5f6766fdd6..90da46fe3bb7 100644
--- a/crypto/xcbc.c
+++ b/crypto/xcbc.c
@@ -199,8 +199,8 @@ static void __exit crypto_xcbc_module_exit(void)
 	crypto_unregister_template(&crypto_xcbc_tmpl);
 }
 
-module_init(crypto_xcbc_module_init);
-module_exit(crypto_xcbc_module_exit);
+crypto_module_init(crypto_xcbc_module_init);
+crypto_module_exit(crypto_xcbc_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("XCBC keyed hash algorithm");
-- 
2.47.3


