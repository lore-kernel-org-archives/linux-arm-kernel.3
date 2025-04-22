Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF059C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jJR9QqmEc7EQRL7oex1oBfoNYzs9OAtC+hHL/PNDRHg=; b=b8UT4Aq2p+Cz8C0oUEeaeJaCXM
	3qab5f20U+N+Qupxl6VK3EwLXdndmek4fceXM21PpUuW50oFL89OFb0CA50qrSxQ3vrkECXtEdvhi
	cAPMcdtBSpVcw8CGVegOEnhuhOT6DcA4j4r0QyyQFW5U8NRKyGFuTpnsl8AityMLxM4iCq8qEGidP
	994xNQAHpLjkhvm5k7TfRYZhwlCUTqOnVYrrgds65ft1lJo9U6t1O3fYt6fBmF9pGq8iOVPck9giD
	09ckFjgyQ1eBV19qtDexBrqGxNi/wR/bRvuf/hPDkxZ6/hu61dFUhhXI6v2IpmeEusJJZ7IN2LQ10
	e4RAmbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7IJd-00000008A8N-27QG;
	Tue, 22 Apr 2025 18:25:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GIR-00000007rpU-1U7y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 16:16:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F03A152B;
	Tue, 22 Apr 2025 09:16:24 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A9333F66E;
	Tue, 22 Apr 2025 09:16:27 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: lpieralisi@kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>
Subject: [PATCH] irqchip: gicv2m: Fix use after free of gicv2m_get_fwnode
Date: Tue, 22 Apr 2025 17:16:16 +0100
Message-ID: <20250422161616.1584405-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_091631_480620_9542E106 
X-CRM114-Status: GOOD (  13.66  )
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

With ACPI in place, we register gicv2m_get_fwnode with the pci subsystem as
pci_msi_get_fwnode_cb, which may get invoked at runtime during a PCI host bridge
probe. But, the call back is wrongly marked as __init, causing it to be freed,
while being registered with the PCI subsystem and could trigger:

 Unable to handle kernel paging request at virtual address ffff8000816c0400
 Mem abort info:
   ESR = 0x0000000086000007
   EC = 0x21: IABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x07: level 3 translation fault
 swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000000f2c7d000
 pgd=10000000f3a0a003, p4d=10000000f3a0a003, pud=10000000f3a0b003, pmd=10000000f3a0e003, pte=0000000000000000
 PREEMPT SMP
 Modules linked in: devsec_bus(+) devsec_common
 CPU: 5 UID: 0 PID: 387 Comm: modprobe Not tainted 6.14.0-rc6+ #1686
 Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform, BIOS EDK II Feb  1 2019
 pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : gicv2m_get_fwnode+0x0/0x58
 lr : pci_host_bridge_acpi_msi_domain+0x38/0xa0
 sp : ffff800083453640
 x29: ffff800083453640 x28: 0000000000000000 x27: ffff00080443b010
 x26: ffff0008044b0000 x25: fffffff000000000 x24: ffff00080443b720
 x23: ffff00080443b800 x22: ffff00080443b010 x21: ffff800083453748
 x20: ffff000806d56000 x19: ffff000806d56000 x18: 0000000000000030
 x17: 6f6674616c703d4d x16: 4554535953425553 x15: 00000000ffffffff
 x14: ffff00080110009c x13: 0000000000000002 x12: ffff00080110009a
 x11: 0000000000000040 x10: 0000000000000000 x9 : ffff800080792de4
 x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : 5e646c68736d7471
 x5 : ffff00080443b438 x4 : ffff00080443b438 x3 : 0000000000000000
 x2 : ffff8000816c0400 x1 : ffff0008011a3480 x0 : ffff000806d56120
 Call trace:
  gicv2m_get_fwnode+0x0/0x58 (P)
  pci_set_bus_msi_domain+0x74/0x88
  pci_register_host_bridge+0x194/0x548
  devsec_bus_probe+0x410/0xf28 [devsec_bus]
  platform_probe+0x70/0xe8
  really_probe+0xc4/0x2b0
  __driver_probe_device+0x80/0x140
  driver_probe_device+0xe4/0x170
  __driver_attach+0x9c/0x1b0
  bus_for_each_dev+0x7c/0xe8
  driver_attach+0x2c/0x40
  bus_add_driver+0xec/0x218
  driver_register+0x68/0x138
  __platform_driver_probe+0x5c/0xe8
  devsec_bus_init+0x88/0xd0 [devsec_bus]
  do_one_initcall+0x4c/0x280
  do_init_module+0x60/0x230
  load_module+0x1ce8/0x1dd8
  init_module_from_file+0x90/0xd8

Retain the function for later use. Easily recreated with [1], on Juno board with
ACPI boot.

[1] https://lkml.kernel.org/r/68053cf43bb54_7205294cc@dwillia2-xfh.jf.intel.com.notmuch

Fixes: 0644b3daca28 ("irqchip/gic-v2m: acpi: Introducing GICv2m ACPI support")
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
I am not sure if this needs to goto stable, nobody seems to have hit this ? But hey
it doesn't hurt.
---
 drivers/irqchip/irq-gic-v2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index be35c5349986..a1e370d0200f 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -423,7 +423,7 @@ static int __init gicv2m_of_init(struct fwnode_handle *parent_handle,
 #ifdef CONFIG_ACPI
 static int acpi_num_msi;
 
-static __init struct fwnode_handle *gicv2m_get_fwnode(struct device *dev)
+static struct fwnode_handle *gicv2m_get_fwnode(struct device *dev)
 {
 	struct v2m_data *data;
 
-- 
2.43.0


