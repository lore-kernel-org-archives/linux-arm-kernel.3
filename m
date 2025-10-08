Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522BFCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t01yTlPNJOfmYe2c2innWAMCUlLVv0wWu/2xZUnr0Zs=; b=AMXvA0P70AypdAFFW390USn1cT
	r05aGnGE+JOgozcQSDL56aLowhd4sCGuHVuSOOXV2Vnqyf4aCizykXJhUHWDRgTyPZlIq/sGL7IB5
	M1jqdj2nDMM/JKB8J/XT0tG8lczznSygRX0A0htNVRn6eCklRREojx2VcLrYBPSSSH1QKpN5dEm68
	ybkvKtsFeOMAyB0vw8bu7r39roRTLNCb4IbXtqiWbbiZvZyLPhPiIkCAXOEiZhh033hInx+xRQ6ua
	jXPm1XgVphUNlHj6BLX2BbfMbZIMHkCQD8JSDVFvn3STnprFmlEouTRn6rb41vA8wlp+esq//eslY
	wix/kgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6VxI-000000047CB-3YlS;
	Wed, 08 Oct 2025 15:19:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6VxI-000000047C5-0urc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96EE96020D;
	Wed,  8 Oct 2025 15:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0554C4CEE7;
	Wed,  8 Oct 2025 15:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759936791;
	bh=i6VA+Bi416CqAXTghlrmyfIEfb8t56u1qvkZfUMrvRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mObSjcqhJYFbTtmCVuFRAoF8fQ7OdIgKcq88IyyQJvq13OjBEotKM1kR3oL5+KKBG
	 IrrnPf1td6SNYIOADfyG3IUgBRVUT2GTNokG6EVdSzsm+kKK8UQG1wyfyxvjIxAT1m
	 WV0DCAr9HVd7HpflJSxgUfGIS2SrWl1WoSl1MUoVFECbpW5NybWzZqSaoOvp+hODta
	 mvHviiSyTBdRSprB429Mx0bAyaWPiWHCsP4r81B9SQprFRBKLYsLU0XcwB6TOzsCqP
	 1fo7/ozlSgouap+2+JqlgY24mUvJ43pnVPKttNqCWbBWQHzH8Sho5PraK+Xpjf7VRC
	 oe2T/w/v8x5QQ==
Date: Wed, 8 Oct 2025 08:19:48 -0700
From: Manivannan Sadhasivam <mani@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, bhelgaas@google.com, jingoohan1@gmail.com, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, krzk+dt@kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Ionut.Vicovan@nxp.com, Larisa Grigore <larisa.grigore@nxp.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, ciprianmarian.costea@nxp.com, 
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, Frank Li <Frank.li@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
Message-ID: <2erycpxudpckmme3k2cpn6wgti4ueyvupo2tzrvmu7aqp7tm6d@itfj7pfrpzzg>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-2-vincent.guittot@linaro.org>
 <iom65w7amxqf7miopujxeulyiglhkyjszjc3nd4ivknj5npcz2@bvxej6ymkecd>
 <aOU0w5Brp6uxjZDr@lpieralisi>
 <4rghtk5qv4u7vx4nogctquu3skvxis4npxfukgtqeilbofyclr@nhkrkojv3syh>
 <eba7d968-209d-4acb-ba41-4bebf03e96ba@app.fastmail.com>
 <4143977f-1e70-4a63-b23b-78f87d9fdcde@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4143977f-1e70-4a63-b23b-78f87d9fdcde@app.fastmail.com>
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

On Wed, Oct 08, 2025 at 10:35:34AM +0200, Arnd Bergmann wrote:
> On Wed, Oct 8, 2025, at 10:26, Arnd Bergmann wrote:
> > On Wed, Oct 8, 2025, at 00:28, Manivannan Sadhasivam wrote:
> >> On Tue, Oct 07, 2025 at 05:41:55PM +0200, Lorenzo Pieralisi wrote:
> >>> On Mon, Sep 22, 2025 at 11:51:07AM +0530, Manivannan Sadhasivam wrote:
> > On the other hand, what looks like a bug to me is that the CPU
> > physical address range for the PCI BAR space overlaps with the
> 
> s/CPU physical/PCI bus/
> 

Yes, it got me confused.

> > the physical addresses for RAM at 0x80000000 and on-chip devices
> > at 0x40000000. This probably works fine as long as the total
> > PCI memory space assignment stays below 0x40000000 but would
> > fail once addresses actually start clashing.
> 
> I got confused here myself, but what I should have said is that
> having the DMA address for the RAM overlap the BAR space
> as seen from PCI is problematic as the PCI host bridge
> cannot tell PCI P2P transfers from DMA to RAM, so one
> of them will be broken here.
> 

No. The IP just sets up the outbound mapping here for the entire 'ranges'. When
P2P happens, it will use the inbound mapping translation.

So your concern would be valid if the 'dma-ranges' (for which inbound
translation happens) overlapped with the RAM/MMIO range. But that is not the
case here.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

