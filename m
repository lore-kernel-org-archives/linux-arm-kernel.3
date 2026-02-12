Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8036EEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2D91nUATxmfObgoS15ag4ACKZQIXGGKDXe90R6Elqc=; b=cq4UyTOIfH9YbiSv1UNO1RsGDj
	Qgv+hfGFwpYoe7LbU0eBLTd7pdrnQPI6tJG1a0858A5hoA/gycDbpcvV/jkkeku026BOWe2JssciI
	2oNey1F/dDf1GfymkuYvS+R8HgMzsJE63mzc9urEibPlTsb55HtXcsGpX5K70R50lT3pNbxYbMjmC
	LvOj+sa0VuT1dQ/q/VrUMyxOYPH1Yrw6P8lg/CIu4JNcKtRTGHyUGSMj+zoT0/LaniQJuXaQvHbgg
	B1J7iA3QQqK4QDngk8Csa/LbMgDynGVhDqQM7t+P/fPpd+VoE6bHQU2bS6q6Qm7ndig5BsWOXW/CW
	AK0UY9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNDN-00000001YKf-0AP5;
	Thu, 12 Feb 2026 03:18:01 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNDK-00000001YIt-0UFr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866278; x=1802402278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p2D91nUATxmfObgoS15ag4ACKZQIXGGKDXe90R6Elqc=;
  b=ttzmv2QvpRciQ5m61MUOnAlva5Ugeebs9Gko/wmlz/BhMOsB6L0zjaud
   ap2ZwFyKvLWaKgyf2Jo+5mMzOymBpvRRd7LE5EoXKE0oGtWB6t9AKjqF0
   LIjtTvnzjA5jTFcl9WTh99/JabD9/s6MgWlDPGw/a29QvevSvEVr3YgZi
   f4h8TyByfCXLOAIYrqB5e71TrKPl8YP2qmPbcEsEVvEbOawIWF9LIL793
   UMdS9nDkVAi+ZqQj4yBYtYFBiuxUDwKTEYFGrlbDZl6Sz6KBysGhv85ec
   CoxNpGxWcjBTkmzM74o9ztmM2lNpkZhKD2d/lXZrOfjwS9HS3teOrj9Tp
   g==;
X-CSE-ConnectionGUID: p5iZy9jEQ0yYK+gQfvXKIg==
X-CSE-MsgGUID: ONFninUUR3Sa4m3ktlky2Q==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12804121"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:17:57 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:18837]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id 23f85647-5769-4559-a44b-84d9dfa33392; Thu, 12 Feb 2026 03:17:57 +0000 (UTC)
X-Farcaster-Flow-ID: 23f85647-5769-4559-a44b-84d9dfa33392
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:17:57 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:17:56 +0000
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
Subject: [PATCH 10/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_AES_NI_INTEL crypto
Date: Thu, 12 Feb 2026 03:15:08 +0000
Message-ID: <20260212031521.2124-11-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWA002.ant.amazon.com (10.13.139.39) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191758_858591_C881F93A 
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
CONFIG_CRYPTO_AES_NI_INTEL-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile           | 2 +-
 arch/x86/crypto/aesni-intel_glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 8751154e1328..a3af66c98760 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -42,7 +42,7 @@ cast6-avx-x86_64-y := cast6-avx-x86_64-asm_64.o cast6_avx_glue.o
 obj-$(CONFIG_CRYPTO_AEGIS128_AESNI_SSE2) += aegis128-aesni.o
 aegis128-aesni-y := aegis128-aesni-asm.o aegis128-aesni-glue.o
 
-obj-$(CONFIG_CRYPTO_AES_NI_INTEL) += aesni-intel.o
+crypto-objs-$(CONFIG_CRYPTO_AES_NI_INTEL) += aesni-intel.o
 aesni-intel-y := aesni-intel_asm.o aesni-intel_glue.o
 aesni-intel-$(CONFIG_64BIT) += aes-ctr-avx-x86_64.o \
 			       aes-gcm-aesni-x86_64.o \
diff --git a/arch/x86/crypto/aesni-intel_glue.c b/arch/x86/crypto/aesni-intel_glue.c
index e6c38d1d8a92..57bee257365a 100644
--- a/arch/x86/crypto/aesni-intel_glue.c
+++ b/arch/x86/crypto/aesni-intel_glue.c
@@ -1664,8 +1664,8 @@ static void __exit aesni_exit(void)
 	unregister_avx_algs();
 }
 
-module_init(aesni_init);
-module_exit(aesni_exit);
+crypto_module_init(aesni_init);
+crypto_module_exit(aesni_exit);
 
 MODULE_DESCRIPTION("AES cipher and modes, optimized with AES-NI or VAES instructions");
 MODULE_LICENSE("GPL");
-- 
2.47.3


