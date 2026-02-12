Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4355FEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HT5pUFfRtNdmaHcR0SSBqhBpNZ+brjSlqbDtML0bJo=; b=s+Hn+OCqm0nsd9NF0sMTzSjsZ7
	Wu8759zNGzpV0TRHL3gszhoDi0B180wEhI5FkXHD62VzS8cj2HrNz6LTo8O06hshl6/CRDZU/IEfn
	jUDbT+0sqx/lZnGsOuHUWBVmJOp39X0zuIrs4WFsYSlrs2YOsuEuiV9eHBlkoAncLeneR/RpAm2Bo
	GHm1hOHcRxDTyXCz88F2UGYVyyCxPe45ov6gJdapGj0rKEvNn0iyGWe+fZOksV7DZFKOE9CZ0cJ1m
	C5OD4/uIFQdyN6LvPtBUHeLDjIPpH7TJr5B+O8YHSrIpeV2yGKIG4tcJ8gAKGQgHx8QKriFSm6wzv
	vD9zWcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN3P-00000001UEQ-0mGt;
	Thu, 12 Feb 2026 03:07:43 +0000
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.13.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN3L-00000001UCu-0Enl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865659; x=1802401659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8HT5pUFfRtNdmaHcR0SSBqhBpNZ+brjSlqbDtML0bJo=;
  b=MI1JeAeVVvpp/Auv1atwly9nS25wzHZcf+FcsRKrfKtHWyZcteaZDYL9
   0IKu81DoqOoLD5kP1/nO04TkO5fHcocfYykgDdaTk6w8H6vWXqUTet7gZ
   7eh498VKevgQl/Z4gqdSueunLHgL/z7m3Kswkg6io19ldL3hgaQlA4dPw
   GY18YJJlNrcQO2r0aFKsCcvNnfQevdl5aiRGurHIYbWM9JnC0v4T01zjp
   zYd39lL7P1+YxiyT4wzEgfZj3RtkiCrgclHPLefLJAD/MZqQpWXH2+2x/
   qblzD2A1gFp1dMCS3fWAfiEP52NoPlUZ84ruxttsRhNM+Y7VYgVLey/Bs
   g==;
X-CSE-ConnectionGUID: dpbJkPemSLy+0QziAT83jA==
X-CSE-MsgGUID: 3GXbqp4ZSZCLMRl1nDIoxA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918308"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:07:38 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:15419]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id 5c64bbef-ea54-4804-bff1-9c18259562d1; Thu, 12 Feb 2026 03:07:38 +0000 (UTC)
X-Farcaster-Flow-ID: 5c64bbef-ea54-4804-bff1-9c18259562d1
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:07:38 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:07:37 +0000
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
Subject: [PATCH 078/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_MICHAEL_MIC crypto
Date: Thu, 12 Feb 2026 02:46:54 +0000
Message-ID: <20260212024725.11264-79-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D040UWB003.ant.amazon.com (10.13.138.8) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190739_148750_E4CF4488 
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
CONFIG_CRYPTO_MICHAEL_MIC-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile      | 2 +-
 crypto/michael_mic.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index a989d103c191..f8cd388ca03c 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -150,7 +150,7 @@ crypto-objs-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
 crypto-objs-$(CONFIG_CRYPTO_CHACHA20) += chacha.o
 CFLAGS_chacha.o += -DARCH=$(ARCH)
 crypto-objs-$(CONFIG_CRYPTO_DEFLATE) += deflate.o
-obj-$(CONFIG_CRYPTO_MICHAEL_MIC) += michael_mic.o
+crypto-objs-$(CONFIG_CRYPTO_MICHAEL_MIC) += michael_mic.o
 obj-$(CONFIG_CRYPTO_CRC32C) += crc32c-cryptoapi.o
 crc32c-cryptoapi-y := crc32c.o
 obj-$(CONFIG_CRYPTO_CRC32) += crc32-cryptoapi.o
diff --git a/crypto/michael_mic.c b/crypto/michael_mic.c
index 69ad35f524d7..8acdf39a7004 100644
--- a/crypto/michael_mic.c
+++ b/crypto/michael_mic.c
@@ -167,8 +167,8 @@ static void __exit michael_mic_exit(void)
 }
 
 
-module_init(michael_mic_init);
-module_exit(michael_mic_exit);
+crypto_module_init(michael_mic_init);
+crypto_module_exit(michael_mic_exit);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Michael MIC");
-- 
2.47.3


