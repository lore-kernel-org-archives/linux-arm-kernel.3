Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6C5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GcI66ARCVslKCfKQh7UMhWeoLZ8nJLsPjSDyirjyjs=; b=l/6varK/p5loqwxi02iNyJqEdz
	5HjF4x6jjjCV3hxkqU74gU+XLBp0esdXpXSnQDaTOVCy7MdWEoDiSNPgTYairxxtRx3tBRTtQWXrV
	FBe4XA46VdOsvYmDXLi9yz9dYLhNF+2c5p7Ph0zTcquQH6mOIv4KKf2roxqecYbq/cy7gnnCeIMkW
	ft8jJolFh3jzGTa9/r2pOMox3UaUSuO1K2vUsy00kMHtCG3nsKnEEI3hxfsCpBmpeh7ERmk3eXAAE
	CQSDMftbAxzP+i480n8TCuBKJqVV2p5stR3I5ghBwEdOhXDEKMIHZeopbch3HLK+mYfYATO446pTM
	FvflOTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiz5I-0000000Fc1h-3ST0;
	Fri, 14 Feb 2025 17:02:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiz3q-0000000Fbmc-2YZv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:01:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A5197A43265;
	Fri, 14 Feb 2025 16:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D099C4CED1;
	Fri, 14 Feb 2025 17:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739552465;
	bh=KieRTUcnMSc5WPsYxL5r2U6ULuh+BG887FXcKaW9vRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KLIZq1cEt6U8tRefMY+0psNcrbzgIJnk5h7tNh0e0/upu/T97sRhKjRjePL/YNXyd
	 9xmzwfFw2qnaA2USdGfA8IxfYvIa4sti7cjp2ffHtTgqy6MBl2JT05efegJbscwd8Y
	 dMhRu5hbhlJnQGBZvfTfTNgflyTgT0B6xEVjqFT+Ds3esMjbSSXfu0w5y4jM+/VIm0
	 AoS4MJK/zANf9LXjfHlhiTFeNmgFJD1ImM/Dbm4bq8EHmzs4k9stmg4ymjF40YBoH/
	 n74ls55wL9q2U6sYam+u83SDTWeSUfu0jJHwR2LXsIGU5T6JP42ZBtdHzM38E/iL1F
	 ZwZw1gYSNpPAw==
Date: Fri, 14 Feb 2025 22:30:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bo Sun <Bo.Sun.CN@windriver.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kexin.Hao@windriver.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH] PCI: controller: Restore PCI_REASSIGN_ALL_BUS when
 PCI_PROBE_ONLY is enabled
Message-ID: <20250214170057.o3ffoiuxn4hxqqqe@thinkpad>
References: <20250117082428.129353-1-Bo.Sun.CN@windriver.com>
 <20250210103707.c5ubeaowk7xwt6p5@thinkpad>
 <df5d3c54-d436-43bb-8b40-665c020d6bb5@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df5d3c54-d436-43bb-8b40-665c020d6bb5@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_090106_777458_BB22924F 
X-CRM114-Status: GOOD (  37.78  )
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

On Wed, Feb 12, 2025 at 03:07:56PM +0800, Bo Sun wrote:
> On 2/10/25 18:37, Manivannan Sadhasivam wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > 
> > On Fri, Jan 17, 2025 at 04:24:14PM +0800, Bo Sun wrote:
> > > On our Marvell OCTEON CN96XX board, we observed the following panic on
> > > the latest kernel:
> > > Unable to handle kernel NULL pointer dereference at virtual address 0000000000000080
> > > Mem abort info:
> > >    ESR = 0x0000000096000005
> > >    EC = 0x25: DABT (current EL), IL = 32 bits
> > >    SET = 0, FnV = 0
> > >    EA = 0, S1PTW = 0
> > >    FSC = 0x05: level 1 translation fault
> > > Data abort info:
> > >    ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
> > >    CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> > >    GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > > [0000000000000080] user address but active_mm is swapper
> > > Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
> > > Modules linked in:
> > > CPU: 9 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7-00149-g9bffa1ad25b8 #1
> > > Hardware name: Marvell OcteonTX CN96XX board (DT)
> > > pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > pc : of_pci_add_properties+0x278/0x4c8
> > > lr : of_pci_add_properties+0x258/0x4c8
> > > sp : ffff8000822ef9b0
> > > x29: ffff8000822ef9b0 x28: ffff000106dd8000 x27: ffff800081bc3b30
> > > x26: ffff800081540118 x25: ffff8000813d2be0 x24: 0000000000000000
> > > x23: ffff00010528a800 x22: ffff000107c50000 x21: ffff0001039c2630
> > > x20: ffff0001039c2630 x19: 0000000000000000 x18: ffffffffffffffff
> > > x17: 00000000a49c1b85 x16: 0000000084c07b58 x15: ffff000103a10f98
> > > x14: ffffffffffffffff x13: ffff000103a10f96 x12: 0000000000000003
> > > x11: 0101010101010101 x10: 000000000000002c x9 : ffff800080ca7acc
> > > x8 : ffff0001038fd900 x7 : 0000000000000000 x6 : 0000000000696370
> > > x5 : 0000000000000000 x4 : 0000000000000002 x3 : ffff8000822efa40
> > > x2 : ffff800081341000 x1 : ffff000107c50000 x0 : 0000000000000000
> > > Call trace:
> > >   of_pci_add_properties+0x278/0x4c8 (P)
> > >   of_pci_make_dev_node+0xe0/0x158
> > >   pci_bus_add_device+0x158/0x210
> > >   pci_bus_add_devices+0x40/0x98
> > >   pci_host_probe+0x94/0x118
> > >   pci_host_common_probe+0x120/0x1a0
> > >   platform_probe+0x70/0xf0
> > >   really_probe+0xb4/0x2a8
> > >   __driver_probe_device+0x80/0x140
> > >   driver_probe_device+0x48/0x170
> > >   __driver_attach+0x9c/0x1b0
> > >   bus_for_each_dev+0x7c/0xe8
> > >   driver_attach+0x2c/0x40
> > >   bus_add_driver+0xec/0x218
> > >   driver_register+0x68/0x138
> > >   __platform_driver_register+0x2c/0x40
> > >   gen_pci_driver_init+0x24/0x38
> > >   do_one_initcall+0x4c/0x278
> > >   kernel_init_freeable+0x1f4/0x3d0
> > >   kernel_init+0x28/0x1f0
> > >   ret_from_fork+0x10/0x20
> > > Code: aa1603e1 f0005522 d2800044 91000042 (f94040a0)
> > > 
> > > This regression was introduced by commit 7246a4520b4b ("PCI: Use
> > > preserve_config in place of pci_flags"). On our board, the 002:00:07.0
> > > bridge is misconfigured by the bootloader. Both its secondary and
> > > subordinate bus numbers are initialized to 0, while its fixed secondary
> > > bus number is set to 8.
> > 
> > What do you mean by 'fixed secondary bus number'?
> > 
> 
> The 'fixed secondary bus number' refers to the value returned by the
> function pci_ea_fixed_busnrs(), which reads the fixed Secondary and
> Subordinate bus numbers from the EA (Extended Attributes) capability, if
> present.

Thanks! It'd be good to mention the EA capability.

> In the code at drivers/pci/probe.c, line 1439, we have the
> following:
> 
> 		/* Read bus numbers from EA Capability (if present) */
> 		fixed_buses = pci_ea_fixed_busnrs(dev, &fixed_sec, &fixed_sub);
> 		if (fixed_buses)
> 			next_busnr = fixed_sec;
> 		else
> 			next_busnr = max + 1;
> 
> > > However, bus number 8 is also assigned to another
> > > bridge (0002:00:0f.0). Although this is a bootloader issue, before the
> > > change in commit 7246a4520b4b, the PCI_REASSIGN_ALL_BUS flag was
> > > set by default when PCI_PROBE_ONLY was enabled, ensuing that all the
> > > bus number for these bridges were reassigned, avoiding any conflicts.
> > > 
> > 
> > Isn't the opposite? PCI_REASSIGN_ALL_BUS was only added if the PCI_PROBE_ONLY
> > flag was not set:
> > 
> >          /* Do not reassign resources if probe only */
> >          if (!pci_has_flag(PCI_PROBE_ONLY))
> >                  pci_add_flags(PCI_REASSIGN_ALL_BUS);
> > 
> 
> Yes, you are correct. It’s a typo; it should be "when PCI_PROBE_ONLY was not
> enabled." I will fix this in v2.
> 
> > 
> > > After the change introduced in commit 7246a4520b4b, the bus numbers
> > > assigned by the bootloader are reused by all other bridges, except
> > > the misconfigured 002:00:07.0 bridge. The kernel attempt to reconfigure
> > > 002:00:07.0 by reusing the fixed secondary bus number 8 assigned by
> > > bootloader. However, since a pci_bus has already been allocated for
> > > bus 8 due to the probe of 0002:00:0f.0, no new pci_bus allocated for
> > > 002:00:07.0.
> > 
> > How come 0002:00:0f.0 is enumerated before 0002:00:07.0 in a depth first manner?
> > 
> 
> The device 0002:00:07.0 is actually enumerated before 0002:00:0f.0, but it
> appears misconfigured. The kernel attempts to reconfigure it during
> initialization, which is where the issue arises.
> 

Ok, thanks for the clarification. I think the bug is in this part of the code:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/probe.c#n1451

It just reuses the fixed bus number even if the bus already exists, which is
wrong. I think this should be fixed by evaluating the bus number read from EA
capability as below:

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index b6536ed599c3..097e2a01faae 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1438,10 +1438,21 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
 
                /* Read bus numbers from EA Capability (if present) */
                fixed_buses = pci_ea_fixed_busnrs(dev, &fixed_sec, &fixed_sub);
-               if (fixed_buses)
-                       next_busnr = fixed_sec;
-               else
+               if (fixed_buses) {
+                       /*
+                        * If the fixed bus number is already taken, use the
+                        * next available bus number. This can happen if the
+                        * bootloader has assigned a wrong bus number in EA
+                        * capability of the bridge.
+                        */
+                       child = pci_find_bus(pci_domain_nr(bus), fixed_sec);
+                       if (child)
+                               next_busnr = max + 1;
+                       else
+                               next_busnr = fixed_sec;
+               } else {
                        next_busnr = max + 1;
+               }
 
                /*
                 * Prevent assigning a bus number that already exists.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

