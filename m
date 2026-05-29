Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D6ECD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 19:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uXXSjeJFPuB/KuxWxyJIQTywCncWt6wmewMVR0k3lww=; b=v+qG2ux+lOIR9Lmhg4HOEG3TA0
	MtTm2ruMDk+jOCWo6c92YzfoHYDQdyUTkQrFCDzjk3jI+EmT2xeg7+jMICLMGgVxoAcONdKbVvLKW
	9qpFhoKmnGSv90diRXk8LmrozgyPOnLp/UGh2oXZjdrnktE62BMG83+2Dar5zY4VrmxiDICGJvcRz
	k1pORwFOVjL4eqNFOmHMpEwF7icWkX+2R54LlWIp5CynJmRTbDbuRRQ0vV0s1SPo8KYBgMwlc+l1q
	KwCUS81E/WvN1mPrPlW2kryuwq/ouTYsLUlcBpTWhKcjN9dYHV1DfUZKAm21sO4AkA7ahtlvGJR0j
	vynGGbbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT314-00000008Bjo-24BW;
	Fri, 29 May 2026 19:37:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT30x-00000008Bij-1oeH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 19:37:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BBBD74033E;
	Fri, 29 May 2026 19:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275591F00893;
	Fri, 29 May 2026 19:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780083422;
	bh=uXXSjeJFPuB/KuxWxyJIQTywCncWt6wmewMVR0k3lww=;
	h=From:To:Cc:Subject:Date;
	b=CNX1Patm49sY+ooeTxvKjWszj/W1CVvN+O/h0HWvCoY11KGu0XP193ZcddNGOaeGx
	 DNSdnNcG5NdRghUyYwoBB8KCopTuRZuEejVNnlm0YiBe91DFOwZ+Z1QQ/vcsqXE5uj
	 NTSdiRFzxTGbtV7CcUXylvuex2iB/4/CzbdN7M/R2EWy8NwR6LRFbtGHwbk/w2UosM
	 1J8fbg5++Z5zN1ecs2ug/PiaiAPiWNzMXVQdex5OcRToyeXEBI2D+5YfZM/Me/2k2X
	 xrDlEKtHUKekah2TTEW1l+lAE7K9FNnntUOltLlE2Hl70s2aQ7kPR0tL0Q3cq5fzCu
	 eKGyVBHaNqWAg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] crypto: sun4i-ss - Remove insecure and unused rng_alg
Date: Fri, 29 May 2026 12:36:48 -0700
Message-ID: <20260529193648.18172-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_123703_514214_576EFC59 
X-CRM114-Status: GOOD (  24.74  )
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

Remove sun4i_ss_rng, as it is insecure and unused:

- It has multiple vulnerabilities.  sun4i_ss_prng_seed() is missing
  locking and has a buffer overflow.  sun4i_ss_prng_generate() fails to
  fill the entire buffer with cryptographic random bytes, because it
  rounds the destination length down and also doesn't actually wait for
  the hardware to be ready before pulling bytes from it.

- No user of this code is known.  It's usable only theoretically via the
  "rng" algorithm type of AF_ALG.  But userspace actually just uses the
  actual Linux RNG (/dev/random etc) instead.  And rng_algs don't
  contribute entropy to the actual Linux RNG either.  (This may have
  been confused with hwrng, which does contribute entropy.)

Fixes: b8ae5c7387ad ("crypto: sun4i-ss - support the Security System PRNG")
Cc: stable@vger.kernel.org
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/configs/sunxi_defconfig              |  1 -
 drivers/crypto/allwinner/Kconfig              |  8 ---
 drivers/crypto/allwinner/sun4i-ss/Makefile    |  1 -
 .../crypto/allwinner/sun4i-ss/sun4i-ss-core.c | 44 ------------
 .../crypto/allwinner/sun4i-ss/sun4i-ss-prng.c | 69 -------------------
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h  | 20 ------
 6 files changed, 143 deletions(-)
 delete mode 100644 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c

diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
index a83d29fed175..f4b8d8f7dbef 100644
--- a/arch/arm/configs/sunxi_defconfig
+++ b/arch/arm/configs/sunxi_defconfig
@@ -168,11 +168,10 @@ CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_DEV_SUN4I_SS=y
-CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=y
 CONFIG_CRYPTO_DEV_SUN8I_SS=y
 CONFIG_DMA_CMA=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_FS=y
diff --git a/drivers/crypto/allwinner/Kconfig b/drivers/crypto/allwinner/Kconfig
index b8e75210a0e3..06ea0e9fe6f2 100644
--- a/drivers/crypto/allwinner/Kconfig
+++ b/drivers/crypto/allwinner/Kconfig
@@ -22,18 +22,10 @@ config CRYPTO_DEV_SUN4I_SS
 	  and SHA1 and MD5 hash algorithms.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called sun4i-ss.
 
-config CRYPTO_DEV_SUN4I_SS_PRNG
-	bool "Support for Allwinner Security System PRNG"
-	depends on CRYPTO_DEV_SUN4I_SS
-	select CRYPTO_RNG
-	help
-	  Select this option if you want to provide kernel-side support for
-	  the Pseudo-Random Number Generator found in the Security System.
-
 config CRYPTO_DEV_SUN4I_SS_DEBUG
 	bool "Enable sun4i-ss stats"
 	depends on CRYPTO_DEV_SUN4I_SS
 	depends on DEBUG_FS
 	help
diff --git a/drivers/crypto/allwinner/sun4i-ss/Makefile b/drivers/crypto/allwinner/sun4i-ss/Makefile
index c0a2797d3168..06a9ae81f9f8 100644
--- a/drivers/crypto/allwinner/sun4i-ss/Makefile
+++ b/drivers/crypto/allwinner/sun4i-ss/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CRYPTO_DEV_SUN4I_SS) += sun4i-ss.o
 sun4i-ss-y += sun4i-ss-core.o sun4i-ss-hash.o sun4i-ss-cipher.o
-sun4i-ss-$(CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG) += sun4i-ss-prng.o
diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
index 813c4bc6312a..35ef0930e77f 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
@@ -211,27 +211,10 @@ static struct sun4i_ss_alg_template ss_algs[] = {
 			.cra_init = sun4i_ss_cipher_init,
 			.cra_exit = sun4i_ss_cipher_exit,
 		}
 	}
 },
-#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
-{
-	.type = CRYPTO_ALG_TYPE_RNG,
-	.alg.rng = {
-		.base = {
-			.cra_name		= "stdrng",
-			.cra_driver_name	= "sun4i_ss_rng",
-			.cra_priority		= 300,
-			.cra_ctxsize		= 0,
-			.cra_module		= THIS_MODULE,
-		},
-		.generate               = sun4i_ss_prng_generate,
-		.seed                   = sun4i_ss_prng_seed,
-		.seedsize               = SS_SEED_LEN / BITS_PER_BYTE,
-	}
-},
-#endif
 };
 
 static int sun4i_ss_debugfs_show(struct seq_file *seq, void *v)
 {
 	unsigned int i;
@@ -245,18 +228,10 @@ static int sun4i_ss_debugfs_show(struct seq_file *seq, void *v)
 				   ss_algs[i].alg.crypto.base.cra_driver_name,
 				   ss_algs[i].alg.crypto.base.cra_name,
 				   ss_algs[i].stat_req, ss_algs[i].stat_opti, ss_algs[i].stat_fb,
 				   ss_algs[i].stat_bytes);
 			break;
-#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
-		case CRYPTO_ALG_TYPE_RNG:
-			seq_printf(seq, "%s %s reqs=%lu tsize=%lu\n",
-				   ss_algs[i].alg.rng.base.cra_driver_name,
-				   ss_algs[i].alg.rng.base.cra_name,
-				   ss_algs[i].stat_req, ss_algs[i].stat_bytes);
-			break;
-#endif
 		case CRYPTO_ALG_TYPE_AHASH:
 			seq_printf(seq, "%s %s reqs=%lu\n",
 				   ss_algs[i].alg.hash.halg.base.cra_driver_name,
 				   ss_algs[i].alg.hash.halg.base.cra_name,
 				   ss_algs[i].stat_req);
@@ -471,19 +446,10 @@ static int sun4i_ss_probe(struct platform_device *pdev)
 				dev_err(ss->dev, "Fail to register %s\n",
 					ss_algs[i].alg.hash.halg.base.cra_name);
 				goto error_alg;
 			}
 			break;
-#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
-		case CRYPTO_ALG_TYPE_RNG:
-			err = crypto_register_rng(&ss_algs[i].alg.rng);
-			if (err) {
-				dev_err(ss->dev, "Fail to register %s\n",
-					ss_algs[i].alg.rng.base.cra_name);
-			}
-			break;
-#endif
 		}
 	}
 
 	/* Ignore error of debugfs */
 	ss->dbgfs_dir = debugfs_create_dir("sun4i-ss", NULL);
@@ -499,15 +465,10 @@ static int sun4i_ss_probe(struct platform_device *pdev)
 			crypto_unregister_skcipher(&ss_algs[i].alg.crypto);
 			break;
 		case CRYPTO_ALG_TYPE_AHASH:
 			crypto_unregister_ahash(&ss_algs[i].alg.hash);
 			break;
-#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
-		case CRYPTO_ALG_TYPE_RNG:
-			crypto_unregister_rng(&ss_algs[i].alg.rng);
-			break;
-#endif
 		}
 	}
 error_pm:
 	sun4i_ss_pm_exit(ss);
 	return err;
@@ -524,15 +485,10 @@ static void sun4i_ss_remove(struct platform_device *pdev)
 			crypto_unregister_skcipher(&ss_algs[i].alg.crypto);
 			break;
 		case CRYPTO_ALG_TYPE_AHASH:
 			crypto_unregister_ahash(&ss_algs[i].alg.hash);
 			break;
-#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
-		case CRYPTO_ALG_TYPE_RNG:
-			crypto_unregister_rng(&ss_algs[i].alg.rng);
-			break;
-#endif
 		}
 	}
 
 	sun4i_ss_pm_exit(ss);
 }
diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
deleted file mode 100644
index 491fcb7b81b4..000000000000
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
+++ /dev/null
@@ -1,69 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-#include "sun4i-ss.h"
-
-int sun4i_ss_prng_seed(struct crypto_rng *tfm, const u8 *seed,
-		       unsigned int slen)
-{
-	struct sun4i_ss_alg_template *algt;
-	struct rng_alg *alg = crypto_rng_alg(tfm);
-
-	algt = container_of(alg, struct sun4i_ss_alg_template, alg.rng);
-	memcpy(algt->ss->seed, seed, slen);
-
-	return 0;
-}
-
-int sun4i_ss_prng_generate(struct crypto_rng *tfm, const u8 *src,
-			   unsigned int slen, u8 *dst, unsigned int dlen)
-{
-	struct sun4i_ss_alg_template *algt;
-	struct rng_alg *alg = crypto_rng_alg(tfm);
-	int i, err;
-	u32 v;
-	u32 *data = (u32 *)dst;
-	const u32 mode = SS_OP_PRNG | SS_PRNG_CONTINUE | SS_ENABLED;
-	size_t len;
-	struct sun4i_ss_ctx *ss;
-	unsigned int todo = (dlen / 4) * 4;
-
-	algt = container_of(alg, struct sun4i_ss_alg_template, alg.rng);
-	ss = algt->ss;
-
-	err = pm_runtime_resume_and_get(ss->dev);
-	if (err < 0)
-		return err;
-
-	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN4I_SS_DEBUG)) {
-		algt->stat_req++;
-		algt->stat_bytes += todo;
-	}
-
-	spin_lock_bh(&ss->slock);
-
-	writel(mode, ss->base + SS_CTL);
-
-	while (todo > 0) {
-		/* write the seed */
-		for (i = 0; i < SS_SEED_LEN / BITS_PER_LONG; i++)
-			writel(ss->seed[i], ss->base + SS_KEY0 + i * 4);
-
-		/* Read the random data */
-		len = min_t(size_t, SS_DATA_LEN / BITS_PER_BYTE, todo);
-		readsl(ss->base + SS_TXFIFO, data, len / 4);
-		data += len / 4;
-		todo -= len;
-
-		/* Update the seed */
-		for (i = 0; i < SS_SEED_LEN / BITS_PER_LONG; i++) {
-			v = readl(ss->base + SS_KEY0 + i * 4);
-			ss->seed[i] = v;
-		}
-	}
-
-	writel(0, ss->base + SS_CTL);
-	spin_unlock_bh(&ss->slock);
-
-	pm_runtime_put(ss->dev);
-
-	return 0;
-}
diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h
index 6c5d4aa6453c..f7d1c79ac677 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h
@@ -29,12 +29,10 @@
 #include <crypto/hash.h>
 #include <crypto/internal/hash.h>
 #include <crypto/internal/skcipher.h>
 #include <crypto/aes.h>
 #include <crypto/internal/des.h>
-#include <crypto/internal/rng.h>
-#include <crypto/rng.h>
 
 #define SS_CTL            0x00
 #define SS_KEY0           0x04
 #define SS_KEY1           0x08
 #define SS_KEY2           0x0C
@@ -60,14 +58,10 @@
 #define SS_RXFIFO         0x200
 #define SS_TXFIFO         0x204
 
 /* SS_CTL configuration values */
 
-/* PRNG generator mode - bit 15 */
-#define SS_PRNG_ONESHOT		(0 << 15)
-#define SS_PRNG_CONTINUE	(1 << 15)
-
 /* IV mode for hash */
 #define SS_IV_ARBITRARY		(1 << 14)
 
 /* SS operation mode - bits 12-13 */
 #define SS_ECB			(0 << 12)
@@ -92,18 +86,14 @@
 #define SS_OP_AES		(0 << 4)
 #define SS_OP_DES		(1 << 4)
 #define SS_OP_3DES		(2 << 4)
 #define SS_OP_SHA1		(3 << 4)
 #define SS_OP_MD5		(4 << 4)
-#define SS_OP_PRNG		(5 << 4)
 
 /* Data end bit - bit 2 */
 #define SS_DATA_END		(1 << 2)
 
-/* PRNG start bit - bit 1 */
-#define SS_PRNG_START		(1 << 1)
-
 /* SS Enable bit - bit 0 */
 #define SS_DISABLED		(0 << 0)
 #define SS_ENABLED		(1 << 0)
 
 /* SS_FCSR configuration values */
@@ -126,13 +116,10 @@
 #define SS_RXFIFO_EMP_INT_PENDING	(1 << 10)
 #define SS_TXFIFO_AVA_INT_PENDING	(1 << 8)
 #define SS_RXFIFO_EMP_INT_ENABLE	(1 << 2)
 #define SS_TXFIFO_AVA_INT_ENABLE	(1 << 0)
 
-#define SS_SEED_LEN 192
-#define SS_DATA_LEN 160
-
 /*
  * struct ss_variant - Describe SS hardware variant
  * @sha1_in_be:		The SHA1 digest is given by SS in BE, and so need to be inverted.
  */
 struct ss_variant {
@@ -149,24 +136,20 @@ struct sun4i_ss_ctx {
 	struct device *dev;
 	struct resource *res;
 	char buf[4 * SS_RX_MAX];/* buffer for linearize SG src */
 	char bufo[4 * SS_TX_MAX]; /* buffer for linearize SG dst */
 	spinlock_t slock; /* control the use of the device */
-#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
-	u32 seed[SS_SEED_LEN / BITS_PER_LONG];
-#endif
 	struct dentry *dbgfs_dir;
 	struct dentry *dbgfs_stats;
 };
 
 struct sun4i_ss_alg_template {
 	u32 type;
 	u32 mode;
 	union {
 		struct skcipher_alg crypto;
 		struct ahash_alg hash;
-		struct rng_alg rng;
 	} alg;
 	struct sun4i_ss_ctx *ss;
 	unsigned long stat_req;
 	unsigned long stat_fb;
 	unsigned long stat_bytes;
@@ -229,8 +212,5 @@ int sun4i_ss_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 			unsigned int keylen);
 int sun4i_ss_des_setkey(struct crypto_skcipher *tfm, const u8 *key,
 			unsigned int keylen);
 int sun4i_ss_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
 			 unsigned int keylen);
-int sun4i_ss_prng_generate(struct crypto_rng *tfm, const u8 *src,
-			   unsigned int slen, u8 *dst, unsigned int dlen);
-int sun4i_ss_prng_seed(struct crypto_rng *tfm, const u8 *seed, unsigned int slen);

base-commit: 49e05bb00f2e8168695f7af4d694c39e1423e8a2
-- 
2.54.0


