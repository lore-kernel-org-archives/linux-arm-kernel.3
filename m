Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A931EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZLY2RdWFAnfhdQV4nMnvlY/DhIxSQaBwFJhqH+s+gw=; b=Iv2fKGI+p6YxQ8gkxQPwckeWPf
	4lr9r9248XmucPv3FGZmvKQZ4H885jOSXnVha1+7YUfjN9T1GDNxxAIBLWW+n4ZoZqsgJWF3m1gI+
	K5lfMoolNQSg47enKwe33+8zplTEB9p5HkK6A6BIBxaRGU/wzixL03tbFOtqe4Ado0YbolFQxqdFR
	2bzct5g3mFVDmF0AR7W3JhC8yqnPdwH9sxU6uV2lZF5jYIJ7PQH9oPNEBSnm932b32FHEfH64HYec
	TcY4utXPKS/469gq/S8vv33kMVf35Zr9sgHhRhTTSgnByfszBLKNJQRKV1EsZbVO12HAzTQMqUhaD
	uqSM8p4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMyd-00000001SEH-14V1;
	Thu, 12 Feb 2026 03:02:47 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMyZ-00000001SCb-2mtG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865363; x=1802401363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zZLY2RdWFAnfhdQV4nMnvlY/DhIxSQaBwFJhqH+s+gw=;
  b=O010gFeKj88yC/qsMrIXB+J+RxP/zjBUiYAwRK6q5Ll1vlng3dq54bUP
   9kYD/uZ0zrg4pQGB0d1wRb+Rx/lLBkrgGuSKXTDHlOLqAfx7eJ45hhHJf
   QmeBg58wF+/Dk9QoYjtL0dZz5C3foPN6lQjM5odXeOrnEjpJAq6HZ7JiM
   3j/CzHbGP0r6GeTChF78VGfUCoG+nJiqkGohkSFWhb9IOpCe1160umZwT
   +uYeed4o7Ri0NqzoXBOAPJgYctB4dMxXBVFCOwIss54U8BQJDrWCamZCJ
   T9U/iRSaaJvFzy/Oqjf+gG53JWxyzc9kYWoKM0D0z4soPMkknnDAcmNJk
   Q==;
X-CSE-ConnectionGUID: pqsTA/wHTXqJut1X1+SSwQ==
X-CSE-MsgGUID: CJwS5mjkSwGtxbS/dIDCVg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12721958"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:02:43 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:8677]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id cdf3a59c-ab7a-4fbd-8af7-ab8a28d38c5c; Thu, 12 Feb 2026 03:02:42 +0000 (UTC)
X-Farcaster-Flow-ID: cdf3a59c-ab7a-4fbd-8af7-ab8a28d38c5c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:02:42 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:02:42 +0000
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
Subject: [PATCH 059/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_PCRYPT crypto
Date: Thu, 12 Feb 2026 02:46:35 +0000
Message-ID: <20260212024725.11264-60-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D041UWA001.ant.amazon.com (10.13.139.124) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190243_752003_B79A1A16 
X-CRM114-Status: GOOD (  10.95  )
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
CONFIG_CRYPTO_PCRYPT-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add pcrypt.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/pcrypt.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index cb1761303151..b371a8788d39 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -124,7 +124,7 @@ endif
 # Enable <arm_neon.h>
 CFLAGS_aegis128-neon-inner.o += -isystem $(shell $(CC) -print-file-name=include)
 
-obj-$(CONFIG_CRYPTO_PCRYPT) += pcrypt.o
+crypto-objs-$(CONFIG_CRYPTO_PCRYPT) += pcrypt.o
 obj-$(CONFIG_CRYPTO_CRYPTD) += cryptd.o
 obj-$(CONFIG_CRYPTO_DES) += des_generic.o
 obj-$(CONFIG_CRYPTO_FCRYPT) += fcrypt.o
diff --git a/crypto/pcrypt.c b/crypto/pcrypt.c
index c3a9d4f2995c..b9cf7df64c4e 100644
--- a/crypto/pcrypt.c
+++ b/crypto/pcrypt.c
@@ -378,8 +378,8 @@ static void __exit pcrypt_exit(void)
 	kset_unregister(pcrypt_kset);
 }
 
-module_init(pcrypt_init);
-module_exit(pcrypt_exit);
+crypto_module_init(pcrypt_init);
+crypto_module_exit(pcrypt_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Steffen Klassert <steffen.klassert@secunet.com>");
-- 
2.47.3


