Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77601CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 19:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4gyQ3DJxjDK+6TiQjdz9ns9W3JbE7/qAM0sKBYRsRI=; b=EEN/NwCAXK63JJ6LUj2pVZPnrv
	eEm/K6DPmDntM9b6VDW4o+EX3MApuo+/Gcik/26xbKhrAJ/POVKdptPWf1yC6rX4AfAOr9zu+kPuv
	kpR3uW4achKfXsvVZty1+VpoLCdc1fwsNP07d3XKbNNlrmwVJb5+B4ueoDNyrWHVKivEEj6oQshEo
	ZHOfys+oCiNOYUxTFobMQxlT1x43nlP4fBEfUCQ03E1I71HAU8reHnCJASZe5zvz/P8I88wFhXR3o
	SooUIcrYZtZ23WCWm2sDWLDUn728e6hzF35Z94vp3ZljPsl5+kjO4BwsDckbBnDi9G5OXL2ON8qim
	os9ZuOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIY2o-000000063Es-25iL;
	Mon, 10 Nov 2025 19:59:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIY2n-000000063Eg-082s;
	Mon, 10 Nov 2025 19:59:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 303CD6013F;
	Mon, 10 Nov 2025 19:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D79C116B1;
	Mon, 10 Nov 2025 19:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762804755;
	bh=wTnqwKhS+4PIH92TTwaqkXzXibgTx5JR53nrD4Z6ed4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HaLaT3JMP3hIC3CDosn1iMi1gDO/ywlO3P/pwUD8CTRbVSSwNbZrKB1DME5dhEYN0
	 p1P9Dl+JZXXEdBP4rBLJ93uFiMublnmBr9MWG/g1zq6Go5+L0UPdfk3x+Tm2Epdzgz
	 pmHbp5ZVfEy6HzE7oMEKCpuxu/wcScdtQs3XKu/hy2HXEcG++sqkvPw9tMKpsTmOMz
	 6KQyP7o0g3SZpvXAPt3wCVw4UoVn8vVFj/MCEEmTljRMkYkBZwsvpw7g2qacJmuzwA
	 Tuefvy8TiAyC9r7GnuL1MGyEJ8fCsDiVypDeLEdxo4UahbFRpEo1f4TFeLdjuGnt3P
	 DRoQiSAlHQ/Tw==
Date: Mon, 10 Nov 2025 20:59:08 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, FUKAUMI Naoki <naoki@radxa.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Anand Moon <linux.amoon@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dragan Simic <dsimic@manjaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [RESEND] Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
Message-ID: <aRJEDEEJr9Ic-RKN@fedora>
References: <55EB0E5F655F3AFC+136b89fd-98d4-42af-a99d-a0bb05cc93f3@radxa.com>
 <aRCI5kG16_1erMME@ryzen>
 <F8B2B6FA2884D69A+b7da13f2-0ffb-4308-b1ba-0549bc461be8@radxa.com>
 <780a4209-f89f-43a9-9364-331d3b77e61e@rock-chips.com>
 <4487DA40249CC821+19232169-a096-4737-bc6a-5cec9592d65f@radxa.com>
 <363d6b4d-c999-43d4-866e-880ef7d0dec3@rock-chips.com>
 <0C31787C387488ED+fd39bfe6-0844-4a87-bf48-675dd6d6a2df@radxa.com>
 <dc932773-af5b-4af7-a0d0-8cc72dfbd3c7@rock-chips.com>
 <aRHb4S40a7ZUDop1@ryzen>
 <2n3wamm3txxc6xbmvf3nnrvaqpgsck3w4a6omxnhex3mqeujib@2tb4svn5d3z6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2n3wamm3txxc6xbmvf3nnrvaqpgsck3w4a6omxnhex3mqeujib@2tb4svn5d3z6>
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

On Mon, Nov 10, 2025 at 09:23:02PM +0530, Manivannan Sadhasivam wrote:
> > 
> > Considering what Shawn says, that the switch gets enumerated properly
> > if we simply add a msleep() in ->start_link(), which will be called
> > by dw_pcie_host_init() before pci_host_probe() is called...
> > 
> 
> Yes, that delay probably gives enough time for the link up IRQ to kick in before
> the initial bus scan happens.

I think that the problem is that even for platforms with link up IRQ,
we will always do:
1) dw_pcie_start_link() (if (!dw_pcie_link_up()))
2) pci_host_probe() from dw_pcie_host_init(), this will enumerate the bus
3) pci_rescan_bus() from the Link Up IRQ handler

Thus, in 2, when enumerating the bus, without performing any of the delays
mandated by the PCIe spec, it still seems possible to detect a device (it
must have been really quick to initialize), and to communicate with that
device, however since we have not performed the delays mandated by the spec,
it appears that the device might not yet behave properly.

Hence my suggestion to never call pci_host_probe() in dw_pcie_host_init()
for platforms with Link Up IRQ.

At least for pcie-dw-rockchip.c, we only unmask the Link Up IRQ after
dw_pcie_host_init() has returned, so I think that your theory: that Shawn's
suggested delay causes the Link Up IRQ to kick in before the initial bus
scan, is incorrect. (Since the IRQ should not be able to trigger until
dw_pcie_host_init() has returned.)


> 
> > ...we already have a delay in the link up IRQ handler, before calling
> > pci_rescan_bus().
> > 
> 
> That delay won't help in this case.

Sure, I was just saying that even though Shawn's patch made things work,
it seems incorrect, as we do not want to add "the same delay" that we
already have in the Link Up IRQ. (The delay in the Link Up IRQ should be
the only one.)


> > I think a better solution would be something like:

(snip)

> This solution will work as long as the PCIe device is powered ON before
> start_link(). For CEM and M.2 Key M connectors, the host controller can power
> manage the components. But for other specifications/keys requiring custom power
> management, a separate driver would be needed.
> 
> That's why I suggested using pwrctrl framework as it can satisfy both usecases.
> However, as I said, it needs a bit of rework and I'm close to submitting it.
> 
> But until that gets merged, either we need to revert your link up IRQ change or
> have the below patch. IMO, the revert seems simple.

Using pwrctrl framework once it can handle this use case sounds good to me.

FUKAUMI, could you please send a revert of the two patches?


Kind regards,
Niklas

