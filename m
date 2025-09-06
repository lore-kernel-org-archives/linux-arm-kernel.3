Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0FFCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 21:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiQ8LVV4DBMGwKo4t4RUlKKfJYhf1rkwBObsbvwTHPQ=; b=s4HKuYROaM/5PvI8FkgtEmoJqm
	sY5XHwbkAzMPB/mwE162ZzK7KMBxSyiaz8P5lcYAAf+XfU4qo7gsGlYG0lzNtfwydnHahTI8iP/p4
	NscKoS2Abvyky6yd4rRWi8yBedy9piMTWc4ZSU2fDjCQTZ8gFmHsNK1R91yJsA/u+nBvOeSg44iIm
	3EG4eoV2viOeWSQASqWlIGNLXlhcEWt3jMjYqeD4P195ZXRdZBP8c+FSGc+AcX3X4jiRmQZrn/iC8
	Rm7og25voAMNMC3CTIDQEk2ibLiY4Tfr3stK3JLYpsrIf/KEgSDHgalyuMQv36LDakImi9bZb2wzb
	YzhDte7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0jF-00000008WcN-3j9j;
	Sat, 06 Sep 2025 21:45:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0ag-00000008V5A-2P6w
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 21:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 504D544A89;
	Sat,  6 Sep 2025 21:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FD5C4CEF5;
	Sat,  6 Sep 2025 21:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757194618;
	bh=65bERrm6Cr6LAIUiJbaJGscz/JpMgV2DYwvlkxe3SoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K2ZCkNnLRcwhugFHUVY+bVqzNXoytm1m2TnBvPwvhftsxchX8Kb5jAumolGSbDgBj
	 aIaOI3CSe002OhewhRzbrwqOsUuFxl4hbXqBeYcfzikBGpYNPVvqelRW83dlFbOnfE
	 RM1FOu9/mrtAtYbfy4ZoakTdS9NLmbYs9n14YTXNKXfX32G6YYH3LN73XbfAMeov4s
	 IdmjVEHYZTEmvu7t59wrErJaCUji9VfLQb4d7bVS/RuqChf4hfYMIpEotGPlvEH42F
	 66kNJ+IEGZAs8ysvMFUjZnUjchni99pVXJBW9cXB8OaFKglwKro9F3r4OGSmsMFBLE
	 1r4ipNxwVelQQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 02/12] crypto: arm/curve25519 - Remove unused kpp support
Date: Sat,  6 Sep 2025 14:35:13 -0700
Message-ID: <20250906213523.84915-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906213523.84915-1-ebiggers@kernel.org>
References: <20250906213523.84915-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_143658_699727_B3735FF2 
X-CRM114-Status: GOOD (  14.49  )
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

Curve25519 is used only via the library API, not the crypto_kpp API.  In
preparation for removing the unused crypto_kpp API for Curve25519,
remove the unused "curve25519-neon" kpp algorithm.

Note that the underlying NEON optimized Curve25519 code remains fully
supported and accessible via the library API.

It's also worth noting that even if the kpp support for Curve25519 comes
back later, there is no need for arch-specific kpp glue code like this,
as a single kpp algorithm that wraps the library API is sufficient.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/crypto/Kconfig           |  1 -
 arch/arm/crypto/curve25519-glue.c | 77 +------------------------------
 2 files changed, 1 insertion(+), 77 deletions(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 1e5f3cdf691c4..97718d86f6007 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -3,11 +3,10 @@
 menu "Accelerated Cryptographic Algorithms for CPU (arm)"
 
 config CRYPTO_CURVE25519_NEON
 	tristate
 	depends on KERNEL_MODE_NEON
-	select CRYPTO_KPP
 	select CRYPTO_LIB_CURVE25519_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	default CRYPTO_LIB_CURVE25519_INTERNAL
 	help
 	  Curve25519 algorithm
diff --git a/arch/arm/crypto/curve25519-glue.c b/arch/arm/crypto/curve25519-glue.c
index e7b87e09dd99f..3076020d8fbeb 100644
--- a/arch/arm/crypto/curve25519-glue.c
+++ b/arch/arm/crypto/curve25519-glue.c
@@ -8,17 +8,15 @@
  */
 
 #include <asm/hwcap.h>
 #include <asm/neon.h>
 #include <asm/simd.h>
-#include <crypto/internal/kpp.h>
 #include <crypto/internal/simd.h>
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/jump_label.h>
-#include <linux/scatterlist.h>
 #include <crypto/curve25519.h>
 
 asmlinkage void curve25519_neon(u8 mypublic[CURVE25519_KEY_SIZE],
 				const u8 secret[CURVE25519_KEY_SIZE],
 				const u8 basepoint[CURVE25519_KEY_SIZE]);
@@ -44,94 +42,21 @@ void curve25519_base_arch(u8 pub[CURVE25519_KEY_SIZE],
 {
 	return curve25519_arch(pub, secret, curve25519_base_point);
 }
 EXPORT_SYMBOL(curve25519_base_arch);
 
-static int curve25519_set_secret(struct crypto_kpp *tfm, const void *buf,
-				 unsigned int len)
-{
-	u8 *secret = kpp_tfm_ctx(tfm);
-
-	if (!len)
-		curve25519_generate_secret(secret);
-	else if (len == CURVE25519_KEY_SIZE &&
-		 crypto_memneq(buf, curve25519_null_point, CURVE25519_KEY_SIZE))
-		memcpy(secret, buf, CURVE25519_KEY_SIZE);
-	else
-		return -EINVAL;
-	return 0;
-}
-
-static int curve25519_compute_value(struct kpp_request *req)
-{
-	struct crypto_kpp *tfm = crypto_kpp_reqtfm(req);
-	const u8 *secret = kpp_tfm_ctx(tfm);
-	u8 public_key[CURVE25519_KEY_SIZE];
-	u8 buf[CURVE25519_KEY_SIZE];
-	int copied, nbytes;
-	u8 const *bp;
-
-	if (req->src) {
-		copied = sg_copy_to_buffer(req->src,
-					   sg_nents_for_len(req->src,
-							    CURVE25519_KEY_SIZE),
-					   public_key, CURVE25519_KEY_SIZE);
-		if (copied != CURVE25519_KEY_SIZE)
-			return -EINVAL;
-		bp = public_key;
-	} else {
-		bp = curve25519_base_point;
-	}
-
-	curve25519_arch(buf, secret, bp);
-
-	/* might want less than we've got */
-	nbytes = min_t(size_t, CURVE25519_KEY_SIZE, req->dst_len);
-	copied = sg_copy_from_buffer(req->dst, sg_nents_for_len(req->dst,
-								nbytes),
-				     buf, nbytes);
-	if (copied != nbytes)
-		return -EINVAL;
-	return 0;
-}
-
-static unsigned int curve25519_max_size(struct crypto_kpp *tfm)
-{
-	return CURVE25519_KEY_SIZE;
-}
-
-static struct kpp_alg curve25519_alg = {
-	.base.cra_name		= "curve25519",
-	.base.cra_driver_name	= "curve25519-neon",
-	.base.cra_priority	= 200,
-	.base.cra_module	= THIS_MODULE,
-	.base.cra_ctxsize	= CURVE25519_KEY_SIZE,
-
-	.set_secret		= curve25519_set_secret,
-	.generate_public_key	= curve25519_compute_value,
-	.compute_shared_secret	= curve25519_compute_value,
-	.max_size		= curve25519_max_size,
-};
-
 static int __init arm_curve25519_init(void)
 {
-	if (elf_hwcap & HWCAP_NEON) {
+	if (elf_hwcap & HWCAP_NEON)
 		static_branch_enable(&have_neon);
-		return IS_REACHABLE(CONFIG_CRYPTO_KPP) ?
-			crypto_register_kpp(&curve25519_alg) : 0;
-	}
 	return 0;
 }
 
 static void __exit arm_curve25519_exit(void)
 {
-	if (IS_REACHABLE(CONFIG_CRYPTO_KPP) && elf_hwcap & HWCAP_NEON)
-		crypto_unregister_kpp(&curve25519_alg);
 }
 
 module_init(arm_curve25519_init);
 module_exit(arm_curve25519_exit);
 
-MODULE_ALIAS_CRYPTO("curve25519");
-MODULE_ALIAS_CRYPTO("curve25519-neon");
 MODULE_DESCRIPTION("Public key crypto: Curve25519 (NEON-accelerated)");
 MODULE_LICENSE("GPL v2");
-- 
2.50.1


