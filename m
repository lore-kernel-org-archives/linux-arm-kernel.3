Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76457EDF022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ba7TrYsKy0CKElBFKgJ/9lEirsZWbrJxW7zQwbgNkaQ=; b=TWF7H82zXon9lCT+pf0qiImfPo
	VTnRz5walLhnjrXN2qDYLv87SDg8LtA7b4SKS6RJYIcIn17uC46nHWiGjqZ3s8b8BQfHq69DMrF3r
	wknLX4EZk/4hSrrBg2mQVTui9dp+lEst0cS0EqpTyPdQnP/v+hjkQxlZAfr4o1sEP/fMDjIAabZZG
	YRkK1zeRi68G7/BDfMoHV+yA/Om5ovMHVruZuQhdpaHNR22+hGnB7XgaVUWkHntO7C0JQEEwEZAEw
	joNnPZpFHEbQrQ7IWDbqneD6DepmSH8BrWm5gSm8/4z93bgH07gMpZ0dpqp+byXLvAOBxStqpNPXP
	Zcp72Bfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMxr-00000001Ru7-36W5;
	Thu, 12 Feb 2026 03:01:59 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMxp-00000001Rt1-1IaN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865317; x=1802401317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ba7TrYsKy0CKElBFKgJ/9lEirsZWbrJxW7zQwbgNkaQ=;
  b=Xf9l4ybYSFB7jCLnWMQjus1azHSN83Jc+y1+IZeuCKUQrUuBKO6iLlmG
   BQgIDUInFj8elFJvoNmHBsGMMHnIlQbMaOuPTjAymyiCDNAGUK/nlQWFI
   6GdeIOqljaXdxfxZgoxP2TErGs1ZVky3TY6mnEeshnKZqcYKfrdTboRn/
   X/FpuZUlrrTqRyUb6JzWd2ySaliog2G6rFzSPCnVpyGZbEbKthNz/yQof
   LgPwbC8YEsgc2wr31qc4XhZOkdinYdh/oauO9ZF38VPZfW8WPD70qLARu
   lbXvf1AfzOQAC7YLW2TYo/AyBzDE2LwURsHzsiT6+DHzM2NEBg5ZKAXNf
   w==;
X-CSE-ConnectionGUID: b4JrgIIcQmeYhxreuNA/0w==
X-CSE-MsgGUID: GjaxeTDCT6SB/mRkkSmEbg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919243"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:01:56 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:15805]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id fd62e522-8ff0-4998-a61d-eb7e543abb9d; Thu, 12 Feb 2026 03:01:56 +0000 (UTC)
X-Farcaster-Flow-ID: fd62e522-8ff0-4998-a61d-eb7e543abb9d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:01:56 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:01:55 +0000
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
Subject: [PATCH 056/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CHACHA20 crypto
Date: Thu, 12 Feb 2026 02:46:32 +0000
Message-ID: <20260212024725.11264-57-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D032UWA003.ant.amazon.com (10.13.139.37) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190157_400834_D693F7DA 
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
CONFIG_CRYPTO_CHACHA20-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/chacha.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 34e278185d16..cb509e854784 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -147,7 +147,7 @@ obj-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
 obj-$(CONFIG_CRYPTO_ANUBIS) += anubis.o
 obj-$(CONFIG_CRYPTO_SEED) += seed.o
 obj-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
-obj-$(CONFIG_CRYPTO_CHACHA20) += chacha.o
+crypto-objs-$(CONFIG_CRYPTO_CHACHA20) += chacha.o
 CFLAGS_chacha.o += -DARCH=$(ARCH)
 obj-$(CONFIG_CRYPTO_DEFLATE) += deflate.o
 obj-$(CONFIG_CRYPTO_MICHAEL_MIC) += michael_mic.o
diff --git a/crypto/chacha.c b/crypto/chacha.c
index ec16d5a33f3c..13335c7e4941 100644
--- a/crypto/chacha.c
+++ b/crypto/chacha.c
@@ -161,8 +161,8 @@ static void __exit crypto_chacha_mod_fini(void)
 	crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
 }
 
-module_init(crypto_chacha_mod_init);
-module_exit(crypto_chacha_mod_fini);
+crypto_module_init(crypto_chacha_mod_init);
+crypto_module_exit(crypto_chacha_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Martin Willi <martin@strongswan.org>");
-- 
2.47.3


