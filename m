Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2A7CA5FFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 20:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eqvrFruQVGysPe04b1ZHJuuKGsH/PtmOxsv2cj3oH+Y=; b=q31BGsq6G8ZCXWkL9HGXHY4tkG
	177cM4V8uw58RgrGw8jM5Z/CCoMThWLD6Pg4njZJbaOJpbAeio6Eg6ZpLr/GKQUGJ7ySSPrqutkNE
	ZnfSR83ekRWDUi2qss7zkCLKq/8Km/u+49Qj6xIlzUZf0+1zfzLiJtqqL1hb8xcQTX/2sOMGM6tjn
	1Wo3w04FQxwiwaorfdlEH+2DRp60An8IuM3knBPcAbXwhAiuZZAj3DCNL6c99xCX1h+bPfOnxp11r
	fOsyO+auoq527pWJcYDehQGf8ztLNRQop5DOvrpQ86T+ZXwT+y9e6G8+x4yXX8KLCwZ1Xki05roXf
	1WPf3XZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvff-00000002or3-1UIb;
	Mon, 19 Jan 2026 20:16:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvfc-00000002oqx-3H5O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 20:16:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C368D600CB;
	Mon, 19 Jan 2026 20:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAB4C116C6;
	Mon, 19 Jan 2026 20:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768853775;
	bh=r+lnFo9qZeEary3vJZbx0ODSSfcyPTnIWTCVuJs92dg=;
	h=From:To:Cc:Subject:Date:From;
	b=LGFzFYKbYh/RKOtiPm/dKkJJeJuwcAn6CP0LXRZDFxW5oGtKMmf6b3DX5rnE6MkH1
	 88SrP2ZZcrykDp3fG+5O1Wl3MzvUgkldFeDIfsWlR22EgCBXj+CKKsqkhm+oLiHvSE
	 BXAAOPUZGnzSTLlsgf11jTPm/tSm0rOOhbaQxIebT1WI7DlxPXFu6ehD6PGX6DHUEG
	 w7FRDv5q0uiExGa8eOjKaxE74nX6d4LJmHzOjYhAkU8REmtrKxlVKtMAh56G2XUQNR
	 Y9IMKF/zqaQsEuPcVAKy63LVG8OXc3BB1obGOqEs0mJ2W/LWuQNng/kDSN8gkVkUcq
	 opQsxVN+umY7A==
From: Arnd Bergmann <arnd@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip: gic-v3-its: avoid truncating memory addresses
Date: Mon, 19 Jan 2026 21:15:12 +0100
Message-Id: <20260119201603.2713066-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On 32-bit machines with CONFIG_ARM_LPAE, it is possible for lowmem
allocations to be backed by addresses physical memory above the 32-bit
address limit, as I found while experimenting with larger VMSPLIT
configurations.

This caused the qemu virt model to crash in the GICv3 driver, which
allocates the 'itt' object using GFP_KERNEL. Since all memory below
the 4GB physical address limit is in ZONE_DMA in this configuration,
kmalloc defaults to higher addresses for ZONE_NORMAL, and the
its driver stores the physical address in a 32-bit 'unsigned long'
variable.

Change the itt_addr variable to the correct phys_addr_t type instead,
along with all other variables in this driver that hold a physical
address.

I checked the gicv5 driver for the same problem, and it correctly
uses u64 variables, while all other irqchip drivers don't call
virt_to_phys or similar interfaces. I expect other drivers to
have similar issues, but fixing this one is sufficient for
booting a virtio based guest.

Fixes: cc2d3216f53c ("irqchip: GICv3: ITS command queue")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/irqchip/irq-gic-v3-its.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index ada585bfa451..2988def30972 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -709,7 +709,7 @@ static struct its_collection *its_build_mapd_cmd(struct its_node *its,
 						 struct its_cmd_block *cmd,
 						 struct its_cmd_desc *desc)
 {
-	unsigned long itt_addr;
+	phys_addr_t itt_addr;
 	u8 size = ilog2(desc->its_mapd_cmd.dev->nr_ites);
 
 	itt_addr = virt_to_phys(desc->its_mapd_cmd.dev->itt);
@@ -879,7 +879,7 @@ static struct its_vpe *its_build_vmapp_cmd(struct its_node *its,
 					   struct its_cmd_desc *desc)
 {
 	struct its_vpe *vpe = valid_vpe(its, desc->its_vmapp_cmd.vpe);
-	unsigned long vpt_addr, vconf_addr;
+	phys_addr_t vpt_addr, vconf_addr;
 	u64 target;
 	bool alloc;
 
@@ -2477,10 +2477,10 @@ static int its_setup_baser(struct its_node *its, struct its_baser *baser,
 	baser->psz = psz;
 	tmp = indirect ? GITS_LVL1_ENTRY_SIZE : esz;
 
-	pr_info("ITS@%pa: allocated %d %s @%lx (%s, esz %d, psz %dK, shr %d)\n",
+	pr_info("ITS@%pa: allocated %d %s @%llx (%s, esz %d, psz %dK, shr %d)\n",
 		&its->phys_base, (int)(PAGE_ORDER_TO_SIZE(order) / (int)tmp),
 		its_base_type_string[type],
-		(unsigned long)virt_to_phys(base),
+		(u64)virt_to_phys(base),
 		indirect ? "indirect" : "flat", (int)esz,
 		psz / SZ_1K, (int)shr >> GITS_BASER_SHAREABILITY_SHIFT);
 
-- 
2.39.5


