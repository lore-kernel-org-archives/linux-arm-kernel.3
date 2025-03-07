Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A575BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 18:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=8+TKCxbwqJes92lMhlLHImc+PLCTPhiFwxlQPXUvOgI=; b=d4F3jd5YAFb0Q7
	GJnH7n4c0Y62FemFk564INYgumN14ktZh/PrA72pGaZFFG2kB33sWkUXAoA4fnUGcZB+48PobRmkf
	3D9u8DrFKsshq6I1wO6JunB9XqfFysvqDRds34pYe3G8qf3G6B46guwyCZtstyJDveem+lqBMSRIF
	lqblSGblzQCQiqMPOd/lB4k1F9zaeK+KoSaWU9LLSBGMO+EtWN7a7/vU7JgtO7CwRbLEe6Edu+RIz
	qxoJ4GRIbMDxRXL9qEa953hMtISFnkI+wbOgb/1fRJXbR7rNpInh8J7JBVgBCs0HiPTysbNDFK55/
	rW73ShzaZ4+bfF2jkNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcLS-0000000FCvH-0aqz;
	Fri, 07 Mar 2025 18:22:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqc9a-0000000FB0h-3r1t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 18:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A1BBA44FD4;
	Fri,  7 Mar 2025 18:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4F4C4CED1;
	Fri,  7 Mar 2025 18:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741371033;
	bh=K0tUHzI8OKoRWIYQDOa+2EnNYsctDP70uHmCUK0x8Lg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=GpUHJXI5ChlPy4F4Qj5hYF3elWoaO75TPl7SfEi95HPOJBnGZQiJXI8pMvY+zQgV+
	 fvprYE46QUNt/pXyO0IKJpu+DO2xx+l5Gcgdmr6OCNL3da/9KVfg4n6PcQmtj2f+BM
	 QOhFt6Yu+ia8iH/5m71pmGiHTNotcU7oqXA1+Hl0PKfsEVfOaVM6LCj3G/kLwGdGBE
	 gs6jrXQWNSeRvYD2dpkl24B1+gtnAJY7NbwNgdEW8BN/F2KgfN6XP1V2QWDG21rqm+
	 fAmIcyVbImlBT3BdvG4yALqj9sEVmaFgdfNp6OgJuFHUhZMhG+Z2/pC54LsZ7r5UTE
	 NfgPW8pP7TvdA==
Date: Fri, 7 Mar 2025 12:10:32 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Bo Sun <Bo.Sun.CN@windriver.com>
Cc: Kexin.Hao@windriver.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH] PCI: controller: Restore PCI_REASSIGN_ALL_BUS when
 PCI_PROBE_ONLY is enabled
Message-ID: <20250307181032.GA416164@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117082428.129353-1-Bo.Sun.CN@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_101035_129323_BEBCBA7A 
X-CRM114-Status: GOOD (  30.18  )
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

On Fri, Jan 17, 2025 at 04:24:14PM +0800, Bo Sun wrote:
> On our Marvell OCTEON CN96XX board, we observed the following panic on
> the latest kernel:
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000080
> Mem abort info:
>   ESR = 0x0000000096000005
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
>   FSC = 0x05: level 1 translation fault
> Data abort info:
>   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [0000000000000080] user address but active_mm is swapper
> Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
> Modules linked in:
> CPU: 9 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7-00149-g9bffa1ad25b8 #1
> Hardware name: Marvell OcteonTX CN96XX board (DT)
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : of_pci_add_properties+0x278/0x4c8
> lr : of_pci_add_properties+0x258/0x4c8
> sp : ffff8000822ef9b0
> x29: ffff8000822ef9b0 x28: ffff000106dd8000 x27: ffff800081bc3b30
> x26: ffff800081540118 x25: ffff8000813d2be0 x24: 0000000000000000
> x23: ffff00010528a800 x22: ffff000107c50000 x21: ffff0001039c2630
> x20: ffff0001039c2630 x19: 0000000000000000 x18: ffffffffffffffff
> x17: 00000000a49c1b85 x16: 0000000084c07b58 x15: ffff000103a10f98
> x14: ffffffffffffffff x13: ffff000103a10f96 x12: 0000000000000003
> x11: 0101010101010101 x10: 000000000000002c x9 : ffff800080ca7acc
> x8 : ffff0001038fd900 x7 : 0000000000000000 x6 : 0000000000696370
> x5 : 0000000000000000 x4 : 0000000000000002 x3 : ffff8000822efa40
> x2 : ffff800081341000 x1 : ffff000107c50000 x0 : 0000000000000000
> Call trace:
>  of_pci_add_properties+0x278/0x4c8 (P)
>  of_pci_make_dev_node+0xe0/0x158
>  pci_bus_add_device+0x158/0x210
>  pci_bus_add_devices+0x40/0x98
>  pci_host_probe+0x94/0x118
>  pci_host_common_probe+0x120/0x1a0
>  platform_probe+0x70/0xf0
>  really_probe+0xb4/0x2a8
>  __driver_probe_device+0x80/0x140
>  driver_probe_device+0x48/0x170
>  __driver_attach+0x9c/0x1b0
>  bus_for_each_dev+0x7c/0xe8
>  driver_attach+0x2c/0x40
>  bus_add_driver+0xec/0x218
>  driver_register+0x68/0x138
>  __platform_driver_register+0x2c/0x40
>  gen_pci_driver_init+0x24/0x38
>  do_one_initcall+0x4c/0x278
>  kernel_init_freeable+0x1f4/0x3d0
>  kernel_init+0x28/0x1f0
>  ret_from_fork+0x10/0x20
> Code: aa1603e1 f0005522 d2800044 91000042 (f94040a0)
> 
> This regression was introduced by commit 7246a4520b4b ("PCI: Use
> preserve_config in place of pci_flags"). On our board, the 002:00:07.0
> bridge is misconfigured by the bootloader. Both its secondary and
> subordinate bus numbers are initialized to 0, while its fixed secondary
> bus number is set to 8. However, bus number 8 is also assigned to another
> bridge (0002:00:0f.0). Although this is a bootloader issue, before the
> change in commit 7246a4520b4b, the PCI_REASSIGN_ALL_BUS flag was
> set by default when PCI_PROBE_ONLY was enabled, ensuing that all the
> bus number for these bridges were reassigned, avoiding any conflicts.
> 
> After the change introduced in commit 7246a4520b4b, the bus numbers
> assigned by the bootloader are reused by all other bridges, except
> the misconfigured 002:00:07.0 bridge. The kernel attempt to reconfigure
> 002:00:07.0 by reusing the fixed secondary bus number 8 assigned by
> bootloader. However, since a pci_bus has already been allocated for
> bus 8 due to the probe of 0002:00:0f.0, no new pci_bus allocated for
> 002:00:07.0. This results in a pci bridge device without a pci_bus
> attached (pdev->subordinate == NULL). Consequently, accessing
> pdev->subordinate in of_pci_prop_bus_range() leads to a NULL pointer
> dereference.
> 
> To summarize, we need to restore the PCI_REASSIGN_ALL_BUS flag when
> PCI_PROBE_ONLY is enabled in order to work around issue like the one
> described above.

When you send v2,

  - Thanks for including the panic info above, but I think you can
    remove most of it while preserving the essential details.  E.g., I
    think the "NULL pointer dereference", kernel version, pc, and a
    couple call trace entries would be enough.

  - "002:00:07.0" is not a valid address (in dmesg log, domain would
    be 4 hex digits).  Perhaps quote relevant dmesg lines directly,
    showing the secondary bus info for these bridges.

  - I think it's a little sketchy that of_pci_add_properties() and
    of_pci_prop_bus_range() assume a valid secondary bus, even if this
    patch avoids that situation in this case.  There are always
    potential cases where we don't have bus numbers to assign for a
    secondary bus.  I think we should check, maybe by omitting
    'bus-range' if there is no secondary bus.

  - This might lead to two patches: (1) to fix the regression that we
    used to set PCI_REASSIGN_ALL_BUS but 7246a4520b4b broke that, and
    (2) avoid the of_pci_prop_bus_range() NULL pointer dereference in
    all cases.

> Cc: stable@vger.kernel.org
> Fixes: 7246a4520b4b ("PCI: Use preserve_config in place of pci_flags")
> Signed-off-by: Bo Sun <Bo.Sun.CN@windriver.com>
> ---
>  drivers/pci/controller/pci-host-common.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index cf5f59a745b3..615923acbc3e 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -73,6 +73,10 @@ int pci_host_common_probe(struct platform_device *pdev)
>  	if (IS_ERR(cfg))
>  		return PTR_ERR(cfg);
>  
> +	/* Do not reassign resources if probe only */
> +	if (!pci_has_flag(PCI_PROBE_ONLY))
> +		pci_add_flags(PCI_REASSIGN_ALL_BUS);
> +
>  	bridge->sysdata = cfg;
>  	bridge->ops = (struct pci_ops *)&ops->pci_ops;
>  	bridge->msi_domain = true;
> -- 
> 2.48.1
> 

