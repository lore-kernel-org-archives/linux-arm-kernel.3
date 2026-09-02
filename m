Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90754C624D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fj637K00n75DiMuZkcJnY4d1CwmzO8C83BzSZ9fxg50=; b=zSmJ1YSGlscWJBbkq7BpGycE/K
	/5mXW59Sq3zhYaPUkG88vzBG1pJOJtvcfwBfEKOkErSVJv4aNHb0K2Sey9Bf0tFnwO+os7DaIuQhH
	HqO6mhFCXzxBWXDdDjiOXg/K+SyqQFGqSG6ZGR9Vz8ytT1AvyaCsXTbBUiQ04KQI3+yWOmlxIPeGl
	/bMgau9u/elObUMhe0T3nTYG2mWSMRPdShrHPkqbvpqBu2kpqLOwAWRYw8Gc1cVy6xk/QXJplLX8u
	02vrrbYS3LKjzX3KNqmn8unCNOgTRjCyvGx9Zp3HBP4XtkifYhCFsQm+M8KLLzM4BRbpWa3vza4Xx
	lNS/U88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYk-0000000EOu5-3VzT;
	Wed, 02 Sep 2026 10:51:14 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYf-0000000EOrW-3qiP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:51:12 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso6862995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346267; x=1788951067; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fj637K00n75DiMuZkcJnY4d1CwmzO8C83BzSZ9fxg50=;
        b=tLoR4DPUy1fJvKVYlrrAST2zkQVNhhvYADLqUdLsc6C7MeFNiGPzK3M4X7rDQwCz6R
         IwbqFFkiJUbjZ3oL8cP78udPtDyj6fFrKVc9cXoE5w4morN1RNvBs5OvLp+cHydofZ92
         k7ht4fq/QM8M9BlUJu6WpCClz3dQsBxfx90VQZJwt6pYMp8Kdw/jyzwmXf83a30UAw5L
         W/MmSOGvk6M4jouHDYnaRU68ei879wQ4DxsZiCnqPlQrJL7nHqXG+pi0wNIxr7610BVs
         A4RTCs5//76oBucxlrT9YCuZKidrjI+rBYedxV4lf9PWmr8yeFs/2gUbZasME0KMzYmW
         5LHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346267; x=1788951067;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fj637K00n75DiMuZkcJnY4d1CwmzO8C83BzSZ9fxg50=;
        b=ZjZh1SryRH9+ILYVJaLGCud/oOhmyWr0uKVfkByw7+ldkj7ERvj9sNpu8QUozOFlC2
         a2ryJulNilD/qCYDPvCeERk28pFhff+z0eXsa8YUJzg6HrkGwaxFBFsNppUaA3GQmM/N
         0lg3iCOstlvy+PwyosIrX+U6UYXJ+x05hat1b/CmdxbrZj1ulsuQTXR5Nt1nB2orC2vq
         8VWWtfKOInmkkrkegc1o9genhniY1E49+Lfg5WBEJaPk1oYP8/BuiATYDPf8eM8gyFoI
         axRyUMPZTrME+cHEvif+8zlR4+U2Mft02ZH1pxcLTK+Hw1wxIbBpNFs9lDHXQ5+Sdg6K
         2uzA==
X-Forwarded-Encrypted: i=1; AHgh+RoDudD5Tzh5KAqRwEAh60y23TWFHzsUDtr8bI3fNzC8g/8T2InuJxd9MrlKYWAs5gtNsNJepsEVQmPjI8DTX8z0@lists.infradead.org
X-Gm-Message-State: AFuF++m1/5eeyR5r+KUFJb77nT/fyv+za4tsUMDUaPeisolvnKv5iuKR
	XNfy9IBS105hKOJK6AwfvH3B3sJedotXIu4TerRFNWxshl3fBp2zSZR9yAnQYH7sbypgi82JSfO
	A5y2Sx2QC0iLYHT7pUD05yw==
X-Received: from wmee9.prod.google.com ([2002:a05:600c:2189:b0:49c:e2b5:5573])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3587:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49ce583bc25mr63950535e9.16.1788346266751;
 Wed, 02 Sep 2026 03:51:06 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:02 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-1-vdonnefort@google.com>
Subject: [PATCH v9 00/10] arm64: Unmap FF-A lent memory from direct map
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_035109_989584_27AD0911 
X-CRM114-Status: GOOD (  16.24  )
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

This series is a follow-up to the discussion that has started here [1].
While standalone, it also provides primitives reusable for the VPR DMA
heap.

When memory is lent to the Secure world via FF-A, CPU speculative
accesses from NS to the lent pages can still occur as long as it retains
a cacheable mapping to it.

Ideally, lent memory would be "no-map" but that would mean giving up
MiBs of useful memory, so let's try to do better with the help of a CMA
pool.

On arm64, modifying the direct map at runtime is generally restricted
because the linear map defaults to block mapping and splitting blocks at
runtime may trigger fatal page fault, unless the CPU implements BBML3
or the entire direct map was mapped at page granularity from boot.
Forcing last-level mappings system-wide incurs a severe penalty we want
to avoid. Instead, this series introduces targeted last-level mappings
for designated memory regions, along with the "arm,ffa-lend-pool" CMA
driver to manage unmapping and remapping on lend/reclaim transitions:

1. memblock & OF reserved memory ("ll-map"):
   - Introduce MEMBLOCK_LLMAP and the DT "ll-map" property for reserved-memory
     nodes to force last-level (PTE) mappings only for a specific region.

2. set_memory infrastructure:
   - Introduce can_set_direct_map_range() to check if a specific address
     range is mapped with last-level entries and can be modified safely.
   - Introduce __set_direct_map_*() variants that bypass redundant checks
     when the caller has already validated the range.

3. "arm,ffa-lend-pool" driver
   - Introduce the "arm,ffa-lend-pool" CMA reserved-memory driver, which
     unmaps pages prior to lending (ffa_prepare_lend()) and restores them
     when reclaimed (ffa_lend_reclaimed()).

4. Optee support
   - Hook OP-TEE dynamic protected memory pools to "arm,ffa-lend-pool" for
     both SMC (via DT memory-region phandle) and FF-A (via
     ffa_lend_pool_attach()) transports.

Testing:
========

Tested with QEMU v8 using OP-TEE OS (built with CFG_CORE_DYN_PROTMEM=y)
under both SMC and FF-A transports [2]

static void dump_direct_map(const char *label)
{
	printf("\n=== %s ===\n", label);
	fflush(stdout);
	system("sed -n '/Linear Mapping start/,/Linear Mapping end/p' /sys/kernel/debug/kernel_page_tables");
	fflush(stdout);
}

int main(int argc, char *argv[])
{
	int heap_fd;
	int dmabuf_fd;
	struct dma_heap_allocation_data data = { 0 };
	size_t size = 1024 * 1024; /* 1MB */

	if (argc > 1)
		size = strtoul(argv[1], NULL, 0);

	dump_direct_map("BEFORE ALLOCATION");

	heap_fd = open("/dev/dma_heap/protected,secure-video", O_RDWR);
	if (heap_fd < 0) {
		perror("open /dev/dma_heap/protected,secure-video");
		return 1;
	}

	printf("\nOpened /dev/dma_heap/protected,secure-video\n");
	printf("Allocating %zu bytes of protected memory via DMA heap...\n", size);

	data.len = size;
	data.fd_flags = O_RDWR | O_CLOEXEC;
	if (ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC, &data) < 0) {
		perror("ioctl DMA_HEAP_IOCTL_ALLOC");
		close(heap_fd);
		return 1;
	}

	dmabuf_fd = data.fd;
	printf("Successfully allocated %zu bytes! dmabuf_fd = %d\n", size, dmabuf_fd);

	dump_direct_map("DURING LEND (EXPECT HOLE IN DIRECT MAP)");

	printf("\nReleasing dmabuf_fd...\n");
	close(dmabuf_fd);
	close(heap_fd);

	dump_direct_map("AFTER RECLAIM (RESTORED DIRECT MAP)");

	return 0;
}

[1] https://lore.kernel.org/all/20260807-tegra-vpr-v4-7-5510d16af89e@nvidia.com/
[2] https://optee.readthedocs.io/en/latest/building/gits/build.html#qemu-v8

Vincent Donnefort (10):
  memblock: Introduce MEMBLOCK_LLMAP
  of: reserved_mem: Introduce "ll-map" property
  set_memory.h: Introduce can_set_direct_map_range()
  set_memory.h: Introduce __set_direct_map*()
  arm64: can_set_direct_map() if BBML3
  arm64: Implement can_set_direct_map_range()
  arm64: Implement __set_direct_map*()
  arm64: Add support for MEMBLOCK_LLMAP
  firmware: arm_ffa: Introduce ffa-lend-pool
  optee: Add support for arm,ffa-lend-pool

 arch/arm64/include/asm/set_memory.h  |   7 +
 arch/arm64/mm/mmu.c                  |  23 ++-
 arch/arm64/mm/pageattr.c             |  67 +++++++-
 drivers/firmware/arm_ffa/Kconfig     |   5 +
 drivers/firmware/arm_ffa/Makefile    |   1 +
 drivers/firmware/arm_ffa/lend_pool.c | 223 +++++++++++++++++++++++++++
 drivers/of/of_reserved_mem.c         | 104 ++++++++++---
 drivers/tee/optee/ffa_abi.c          |  13 +-
 drivers/tee/optee/protmem.c          |   8 -
 drivers/tee/optee/smc_abi.c          |  17 +-
 drivers/tee/tee_shm.c                |  11 +-
 include/linux/arm_ffa.h              |  21 +++
 include/linux/memblock.h             |   9 ++
 include/linux/set_memory.h           |  39 +++++
 mm/memblock.c                        |  50 ++++++
 15 files changed, 545 insertions(+), 53 deletions(-)
 create mode 100644 drivers/firmware/arm_ffa/lend_pool.c


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0.970.g62bdec98f9-goog


