Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF020CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 08:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r25Q9Alp7AxSK7D6kzCWKANt/nvWwY0AVOWxEJvna8s=; b=DlsXrGlteFQNCK8IcMK/X65FbB
	mnzz3xiBUiT+T32aGzDx064Fb2mSojcSJlEB2h7LRhOAsFH4nf2v3OtaDdAgRHPGdcjevJ9YIkxUN
	Ap9sJpmE50NatquBr/yFD/P6GLnyctOYk8vMnpCPs2k1A7btyR/pxwDoci8sXF/TCBdKFysvsxIxs
	dScH4r9B1cw8zUq8xHC/wNcJek1CphCCYxumhx7D7bRhlp2jdkrycD4RCdRmzYQlOtZFinsgL5rTa
	wcTp94u3eVZsTgYSAAgfaw9AiKHpfu7J1GmnhxpxV0+vohE/gh2jPLzWoX2djwgmq5jvaMrdxeJUP
	rB6nxeqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGuvB-0000000F27F-0RPu;
	Thu, 06 Nov 2025 08:00:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGuv7-0000000F26j-4Amm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 08:00:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5F5960054;
	Thu,  6 Nov 2025 08:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5C6C116B1;
	Thu,  6 Nov 2025 08:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762416036;
	bh=PLqcEO+B1iuZyJH4xuffVGT1SLh3xxFVImhSKds5ULI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IES7uTpyPEkkRiOUjwLcBpEsMO/CcNeHwg7qBFVlLUwYjAXspO4FsbZ5803f4H2ZX
	 ye5+3SajpM3RROc/vFVV7Wbqw3U3E5uLIk/b8vyx4GM+XB9nj42xgBZXk6ffFjMkVE
	 cNixwAF7eXdhI8Lm1x9PNr09vEPKxsxORKLphy0g81x0SJj/zyyn03wAIkBbKjKbrt
	 UanAVNdqm8WZqqhTOV3FiEBI1QbvWq8975fPGkOJfFiVwSiS9QDklFioT8e+E0iDQ+
	 NcXZ79xngaNx+pbWLFLS8go/NrLG68kRDAyuYZdoekR5ZjINljH+Q0srwfZThd99et
	 /NK0JJ4EeSqKg==
Date: Thu, 6 Nov 2025 13:30:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, christian.bruel@foss.st.com, 
	krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com, shradha.t@samsung.com, 
	thippeswamy.havalige@amd.com, inochiama@gmail.com, fan.ni@samsung.com, cassel@kernel.org, 
	kishon@kernel.org, 18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v5 4/4] PCI: keystone: Add support to build as a loadable
 module
Message-ID: <grouefwty7ub7xipgxyiph7dumtvoprcdsuq4f6d73pzpqu7pm@rdivadcdcyfy>
References: <20251029080547.1253757-1-s-vadapalli@ti.com>
 <20251029080547.1253757-5-s-vadapalli@ti.com>
 <fkzokskbjklt6atqrpwc46zsjr5ptpuynzhx4kvfurr4h37kae@rwcqljsjvzl6>
 <d65f44cac2d7fb6c4a139065b304cb4ab790acb3.camel@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d65f44cac2d7fb6c4a139065b304cb4ab790acb3.camel@ti.com>
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

On Thu, Nov 06, 2025 at 12:31:08PM +0530, Siddharth Vadapalli wrote:
> On Wed, 2025-11-05 at 22:53 +0530, Manivannan Sadhasivam wrote:
> > On Wed, Oct 29, 2025 at 01:34:52PM +0530, Siddharth Vadapalli wrote:
> > > The 'pci-keystone.c' driver is the application/glue/wrapper driver for the
> > > Designware PCIe Controllers on TI SoCs. Now that all of the helper APIs
> > > that the 'pci-keystone.c' driver depends upon have been exported for use,
> > > enable support to build the driver as a loadable module.
> > > 
> > > Additionally, the functions marked by the '__init' keyword may be invoked:
> > > a) After a probe deferral
> > > OR
> > > b) During a delayed probe - Delay attributed to driver being built as a
> > >    loadable module
> > > 
> > > In both of the cases mentioned above, the '__init' memory will be freed
> > > before the functions are invoked. This results in an exception of the form:
> > > 
> > > 	Unable to handle kernel paging request at virtual address ...
> > > 	Mem abort info:
> > > 	...
> > > 	pc : ks_pcie_host_init+0x0/0x540
> > > 	lr : dw_pcie_host_init+0x170/0x498
> > > 	...
> > > 	ks_pcie_host_init+0x0/0x540 (P)
> > > 	ks_pcie_probe+0x728/0x84c
> > > 	platform_probe+0x5c/0x98
> > > 	really_probe+0xbc/0x29c
> > > 	__driver_probe_device+0x78/0x12c
> > > 	driver_probe_device+0xd8/0x15c
> > > 	...
> > > 
> > > To address this, introduce a new function namely 'ks_pcie_init()' to
> > > register the 'fault handler' while removing the '__init' keyword from
> > > existing functions.
> > > 
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > ---
> > > 
> > > v4:
> > > https://lore.kernel.org/r/20251022095724.997218-5-s-vadapalli@ti.com/
> > > Changes since v4:
> > > - To fix the build error on ARM32 platforms as reported at:
> > >   https://lore.kernel.org/r/202510281008.jw19XuyP-lkp@intel.com/
> > >   patch 4 in the series has been updated by introducing a new config
> > >   named "PCI_KEYSTONE_TRISTATE" which allows building the driver as
> > >   a loadable module. Additionally, this newly introduced config can
> > >   be enabled only for non-ARM32 platforms. As a result, ARM32 platforms
> > >   continue using the existing PCI_KEYSTONE config which is a bool, while
> > >   ARM64 platforms can use PCI_KEYSTONE_TRISTATE which is a tristate, and
> > >   can optionally enabled loadable module support being enabled by this
> > >   series.
> > > 
> > > Regards,
> > > Siddharth.
> > > 
> > >  drivers/pci/controller/dwc/Kconfig        | 15 +++--
> > >  drivers/pci/controller/dwc/Makefile       |  3 +
> > >  drivers/pci/controller/dwc/pci-keystone.c | 78 +++++++++++++----------
> > >  3 files changed, 59 insertions(+), 37 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > > index 349d4657393c..c5bc2f0b1f39 100644
> > > --- a/drivers/pci/controller/dwc/Kconfig
> > > +++ b/drivers/pci/controller/dwc/Kconfig
> > > @@ -482,15 +482,21 @@ config PCI_DRA7XX_EP
> > >  	  to enable device-specific features PCI_DRA7XX_EP must be selected.
> > >  	  This uses the DesignWare core.
> > >  
> > > +# ARM32 platforms use hook_fault_code() and cannot support loadable module.
> > >  config PCI_KEYSTONE
> > >  	bool
> > >  
> > > +# On non-ARM32 platforms, loadable module can be supported.
> > > +config PCI_KEYSTONE_TRISTATE
> > > +	tristate
> > > +
> > >  config PCI_KEYSTONE_HOST
> > > -	bool "TI Keystone PCIe controller (host mode)"
> > > +	tristate "TI Keystone PCIe controller (host mode)"
> > >  	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
> > >  	depends on PCI_MSI
> > >  	select PCIE_DW_HOST
> > > -	select PCI_KEYSTONE
> > > +	select PCI_KEYSTONE if ARM
> > > +	select PCI_KEYSTONE_TRISTATE if !ARM
> > 
> > Wouldn't below change work for you?
> > 
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index 349d4657393c..b1219e7136c9 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -486,8 +486,9 @@ config PCI_KEYSTONE
> >         bool
> >  
> >  config PCI_KEYSTONE_HOST
> > -       bool "TI Keystone PCIe controller (host mode)"
> > +       tristate "TI Keystone PCIe controller (host mode)"
> 
> This doesn't alter the build of the pci-keystone.c driver. From the
> existing Makefile, we have:
>  obj-$(CONFIG_PCI_KEYSTONE) += pci-keystone.o
> implying that it is only CONFIG_PCI_KEYSTONE that determines whether the
> pci-keystone.c driver is built as a loadable module or a built-in module.
> 

Ah, I missed the fact that PCI_KEYSTONE_HOST is just used inside the driver and
not in the Makefile.

> >         depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
> > +       default y if ARCH_KEYSTONE
> 
> The default flag only specifies what should be selected by default, but it
> doesn't prevent the user from attempting to built it as a loadable module
> using menuconfig. Building the pci-keystone.c driver as a loadable module
> (CONFIG_PCI_KEYSTONE set to 'm') will cause build errors for ARM32
> platforms due to the presence of hook_fault_code() which is __init code.
> 
> The Kconfig and Makefile changes made by the patch do the following:
> 1. Allow building the pci-keystone.c driver as a loadable module for non-
> ARM32 platforms by introducing the PCI_KEYSTONE_TRISTATE config which is a
> tristate unlike the existing PCI_KEYSTONE config which is a bool.
> 2. Associate PCI_KEYSTONE with ARM32 platforms and associate
> PCI_KEYSTONE_TRISTATE with non-ARM32 platforms to prevent users from
> building the pci-keystone.c driver as a loadable module for ARM32
> platforms.
> 

Ok. I don't have a better solution to this problem. So fine with me.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

