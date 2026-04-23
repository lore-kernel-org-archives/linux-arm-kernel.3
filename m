Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0675BF94CDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 06:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7KgrCx56BrnEb4qRX9fp/f2StrqcrxHyLR/L+aFKnDo=; b=quD5KgPjEoPK9uLnjCxad8FikN
	h53rMSWR9Q81nS0KVPdPEbG+ZxFi7DYGd+nJ1pY8Q4HVojzzQj6JuQ8EhQRgbcTEjVE4akYVC0Exy
	QKyhwtXwzS2Bu8N4TjODIU4qmL5xozeQy+781UPI257G4ySk51L5mmcMe31YJwCj52+/e3gO0WBcN
	cnnNYkA/TgBOjgUdamGjO/oXWToGudnMAoBKpP3lMuFNAg9XOQKFk7PtvI6AMEgply5HIfQv5rLr6
	XMj+bI5XTqbDnT/9REGMSse/Z/AKRN9i0KhLsUmN9yRSdsXmeQhnmXA4qDY7lYXlU4nkegEA2/GDT
	XaW8+VmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFnyw-0000000B7md-2xud;
	Thu, 23 Apr 2026 06:56:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFnyt-0000000B7lR-29q2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 06:56:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2711344197;
	Thu, 23 Apr 2026 06:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53204C2BCAF;
	Thu, 23 Apr 2026 06:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776927368;
	bh=/pBBio81zTb9fALRWItdAY0bP7JbQpEIXSCYbb3ZVqU=;
	h=From:To:Cc:Subject:Date:From;
	b=ejO5QG5enuUxDHZnfsPweGx/aTV4u30GmG5V/qRxxkZXH669SzWQMnBKoNw2dtHNv
	 G0J1w+tAyTFc571WxaCeERKUwla/N4bWFZTu9NYXEVwtbfPCNZc4JLlSBdu2jdC20G
	 JfS/I4aZLaAaKwuWyiuCCPpk+xuxQ4EQpQnWGiEdVteicI2uxp3PJQV2dRoJbZDJvL
	 iGUWMvbd2XQHc8e6aS6aCvhpVCLKCeYfOzXtZLYcv6Pq6THYNHhGo8kW8MEZ1IaSoG
	 7jr5kK7R3JVoXSz5l/idBFa3KhFzMhbPDeZDxWTh3qY3iIHZo3kZM0rocr3Xxl8C3M
	 6Pb1OaQOZf3RA==
From: Arnd Bergmann <arnd@kernel.org>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Eric Biggers <ebiggers@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: sun8i-ss - avoid hash and rng references
Date: Thu, 23 Apr 2026 08:55:42 +0200
Message-Id: <20260423065600.2081989-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_235611_613976_3FCD9154 
X-CRM114-Status: GOOD (  18.17  )
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

From: Arnd Bergmann <arnd@arndb.de>

While the sun4i-ss and sun8i-ce drivers started selecting CRYPTO_RNG,
the sun8i-ss variant does not, and causes a link failure:

aarch64-linux-ld: drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.o: in function `sun8i_ss_unregister_algs':
sun8i-ss-core.c:(.text.sun8i_ss_unregister_algs+0x94): undefined reference to `crypto_unregister_rng'
aarch64-linux-ld: drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.o: in function `sun8i_ss_probe':
sun8i-ss-core.c:(.text.sun8i_ss_probe+0x40c): undefined reference to `crypto_register_rng'

Looking more closely, I see that all of the allwinner crypto drivers have the
same logic where the rng and hash parts of the driver are optional, but then the
generic code is still selected, which is a bit inconsistent, aside from the
missing CRYPTO_RNG select on sun8i-ss.

Change the approach so only the bits that are actually used are built, using
ifdef checks around the optional portions that match the optional references
to the sub-drivers.

Ideally the drivers would get reworked in a way that keeps all the bits
related to the skcipher/ahash/rng codecs in the respective sub-drivers,
rather than having a common driver that knows about all of these.

Fixes: cdadc1435937 ("crypto: cryptomgr - Select algorithm types only when CRYPTO_SELFTESTS")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
The simpler approach would be to add even more 'select' statements
---
 drivers/crypto/allwinner/Kconfig                  |  2 --
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c |  8 ++++++++
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 12 ++++++++++++
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 12 ++++++++++++
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/Kconfig b/drivers/crypto/allwinner/Kconfig
index 7270e5fbc573..b8e75210a0e3 100644
--- a/drivers/crypto/allwinner/Kconfig
+++ b/drivers/crypto/allwinner/Kconfig
@@ -14,7 +14,6 @@ config CRYPTO_DEV_SUN4I_SS
 	select CRYPTO_SHA1
 	select CRYPTO_AES
 	select CRYPTO_LIB_DES
-	select CRYPTO_RNG
 	select CRYPTO_SKCIPHER
 	help
 	  Some Allwinner SoC have a crypto accelerator named
@@ -50,7 +49,6 @@ config CRYPTO_DEV_SUN8I_CE
 	select CRYPTO_CBC
 	select CRYPTO_AES
 	select CRYPTO_DES
-	select CRYPTO_RNG
 	depends on CRYPTO_DEV_ALLWINNER
 	depends on PM
 	help
diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
index 58a76e2ba64e..813c4bc6312a 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
@@ -247,12 +247,14 @@ static int sun4i_ss_debugfs_show(struct seq_file *seq, void *v)
 				   ss_algs[i].stat_req, ss_algs[i].stat_opti, ss_algs[i].stat_fb,
 				   ss_algs[i].stat_bytes);
 			break;
+#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
 		case CRYPTO_ALG_TYPE_RNG:
 			seq_printf(seq, "%s %s reqs=%lu tsize=%lu\n",
 				   ss_algs[i].alg.rng.base.cra_driver_name,
 				   ss_algs[i].alg.rng.base.cra_name,
 				   ss_algs[i].stat_req, ss_algs[i].stat_bytes);
 			break;
+#endif
 		case CRYPTO_ALG_TYPE_AHASH:
 			seq_printf(seq, "%s %s reqs=%lu\n",
 				   ss_algs[i].alg.hash.halg.base.cra_driver_name,
@@ -471,6 +473,7 @@ static int sun4i_ss_probe(struct platform_device *pdev)
 				goto error_alg;
 			}
 			break;
+#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
 		case CRYPTO_ALG_TYPE_RNG:
 			err = crypto_register_rng(&ss_algs[i].alg.rng);
 			if (err) {
@@ -478,6 +481,7 @@ static int sun4i_ss_probe(struct platform_device *pdev)
 					ss_algs[i].alg.rng.base.cra_name);
 			}
 			break;
+#endif
 		}
 	}
 
@@ -497,9 +501,11 @@ static int sun4i_ss_probe(struct platform_device *pdev)
 		case CRYPTO_ALG_TYPE_AHASH:
 			crypto_unregister_ahash(&ss_algs[i].alg.hash);
 			break;
+#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
 		case CRYPTO_ALG_TYPE_RNG:
 			crypto_unregister_rng(&ss_algs[i].alg.rng);
 			break;
+#endif
 		}
 	}
 error_pm:
@@ -520,9 +526,11 @@ static void sun4i_ss_remove(struct platform_device *pdev)
 		case CRYPTO_ALG_TYPE_AHASH:
 			crypto_unregister_ahash(&ss_algs[i].alg.hash);
 			break;
+#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
 		case CRYPTO_ALG_TYPE_RNG:
 			crypto_unregister_rng(&ss_algs[i].alg.rng);
 			break;
+#endif
 		}
 	}
 
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index c16bb6ce6ee3..f3b58ed6aed0 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -676,6 +676,7 @@ static int sun8i_ce_debugfs_show(struct seq_file *seq, void *v)
 			seq_printf(seq, "\tFallback due to SG numbers: %lu\n",
 				   ce_algs[i].stat_fb_maxsg);
 			break;
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_HASH
 		case CRYPTO_ALG_TYPE_AHASH:
 			seq_printf(seq, "%s %s reqs=%lu fallback=%lu\n",
 				   ce_algs[i].alg.hash.base.halg.base.cra_driver_name,
@@ -692,12 +693,15 @@ static int sun8i_ce_debugfs_show(struct seq_file *seq, void *v)
 			seq_printf(seq, "\tFallback due to SG numbers: %lu\n",
 				   ce_algs[i].stat_fb_maxsg);
 			break;
+#endif
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_PRNG
 		case CRYPTO_ALG_TYPE_RNG:
 			seq_printf(seq, "%s %s reqs=%lu bytes=%lu\n",
 				   ce_algs[i].alg.rng.base.cra_driver_name,
 				   ce_algs[i].alg.rng.base.cra_name,
 				   ce_algs[i].stat_req, ce_algs[i].stat_bytes);
 			break;
+#endif
 		}
 	}
 #if defined(CONFIG_CRYPTO_DEV_SUN8I_CE_TRNG) && \
@@ -905,6 +909,7 @@ static int sun8i_ce_register_algs(struct sun8i_ce_dev *ce)
 				return err;
 			}
 			break;
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_HASH
 		case CRYPTO_ALG_TYPE_AHASH:
 			id = ce_algs[i].ce_algo_id;
 			ce_method = ce->variant->alg_hash[id];
@@ -925,6 +930,8 @@ static int sun8i_ce_register_algs(struct sun8i_ce_dev *ce)
 				return err;
 			}
 			break;
+#endif
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_PRNG
 		case CRYPTO_ALG_TYPE_RNG:
 			if (ce->variant->prng == CE_ID_NOTSUPP) {
 				dev_info(ce->dev,
@@ -942,6 +949,7 @@ static int sun8i_ce_register_algs(struct sun8i_ce_dev *ce)
 				ce_algs[i].ce = NULL;
 			}
 			break;
+#endif
 		default:
 			ce_algs[i].ce = NULL;
 			dev_err(ce->dev, "ERROR: tried to register an unknown algo\n");
@@ -963,16 +971,20 @@ static void sun8i_ce_unregister_algs(struct sun8i_ce_dev *ce)
 				 ce_algs[i].alg.skcipher.base.base.cra_name);
 			crypto_engine_unregister_skcipher(&ce_algs[i].alg.skcipher);
 			break;
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_HASH
 		case CRYPTO_ALG_TYPE_AHASH:
 			dev_info(ce->dev, "Unregister %d %s\n", i,
 				 ce_algs[i].alg.hash.base.halg.base.cra_name);
 			crypto_engine_unregister_ahash(&ce_algs[i].alg.hash);
 			break;
+#endif
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_PRNG
 		case CRYPTO_ALG_TYPE_RNG:
 			dev_info(ce->dev, "Unregister %d %s\n", i,
 				 ce_algs[i].alg.rng.base.cra_name);
 			crypto_unregister_rng(&ce_algs[i].alg.rng);
 			break;
+#endif
 		}
 	}
 }
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
index f45685707e0d..59c9bc45ec0f 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
@@ -501,12 +501,15 @@ static int sun8i_ss_debugfs_show(struct seq_file *seq, void *v)
 			seq_printf(seq, "\tFallback due to SG numbers: %lu\n",
 				   ss_algs[i].stat_fb_sgnum);
 			break;
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_PRNG
 		case CRYPTO_ALG_TYPE_RNG:
 			seq_printf(seq, "%s %s reqs=%lu tsize=%lu\n",
 				   ss_algs[i].alg.rng.base.cra_driver_name,
 				   ss_algs[i].alg.rng.base.cra_name,
 				   ss_algs[i].stat_req, ss_algs[i].stat_bytes);
 			break;
+#endif
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_HASH
 		case CRYPTO_ALG_TYPE_AHASH:
 			seq_printf(seq, "%s %s reqs=%lu fallback=%lu\n",
 				   ss_algs[i].alg.hash.base.halg.base.cra_driver_name,
@@ -523,6 +526,7 @@ static int sun8i_ss_debugfs_show(struct seq_file *seq, void *v)
 			seq_printf(seq, "\tFallback due to SG numbers: %lu\n",
 				   ss_algs[i].stat_fb_sgnum);
 			break;
+#endif
 		}
 	}
 	return 0;
@@ -707,6 +711,7 @@ static int sun8i_ss_register_algs(struct sun8i_ss_dev *ss)
 				return err;
 			}
 			break;
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_PRNG
 		case CRYPTO_ALG_TYPE_RNG:
 			err = crypto_register_rng(&ss_algs[i].alg.rng);
 			if (err) {
@@ -715,6 +720,8 @@ static int sun8i_ss_register_algs(struct sun8i_ss_dev *ss)
 				ss_algs[i].ss = NULL;
 			}
 			break;
+#endif
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_HASH
 		case CRYPTO_ALG_TYPE_AHASH:
 			id = ss_algs[i].ss_algo_id;
 			ss_method = ss->variant->alg_hash[id];
@@ -735,6 +742,7 @@ static int sun8i_ss_register_algs(struct sun8i_ss_dev *ss)
 				return err;
 			}
 			break;
+#endif
 		default:
 			ss_algs[i].ss = NULL;
 			dev_err(ss->dev, "ERROR: tried to register an unknown algo\n");
@@ -756,16 +764,20 @@ static void sun8i_ss_unregister_algs(struct sun8i_ss_dev *ss)
 				 ss_algs[i].alg.skcipher.base.base.cra_name);
 			crypto_engine_unregister_skcipher(&ss_algs[i].alg.skcipher);
 			break;
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_PRNG
 		case CRYPTO_ALG_TYPE_RNG:
 			dev_info(ss->dev, "Unregister %d %s\n", i,
 				 ss_algs[i].alg.rng.base.cra_name);
 			crypto_unregister_rng(&ss_algs[i].alg.rng);
 			break;
+#endif
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_HASH
 		case CRYPTO_ALG_TYPE_AHASH:
 			dev_info(ss->dev, "Unregister %d %s\n", i,
 				 ss_algs[i].alg.hash.base.halg.base.cra_name);
 			crypto_engine_unregister_ahash(&ss_algs[i].alg.hash);
 			break;
+#endif
 		}
 	}
 }
-- 
2.39.5


