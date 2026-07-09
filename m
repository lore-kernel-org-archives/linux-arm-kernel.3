Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B77C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YblE1pNMWghumBOqyovee2xFVUAWORIaMcWs+X24Wtw=; b=OlpNPqjCv0CPy5uOsILweC3y8j
	oC21S3IFpg5J4O+/TOL2YzlE9mnUXFAGezdZIRf6zpy9qHvnDwbbyW2QyS/4bC81RDLIJASKR/efD
	r6zAUhQqUqDpdflSBanjG1aAqeaZFqu/dCQF5g3D7EHUeBnJKungfL8ZNCPD83WUuZnqPP/WYXkj9
	fy5mz0BPOCWfI3PoT/k9YKrXPOsAwwIeA4vk3LwfI55rUl4krEE5kji0N/+NJxGYZYLlWq4mFceJ3
	TcbI/8ug4aTCWO2zHXwfkqPIHvoRKKK9pWYI+xl8O2JtAZIIragIykVEsVDzI2pbXDjuhSa4VfI2n
	nxMtkg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoJq-00000002TmA-346v;
	Thu, 09 Jul 2026 12:57:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoJm-00000002Tkx-466V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:57:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E00D417F2;
	Thu,  9 Jul 2026 12:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB201F000E9;
	Thu,  9 Jul 2026 12:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783601850;
	bh=YblE1pNMWghumBOqyovee2xFVUAWORIaMcWs+X24Wtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QdCo0lnHZGXSEGH2XWisUKthmC4qq/N8ZC1PVmmUAwPMirhbIuNXCmYTcBC4RKzFd
	 fwRjX4hJaqjhgJ1N8s9gsJNvzlLQauAMbh0CctAw5MT0D6Hs5yK17iOLnX4aXX2UNG
	 wPLkapYRXOxukzzyX6ffj1PIh9xvi4KQIWE8UKweZVtwXgVTVX4kinm5ydBoI8ThYA
	 Fb42DUgLeoXKIAw7ELvwtC7+wNFt6Q5wlr0GXCTxArMiv+HVbI5fk7Y4Akh/NlByl2
	 KtqCxtfLUN/l5NyEaNPsCgjbb/pauPuKZOExKuIrBCr8agFK2/yEeYo/1Wd5jczwo1
	 WRYrATU13KAnw==
Date: Thu, 9 Jul 2026 14:57:20 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, linux-pci@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle GIC ITS
Message-ID: <lkxuw3lgr6gbi4vnj33pfq5kh7h7qefkwiovlqsltnfivbrfit@khnoyfmibg5f>
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
 <ybnitlgx3dcqsesubz6jz7pn6snseuxhtz564tinbtvukianaq@33ubmcynyqmt>
 <c12941e4-3715-404e-b674-090c62b868b8@mailbox.org>
 <87v7ao5o5t.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7ao5o5t.wl-maz@kernel.org>
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

On Thu, Jul 09, 2026 at 01:43:26PM +0100, Marc Zyngier wrote:
> On Thu, 09 Jul 2026 13:33:22 +0100,
> Marek Vasut <marek.vasut@mailbox.org> wrote:
> > 
> > On 7/9/26 2:19 PM, Manivannan Sadhasivam wrote:
> > > On Tue, Jul 07, 2026 at 10:35:38PM +0200, Marek Vasut wrote:
> > >> Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
> > >> case MSI are enabled and disabled.
> > >> 
> > >> Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
> > >> configured to 32-bit address width for AXI or APB interface.
> > >> 
> > >> Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
> > >> implementation cacheable and shareable limitations.
> > >> 
> > >> Marek Vasut (5):
> > >>    PCI: dwc: Determine whether iMSI is used before calling .init
> > >>    PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
> > >>    irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
> > >>    irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
> > > 
> > > Is there a functional dependency between irqchip and PCI patches? Since the
> > > irqchip patches touch ARM64 Kconfig etc... I'm wondering if it still need to go
> > > through PCI tree.
> > I do not believe there is.
> > 
> > These two configure the PCIe controller hardware:
> >   PCI: dwc: Determine whether iMSI is used before calling .init
> >   PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
> > 
> > These two fill in GIC ITS quirks:
> >   irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
> >   irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
> > 
> > This one does yes depend on the two and two patches above, and can
> > only be applied once all four aforementioned patches land, otherwise
> > things really yes will break:
> >   arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes
> > 
> > Would you like me to split the series up , or can you and Marc (?)
> > pick the relevant parts via matching trees ?
> 
> I don't think there's anything for me to pick. The whole thing looks
> like a consistent set, and it probably should be kept together.
> 
> Given that the irqchip stuff has been acked by the relevant party, and
> that the last patch will cause havoc if taken on its own, the only
> course of action is to route the whole thing together, the PCI tree
> being the most obvious victim.

Alright then. I'll merge all 4 patches to PCI tree.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

