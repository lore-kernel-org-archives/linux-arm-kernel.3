Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E418C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZpphPHS+kE2zjJn6fV5pW8hZvy6pxeJHUSkdrcp6Os=; b=dZBQgbFVpmOQsESWHQ9C/31XVf
	gdBbqNc4ZAaPXnhxKaCInDouL1MAs7CnSDQsNBZJIowoeVXCgbuzeBfGyzKUOAxpR/0Ccc8CaGVWm
	DtvLrLxDEh72ZDB2ss1gWjbDpVOgSAUeXMpv0jqL5BW9tJe4w2+M966Tpor7XCyvQtc/I+H6jPlLI
	xzTXmGHTcu+RuDanH1cx2nxK6L3GT9Jtc93wqDnOVVmUniKRn2K85NLaC72jU7l3ZX8UViy979GGG
	tqw126h7mbpbyCq1H1u5agHdw75xG5mV2K6v508mlMbh/kT3eDl0umIbJSn80s5vcEUWbGsdyUyVQ
	3AvajIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnsQ-00000002PLh-2lMI;
	Thu, 09 Jul 2026 12:29:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnsP-00000002PLC-1cWU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:29:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4130D40940;
	Thu,  9 Jul 2026 12:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E601F000E9;
	Thu,  9 Jul 2026 12:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783600152;
	bh=HZpphPHS+kE2zjJn6fV5pW8hZvy6pxeJHUSkdrcp6Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jLd/eqFuhPtL1sLKjbUyoLPRP1TLORuf1HQ/wIx4jQSeTFjHc18+nQ3asKKX41MVk
	 BCupLVDx+Lx0SF5qsFx3Wid2vc+OEBFvGvaCH2wpzR9nVdgEUcdyKg8Aqm3Zx6S1Qw
	 /Mju0eky30JNZgjxR1tq9gAO4646HIh37UlTJcnmNlU3VooH5/mkYlY/28VZCIc89c
	 gXQwu4b/6Y+YiEhmonGRvwO6630Rf80D5B/LCNxyauV0S2HTFsvVlLPBZK6jueRMku
	 fxINKECQjnbaQ1abTansLXKlqLprEf/CGc4x7qh6yVBHNpjI5eXz9Go3p0WPSb8zav
	 rI9E2vaFy5gZg==
Date: Thu, 9 Jul 2026 14:29:02 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] PCI: apple: Integrate pwrctrl API
Message-ID: <jqaxvdaxfpm5g3tdwdqpuk2ubkwim6ckmlblocvakloqishvmm@c5ofbdbdj7lf>
References: <20260707-apple-pcie-pwren-v1-0-5a281b182fe2@cyberchaos.dev>
 <20260707-apple-pcie-pwren-v1-1-5a281b182fe2@cyberchaos.dev>
 <86a4s3p2vy.wl-maz@kernel.org>
 <8a80a170-a508-4a9e-8090-27cfcedb1cd4@cyberchaos.dev>
 <865x2qq4ts.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <865x2qq4ts.wl-maz@kernel.org>
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

On Tue, Jul 07, 2026 at 02:58:39PM +0100, Marc Zyngier wrote:
> On Tue, 07 Jul 2026 13:04:21 +0100,
> Yureka Lilian <yureka@cyberchaos.dev> wrote:
> > 
> > On 7/7/26 11:25, Marc Zyngier wrote:
> > > On Mon, 06 Jul 2026 23:38:27 +0100,
> > > Yureka Lilian <yureka@cyberchaos.dev> wrote:
> > >> Integrate the PCI pwrctrl framework into the Apple PCIe host driver to
> > >> provide standardized power management for PCI devices.
> > >> 
> > >> Notably, this allows enabling powering on the WiFi, SD card reader on
> > >> various Macs by means of the pwrctrl framework before probing the ports.
> > >> 
> > >> Previously, a custom solution for powering on the WiFi and SD card
> > >> reader was proposed[1], but we can now use the new pci-pwrctrl-generic
> > >> driver for this purpose.
> > >> 
> > >> Link[1]: https://lore.kernel.org/lkml/20220502093832.32778-4-marcan@marcan.st/
> > >> 
> > > nit: this paragraph and the accompanying link don't belong in the
> > > commit message and should be moved below the --- mark or even better,
> > > to the cover letter.
> > ack, will leave it out of the commit message of the individual commit in v2
> > >> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> > >> ---
> > >>   drivers/pci/controller/Kconfig      |  1 +
> > >>   drivers/pci/controller/pcie-apple.c | 16 ++++++++++++++++
> > >>   2 files changed, 17 insertions(+)
> > >> 
> > >> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> > >> index 2247709ef6d6..af64630d28fa 100644
> > >> --- a/drivers/pci/controller/Kconfig
> > >> +++ b/drivers/pci/controller/Kconfig
> > >> @@ -46,6 +46,7 @@ config PCIE_APPLE
> > >>   	depends on OF
> > >>   	depends on PCI_MSI
> > >>   	select PCI_HOST_COMMON
> > >> +	select PCI_PWRCTRL_GENERIC
> > >>   	select IRQ_MSI_LIB
> > >>   	help
> > >>   	  Say Y here if you want to enable PCIe controller support on Apple
> > >> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> > >> index c2cffc0659f4..db038a9d4831 100644
> > >> --- a/drivers/pci/controller/pcie-apple.c
> > >> +++ b/drivers/pci/controller/pcie-apple.c
> > >> @@ -30,6 +30,7 @@
> > >>   #include <linux/msi.h>
> > >>   #include <linux/of_irq.h>
> > >>   #include <linux/pci-ecam.h>
> > >> +#include <linux/pci-pwrctrl.h>
> > >>     #include "pci-host-common.h"
> > >>   @@ -825,6 +826,21 @@ static int apple_pcie_init(struct
> > >> pci_config_window *cfg)
> > >>   	if (WARN_ON(!pcie))
> > >>   		return -ENOENT;
> > >>   +	ret = pci_pwrctrl_create_devices(pcie->dev);
> > >> +	if (ret) {
> > >> +		dev_err(pcie->dev, "Failed to create pwrctrl devices: %pe\n", ret);
> > >> +		return ret;
> > >> +	}
> > >> +
> > >> +	ret = pci_pwrctrl_power_on_devices(pcie->dev);
> > >> +	if (ret) {
> > >> +		if (ret != -EPROBE_DEFER) {
> > >> +			dev_err(pcie->dev, "Failed to power on devices: %pe\n", ret);
> > >> +			pci_pwrctrl_destroy_devices(pcie->dev);
> > >> +		}
> > >> +		return ret;
> > >> +	}
> > >> +
> > > Why is this done globally while the whole driver works on a per-port
> > > basis, and that the proposed DT updates are also per port?
> > 
> > pci_pwrctrl_power_on_devices takes a struct device as parameter, but
> > pcie-apple does not allocate device structs for the individual ports.
> > This could be changed of course. But since pci_pwrctrl_* operate on
> > the subnodes recursively, it works just fine this way.
> 
> Works fine is one thing. Being consistent with the way the rest of the
> driver works is another. pci_pwrctrl_create_device() and
> pci_pwrctrl_power_on_device() appear to do exactly what would be
> required for a single port. They just needs to be exported made
> global/exported.
> 

I'm fine with exporting pci_pwrctrl_create_device() and
pci_pwrctrl_power_on_device() and calling them with per-port np.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

