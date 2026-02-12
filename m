Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701C3EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyBtxVMRU3iJexQIcMrCxSy/8F36/qAiDl0Bt+KJ7FM=; b=2Dqv+lvjNRk/KTMyeENM9Z10sx
	gUydCr5wITwM/8Qte1bW3IgBFIVFDw21W0yepnYiXD4gl3HjiXoe/FFXHj50iATUG71r29KelkXCL
	PHIdx/Z+1+j479zMdz1k62rfzQ7vA8evJn0kiABvJkZYEOPXKZ4aoWnUM0S7wsD3B6CUbGjUadfaj
	feSJyUVdbe9h26uNebZcl8oy6Ns46zYmmZt1KUXqlKwMgebBjgGxw+18HnP18HWjU1pNHz/b0pSiW
	8V1YPjxlWjaVegHgxIDc2eIhKbvMmJyGh8vnSyXWu4/1alu25ZZS2PPj5MnCdU32SRWSND3omU8K9
	Qyrapk/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNJb-00000001bBc-43VW;
	Thu, 12 Feb 2026 03:24:27 +0000
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.35.192.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNJZ-00000001b9w-01Dl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866665; x=1802402665;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eyBtxVMRU3iJexQIcMrCxSy/8F36/qAiDl0Bt+KJ7FM=;
  b=NKxbtAVpymx1EEWEUcRCzFGUMGoQPHgwCITszlJ1j8it/qxr4kgm9viL
   6bgGwEkX8iA5ftd2ewFYYWracXmd9mvVGym7m4qPvcrS+Stk/Iv0XVisf
   KnTnIVpKsZDjGUaW6sG2QvXTSNfFSP4GhOZ5BA9wlV+a5PcNHRi+MG2UT
   HYUeQvEEnloBLgkF0tZVnMLl0Cm1Ewc67s5xE8U+KekMG5OLtxPFfJU8X
   zFPUJKY23mhMTa4OyBNLhTFvGLTp767iD2ROITrPRHhZCli2JNAqbT3Ii
   AwgVUIDeOAXG2axsN5Uy+eYup1jznWiu+eAu4+FnpBiCqc+rEFaZX4gbt
   Q==;
X-CSE-ConnectionGUID: IViQqOIMRqKNstPltMtuEw==
X-CSE-MsgGUID: nTkaTpJkQgahY2Wm+/oT2w==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12699351"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:24:24 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:3338]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id c8b3e53f-c925-4ed7-a851-f37a81c4dfb0; Thu, 12 Feb 2026 03:24:24 +0000 (UTC)
X-Farcaster-Flow-ID: c8b3e53f-c925-4ed7-a851-f37a81c4dfb0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:24:24 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:24:23 +0000
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
Subject: [PATCH 12/12] arm64: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_AES_ARM64_BS crypto
Date: Thu, 12 Feb 2026 03:21:12 +0000
Message-ID: <20260212032117.9166-13-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212032117.9166-1-wanjay@amazon.com>
References: <20260212032117.9166-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D043UWA003.ant.amazon.com (10.13.139.31) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192425_394488_85C83D74 
X-CRM114-Status: GOOD (  11.04  )
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
CONFIG_CRYPTO_AES_ARM64_BS-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile          | 2 +-
 arch/arm64/crypto/aes-neonbs-glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 6053065c18cc..2c0215a09118 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -38,7 +38,7 @@ aes-ce-blk-y := aes-glue-ce.o aes-ce.o
 crypto-objs-$(CONFIG_CRYPTO_AES_ARM64_NEON_BLK) += aes-neon-blk.o
 aes-neon-blk-y := aes-glue-neon.o aes-neon.o
 
-obj-$(CONFIG_CRYPTO_AES_ARM64_BS) += aes-neon-bs.o
+crypto-objs-$(CONFIG_CRYPTO_AES_ARM64_BS) += aes-neon-bs.o
 aes-neon-bs-y := aes-neonbs-core.o aes-neonbs-glue.o
 
 # FIPS 140 kernel module
diff --git a/arch/arm64/crypto/aes-neonbs-glue.c b/arch/arm64/crypto/aes-neonbs-glue.c
index cb87c8fc66b3..42da18008614 100644
--- a/arch/arm64/crypto/aes-neonbs-glue.c
+++ b/arch/arm64/crypto/aes-neonbs-glue.c
@@ -464,5 +464,5 @@ static int __init aes_init(void)
 	return crypto_register_skciphers(aes_algs, ARRAY_SIZE(aes_algs));
 }
 
-module_init(aes_init);
-module_exit(aes_exit);
+crypto_module_init(aes_init);
+crypto_module_exit(aes_exit);
-- 
2.47.3


