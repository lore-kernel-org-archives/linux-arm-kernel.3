Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B440AEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cL9NzQyA16DZUbwUdyV+/q3IWCQzLQmp592jssBRRYU=; b=iylwxh3LbRoPDkYZWemHL3fXT3
	nvRq8TRFy0DMeBqUYqf/LUfYiMu6aLRCEpLe3mh3cV1rOtAOiNeguHXV/ZC/xK3b6HvaeBuDJDzr5
	bmL/9sWSz4/bJjEzo5lD1MddUNZnT8srjWiDYqp3tET29Bm/v4eoXyTWx8NUtu8bin/xZIpY8icFC
	BeKNU7EqEBhi3Xoj2z4R4I8WMYQdnkucj3tslH1Olk4cVXOoWaT/bG3576/QWNUcPtnXZwH4/tevh
	Q0j+qq6ubeTQbb0U6Ol8TEYcj7XMvjR4mOGRFXjJv4m7DIiOvUNsP50Oh4SftQHWhceN2nwjTcpFq
	GXi7WlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNFC-00000001Z6a-20lc;
	Thu, 12 Feb 2026 03:19:54 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNF9-00000001Z4a-0N1y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866391; x=1802402391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cL9NzQyA16DZUbwUdyV+/q3IWCQzLQmp592jssBRRYU=;
  b=M7bP0WjWcpMLqndV25C0ylivw1tAMCKG3ASkOgSzPl3gm5KZLpzdxpGX
   eox+D0xuUd+UgbGuJZx7GzaACUYpmUnhC3UY2R1egYAfBpb/B3IPaBH3e
   okeNhcPM68vqBMbCy8XyM+pTkAz+0r4N/Zy2NstPMzCO+DtVL9CFmhMnA
   Rwyf58EEhc44T6qmpJJlRzN+QPt3f0G+zalgTwCc4N9zYWTL2hVKKNDqF
   jZCHPmBcD+v34NFd5oFkN6c4rO89r1ieiLN73yjX8/Ce1bbZMAQwcffOf
   D40wwKvkHmPSIU73ZlhDCn530SxkIl9hxxUkPyW2Sj00UQ8iMsLxUK88N
   w==;
X-CSE-ConnectionGUID: crx28WnYT4WEv5Isqf77rQ==
X-CSE-MsgGUID: k+zLX5WdR6iIbbtaoLBtPQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12920113"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:19:00 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:26795]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id d0d5fdba-0d81-4cc5-b75b-3d0421c0abee; Thu, 12 Feb 2026 03:19:00 +0000 (UTC)
X-Farcaster-Flow-ID: d0d5fdba-0d81-4cc5-b75b-3d0421c0abee
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:18:59 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:18:58 +0000
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
Subject: [PATCH 14/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 crypto
Date: Thu, 12 Feb 2026 03:15:12 +0000
Message-ID: <20260212031521.2124-15-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D040UWB003.ant.amazon.com (10.13.138.8) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191951_178832_6F2092F2 
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
CONFIG_CRYPTO_AEGIS128_AESNI_SSE2-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              | 2 +-
 arch/x86/crypto/aegis128-aesni-glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index cfef8fbfba8f..601e4c8a9e7c 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -39,7 +39,7 @@ cast5-avx-x86_64-y := cast5-avx-x86_64-asm_64.o cast5_avx_glue.o
 crypto-objs-$(CONFIG_CRYPTO_CAST6_AVX_X86_64) += cast6-avx-x86_64.o
 cast6-avx-x86_64-y := cast6-avx-x86_64-asm_64.o cast6_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_AEGIS128_AESNI_SSE2) += aegis128-aesni.o
+crypto-objs-$(CONFIG_CRYPTO_AEGIS128_AESNI_SSE2) += aegis128-aesni.o
 aegis128-aesni-y := aegis128-aesni-asm.o aegis128-aesni-glue.o
 
 crypto-objs-$(CONFIG_CRYPTO_AES_NI_INTEL) += aesni-intel.o
diff --git a/arch/x86/crypto/aegis128-aesni-glue.c b/arch/x86/crypto/aegis128-aesni-glue.c
index f1adfba1a76e..b3f2e99f02b1 100644
--- a/arch/x86/crypto/aegis128-aesni-glue.c
+++ b/arch/x86/crypto/aegis128-aesni-glue.c
@@ -277,8 +277,8 @@ static void __exit crypto_aegis128_aesni_module_exit(void)
 	crypto_unregister_aead(&crypto_aegis128_aesni_alg);
 }
 
-module_init(crypto_aegis128_aesni_module_init);
-module_exit(crypto_aegis128_aesni_module_exit);
+crypto_module_init(crypto_aegis128_aesni_module_init);
+crypto_module_exit(crypto_aegis128_aesni_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ondrej Mosnacek <omosnacek@gmail.com>");
-- 
2.47.3


