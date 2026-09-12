Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27144C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 06:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ve9TjNtAR1yRkdeuTb/54fs6qejMaivLp/JWxfSV1gU=; b=1ZY9qJGQ1CL7Ky252+WYof4boe
	c7L1kktrKQifyEj3al4K/k+sw8X7LQjnJRGUwafEdsz0dqXcASoLb9XRssRH/PNkoGj98ONwjeNGx
	AgkjJ8BoTVni1VilTxg1o0IPpKZmf04rp1vn7kI9X7hHgw2q+dszGfwAMD8BmKNMSXqLv6p1Vy6C3
	4TYQxFMe2HrRE6PLlEC3zeF05kg1LQL+dW5kdOwZiNs1QYf/IkUP9IBJBkCI/RK+dV0k1aCWbyT/K
	E2xAPkha+XnDqRah3VbOCJbArMt9AHjiBhtTGsxXSzbxVfMSuHj4SJIcBNCSStx8d7ZNDJ8jWF2Fy
	DdQd3SmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Hhh-00000000dCH-0MSR;
	Sat, 12 Sep 2026 06:59:13 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Hha-00000000dBn-1chA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 06:59:09 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485b1d2874fso131110f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196344; x=1789801144; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ve9TjNtAR1yRkdeuTb/54fs6qejMaivLp/JWxfSV1gU=;
        b=NIFkYHTkQldITTVcPKrqDxLlji7Rl6S+cVZyM4+LqMaij3dMkoB54bIm3uIa5naTS2
         i19s7gjuj18y9DS2NECO3iiVnZeI03iW0kMAwcqWm8thwu5/oJxb+mzjTVSNUes5R3j4
         AcpbYumHUSXmS5v/3fVJEqUVZe1MtdgqCftHJO7csdbu26+qc1Uo3ZL6m7HVLXP0d75r
         ijjRENMc2zwTE+XXB7hDT6ZQPgDHh9i63Pw59tNxqpl6P4DsvX2acEdC3861kBfYXzxA
         40XOYGeKQjlgW/1C1iYChVn7pEOF7EVcWuWCb4cZ83K8tEdW9DjC5L761+UHDWys9diA
         iwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196344; x=1789801144;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ve9TjNtAR1yRkdeuTb/54fs6qejMaivLp/JWxfSV1gU=;
        b=b1tocjviHBQPDCyzOnjn8ufPhLv2ul2zAvy87Su4CvXNuUViw5LFR++G66Lt2AHPV+
         4zTMMFpCXQyGBZbfLBVaPCx1A1xmEZnsUZTzSTjeQAL2TzaNK3ZqD+txMnmd4XyK0ykZ
         +3nhldEsZN+spERpm1r6Y8LG93C8WjBVoSuHdjEzBU14WWRy/cNzFu3yQ7XOGmGJVM/i
         LoecI8b/0BfNqQD7E04UV88L3r2XKjaEVk9db5BMXNnRIbNjaj8Hw6/I4JYJYX7+3Hf6
         AucVyPA3Efah4lF/f3CQkEo+HGVp/qAhfAHy92rV6uQAlYKx9Cdqcu54+gZp3xN/P6ZY
         TZpA==
X-Forwarded-Encrypted: i=1; AKwUvBylEdWOAUPrHCJM1wIkeqZhKLLPqBRzDm30KYCX4EQ0nljDqmcGxDPXg5vPXUES6q2FAOHBLlxPnP441Lqcgpzd@lists.infradead.org
X-Gm-Message-State: AFuF++m8VlkzzVp3glLWnxa8FzPR5oW7E7OKqjiGlrTY42zXPthj+cpH
	3azuQk0ZfWO/WqWKlQbaWcNEVetN1YLFDc32AKxqtIlevLqrp5t581k6
X-Gm-Gg: AYBFou3kTxJHIDSf2vOSfRxg6Uh10U8c0pwSml5odrDeel23LjRM+cEoMDJbV/9exJk
	0MIzObeQMDEXmhHoo8kqOW4Q4HVu/b3/D7JMseC5rU2mPR01gaNkF45SAmR4+R09pTOYoZ7xWHp
	B/fur5J2+tSH1PIYI9ji5io+gYAOsoMZeFJtnXbMi8kG70rDTFUiZ3SQPNbuxJ54EAMPUbkAgQr
	zUfoM5LsUbrDl1LZPN8s/HdAebcJ9Q+D+4paEenXaQLadMjCU5BySY1+2LIh6nEnUeYYrVW59H7
	ZEAaFuKHHLIpLDpXixtBdP/qFYtLxVYReIgTwfAKvAKOpRviXj5kvi8GeXix6303noJopG/FR3c
	ujXc4I94zyPYM5LTWwLFIw0MbYXMku5VrCIO2uyoCyWq3F/AhQMTpnSoouAEDzXSLgQeXbDQBJ2
	FJRV7HgZRCT6Z0pkRkQ1Z28kxxUtqGo3kdE+lTMkuQSV009DZ2mkM17MLKe4Af3YoV5CK2pgvHL
	l4G0mcxexzD+1Y9TKi87y/6aH6LwEIqHmf1p6B2IQhXM9P47NtZzEYHfgfR+OhZHtfUA7IO/F+p
	+x47RmvWiuBrU2L5r2klxm/EAjFWEQgGc4PDAGzU+5/vyF2p/Id5dKFq+pcVCSc2kewuWMDzXjM
	oR+OFfNjhng==
X-Received: by 2002:a05:600c:3509:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49e61082a1dmr89197245e9.10.1789196344222;
        Fri, 11 Sep 2026 23:59:04 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm146181225e9.2.2026.09.11.23.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:59:03 -0700 (PDT)
Date: Sat, 12 Sep 2026 08:59:01 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, 
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 0/2] ARM: preserve DMA_FROM_DEVICE buffer contents
Message-ID: <aqT3UcHPXHIwlqqd@gmail.com>
References: <20260910063620.17768-1-kmehltretter@gmail.com>
 <2ea28a17-f36f-4dfb-8e2a-375e7a3a4d6b@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ea28a17-f36f-4dfb-8e2a-375e7a3a4d6b@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_235907_972946_E37977C1 
X-CRM114-Status: GOOD (  22.82  )
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

On Thu, Sep 10, 2026 at 11:14:28AM +0100, Arnd Bergmann wrote:

Hi Arnd,

> - actually measure the performance overhead: you already did the
>   work to test this on three separate arm implementations but did
>   not share performance numbers.
>   Can you quantify how much this costs us on the hardware you used?
> 

I measured DMA_FROM_DEVICE map/unmap round trips without a device transfer.
The 1 MiB results were unchanged within noise on Pi 400 and SAM9X75, and
faster on ARM11. The only reproducible increase was about 22 ns for a
256 B round trip on Pi 400.

These are the mean times per round trip. I wrote to the dirty buffers
before each iteration and left the clean buffers untouched.

                                         control     patched       change
  Cortex-A72, v7, 256 B dirty           353 ns         376 ns       +6.3%
  Cortex-A72, v7, 1 MiB dirty        73.840 us      73.994 us       +0.21%
  Cortex-A72, v7, 1 MiB clean        73.108 us      73.115 us       +0.01%

  ARM926EJ-S, legacy, 256 B dirty      1.208 us       1.203 us       -0.4%
  ARM926EJ-S, legacy, 1 MiB dirty    656.888 us     656.827 us       -0.009%
  ARM926EJ-S, legacy, 1 MiB clean    656.608 us     656.601 us       -0.001%

  ARM11 MPCore, v6, 256 B dirty        4.639 us       3.095 us      -33.3%
  ARM11 MPCore, v6, 1 MiB dirty       16.380 ms      15.550 ms       -5.1%
  ARM11 MPCore, v6, 1 MiB clean       16.380 ms      15.560 ms       -5.0%

Pi 400 and SAM9X75 used 786262be6048 and GCC 13.3, with three boots per
kernel. On Pi 400, only the v7 map change from patch 1 takes effect.
On SAM9X75, patch 2 changes map-time invalidate to clean-and-invalidate.
Unmap remains a no-op.

ARM11 used a 5.11-based tree and Clang/LLD 22.1.8 on both sides. Its clock
has 4 ms resolution, so I timed batches and subtracted a separate
memset-only batch for dirty buffers. I alternated kernels for five boots
each, with five batches per scenario per boot and 500,000 iterations per
256 B batch. Every patched boot's mean was below every control boot's
mean in all three scenarios.

Both ARM11 kernels invalidate at unmap, as current mainline does.
They differ only in whether they invalidate or clean at map time.

Below is the benchmark source used on Pi 400 and SAM9X75.

----- dma_from_device_benchmark.c -----
// SPDX-License-Identifier: GPL-2.0-only
/*
 * Streaming DMA_FROM_DEVICE map/unmap cost benchmark.
 *
 * Times dma_map_single()+dma_unmap_single() round trips for a few
 * buffer size / dirty-state scenarios, to quantify the cost of the
 * architecture's cache-maintenance choice for DMA_FROM_DEVICE (e.g.
 * invalidate-at-map vs clean-at-map). No real DMA hardware is used or
 * required: only the architecture's cache-maintenance side effects of
 * the streaming DMA API are measured, against a throwaway platform
 * device, so this runs unmodified on any architecture.
 *
 * insmod dma_from_device_benchmark.ko and read dmesg for one line per
 * scenario: mean/min/max nanoseconds per round trip and ns per KiB.
 */
#include <linux/dma-mapping.h>
#include <linux/interrupt.h>
#include <linux/ktime.h>
#include <linux/math64.h>
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/slab.h>

struct scenario {
	const char *name;
	size_t size;
	unsigned int reps;
	bool dirty;
};

static const struct scenario scenarios[] = {
	{ "small-dirty-256B", 256,      5000, true  },
	{ "large-dirty-1MiB", 1 << 20,  300,  true  },
	{ "large-clean-1MiB", 1 << 20,  300,  false },
};

static struct platform_device *pdev;

static int run_scenario(struct device *dev, const struct scenario *sc)
{
	u64 sum = 0, min = U64_MAX, max = 0;
	unsigned int i;
	u8 *buf;
	int ret = 0;

	buf = kmalloc(sc->size, GFP_KERNEL);
	if (!buf)
		return -ENOMEM;

	for (i = 0; i < sc->reps; i++) {
		unsigned long flags;
		dma_addr_t dma;
		u64 t0, t1, d;

		/* Re-dirty every line each pass; a "clean" scenario never
		 * writes buf at all, so it stays whatever the allocator left
		 * it as (steady-state after the first map/unmap invalidates
		 * it out of cache).
		 */
		if (sc->dirty)
			memset(buf, (u8)(i | 1), sc->size);

		local_irq_save(flags);
		t0 = ktime_get_ns();
		dma = dma_map_single(dev, buf, sc->size, DMA_FROM_DEVICE);
		if (!dma_mapping_error(dev, dma))
			dma_unmap_single(dev, dma, sc->size, DMA_FROM_DEVICE);
		t1 = ktime_get_ns();
		local_irq_restore(flags);

		if (dma_mapping_error(dev, dma)) {
			ret = -EIO;
			break;
		}

		d = t1 - t0;
		sum += d;
		min = min_t(u64, min, d);
		max = max_t(u64, max, d);
	}

	if (!ret) {
		u64 mean = sum, ns_per_kib;

		do_div(mean, sc->reps);
		ns_per_kib = mean * 1024;
		do_div(ns_per_kib, sc->size);
		pr_info("dmabench: %-16s size=%8zu reps=%u mean_ns=%llu min_ns=%llu max_ns=%llu ns_per_KiB=%llu\n",
			sc->name, sc->size, sc->reps, mean, min, max, ns_per_kib);
	} else
		pr_err("dmabench: %s: dma_map_single failed\n", sc->name);

	kfree(buf);
	return ret;
}

static int __init dmabench_init(void)
{
	struct device *dev;
	unsigned int i;
	int ret;

	pdev = platform_device_register_simple("dmabench", -1, NULL, 0);
	if (IS_ERR(pdev))
		return PTR_ERR(pdev);
	dev = &pdev->dev;

	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
	if (ret) {
		platform_device_unregister(pdev);
		return ret;
	}

	pr_info("dmabench: START\n");
	for (i = 0; i < ARRAY_SIZE(scenarios); i++)
		run_scenario(dev, &scenarios[i]);
	pr_info("dmabench: DONE\n");
	return 0;
}

static void __exit dmabench_exit(void)
{
	platform_device_unregister(pdev);
}

module_init(dmabench_init);
module_exit(dmabench_exit);
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Streaming DMA_FROM_DEVICE map/unmap cost benchmark");

-- 
Karl

