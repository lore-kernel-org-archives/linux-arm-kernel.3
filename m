Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987F2EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTjo9ROXVjI/2wmUrUsKoQpSZIzGlVO4//e07fvuDBo=; b=RZOoqJQFD4ILD4Nhm5t2/faU5Y
	OGv/Tyr7Xe7Ntm+N5N3AKNX6dMuzuV1s7kXNTCfa1lbz0WgIA41l/Ld94RDo/O9v+TB19YBhBlKPG
	rJeklqKVVHAUAuijG1nyfq/sFgDqHfnU5vl2u/vVB8AWW9nk8H8563mcDiUZ7kht3OhZDXCptHVPL
	i2U7UyONjvT9oFu7HXiVSeERhBt8nwEn4WjZX88D64kWeipevEs/0Qb/tLoIK9X+cFXXwXQjEoRCb
	l0TT0XZeHPI/rL//bLjGShnm0B7a8qDAzuV7WcEE2XxZigO7364HgxbTJ6Ja3TCeBx7ThHLoi8P1n
	IzvlOkBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNB7-00000001XNZ-1Ukc;
	Thu, 12 Feb 2026 03:15:41 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNB4-00000001XLj-1t4y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866138; x=1802402138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oTjo9ROXVjI/2wmUrUsKoQpSZIzGlVO4//e07fvuDBo=;
  b=atozbKdWCW1EZgkCUzLan/Z9zRCP9bMZ5hYcc011+pjQnprTO0cwDvm2
   w6c8uykHZHNkL8A/1HEMHRXKSfgwUVgSdwb2/usL8wVmNndpJJlDSUehe
   PwbR5X4G04v8WvEm+THqiHROON1dFvZxwWMo5aiWsY8QvmmHDzqHx4sDW
   C6a5Ynq8msZhnK4NuaF1173xQloRyT/E1RjBMUhjPRb6wIvFkoR+B9LaZ
   iKh2J9uyR1njfbi9XyWvKwnyv7j4tSIqgW9grDNeGdToRGxb5/OEMBVE6
   MDrWP2u4l2F28CYQSmIY5cn+YHzCcOlMV2rGqljnfyHcV+pGY5k0N0IP0
   w==;
X-CSE-ConnectionGUID: u7DjWA5SRICknfviD/cRpw==
X-CSE-MsgGUID: oWjtkTmXRxaD6345yCZV7g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744825"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:15:37 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:11956]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id fd90b74e-190a-4bb2-8091-a71622062c87; Thu, 12 Feb 2026 03:15:37 +0000 (UTC)
X-Farcaster-Flow-ID: fd90b74e-190a-4bb2-8091-a71622062c87
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:15:37 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:15:37 +0000
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
Subject: [PATCH 01/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CAST5_AVX_X86_64 and CONFIG_CRYPTO_CAST6_AVX_X86_64 crypto
Date: Thu, 12 Feb 2026 03:14:59 +0000
Message-ID: <20260212031521.2124-2-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D033UWA001.ant.amazon.com (10.13.139.103) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191538_545798_C9B09C58 
X-CRM114-Status: GOOD (  10.48  )
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
CONFIG_CRYPTO_CAST5_AVX_X86_64- and CONFIG_CRYPTO_CAST6_AVX_X86_64-
related crypto to convert them into pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile         | 4 ++--
 arch/x86/crypto/cast5_avx_glue.c | 4 ++--
 arch/x86/crypto/cast6_avx_glue.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index ab248a1beb00..27010cb2326c 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -33,10 +33,10 @@ camellia-aesni-avx2-y := camellia-aesni-avx2-asm_64.o camellia_aesni_avx2_glue.o
 obj-$(CONFIG_CRYPTO_BLOWFISH_X86_64) += blowfish-x86_64.o
 blowfish-x86_64-y := blowfish-x86_64-asm_64.o blowfish_glue.o
 
-obj-$(CONFIG_CRYPTO_CAST5_AVX_X86_64) += cast5-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAST5_AVX_X86_64) += cast5-avx-x86_64.o
 cast5-avx-x86_64-y := cast5-avx-x86_64-asm_64.o cast5_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_CAST6_AVX_X86_64) += cast6-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAST6_AVX_X86_64) += cast6-avx-x86_64.o
 cast6-avx-x86_64-y := cast6-avx-x86_64-asm_64.o cast6_avx_glue.o
 
 obj-$(CONFIG_CRYPTO_AEGIS128_AESNI_SSE2) += aegis128-aesni.o
diff --git a/arch/x86/crypto/cast5_avx_glue.c b/arch/x86/crypto/cast5_avx_glue.c
index 3aca04d43b34..267fc2948288 100644
--- a/arch/x86/crypto/cast5_avx_glue.c
+++ b/arch/x86/crypto/cast5_avx_glue.c
@@ -109,8 +109,8 @@ static void __exit cast5_exit(void)
 	crypto_unregister_skciphers(cast5_algs, ARRAY_SIZE(cast5_algs));
 }
 
-module_init(cast5_init);
-module_exit(cast5_exit);
+crypto_module_init(cast5_init);
+crypto_module_exit(cast5_exit);
 
 MODULE_DESCRIPTION("Cast5 Cipher Algorithm, AVX optimized");
 MODULE_LICENSE("GPL");
diff --git a/arch/x86/crypto/cast6_avx_glue.c b/arch/x86/crypto/cast6_avx_glue.c
index c4dd28c30303..5ab35cf5817a 100644
--- a/arch/x86/crypto/cast6_avx_glue.c
+++ b/arch/x86/crypto/cast6_avx_glue.c
@@ -108,8 +108,8 @@ static void __exit cast6_exit(void)
 	crypto_unregister_skciphers(cast6_algs, ARRAY_SIZE(cast6_algs));
 }
 
-module_init(cast6_init);
-module_exit(cast6_exit);
+crypto_module_init(cast6_init);
+crypto_module_exit(cast6_exit);
 
 MODULE_DESCRIPTION("Cast6 Cipher Algorithm, AVX optimized");
 MODULE_LICENSE("GPL");
-- 
2.47.3


