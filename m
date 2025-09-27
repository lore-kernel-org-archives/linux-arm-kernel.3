Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F09CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 03:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZaujxbR87IWPXawB0juYj+itNZtrWXuBYx+nqx7Q/0=; b=vxEuI9AS0iQEYffHa/n2PKROh6
	slDzg+3L4UUeklMjUZmaQOruSpGWAWxJhwIisGc5+Bb/+zIHwTV3hkPuG+Q7HdUEazCGozINJQIj3
	QEUnfxgETXbEaq+30udPWhQ/g8QRaeInnUYpa4/sd2Sm0CXfoFi/w3nkDj570oLDNCm5QhjmWCOWP
	9ezwdjn9wYGZN+QVrQeZWjL3IhDVPlPjFhQi1Q8qUx+OAJlKxeFE+qbSm46+2Zn7eib6TxZTWLbq7
	vfukp5Lj+Vgl6kdm82wrk9POvJFItQAlQ9bHSdeuV6R7+xr3UI7JesbNo1PioGQFFTNgwLEkbNDP7
	ZW6/KzjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2LzV-00000006od3-11Fp;
	Sat, 27 Sep 2025 03:52:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2LzT-00000006obN-07zT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 03:52:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B038B45A18;
	Sat, 27 Sep 2025 03:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACF4C4CEE7;
	Sat, 27 Sep 2025 03:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758945173;
	bh=W/z5cqAffsitkvS3CbuGOrlcjmQu/FBVIDqgLsCp8p8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=afLb2RSqGIIpgahmXAMZRfTysN7c1Dd/ZiZIsaQk5XOLHULfcAdf4deyC2gcAOHfx
	 BWgtesSCx/m/1oPyP18AO7ij+rcOpqM7jaDuyOGijs3UY9j6G3NswqLY5WsPcqk2PA
	 SIZ2JesLIyC30hmZP5h90FESCR1VIwjaS/0xy+9gXZDqhbr0qMAOjjgIoG57x0pw92
	 /qucid6M0/DYR3toxdvqvMh9HWbvrFtRJtCIwNa/oXPTiwfNkwLej/iKwBfOsLR1Gg
	 mViNAN8nqAlZSheI95C2THZMAGXjxGnLvzHnIPsPu4lzwdZnasycb4bORvZFdiYRsb
	 JjKXwMSmipjEQ==
Date: Sat, 27 Sep 2025 09:22:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, chaitanya chundru <quic_krichai@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com, 
	amitk@kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v6 5/9] PCI: dwc: Implement .start_link(), .stop_link()
 hooks
Message-ID: <3tuxxskusi5ck7cu2nqfkilqdqvzqjy77qgpvuo4nhcugdebug@geqxeslmxmdr>
References: <4a3f9494-27a2-47d6-bdef-0b1bcbd99903@oss.qualcomm.com>
 <20250926203916.GA2266029@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926203916.GA2266029@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_205255_114757_71B2AE83 
X-CRM114-Status: GOOD (  44.78  )
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

On Fri, Sep 26, 2025 at 03:39:16PM -0500, Bjorn Helgaas wrote:
> On Fri, Sep 26, 2025 at 07:09:17PM +0530, Krishna Chaitanya Chundru wrote:
> > On 9/25/2025 10:55 PM, Bjorn Helgaas wrote:
> > > On Thu, Sep 25, 2025 at 09:49:16PM +0530, Manivannan Sadhasivam wrote:
> > > > On Thu, Sep 25, 2025 at 09:54:16AM -0500, Bjorn Helgaas wrote:
> > > > > On Thu, Aug 28, 2025 at 05:39:02PM +0530, Krishna Chaitanya Chundru wrote:
> > > > > > Implement stop_link() and  start_link() function op for dwc drivers.
> > > > > > 
> > > > > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > > > > ---
> > > > > >   drivers/pci/controller/dwc/pcie-designware-host.c | 18 ++++++++++++++++++
> > > > > >   1 file changed, 18 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > > > > index 952f8594b501254d2b2de5d5e056e16d2aa8d4b7..bcdc4a0e4b4747f2d62e1b67bc1aeda16e35acdd 100644
> > > > > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > > > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > > > > @@ -722,10 +722,28 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
> > > > > >   }
> > > > > >   EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
> > > > > > +static int dw_pcie_op_start_link(struct pci_bus *bus)
> > > > > > +{
> > > > > > +	struct dw_pcie_rp *pp = bus->sysdata;
> > > > > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > > > > +
> > > > > > +	return dw_pcie_host_start_link(pci);
> > > > > 
> > > > > This takes a pci_bus *, which could be any PCI bus, but this only
> > > > > works for root buses because it affects the link from a Root Port.
> > > > > 
> > > > > I know the TC9563 is directly below the Root Port in the current
> > > > > topology, but it seems like the ability to configure a Switch with
> > > > > I2C or similar is potentially of general interest, even if the
> > > > > switch is deeper in the hierarchy.
> > > > > 
> > > > > Is there a generic way to inhibit link training, e.g., with the
> > > > > Link Disable bit in the Link Control register?  If so, this could
> > > > > potentially be done in a way that would work for any vendor and
> > > > > for any Downstream Port, including Root Ports and Switch
> > > > > Downstream Ports.
> > > > 
> > > > FWIW, the link should not be stopped for a single device, since it
> > > > could affect other devices in the bus. Imagine if this switch is
> > > > connected to one of the downstream port of another switch. Then
> > > > stopping and starting the link will affect other devices connected
> > > > to the upstream switch as well.
> > > 
> > > Link Disable would affect all devices downstream of the bridge where
> > > it is set, same as dw_pcie_op_stop_link().
> > > 
> > > > This driver is doing it right now just because, there is no other
> > > > way to control the switch state machine. Ideally, we would want the
> > > > PERST# to be in asserted stage to keep the device from starting the
> > > > state machine, then program the registers over I2C and deassert
> > > > PERST#. This will work across all of the host controller drivers (if
> > > > they support pwrctrl framework).
> > > 
> > > I don't think there's a way to implement .start_link() and
> > > .stop_link() for ACPI unless it's by using Link Disable, which is why
> > > I asked about this.  If Link Disable *does* work, it would be a very
> > > generic way to do this because it's part of the PCIe base spec.
> > 
> > We did test as you suggested but unfortunately the setting are not
> > getting reflected we need to explicitly assert perst to make sure
> > pcie is in reset state while applying these settings.
> 
> Maybe ".stop_link()" is the wrong name if what's actually required is
> PERST#?
> 

If we rename this callback to foo_perst(), then it will be similar to my Pwrctrl
PERST# integration series [1]. I'm wondering why shouldn't we merge it instead
and get rid of this callback from this series for good?

- Mani

[1] https://lore.kernel.org/linux-pci/20250912-pci-pwrctrl-perst-v3-0-3c0ac62b032c@oss.qualcomm.com/

-- 
மணிவண்ணன் சதாசிவம்

