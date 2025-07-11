Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C846C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 21:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kQ8q+0VI9ncTIFKFUK0olf4g2fkVoQ7/B4TJHsNk4BI=; b=rXO+QbHHW5ceb1bJT6QaXvNIta
	1qfOSIaCiNiw0Uezx2hQQHPkYNjtmLUJzAI4w+3TDcNHLCAns44Po6459u/H9DfGxQuhrjGxS7HJk
	Pz04F+762YsLVe9nFh712LNKs1Ec+SM5SyWdxF+1gEv40nwTlF3vPV4nMr/viJ0ggxtKvZTa8J3va
	03AUAI7RKIc1VvPMkPYpCP+0TPU/61HIUmekZJTNlSIFOde1y/ea0AUsMKd3OR9D8VvJ4HKwHmXnT
	DNICXgz6W9qJHyVmXjoPEn9vEqxd3V5PSH+tmMy2jw/kIlk4eCHKGwahaOtt/UUuYmBVc/jopgfh1
	ipWXYesA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLKk-0000000Ftfx-1TrI;
	Fri, 11 Jul 2025 21:31:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLIP-0000000FtTi-0F4u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 21:28:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AB1C0A5506F;
	Fri, 11 Jul 2025 21:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42E6C4CEED;
	Fri, 11 Jul 2025 21:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752269319;
	bh=mgTFc9Ih57nI00XG3MdTUbxlxI73VXPHE562WpIzZ6w=;
	h=From:To:Cc:Subject:Date:From;
	b=YdqyT2bLFSoqRKKLyy+oKI0+QiaZ7ntkAP684LSrI0CT9ydHdbREd3ve1gIcFZQyL
	 SNDwM0v4hZ+rEFq9Zp/qqCUJm5FBTIGNRWp4iYIEXteRVJ86ikhQ1+uRdvoToqJD1u
	 mN8i91sQ3pdVVOc5eJ4ZWJftdAuc1uXxMsV+p/K8OCXS83joqb2PdPC4R2ic29RWvc
	 ZASkAi2H+wu8Y1qgKfJqRa1XBTns230biniXdzBv3WqbXsQI2sFl+eXHCoqt6za7XS
	 vIBtRYplwHIE9xtwevn1pbmJ2JRghzm/Cy/SSiNCvQCoPSyCaMS0wmQSlRbyW60A29
	 GUDD2JBR0LJbw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2] lib/crypto: arm/poly1305: Remove unneeded empty weak function
Date: Fri, 11 Jul 2025 14:28:22 -0700
Message-ID: <20250711212822.6372-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_142841_162614_BFF5C6A9 
X-CRM114-Status: GOOD (  12.22  )
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

Fix poly1305-armv4.pl to not do '.globl poly1305_blocks_neon' when
poly1305_blocks_neon() is not defined.  Then, remove the empty __weak
definition of poly1305_blocks_neon(), which was still needed only
because of that unnecessary globl statement.  (It also used to be needed
because the compiler could generate calls to it when
CONFIG_KERNEL_MODE_NEON=n, but that has been fixed.)

Thanks to Arnd Bergmann for reporting that the globl statement in the
asm file was still depending on the weak symbol.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm/poly1305-armv4.pl | 2 +-
 lib/crypto/arm/poly1305-glue.c   | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/lib/crypto/arm/poly1305-armv4.pl b/lib/crypto/arm/poly1305-armv4.pl
index d57c6e2fc84a5..dd7a996361a71 100644
--- a/lib/crypto/arm/poly1305-armv4.pl
+++ b/lib/crypto/arm/poly1305-armv4.pl
@@ -44,11 +44,10 @@ $code.=<<___;
 # define __ARM_ARCH__ __LINUX_ARM_ARCH__
 # define __ARM_MAX_ARCH__ __LINUX_ARM_ARCH__
 # define poly1305_init   poly1305_block_init_arch
 # define poly1305_blocks poly1305_blocks_arm
 # define poly1305_emit   poly1305_emit_arch
-.globl	poly1305_blocks_neon
 #endif
 
 #if defined(__thumb2__)
 .syntax	unified
 .thumb
@@ -720,10 +719,11 @@ poly1305_init_neon:
 
 .Lno_init_neon:
 	ret				@ bx	lr
 .size	poly1305_init_neon,.-poly1305_init_neon
 
+.globl	poly1305_blocks_neon
 .type	poly1305_blocks_neon,%function
 .align	5
 poly1305_blocks_neon:
 .Lpoly1305_blocks_neon:
 	ldr	ip,[$ctx,#36]		@ is_base2_26
diff --git a/lib/crypto/arm/poly1305-glue.c b/lib/crypto/arm/poly1305-glue.c
index 2603b0771f2c4..5b65b840c1666 100644
--- a/lib/crypto/arm/poly1305-glue.c
+++ b/lib/crypto/arm/poly1305-glue.c
@@ -25,15 +25,10 @@ asmlinkage void poly1305_blocks_neon(struct poly1305_block_state *state,
 asmlinkage void poly1305_emit_arch(const struct poly1305_state *state,
 				   u8 digest[POLY1305_DIGEST_SIZE],
 				   const u32 nonce[4]);
 EXPORT_SYMBOL_GPL(poly1305_emit_arch);
 
-void __weak poly1305_blocks_neon(struct poly1305_block_state *state,
-				 const u8 *src, u32 len, u32 hibit)
-{
-}
-
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 
 void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
 			  unsigned int len, u32 padbit)
 {

base-commit: 57b15e9260a31438e91cf83dbfcb63333b24c684
-- 
2.50.1


