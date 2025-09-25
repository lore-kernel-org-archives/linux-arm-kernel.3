Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE9BCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 17:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Me/hhkvjWPnZ9KrlVrjtaijLMJdpJVh8Herif1Q87Vg=; b=CejsZW4UQ9D6wC
	naCS3Qb7cVcT2lwClPVrBSMafNcY+PzSoBEHLVM4ZB1HAz20vFT4gd7Uomcwwb0W0DoZXajm16rmR
	asLYeB9Zm+GObrGUYNKr357VSIKgjz5/I7RdEn0BZ5A4n2PKPvlbpXAW8yUR/pZBw87WmW80ndn7v
	oM2yyyNPKzphCSnUR3BkGmTcvTljN7NGlVmkuTIA2QazUyxvuREkFwZg7G7J3gZd52IwS6toC3ORq
	vo4e4rDLNyhp4XlMnEOW/YbXlpiCEblHKFmGwQ+eHTk2ij5BtStHpXRUQJdLtwzN7c6MfFcDhZFxL
	LdQEnnVFhgDR1+4yuauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pib-0000000BWTO-0kAu;
	Thu, 25 Sep 2025 17:25:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pia-0000000BWSo-0nPf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 17:25:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92E7E611A8;
	Thu, 25 Sep 2025 17:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DF0C4CEF0;
	Thu, 25 Sep 2025 17:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758821119;
	bh=vdDtnd7eralUvO1XlLeDfYnMfW2wY9yiVB9StQbyH5g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lkwYG/vUo/EzJ1jKlWOOEn0aUxEoQ862XOvuqFQ1HWIWXVCw8SLuwWFk4Fx7INazg
	 AYxo/tvw14FhUtCBX+5CzFGq5H8eG0qu7nk+QpdwPBzV6YlVt/Fivwrs25d2uisYZA
	 LXv4LQr6Q7yfS3zg3wG8Eu/JsXLyuQurV9HquIahNtTZ0Wm+vCI0BUTRXZasvWNvOj
	 GaSOYG1/rqSFThGrnD2AqDnGj78ARhBTvhJ6DX84WQ0L2+NubSUymF2znFkLIY+SbF
	 M7zqNIZqk4GuJ/HEedGgXWBInI8ICSRT0nk5HRIXSOvRG/epW6AglVRqX/fQk7cB6i
	 8kMkZJC0QZuaQ==
Date: Thu, 25 Sep 2025 12:25:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	chaitanya chundru <quic_krichai@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
	amitk@kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v6 5/9] PCI: dwc: Implement .start_link(), .stop_link()
 hooks
Message-ID: <20250925172517.GA2169496@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yofmk5uyykyv4jxzem622dtuyzknk7ipd5xlkzdrfl5v7tgojy@5aarg5wj6bar>
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

On Thu, Sep 25, 2025 at 09:49:16PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Sep 25, 2025 at 09:54:16AM -0500, Bjorn Helgaas wrote:
> > On Thu, Aug 28, 2025 at 05:39:02PM +0530, Krishna Chaitanya Chundru wrote:
> > > Implement stop_link() and  start_link() function op for dwc drivers.
> > > 
> > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-designware-host.c | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > index 952f8594b501254d2b2de5d5e056e16d2aa8d4b7..bcdc4a0e4b4747f2d62e1b67bc1aeda16e35acdd 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -722,10 +722,28 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
> > >  }
> > >  EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
> > >  
> > > +static int dw_pcie_op_start_link(struct pci_bus *bus)
> > > +{
> > > +	struct dw_pcie_rp *pp = bus->sysdata;
> > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > +
> > > +	return dw_pcie_host_start_link(pci);
> > 
> > This takes a pci_bus *, which could be any PCI bus, but this only
> > works for root buses because it affects the link from a Root Port.
> > 
> > I know the TC9563 is directly below the Root Port in the current
> > topology, but it seems like the ability to configure a Switch with
> > I2C or similar is potentially of general interest, even if the
> > switch is deeper in the hierarchy.
> > 
> > Is there a generic way to inhibit link training, e.g., with the
> > Link Disable bit in the Link Control register?  If so, this could
> > potentially be done in a way that would work for any vendor and
> > for any Downstream Port, including Root Ports and Switch
> > Downstream Ports.
> 
> FWIW, the link should not be stopped for a single device, since it
> could affect other devices in the bus. Imagine if this switch is
> connected to one of the downstream port of another switch. Then
> stopping and starting the link will affect other devices connected
> to the upstream switch as well.

Link Disable would affect all devices downstream of the bridge where
it is set, same as dw_pcie_op_stop_link().

> This driver is doing it right now just because, there is no other
> way to control the switch state machine. Ideally, we would want the
> PERST# to be in asserted stage to keep the device from starting the
> state machine, then program the registers over I2C and deassert
> PERST#. This will work across all of the host controller drivers (if
> they support pwrctrl framework).

I don't think there's a way to implement .start_link() and
.stop_link() for ACPI unless it's by using Link Disable, which is why
I asked about this.  If Link Disable *does* work, it would be a very
generic way to do this because it's part of the PCIe base spec.

Bjorn

