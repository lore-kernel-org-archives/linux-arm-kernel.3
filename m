Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCF6C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/6BuoMibyCX0ZAj9j6+6EpEVU7rjsW9gMBrhQSp+y5Y=; b=ICo6/KvtxK8Wfa
	RwAxGYqvIUBtgvIdbQ5eOGN+ABJGAiXJAgmB6CPfwttsIcRawSoTKZfczd4rFJjOYd+hZ8pYnMc2n
	c+WvLrM1ocuQ0TG5NkiVwJm8j9B9sL9Ncyrf/t/BWxPoe46N42KlpSZJrS6hSqqyCK2CGL04PvqWu
	LyAoBVkq6uEwdOS1XHM4htuY+57K2rNYqyqnWP2jM0z/meOHRHUKavwJPZ2vGgthN8nQrBl/69vbr
	Aoa9x4QIRtAOz/xmi1d3kf1CmbfBLgeME5FaSSnAFTSssOWNp7QljsM4CQF0BzL9dlJNv7ovwHFzH
	kI30tjAi8TumoIsHPfsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAcl-00000006oeG-3nR1;
	Tue, 24 Jun 2025 20:52:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5eC-000000068AX-1zNj;
	Tue, 24 Jun 2025 15:33:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7389B5C6764;
	Tue, 24 Jun 2025 15:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61216C4CEE3;
	Tue, 24 Jun 2025 15:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750779199;
	bh=q6zc5t1ffrY54UuAj9wfKtHgj2vJk8nzvm5t/rgZlJ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tAdJn0S2KFY7K9z1dPx1SBSRAXjgZzFEpuX9Cz8uE2gOzckJHxm7jz+0gdwzWO+ex
	 CwT0ZhtL3tH9wwwdwjZBylW6D+MQ0M2HcWcRC2oWuS9rz02Rbu4tw8KGNnF3XJ80hQ
	 iNmEoquScWaakp/njFSojt3F09lCIqgde2eukZOpgCGkqxK8JMJ4CbFm4/h2AGuVwS
	 ITwBL8mhY6G4yj+CNxqP8lp9R651VyBgDXFGPM+uwbPELKLg4tpfsbFb2UGECQ8kOP
	 v4pAFDhjBxAWCSbz34wWUDKlhtjtMzRHLkBhFjVhGsk0f9wG0bP/QpPAl++srzrNwW
	 oQSp5ec0EoFFA==
Date: Tue, 24 Jun 2025 10:33:18 -0500
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
	"vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"elbadrym@google.com" <elbadrym@google.com>,
	"romlem@google.com" <romlem@google.com>,
	"anhphan@google.com" <anhphan@google.com>,
	"wak@google.com" <wak@google.com>,
	"yuxiaozhang@google.com" <yuxiaozhang@google.com>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: =?utf-8?B?5Zue6KaGOiBbUEFUQw==?= =?utf-8?Q?H?= 7/7] pci: aspeed:
 Add ASPEED PCIe host controller driver
Message-ID: <20250624153318.GA1477975@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB51342E52B3C4A7AFD42485039D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_083320_604139_85F32240 
X-CRM114-Status: GOOD (  14.92  )
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

On Fri, Jun 20, 2025 at 06:05:20AM +0000, Jacky Chou wrote:
> > > Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
> > > initialization, reset, clock, IRQ domain, and MSI domain setup.
> > > Implement platform-specific setup and register configuration for
> > > ASPEED. And provide PCI config space read/write and INTx/MSI interrupt
> > > handling.

> > > +static int aspeed_ast2600_rd_conf(struct pci_bus *bus, unsigned int devfn,
> > > +				  int where, int size, u32 *val)
> > > +{
> > > +	struct aspeed_pcie *pcie = bus->sysdata;
> > > +	u32 bdf_offset;
> > > +	int rx_done_fail = 0, slot = PCI_SLOT(devfn);
> > > +	u32 cfg_val, isr, type = 0;
> > > +	u32 link_sts = 0;
> > > +	int ret;
> > > +
> > > +	/* Driver may set unlock RX buffere before triggering next TX config
> > > +*/
> > > +	writel(PCIE_UNLOCK_RX_BUFF | readl(pcie->reg + H2X_DEV_CTRL),
> > > +	       pcie->reg + H2X_DEV_CTRL);
> > > +
> > > +	if (bus->number == 128 && slot != 0 && slot != 8)
> > > +		return PCIBIOS_DEVICE_NOT_FOUND;
> > > +	type = (bus->number > 128);
> > 
> > Weird.  What's all this?  Some kind of device you want to hide?
> > Deserves a hint about what's special.
> 
> The bus range in our AST2600 design is just starting from 128.
> There is no something special.  I will use the child_ops that is in
> struct pci_host_bridge to distinguish the rc bridge and the other
> bus.

Is the 128 root bus number hardwired into the RC?  Maybe it should be
described in DT?

