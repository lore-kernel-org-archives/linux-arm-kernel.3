Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FD8C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 18:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=0Zphh24pOgAaYPpzAGd8Cxcud+3ObXVvg5og2JTcD7w=; b=Pi7fNxXp488rxK
	RY86cbxhq2XLvTYj2OA3Gl3NrakRiAk0exMJYdbhMua7RaRGtK7EhIL+D75ZER9Fd5zMUq2AV+BFY
	tTkpTiv75VsUCDqWx/gg5dBbyNbG1FEU10Ofdwzch0WfIed/087bJ2O9Xj6o3VgOOBgo8drydsruc
	7VE2b2Y9kvr9cvFvwWSPAaT6iN2Q2/xcXh4WMEye7llVZNqAKe21S+o5VWCZ68ooepiCEP6OJwMUr
	ElFEk4TSkOHxX/XukQ+dMHrizUVUV/N5admPczHMcOjiEocSem6sS/m2syT0V+4QhCuB/Otf+pV9/
	sLS0kUhl2Bm+S4069sNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twmYy-00000003wrK-0niX;
	Mon, 24 Mar 2025 18:30:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twmXG-00000003wiS-41hL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 18:28:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B11EB61599;
	Mon, 24 Mar 2025 18:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B447C4CEDD;
	Mon, 24 Mar 2025 18:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742840909;
	bh=EWIOhq8a6WrbauOCbT88senxBdzZjHc5hedq099LcUM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=jMSHIior9o47tI8oJHPN6ePxVwCZYJdCO/6fFs6AZByzpgiYy/9UX5RvfW6ih0Kql
	 7gLZPoaZU0njyioZ5rfgfyA9Qqa7CIGgf9MmANlX/ud45edRowOoDEyRqDPypwFnXV
	 Ne95va5kK2vmy4HBZ1UXFULxlV6pv8SJcKnbAkwyxTmehuJ3tc4af/Rd3nNeN+4YcL
	 PD7RbLiRjbxoAZEYqlpESyh6+i5QJUD6v7X/ieViJmSs/yj3jW+6GpNETCvQCOJtFi
	 wzHySGpGscT5I9gyPQX03ua+2JdbMHj2df1SRUCxBuEApbt/oheMREFl+dm+FCdC23
	 ZOYYX+YyJ2bfw==
Date: Mon, 24 Mar 2025 13:28:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas Cassel <cassel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v12 05/13] PCI: dwc: Add dw_pcie_parent_bus_offset()
Message-ID: <20250324182827.GA1257218@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <j3qw4zmopulpn3iqq5wsjt6dbs4z3micoeoxkw3354txkx22ml@67ip5sfo6wwd>
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

On Mon, Mar 24, 2025 at 10:48:23PM +0530, Manivannan Sadhasivam wrote:
> On Sat, Mar 15, 2025 at 03:15:40PM -0500, Bjorn Helgaas wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> > 
> > Return the offset from CPU physical address to the parent bus address of
> > the specified element of the devicetree 'reg' property.

> > +resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
> > +					  const char *reg_name,
> > +					  resource_size_t cpu_phy_addr)
> > +{
> 
> s/cpu_phy_addr/cpu_phys_addr/g

Fixed, thanks!

> > +	struct device *dev = pci->dev;
> > +	struct device_node *np = dev->of_node;
> > +	int index;
> > +	u64 reg_addr;
> > +
> > +	/* Look up reg_name address on parent bus */
> 
> 'parent bus' is not accurate as the below code checks for the 'reg_name' in
> current PCI controller node.

We want the address of "reg_name" on the node's primary side.  We've
been calling that the "parent bus address", I guess because it's the
address on the "parent bus" of the node.

I'm not sure what the best term is for this.  Do you have a
suggestion?

If "parent bus address" is the wrong term, maybe we need to rename
dw_pcie_parent_bus_offset() itself?  

Currently we pass in cpu_phys_addr, but this function doesn't need it
except for the debug code added later.  I would really rather have
something like this in the callers:

  pci->parent_bus_offset = pp->cfg0_base -
      dw_pcie_parent_bus_addr(pci, "config");

because then the offset is computed sort of at the same level where
it's used, and a grep for "cfg0_base" would find both the set and the
use and they would be easy to match up.

> > +	index = of_property_match_string(np, "reg-names", reg_name);
> > +
> > +	if (index < 0) {
> > +		dev_err(dev, "No %s in devicetree \"reg\" property\n", reg_name);
> 
> Both of these callers are checking for the existence of the
> 'reg_name' property before calling this API. So this check seems to
> be redundant (for now).

True, but I don't see a way to enforce the caller checks.  I don't
like the idea of calling of_property_read_reg(np, index, ...) where we
have to look the caller to verify that "index" is valid.

Bjorn

