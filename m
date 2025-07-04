Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAF5C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 04:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lu5UwG3gkU9yDfSYrynq/q3LHcvqLFRt2qUTkA3VXJ4=; b=xBe3f68K3ryWlBf5LTlFBeW5GX
	KHoBUY2Pq3aP4lm3Zi61VsqRQZiCdxJ9TXkwT3Qnw8diwgNF6C5UCADDnCL/5srSEXElDRnMYQ9EY
	2tL3Wp9mF1/KxGgM6Hq5+uDceQvuSGEyzAvRXhDDQCt9+It6Z/vuko/u2ptTXxjHi2zOOmbtUz4My
	ow1VCz4FqzuwI8m/Ebd9wVDgCVQDOgFUN8cUmkbiR6VKMwEey77b+f/Cqj+t87XooWhqCTd7ne/sv
	fL2Azvi3PQLTrObLSLGN1gNVax5yibNsW0cueh/dazXNsTnpqMqPKGEUYtjkOPRwLC/lG/OQ+0C+m
	+Gt/7aHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXY91-0000000DFtT-1xKx;
	Fri, 04 Jul 2025 04:35:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXY6f-0000000DFgF-1uGv;
	Fri, 04 Jul 2025 04:33:02 +0000
Date: Fri, 4 Jul 2025 06:32:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751603577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lu5UwG3gkU9yDfSYrynq/q3LHcvqLFRt2qUTkA3VXJ4=;
	b=ietRwSSaofHPYLX3xPHbQaRdwmhUvR0oG8Jl0ekizuf2VPs/EAlorh3boX28GKlEeceUNn
	VhpeW/GXutZoVkHxMSzLCoatSTmRx/nqXRYuTIyxAT0QqF9bqPjstMq67AaQvZd1qbGdVN
	X3N0QU6YDX0FoIUDwBw704MktK9Q7N+uT5gw7OJLt0Iv9w9AZx/MK2Rhh/rtKsPn7C2Omg
	kKxjyGuxpdrjagqrItkq6cwY+dflmv6h0qZ0LmPEmiJX7FIX7NZzYuK1i9xBimF3CYHdYI
	4GGQLFD6S5e3aP4UiR2M1E2S1J1Hq26eLabdb/UgzCr3SlmFRGh5AZbtW3kWUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751603577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lu5UwG3gkU9yDfSYrynq/q3LHcvqLFRt2qUTkA3VXJ4=;
	b=7fMAXDZLA+9VHQVCrhjUDQ7LNL/DeUPGCzycSMx6ONMfNd12NQ/irqPvP3F1XlTvENIrMK
	LKJgQV0TOcmWrbBA==
From: Nam Cao <namcao@linutronix.de>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Joyce Ooi <joyce.ooi@intel.com>, Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Michal Simek <michal.simek@amd.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 14/16] PCI: hv: Switch to msi_create_parent_irq_domain()
Message-ID: <20250704043255.JCK9HyRj@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
 <024f0122314198fe0a42fef01af53e8953a687ec.1750858083.git.namcao@linutronix.de>
 <SN6PR02MB4157A6F9B2ABD3C69CE5B521D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <87cyaht595.ffs@tglx>
 <SN6PR02MB41576745C28D8F49081B8E77D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <87zfdlrmvr.ffs@tglx>
 <SN6PR02MB41573141969F6B3028099C65D442A@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB41573141969F6B3028099C65D442A@SN6PR02MB4157.namprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_213301_640832_F7C7A2B0 
X-CRM114-Status: GOOD (  19.72  )
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

On Fri, Jul 04, 2025 at 02:27:01AM +0000, Michael Kelley wrote:
> I haven't resolved the conflict. As a shortcut for testing I just
> removed the conflicting patch since it is for a Microsoft custom NIC
> ("MANA") that's not in the configuration I'm testing with. I'll have to
> look more closely to figure out the resolution.
> 
> Separately, this patch (the switch to misc_create_parent_irq_domain)
> isn't working for Linux VMs on Hyper-V on ARM64. The initial symptom
> is that interrupts from the NVMe controller aren't getting handled
> and everything hangs. Here's the dmesg output:
> 
> [   84.463419] hv_vmbus: registering driver hv_pci
> [   84.463875] hv_pci abee639e-0b9d-49b7-9a07-c54ba8cd5734: PCI VMBus probing: Using version 0x10004
> [   84.464518] hv_pci abee639e-0b9d-49b7-9a07-c54ba8cd5734: PCI host bridge to bus 0b9d:00
> [   84.464529] pci_bus 0b9d:00: root bus resource [mem 0xfc0000000-0xfc00fffff window]
> [   84.464531] pci_bus 0b9d:00: No busn resource found for root bus, will use [bus 00-ff]
> [   84.465211] pci 0b9d:00:00.0: [1414:b111] type 00 class 0x010802 PCIe Endpoint
> [   84.466657] pci 0b9d:00:00.0: BAR 0 [mem 0xfc0000000-0xfc00fffff 64bit]
> [   84.481923] pci_bus 0b9d:00: busn_res: [bus 00-ff] end is updated to 00
> [   84.481936] pci 0b9d:00:00.0: BAR 0 [mem 0xfc0000000-0xfc00fffff 64bit]: assigned
> [   84.482413] nvme nvme0: pci function 0b9d:00:00.0
> [   84.482513] nvme 0b9d:00:00.0: enabling device (0000 -> 0002)
> [   84.556871] irq 17, desc: 00000000e8529819, depth: 0, count: 0, unhandled: 0
> [   84.556883] ->handle_irq():  0000000062fa78bc, handle_bad_irq+0x0/0x270
> [   84.556892] ->irq_data.chip(): 00000000ba07832f, 0xffff00011469dc30
> [   84.556895] ->action(): 0000000069f160b3
> [   84.556896] ->action->handler(): 00000000e15d8191, nvme_irq+0x0/0x3e8
> [  172.307920] watchdog: BUG: soft lockup - CPU#6 stuck for 26s! [kworker/6:1H:195]

Thanks for the report.

On arm64, this driver relies on the parent irq domain to set handler. So
the driver must not overwrite it to NULL.

This should cures it:

diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
index 3a24fadddb83..f4a435b0456c 100644
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -577,8 +577,6 @@ static void hv_pci_onchannelcallback(void *context);
 
 #ifdef CONFIG_X86
 #define DELIVERY_MODE	APIC_DELIVERY_MODE_FIXED
-#define FLOW_HANDLER	handle_edge_irq
-#define FLOW_NAME	"edge"
 
 static int hv_pci_irqchip_init(void)
 {
@@ -723,8 +721,6 @@ static void hv_arch_irq_unmask(struct irq_data *data)
 #define HV_PCI_MSI_SPI_START	64
 #define HV_PCI_MSI_SPI_NR	(1020 - HV_PCI_MSI_SPI_START)
 #define DELIVERY_MODE		0
-#define FLOW_HANDLER		NULL
-#define FLOW_NAME		NULL
 #define hv_msi_prepare		NULL
 
 struct hv_pci_chip_data {
@@ -2162,8 +2158,9 @@ static int hv_pcie_domain_alloc(struct irq_domain *d, unsigned int virq, unsigne
 		return ret;
 
 	for (int i = 0; i < nr_irqs; i++) {
-		irq_domain_set_info(d, virq + i, 0, &hv_msi_irq_chip, NULL, FLOW_HANDLER, NULL,
-				    FLOW_NAME);
+		irq_domain_set_hwirq_and_chip(d, virq + i, 0, &hv_msi_irq_chip, NULL);
+		if (IS_ENABLED(CONFIG_X86))
+			__irq_set_handler(virq + i, handle_edge_irq, 0, "edge");
 	}
 
 	return 0;

