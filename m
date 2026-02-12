Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92B7EDF023
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrxPwx98+PCEPXtHwegbpc8CFG0s/zBXZtiApdt7ovQ=; b=GeZx8iiixq2w6QT+HCxs9F8F7i
	9u/ncm81vHern1W422g2Ey+/gH11JMwzjfiTUnGVcU8NDft69pf2w8k8qLRN8T0TPicBknKOLqcTD
	M+73nwJ7aO6ASzZlukEPou4bewAz2ThA432uRedrKmAUJBYFsqSAhkq4NMwU93LdHAhqz5bwBehzL
	Zas+L94r5zimne0AzfI65Xjgbywz3CO3QpKR8Z+ip0ynQH+Mpj/7itQIqfkykB95nWX2/WqUfet1S
	2uDdQ226y3rQb9ujoppzRXKQf8M0jWM2uvEi01dE2suaMKZT/iLRZ+K55gLQhhZuww+7SKUZGMFk0
	BZOLIHUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN8O-00000001WHS-3pWk;
	Thu, 12 Feb 2026 03:12:53 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN8L-00000001WFj-2dud
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:12:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865969; x=1802401969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mrxPwx98+PCEPXtHwegbpc8CFG0s/zBXZtiApdt7ovQ=;
  b=VY8uJmupv0Na2oP544fgG5U1bisJCGG3GQrnYaxTxohmB0uiJAGYUT27
   8zrayu0TwrhYdqaMjPYS/wV6HTDGKS3Lz7EC6syHnXcnI32MmN4Lo+XvE
   Nhsz7zE+32coUX0zbea3DPP1dIKLFp2+xKYdCTd/SyCimOXNRHHcrwZbA
   xPL1cj3hTxRjEI6BoL4nR6T2XM5CtSQ57sCLsEPm979/Qtt/ovqK6Ob9w
   gsSGe1BcxRacSxVH5c7+04Bc+I3eCjwV9UkLNoYNqzh7iMH7S+eKnnVt3
   5ij4zpOUYORAWi2sCjxCnzaADdUyoz8F1wwJMnsCtXVJaUq9aG27rx8Bd
   A==;
X-CSE-ConnectionGUID: YzHOosEoRrK1E1ptguSRaQ==
X-CSE-MsgGUID: sudD6iiwQ36k32Jgd+n05w==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744721"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:12:49 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:1252]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id fd578883-05bc-4610-9374-9e0751ee70fe; Thu, 12 Feb 2026 03:12:49 +0000 (UTC)
X-Farcaster-Flow-ID: fd578883-05bc-4610-9374-9e0751ee70fe
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:12:48 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:12:48 +0000
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
Subject: [PATCH 098/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_ASYNC_RAID6_RECOV crypto
Date: Thu, 12 Feb 2026 02:47:14 +0000
Message-ID: <20260212024725.11264-99-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D041UWB003.ant.amazon.com (10.13.139.176) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191249_722958_5F8A569B 
X-CRM114-Status: GOOD (  10.09  )
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
CONFIG_ASYNC_RAID6_RECOV-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/async_tx/Makefile     |  2 +-
 crypto/fips140/fips140-api.c | 11 +++++++++++
 include/linux/async_tx.h     | 16 +++++++---------
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/crypto/async_tx/Makefile b/crypto/async_tx/Makefile
index 9b0277843bb3..2f700c2312af 100644
--- a/crypto/async_tx/Makefile
+++ b/crypto/async_tx/Makefile
@@ -3,5 +3,5 @@ crypto-objs-$(CONFIG_ASYNC_CORE) += async_tx.o
 crypto-objs-$(CONFIG_ASYNC_MEMCPY) += async_memcpy.o
 crypto-objs-$(CONFIG_ASYNC_XOR) += async_xor.o
 crypto-objs-$(CONFIG_ASYNC_PQ) += async_pq.o
-obj-$(CONFIG_ASYNC_RAID6_RECOV) += async_raid6_recov.o
+crypto-objs-$(CONFIG_ASYNC_RAID6_RECOV) += async_raid6_recov.o
 obj-$(CONFIG_ASYNC_RAID6_TEST) += raid6test.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 6c22baf0ce10..7159c796d87f 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -842,6 +842,17 @@ DEFINE_CRYPTO_API_STUB(async_xor_val_offs);
 DEFINE_CRYPTO_API_STUB(async_gen_syndrome);
 DEFINE_CRYPTO_API_STUB(async_syndrome_val);
 
+#endif
+/*
+ * crypto/async_tx/async_raid6_recov.c
+ */
+#if IS_BUILTIN(CONFIG_ASYNC_RAID6_RECOV)
+
+#include <linux/async_tx.h>
+
+DEFINE_CRYPTO_API_STUB(async_raid6_2data_recov);
+DEFINE_CRYPTO_API_STUB(async_raid6_datap_recov);
+
 #endif
 /*
  * crypto/ecdh_helper.c
diff --git a/include/linux/async_tx.h b/include/linux/async_tx.h
index 9f733d01f69e..4e791a978ac3 100644
--- a/include/linux/async_tx.h
+++ b/include/linux/async_tx.h
@@ -189,15 +189,13 @@ DECLARE_CRYPTO_API(CONFIG_ASYNC_PQ, async_syndrome_val, struct dma_async_tx_desc
 	(struct page **blocks, unsigned int *offsets, int src_cnt, size_t len, enum sum_check_flags *pqres, struct page *spare, unsigned int s_off, struct async_submit_ctl *submit),
 	(blocks, offsets, src_cnt, len, pqres, spare, s_off, submit));
 
-struct dma_async_tx_descriptor *
-async_raid6_2data_recov(int src_num, size_t bytes, int faila, int failb,
-			struct page **ptrs, unsigned int *offs,
-			struct async_submit_ctl *submit);
-
-struct dma_async_tx_descriptor *
-async_raid6_datap_recov(int src_num, size_t bytes, int faila,
-			struct page **ptrs, unsigned int *offs,
-			struct async_submit_ctl *submit);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_RAID6_RECOV, async_raid6_2data_recov, struct dma_async_tx_descriptor *,
+	(int src_num, size_t bytes, int faila, int failb, struct page **ptrs, unsigned int *offs, struct async_submit_ctl *submit),
+	(src_num, bytes, faila, failb, ptrs, offs, submit));
+
+DECLARE_CRYPTO_API(CONFIG_ASYNC_RAID6_RECOV, async_raid6_datap_recov, struct dma_async_tx_descriptor *,
+	(int src_num, size_t bytes, int faila, struct page **ptrs, unsigned int *offs, struct async_submit_ctl *submit),
+	(src_num, bytes, faila, ptrs, offs, submit));
 
 DECLARE_CRYPTO_API(CONFIG_ASYNC_CORE, async_tx_quiesce, void,
 	(struct dma_async_tx_descriptor **tx),
-- 
2.47.3


