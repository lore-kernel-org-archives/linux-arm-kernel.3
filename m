Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FCFC02192
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/SlZdRr1M7HSrZTiZ0VPEmgsxQ7Zl2ARURjx1K2Fn4=; b=d1Rf8DI1HiXfh09zX9NzczRZx/
	wnABeq/u/7k8TpMv9RL7IMMj8k60OtC2SmY8NzqHieQFVL+Qn/UkKELz07CbfrwJYMRBxQ+4ok7wi
	agNOmWvEH9alQX7AWSynB82R0lH5WFxuRtaBOODY30R+L3ENUWxN8VBeMZIRbdEyfmU1bKSBBuS1i
	Fm7Jq3y6dJAOarPtf1D1WHslkmI59zgmCg5w04vmHBef1Ztz7RkiosHdtAPb3sRAK2+uddykFnERe
	caKfawgsA9dbRKb/cbrGjNqcXij2vpEUIdcNn4XmlXJSQdhNunr8vyh++tPgDQOq0UvXRuogNKikS
	xGFnNt9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teGJV-0000000CrQ2-29bX;
	Sat, 01 Feb 2025 16:25:45 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teGIB-0000000CrDU-2msG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 16:24:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2162c0f6a39so72947385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 08:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738427063; x=1739031863; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+/SlZdRr1M7HSrZTiZ0VPEmgsxQ7Zl2ARURjx1K2Fn4=;
        b=jvvsr88I3mXrz8Foy7Z5LLT8QYHxuxtJ/V1Ef6m7tBr7OvH5bDQUAD3Aa8pf4JI0xW
         5uT2xNh7rAjJ2mrsbS8QHFtguCvPrUqTcCoU5MgGxoEgAJ/BHBWBRa5xJ+NmEXrVHmbc
         JjRuFRuIm/4eDcOFFN+FZXdwwUj3UOcbuNiSsAmeebuwkyymdi9sbU9z1GlZ8l1FEPqB
         I0Z8xCFDyMXPHDJPKJnJf/cCIPp2Rxi6hW1RMbsh/QIt1cDdkQcBVXwQ2spIXSa3nPGa
         BdDzYVypCSMKh+x3TBap2K+1f3g16BfLstbooOYAfBgnr5dbJ36mcm9AZnR3OuzOu9BC
         /22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427063; x=1739031863;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/SlZdRr1M7HSrZTiZ0VPEmgsxQ7Zl2ARURjx1K2Fn4=;
        b=jjVVlbdo6+8IxUfkiVkmaOG7aD9b8R6996uPc3+9gtwATE2zbmRxk9W96yvDai4UkR
         /Uj6yMfg/s6JVSZtjwWbEB0/5kFQsqxRsN5ytEZJ4fjWAEBISDURvcPzm1+EI0GboaQ7
         JOaZquWP2Vg+Bh1JOZUZv1oUNUPtX5vu2WU6UWnpK0O4G6HQ2NamMhID0K922XB0zRAH
         O4eX9t0pujMILcaRacxSiFttshvTmYDWscgBslANy2MHwfsxicXpoPvd32F8t8nBU6+m
         HOHs9IvcSzS9zgwgyaYGcs/trzcqxdchfAExTs5ylA9s4p121+3gbfLbgT8YqlftEmeq
         kh3A==
X-Forwarded-Encrypted: i=1; AJvYcCWL8Npvm9NKfgKgWKrOFQDDoJpz3vym5u7IbPmXzg+lihx5WRICFGPyKVLlakesT7ubTHRhKwb6vXkD3ywBK3lM@lists.infradead.org
X-Gm-Message-State: AOJu0YzE/1kc691CRHmRUKkkmxIuz/ROqlD6MFIuUiF6mpTThESqKQpX
	7vB2kY8fKB5Wee2MHgRC/ryfTXYvUKVMVPz1LVgyvpUI6mzDgZ2F9HqneoCxwg==
X-Gm-Gg: ASbGncs/nTe/LTEKP6C9Z3H+fMPRJkA6RWvr4WH+GIASYu2JdyhBwyeC6o9DNf6pNzX
	hIvan8KhqRzCrVj3E63TFgN3iqsFl9ZubWyPAvKJ8Z+hQbKej6Tm8xhK/lKkKcShc1oZud65WWf
	2ifaX0FBW68C4VE3uiyf1KSECD5JSa3tgNfhQysTl+SfpbNIsNZ6+ZrYK5a7HQmCDMfxvMlsxxE
	L6hxhWLqCnvr418XwrOdxRPuQnWetZpYnLNtCAX6gw5kqxPV7CdreJnArFQ4D2WK8ZXFGpQPsVl
	e6MtcIhb7oonschH8cvdP6S6z+g=
X-Google-Smtp-Source: AGHT+IE7Xhm/VWe/QJf6N7cUAvTlX15tknWeDZsD/+Udr/QgfOM2wxbeGfGoigXJsEw8AWMYmJz50g==
X-Received: by 2002:a05:6a21:8cc9:b0:1d9:a94:feec with SMTP id adf61e73a8af0-1ed872d5091mr18416087637.2.1738427062783;
        Sat, 01 Feb 2025 08:24:22 -0800 (PST)
Received: from thinkpad ([120.56.202.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6539fc4sm5262880b3a.73.2025.02.01.08.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:24:22 -0800 (PST)
Date: Sat, 1 Feb 2025 21:54:16 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>,
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
Message-ID: <20250201162416.azp4slqqeabo2xyl@thinkpad>
References: <9e629b1779c2cb9c6fa34347ac16f9b4e2241430.camel@mediatek.com>
 <20250128004150.GA183319@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128004150.GA183319@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_082423_708428_0FB08B43 
X-CRM114-Status: GOOD (  36.90  )
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

On Mon, Jan 27, 2025 at 06:41:50PM -0600, Bjorn Helgaas wrote:
> On Thu, Jan 23, 2025 at 08:11:19AM +0000, Jianjun Wang (王建军) wrote:
> > On Wed, 2025-01-15 at 23:01 +0530, Manivannan Sadhasivam wrote:
> > > On Tue, Jan 07, 2025 at 01:20:58PM +0800, Jianjun Wang wrote:
> > > > Remove the usage of virt_to_phys, as it will cause sparse warnings
> > > > when
> > > > building on some platforms.
> > > 
> > > Strange. What are those warnings and platforms?
> > 
> > There are some warning messages when building tests with different
> > configs on different platforms (e.g., allmodconfig.arm,
> > allmodconfig.i386, allmodconfig.mips, etc.):
> > 
> > pcie-mediatek.c:399:40: sparse: warning: incorrect type in argument 1
> > (different address spaces)
> > pcie-mediatek.c:399:40: sparse:    expected void const volatile *x
> > pcie-mediatek.c:399:40: sparse:    got void [noderef] __iomem *
> > pcie-mediatek.c:515:44: sparse: warning: incorrect type in argument 1
> > (different address spaces)
> > pcie-mediatek.c:515:44: sparse:    expected void const volatile *x
> > pcie-mediatek.c:515:44: sparse:    got void [noderef] __iomem *
> >
> > > > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > > > ---
> > > >  drivers/pci/controller/pcie-mediatek.c | 19 ++++++++++++-------
> > > >  1 file changed, 12 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/pcie-mediatek.c
> > > > b/drivers/pci/controller/pcie-mediatek.c
> > > > index 3bcfc4e58ba2..dc1e5fd6c7aa 100644
> > > > --- a/drivers/pci/controller/pcie-mediatek.c
> > > > +++ b/drivers/pci/controller/pcie-mediatek.c
> > > > @@ -178,6 +178,7 @@ struct mtk_pcie_soc {
> > > >   * @phy: pointer to PHY control block
> > > >   * @slot: port slot
> > > >   * @irq: GIC irq
> > > > + * @msg_addr: MSI message address
> > > >   * @irq_domain: legacy INTx IRQ domain
> > > >   * @inner_domain: inner IRQ domain
> > > >   * @msi_domain: MSI IRQ domain
> > > > @@ -198,6 +199,7 @@ struct mtk_pcie_port {
> > > >       struct phy *phy;
> > > >       u32 slot;
> > > >       int irq;
> > > > +     phys_addr_t msg_addr;
> > > >       struct irq_domain *irq_domain;
> > > >       struct irq_domain *inner_domain;
> > > >       struct irq_domain *msi_domain;
> > > > @@ -393,12 +395,10 @@ static struct pci_ops mtk_pcie_ops_v2 = {
> > > >  static void mtk_compose_msi_msg(struct irq_data *data, struct
> > > > msi_msg *msg)
> > > >  {
> > > >       struct mtk_pcie_port *port =
> > > > irq_data_get_irq_chip_data(data);
> > > > -     phys_addr_t addr;
> > > > 
> > > >       /* MT2712/MT7622 only support 32-bit MSI addresses */
> > > > -     addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> 
> Thanks for working on this!  We should definitely try to get rid of
> virt_to_phys().
> 
> > > >       msg->address_hi = 0;
> > > > -     msg->address_lo = lower_32_bits(addr);
> > > > +     msg->address_lo = lower_32_bits(port->msg_addr);
> > > > 
> > > >       msg->data = data->hwirq;
> > > > 
> > > > @@ -510,10 +510,8 @@ static int
> > > > mtk_pcie_allocate_msi_domains(struct mtk_pcie_port *port)
> > > >  static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
> > > >  {
> > > >       u32 val;
> > > > -     phys_addr_t msg_addr;
> > > > 
> > > > -     msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> > > > -     val = lower_32_bits(msg_addr);
> > > > +     val = lower_32_bits(port->msg_addr);
> > > >       writel(val, port->base + PCIE_IMSI_ADDR);
> > > > 
> > > >       val = readl(port->base + PCIE_INT_MASK);
> > > > @@ -913,6 +911,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie
> > > > *pcie,
> > > >       struct mtk_pcie_port *port;
> > > >       struct device *dev = pcie->dev;
> > > >       struct platform_device *pdev = to_platform_device(dev);
> > > > +     struct resource *regs;
> > > >       char name[10];
> > > >       int err;
> > > > 
> > > > @@ -921,12 +920,18 @@ static int mtk_pcie_parse_port(struct
> > > > mtk_pcie *pcie,
> > > >               return -ENOMEM;
> > > > 
> > > >       snprintf(name, sizeof(name), "port%d", slot);
> > > > -     port->base = devm_platform_ioremap_resource_byname(pdev,
> > > > name);
> > > > +     regs = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > > name);
> > > > +     if (!regs)
> > > > +             return -EINVAL;
> > > > +
> > > > +     port->base = devm_ioremap_resource(dev, regs);
> > > >       if (IS_ERR(port->base)) {
> > > >               dev_err(dev, "failed to map port%d base\n", slot);
> > > >               return PTR_ERR(port->base);
> > > >       }
> > > > 
> > > > +     port->msg_addr = regs->start + PCIE_MSI_VECTOR;
> 
> I think this still assumes that a CPU physical address (regs->start)
> is the same as the PCI bus address used for MSI, so this doesn't seem
> like the right solution to me.
> 
> Apparently they happen to be the same on this platform because (I
> assume) MSIs actually do work, but it's not a good pattern for drivers
> to copy.  I think what we really need is a dma_addr_t, and I think
> there are one or two PCI controller drivers that do that.
> 

I don't see why we would need 'dma_addr_t' here. The MSI address is a static
physical address on this platform and that is not a DMA address. Other drivers
can *only* copy this pattern if they also have the physical address allocated
for MSI.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

