Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6541EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIWUbDso2hbWtxwVUz/a9mSSptFv4Cfh4e5OO2ZoCG8=; b=WH48E0o6Z9jhK77wizDMmA0iUS
	IT5RM/dy6OvBhR4PmR8kpnwBrfX8nnIncb+FhcLB6e62l1wEnsw/jVjkmsQiWtgH3lIuDQ9LCcLbv
	2E+Rvqy51sRQichMUYqwkr2l3Qpc/lZmuWs16OxvQrV6MFRnMTjHGu/8O99+XSRO3A7yLHK68CXWc
	vOGbDtXg9eHphpP7cjaBMWi3Pvrk2Pueqo3cA+7i2LuRog3vXQ1uAQhUVYtZRhvzGsdmV4hwKMNFH
	KmBUrYE7w48VjlkP/+rygr0W2Qheh+MDuksBoqzkFmPGH2Mj1Hg/LkLNAbTB8cAXn62w7Z0qCxjcK
	+0F2cVXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMxd-00000001Rnq-1fTd;
	Thu, 12 Feb 2026 03:01:45 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMxa-00000001Rm4-11z9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865302; x=1802401302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kIWUbDso2hbWtxwVUz/a9mSSptFv4Cfh4e5OO2ZoCG8=;
  b=VLWZ3yz8bnBw8FMqpxyZSRTNqJXSduGKLa4j4ZSS2lbbKknOrkuO5gkp
   XrWIPGPFMku8vw/e8DMrEzTKXznShrM4iCECUDHzbYg/KXm9TG3YHyMFu
   nzRyPVb7JQlHnKpHbPD7KjVQsvflrGGwA/i/PkD628uzG+GwxB3PBVRky
   aYJpE/rfrlFyXuXBrKzbYKBVKp2c4PvADUdkXPQxNpY7W8A1jk16oWEvF
   EslZshsGPyVCbEkLR+piIAMr1vF1z3TeNVLHZC9T2QAryxXBSN8XblecZ
   tOGXHYHCDeKfizzYuXldv4n00phpR4/ImVPNhTSs5/jAdweMQwlW6q7Ki
   A==;
X-CSE-ConnectionGUID: RUexeF1TQV+8qLNAbbKUIw==
X-CSE-MsgGUID: P+8h7CXQQYS/FOsYp8e/pw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12914777"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:01:41 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:10872]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id ee6691ae-a42f-4eb4-9442-ac02083b3a74; Thu, 12 Feb 2026 03:01:41 +0000 (UTC)
X-Farcaster-Flow-ID: ee6691ae-a42f-4eb4-9442-ac02083b3a74
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:01:40 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:01:40 +0000
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
Subject: [PATCH 055/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ADIANTUM crypto
Date: Thu, 12 Feb 2026 02:46:31 +0000
Message-ID: <20260212024725.11264-56-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D043UWC003.ant.amazon.com (10.13.139.240) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190142_335504_5328043B 
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
CONFIG_CRYPTO_ADIANTUM-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile   | 2 +-
 crypto/adiantum.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index c3b0de034a47..34e278185d16 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -97,7 +97,7 @@ crypto-objs-$(CONFIG_CRYPTO_XTS) += xts.o
 crypto-objs-$(CONFIG_CRYPTO_CTR) += ctr.o
 crypto-objs-$(CONFIG_CRYPTO_XCTR) += xctr.o
 crypto-objs-$(CONFIG_CRYPTO_HCTR2) += hctr2.o
-obj-$(CONFIG_CRYPTO_ADIANTUM) += adiantum.o
+crypto-objs-$(CONFIG_CRYPTO_ADIANTUM) += adiantum.o
 crypto-objs-$(CONFIG_CRYPTO_GCM) += gcm.o
 crypto-objs-$(CONFIG_CRYPTO_CCM) += ccm.o
 obj-$(CONFIG_CRYPTO_CHACHA20POLY1305) += chacha20poly1305.o
diff --git a/crypto/adiantum.c b/crypto/adiantum.c
index 5ddf585abb66..8e8e8654432c 100644
--- a/crypto/adiantum.c
+++ b/crypto/adiantum.c
@@ -683,8 +683,8 @@ static void __exit adiantum_module_exit(void)
 	crypto_unregister_template(&adiantum_tmpl);
 }
 
-module_init(adiantum_module_init);
-module_exit(adiantum_module_exit);
+crypto_module_init(adiantum_module_init);
+crypto_module_exit(adiantum_module_exit);
 
 MODULE_DESCRIPTION("Adiantum length-preserving encryption mode");
 MODULE_LICENSE("GPL v2");
-- 
2.47.3


