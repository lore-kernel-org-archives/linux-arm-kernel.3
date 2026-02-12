Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D32EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utw11iX6Z+INEVXEgqscnNKBqePfmcmLIE3TQqAigy8=; b=l4g5xZOjV9AWq6thNRit36KoCd
	vmupPkQnsydbEZLqFLUqyyzYOvaBZk8EyZk+GfG5o2JJ8+Zr+PJIZGa1b7gmVgprarZ3566ImbCGi
	icymaVsXtpNX6f5/8C/dLPT/TzELy/RHg7v/Eij4Kie+ujAh4nL7fAYmYJaXeTmP5/P/YLu6vmmJ1
	hFhJD9WQDX62O8w6/J73pDPqgAUPXM7Jzvi2IMUZBQ5CIbp6s3/mcj2tVwQTDIVj9z3xyjcQN0su/
	ya+PEm7x1vsQg1m35pzb/t26qGINcOoM0w613wMs/OjxoJ9bxRHZ2HPvkncCiodNf5+jkKCUlIfGZ
	ONCJhdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNJ9-00000001axd-3HD1;
	Thu, 12 Feb 2026 03:23:59 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNJ4-00000001awM-0Ddj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866634; x=1802402634;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=utw11iX6Z+INEVXEgqscnNKBqePfmcmLIE3TQqAigy8=;
  b=Z5FhulXOyh4k5stMs/ERblhgMFUslSoAw2txuGvpSBLclzNt+x+097Hr
   NmZoP4FCtNCLHj0x2Ejzi07tRr3DOmCxyd4Ihq5agOuaHxGRobqWkTuyw
   s9shGoXeN/LhaiKziv8AfLDluGU/yN1ITe8f72ll9E/Ms/vGdx1QCdmHV
   KT2Sk0zH2fF9CjqXucv84GEC0s7+PB9/hEORWlkx1fYd1b5g9YDBpZKib
   x0tZ952LQrsb13/stdxMLcy8lWqLZJqhYI4dMkFCVZTV77f3DXt2IKDxj
   Um8ZBoIEdA6aOd78vvFt00iwGmKZdQ2t+mpagwcHkoQoSfJNLBiKh2C5P
   g==;
X-CSE-ConnectionGUID: MhiVjRofQOimhbO9qsirxw==
X-CSE-MsgGUID: ANiJn+dlTYyF8l9MMpmn/Q==
X-IronPort-AV: E=Sophos;i="6.21,286,1763424000"; 
   d="scan'208";a="12920275"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:23:53 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:9189]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 813c9955-df14-4e64-858a-cf83e3da1637; Thu, 12 Feb 2026 03:23:53 +0000 (UTC)
X-Farcaster-Flow-ID: 813c9955-df14-4e64-858a-cf83e3da1637
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:23:53 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:23:52 +0000
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
Subject: [PATCH 10/12] arm64: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_AES_ARM64_CE_BLK crypto
Date: Thu, 12 Feb 2026 03:21:10 +0000
Message-ID: <20260212032117.9166-11-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212032117.9166-1-wanjay@amazon.com>
References: <20260212032117.9166-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D041UWB001.ant.amazon.com (10.13.139.132) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192354_144177_2EDDDF3B 
X-CRM114-Status: GOOD (  10.43  )
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
CONFIG_CRYPTO_AES_ARM64_CE_BLK-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile   | 2 +-
 arch/arm64/crypto/aes-glue.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 710887575f2d..a98342e64eb1 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -32,7 +32,7 @@ ghash-ce-y := ghash-ce-glue.o ghash-ce-core.o
 crypto-objs-$(CONFIG_CRYPTO_AES_ARM64_CE_CCM) += aes-ce-ccm.o
 aes-ce-ccm-y := aes-ce-ccm-glue.o aes-ce-ccm-core.o
 
-obj-$(CONFIG_CRYPTO_AES_ARM64_CE_BLK) += aes-ce-blk.o
+crypto-objs-$(CONFIG_CRYPTO_AES_ARM64_CE_BLK) += aes-ce-blk.o
 aes-ce-blk-y := aes-glue-ce.o aes-ce.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_NEON_BLK) += aes-neon-blk.o
diff --git a/arch/arm64/crypto/aes-glue.c b/arch/arm64/crypto/aes-glue.c
index 92f43e1cd097..cba1db7afd26 100644
--- a/arch/arm64/crypto/aes-glue.c
+++ b/arch/arm64/crypto/aes-glue.c
@@ -970,14 +970,14 @@ static int __init aes_init(void)
 }
 
 #ifdef USE_V8_CRYPTO_EXTENSIONS
-module_cpu_feature_match(AES, aes_init);
+crypto_module_cpu_feature_match(AES, aes_init);
 EXPORT_SYMBOL_NS(ce_aes_mac_update, "CRYPTO_INTERNAL");
 #else
-module_init(aes_init);
+crypto_module_init(aes_init);
 EXPORT_SYMBOL(neon_aes_ecb_encrypt);
 EXPORT_SYMBOL(neon_aes_cbc_encrypt);
 EXPORT_SYMBOL(neon_aes_ctr_encrypt);
 EXPORT_SYMBOL(neon_aes_xts_encrypt);
 EXPORT_SYMBOL(neon_aes_xts_decrypt);
 #endif
-module_exit(aes_exit);
+crypto_module_exit(aes_exit);
-- 
2.47.3


