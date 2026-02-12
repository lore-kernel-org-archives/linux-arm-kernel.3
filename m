Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E9EEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3Tbz7uW23+2yTiWoJ7b61SNKsHq0ndcE0ASJpwDVQY=; b=q+SXhN+HJHKmLN5+KCdE4CHLxj
	UaWAQAi68BeiNrwhy3dRfshZpsy+HFRy8SKqKe1bkkZb4V9an73t3gNgc6n5dv9N4Nhf7NmvQKvWh
	TufVftdFdT7LFo279NlVAUk8u7AzAhCl9dMOFn/nFs8ed7KRvvGZh8UFRk87c1Pbnd48BHDN+lPGv
	EZsTFgopsQCJHVs83dk1WU4oVBHK1hviZwonyafy6pPFnCWc+DvArnYFHdLLuuEk/vLDiXPGbl4yc
	XFxBNlUGT5Nsro+Aoyc6GuiOmmZIYMjxRi9Gh5xNH6xA72TKBlGd8oCnaRplic9pHF/tXIjf8VZbY
	uJTEQRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNAP-00000001X8a-2hEB;
	Thu, 12 Feb 2026 03:14:57 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNAL-00000001X6O-2w0m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866093; x=1802402093;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x3Tbz7uW23+2yTiWoJ7b61SNKsHq0ndcE0ASJpwDVQY=;
  b=rRf+bB2ctjHJrc1DxMitrJENPqVEnP4Mufobq2G55RqLceKJZsh4YlKY
   g4DxUYJULU6Awaq4wM2oatZToD3SyZOlzMctHY5j2kMfMCvcfpehgGwH7
   IFcr1sm75wX0abSMvQQeiTCOzQlBONkmrHvCVL+Gc2uh3FyxB90aUAO4G
   NqiCXhqktU6TTJ7YyEud0aLhVLRzUXlN9M1IvUGwhA20jJHRoXbH3QhoY
   oNE0PFAZ1zj80l5lb4tg7diR7EkMPzZlwOpXs/FzGOtepohIkOldnM1n+
   twcQrSwtd3x0JU4Y4X/eOlOYQBr1qht5lMt7WVEUYShyHoGB83QUoDOOm
   Q==;
X-CSE-ConnectionGUID: HoDVOiInQAe+YDblwVEMuQ==
X-CSE-MsgGUID: bcy9emDbSlKFFmYpgbU5JQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919906"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:14:53 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:30841]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id 8e9bc734-2d3c-4aed-9b7b-297267be430e; Thu, 12 Feb 2026 03:14:52 +0000 (UTC)
X-Farcaster-Flow-ID: 8e9bc734-2d3c-4aed-9b7b-297267be430e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:14:52 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:14:52 +0000
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
Subject: [PATCH 106/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_ASYNC_RAID6_TEST crypto
Date: Thu, 12 Feb 2026 02:47:22 +0000
Message-ID: <20260212024725.11264-107-wanjay@amazon.com>
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
X-CRM114-CacheID: sfid-20260211_191454_467521_BC4E9931 
X-CRM114-Status: GOOD (  11.37  )
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
CONFIG_ASYNC_RAID6_TEST-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/async_tx/Makefile    | 2 +-
 crypto/async_tx/raid6test.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/async_tx/Makefile b/crypto/async_tx/Makefile
index 2f700c2312af..9642987ebd71 100644
--- a/crypto/async_tx/Makefile
+++ b/crypto/async_tx/Makefile
@@ -4,4 +4,4 @@ crypto-objs-$(CONFIG_ASYNC_MEMCPY) += async_memcpy.o
 crypto-objs-$(CONFIG_ASYNC_XOR) += async_xor.o
 crypto-objs-$(CONFIG_ASYNC_PQ) += async_pq.o
 crypto-objs-$(CONFIG_ASYNC_RAID6_RECOV) += async_raid6_recov.o
-obj-$(CONFIG_ASYNC_RAID6_TEST) += raid6test.o
+crypto-objs-$(CONFIG_ASYNC_RAID6_TEST) += raid6test.o
diff --git a/crypto/async_tx/raid6test.c b/crypto/async_tx/raid6test.c
index d3fbee1e03e5..253aa4787f5a 100644
--- a/crypto/async_tx/raid6test.c
+++ b/crypto/async_tx/raid6test.c
@@ -243,8 +243,8 @@ static void __exit raid6_test_exit(void)
 /* when compiled-in wait for drivers to load first (assumes dma drivers
  * are also compiled-in)
  */
-late_initcall(raid6_test);
-module_exit(raid6_test_exit);
+crypto_late_initcall(raid6_test);
+crypto_module_exit(raid6_test_exit);
 MODULE_AUTHOR("Dan Williams <dan.j.williams@intel.com>");
 MODULE_DESCRIPTION("asynchronous RAID-6 recovery self tests");
 MODULE_LICENSE("GPL");
-- 
2.47.3


