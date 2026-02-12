Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DB1EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vWX0a4qQ14IGJyedsTYswL2DcxXyVZNEIUDTHMr80E=; b=0Yu5OEz8ZZdhHEvh3M0DJGPCOD
	mmNobKWnVz1CmXWq7DOlWxgsiaweJ1DtWoA+UoBR1ZmqKHcwKP2ma4rl+GQx9GUlXd1+WWwPBWrBJ
	OFTI9qvwijqkAx0ULROGJSw3q+J5miXxGlKBfkSuCryH1hXmHIpKlsZ+l1izF+eikL8R8tWSe9NOe
	dAwoAIV3HdPvjeW/4h1pb2R26Mz3aeeyE+Z5sIELzWESzFI7/G3f93pIi22xCwnDQcQ+JXVBRXk9s
	L+gYM0L0oJ2sunnUbWCIz6TGy6G1v+LNVLDgmU3YNfGU/9jQcdjAu0RthugCfOVIA4gJG3xQX6BFU
	B09Qv+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMns-00000001Njw-1UcN;
	Thu, 12 Feb 2026 02:51:40 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMno-00000001Nhr-1CGS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864696; x=1802400696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/vWX0a4qQ14IGJyedsTYswL2DcxXyVZNEIUDTHMr80E=;
  b=KieYD7jAJo5YgV0nexkw37HAPls2VvNFfjg6g4Gn+fCyLH442uR86sYZ
   seO3IU0myA9u52Uogwqjq6gcSxpGAojrg/7scakE4KisYs7s3reEFCX5P
   ByH708FpCEyZ7C3oX2kZh8+kERNKjtryp2amLfkMCUl9FkYKNV30c8drg
   U6HtLt1EJ+98r9GIOHroe6PbMwGDfqeASP0pbPRMZ2lcHdbWvHAu0w0Ii
   oM2P4vAuXD64TM6GGkdXyRVrQBsD8UqMpKgVwbR639aRhfX0Qxw+zEyt3
   pio5ayBJpS8YbD+4BvYAp351gM7sVOlTW3y2RVxiioPpM99L+5DOQIAFN
   w==;
X-CSE-ConnectionGUID: 0XsWAEVJSfGju+jBufUPng==
X-CSE-MsgGUID: AVy03fj9Q4S+Y/fX3F8g/A==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12743985"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:51:35 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:29299]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id 1cda09d3-f880-41aa-9f7e-26fe74fc0c0e; Thu, 12 Feb 2026 02:51:35 +0000 (UTC)
X-Farcaster-Flow-ID: 1cda09d3-f880-41aa-9f7e-26fe74fc0c0e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:51:35 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:51:34 +0000
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
Subject: [PATCH 016/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_HMAC crypto
Date: Thu, 12 Feb 2026 02:45:52 +0000
Message-ID: <20260212024725.11264-17-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D035UWA004.ant.amazon.com (10.13.139.109) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185138_134594_71F87452 
X-CRM114-Status: GOOD (  10.75  )
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
CONFIG_CRYPTO_HMAC-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add hmac.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/hmac.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index d37e00783f84..4d03d612b942 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -73,7 +73,7 @@ cryptomgr-y := algboss.o testmgr.o
 crypto-objs-$(CONFIG_CRYPTO_MANAGER2) += cryptomgr.o
 obj-$(CONFIG_CRYPTO_USER) += crypto_user.o
 crypto-objs-$(CONFIG_CRYPTO_CMAC) += cmac.o
-obj-$(CONFIG_CRYPTO_HMAC) += hmac.o
+crypto-objs-$(CONFIG_CRYPTO_HMAC) += hmac.o
 obj-$(CONFIG_CRYPTO_XCBC) += xcbc.o
 obj-$(CONFIG_CRYPTO_NULL) += crypto_null.o
 obj-$(CONFIG_CRYPTO_MD4) += md4.o
diff --git a/crypto/hmac.c b/crypto/hmac.c
index 148af460ae97..d8d24a2ea2f7 100644
--- a/crypto/hmac.c
+++ b/crypto/hmac.c
@@ -573,8 +573,8 @@ static void __exit hmac_module_exit(void)
 	crypto_unregister_templates(hmac_tmpls, ARRAY_SIZE(hmac_tmpls));
 }
 
-module_init(hmac_module_init);
-module_exit(hmac_module_exit);
+crypto_module_init(hmac_module_init);
+crypto_module_exit(hmac_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("HMAC hash algorithm");
-- 
2.47.3


