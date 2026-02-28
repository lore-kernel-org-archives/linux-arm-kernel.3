Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1C2FD0040
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 22:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xviIpIkstRNT9sPfU0zk0oRcwgO9vdYQGOA0hVgSiDQ=; b=tuxMQGOUwrRAnI
	c1+3R/Ed3PYkU10LG5lP9v+ERbX/iJ3F0owYqP23pC2Ri2tXy0xRd+dMOd1NK9LnbSSyK3klesXq6
	3CHlgMDFm7gSqMcLkI2eUJO9y3HF9d2Sj1yllMPCYXqoPVh2fY1C1Gk4XV61fQjex/5+Pb850m1qc
	jwmS7KHZ9jBnPcw5zAb99dubE6d0ssmiJJSUr72+st7T9KbukDjdGB9WkjSv4DElmoV+33t9O3gQ2
	4vjPCIk2WEXtnl1iNloCjhOMbbE9v0ePVyoktu5pcVTPwm7Hd36tQa9Mpf8oQkNyqGicw9qIDRpoL
	afEIQXn4JVqAgOvlkApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSXH-0000000AJgS-0BTy;
	Sat, 28 Feb 2026 22:11:43 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSXE-0000000AJfd-0ESr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 22:11:42 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ae4988e039so378815ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 14:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772316699; x=1772921499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xviIpIkstRNT9sPfU0zk0oRcwgO9vdYQGOA0hVgSiDQ=;
        b=W3YzsYeo1WSig6rxCMdblIQE+mpJPg7w2gvYn20/496a2zZTRJJEcd3v2FOr0HSv6C
         2iMkJPGjZ/FncfoVoyPDckAwmZjgSMma4u/VfjqsMxwpt2vgX84mOrKZKPHLrGFD1vyI
         8VTg5Gy3H0xo4sWBFRWDOweh57eraaYrM2h697q+jxeJDkQrWbs0l0GF/jelOeDlM4du
         tRymaaTIqIXrf+NDhmBAGnlVl3D7G4azNda+jtfHcP59DftNpGpacjOl0R78ilMD6f1v
         tJYb/gSt+ngMyRm4XeeB/dbZnY9m4ceJ3spg3MvwuSGf9ko708IAMihZdQA5exwUNYrk
         1OuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772316699; x=1772921499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xviIpIkstRNT9sPfU0zk0oRcwgO9vdYQGOA0hVgSiDQ=;
        b=FaEyBAXUCsXe8CNfXVFTZuNCeuggesN7KmhkpHdQJMZSPRbEQCEM1sY+LY2EHrkWzK
         ACqBYdbDXD2GevKEXjPzIB1CCAYUWQCn274xFhUTKjb0RjOvORwcERVXyxx5nLhw6Qds
         mIhjuDVtzJ5g7E2MWJUhBvx/UEi4I/txGiC8VSTTCJu35zMJU7FS7vkz37j07K6CjC+S
         BbIikvNeCIOgX2Lh3wVyHUttQkg2JCI0LFPOMfFLsEXokG5flS5gABPyeQXh2L/g4Nfg
         zqJlZnj5wKUs0rfUqVSr87z3uxZ7aHw2gomPDzNyup/2z+LxTgcTaqifsHAvNRW2HbqP
         aYmg==
X-Forwarded-Encrypted: i=1; AJvYcCVopi4Jcu3XJdZLAItm9kbMWmPsgUFhFKfR043C+sEjNxfr8lxlvrI/60/is1CRfRqIu3h7/CC0nwunYnaz8295@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8e6275ZV9uzv9OpcCiiYLfR3wEZRJi3xHDwNTHAyjh2WEBpWU
	H9063GD50Kaxo/cQ2RDt5pAQDEjFV2C+njCTwSD16A1hIgRB2kNbeiEV
X-Gm-Gg: ATEYQzx/hJ4iv2Q268M1dthvT+PEpX2gFiAcaFZrtTCCkosFP/aeqYugivBvy+ocEnq
	RQF1KZ/S4LxcGCQdkPmYBMHsE1M8gRZ0ggK9aVqM5/RZUnojrpdOdD9YdcQ/3KlNBI6J113rmJx
	1gD8QqMnYIjiuvabSCJQ5g7Hp5K7cSehEgDOjy0+dGP0/wFV78NN/qHj2VcjoN8iTbxTteuDYug
	jCNaIrJfHarEhPq+OHtMR12ba5bcfhsIxPfca/63b4B8lA8nKzzvtkiUXpHHpMmcCuCHmxYpexv
	oOPj4811a0yyxrKIntOpLnWPI7sb6rJKQhwaPNzFjT9lVpCotJjggOrx8sEEaBY4Q0YfiOvB084
	r5dW2fe04TlcBXg7z4CSYlz9kXHHV8VHTV3Ppjrn2jAKDsNK7fQeKojKnlY676dvf4WglZ5efsP
	rN5QxCP+03Dv2OnuXh8n/tLpdbku5LHSqUvcHa
X-Received: by 2002:a17:903:94e:b0:295:55fc:67a0 with SMTP id d9443c01a7336-2adf78db0ebmr119480805ad.2.1772316698623;
        Sat, 28 Feb 2026 14:11:38 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6b9b32sm129494295ad.66.2026.02.28.14.11.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Feb 2026 14:11:38 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/5] dma-mapping: arm64: support batched cache sync
Date: Sun,  1 Mar 2026 06:11:25 +0800
Message-Id: <20260228221125.59863-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_141140_128020_8B354552 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: Juergen Gross <jgross@suse.com>, Barry Song <baohua@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, Xueyuan Chen <xueyuan.chen21@gmail.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>, Huacai Zhou <zhouhuacai@oppo.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <baohua@kernel.org>

Many embedded ARM64 SoCs still lack hardware cache coherency support, which
causes DMA mapping operations to appear as hotspots in on-CPU flame graphs.

For an SG list with *nents* entries, the current dma_map/unmap_sg() and DMA
sync APIs perform cache maintenance one entry at a time. After each entry,
the implementation synchronously waits for the corresponding region’s
D-cache operations to complete. On architectures like arm64, efficiency can
be improved by issuing all entries’ operations first and then performing a
single batched wait for completion.

Tangquan's results show that batched synchronization can reduce
dma_map_sg() time by 64.61% and dma_unmap_sg() time by 66.60% on an MTK
phone platform (MediaTek Dimensity 9500). The tests were performed by
pinning the task to CPU7 and fixing the CPU frequency at 2.6 GHz,
running dma_map_sg() and dma_unmap_sg() on 10 MB buffers (10 MB / 4 KB
sg entries per buffer) for 200 iterations and then averaging the
results.

Thanks to Xueyuan for volunteering to take on the testing tasks. He
put significant effort into validating paths such as IOVA link/unlink
and SWIOTLB on RK3588 boards with NVMe.

v3:
 * Fold patches 5/8, 7/8, and 8/8 into patch 4/8 as suggested by Leon,
   reducing the series from 8 patches to 5;
 * Fix the SWIOTLB path by ensuring a sync is issued before memcpy;
 * Add ARCH_HAS_BATCHED_DMA_SYNC Kconfig as suggested by Leon;
 * Collect Reviewed-by tags from Leon and Juergen. Leon's tag is not
   added to patch 4 since it has changed significantly since v2 and
   requires re-review;
 * Rename some asm macros and functions as suggested by Will;
 * Add Xueyuan's Tested-by. His help is greatly appreciated!
 v2 link:
 https://lore.kernel.org/lkml/20251226225254.46197-1-21cnbao@gmail.com/

v2:
 * Refine a large amount of arm64 asm code based on feedback from
   Robin, thanks!
 * Drop batch_add APIs and always use arch_sync_dma_for_* + flush,
   even for a single buffer, based on Leon’s suggestion, thanks!
 * Refine a large amount of code based on feedback from Leon, thanks!
 * Also add batch support for iommu_dma_sync_sg_for_{cpu,device}
v1 link:
 https://lore.kernel.org/lkml/20251219053658.84978-1-21cnbao@gmail.com/

v1, diff with RFC:
 * Drop a large number of #ifdef/#else/#endif blocks based on feedback
   from Catalin and Marek, thanks!
 * Also add batched iova link/unlink support, marked as RFC since I lack
   the required hardware. This was suggested by Marek, thanks!
RFC link:
 https://lore.kernel.org/lkml/20251029023115.22809-1-21cnbao@gmail.com/

Barry Song (5):
  arm64: Provide dcache_by_myline_op_nosync helper
  arm64: Provide dcache_clean_poc_nosync helper
  arm64: Provide dcache_inval_poc_nosync helper
  dma-mapping: Separate DMA sync issuing and completion waiting
  dma-mapping: Support batch mode for dma_direct_{map,unmap}_sg

 arch/arm64/Kconfig                  |  1 +
 arch/arm64/include/asm/assembler.h  | 25 ++++++++++---
 arch/arm64/include/asm/cache.h      |  5 +++
 arch/arm64/include/asm/cacheflush.h |  2 +
 arch/arm64/kernel/relocate_kernel.S |  3 +-
 arch/arm64/mm/cache.S               | 57 +++++++++++++++++++++++------
 arch/arm64/mm/dma-mapping.c         |  4 +-
 drivers/iommu/dma-iommu.c           | 35 ++++++++++++++----
 drivers/xen/swiotlb-xen.c           | 24 ++++++++----
 include/linux/dma-map-ops.h         |  6 +++
 kernel/dma/Kconfig                  |  3 ++
 kernel/dma/direct.c                 | 23 +++++++++---
 kernel/dma/direct.h                 | 21 ++++++++---
 kernel/dma/mapping.c                |  6 +--
 kernel/dma/swiotlb.c                |  7 +++-
 15 files changed, 171 insertions(+), 51 deletions(-)

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Cc: Huacai Zhou <zhouhuacai@oppo.com>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>
-- 
2.39.3 (Apple Git-146)


