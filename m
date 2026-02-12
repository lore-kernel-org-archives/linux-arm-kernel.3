Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE7CEDF023
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBQH0kwP6EeA21IhBKg8rBmdki1aKnWiFhYi1a/9mKE=; b=irYFXuAH10p/V4jWAOYGoVElap
	C9KMrFX+SIxZa7sKmfK3YHbcVZMrHw85qmAC8ycdFozgL3/jTQy1kY2JO8mAF7J6cirtmFyXBq0gg
	4nfXq4dXzt7tVv+R3pvqpQlLHePya0+QSHOaa5/mjyqsBGk2fuUmYeE2/druH9J4sDI1zZjvalTxc
	vcygfN7QsQRfF8U2O1KE+1Kg545juXasS6gCyEaum/DRcPiI24JhBgeh1FPSuieTrTFUMXyJkHzfu
	Noy57DLipULVjezQMQJ34q8Lk5K7aB1W8p2YiMT7WlkacWS+1AoYGJ3yUBrd6cIWGIFLF6s7ixyEM
	9/TgKHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMyM-00000001S7d-2p6M;
	Thu, 12 Feb 2026 03:02:30 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMyK-00000001S6C-0u0u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865348; x=1802401348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CBQH0kwP6EeA21IhBKg8rBmdki1aKnWiFhYi1a/9mKE=;
  b=CLYuShehGHGck49uTuGmgO8kFcrQD2LAibzt28Ss6TmuHvhpC1zQfD5z
   H2C0mXn8HjipoTqoXT9a9Jq1PEjF8Q5DyZyqbBkum54IN9CGE6Mg1Hh0D
   uMXQPWDTxfw0/uALTsXFl231X4lTpmHBBlDKp/MKthGH0KikUVi5ycsgR
   J19jYlaZo62rsBdszAd8lMuuRhOrG29xhhueli7zOm4T9708MnBHll/Bj
   yZfHe8GM5CbG9HTqSmJPDrBH2VgNsSj/yP2z8evBh6DyOTqD/huCIbfrZ
   E1kv/nx2HzdEZDD7VTut52kShCvsY0CqJgCJl6irqiY7lkRZfwYF4JVaV
   w==;
X-CSE-ConnectionGUID: 8+D2cNraSU6eQsOEpJufYA==
X-CSE-MsgGUID: wI/ugeuqSAeyGsqdh9L/SQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12696904"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:02:27 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:12879]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 485832dd-5970-45db-a3a1-3dc69dcf592b; Thu, 12 Feb 2026 03:02:27 +0000 (UTC)
X-Farcaster-Flow-ID: 485832dd-5970-45db-a3a1-3dc69dcf592b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:02:27 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:02:26 +0000
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
Subject: [PATCH 058/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_AEGIS128 crypto
Date: Thu, 12 Feb 2026 02:46:34 +0000
Message-ID: <20260212024725.11264-59-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D032UWB001.ant.amazon.com (10.13.139.152) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190228_308009_59CEAC55 
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
CONFIG_CRYPTO_AEGIS128-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile        | 2 +-
 crypto/aegis128-core.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index f71f2359ce08..cb1761303151 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -101,7 +101,7 @@ crypto-objs-$(CONFIG_CRYPTO_ADIANTUM) += adiantum.o
 crypto-objs-$(CONFIG_CRYPTO_GCM) += gcm.o
 crypto-objs-$(CONFIG_CRYPTO_CCM) += ccm.o
 crypto-objs-$(CONFIG_CRYPTO_CHACHA20POLY1305) += chacha20poly1305.o
-obj-$(CONFIG_CRYPTO_AEGIS128) += aegis128.o
+crypto-objs-$(CONFIG_CRYPTO_AEGIS128) += aegis128.o
 aegis128-y := aegis128-core.o
 
 ifeq ($(ARCH),arm)
diff --git a/crypto/aegis128-core.c b/crypto/aegis128-core.c
index ca80d861345d..2c8dfafcfdc8 100644
--- a/crypto/aegis128-core.c
+++ b/crypto/aegis128-core.c
@@ -566,8 +566,8 @@ static void __exit crypto_aegis128_module_exit(void)
 	crypto_unregister_aead(&crypto_aegis128_alg_generic);
 }
 
-module_init(crypto_aegis128_module_init);
-module_exit(crypto_aegis128_module_exit);
+crypto_module_init(crypto_aegis128_module_init);
+crypto_module_exit(crypto_aegis128_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ondrej Mosnacek <omosnacek@gmail.com>");
-- 
2.47.3


