Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39FBEDF022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89RAHbymNlpPr5HhU6ZsHWvoiW8igRCRiXYsg7/UfNg=; b=kuCb12H1CMrZ21I7LwSQIL42rs
	PkHPxhFydvVA2fecRJzo4EuOFGL4VQxtVmS8b/UO1dCeGKpiTJw6zVz7qBtSpNWQcC+XrKerXWeui
	4B7JcaJ98ZSeF48noM/sWgKErRUS7E19aiINx1f5Y1E9MOlb7MfRlc4cEzUL26dMIH+L9y7IU3bzg
	GSiXsHrruOi4y1nyjLFumZcZE0fZBfQubOEUNL2T7bT9kBjmXuUCv2KWcCml1ca73LD/VZOeY9kOr
	ZKbmbyD0vPzaAmEKTWrffwaOSH6QWh68rW3H9vnGoA18z0joFkFB5ee6H8PHjxjMxlVqcShecaaiB
	ZoWSMgPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMz7-00000001SRD-22f1;
	Thu, 12 Feb 2026 03:03:17 +0000
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.35.192.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMz5-00000001SPy-1NGm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865395; x=1802401395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=89RAHbymNlpPr5HhU6ZsHWvoiW8igRCRiXYsg7/UfNg=;
  b=gte8YKTicvwdFKXv6T2Mfk+FTaN4D6P44UOf6YAo9IN+RNNDutlqDtdd
   gvGxPIeyKrwhuufvKFed2CY1IJ8/0tWTa80RDuGYVZHz74LQ7e1rz/Xu2
   1H0DtRNSBzanqDkzauvQXjUwqKcV8grCWqnbOJS7VcIm4FhBHhbhxZihY
   trzk0Z4itka5qcDzTkzIrUiyy8tZXeG46WnHJO4R7N2PLrcimwyHBR7uV
   yzn3EB9jRZttmGObmB8dkX+f+YSNkQs8xKsNskZa13f7/cOK+JAfzTjHf
   oJRjO+mHFnus9VEONsl7H5rn+5LZn6LfkrdFOhlLWvoWzr8uOKmo4eiGo
   g==;
X-CSE-ConnectionGUID: oRxsmPxTTBi0aXVA5yEpUA==
X-CSE-MsgGUID: ty0GsxmTTWayBMRs93rtCw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12698619"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:03:14 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:6394]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id 4b5f2fa1-eb0e-468e-b07c-e089398f5ca2; Thu, 12 Feb 2026 03:03:14 +0000 (UTC)
X-Farcaster-Flow-ID: 4b5f2fa1-eb0e-468e-b07c-e089398f5ca2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:03:13 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:03:13 +0000
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
Subject: [PATCH 061/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_DES crypto
Date: Thu, 12 Feb 2026 02:46:37 +0000
Message-ID: <20260212024725.11264-62-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D045UWC002.ant.amazon.com (10.13.139.230) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190315_415706_99E36F7D 
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
CONFIG_CRYPTO_DES-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile      | 2 +-
 crypto/des_generic.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index f029e0decaa1..05fdb0e2f1be 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -126,7 +126,7 @@ CFLAGS_aegis128-neon-inner.o += -isystem $(shell $(CC) -print-file-name=include)
 
 crypto-objs-$(CONFIG_CRYPTO_PCRYPT) += pcrypt.o
 crypto-objs-$(CONFIG_CRYPTO_CRYPTD) += cryptd.o
-obj-$(CONFIG_CRYPTO_DES) += des_generic.o
+crypto-objs-$(CONFIG_CRYPTO_DES) += des_generic.o
 obj-$(CONFIG_CRYPTO_FCRYPT) += fcrypt.o
 obj-$(CONFIG_CRYPTO_BLOWFISH) += blowfish_generic.o
 obj-$(CONFIG_CRYPTO_BLOWFISH_COMMON) += blowfish_common.o
diff --git a/crypto/des_generic.c b/crypto/des_generic.c
index fce341400914..8f767317d396 100644
--- a/crypto/des_generic.c
+++ b/crypto/des_generic.c
@@ -122,8 +122,8 @@ static void __exit des_generic_mod_fini(void)
 	crypto_unregister_algs(des_algs, ARRAY_SIZE(des_algs));
 }
 
-module_init(des_generic_mod_init);
-module_exit(des_generic_mod_fini);
+crypto_module_init(des_generic_mod_init);
+crypto_module_exit(des_generic_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("DES & Triple DES EDE Cipher Algorithms");
-- 
2.47.3


