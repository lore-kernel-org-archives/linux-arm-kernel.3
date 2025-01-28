Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808C5C02188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 00:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=f8X97oLmgMT31JHzy2fB5vVdQsKef7+n1kp81Yennkc=; b=VgNvAk0PPK5g8mtVxXW0pQSPFy
	61kGm+hk3I7Ow/QkWd113Im9K+QmAoM3hAMBWRRGmeeNiiKnnVQjqD7IchUGtM0Jf9MOdOSBKZfQa
	hJf7RIT1MUGcZfIYgqbvXX50IE0rm3KRNt8gqR4Ry5+3nw/Ag4sC55fp8DegxrHjlbMC4jxn/9VZP
	EsR8923v3DPb/H7ykguDr8Yk4cqzHnygOdt7VYBG+Y2CY4V5Lpka6bGUoHWVH+6IOTM6aVXWN6IGe
	LqjdwzvQbNwWfgwzPWwdySF076yCPqvUuqjvLSQoR5UO23Tac4nhW0KtS/MaS4cHcaNFZ8dM0utCZ
	/PAfgCHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcZhG-00000003okO-3hSB;
	Tue, 28 Jan 2025 00:43:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcZfu-00000003oFD-3xEP;
	Tue, 28 Jan 2025 00:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF99C5C5831;
	Tue, 28 Jan 2025 00:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB84C4CED2;
	Tue, 28 Jan 2025 00:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738024913;
	bh=oCREAUY8j++SAnl6wUczMC3oNy5q6RrIqFAVM4y07BE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FcC4HA2QignI5R4l3o/YmS/xowOZeJHr7dmscyJpxRRDZJJ8H+mzQhSEf5Q9S7Xzr
	 4ifN0P6MJa3gw9931ZBKIXO1o4Aq07ec9kFAhcBSi1Sd7NllrHZegL6x9x0eJyveM/
	 hHHkrqdFGN7GDsUCOwEPL+UTwjLnprHlnBqmkUNxRe1dJynjm4AQB1EWOi0oZhho44
	 aHezCFuTHaiuHA2S5M0Bq5Oi/zC3cnj6r+g8TkJoXaxBfLuyyvEefdckFdjICAZsGz
	 6sZa+wAVFAxNak08KCU1njcZk64JeDlhV+/Av9uJEuy4iGFLxTGJRs+pULMOabLmbc
	 +z9ApykI++BTA==
Date: Mon, 27 Jan 2025 18:41:50 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>
Cc: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Remove the usage of virt_to_phys
Message-ID: <20250128004150.GA183319@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e629b1779c2cb9c6fa34347ac16f9b4e2241430.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_164155_065963_1B770A23 
X-CRM114-Status: GOOD (  30.80  )
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

On Thu, Jan 23, 2025 at 08:11:19AM +0000, Jianjun Wang (王建军) wrote:
> On Wed, 2025-01-15 at 23:01 +0530, Manivannan Sadhasivam wrote:
> > On Tue, Jan 07, 2025 at 01:20:58PM +0800, Jianjun Wang wrote:
> > > Remove the usage of virt_to_phys, as it will cause sparse warnings
> > > when
> > > building on some platforms.
> > 
> > Strange. What are those warnings and platforms?
> 
> There are some warning messages when building tests with different
> configs on different platforms (e.g., allmodconfig.arm,
> allmodconfig.i386, allmodconfig.mips, etc.):
> 
> pcie-mediatek.c:399:40: sparse: warning: incorrect type in argument 1
> (different address spaces)
> pcie-mediatek.c:399:40: sparse:    expected void const volatile *x
> pcie-mediatek.c:399:40: sparse:    got void [noderef] __iomem *
> pcie-mediatek.c:515:44: sparse: warning: incorrect type in argument 1
> (different address spaces)
> pcie-mediatek.c:515:44: sparse:    expected void const volatile *x
> pcie-mediatek.c:515:44: sparse:    got void [noderef] __iomem *
>
> > > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > > ---
> > >  drivers/pci/controller/pcie-mediatek.c | 19 ++++++++++++-------
> > >  1 file changed, 12 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/pcie-mediatek.c
> > > b/drivers/pci/controller/pcie-mediatek.c
> > > index 3bcfc4e58ba2..dc1e5fd6c7aa 100644
> > > --- a/drivers/pci/controller/pcie-mediatek.c
> > > +++ b/drivers/pci/controller/pcie-mediatek.c
> > > @@ -178,6 +178,7 @@ struct mtk_pcie_soc {
> > >   * @phy: pointer to PHY control block
> > >   * @slot: port slot
> > >   * @irq: GIC irq
> > > + * @msg_addr: MSI message address
> > >   * @irq_domain: legacy INTx IRQ domain
> > >   * @inner_domain: inner IRQ domain
> > >   * @msi_domain: MSI IRQ domain
> > > @@ -198,6 +199,7 @@ struct mtk_pcie_port {
> > >       struct phy *phy;
> > >       u32 slot;
> > >       int irq;
> > > +     phys_addr_t msg_addr;
> > >       struct irq_domain *irq_domain;
> > >       struct irq_domain *inner_domain;
> > >       struct irq_domain *msi_domain;
> > > @@ -393,12 +395,10 @@ static struct pci_ops mtk_pcie_ops_v2 = {
> > >  static void mtk_compose_msi_msg(struct irq_data *data, struct
> > > msi_msg *msg)
> > >  {
> > >       struct mtk_pcie_port *port =
> > > irq_data_get_irq_chip_data(data);
> > > -     phys_addr_t addr;
> > > 
> > >       /* MT2712/MT7622 only support 32-bit MSI addresses */
> > > -     addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);

Thanks for working on this!  We should definitely try to get rid of
virt_to_phys().

> > >       msg->address_hi = 0;
> > > -     msg->address_lo = lower_32_bits(addr);
> > > +     msg->address_lo = lower_32_bits(port->msg_addr);
> > > 
> > >       msg->data = data->hwirq;
> > > 
> > > @@ -510,10 +510,8 @@ static int
> > > mtk_pcie_allocate_msi_domains(struct mtk_pcie_port *port)
> > >  static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
> > >  {
> > >       u32 val;
> > > -     phys_addr_t msg_addr;
> > > 
> > > -     msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> > > -     val = lower_32_bits(msg_addr);
> > > +     val = lower_32_bits(port->msg_addr);
> > >       writel(val, port->base + PCIE_IMSI_ADDR);
> > > 
> > >       val = readl(port->base + PCIE_INT_MASK);
> > > @@ -913,6 +911,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie
> > > *pcie,
> > >       struct mtk_pcie_port *port;
> > >       struct device *dev = pcie->dev;
> > >       struct platform_device *pdev = to_platform_device(dev);
> > > +     struct resource *regs;
> > >       char name[10];
> > >       int err;
> > > 
> > > @@ -921,12 +920,18 @@ static int mtk_pcie_parse_port(struct
> > > mtk_pcie *pcie,
> > >               return -ENOMEM;
> > > 
> > >       snprintf(name, sizeof(name), "port%d", slot);
> > > -     port->base = devm_platform_ioremap_resource_byname(pdev,
> > > name);
> > > +     regs = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > name);
> > > +     if (!regs)
> > > +             return -EINVAL;
> > > +
> > > +     port->base = devm_ioremap_resource(dev, regs);
> > >       if (IS_ERR(port->base)) {
> > >               dev_err(dev, "failed to map port%d base\n", slot);
> > >               return PTR_ERR(port->base);
> > >       }
> > > 
> > > +     port->msg_addr = regs->start + PCIE_MSI_VECTOR;

I think this still assumes that a CPU physical address (regs->start)
is the same as the PCI bus address used for MSI, so this doesn't seem
like the right solution to me.

Apparently they happen to be the same on this platform because (I
assume) MSIs actually do work, but it's not a good pattern for drivers
to copy.  I think what we really need is a dma_addr_t, and I think
there are one or two PCI controller drivers that do that.

> > >       snprintf(name, sizeof(name), "sys_ck%d", slot);
> > >       port->sys_ck = devm_clk_get(dev, name);
> > >       if (IS_ERR(port->sys_ck)) {
> > > --
> > > 2.46.0
> > > 
> > 
> > --
> > மணிவண்ணன் சதாசிவம்

