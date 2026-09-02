Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB79C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zt5M13bJdXW7K7qyVlwwml2r+oge4XhKrpcO5BXQh9I=; b=E1rX/jJSOMzKGUrV853FicBefX
	D1D3nKOb6Y1++Q3GtKBiY2EpK4qv522c4wJLf7An17IGPcgm4/xhdUnG2ygqfpFpFV47gta9/Q1oS
	90/2xdHUiKt+ubJvRYGhHuCx4Vsh0c3AgZVXuiwafEtQCTSZS6tRKHkte2OQ5rOByt7/3/FPC/3xe
	H0dl+3wMz+3gJgcz2SoicxDrTJO7FLUTFleM8Kek2/z8oQKmMWKP3MYbn2GyiyutUeUcUefMUlcDh
	eVafhVU+CSifxONUe+K9Vk1MXdL84de/d8lb1jJd9+y8zkPPsq6kLom+yDqu1d4D9Fluel8EGxg3p
	UyGxoY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1l05-0000000EnUV-2on2;
	Wed, 02 Sep 2026 13:27:37 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1l03-0000000EnTW-1XYd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:27:36 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c255c58156bso169823166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788355653; x=1788960453; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zt5M13bJdXW7K7qyVlwwml2r+oge4XhKrpcO5BXQh9I=;
        b=RhYnziDM9iTGvsG/lCyebs36obcsuDdEsmWcvibNjQZohx8F7bDIzJpkbJL/iEB82Q
         rqdul3dGcGdJPPGBsvwHyqJj7g5gmKSRHCvGU+Pi2RrCvjw+YkaLaL3t/5I0slY/iiPf
         PtKpZG+0n2JxUIuVwMeHnqo5ZP4X9KFX1ksu3ekj6fE4ICoFM8NdSpmYAIPVW4Q4wIz9
         QbXQ4mcHwyRXPpcniSYqAszMp83lhmTKDl2ksje8o6/jyGEmskrzDjr5ntbr2tv0yFh4
         bOlhVxBmR7vpJLvBSqHkWc0v28vdri7Jm567BOUissgvUeqSn/B4RSJL+s/yIkXjXY9J
         /1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355653; x=1788960453;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zt5M13bJdXW7K7qyVlwwml2r+oge4XhKrpcO5BXQh9I=;
        b=LP+2PtqPu1EDzJprBY/Sts6EXQDX02/L/hEVzfuviNQgr8dIfvDMJMZgFjU1zrYQwp
         hCsrhJlTjvOtiUf29h7K2Ons462ayuwc9lkFwf6HQhoMqMhyP/hCi5B4vCjVYlSmhAvN
         gBtyR1F+xPbKt4rkvj2X6PWFDTMbm4AGrk2MU50da07PEksk4Gj1mYns+zaRb02fEOyP
         es8DYm8Fk8RYy0dNxIcMzA4aK1fVjQ3e/Gsn4I4bQZLaOEN9gcrd7QMhX2GPx073e1fS
         V05WsVqjbVvu735c949l8t2lSUhJGVD0A0Ka9WflX9bspDpYX3YNL+m4PuZlmZlrtMuq
         Vg1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwg9kzBcHvWO5PEYL+HjSFGSNKDfZQehwV9pr2sRGicMDITRsNsI3FmjVj9Svgl6TunumPUx3Bm2FZrBsAOiz3M@lists.infradead.org
X-Gm-Message-State: AFuF++l/our7Ow2Hbpkg7W9BdrNPHnpmE1irUeW7RPZfpxS9Qx7CQc7o
	x6rlUxCMPx0tZKRGZiBgj46OiuAffxW3eS6+nQz/RxkZcL9ImLeMTCpnurPikL0URQ==
X-Gm-Gg: AYBFou1CPLqdrR5WLrdxQEt9EX7dGx70hM4ajRfHxEoPG+bmNa1Uw2ukmqlSImoP8qP
	avcrA9WhH6zx/wWt1iShLua3lxCF1E9hE/GHvUTcGIta8ttzgeStzgLDUeE5tbu3N+7oEHimhT1
	x5qRq7QVl+SMQV77lLTre2Pj2WW1gAq1AQuq2TmFg+kSbCmY6Wh4Fc/VH3kdmEQGRxWAX25et8X
	urDCPgX5kZYfHsfJlbTQea1Lf8/5Oi1fH8wDwnYRKbBLOE8wHdUoDxh5/hH+NX40hNUDX7m9N+Y
	uCeN4C5azD0GZepYupjNfN00KF9OSOQod3iPJXgoTwUnBH1CEt9+NrlfIVQ5yc21P8ahHsBYMyZ
	AMw2AtEYDHv2iwYn6u8a0ZEvjdXCLPBdUrJw0ngXjGmQUHxoWXpp5NjENhA4K9Q5kg6Esshjv4Z
	7vnfnrLTJ+iQcuFMYUcVfewDPHasAvHu5ruNlV0V9XzI+2oIDWjrfHBT6Ttz8a9dJxBdSC/rHmW
	9NOXBpJhwXMWAcJTVSYXo2YyFbhM3hs
X-Received: by 2002:a17:906:f58e:b0:c25:c954:faf2 with SMTP id a640c23a62f3a-c25d563a41cmr291059666b.21.1788355652676;
        Wed, 02 Sep 2026 06:27:32 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d796sm138037066b.40.2026.09.02.06.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:27:32 -0700 (PDT)
Date: Wed, 2 Sep 2026 14:27:28 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 00/10] arm64: Unmap FF-A lent memory from direct map
Message-ID: <apgkQJai-2pjI75-@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_062735_437805_A4AE7D3E 
X-CRM114-Status: GOOD (  27.84  )
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

This is of course v1, not v9...

On Wed, Sep 02, 2026 at 11:47:02AM +0100, Vincent Donnefort wrote:
> This series is a follow-up to the discussion that has started here [1].
> While standalone, it also provides primitives reusable for the VPR DMA
> heap.
> 
> When memory is lent to the Secure world via FF-A, CPU speculative
> accesses from NS to the lent pages can still occur as long as it retains
> a cacheable mapping to it.
> 
> Ideally, lent memory would be "no-map" but that would mean giving up
> MiBs of useful memory, so let's try to do better with the help of a CMA
> pool.
> 
> On arm64, modifying the direct map at runtime is generally restricted
> because the linear map defaults to block mapping and splitting blocks at
> runtime may trigger fatal page fault, unless the CPU implements BBML3
> or the entire direct map was mapped at page granularity from boot.
> Forcing last-level mappings system-wide incurs a severe penalty we want
> to avoid. Instead, this series introduces targeted last-level mappings
> for designated memory regions, along with the "arm,ffa-lend-pool" CMA
> driver to manage unmapping and remapping on lend/reclaim transitions:
> 
> 1. memblock & OF reserved memory ("ll-map"):
>    - Introduce MEMBLOCK_LLMAP and the DT "ll-map" property for reserved-memory
>      nodes to force last-level (PTE) mappings only for a specific region.
> 
> 2. set_memory infrastructure:
>    - Introduce can_set_direct_map_range() to check if a specific address
>      range is mapped with last-level entries and can be modified safely.
>    - Introduce __set_direct_map_*() variants that bypass redundant checks
>      when the caller has already validated the range.
> 
> 3. "arm,ffa-lend-pool" driver
>    - Introduce the "arm,ffa-lend-pool" CMA reserved-memory driver, which
>      unmaps pages prior to lending (ffa_prepare_lend()) and restores them
>      when reclaimed (ffa_lend_reclaimed()).
> 
> 4. Optee support
>    - Hook OP-TEE dynamic protected memory pools to "arm,ffa-lend-pool" for
>      both SMC (via DT memory-region phandle) and FF-A (via
>      ffa_lend_pool_attach()) transports.
> 
> Testing:
> ========
> 
> Tested with QEMU v8 using OP-TEE OS (built with CFG_CORE_DYN_PROTMEM=y)
> under both SMC and FF-A transports [2]
> 
> static void dump_direct_map(const char *label)
> {
> 	printf("\n=== %s ===\n", label);
> 	fflush(stdout);
> 	system("sed -n '/Linear Mapping start/,/Linear Mapping end/p' /sys/kernel/debug/kernel_page_tables");
> 	fflush(stdout);
> }
> 
> int main(int argc, char *argv[])
> {
> 	int heap_fd;
> 	int dmabuf_fd;
> 	struct dma_heap_allocation_data data = { 0 };
> 	size_t size = 1024 * 1024; /* 1MB */
> 
> 	if (argc > 1)
> 		size = strtoul(argv[1], NULL, 0);
> 
> 	dump_direct_map("BEFORE ALLOCATION");
> 
> 	heap_fd = open("/dev/dma_heap/protected,secure-video", O_RDWR);
> 	if (heap_fd < 0) {
> 		perror("open /dev/dma_heap/protected,secure-video");
> 		return 1;
> 	}
> 
> 	printf("\nOpened /dev/dma_heap/protected,secure-video\n");
> 	printf("Allocating %zu bytes of protected memory via DMA heap...\n", size);
> 
> 	data.len = size;
> 	data.fd_flags = O_RDWR | O_CLOEXEC;
> 	if (ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC, &data) < 0) {
> 		perror("ioctl DMA_HEAP_IOCTL_ALLOC");
> 		close(heap_fd);
> 		return 1;
> 	}
> 
> 	dmabuf_fd = data.fd;
> 	printf("Successfully allocated %zu bytes! dmabuf_fd = %d\n", size, dmabuf_fd);
> 
> 	dump_direct_map("DURING LEND (EXPECT HOLE IN DIRECT MAP)");
> 
> 	printf("\nReleasing dmabuf_fd...\n");
> 	close(dmabuf_fd);
> 	close(heap_fd);
> 
> 	dump_direct_map("AFTER RECLAIM (RESTORED DIRECT MAP)");
> 
> 	return 0;
> }
> 
> [1] https://lore.kernel.org/all/20260807-tegra-vpr-v4-7-5510d16af89e@nvidia.com/
> [2] https://optee.readthedocs.io/en/latest/building/gits/build.html#qemu-v8
> 
> Vincent Donnefort (10):
>   memblock: Introduce MEMBLOCK_LLMAP
>   of: reserved_mem: Introduce "ll-map" property
>   set_memory.h: Introduce can_set_direct_map_range()
>   set_memory.h: Introduce __set_direct_map*()
>   arm64: can_set_direct_map() if BBML3
>   arm64: Implement can_set_direct_map_range()
>   arm64: Implement __set_direct_map*()
>   arm64: Add support for MEMBLOCK_LLMAP
>   firmware: arm_ffa: Introduce ffa-lend-pool
>   optee: Add support for arm,ffa-lend-pool
> 
>  arch/arm64/include/asm/set_memory.h  |   7 +
>  arch/arm64/mm/mmu.c                  |  23 ++-
>  arch/arm64/mm/pageattr.c             |  67 +++++++-
>  drivers/firmware/arm_ffa/Kconfig     |   5 +
>  drivers/firmware/arm_ffa/Makefile    |   1 +
>  drivers/firmware/arm_ffa/lend_pool.c | 223 +++++++++++++++++++++++++++
>  drivers/of/of_reserved_mem.c         | 104 ++++++++++---
>  drivers/tee/optee/ffa_abi.c          |  13 +-
>  drivers/tee/optee/protmem.c          |   8 -
>  drivers/tee/optee/smc_abi.c          |  17 +-
>  drivers/tee/tee_shm.c                |  11 +-
>  include/linux/arm_ffa.h              |  21 +++
>  include/linux/memblock.h             |   9 ++
>  include/linux/set_memory.h           |  39 +++++
>  mm/memblock.c                        |  50 ++++++
>  15 files changed, 545 insertions(+), 53 deletions(-)
>  create mode 100644 drivers/firmware/arm_ffa/lend_pool.c
> 
> 
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> -- 
> 2.55.0.970.g62bdec98f9-goog
> 

-- 
Vincent

