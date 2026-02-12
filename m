Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F07EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flzSj+E4vNp+VFuNiWmt4wZmmrAwtkhkLySSdZKQetk=; b=DMag5MGwM6Ks57QxNHkykYDzBm
	r1Oh01EwwKcf7jQ5MTzUV+PfrOR3EN0FqpSX2BQCP0xZuOguFc/YWg0B4AMKv9tc4c3qGyKT4rZba
	JyIfUpkOv+pxNxCqRQktYpJGxyApOf6YOJauQRJcGK8Ro40nuwJFJ74ae+1t/epdBfqIBFjc5Xtcy
	39cAqvTXsJGhCPc+KwHY7lQ9jEnP05Zqp4I5ZFbpuo04ieyG3urvJ/y8B8GahrbrZbDAYi6ovfTFf
	aDh42xI+lTucztf10a2xCISUQGqknQCSDKvjHIi/DrEWU3gKQfvUebat0hLnED9UZinUtycK67Elh
	1mkfGJMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMuc-00000001QYm-1edn;
	Thu, 12 Feb 2026 02:58:38 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMuZ-00000001QXK-1CpN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865115; x=1802401115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=flzSj+E4vNp+VFuNiWmt4wZmmrAwtkhkLySSdZKQetk=;
  b=jE+WeGc6y9l+fTcbpFXClEfvSH8q2XcJ/4nIriBjZ/0y+YumFqw2KMIf
   HKE2jwLdE9AKFLFnthDLUXSrLJbOuxT2oduFWDp9Wfisq9cWzdZAvB+Yx
   fs8EdatM9NyG0gjArTtNvo1J/ze6whTmc7XQU2mB18Jktm8FVuD5mbZxW
   tJ4G5uxzbrdxn27lHv5GteDwp+CSbdxCOlsZfmAgbYvkjumWCMWshUBzZ
   h+A0oBBQPqDjnm1gv2RSeFaCsUxukr+otSCULcI154pkkmQQFZ/n3lbpq
   NdX8pjraAH0TJisgJFdPjeg+FwLaO/inooZGON8foqJYQNdxi+f9iiC9P
   w==;
X-CSE-ConnectionGUID: 1enCQATrTYmHXsq6ADvyHA==
X-CSE-MsgGUID: EmF6xoqtT4uyvH1fB4umZw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12726889"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:58:34 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:23999]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id 6fa141b7-5f7c-4da4-a5b3-31d5f2b0c84f; Thu, 12 Feb 2026 02:58:34 +0000 (UTC)
X-Farcaster-Flow-ID: 6fa141b7-5f7c-4da4-a5b3-31d5f2b0c84f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:58:34 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:58:33 +0000
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
Subject: [PATCH 043/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_MD4 crypto
Date: Thu, 12 Feb 2026 02:46:19 +0000
Message-ID: <20260212024725.11264-44-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D038UWC002.ant.amazon.com (10.13.139.238) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185835_587014_8DB606EB 
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
CONFIG_CRYPTO_MD4-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/md4.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 6d1077d11538..32f038ff47de 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -76,7 +76,7 @@ crypto-objs-$(CONFIG_CRYPTO_CMAC) += cmac.o
 crypto-objs-$(CONFIG_CRYPTO_HMAC) += hmac.o
 crypto-objs-$(CONFIG_CRYPTO_XCBC) += xcbc.o
 crypto-objs-$(CONFIG_CRYPTO_NULL) += crypto_null.o
-obj-$(CONFIG_CRYPTO_MD4) += md4.o
+crypto-objs-$(CONFIG_CRYPTO_MD4) += md4.o
 crypto-objs-$(CONFIG_CRYPTO_MD5) += md5.o
 obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
 obj-$(CONFIG_CRYPTO_SHA1) += sha1.o
diff --git a/crypto/md4.c b/crypto/md4.c
index 55bf47e23c13..04a7ce7eb460 100644
--- a/crypto/md4.c
+++ b/crypto/md4.c
@@ -233,8 +233,8 @@ static void __exit md4_mod_fini(void)
 	crypto_unregister_shash(&alg);
 }
 
-module_init(md4_mod_init);
-module_exit(md4_mod_fini);
+crypto_module_init(md4_mod_init);
+crypto_module_exit(md4_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("MD4 Message Digest Algorithm");
-- 
2.47.3


