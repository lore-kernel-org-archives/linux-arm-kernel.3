Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3F0CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=wdeejnjgmwcBIRs7F/fNBtVj8QKR4gAxEw8aPn/gFWI=; b=uAcuEQidCGyE4y
	w1YoPezyk+hvMPcc0ydy3PmWjtoYSFVn9uJEGXTz1PUr0e7Pjy7VAPIk5DNxY/rtjq9LzRx3o4xz7
	CNuBKkU3RPVNoE+bIcYG9bpymQ5WHUzgZ2x0oNskut2gp9MdIRDJiY7OvHcvZsyQnKO/08FW/3zTL
	b37PDj9PE8+HFsPQgh7slFksxrESB3tQxzepf7PZeudcShAJaFx46L1QAXqPxdSEdUZvthVP7EAq2
	MYEBS4hpkT+v45ncNIwvmmVLDv1BO0xJaXHBIcGZrbX+qIG/HGDJoKhLKGr+eXgFR2+esTQMe6mHa
	NUYdXSKsXS9A/ZcZSjPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphtK-000000049QF-0EBt;
	Sat, 23 Aug 2025 06:38:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upToM-000000034W3-48mg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:36:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A80D44618;
	Fri, 22 Aug 2025 15:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AE6C4CEED;
	Fri, 22 Aug 2025 15:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755876974;
	bh=M4axMQs8H13c09qWo6K3CitPMFiulFvZkPJOaBof5qk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Gkm3JskIl9AEISSDTxGOPEQ5Ekw+yO/AvQdomznGVF8QhL2AKSjB9ug0fr1l8cDAC
	 R5sn0gLRNWsiAEXDV/8IqKrKhmFhfaIV0eZ2Ifeh4tLF63tK6IWjZnREefRXi/M03D
	 sonYkEFxAHk5WnTO9vZYeGm/kLZ++fqGgDYfTihFHvZFAojKUxRz39rTZqvajG+zmS
	 C5cdC9xRurIk0OtWquWGUHHvSsQMbdCi9wn8LX+sUhjGWTlzoGERhtdVdDoJXui0e5
	 RMD+nlwye1ZCE/pFkHY1ti7fjopPKBrl36OGkQOSbkQ95P59TCZ58RYnkJ70Qa5E+H
	 M8+0Xh8w08Hdg==
Date: Fri, 22 Aug 2025 10:36:11 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: =?utf-8?B?5Zue6KaG?= =?utf-8?Q?=3A?= [PATCH v2 09/10] PCI:
 aspeed: Add ASPEED PCIe RC driver
Message-ID: <20250822153611.GA684739@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134692DCCFD55F5ABD812F39D3DA@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_083615_077519_DC338C78 
X-CRM114-Status: GOOD (  26.19  )
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

On Fri, Aug 22, 2025 at 07:00:25AM +0000, Jacky Chou wrote:
> > v1 posting was
> > https://lore.kernel.org/r/20250613033001.3153637-1-jacky_chou@aspeedtech
> > .com
> > Links to previous postings are helpful in the cover letter.
> > 
> > On Tue, Jul 15, 2025 at 11:43:19AM +0800, Jacky Chou wrote:
> > > Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
> > > initialization, reset, clock, IRQ domain, and MSI domain setup.
> > > Implement platform-specific setup and register configuration for
> > > ASPEED. And provide PCI config space read/write and INTx/MSI interrupt
> > > handling.

> > > +#define MAX_MSI_HOST_IRQS	64
> > > +#define PCIE_RESET_CONFIG_DEVICE_WAIT_MS	500
> > 
> > Where does this value come from?  Is there a generic value from
> > drivers/pci/pci.h you can use?
> 
> We check the PCIe specification to find these contents.
>
> "With a Downstream Port that supports Link speeds greater than 5.0
> GT/s, software must wait a minimum of 100 ms after Link training
> completes before sending a Configuration Request to the device
> immediately below that Port."
>
> So, we think delay 500ms to let kernel issue the first configuration
> command is enough after deassert PERST.

Isn't this PCIE_RESET_CONFIG_WAIT_MS?

I prefer to use #defines from the PCI core whenever possible because
it makes it easier to ensure that all drivers include the required
delays.

> > > +#define PCIE_RESET_CONFIG_RC_WAIT_MS		10
> > 
> > Ditto.  If it's an Aspeed-specific value, can you point to the
> > source in the Aspeed datasheet?
> 
> This delay is set to ensure that the RC internal settings are
> completely reset.  We do not put its usage in our datasheet.

The "PCIE_" prefix suggests something required by the PCIe base spec.
If this is an Aspeed-specific value, perhaps remove the "PCIE_"
prefix?

> > > +static int aspeed_ast2700_child_config(struct pci_bus *bus, unsigned int
> > devfn,
> > > +				       int where, int size, u32 *val,
> > > +				       bool write)
> > > +{
> > > +	struct aspeed_pcie *pcie = bus->sysdata;
> > > +	u32 bdf_offset, status, cfg_val;
> > > +	int ret;
> > > +
> > > +	bdf_offset = aspeed_pcie_get_bdf_offset(bus, devfn, where);
> > > +
> > > +	cfg_val = CRG_PAYLOAD_SIZE;
> > > +	if (write)
> > > +		cfg_val |= (bus->number == 1) ? CRG0_WRITE_FMTTYPE :
> > CRG1_WRITE_FMTTYPE;
> > > +	else
> > > +		cfg_val |= (bus->number == 1) ? CRG0_READ_FMTTYPE :
> > > +CRG1_READ_FMTTYPE;
> > 
> > I don't think you should assume that bus 0 is the root bus.  The root bus
> > number should come from the DT bus-range.

Just making sure you saw this part since you didn't mention it.

Bjorn

