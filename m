Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD2EEDF023
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WX2hl8BKIm83A5+yPNUQyry8rvmHoia35jhgy7ZUw2k=; b=Do4NY8qEIinkfSdShBpaqVqfPf
	hJDZ/WPij5/4xTdIwMaUrT76NIr4QHL+4hEbxtZWM+GLBl3FoBp0MPEf1iwuuYt3yXvy4WGpu/h3F
	vv86rQenR+Y8KS1ZgijFVk57vDcE4aJSs0vg3M9TtUAiJLvCcTcttLIYyCHy4kKC5TLN4dNljW/Y5
	7DQw8ueOEvIBEltVKK04lEzW5qtgkyAzq63BZNCSvoD0lY+C0pIi01/0/xpBaiIHMe9WGSBf2B6Qw
	HDM5fk89PGicTL61XPPPMGPizB6TQ8haxSvLyjiNuwYBwrtqYxAuKzTwh+2URkDJZVitqQbG8sJe3
	exw/PSEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN8D-00000001WCq-2NUq;
	Thu, 12 Feb 2026 03:12:41 +0000
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.245.243.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN86-00000001WA7-19pw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865954; x=1802401954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WX2hl8BKIm83A5+yPNUQyry8rvmHoia35jhgy7ZUw2k=;
  b=lata/pvAZkgpL5+xnQAtonkwUcJswo3bxAJxPApqqpipB4O6sLHaCvEU
   5jSD46ZEX5TZXCwTK0N0LTIQsqBsxwh1Q7ImlQdAGQBae9oCA3HPqa01M
   TVHxw6Ay9Y5aluLVsQgpF5VSO9tnY05o3rBy+dmofhL72DGCbIn3cAUlt
   mLbNXvBqF0J/UExCTsiPpHOPMlHi6qwdtGvW1Xn0bsuC7r5a70XhH4lV9
   V1IGrgsAODJEAch2KJpZ4eM0cnsmqkS7gP8yulO5zqnYUXwQAI+hIUNrE
   arJPGQejTqyBeS1GopS2ys3PZWJd18JnC3cO5/2emdb6DBuWGqNMU/XKk
   A==;
X-CSE-ConnectionGUID: e4/AFqkTS4+mxoMiYofzhA==
X-CSE-MsgGUID: 8Ql9dhSzT8WsZsyUA/y8ww==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12455807"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:12:33 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:9319]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id c4417ed6-d620-4118-a43e-5b7fbfc6b19a; Thu, 12 Feb 2026 03:12:33 +0000 (UTC)
X-Farcaster-Flow-ID: c4417ed6-d620-4118-a43e-5b7fbfc6b19a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:12:33 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:12:32 +0000
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
Subject: [PATCH 097/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_ASYNC_PQ crypto
Date: Thu, 12 Feb 2026 02:47:13 +0000
Message-ID: <20260212024725.11264-98-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D044UWA004.ant.amazon.com (10.13.139.7) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191234_366858_0688CE52 
X-CRM114-Status: GOOD (  11.26  )
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
CONFIG_ASYNC_PQ-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/async_tx/Makefile     |  2 +-
 crypto/async_tx/async_pq.c   |  4 ++--
 crypto/fips140/fips140-api.c | 11 +++++++++++
 include/linux/async_tx.h     | 13 ++++++-------
 4 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/crypto/async_tx/Makefile b/crypto/async_tx/Makefile
index 3ceb7c8d7598..9b0277843bb3 100644
--- a/crypto/async_tx/Makefile
+++ b/crypto/async_tx/Makefile
@@ -2,6 +2,6 @@
 crypto-objs-$(CONFIG_ASYNC_CORE) += async_tx.o
 crypto-objs-$(CONFIG_ASYNC_MEMCPY) += async_memcpy.o
 crypto-objs-$(CONFIG_ASYNC_XOR) += async_xor.o
-obj-$(CONFIG_ASYNC_PQ) += async_pq.o
+crypto-objs-$(CONFIG_ASYNC_PQ) += async_pq.o
 obj-$(CONFIG_ASYNC_RAID6_RECOV) += async_raid6_recov.o
 obj-$(CONFIG_ASYNC_RAID6_TEST) += raid6test.o
diff --git a/crypto/async_tx/async_pq.c b/crypto/async_tx/async_pq.c
index 9e4bb7fbde25..b80fb50fffb2 100644
--- a/crypto/async_tx/async_pq.c
+++ b/crypto/async_tx/async_pq.c
@@ -456,8 +456,8 @@ static void __exit async_pq_exit(void)
 	__free_page(pq_scribble_page);
 }
 
-module_init(async_pq_init);
-module_exit(async_pq_exit);
+crypto_module_init(async_pq_init);
+crypto_module_exit(async_pq_exit);
 
 MODULE_DESCRIPTION("asynchronous raid6 syndrome generation/validation");
 MODULE_LICENSE("GPL");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 67e7b03e4dc4..6c22baf0ce10 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -831,6 +831,17 @@ DEFINE_CRYPTO_API_STUB(async_xor);
 DEFINE_CRYPTO_API_STUB(async_xor_offs);
 DEFINE_CRYPTO_API_STUB(async_xor_val_offs);
 
+#endif
+/*
+ * crypto/async_tx/async_pq.c
+ */
+#if IS_BUILTIN(CONFIG_ASYNC_PQ)
+
+#include <linux/async_tx.h>
+
+DEFINE_CRYPTO_API_STUB(async_gen_syndrome);
+DEFINE_CRYPTO_API_STUB(async_syndrome_val);
+
 #endif
 /*
  * crypto/ecdh_helper.c
diff --git a/include/linux/async_tx.h b/include/linux/async_tx.h
index 36bcc93c6944..9f733d01f69e 100644
--- a/include/linux/async_tx.h
+++ b/include/linux/async_tx.h
@@ -181,14 +181,13 @@ DECLARE_CRYPTO_API(CONFIG_ASYNC_CORE, async_trigger_callback, struct dma_async_t
 	(struct async_submit_ctl *submit),
 	(submit));
 
-struct dma_async_tx_descriptor *
-async_gen_syndrome(struct page **blocks, unsigned int *offsets, int src_cnt,
-		   size_t len, struct async_submit_ctl *submit);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_PQ, async_gen_syndrome, struct dma_async_tx_descriptor *,
+	(struct page **blocks, unsigned int *offsets, int src_cnt, size_t len, struct async_submit_ctl *submit),
+	(blocks, offsets, src_cnt, len, submit));
 
-struct dma_async_tx_descriptor *
-async_syndrome_val(struct page **blocks, unsigned int *offsets, int src_cnt,
-		   size_t len, enum sum_check_flags *pqres, struct page *spare,
-		   unsigned int s_off, struct async_submit_ctl *submit);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_PQ, async_syndrome_val, struct dma_async_tx_descriptor *,
+	(struct page **blocks, unsigned int *offsets, int src_cnt, size_t len, enum sum_check_flags *pqres, struct page *spare, unsigned int s_off, struct async_submit_ctl *submit),
+	(blocks, offsets, src_cnt, len, pqres, spare, s_off, submit));
 
 struct dma_async_tx_descriptor *
 async_raid6_2data_recov(int src_num, size_t bytes, int faila, int failb,
-- 
2.47.3


