Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FC5C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tq21iXQPKKynEPw3Uhq/hZUwml7pvAbpZ0OeTPKe4Go=; b=mICC8FSjVfMB+bvYf8nodVnMPI
	EUO7x+88/8UUcZb+GVwgauP/5IZ+yKMxricqihXufP1CdnmeUd9ZYoDujtWgcqBVkVwTpBw1SQ+Sm
	mDBiDJGlxjeWSyFeIXp9AHNl72mBKDrUBxdx1Ey9rvX8jZQB2mr6ZQM+e6YldWQJAREyB1x91oggX
	p888OP/io8pdVP9ntc8qtXfhZqY8bnb/gfj3kyg29ei9XGBu4Hky5PsNV4gc09noPoa2rSChmgMFg
	BIMLt5zrzQ0xf6xA6PFdDVN28BY7wCc0KuB37JYhC1w4hRqxhIl/Jseql7L8c57MW8dKzq6BujxSq
	aHv50xKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8blg-00000001oGt-0s1M;
	Mon, 21 Sep 2026 11:01:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ble-00000001oGP-1bhx
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=tq21iXQPKKynEPw3Uhq/hZUwml7pvAbpZ0OeTPKe4Go=; b=PRqZ6VMZMa+cI8GhNGSn1Q5ikz
	wJ+RDLW5AJYtjEyeicxW1cyYx1wYQpIpK8/JK39tGxtkq5ZohsqD6sAXeBZXaaLxkZoxpBGHSW1t7
	SuzgZ1T/cRHNF7UPPuX7TxTqq7TfASApi1xzVs1LbG/0JnLYCrhqiV3NpQamlWKaThkBolfDPQh64
	hQsNRCvJLjfp7/jOUCyBf8zGbYxJewBwFQlAx+qbDqfLpERxEH1AV65dODRsvz3u/tFJYfJ49iE0k
	zgq9JK11wAK3HQkkMiJwyhKsv4beXrfYpgA6J2y+Jeb6O6KRFQ24IkK7w8Th+0wb9OPqzesbWWrzZ
	hreZRaAg==;
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8bla-0000000C9zy-3Qta
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:01:01 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-486f1ecf9bbso611913f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988456; x=1790593256; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tq21iXQPKKynEPw3Uhq/hZUwml7pvAbpZ0OeTPKe4Go=;
        b=HkXEpRd4MnQH8/Jdx/4yUe0aW/aaWbfoxhAF8HME5Z7ntOucnPAazJwAm6Dob87Cui
         VbvJYWn0dy/DFDVBY7ULeQyez4Q1BYSt+Bq8m3H0ybfG9uqwx2h+xsow5EMQSQwSqdo/
         z/gnSpP2A+BU24iPG7YhtlQ9KZFTrU+RLIFu8+ngOB9qpp/LnHZAnT3kt7t8cawTnLBt
         Xnpt4s6Gq7c+MJtoVoJADW68Pyy7nxzVBTrRojgpSdUe2CNB+V9pkyD/hWes4AEgq9RX
         dMEmoVy+qzINk1FKW2iCaMY4BAY/nU9vcLVeas3dzWp4ATlgqf08uUWVySrr9poWg/CZ
         1amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988456; x=1790593256;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tq21iXQPKKynEPw3Uhq/hZUwml7pvAbpZ0OeTPKe4Go=;
        b=uTRjVwFJkFkXceEXZefSMFPfrtgVt1haL9pKlogyAG4CRElU5UwH8DbEdPD26YIZap
         Bvv8qLoIcp8I5V19ydDpvQrXkGfD30RLkBU9mQYqNXqm6BaKdMxyrTyhBequnt1t+wMj
         HpMdADZHtQYIKBQvNLPdaoKPLIARXVo0LDERhGVeK9va1kN9YmF3xBwOqa/U+h0hucM8
         AcVVqhqHFOi7yzI2SMSjDsDW8WrA6NoMWgJgtS4pejyFaGlZCwPK7yEuZkwzpzb2tPSr
         YhXeefJRCbI151HLXYq6ZMKfbcw3TY6N41RI0Pvp7lI5PD7RCSjIUBbQT47E3KnfLX+Y
         4BYA==
X-Forwarded-Encrypted: i=1; AKwUvBxB3WsmiGX8vZXNagv6JkuTAvVi+5wMxUrfqkTRVI3kegEkJNX7hU2pj8fec1j2r+3tzwfjaE2xwmd4vZjxvU2W@lists.infradead.org
X-Gm-Message-State: AFuF++ns79Mm3thGMsZiPehzs51c5rJ0hd0isaFIHOR+z3BfECxDJGcH
	v92xTHRDBUJnR30PnvTAd/X6eedx4p821V+YUNNB05JqZN44njvmCtpqXWN6nV+p4HLhiE2/ZAt
	l1e7Rxo0nZKvZwwgu4OxZVw==
X-Received: from wrbep8.prod.google.com ([2002:a05:6000:42c8:b0:488:5ffc:4b74])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:6f05:0:b0:487:10b6:1ce2 with SMTP id ffacd0b85a97d-4871e2158d7mr13645670f8f.1.1789988455971;
 Mon, 21 Sep 2026 04:00:55 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:42 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-1-vdonnefort@google.com>
Subject: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
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
X-CRM114-CacheID: sfid-20260921_120059_068658_4B0986DD 
X-CRM114-Status: GOOD (  18.07  )
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

1. memblock:
   - Introduce MEMBLOCK_PTEMAP to force PTE mappings only for a specific region.

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

Changelog:

v2:
  - Rename MEMBLOCK_LLMAP to MEMBLOCK_PTEMAP (Mike)
  - Warn on conflicting MEMBLOCK_NOMAP and MEMBLOCK_PTEMAP flags (Mike)
  - Drop DT "ll-map" property and mark MEMBLOCK_PTEMAP from ffa_lend_pool_setup() (Rob, Thierry)
  - Drop "reusable" and "no-map" property checks from ffa_lend_pool_setup() (Rob)
  - dt-bindings: Document arm,ffa-lend-pool (Rob)
  - Rework the Optee support with a separate ffa_lend_pool.c file.
  - use walk_kernel_page_table_range_lockless() for
    can_set_direct_map_range() to fix folded page table (Sashiko)
  - Add missing TLB flush in ffa_prepare_lend()
  - Disable hibernation
  - Rebase on linux-next (next-20260918) to use the new set_direct_map*() ranges (Mike)

v1 (https://lore.kernel.org/all/20260902104712.2399797-1-vdonnefort@google.com/)

Vincent Donnefort (8):
  memblock: Introduce MEMBLOCK_PTEMAP
  arm64: Introduce can_set_direct_map_range()
  arm64: Introduce __set_direct_map*()
  arm64: Add support for MEMBLOCK_PTEMAP
  firmware: arm_ffa: Introduce ffa-lend-pool
  optee: Add support for arm,ffa-lend-pool
  dt-bindings: reserved-memory: Add Arm FF-A lend pool
  dt-bindings: firmware: optee: Add memory-region property

 .../arm/firmware/linaro,optee-tz.yaml         |   5 +
 .../reserved-memory/arm,ffa-lend-pool.yaml    |  55 ++++
 arch/arm64/include/asm/set_memory.h           |   7 +
 arch/arm64/mm/mmu.c                           |  23 +-
 arch/arm64/mm/pageattr.c                      |  72 ++++-
 drivers/firmware/arm_ffa/Kconfig              |   5 +
 drivers/firmware/arm_ffa/Makefile             |   1 +
 drivers/firmware/arm_ffa/lend_pool.c          | 261 ++++++++++++++++++
 drivers/tee/optee/Makefile                    |   1 +
 drivers/tee/optee/core.c                      |   6 +
 drivers/tee/optee/ffa_abi.c                   |  13 +-
 drivers/tee/optee/ffa_lend_pool.c             |  72 +++++
 drivers/tee/optee/optee_private.h             |   4 +
 drivers/tee/optee/protmem.c                   |  20 +-
 drivers/tee/optee/smc_abi.c                   |  21 +-
 include/linux/arm_ffa.h                       |  23 ++
 include/linux/memblock.h                      |  18 ++
 mm/memblock.c                                 |  30 ++
 18 files changed, 608 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.yaml
 create mode 100644 drivers/firmware/arm_ffa/lend_pool.c
 create mode 100644 drivers/tee/optee/ffa_lend_pool.c


base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
-- 
2.55.0.1082.g2b9226bbc0-goog


