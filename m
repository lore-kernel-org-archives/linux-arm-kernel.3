Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A272EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGdqXySNXuhUMjuKgJ/3QH5v8Y+jlO18CUpn30nDRVM=; b=w7UOLJb+ALFwvnEtwHhbNouDBa
	MDaabE4P3SDfKm965aZpqcy1llJEZZ/aFXqPH5eT8PMgFH6P5veEGp7V6iLFsoj/g5bk7ZWbazSd3
	GMqguRGCOMg6rHe6Vzo3htwqPuZ9W8THZR6uK85mosWLt3WtAMBJO/TWRSXomia4skFqDP+iZqT0u
	TzUzGzkEggzTYvT1v+4k3Ju4K1h6LXda/mmRGR/2QhUuhp9tqG64IsVufAKZjSf0oGEMOMTJDGRHW
	La9bVk2ahlbr49YWJmvpXhCk7fVM9Z+uXUxlVFHIxy12+ewmTCVsu+S6S405RuGV++1TKCXuj1uQW
	cm1oQl4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN37-00000001U7j-3Luz;
	Thu, 12 Feb 2026 03:07:25 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN35-00000001U6F-1OY7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865643; x=1802401643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vGdqXySNXuhUMjuKgJ/3QH5v8Y+jlO18CUpn30nDRVM=;
  b=cwzizyTwpPvgtzmGZcADj/qnIJsKNE8G5d9xWx9ka5xP/msHoM8wtVjI
   V84aa2ykKbm4Huv7pTrfExXPjjZLCpDDNjec3RnTHXtUS+0SyWKjdxB5B
   kobUlc5Ii6nabm0uz/5rJ/+PThNrr+ELwqQCl5T7ncvVhIOeWfBe5fJAI
   rnL5UI/dPYAiYSSd6JB2EIhDfxBXs59NPf23aN7rem2s0PSpK0TbApxqW
   l3SLJOhKoj3RAYpWi4Ra6nOf3A0izOYvpeTpxCWj/NQt+pt7L64LipZN7
   IMUywdYPe4ZWBKUsjMxg6qGLIqMNp81YbNTLxMDY3OTwOdqsnfs220LWm
   Q==;
X-CSE-ConnectionGUID: r6G8jPaoQWKNYNvghrmviw==
X-CSE-MsgGUID: su9wvI+KTQynKQNd8MFVbg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12722153"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:07:22 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:2762]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id dccb8ee6-1f03-4c1a-8bca-b50c0d8ed0d8; Thu, 12 Feb 2026 03:07:22 +0000 (UTC)
X-Farcaster-Flow-ID: dccb8ee6-1f03-4c1a-8bca-b50c0d8ed0d8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:07:22 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:07:22 +0000
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
Subject: [PATCH 077/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_DEFLATE crypto
Date: Thu, 12 Feb 2026 02:46:53 +0000
Message-ID: <20260212024725.11264-78-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D035UWB004.ant.amazon.com (10.13.138.104) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190723_515002_AC003E91 
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

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_DEFLATE-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile  | 2 +-
 crypto/deflate.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index c7dcc0e55325..a989d103c191 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -149,7 +149,7 @@ crypto-objs-$(CONFIG_CRYPTO_SEED) += seed.o
 crypto-objs-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
 crypto-objs-$(CONFIG_CRYPTO_CHACHA20) += chacha.o
 CFLAGS_chacha.o += -DARCH=$(ARCH)
-obj-$(CONFIG_CRYPTO_DEFLATE) += deflate.o
+crypto-objs-$(CONFIG_CRYPTO_DEFLATE) += deflate.o
 obj-$(CONFIG_CRYPTO_MICHAEL_MIC) += michael_mic.o
 obj-$(CONFIG_CRYPTO_CRC32C) += crc32c-cryptoapi.o
 crc32c-cryptoapi-y := crc32c.o
diff --git a/crypto/deflate.c b/crypto/deflate.c
index a3e1fff55661..7c8e331556cf 100644
--- a/crypto/deflate.c
+++ b/crypto/deflate.c
@@ -249,8 +249,8 @@ static void __exit deflate_mod_fini(void)
 	crypto_acomp_free_streams(&deflate_streams);
 }
 
-module_init(deflate_mod_init);
-module_exit(deflate_mod_fini);
+crypto_module_init(deflate_mod_init);
+crypto_module_exit(deflate_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Deflate Compression Algorithm for IPCOMP");
-- 
2.47.3


