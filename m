Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7278AC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=a4rOkj+8ODiN6aFJOkrpJ5u9uUZgS6Ohizq3fPpH08s=; b=gflOojQcrXB2al
	UVRgzJrobK2D+IkeWQ6nJBNV8+JaDZjk7lICOZxsDGHnjWRw4Ce5+d7X/8dEj4EvbeY0Laerko66K
	4HeKRBAuCXUldP86fJof7psOlyYR18WJb29qxM81UDlHoSLyEEDHAefkOQwsT+FoxUH0kgBCfGgVT
	lp204uK11UigyxXK8OjAPJiiptWtZ/zd9Xka24cEIpPJ8yEUP/iXo6R14cxaG3LIJ/wmhDVDopQHl
	jtFhP6mqhdYY0KX6bQIeM9kBbQIGYS3Ckr8r9/9eVIgeUNumNNMKg/m2B/irJmtTjr9qEhkQtzElc
	AthN9qBu2xGnBOdxzCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XKi-00000007gEi-4AB3;
	Wed, 09 Apr 2025 15:27:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XBc-00000007e6O-3oOU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 15:17:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 912AC61127;
	Wed,  9 Apr 2025 15:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3CEC4CEE2;
	Wed,  9 Apr 2025 15:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744211876;
	bh=B6CnZZxOmRj9WjoB7zj7+BLt3gdS8mqjcbG4sbdSz5k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZudEVGyVTVqKJEXjfUOMN0q53Rs+fb13Tyxnu5nKHUFpP5TjefHF4RyfHZM37oiJJ
	 UceMCe6PkFwazZdBel2mQOUdPca4uD6UVROcd7d8f1vtTmheTsaSrT4EtIWm3VcAcb
	 VVD7GQWgIC+ik/IS36cIuxepH8887a/8oGw/05u1+mJaqv1FoXhjHJOMaMOLPAqxXn
	 o7HwhF8ncBwsZZkoG+2nLTPyTVA+S6r9CAXkFIxDLgZ8pdM58/3qdhpzOsjnkxgNxy
	 /ZaDUlnwEHRNOAUb3Od2Al/G8bGB1kxsGdiM9rgJ3wIh+SibyOfiglTRJebyEIToCh
	 1bIzHBi1eRplQ==
Date: Wed, 9 Apr 2025 10:17:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] pcie-xilinx: Wait for link-up status during
 initialization
Message-ID: <20250409151754.GA283974@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409144930.10402-1-mike.looijmans@topic.nl>
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

Please make the subject line match previous changes to this driver.
See "git log --oneline drivers/pci/controller/pcie-xilinx.c"

On Wed, Apr 09, 2025 at 04:49:24PM +0200, Mike Looijmans wrote:
> When the driver loads, the transceiver may still be in the state of
> setting up a link. Wait for that to complete before continuing. This
> fixes that the PCIe core does not work when loading the PL bitstream
> from userspace. There's only milliseconds between the FPGA boot and the
> core initializing in that case, and the link won't be up yet. The design
> only worked when the FPGA was programmed in the bootloader, as that will
> give the system hundreds of milliseconds to boot.
> 
> As the PCIe spec allows up to 100 ms time to establish a link, we'll
> allow up to 200ms before giving up.

This sounds like there's still a race between userspace loading the PL
bitstream and the driver waiting for link up, but we're just waiting
longer in the kernel so userspace has more chance of winning the race.
Is that true?

> @@ -126,6 +127,19 @@ static inline bool xilinx_pcie_link_up(struct xilinx_pcie *pcie)
>  		XILINX_PCIE_REG_PSCR_LNKUP) ? 1 : 0;
>  }
>  
> +static int xilinx_pci_wait_link_up(struct xilinx_pcie *pcie)
> +{
> +	u32 val;
> +
> +	/*
> +	 * PCIe r6.0, sec 6.6.1 provides 100ms timeout. Since this is FPGA
> +	 * fabric, we're more lenient and allow 200 ms for link training.
> +	 */
> +	return readl_poll_timeout(pcie->reg_base + XILINX_PCIE_REG_PSCR, val,
> +			(val & XILINX_PCIE_REG_PSCR_LNKUP), 2 * USEC_PER_MSEC,
> +			200 * USEC_PER_MSEC);

There should be a #define in drivers/pci/pci.h for this 100ms value
that you can use here to connect this more closely with the spec.

Maybe there's a way to use read_poll_timeout(), readx_poll_timeout(),
or something similar so we can use xilinx_pcie_link_up() directly
instead of reimplementing it here?

> +}
> +
>  /**
>   * xilinx_pcie_clear_err_interrupts - Clear Error Interrupts
>   * @pcie: PCIe port information
> @@ -493,7 +507,7 @@ static void xilinx_pcie_init_port(struct xilinx_pcie *pcie)
>  {
>  	struct device *dev = pcie->dev;
>  
> -	if (xilinx_pcie_link_up(pcie))
> +	if (!xilinx_pci_wait_link_up(pcie))
>  		dev_info(dev, "PCIe Link is UP\n");
>  	else
>  		dev_info(dev, "PCIe Link is DOWN\n");

