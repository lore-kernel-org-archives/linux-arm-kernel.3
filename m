Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18A9CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 18:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=TyNYHbz9RzpuLXhlUnl5webp3KZC/SmVD8y8tlRVROA=; b=RYL+w35zUQHBFE
	QyZDYb2tZRilJDqrh5+lJZouz5aukt9jv5gDuvIvXtJu4a82aWXDoXdsDmAA1EO0itv2fX7jC1Lol
	8fsVARDSZwkWEbpy80cpUgAEsptGhvd1etDHq12oWgThuIZ1aGpblDaHcU4+kdXfWGL4KdrfGc992
	ZJfCY592GDYwJXIe/v6zkMsv4TfPEGxdqYMNjz8G+7AUfVrgxJFPflUWU67VZyjHgyUlbrHYQzhiB
	fOKayf13bKy/RZUAfand5457yXYFYkKRp39FHP+cIFDFe6Bi8GSAGiqJIY9cbQfpCGOIZTBFcB1o6
	IXug1s73JFiWoEd1y7bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbpX-0000000AunC-394F;
	Thu, 13 Nov 2025 18:13:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbpW-0000000Aun5-00pD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 18:13:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DAB3361CF4;
	Thu, 13 Nov 2025 18:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA55C4CEF8;
	Thu, 13 Nov 2025 18:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763057636;
	bh=hb/FO4V3eVHR2RnKCICg4vV3cwhuxn5dtsUG3W/ZL3w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=GAeXoZnD0ky14VG0Muy9qj0XgPiUQdXS28xi+Pffx6l3JTGDimfw4wLQYdkNGJWfL
	 sXR93nMF71w3TAo9+EmnuZlMAxnrWwMHA2m487LyCzfrfuLmzGwvvv85+N7GCzwrQ6
	 zjp9GfUAsoOMJbkfIdnIGw/pEvnnXvnvOVdAkuvfKy4WuQk0zQ7G6KrFG3TANGhVwn
	 J2fmk46Xbt87Zh4EaA6Jz5r0JbBndG1Gid5Wn2gW6DIniz9vh8iImKryaNDpRB2tb4
	 S1H3a+yGue1ulyQDH/0OtQcLxavnbA98/GjK+L98qek+0aXHthH2fdvxjVhc6ullZS
	 X3tfd5X2NPRTg==
Date: Thu, 13 Nov 2025 12:13:55 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Russell King <linux@armlinux.org.uk>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	christian.bruel@foss.st.com, krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com, shradha.t@samsung.com,
	thippeswamy.havalige@amd.com, inochiama@gmail.com,
	fan.ni@samsung.com, cassel@kernel.org, kishon@kernel.org,
	18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v5 4/4] PCI: keystone: Add support to build as a loadable
 module
Message-ID: <20251113181355.GA2293401@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029080547.1253757-5-s-vadapalli@ti.com>
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

[+to Russell, hook_fault_code() __init-ness]

On Wed, Oct 29, 2025 at 01:34:52PM +0530, Siddharth Vadapalli wrote:
> The 'pci-keystone.c' driver is the application/glue/wrapper driver for the
> Designware PCIe Controllers on TI SoCs. Now that all of the helper APIs
> that the 'pci-keystone.c' driver depends upon have been exported for use,
> enable support to build the driver as a loadable module.
> 
> Additionally, the functions marked by the '__init' keyword may be invoked:
> a) After a probe deferral
> OR
> b) During a delayed probe - Delay attributed to driver being built as a
>    loadable module
> 
> In both of the cases mentioned above, the '__init' memory will be freed
> before the functions are invoked. This results in an exception of the form:
> 
> 	Unable to handle kernel paging request at virtual address ...
> 	Mem abort info:
> 	...
> 	pc : ks_pcie_host_init+0x0/0x540
> 	lr : dw_pcie_host_init+0x170/0x498
> 	...
> 	ks_pcie_host_init+0x0/0x540 (P)
> 	ks_pcie_probe+0x728/0x84c
> 	platform_probe+0x5c/0x98
> 	really_probe+0xbc/0x29c
> 	__driver_probe_device+0x78/0x12c
> 	driver_probe_device+0xd8/0x15c
> 	...
> 
> To address this, introduce a new function namely 'ks_pcie_init()' to
> register the 'fault handler' while removing the '__init' keyword from
> existing functions.
> ...

> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -482,15 +482,21 @@ config PCI_DRA7XX_EP
>  	  to enable device-specific features PCI_DRA7XX_EP must be selected.
>  	  This uses the DesignWare core.
>  
> +# ARM32 platforms use hook_fault_code() and cannot support loadable module.
>  config PCI_KEYSTONE
>  	bool
>  
> +# On non-ARM32 platforms, loadable module can be supported.
> +config PCI_KEYSTONE_TRISTATE
> +	tristate
> +
>  config PCI_KEYSTONE_HOST
> -	bool "TI Keystone PCIe controller (host mode)"
> +	tristate "TI Keystone PCIe controller (host mode)"
>  	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
>  	depends on PCI_MSI
>  	select PCIE_DW_HOST
> -	select PCI_KEYSTONE
> +	select PCI_KEYSTONE if ARM
> +	select PCI_KEYSTONE_TRISTATE if !ARM

This is kind of a lot of dancing to make keystone built-in on ARM32
because hook_fault_code() is __init, while making it modular
everywhere else.

Is hook_fault_code() __init for some intrinsic reason?  All the
existing callers are __init, so that's one reason.  But could it be
made non-__init?

There are several drivers that use hook_fault_code() and could
potentially be modular (imx6, keystone, ixp4xx, rcar).

Bjorn

