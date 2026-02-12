Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5B7EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+DSZMaAt3tqM19PgFmPvXaYO4UgiBsRuyYi+/4ZMqk=; b=4a8XFG19eaLblyMU2Zf440R7vj
	CybRJ9XJz5ACBbGJbjVywF1hy1EH3uAEJJYAdkaeJoY2O33hR31jMRFPVZMzfqcxNk6TRLChl+w7X
	vuChjoxmnCq7apKv+Pb+VMWFUDGm/jtNhIj4wu64wKg5aJirX4+eoT8Cgyu63lAGoO9OZ4mgJptxO
	FMhw5KBv76dUTn92cWTzcDSMoKjNdeGxeLTvAQwqsul6E3yLciYzNv07hB1qGN/FyzUv8Q59OqfWm
	Ja25jjwsCF5V6xXUE3DGp774RFRH1KcbLLztJCTf8q3D5bGd+lc1DEYN8HdEVq45SpuqnKNcpNS+V
	pugzYTLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNCc-00000001Y0r-1XJY;
	Thu, 12 Feb 2026 03:17:14 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNCZ-00000001XzS-3U54
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866231; x=1802402231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o+DSZMaAt3tqM19PgFmPvXaYO4UgiBsRuyYi+/4ZMqk=;
  b=e7rAPjNv++Y6qDr8va5bKL78R7774LEOMVelzI6C8HsNBd8nREcZzCS8
   YpQMbTzzTcnwZ60YqOI5+Ene/hEiIzKKRsz7uFZdYsrSujOMhK3r/yjvY
   ajPVKMHPxILHN5JCuomFv7IVrkinpbfpSXjKnqPo3S0YXAPynVtERDgxy
   ApOJaAlDidyotmZRAJtAfoCkeszOD74jn7/ydHA6gzgG3k1CoCoqT0Xte
   RUv+jB3aW7d+UzU4Vf5dLx5twjo4t4DopkiKY2boWY88T82q9xSMLdrj1
   flronPeXI6JpIWs6OqDacLSpwOKPXE13GBU7ExBC5EzDmb9EC2WmwDIv2
   Q==;
X-CSE-ConnectionGUID: LzYgajfoSjmVBP/n3Z9DCw==
X-CSE-MsgGUID: o3XOB/z7TEGg4hiZ74RL6w==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12804101"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:17:11 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:19665]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id dae80c19-90cf-432c-9b66-77e8fb1fc03d; Thu, 12 Feb 2026 03:17:11 +0000 (UTC)
X-Farcaster-Flow-ID: dae80c19-90cf-432c-9b66-77e8fb1fc03d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:17:10 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:17:10 +0000
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
Subject: [PATCH 07/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SERPENT_AVX2_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:05 +0000
Message-ID: <20260212031521.2124-8-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D037UWC003.ant.amazon.com (10.13.139.231) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191711_923078_5869DB73 
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
CONFIG_CRYPTO_SERPENT_AVX2_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile            | 2 +-
 arch/x86/crypto/serpent_avx2_glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 8be124f5e05d..5f7d35f8d313 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -17,7 +17,7 @@ crypto-objs-$(CONFIG_CRYPTO_SERPENT_SSE2_X86_64) += serpent-sse2-x86_64.o
 serpent-sse2-x86_64-y := serpent-sse2-x86_64-asm_64.o serpent_sse2_glue.o
 crypto-objs-$(CONFIG_CRYPTO_SERPENT_AVX_X86_64) += serpent-avx-x86_64.o
 serpent-avx-x86_64-y := serpent-avx-x86_64-asm_64.o serpent_avx_glue.o
-obj-$(CONFIG_CRYPTO_SERPENT_AVX2_X86_64) += serpent-avx2.o
+crypto-objs-$(CONFIG_CRYPTO_SERPENT_AVX2_X86_64) += serpent-avx2.o
 serpent-avx2-y := serpent-avx2-asm_64.o serpent_avx2_glue.o
 
 obj-$(CONFIG_CRYPTO_DES3_EDE_X86_64) += des3_ede-x86_64.o
diff --git a/arch/x86/crypto/serpent_avx2_glue.c b/arch/x86/crypto/serpent_avx2_glue.c
index f5f2121b7956..dbcddbaac233 100644
--- a/arch/x86/crypto/serpent_avx2_glue.c
+++ b/arch/x86/crypto/serpent_avx2_glue.c
@@ -114,8 +114,8 @@ static void __exit serpent_avx2_fini(void)
 	crypto_unregister_skciphers(serpent_algs, ARRAY_SIZE(serpent_algs));
 }
 
-module_init(serpent_avx2_init);
-module_exit(serpent_avx2_fini);
+crypto_module_init(serpent_avx2_init);
+crypto_module_exit(serpent_avx2_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Serpent Cipher Algorithm, AVX2 optimized");
-- 
2.47.3


