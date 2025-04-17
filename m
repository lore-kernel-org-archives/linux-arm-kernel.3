Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94454C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 07:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6B2dY3fYXdmiU3prHumoC/fqyLfNd9x6nNiSYI/1yfQ=; b=rtWtKYQxOlsZ9gyvCgSqv+/1YF
	UynhnlN4iRTzYHaG2dgZYUEQy4fQnp7GNWeGZ2ZUxHJBWJhtmvJuNNUt+1Fubxb5JxBNZYQ1bctEk
	5v/UVDHFNiW3+1Sq6j77kgjX9rIQKui+iwTsLoFGTFnSsiEnYEKxaQ0SBsMnxe5N/xm6eS3s8aMD+
	q/xV7m7IO3lwCTZKiwhez0N7tdI/EVF9Itaz98vuUXcOk0JSmv/sjUPeDWnAS/xDcg1HtHMbb3hOB
	exhSGixBuOevCZ1cCI5Ec6vnXHXwFUgytDmX27IlhGY3K90Kn0o35tngaZG+gdOHarTLyYm/JnfNT
	5frHK2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JE8-0000000C02g-1qrp;
	Thu, 17 Apr 2025 07:00:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5J8P-0000000By0r-2VPJ;
	Thu, 17 Apr 2025 06:54:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 726DDA4B198;
	Thu, 17 Apr 2025 06:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F3EC4CEE4;
	Thu, 17 Apr 2025 06:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744872844;
	bh=zGx86VkJkAakclDafCUd0oRxkLBcph7gdNZjHRMEECk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T0vzRiicC8CgwUdGtXlwnPeRM3Fy1/8/xHDj4ghRoMEXHFXlaYkcTczfT8Y2qVpOc
	 2Y+1fAHYD4qrAMc2Fy2tQxPS0pRupS41t4ZneW8LtuLQLCk8C3zd4rsbcUSCtYkoKG
	 bc7BUp5qxGJVXz4X/kgqEyl+Vep9c5AP0Csv+DEHTI68ICAIZ8dtqL717ufU2sQNh2
	 VkkUkSuTgqDX7OcylvDtkSykf+MrTPXHdA5r2bz8YrmXYQItiJfZ5D+ihEJWh3GIOc
	 uh1dZmxudlOO0bdzxP22b2IOOEgmjq74k30KBrh46I5PuJKzprqLRNA2V/mO7HHmAD
	 JlrieEajUPb7g==
Date: Thu, 17 Apr 2025 08:53:58 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, lpieralisi@kernel.org, kw@linux.com,
	bhelgaas@google.com, heiko@sntech.de,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, thomas.richard@bootlin.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
Message-ID: <aAClhmwO3caYMonN@ryzen>
References: <20250416204051.GA78956@bhelgaas>
 <bb40385c-6839-484c-90b2-d6c7ecb95ba9@163.com>
 <aACZP48pWk5Y62dK@ryzen>
 <a8cc995e-c6d5-4079-b6d9-765f76a7ec7a@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8cc995e-c6d5-4079-b6d9-765f76a7ec7a@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_235405_761190_DD2E5191 
X-CRM114-Status: GOOD (  36.03  )
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

On Thu, Apr 17, 2025 at 02:47:23PM +0800, Hans Zhang wrote:
> On 2025/4/17 14:01, Niklas Cassel wrote:
> > On Thu, Apr 17, 2025 at 10:19:10AM +0800, Hans Zhang wrote:
> > > On 2025/4/17 04:40, Bjorn Helgaas wrote:
> > > > On Wed, Apr 16, 2025 at 11:19:26PM +0800, Hans Zhang wrote:
> > > > > The RK3588's PCIe controller defaults to a 128-byte max payload size,
> > > > > but its hardware capability actually supports 256 bytes. This results
> > > > > in suboptimal performance with devices that support larger payloads.
> > > > > 
> > > > > Signed-off-by: Hans Zhang <18255117159@163.com>
> > > > > ---
> > > > >    drivers/pci/controller/dwc/pcie-dw-rockchip.c | 18 ++++++++++++++++++
> > > > >    1 file changed, 18 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > > > > index c624b7ebd118..5bbb536a2576 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > > > > @@ -477,6 +477,22 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
> > > > >    	return IRQ_HANDLED;
> > > > >    }
> > > > > +static void rockchip_pcie_set_max_payload(struct rockchip_pcie *rockchip)
> > > > > +{
> > > > > +	struct dw_pcie *pci = &rockchip->pci;
> > > > > +	u32 dev_cap, dev_ctrl;
> > > > > +	u16 offset;
> > > > > +
> > > > > +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > > > > +	dev_cap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCAP);
> > > > > +	dev_cap &= PCI_EXP_DEVCAP_PAYLOAD;
> > > > > +
> > > > > +	dev_ctrl = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
> > > > > +	dev_ctrl &= ~PCI_EXP_DEVCTL_PAYLOAD;
> > > > > +	dev_ctrl |= dev_cap << 5;
> > > > > +	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, dev_ctrl);
> > > > > +}
> > > > 
> > > > I can't really complain too much about this since meson does basically
> > > > the same thing, but there are some things I don't like about this:
> > > > 
> > > >     - I don't think it's safe to set MPS higher in all cases.  If we set
> > > >       the Root Port MPS=256, and an Endpoint only supports MPS=128, the
> > > >       Endpoint may do a 256-byte DMA read (assuming its MRRS>=256).  In
> > > >       that case the RP may respond with a 256-byte payload the Endpoint
> > > >       can't handle.  The generic code in pci_configure_mps() might be
> > > >       smart enough to avoid that situation, but I'm not confident about
> > > >       it.  Maybe I could be convinced.
> > > > 
> > > 
> > > Dear Bjorn,
> > > 
> > > Thank you very much for your reply. If we set the Root Port MPS=256, and an
> > > Endpoint only supports MPS=128. Finally, Root Port is also set to MPS=128 in
> > > pci_configure_mps.
> > 
> > In you example below, the Endpoint has:
> >   DevCap: MaxPayload 512 bytes
> > 
> > So at least your example can't be used to prove this specific point.
> > But perhaps you just wanted to show that your Max Payload Size increase
> > actually works?
> > 
> 
> Dear Niklas,
> 
> Do you have an Endpoint with MPS=128? If so, you can also help verify the
> logic of the pci_configure_mps function. I don't have an Endpoint with
> MPS=128 here.

I imagine that it would be trivial to test with a PCIe controller running
in endpoint mode with the PCI endpoint subsystem in the kernel.
(As you should be able to set CAP.MPS before starting link training.)


> The processing logic of the pci_configure_mps function has been verified on
> our own SOC platform. Please refer to the following log.
> Our Root Port will set MPS=512.

(snip)

Ok, since it works to downgrade 512B to 256B, I would imagine that it also
would downgrade to 128B properly.


Kind regards,
Niklas

