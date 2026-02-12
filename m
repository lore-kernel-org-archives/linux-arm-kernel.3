Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052C5EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/NVq/5n4YYeyvBLh8R7bGnXKtDgVWmW0jOnB9Jf7f4=; b=SZHcTfCbOP1IABwnDU6YhCz46e
	XnXLYvqeZWr0PVINhJmiBw5reLRmCW42yigT07e1VRUb8jpixaJk2w8f1zzFrM9ZwqwI5Xbv2TahJ
	6zUJIC/J613STi8eTPAiJaX5buxP8Uiocjje5ZeS0ARMORTSp52k8SrQRl8rJWYMLevDijqLE8j6B
	GpqnQXyLkzptuyU316XLpjSG3s0rvrvLN+upB3opa+iEn71R8Xv4NKFDg6utwCLGloUeWTxGokrn/
	EcXaTgR11Mk2sezzAnP6nwpdng5lXiHdWYRVZDYJcz679gWfE3Rg0d7C20NeLA9UXVQ2od2Rvoxnh
	6iq693Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNHO-00000001a3F-1MlA;
	Thu, 12 Feb 2026 03:22:10 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNHL-00000001a1G-19Vf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866527; x=1802402527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z/NVq/5n4YYeyvBLh8R7bGnXKtDgVWmW0jOnB9Jf7f4=;
  b=KxJSUlsI8ia7egiGuXJ64EOupTzEgDi1kSRNNBNC/eZq9I368l/zwMxE
   jY6v04RsRsQDgBNhwR/Eek0ZqNY2MODawPUrl4hcFjEXiGEGjGNW2O2Ax
   j55SF/ji7SSzTO5+fD6iSZ0eclnBhhwftZqYLglaFPim4ykeNqwG14Rv3
   KZFi9Uk1kRCm4DrZh8a0UowLXR3Rp+5wiqnicuDN9j/hwVwSFEV83xFOe
   YVNt7ttqdlgB2v+QO3EnE+C1IiKUnqmFjpHevzLfQCaErsEsYcOdcYPrs
   T4pL9siHMmeEALtzJur08dE++nj7iI9tA+wFM6sAnsqoT9ig1apCJ+gLO
   g==;
X-CSE-ConnectionGUID: qgBWPn4GQjSN8sC1VvyiNA==
X-CSE-MsgGUID: cev0yhS+RGm64dZZkx3ucg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12722680"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:22:05 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:13076]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id 40520674-8465-401b-878c-f2672665a45b; Thu, 12 Feb 2026 03:22:04 +0000 (UTC)
X-Farcaster-Flow-ID: 40520674-8465-401b-878c-f2672665a45b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:22:04 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:22:03 +0000
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
Subject: [PATCH 03/12] arm64: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SM4_ARM64_CE crypto
Date: Thu, 12 Feb 2026 03:21:03 +0000
Message-ID: <20260212032117.9166-4-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212032117.9166-1-wanjay@amazon.com>
References: <20260212032117.9166-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D040UWA001.ant.amazon.com (10.13.139.22) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192207_359927_E3F3E2D2 
X-CRM114-Status: GOOD (  10.94  )
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
CONFIG_CRYPTO_SM4_ARM64_CE-related crypto to convert them into
pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile             | 2 +-
 arch/arm64/crypto/sm4-ce-cipher-glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 43cac8d5738f..a4fe2bf71c6b 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -11,7 +11,7 @@ sm3-neon-y := sm3-neon-glue.o sm3-neon-core.o
 crypto-objs-$(CONFIG_CRYPTO_SM3_ARM64_CE) += sm3-ce.o
 sm3-ce-y := sm3-ce-glue.o sm3-ce-core.o
 
-obj-$(CONFIG_CRYPTO_SM4_ARM64_CE) += sm4-ce-cipher.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE) += sm4-ce-cipher.o
 sm4-ce-cipher-y := sm4-ce-cipher-glue.o sm4-ce-cipher-core.o
 
 obj-$(CONFIG_CRYPTO_SM4_ARM64_CE_BLK) += sm4-ce.o
diff --git a/arch/arm64/crypto/sm4-ce-cipher-glue.c b/arch/arm64/crypto/sm4-ce-cipher-glue.c
index bceec833ef4e..0baa7dced9f9 100644
--- a/arch/arm64/crypto/sm4-ce-cipher-glue.c
+++ b/arch/arm64/crypto/sm4-ce-cipher-glue.c
@@ -76,5 +76,5 @@ static void __exit sm4_ce_mod_fini(void)
 	crypto_unregister_alg(&sm4_ce_alg);
 }
 
-module_cpu_feature_match(SM4, sm4_ce_mod_init);
-module_exit(sm4_ce_mod_fini);
+crypto_module_cpu_feature_match(SM4, sm4_ce_mod_init);
+crypto_module_exit(sm4_ce_mod_fini);
-- 
2.47.3


