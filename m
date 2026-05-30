Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5976CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 20:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6A9bVEZrw+Q4RLTCvGOyZc7SVKnqJM/5EtOOowi4ew=; b=pXQjpzV8lQNp6S3vkgVghL7cU1
	49Nf5X4YTOgwYMo9aYcRAiBOLfTFe+x3y5XmWqCqQ0HLRDg8wZ6hgwMvYsl0yslnzm3CX5oNqLj8r
	jAdHFItD/fckr8wBdYuN2uTSsZMdCBjRHlQVXuBHYUdjBVubLqcN5WZFfhsGwVGbwNdHifw2k4soc
	PXOWYxFw8RZcuwVoQvsqP/9TTAmCo0p9mMKzSBQrWpXyZXIPRIsZg77zj/Dd/wS6UoVbKL8oQzczQ
	F2ROAefo1XcQQuzQuhHg8zYuMTxpdZThjQTTR89U4s/+eUSUdbX2bt58bHlj21nbkNajHwZK0ae6x
	qwADH1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTQHO-000000092wx-0sY5;
	Sat, 30 May 2026 20:27:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTQHL-000000092vu-3qdz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 20:27:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E984A44039;
	Sat, 30 May 2026 20:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242E21F00898;
	Sat, 30 May 2026 20:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780172850;
	bh=j6A9bVEZrw+Q4RLTCvGOyZc7SVKnqJM/5EtOOowi4ew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JFdq+pMAuv4lovOukZ/xGmxL3qItmIDiKUgwFtNaWK12+oBul5Xf4RyLYMJKRcqC8
	 itHhkE1ckx3kGhyzzXbJiOL79eYeXzi7Ban58IJgPmxsGwjmizth4i1i0BuDN9sBqc
	 Axmp9oVwPioWRPL1nucCQUEXHmxMJFYOacOV200rM4Z4GhCrHVAaBwsCmUGPtsCMux
	 HQKrUIU22J7ec8M33+EzV6bnPC0KKptY96OgV7o4yOAJQ9Yj1yrWtwGOpxEBCAMrDj
	 qw6/vHawdUJDfV3wYnOEWUu1Q3jArd9hvljFVCQuw7d+73U5iWxkKKP4HF8bA05zWA
	 xn5RD9wYRgKsw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: Olivia Mackall <olivia@selenic.com>,
	Weili Qian <qianweili@huawei.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Longfang Liu <liulongfang@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] crypto: hisi-trng - Remove crypto_rng interface
Date: Sat, 30 May 2026 13:26:23 -0700
Message-ID: <20260530202624.20768-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530202624.20768-1-ebiggers@kernel.org>
References: <20260530202624.20768-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_132731_996961_271A26D9 
X-CRM114-Status: GOOD (  26.87  )
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

drivers/crypto/hisilicon/trng/trng.c exposes the same hardware through
two completely separate interfaces, crypto_rng and hwrng.  However, the
implementation of this is buggy because it permits generation operations
from these interfaces to run concurrently with each other, accessing the
same registers.  That is, hisi_trng_generate() synchronizes with itself
but not with hisi_trng_read().  This results in potential repetition of
output from the RNG, output of non-random values, etc.

Fortunately, there's actually no point in hardware RNG drivers
implementing the crypto_rng interface.  It's not actually used by
anything besides the "rng" algorithm type of AF_ALG, which in turn is
not actually used in practice.  Other crypto_rng hardware drivers are
likewise being phased out, leaving just the hwrng support.

Thus, remove it to simplify the code and avoid conflict (and confusion)
with the hwrng interface which is the one that actually matters.

Fixes: e4d9d10ef4be ("crypto: hisilicon/trng - add support for PRNG")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/hisilicon/Kconfig     |   1 -
 drivers/crypto/hisilicon/trng/trng.c | 296 +--------------------------
 2 files changed, 2 insertions(+), 295 deletions(-)

diff --git a/drivers/crypto/hisilicon/Kconfig b/drivers/crypto/hisilicon/Kconfig
index 1e6d772f4bb6..8aa23c939775 100644
--- a/drivers/crypto/hisilicon/Kconfig
+++ b/drivers/crypto/hisilicon/Kconfig
@@ -78,8 +78,7 @@ config CRYPTO_DEV_HISI_HPRE
 
 config CRYPTO_DEV_HISI_TRNG
 	tristate "Support for HISI TRNG Driver"
 	depends on ARM64 && ACPI
 	select HW_RANDOM
-	select CRYPTO_RNG
 	help
 	  Support for HiSilicon TRNG Driver.
diff --git a/drivers/crypto/hisilicon/trng/trng.c b/drivers/crypto/hisilicon/trng/trng.c
index 5ca0b90859a8..6584ed051e09 100644
--- a/drivers/crypto/hisilicon/trng/trng.c
+++ b/drivers/crypto/hisilicon/trng/trng.c
@@ -1,236 +1,29 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (c) 2019 HiSilicon Limited. */
 
-#include <crypto/internal/rng.h>
 #include <linux/acpi.h>
-#include <linux/crypto.h>
 #include <linux/err.h>
 #include <linux/hw_random.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
-#include <linux/list.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/random.h>
 
 #define HISI_TRNG_REG		0x00F0
 #define HISI_TRNG_BYTES		4
 #define HISI_TRNG_QUALITY	512
-#define HISI_TRNG_VERSION	0x01B8
-#define HISI_TRNG_VER_V1	GENMASK(31, 0)
 #define SLEEP_US		10
 #define TIMEOUT_US		10000
-#define SW_DRBG_NUM_SHIFT	2
-#define SW_DRBG_KEY_BASE	0x082C
-#define SW_DRBG_SEED(n)         (SW_DRBG_KEY_BASE - ((n) << SW_DRBG_NUM_SHIFT))
-#define SW_DRBG_SEED_REGS_NUM	12
-#define SW_DRBG_SEED_SIZE	48
-#define SW_DRBG_BLOCKS		0x0830
-#define SW_DRBG_INIT		0x0834
-#define SW_DRBG_GEN		0x083c
-#define SW_DRBG_STATUS		0x0840
-#define SW_DRBG_BLOCKS_NUM	4095
-#define SW_DRBG_DATA_BASE	0x0850
-#define SW_DRBG_DATA_NUM	4
-#define SW_DRBG_DATA(n)		(SW_DRBG_DATA_BASE - ((n) << SW_DRBG_NUM_SHIFT))
-#define SW_DRBG_BYTES		16
-#define SW_DRBG_ENABLE_SHIFT	12
-#define SEED_SHIFT_24		24
-#define SEED_SHIFT_16		16
-#define SEED_SHIFT_8		8
-#define SW_MAX_RANDOM_BYTES	65520
-
-struct hisi_trng_list {
-	struct mutex lock;
-	struct list_head list;
-	bool is_init;
-};
 
 struct hisi_trng {
 	void __iomem *base;
-	struct hisi_trng_list *trng_list;
-	struct list_head list;
 	struct hwrng rng;
-	u32 ver;
-	u32 ctx_num;
-	/* The bytes of the random number generated since the last seeding. */
-	u32 random_bytes;
-	struct mutex lock;
-};
-
-struct hisi_trng_ctx {
-	struct hisi_trng *trng;
 };
 
-static atomic_t trng_active_devs;
-static struct hisi_trng_list trng_devices;
-static int hisi_trng_read(struct hwrng *rng, void *buf, size_t max, bool wait);
-
-static int hisi_trng_set_seed(struct hisi_trng *trng, const u8 *seed)
-{
-	u32 val, seed_reg, i;
-	int ret;
-
-	writel(0x0, trng->base + SW_DRBG_BLOCKS);
-
-	for (i = 0; i < SW_DRBG_SEED_SIZE;
-	     i += SW_DRBG_SEED_SIZE / SW_DRBG_SEED_REGS_NUM) {
-		val = seed[i] << SEED_SHIFT_24;
-		val |= seed[i + 1UL] << SEED_SHIFT_16;
-		val |= seed[i + 2UL] << SEED_SHIFT_8;
-		val |= seed[i + 3UL];
-
-		seed_reg = (i >> SW_DRBG_NUM_SHIFT) % SW_DRBG_SEED_REGS_NUM;
-		writel(val, trng->base + SW_DRBG_SEED(seed_reg));
-	}
-
-	writel(SW_DRBG_BLOCKS_NUM | (0x1 << SW_DRBG_ENABLE_SHIFT),
-	       trng->base + SW_DRBG_BLOCKS);
-	writel(0x1, trng->base + SW_DRBG_INIT);
-	ret = readl_relaxed_poll_timeout(trng->base + SW_DRBG_STATUS,
-					 val, val & BIT(0), SLEEP_US, TIMEOUT_US);
-	if (ret) {
-		pr_err("failed to init trng(%d)\n", ret);
-		return -EIO;
-	}
-
-	trng->random_bytes = 0;
-
-	return 0;
-}
-
-static int hisi_trng_seed(struct crypto_rng *tfm, const u8 *seed,
-			  unsigned int slen)
-{
-	struct hisi_trng_ctx *ctx = crypto_rng_ctx(tfm);
-	struct hisi_trng *trng = ctx->trng;
-	int ret;
-
-	if (slen < SW_DRBG_SEED_SIZE) {
-		pr_err("slen(%u) is not matched with trng(%d)\n", slen,
-			SW_DRBG_SEED_SIZE);
-		return -EINVAL;
-	}
-
-	mutex_lock(&trng->lock);
-	ret = hisi_trng_set_seed(trng, seed);
-	mutex_unlock(&trng->lock);
-
-	return ret;
-}
-
-static int hisi_trng_reseed(struct hisi_trng *trng)
-{
-	u8 seed[SW_DRBG_SEED_SIZE];
-	int size;
-
-	if (!trng->random_bytes)
-		return 0;
-
-	size = hisi_trng_read(&trng->rng, seed, SW_DRBG_SEED_SIZE, false);
-	if (size != SW_DRBG_SEED_SIZE)
-		return -EIO;
-
-	return hisi_trng_set_seed(trng, seed);
-}
-
-static int hisi_trng_get_bytes(struct hisi_trng *trng, u8 *dstn, unsigned int dlen)
-{
-	u32 data[SW_DRBG_DATA_NUM];
-	u32 currsize = 0;
-	u32 val = 0;
-	int ret;
-	u32 i;
-
-	ret = hisi_trng_reseed(trng);
-	if (ret)
-		return ret;
-
-	do {
-		ret = readl_relaxed_poll_timeout(trng->base + SW_DRBG_STATUS,
-						 val, val & BIT(1), SLEEP_US, TIMEOUT_US);
-		if (ret) {
-			pr_err("failed to generate random number(%d)!\n", ret);
-			break;
-		}
-
-		for (i = 0; i < SW_DRBG_DATA_NUM; i++)
-			data[i] = readl(trng->base + SW_DRBG_DATA(i));
-
-		if (dlen - currsize >= SW_DRBG_BYTES) {
-			memcpy(dstn + currsize, data, SW_DRBG_BYTES);
-			currsize += SW_DRBG_BYTES;
-		} else {
-			memcpy(dstn + currsize, data, dlen - currsize);
-			currsize = dlen;
-		}
-
-		trng->random_bytes += SW_DRBG_BYTES;
-		writel(0x1, trng->base + SW_DRBG_GEN);
-	} while (currsize < dlen);
-
-	return ret;
-}
-
-static int hisi_trng_generate(struct crypto_rng *tfm, const u8 *src,
-			      unsigned int slen, u8 *dstn, unsigned int dlen)
-{
-	struct hisi_trng_ctx *ctx = crypto_rng_ctx(tfm);
-	struct hisi_trng *trng = ctx->trng;
-	unsigned int currsize = 0;
-	unsigned int block_size;
-	int ret;
-
-	if (!dstn || !dlen) {
-		pr_err("output is error, dlen %u!\n", dlen);
-		return -EINVAL;
-	}
-
-	do {
-		block_size = min_t(unsigned int, dlen - currsize, SW_MAX_RANDOM_BYTES);
-		mutex_lock(&trng->lock);
-		ret = hisi_trng_get_bytes(trng, dstn + currsize, block_size);
-		mutex_unlock(&trng->lock);
-		if (ret)
-			return ret;
-		currsize += block_size;
-	} while (currsize < dlen);
-
-	return 0;
-}
-
-static int hisi_trng_init(struct crypto_tfm *tfm)
-{
-	struct hisi_trng_ctx *ctx = crypto_tfm_ctx(tfm);
-	struct hisi_trng *trng;
-	u32 ctx_num = ~0;
-
-	mutex_lock(&trng_devices.lock);
-	list_for_each_entry(trng, &trng_devices.list, list) {
-		if (trng->ctx_num < ctx_num) {
-			ctx_num = trng->ctx_num;
-			ctx->trng = trng;
-		}
-	}
-	ctx->trng->ctx_num++;
-	mutex_unlock(&trng_devices.lock);
-
-	return 0;
-}
-
-static void hisi_trng_exit(struct crypto_tfm *tfm)
-{
-	struct hisi_trng_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	mutex_lock(&trng_devices.lock);
-	ctx->trng->ctx_num--;
-	mutex_unlock(&trng_devices.lock);
-}
-
 static int hisi_trng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 {
 	struct hisi_trng *trng;
 	int currsize = 0;
 	u32 val = 0;
@@ -258,126 +51,41 @@ static int hisi_trng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	} while (currsize < max);
 
 	return currsize;
 }
 
-static struct rng_alg hisi_trng_alg = {
-	.generate = hisi_trng_generate,
-	.seed =	hisi_trng_seed,
-	.seedsize = SW_DRBG_SEED_SIZE,
-	.base = {
-		.cra_name = "stdrng",
-		.cra_driver_name = "hisi_stdrng",
-		.cra_priority = 300,
-		.cra_ctxsize = sizeof(struct hisi_trng_ctx),
-		.cra_module = THIS_MODULE,
-		.cra_init = hisi_trng_init,
-		.cra_exit = hisi_trng_exit,
-	},
-};
-
-static void hisi_trng_add_to_list(struct hisi_trng *trng)
-{
-	mutex_lock(&trng_devices.lock);
-	list_add_tail(&trng->list, &trng_devices.list);
-	mutex_unlock(&trng_devices.lock);
-}
-
-static int hisi_trng_del_from_list(struct hisi_trng *trng)
-{
-	int ret = -EBUSY;
-
-	mutex_lock(&trng_devices.lock);
-	if (!trng->ctx_num) {
-		list_del(&trng->list);
-		ret = 0;
-	}
-	mutex_unlock(&trng_devices.lock);
-
-	return ret;
-}
-
 static int hisi_trng_probe(struct platform_device *pdev)
 {
 	struct hisi_trng *trng;
 	int ret;
 
 	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
 	if (!trng)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, trng);
-
 	trng->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(trng->base))
 		return PTR_ERR(trng->base);
 
-	trng->ctx_num = 0;
-	trng->random_bytes = SW_MAX_RANDOM_BYTES;
-	mutex_init(&trng->lock);
-	trng->ver = readl(trng->base + HISI_TRNG_VERSION);
-	if (!trng_devices.is_init) {
-		INIT_LIST_HEAD(&trng_devices.list);
-		mutex_init(&trng_devices.lock);
-		trng_devices.is_init = true;
-	}
-
-	hisi_trng_add_to_list(trng);
-	if (trng->ver != HISI_TRNG_VER_V1 &&
-	    atomic_inc_return(&trng_active_devs) == 1) {
-		ret = crypto_register_rng(&hisi_trng_alg);
-		if (ret) {
-			dev_err(&pdev->dev,
-				"failed to register crypto(%d)\n", ret);
-			atomic_dec_return(&trng_active_devs);
-			goto err_remove_from_list;
-		}
-	}
-
 	trng->rng.name = pdev->name;
 	trng->rng.read = hisi_trng_read;
 	trng->rng.quality = HISI_TRNG_QUALITY;
+
 	ret = devm_hwrng_register(&pdev->dev, &trng->rng);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "failed to register hwrng: %d!\n", ret);
-		goto err_crypto_unregister;
-	}
-
-	return ret;
-
-err_crypto_unregister:
-	if (trng->ver != HISI_TRNG_VER_V1 &&
-	    atomic_dec_return(&trng_active_devs) == 0)
-		crypto_unregister_rng(&hisi_trng_alg);
-
-err_remove_from_list:
-	hisi_trng_del_from_list(trng);
 	return ret;
 }
 
-static void hisi_trng_remove(struct platform_device *pdev)
-{
-	struct hisi_trng *trng = platform_get_drvdata(pdev);
-
-	/* Wait until the task is finished */
-	while (hisi_trng_del_from_list(trng))
-		;
-
-	if (trng->ver != HISI_TRNG_VER_V1 &&
-	    atomic_dec_return(&trng_active_devs) == 0)
-		crypto_unregister_rng(&hisi_trng_alg);
-}
-
 static const struct acpi_device_id hisi_trng_acpi_match[] = {
 	{ "HISI02B3", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hisi_trng_acpi_match);
 
 static struct platform_driver hisi_trng_driver = {
 	.probe		= hisi_trng_probe,
-	.remove         = hisi_trng_remove,
 	.driver		= {
 		.name	= "hisi-trng-v2",
 		.acpi_match_table = ACPI_PTR(hisi_trng_acpi_match),
 	},
 };
-- 
2.54.0


