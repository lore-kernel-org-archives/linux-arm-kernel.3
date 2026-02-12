Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A366FEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVGkpJTVsL+FyCWcWP400rPsQjsveSWDb4RH3dOg7gE=; b=goY3sel8tNCRVdCqqVb1IiyBZj
	Vq5s6LDOnVU0HvJKKDRtrZTdtGZ5NvuwbFtBTLOdJuQeteEZR/UBA7xfCyy05GW4W5SuzRCcVo0SJ
	o6xE9HXgk3AQgYgvO1hsfXMrDWSnTQiPQ0IgYGd1jthARMbto9f3gR9rQs8oahASg+Z9x7yjhYRYX
	Gybt7hmWxYJPdss25ZD5Q8IcqExCIQt/feGdHhtD5fG8v4Uhg8pBdJWo8hr+CE0Y0raCBuTccG+Ii
	ye7a6CxPdbE9Jw3B0TR4edV7M5Gt22LXgCMNLcuhWqtbAdq1fIwAf3knXZyuY8Y7H1Jld3gDVtsQN
	RRrcf6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN0e-00000001T4v-10WF;
	Thu, 12 Feb 2026 03:04:52 +0000
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.68.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN0a-00000001T3D-12Lp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865488; x=1802401488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UVGkpJTVsL+FyCWcWP400rPsQjsveSWDb4RH3dOg7gE=;
  b=LGRj7g4cQ5dHxwSyH+OYhRATuYPB7t9aqP99f60blf4IRamQBpEdm7sG
   fD7WP7SMIcOr8t0cF1LOcDwxO1afZghOFY5eH6dSs2RVP/jDzVz3/1me6
   Z8TZPZ9qum1w2M4PFXhySy5X89DjdwTf0DI+EFAoNErhTqkNf3a4PX7/O
   b6YcLaTySS+oyvfu772XDfEM8K4Xd9CnZubRdNF56paG65Bn7Xkjo2WiE
   TIG/MLQ9KvebgkGdmcU0+7z7JkUolGdWifQa9osYLBAJFJfWOom8D5Du4
   VvrBNzgY677JdOAsm1iohnF3GPsveSnVXwgaIku/MYheUyF6tShl2F0xy
   Q==;
X-CSE-ConnectionGUID: 18Sxd1zRRqO0OqvE4GnGhg==
X-CSE-MsgGUID: C+082kb1R5iNgXAyweXmng==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12925744"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:04:47 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:9044]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 14d16219-9707-449e-baf1-fbb72541182d; Thu, 12 Feb 2026 03:04:47 +0000 (UTC)
X-Farcaster-Flow-ID: 14d16219-9707-449e-baf1-fbb72541182d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:04:47 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:04:46 +0000
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
Subject: [PATCH 067/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CAMELLIA crypto
Date: Thu, 12 Feb 2026 02:46:43 +0000
Message-ID: <20260212024725.11264-68-wanjay@amazon.com>
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
X-CRM114-CacheID: sfid-20260211_190448_344661_6F15E288 
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
CONFIG_CRYPTO_CAMELLIA-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile           | 2 +-
 crypto/camellia_generic.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index c14713e9cc55..4b6e56ad4d1c 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -137,7 +137,7 @@ CFLAGS_serpent_generic.o := $(call cc-option,-fsched-pressure)  # https://gcc.gn
 crypto-objs-$(CONFIG_CRYPTO_AES) += aes.o
 crypto-objs-$(CONFIG_CRYPTO_SM4) += sm4.o
 crypto-objs-$(CONFIG_CRYPTO_SM4_GENERIC) += sm4_generic.o
-obj-$(CONFIG_CRYPTO_CAMELLIA) += camellia_generic.o
+crypto-objs-$(CONFIG_CRYPTO_CAMELLIA) += camellia_generic.o
 obj-$(CONFIG_CRYPTO_CAST_COMMON) += cast_common.o
 obj-$(CONFIG_CRYPTO_CAST5) += cast5_generic.o
 obj-$(CONFIG_CRYPTO_CAST6) += cast6_generic.o
diff --git a/crypto/camellia_generic.c b/crypto/camellia_generic.c
index ee4336a04b93..15a68abc387b 100644
--- a/crypto/camellia_generic.c
+++ b/crypto/camellia_generic.c
@@ -1064,8 +1064,8 @@ static void __exit camellia_fini(void)
 	crypto_unregister_alg(&camellia_alg);
 }
 
-module_init(camellia_init);
-module_exit(camellia_fini);
+crypto_module_init(camellia_init);
+crypto_module_exit(camellia_fini);
 
 MODULE_DESCRIPTION("Camellia Cipher Algorithm");
 MODULE_LICENSE("GPL");
-- 
2.47.3


