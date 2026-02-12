Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FD5EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3iy5AzhfysAv3JsLqwI5fBQHgwNeM/C4lM3EsRiivc=; b=xFarjgdMJSC2p04KsN4MFMNCai
	z99Ko7VxpgzCDlpQ5wmOT4qHuKv96/DgdF50l5norNx9v6eo2fJrhQc0xo2NeYokvRDII3WZiYkrK
	yXvdlqDC58w2EHBt8AxxIaAdiGshcVcfUK/8Py7/06lZFVbkBhJxGuj25TN1uMCaRITm0BpNpJLRJ
	E5D5XRB2B63NwTCgNRYe8elZCJa7fIf4y5VoTbvg/F18ra28cbm05o8/5lcnvyymc6IduENC/tPRE
	suA4x/PuqRXbrNmkKsIfs1HncMxW+fuVInPZv5SlWucBAhtIp7KE+d1TwpXroPoSj09dafLfl3oe+
	5Sms46tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMvq-00000001R5Z-2CbE;
	Thu, 12 Feb 2026 02:59:54 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMvo-00000001R4c-39cZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865192; x=1802401192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M3iy5AzhfysAv3JsLqwI5fBQHgwNeM/C4lM3EsRiivc=;
  b=JpUbWLCvkvzXH8LStA4l+X8EOWkkEJ3zV8t9NajDEu424QdwJYyjV9Hn
   Vao+tUFh9+cHAq7vG/SzrHNl++PCex5jF903Rd4wj2wv1vCOnwufOFQXC
   CdtrriV23tmdGl50ObUA8NKBBJgjD5uv3SQBNzwxfEdFX+3XvLHUmGKRe
   qoU6yY0E7yoaWXq1LVWQ+a7VBQIwwcXmHWocDiIkYLSMfG9ZP3yaq9Lqv
   D/PpWnwvRAxmLDGvgClD3EA88ocEbgYvyUHEPAKrl8Qp3NrXeH0z+2gbY
   YWrG0bhdALmOL/6eaMpAzsM2Zo+TiJS557a1ZV/o2IElkqfBBSy9Gn0on
   Q==;
X-CSE-ConnectionGUID: iVC5RUBcTT+oksJJpoQMtg==
X-CSE-MsgGUID: 93rCgShITWeSVmS3ud6SHg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919737"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:59:52 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:15930]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id 1897b6f3-a75f-4e53-b2ff-c0d6d7b5fbc0; Thu, 12 Feb 2026 02:59:52 +0000 (UTC)
X-Farcaster-Flow-ID: 1897b6f3-a75f-4e53-b2ff-c0d6d7b5fbc0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:59:51 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:59:51 +0000
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
Subject: [PATCH 048/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_WP512 crypto
Date: Thu, 12 Feb 2026 02:46:24 +0000
Message-ID: <20260212024725.11264-49-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D039UWB002.ant.amazon.com (10.13.138.79) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185952_842627_88B8D35E 
X-CRM114-Status: GOOD (  10.31  )
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
CONFIG_CRYPTO_WP512-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/wp512.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index c83ad9bb4324..0a0190292dd0 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -85,7 +85,7 @@ crypto-objs-$(CONFIG_CRYPTO_SHA512) += sha512.o
 crypto-objs-$(CONFIG_CRYPTO_SHA3) += sha3.o
 crypto-objs-$(CONFIG_CRYPTO_SM3_GENERIC) += sm3_generic.o
 crypto-objs-$(CONFIG_CRYPTO_STREEBOG) += streebog_generic.o
-obj-$(CONFIG_CRYPTO_WP512) += wp512.o
+crypto-objs-$(CONFIG_CRYPTO_WP512) += wp512.o
 CFLAGS_wp512.o := $(call cc-option,-fno-schedule-insns)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
 obj-$(CONFIG_CRYPTO_BLAKE2B) += blake2b.o
 crypto-objs-$(CONFIG_CRYPTO_ECB) += ecb.o
diff --git a/crypto/wp512.c b/crypto/wp512.c
index 229b189a7988..2d76d4639d44 100644
--- a/crypto/wp512.c
+++ b/crypto/wp512.c
@@ -1138,8 +1138,8 @@ MODULE_ALIAS_CRYPTO("wp512");
 MODULE_ALIAS_CRYPTO("wp384");
 MODULE_ALIAS_CRYPTO("wp256");
 
-module_init(wp512_mod_init);
-module_exit(wp512_mod_fini);
+crypto_module_init(wp512_mod_init);
+crypto_module_exit(wp512_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Whirlpool Message Digest Algorithm");
-- 
2.47.3


