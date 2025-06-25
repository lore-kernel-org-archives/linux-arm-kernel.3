Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A73C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoj5DQBFfozLhxYzpTmAzmlE6U+HHEUKa05YpVInAPU=; b=Uw/aEzoEbwZcqAayXlRgpwk0uq
	yJ2z4Xrhmh94hkiXxD4FAhkViwQJpvY7DkEpTKG26gKFXPyRFP+Mv83fcuCSNCcqkJEKiAr09QT0y
	otVZNnLRfb2XPl3oKItjaIq+DDXL6skpZ2+OfmA1kRY/J5B+6f28GHSRFAPDQ3DpJp7x3R+yJALnV
	CiyZCJ8dj2bgFVa7zTNKRhdLto2hNGxf5rqJQEUoI6HcBDfJDqwUCB7K4EuMQLbnyO5WsdmBJw9Gz
	lvF0WsfxQujjtZpOVIhSluvI8q0cMc0dXIH+Ww+I9itK/PXKCuqcgqRrctHixMnYhIY7BaXgcrvdg
	jJMFcb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYCE-0000000A1xh-4BAX;
	Wed, 25 Jun 2025 22:02:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXxK-00000009zla-2EED
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 21:47:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78ADF4499F;
	Wed, 25 Jun 2025 21:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD87DC4CEEA;
	Wed, 25 Jun 2025 21:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750888017;
	bh=rP0WyBPNVewCeJIIMueDmqciWzxLfKXmCz5SEfqzKHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tYQ7w1nZ7Jtv6C59J4um6Pb8Gg9HSCTZNbn5fe7V6pGdSPXw7CDZibZxkKT2Xf5h9
	 pUqypdtM/d3RhNIPNPjJvxo1Z8jRQLMLZ2+aKe5reEmifaV/Z+LWGUHU9P+g9w0AVy
	 +KA7WeM4AHKGeMEadUTycV138byHWUzVfSMsLYG6Z2e3R+OddtXN14o3by84r9vsPN
	 A4RcrzLg6vH7j7h/ux+FM/UmUVEtp2r+tPqELdoj8wH5vUoPBEjBSNgvkccVHUKZx9
	 +e11QGTS6Q5Umv0aQB/JFXhvc1yGEuBjNUcc7X58N0yW6GfI2e1BIfrFd1r5a5ONi4
	 Msdpp25yqr3yA==
Date: Wed, 25 Jun 2025 15:46:54 -0600
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] PCI: xilinx: Wait for link-up status during
 initialization
Message-ID: <vwipw5opvx42e6l7ofphg47rlsoebbts7dwzq5knaf4iz4hmhw@gk6lo4b6plxh>
References: <20250610185734.GA819344@bhelgaas>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.bd37b5e5-7e20-4db7-b2f4-b11b97bc1326@emailsignatures365.codetwo.com>
 <9f8a7c43-4862-45aa-951c-bf3e3c1f5513@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f8a7c43-4862-45aa-951c-bf3e3c1f5513@topic.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_144658_609533_F888F38E 
X-CRM114-Status: GOOD (  33.35  )
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

On Wed, Jun 11, 2025 at 08:48:51AM +0200, Mike Looijmans wrote:
> 
> Met vriendelijke groet / kind regards,
> 
> Mike Looijmans
> System Expert
> 
> 
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
> 
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topic.nl
> W: www.topic.nl
> 
> Please consider the environment before printing this e-mail
> On 10-06-2025 20:57, Bjorn Helgaas wrote:
> > On Tue, Jun 10, 2025 at 04:39:03PM +0200, Mike Looijmans wrote:
> > > When the driver loads, the transceiver and endpoint may still be setting
> > > up a link. Wait for that to complete before continuing. This fixes that
> > > the PCIe core does not work when loading the PL bitstream from
> > > userspace. Existing reference designs worked because the endpoint and
> > > PL were initialized by a bootloader. If the endpoint power and/or reset
> > > is supplied by the kernel, or if the PL is programmed from within the
> > > kernel, the link won't be up yet and the driver just has to wait for
> > > link training to finish.
> > > 
> > > As the PCIe spec allows up to 100 ms time to establish a link, we'll
> > > allow up to 200ms before giving up.
> > > +static int xilinx_pci_wait_link_up(struct xilinx_pcie *pcie)
> > > +{
> > > +	u32 val;
> > > +
> > > +	/*
> > > +	 * PCIe r6.0, sec 6.6.1 provides 100ms timeout. Since this is FPGA
> > > +	 * fabric, we're more lenient and allow 200 ms for link training.
> > > +	 */
> > > +	return readl_poll_timeout(pcie->reg_base + XILINX_PCIE_REG_PSCR, val,
> > > +			(val & XILINX_PCIE_REG_PSCR_LNKUP), 2 * USEC_PER_MSEC,
> > > +			2 * PCIE_T_RRS_READY_MS * USEC_PER_MSEC);
> > > +}
> > I don't think this is what PCIE_T_RRS_READY_MS is for.  Sec 6.6.1
> > requires 100ms *after* the link is up before sending config requests:
> > 
> >    For cases where system software cannot determine that DRS is
> >    supported by the attached device, or by the Downstream Port above
> >    the attached device:
> > 
> >      ◦ With a Downstream Port that does not support Link speeds greater
> >        than 5.0 GT/s, software must wait a minimum of 100 ms following
> >        exit from a Conventional Reset before sending a Configuration
> >        Request to the device immediately below that Port.
> > 
> >      ◦ With a Downstream Port that supports Link speeds greater than
> >        5.0 GT/s, software must wait a minimum of 100 ms after Link
> >        training completes before sending a Configuration Request to the
> >        device immediately below that Port. Software can determine when
> >        Link training completes by polling the Data Link Layer Link
> >        Active bit or by setting up an associated interrupt (see §
> >        Section 6.7.3.3).  It is strongly recommended for software to
> >        use this mechanism whenever the Downstream Port supports it.
> > 
> Yeah, true, I misread the comment in pci.h. I cannot find any #define to
> match the "how long to wait for link training". Each driver appears to use
> its own timeout. So I should just create my own?
> 

We recently merged a series that moved the timing definitions to
drivers/pci/pci.h:
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/linkup-fix&id=470f10f18b482b3d46429c9e6723ff0f7854d049

So if you base your series on top this branch, you could reuse the definitions.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

