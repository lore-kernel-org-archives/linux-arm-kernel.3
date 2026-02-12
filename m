Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA82EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snbpLim43RlI4ZmzvtlSTOentrPkaXgrT59yN1nXJ6E=; b=MSB7RmsnsCqAiUbSzR/bwUJEvh
	MsfcaDzvao4sAkv0qBxlsWhI6Pm+RRRQ0zCiTHFBYeQHBTRmjQH2NczWDv6+RgxiWfY3pfF4FPBdm
	BsGByunTeoR4qZ5EMpIJryX+0CyeO0mYjwqB2RFRMWuTa7N5KpEsWvAG2Q1b0NqcnCRNox9kOm//M
	7owwpChwuc9txB8vuVAt247yVmYiqBHvQx287Os1TpuVCMQxiRjgk2YqrwV0hOZsbLS4w6IW53rQG
	LRcGIKaOFbBuC76bZIetW7b0lsAl7ZndekKPD/llz1xwizPVolsrzSj+IBgJUyFKf3MEwboKXh0fB
	bvJAFYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNFO-00000001ZDg-3RUw;
	Thu, 12 Feb 2026 03:20:06 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNFL-00000001ZAx-0Z8x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866403; x=1802402403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=snbpLim43RlI4ZmzvtlSTOentrPkaXgrT59yN1nXJ6E=;
  b=hgOb9WFreIQCsV200orC8LVybJ/YjSvyWZmH70FqL/id5j69CJP6t+p5
   wRwxG1QqvwxX3rpYQ+lfIyJ9t1hvN0PGq+0q1b1ewIFf5g415kT1Nxs06
   yGzVxaTcpGyXAF5tjqM20uZgxi97ILA+vRGe6vsffdBpA5MoFrt+WkBAF
   EHJ2iO5gitVPoVs+10m7aU9Q6ET17Pb0nEJwFW+TfbB9rEkLxDbVr7jk0
   5SjuQ2RekwcTfBUC+WZt/tBDs1kKyl44BTwOjfuMIndMyf8f5RhObuMpz
   qA2W8xqgyL/OXlEEuy2kzIJaTdjqmUreSmtx7RmxDtl84X6rFUA+rGQEY
   Q==;
X-CSE-ConnectionGUID: rUn1cXrvSEy02pWrRVYynQ==
X-CSE-MsgGUID: 4q51d+RJTwihrX76KjmtDQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12727913"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:20:02 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:4350]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id 5b92de31-a010-4660-b7f7-b5d7adf3e87b; Thu, 12 Feb 2026 03:20:02 +0000 (UTC)
X-Farcaster-Flow-ID: 5b92de31-a010-4660-b7f7-b5d7adf3e87b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:20:01 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:20:00 +0000
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
Subject: [PATCH 18/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:16 +0000
Message-ID: <20260212031521.2124-19-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D033UWC003.ant.amazon.com (10.13.139.217) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192003_225264_14BB2774 
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
CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              | 2 +-
 arch/x86/crypto/sm4_aesni_avx2_glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index ce00d3e0e451..103a49fbbac8 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -59,7 +59,7 @@ sm3-avx-x86_64-y := sm3-avx-asm_64.o sm3_avx_glue.o
 crypto-objs-$(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64) += sm4-aesni-avx-x86_64.o
 sm4-aesni-avx-x86_64-y := sm4-aesni-avx-asm_64.o sm4_aesni_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64) += sm4-aesni-avx2-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64) += sm4-aesni-avx2-x86_64.o
 sm4-aesni-avx2-x86_64-y := sm4-aesni-avx2-asm_64.o sm4_aesni_avx2_glue.o
 
 obj-$(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64) += aria-aesni-avx-x86_64.o
diff --git a/arch/x86/crypto/sm4_aesni_avx2_glue.c b/arch/x86/crypto/sm4_aesni_avx2_glue.c
index fec0ab7a63dd..4b7afdc383d9 100644
--- a/arch/x86/crypto/sm4_aesni_avx2_glue.c
+++ b/arch/x86/crypto/sm4_aesni_avx2_glue.c
@@ -124,8 +124,8 @@ static void __exit sm4_exit(void)
 				    ARRAY_SIZE(sm4_aesni_avx2_skciphers));
 }
 
-module_init(sm4_init);
-module_exit(sm4_exit);
+crypto_module_init(sm4_init);
+crypto_module_exit(sm4_exit);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Tianjia Zhang <tianjia.zhang@linux.alibaba.com>");
-- 
2.47.3


