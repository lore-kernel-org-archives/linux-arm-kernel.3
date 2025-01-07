Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACA9E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BNXmpx/9Z5aV1PpjSsZV4urUt5gKJgJtQeXjnKUdSbs=; b=g1OvSNqgBdXn6SU+3n8HqPiXMt
	8ECGqWbaLsCcSWJFABx1zKhqQzI+eXx2jA9N8ZYPLuWVwXfI5XcJTqIbDeuWZDOse3T5qiE7w1Zws
	1T0Y00U2HDOMCRflKwqVogptGF2B6Ym0AZ4ZSDr9L4hup9knWnp6+hXaZHbx2//M11oft9JRmfr1d
	kayqljAOi0l31BjJlPGStZkPsqvz+nLsd8F5DW8SSJJzF2XOH12mzBTF2N2irFRNhuu/DGSuZ48h9
	z1aCAYQkP49LbhUs8I0LHANfLRQm0w5mspBeIX06zkbxeenjo/G2lg2+WhlFg4CsBhepPP8/IgJrC
	tg5TmhUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7ky-00000004YC8-1S4T;
	Tue, 07 Jan 2025 11:28:20 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7jk-00000004Xwr-2lrj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:27:06 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:39d4:dc4e:b4ce:1377])
	by xavier.telenet-ops.be with cmsmtp
	id yBSz2D0063AZZFy01BSzH0; Tue, 07 Jan 2025 12:26:59 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tV7jb-00000008dfp-1nyE;
	Tue, 07 Jan 2025 12:26:59 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tV7je-000000059Or-3eC2;
	Tue, 07 Jan 2025 12:26:58 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] ARM: shmobile: rcar-gen2: Remove CMA reservation code
Date: Tue,  7 Jan 2025 12:26:55 +0100
Message-ID: <3d38f4fec20c4af46e4570012de7017eee9a39e9.1736249109.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_032704_843667_F0A32B14 
X-CRM114-Status: GOOD (  18.34  )
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

If CONFIG_HIGHMEM=y, two reserved blocks are allocated on R-Car Gen2:

    cma: Reserved 256 MiB at 0x70000000 on node -1
    cma: Reserved 64 MiB at 0x6c000000 on node -1

The first block is reserved by the family-specific rcar_gen2_reserve(),
the second by the common arm_memblock_init() (shmobile_defconfig sets
CONFIG_CMA_SIZE_MBYTES=64).  As both blocks are reserved (eventually)
using dma_contiguous_reserve_area(), they both have the same name
("reserved").  Hence if CONFIG_CMA_SYSFS=y:

  sysfs: cannot create duplicate filename '/kernel/mm/cma/reserved'
   ...
   cma_sysfs_init from do_one_initcall+0x84/0x178
   ...
  kobject: kobject_add_internal failed for reserved with -EEXIST, don't try to register things with the same name in the same directory.

This causes cma_sysfs_init() to fail completely, and not to create
/sys/kernel/mm/cma/ at all.

Fix this by dropping the R-Car Gen2-specific reservation.  Compared to
when it was introduced, now there exist more flexible mechanisms to
control the size of memory reserved for CMA.  Users can reserve more
memory by increasing CONFIG_CMA_SIZE_MBYTES, passing the cma=<N> kernel
command line parameter, or adding a reserved-memory/linux,cma node to
DT.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Note that increasing CONFIG_CMA_SIZE_MBYTES in shmobile_defconfig is not
a good idea, as it can also be used on other Renesas platforms that are
more memory-constrained than R-Car Gen2.

Should we add reserved-memory/linux,cma nodes to DT on all affected
boards?
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 76 ------------------------
 1 file changed, 76 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index c38367a10c794162..3cd34a42e39bb1d7 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -8,19 +8,15 @@
  */
 
 #include <linux/clocksource.h>
-#include <linux/device.h>
-#include <linux/dma-map-ops.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_clk.h>
-#include <linux/of_fdt.h>
 #include <linux/psci.h>
 #include <asm/mach/arch.h>
 #include <asm/secure_cntvoff.h>
 #include "common.h"
-#include "rcar-gen2.h"
 
 static const struct of_device_id cpg_matches[] __initconst = {
 	{ .compatible = "renesas,r8a7742-cpg-mssr", .data = "extal" },
@@ -122,76 +118,6 @@ static void __init rcar_gen2_timer_init(void)
 	timer_probe();
 }
 
-struct memory_reserve_config {
-	u64 reserved;
-	u64 base, size;
-};
-
-static int __init rcar_gen2_scan_mem(unsigned long node, const char *uname,
-				     int depth, void *data)
-{
-	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
-	const __be32 *reg, *endp;
-	int l;
-	struct memory_reserve_config *mrc = data;
-	u64 lpae_start = 1ULL << 32;
-
-	/* We are scanning "memory" nodes only */
-	if (type == NULL || strcmp(type, "memory"))
-		return 0;
-
-	reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
-	if (reg == NULL)
-		reg = of_get_flat_dt_prop(node, "reg", &l);
-	if (reg == NULL)
-		return 0;
-
-	endp = reg + (l / sizeof(__be32));
-	while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
-		u64 base, size;
-
-		base = dt_mem_next_cell(dt_root_addr_cells, &reg);
-		size = dt_mem_next_cell(dt_root_size_cells, &reg);
-
-		if (base >= lpae_start)
-			continue;
-
-		if ((base + size) >= lpae_start)
-			size = lpae_start - base;
-
-		if (size < mrc->reserved)
-			continue;
-
-		if (base < mrc->base)
-			continue;
-
-		/* keep the area at top near the 32-bit legacy limit */
-		mrc->base = base + size - mrc->reserved;
-		mrc->size = mrc->reserved;
-	}
-
-	return 0;
-}
-
-static void __init rcar_gen2_reserve(void)
-{
-	struct memory_reserve_config mrc;
-
-	/* reserve 256 MiB at the top of the physical legacy 32-bit space */
-	memset(&mrc, 0, sizeof(mrc));
-	mrc.reserved = SZ_256M;
-
-	of_scan_flat_dt(rcar_gen2_scan_mem, &mrc);
-#ifdef CONFIG_DMA_CMA
-	if (mrc.size && memblock_is_region_memory(mrc.base, mrc.size)) {
-		static struct cma *rcar_gen2_dma_contiguous;
-
-		dma_contiguous_reserve_area(mrc.size, mrc.base, 0,
-					    &rcar_gen2_dma_contiguous, true);
-	}
-#endif
-}
-
 static const char * const rcar_gen2_boards_compat_dt[] __initconst = {
 	"renesas,r8a7790",
 	"renesas,r8a7791",
@@ -204,7 +130,6 @@ static const char * const rcar_gen2_boards_compat_dt[] __initconst = {
 DT_MACHINE_START(RCAR_GEN2_DT, "Generic R-Car Gen2 (Flattened Device Tree)")
 	.init_late	= shmobile_init_late,
 	.init_time	= rcar_gen2_timer_init,
-	.reserve	= rcar_gen2_reserve,
 	.dt_compat	= rcar_gen2_boards_compat_dt,
 MACHINE_END
 
@@ -220,6 +145,5 @@ static const char * const rz_g1_boards_compat_dt[] __initconst = {
 DT_MACHINE_START(RZ_G1_DT, "Generic RZ/G1 (Flattened Device Tree)")
 	.init_late	= shmobile_init_late,
 	.init_time	= rcar_gen2_timer_init,
-	.reserve	= rcar_gen2_reserve,
 	.dt_compat	= rz_g1_boards_compat_dt,
 MACHINE_END
-- 
2.43.0


