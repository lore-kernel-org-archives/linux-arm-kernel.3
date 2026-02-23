Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2C3EC1126
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 19:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tDhTea5Z/cq+gIpl8VyeliU5DIMXia7dLvxi+UQ2BR8=; b=OCVhKOmzpIBK1CQ0ami58m8qwW
	AE4qTj8/wRK6dNvFkLmqDztNjUXy7Qd6mNpDacc+cYVARfjvv3JQp9lqoAqNwi94cwJaUvNzI7Igt
	IeOo6LjabEuqU0Ti0+1iHgNOSClyijYXaJRzG3MswOl03wmevtGV3o3nnS/TeR/wwiWiUo2aNqMJo
	YdlM+wgKLR0gYdOreXMUJUgtmxLtbBy7ucS8C1sQROo+p52kHY6gpdX8V2hDX/7sTIpyyCS3dW7ZE
	3uDdAzFIt+ORxltaiqjjp3ytKbu2t7wt98KMSRdWf+z5+OZBXof6UVITzrFguUFgzWlg8IqtoZ/hW
	b7/ydbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuc1R-00000000xeZ-3s8C;
	Mon, 23 Feb 2026 19:55:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuc1P-00000000xdy-0caZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 19:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6232141B1F;
	Mon, 23 Feb 2026 19:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D50AC116C6;
	Mon, 23 Feb 2026 19:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771876510;
	bh=i7p1CmNCkpa7NXd9zIoDHL+Mlb5Osw0tzfGBKWXI128=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cNi8FQkh1tR1+gLalvCR2h4vd1UPNsR4NYnjRtbue7OOiJD6d8rJYIPGiExF7wIya
	 QyvPktXMmsNoCjSttoEHWkJapKD+D4x6MzO3KrJc6Jqe7kYXZmreQLEQ6FMR0k34+m
	 O/AeadylZMKNIQ7tD8U8KnAbdssJfQOk6YvOO4DcE8uN1N82VJU15Wl7NyC3R+ZWa4
	 sz4jlFM8P++iMwoPXGlf4U0FDeOA4856SM66lLy8itnt3gh5AMIfxSkvyPnMYEAvVs
	 TC0C3PiN/WBEdesl5UnlpAD12/+wupJKbsMqlObn0i8Sn5slngkFfuWe3DL7xqGDZN
	 caC3VkVozKl9A==
Date: Mon, 23 Feb 2026 13:55:08 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com,
	bjorn.andersson@oss.qualcomm.com, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
Message-ID: <20260223195508.GA3703404@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0h8dQ10oH4KQM8Pdv0jvXyTE6yD1fn5eBPkS_jDYgA8gQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_115511_232335_4E9903F5 
X-CRM114-Status: GOOD (  37.83  )
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

On Mon, Feb 23, 2026 at 07:46:08PM +0100, Rafael J. Wysocki wrote:
> On Mon, Feb 23, 2026 at 7:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Tue, Feb 17, 2026 at 04:49:06PM +0530, Krishna Chaitanya Chundru wrote:
> > > Add a common helper, pci_host_common_can_enter_d3cold(), to determine
> > > whether a PCI host bridge can safely transition to D3cold.
> > >
> > > This helper is intended to be used by PCI host controller drivers to
> > > decide whether they may safely put the host bridge into D3cold based on
> > > the power state and wakeup capabilities of downstream endpoints.
> > >
> > > The helper walks all devices on the bridge's primary bus and only allows
> > > the host bridge to enter D3cold if all PCIe endpoints are already in
> > > PCI_D3hot. This ensures that we do not power off the host bridge while
> > > any active endpoint still requires the link to remain powered.
> > >
> > > For devices that may wake the system, the helper additionally requires
> > > that the device supports PME wake from D3cold (via WAKE#). Devices that
> > > do not have wakeup enabled are not restricted by this check and do not
> > > block the host bridge from entering D3cold.
> > >
> > > Devices without a bound driver and with PCI not enabled via sysfs are
> > > treated as inactive and therefore do not prevent the host bridge from
> > > entering D3cold. This allows controllers to power down more aggressively
> > > when there are no actively managed endpoints.
> >
> > This series is currently structured so it's only applicable to native
> > host bridge drivers, i.e., things using DT.  Is there anything that
> > prevents using D3cold for host bridges in ACPI systems?
> 
> Do you mean in principle or in practice?

Just in principle.  I was hoping for some way to tie this decision
making back to a spec.  Everything downstream being in D3 already, and
any wakeup devices supporting PME from D3cold sounds plausible to me,
but I don't know about any prescriptive spec language, and I wouldn't
want to get locked into a scheme that couldn't be supported on ACPI.

> x86 platforms don't support PCI host bridge PM AFAICS and the ACPI
> driver doesn't support PM either.  I'd rather not add it ad hoc
> because of this patch series.

Agreed.

> > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > ---
> > >  drivers/pci/controller/pci-host-common.c | 45 ++++++++++++++++++++++++++++++++
> > >  drivers/pci/controller/pci-host-common.h |  2 ++
> > >  2 files changed, 47 insertions(+)
> > >
> > > diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> > > index d6258c1cffe5ec480fd2a7e50b3af39ef6ac4c8c..b0a4a3c995e80e0245657f0273a349334071013c 100644
> > > --- a/drivers/pci/controller/pci-host-common.c
> > > +++ b/drivers/pci/controller/pci-host-common.c
> > > @@ -106,5 +106,50 @@ void pci_host_common_remove(struct platform_device *pdev)
> > >  }
> > >  EXPORT_SYMBOL_GPL(pci_host_common_remove);
> > >
> > > +static int pci_host_common_check_d3cold(struct pci_dev *pdev, void *userdata)
> > > +{
> > > +     bool *d3cold_allow = userdata;
> > > +
> > > +     if (pci_pcie_type(pdev) != PCI_EXP_TYPE_ENDPOINT)
> > > +             return 0;
> > > +
> > > +     if (!pdev->dev.driver && !pci_is_enabled(pdev))
> > > +             return 0;
> > > +
> > > +     if (pdev->current_state != PCI_D3hot)
> > > +             goto exit;
> > > +
> > > +     if (device_may_wakeup(&pdev->dev) && !pci_pme_capable(pdev, PCI_D3cold))
> > > +             goto exit;
> > > +
> > > +     return 0;
> > > +exit:
> > > +     *d3cold_allow = false;
> > > +     return -EBUSY;
> > > +}
> > > +
> > > +/**
> > > + * pci_host_common_can_enter_d3cold - Determine whether a host bridge may enter D3cold
> > > + * @bridge: PCI host bridge to check
> > > + *
> > > + * Walk downstream PCIe endpoint devices and determine whether the host bridge
> > > + * is permitted to transition to D3cold.
> > > + *
> > > + * The host bridge may enter D3cold only if all active PCIe endpoints are in
> > > + * %PCI_D3hot and any wakeup-enabled endpoint is capable of generating PME from
> > > + * D3cold. Inactive endpoints are ignored.
> > > + *
> > > + * Return: %true if the host bridge may enter D3cold, otherwise %false.
> > > + */
> > > +bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge)
> > > +{
> > > +     bool d3cold_allow = true;
> > > +
> > > +     pci_walk_bus(bridge->bus, pci_host_common_check_d3cold, &d3cold_allow);
> > > +
> > > +     return d3cold_allow;
> > > +}
> > > +EXPORT_SYMBOL_GPL(pci_host_common_can_enter_d3cold);
> > > +
> > >  MODULE_DESCRIPTION("Common library for PCI host controller drivers");
> > >  MODULE_LICENSE("GPL v2");
> > > diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
> > > index b5075d4bd7eb31fbf1dc946ef1a6afd5afb5b3c6..18a731bca058828340bca84776d0e91da1edbbf7 100644
> > > --- a/drivers/pci/controller/pci-host-common.h
> > > +++ b/drivers/pci/controller/pci-host-common.h
> > > @@ -20,4 +20,6 @@ void pci_host_common_remove(struct platform_device *pdev);
> > >
> > >  struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
> > >       struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
> > > +
> > > +bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge);
> > >  #endif
> > >
> > > --
> > > 2.34.1
> > >

