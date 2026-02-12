Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9C0EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fq+ksnWYafcbyAsLjuFTQigGbWxrQvva7btpVdGcRB4=; b=E4XGquGtaLb4mtI5TmHIhi3ecu
	7zXHzEqTk+ADiOOEUHESA45ijkshLdgmoRFabFJupJIshSiGPGZIf75Vsi8BKBsmZhKf14JOUvh0F
	i4PZJI4XluVvNqWoULQ99xKntoUY07C/TTa1s2f/+xKG2Lit8dPPvC8F4pkErbncd6uTw0sDQ7RAr
	dka4u2BLAN7+B7MUQJmBPR6uH1OG3egEtgOSy+gYGqL5kEnL8z3pF3266hW/ukh9ts0XkoQgpnDM/
	rxlH4B8wLZXZqRiYjgbPJavF7UgOvrDtsSDdxoymGU0IM4VFYChfgmym6zi8e00BYgggbbScfLYhD
	PD5fgfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN7Q-00000001Vq3-3KHg;
	Thu, 12 Feb 2026 03:11:52 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN7L-00000001VoC-3spa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865907; x=1802401907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fq+ksnWYafcbyAsLjuFTQigGbWxrQvva7btpVdGcRB4=;
  b=NU494p4Cmsthp01WbAcI+APm6Zb/WDUXWbTSP3k7QTwXGDsKTN0RcFdh
   jq5RvYaKKTpCUv4R7edLn6T4l+uThz2SkZDZjjsNzMGBboKTrZRy7v1Df
   k4h63sN6g0+ynTXM2SG9DtTUGQnDGsPbvjRjcfnCYzDW6UxPFj65EiNuT
   2yzlHKBzzaP9uU0AeNd0/gbOUf646cm4cX8S0/O0DloezwiwbaCEPlfJ/
   j/Kipqia5PNgt1iQcHUNI5+RvNdVOAtbQq3ap+lafc8Vy9tfGljam2ESu
   sNyVJJJpdqdhmRnVCWBAKhmb3T/Jt9prk//RkiXWcZnVv6D6bfUy0aykd
   A==;
X-CSE-ConnectionGUID: /+x4ZNpjRlGuFmrf99Ougw==
X-CSE-MsgGUID: 7oFiedWTQj6zjrtKK6J1hA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12920420"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:11:47 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:26562]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id f140671b-9228-42ae-a1b1-ff3855cb900b; Thu, 12 Feb 2026 03:11:47 +0000 (UTC)
X-Farcaster-Flow-ID: f140671b-9228-42ae-a1b1-ff3855cb900b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:11:46 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:11:46 +0000
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
Subject: [PATCH 094/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_ASYNC_CORE crypto
Date: Thu, 12 Feb 2026 02:47:10 +0000
Message-ID: <20260212024725.11264-95-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D033UWC002.ant.amazon.com (10.13.139.196) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191149_084061_D72B5707 
X-CRM114-Status: GOOD (  13.43  )
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
CONFIG_ASYNC_CORE-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/async_tx/Makefile     |  2 +-
 crypto/async_tx/async_tx.c   |  4 ++--
 crypto/fips140/fips140-api.c | 15 +++++++++++++++
 include/linux/async_tx.h     | 21 ++++++++++++++-------
 4 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/crypto/async_tx/Makefile b/crypto/async_tx/Makefile
index 056e48245373..2cfa2dc1947d 100644
--- a/crypto/async_tx/Makefile
+++ b/crypto/async_tx/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_ASYNC_CORE) += async_tx.o
+crypto-objs-$(CONFIG_ASYNC_CORE) += async_tx.o
 obj-$(CONFIG_ASYNC_MEMCPY) += async_memcpy.o
 obj-$(CONFIG_ASYNC_XOR) += async_xor.o
 obj-$(CONFIG_ASYNC_PQ) += async_pq.o
diff --git a/crypto/async_tx/async_tx.c b/crypto/async_tx/async_tx.c
index ad72057a5e0d..4df0363f4764 100644
--- a/crypto/async_tx/async_tx.c
+++ b/crypto/async_tx/async_tx.c
@@ -30,8 +30,8 @@ static void __exit async_tx_exit(void)
 	async_dmaengine_put();
 }
 
-module_init(async_tx_init);
-module_exit(async_tx_exit);
+crypto_module_init(async_tx_init);
+crypto_module_exit(async_tx_exit);
 
 /**
  * __async_tx_find_channel - find a channel to carry out the operation or let
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 5bcfc1a3cc7e..ff58e8946821 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -794,6 +794,21 @@ DEFINE_CRYPTO_API_STUB(crypto_krb5enc_extractkeys);
 
 DEFINE_CRYPTO_API_STUB(xor_blocks);
 
+#endif
+/*
+ * crypto/async_tx/async_tx.c
+ */
+#if IS_BUILTIN(CONFIG_ASYNC_CORE)
+
+#include <linux/async_tx.h>
+
+#ifdef CONFIG_DMA_ENGINE
+DEFINE_CRYPTO_API_STUB(__async_tx_find_channel);
+#endif
+DEFINE_CRYPTO_API_STUB(async_tx_submit);
+DEFINE_CRYPTO_API_STUB(async_trigger_callback);
+DEFINE_CRYPTO_API_STUB(async_tx_quiesce);
+
 #endif
 /*
  * crypto/ecdh_helper.c
diff --git a/include/linux/async_tx.h b/include/linux/async_tx.h
index 1ca9f9e05f4f..25dfd3750859 100644
--- a/include/linux/async_tx.h
+++ b/include/linux/async_tx.h
@@ -4,6 +4,8 @@
  */
 #ifndef _ASYNC_TX_H_
 #define _ASYNC_TX_H_
+
+#include <crypto/api.h>
 #include <linux/dmaengine.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
@@ -99,9 +101,9 @@ static inline void async_tx_issue_pending(struct dma_async_tx_descriptor *tx)
 #else
 #define async_tx_find_channel(dep, type, dst, dst_count, src, src_count, len) \
 	 __async_tx_find_channel(dep, type)
-struct dma_chan *
-__async_tx_find_channel(struct async_submit_ctl *submit,
-			enum dma_transaction_type tx_type);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_CORE, __async_tx_find_channel, struct dma_chan *,
+	(struct async_submit_ctl *submit, enum dma_transaction_type tx_type),
+	(submit, tx_type));
 #endif /* CONFIG_ARCH_HAS_ASYNC_TX_FIND_CHANNEL */
 #else
 static inline void async_tx_issue_pending_all(void)
@@ -155,8 +157,9 @@ init_async_submit(struct async_submit_ctl *args, enum async_tx_flags flags,
 	args->scribble = scribble;
 }
 
-void async_tx_submit(struct dma_chan *chan, struct dma_async_tx_descriptor *tx,
-		     struct async_submit_ctl *submit);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_CORE, async_tx_submit, void,
+	(struct dma_chan *chan, struct dma_async_tx_descriptor *tx, struct async_submit_ctl *submit),
+	(chan, tx, submit));
 
 struct dma_async_tx_descriptor *
 async_xor(struct page *dest, struct page **src_list, unsigned int offset,
@@ -178,7 +181,9 @@ async_memcpy(struct page *dest, struct page *src, unsigned int dest_offset,
 	     unsigned int src_offset, size_t len,
 	     struct async_submit_ctl *submit);
 
-struct dma_async_tx_descriptor *async_trigger_callback(struct async_submit_ctl *submit);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_CORE, async_trigger_callback, struct dma_async_tx_descriptor *,
+	(struct async_submit_ctl *submit),
+	(submit));
 
 struct dma_async_tx_descriptor *
 async_gen_syndrome(struct page **blocks, unsigned int *offsets, int src_cnt,
@@ -199,5 +204,7 @@ async_raid6_datap_recov(int src_num, size_t bytes, int faila,
 			struct page **ptrs, unsigned int *offs,
 			struct async_submit_ctl *submit);
 
-void async_tx_quiesce(struct dma_async_tx_descriptor **tx);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_CORE, async_tx_quiesce, void,
+	(struct dma_async_tx_descriptor **tx),
+	(tx));
 #endif /* _ASYNC_TX_H_ */
-- 
2.47.3


