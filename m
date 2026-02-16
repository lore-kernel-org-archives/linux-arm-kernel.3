Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2320E81A2B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 15:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6sI1XImtIgHuyzvVkTZIk/Ol4dy/LnLxklTJ6uAFSY=; b=YM0N8yIIGEkNL64AApfW++HsNc
	tcZL7fGwN45rERkUTZNFZvcl7IppJ7/25X5AhynsdP+HVRMP+SOnojwisgqQJf/LBNgxrGGlqVmSZ
	VI8kfXyXwFD+bV1McYV2A9qsab6Zoq5Ow/EyPCIanGyJnyz7tyjUKt4BiA5RJ/EliMP1Xxdc4Lg/I
	7wHHSoTlIJknbQQMcDSudLuYb+/m0dMXn9EcrpkulXACoSmoYOikX9qh+UtbANVpvGgXpo+lBv3bH
	lbUov7eLoFi696S2qTcpkk3MNrTNGSJg3FEb1YaxlMrgIaSfOPO7vR9ZJVtrypl8KgACyJwRdeaV6
	hE8jECIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0K2-00000006rYX-4Aga;
	Mon, 16 Feb 2026 15:15:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0K1-00000006rXr-0sTx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 15:15:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75B2743B09;
	Mon, 16 Feb 2026 15:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CDFC19423;
	Mon, 16 Feb 2026 15:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771254936;
	bh=T0/dBAH4A6VtIhLGFbkca4e08w1S8Y6tr6iOo5y+MLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eVAmm0hV5VPgoD8Na1fqz30ujWFYw2iZR7Xeepn3HwBgpweurYwSUjOsEhwJJqY0i
	 RC4PisqqVINr9iOO2DQ5iymWQQa7ztNq/7ftY6gOf5E6SPGI5bN5dx5Kpm80NsXXqr
	 L2Vy2EQnhW4+sq70Wo9fSTkxNMU0Kh1uoS8ae8mUOhPFp4LKlMtwotnJ7JEU8Hkn3d
	 80XYwVPsogpL4Z96+zTD94LTqQbkd9BngC8QA2yyHpAdVob+s0D4URZYhvECQudqrW
	 4e7IZdvnK4e9HNDeATC+z4rRzlghwzR3e5ABG4SmldLqggK0V73aBqV8Wy1GLUoqV2
	 oSdjNt8fSlpNg==
Date: Mon, 16 Feb 2026 20:45:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] PCI: mvebu: Simplify with scoped for each OF child
 loop
Message-ID: <2w3cvp43y5fxjveifmagikxhlbrotuztjufa2eoaxesi2fzz2f@6fkyex46nucd>
References: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105103502.00002efe@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105103502.00002efe@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_071537_312353_B39F516D 
X-CRM114-Status: GOOD (  23.52  )
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

On Mon, Jan 05, 2026 at 10:35:02AM +0000, Jonathan Cameron wrote:
> On Fri,  2 Jan 2026 13:49:01 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 
> > Use scoped for-each loop when iterating over device nodes to make code a
> > bit simpler.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Hi Krzysztof,
> 
> Drive by review.  Your changes are functionally equivalent and lgtm.
> However, I am curious at whether the lack of reference count for child
> when stashed in port->dn (and then used in the for loop) is a potential
> issue.
> 

Looks like it. But the current code doesn't drop the reference either :/

- Mani

> Jonathan
> 
> > ---
> >  drivers/pci/controller/pci-mvebu.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
> > index a72aa57591c0..4d3c97b62fe0 100644
> > --- a/drivers/pci/controller/pci-mvebu.c
> > +++ b/drivers/pci/controller/pci-mvebu.c
> > @@ -1452,7 +1452,6 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
> >  	struct mvebu_pcie *pcie;
> >  	struct pci_host_bridge *bridge;
> >  	struct device_node *np = dev->of_node;
> > -	struct device_node *child;
> >  	int num, i, ret;
> >  
> >  	bridge = devm_pci_alloc_host_bridge(dev, sizeof(struct mvebu_pcie));
> > @@ -1474,16 +1473,14 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >  
> >  	i = 0;
> > -	for_each_available_child_of_node(np, child) {
> > +	for_each_available_child_of_node_scoped(np, child) {
> >  		struct mvebu_pcie_port *port = &pcie->ports[i];
> >  
> >  		ret = mvebu_pcie_parse_port(pcie, port, child);
> > -		if (ret < 0) {
> > -			of_node_put(child);
> > +		if (ret < 0)
> >  			return ret;
> > -		} else if (ret == 0) {
> > +		else if (ret == 0)
> >  			continue;
> > -		}
> >  
> >  		port->dn = child;
> >  		i++;
> > @@ -1493,6 +1490,7 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
> >  	for (i = 0; i < pcie->nports; i++) {
> >  		struct mvebu_pcie_port *port = &pcie->ports[i];
> >  		int irq = port->intx_irq;
> > +		struct device_node *child;
> >  
> >  		child = port->dn;
> >  		if (!child)
> 

-- 
மணிவண்ணன் சதாசிவம்

