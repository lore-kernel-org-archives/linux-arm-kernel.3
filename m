Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DA2EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkDhwjOZrpamwSu22JI7M0uaHC9mk3y0opcfSDw/FVs=; b=XsdOSQ7g7ZoO/R6xJKQfF/zwvp
	I+DOz0HIMwvf+O/1yChb3IliE8vX884lfGHiA8cADQ51jneKk7Wd88VyYjcygxpApvy+JpH/7sDPv
	bGArUEr0fHCyMRVRiaShDf1zvBy4fztFywR7GyGB9wT0tOQx3UxPMn3y3bpzCEYPa/OX+MQ77PEgM
	uQWrqyeIBdjLbtNe8o82Mi/CYyccyjMddBr7N/c2EyveLIuMrvSIgqsJQPXf0I79RHA0PFox93jTI
	I2ioXuWNJtHzzjuUVDU0+y0CWd9RVG/ycH2vcdHYbqmlEpSUiaUtmSm3eyeVFEs6ySQrDv7mGvlL4
	6UWgqJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNHr-00000001aIs-45JT;
	Thu, 12 Feb 2026 03:22:39 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNHo-00000001aFw-0VCv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866556; x=1802402556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZkDhwjOZrpamwSu22JI7M0uaHC9mk3y0opcfSDw/FVs=;
  b=jeWnrQ0le5293rSMVLOxZApeNiFda27dLLyUnaoGH4LrsFnOGtQJw0Yn
   liFOQXFcj+yJBXoytQ9mv2oFvnF56R+1UPUceZp6TjLAaXpQ0mjKGCkJ4
   5GKJfmrQp8XKTNfA1V+ArPb92Bslk6d63vlXQUgNqC2JDBSOk0pAQ4Y9d
   g11hiz2vmwmyjgLKELeiNw89HwgJjiP409TT+ZUyrZ/VBykqdp70jVSRQ
   5bZrak3GCzdc0QA5m5q6XEJYLuXumo4LeXsyiNf8b7NYfDS9AlACGu0MS
   310nzjOuRxsRZCRYEDNmXq8mtiUlsDBhdbiipfQmDA0QqnDqFNoXRxthd
   Q==;
X-CSE-ConnectionGUID: FisB0SiSR7WyV6EdV/ICtg==
X-CSE-MsgGUID: kUlsHcQ6Q/e65OlTA1tOpw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12722696"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:22:35 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:30685]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id 146075df-a5f9-46d8-a026-0166005e892d; Thu, 12 Feb 2026 03:22:35 +0000 (UTC)
X-Farcaster-Flow-ID: 146075df-a5f9-46d8-a026-0166005e892d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:22:35 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:22:34 +0000
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
Subject: [PATCH 05/12] arm64: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SM4_ARM64_CE_CCM crypto
Date: Thu, 12 Feb 2026 03:21:05 +0000
Message-ID: <20260212032117.9166-6-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212032117.9166-1-wanjay@amazon.com>
References: <20260212032117.9166-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D041UWA004.ant.amazon.com (10.13.139.9) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192236_209608_F8676C76 
X-CRM114-Status: GOOD (  10.83  )
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
CONFIG_CRYPTO_SM4_ARM64_CE_CCM-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile          | 2 +-
 arch/arm64/crypto/sm4-ce-ccm-glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 59e94f714ef9..f17d35591ab2 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -17,7 +17,7 @@ sm4-ce-cipher-y := sm4-ce-cipher-glue.o sm4-ce-cipher-core.o
 crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE_BLK) += sm4-ce.o
 sm4-ce-y := sm4-ce-glue.o sm4-ce-core.o
 
-obj-$(CONFIG_CRYPTO_SM4_ARM64_CE_CCM) += sm4-ce-ccm.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE_CCM) += sm4-ce-ccm.o
 sm4-ce-ccm-y := sm4-ce-ccm-glue.o sm4-ce-ccm-core.o
 
 obj-$(CONFIG_CRYPTO_SM4_ARM64_CE_GCM) += sm4-ce-gcm.o
diff --git a/arch/arm64/crypto/sm4-ce-ccm-glue.c b/arch/arm64/crypto/sm4-ce-ccm-glue.c
index 332f02167a96..96e54d9c45fd 100644
--- a/arch/arm64/crypto/sm4-ce-ccm-glue.c
+++ b/arch/arm64/crypto/sm4-ce-ccm-glue.c
@@ -276,8 +276,8 @@ static void __exit sm4_ce_ccm_exit(void)
 	crypto_unregister_aead(&sm4_ccm_alg);
 }
 
-module_cpu_feature_match(SM4, sm4_ce_ccm_init);
-module_exit(sm4_ce_ccm_exit);
+crypto_module_cpu_feature_match(SM4, sm4_ce_ccm_init);
+crypto_module_exit(sm4_ce_ccm_exit);
 
 MODULE_DESCRIPTION("Synchronous SM4 in CCM mode using ARMv8 Crypto Extensions");
 MODULE_ALIAS_CRYPTO("ccm(sm4)");
-- 
2.47.3


