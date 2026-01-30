Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0B0D73E86
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 03:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLk+ZfZUvp3VqHQNTRlsICcX9kjBrpCEpl7vzPnsVJ8=; b=W/dSvDk+VL6R8pUE3csAHrAgDB
	InqBNtvP3ebi+CsIeolDD6TW8BN9FEljjyP4+OWXTUmjLVVPIpU1xbu2uHxUIthYnRnbkMRBhIoIJ
	uYJaLfV2M18Tsw2qgIiD1G6P7KMjDESxtXduiZ8Dq/2NzOKAcMJEypUTEl8LGBst/N9BJoXA7f+6C
	vus5XDEjWLkIVvUwbofF0Xv1Db3O3DJnBxVgRpFyMYDFUPjxRCjXQ1QyK9Dq6phB+TMh++t1prcJA
	deTx7ZiT9psKN7r/L5Q1+BK8ghKVGgo1rzQIiUFDo1Znr2wPWZMgvXRR2XEpEACw/0doz3vMS6DLJ
	uDjZeH0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlfDA-00000000xeY-3ZLr;
	Fri, 30 Jan 2026 03:30:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlfD8-00000000xeP-3eq3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 03:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ECB1160125;
	Fri, 30 Jan 2026 03:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF35C4CEF7;
	Fri, 30 Jan 2026 03:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769743817;
	bh=okHqWEPNmTmLXzWUsl1Zg7XjbwpS3tu5EZ2NM0mJEeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JoAb7VsD45CW+h+5tdwec67bELx1JS4HsmrJJC7JbW+UGBeyMUK6X2rOsAMOiinwk
	 qB/YWDu5Gf0o0dzFLIO58/FztoKUf2ce20dK+Oj+B4ibsic1UlNDgaqfxT4+lDZLan
	 OHZsevrBE5eTEE1haTCoT3+kx7KxEQ1eXw0r5uR6R6wR/Z2RmikIXYqAYyfKMEGIbY
	 u8XLFTJTonRPL7k2Sm5v0KuhnSUn0ub9XzS1eOAv0aK/5aCdo4wlFAGxTr1agZvrYO
	 X3PvLjv90CcRu2dorgVj9ZRHTi0WhxFCVPbmPWAHcyxeogETjiTqYdBqXyXUgfEd+f
	 Ni70RVyA7BoZA==
Date: Thu, 29 Jan 2026 21:30:14 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
Subject: Re: [PATCH 1/3] PCI: host-common: Add shared D3cold eligibility
 helper for host bridges
Message-ID: <bz2dnldnx2z6o3jtm7hdy4f3azmd4ug2sq2pi7anuar7s7xssq@b7cqfkr7pd36>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <20260128-d3cold-v1-1-dd8f3f0ce824@oss.qualcomm.com>
 <kztudduots342zz7gnx3twtlvjm5pd7sde627zxcsbe6c2imqk@7mmp7vjght5j>
 <832e8ea4-2b85-4513-a285-9d4ab1dd66b0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <832e8ea4-2b85-4513-a285-9d4ab1dd66b0@oss.qualcomm.com>
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

On Thu, Jan 29, 2026 at 11:08:57AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 1/28/2026 7:56 PM, Bjorn Andersson wrote:
> > On Wed, Jan 28, 2026 at 05:10:41PM +0530, Krishna Chaitanya Chundru wrote:
> > > Add a common helper, pci_host_common_can_enter_d3cold(), to determine
> > > whether a PCI host bridge can safely transition to D3cold.
> > Please read https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > 
> > It clearly says that you're supposed to start your commit message with a
> > description of the problem you're solving. In fact, even after reading
> > the entire commit message a few times I only know what the patch does,
> > but it's not clear to me why this patch exists.
> > 
> > > The helper walks all devices on the bridge's bus and only allows the
> > > host bridge to enter D3cold if all PCIe endpoints are already in
> > > PCI_D3hot.
> > The code below does walk the bus, but it doesn't allow/disallow anything
> > as far as I can tell, it queries their type, state, and if they are wake
> > capable?
> > 
> > > For devices that may wake the system, it additionally
> > > requires that the device supports PME wakeup from D3cold(with WAKE#).
> > > Devices without wakeup enabled are not restricted by this check and can
> > > be allowed to keep device in D3cold.
> > > 
> > Again, this code doesn't perform any action, it doesn't
> > allow/disallow/restrict the devices from doing anything, it merely
> > queries a bunch of things across all devices, and the commit message
> > fails to capture why this is useful.
> This is a helper function used by controller drivers, to know if the
> controller
> driver can keep in D3cold state or not. we use endpoint states and their
> wakeup
> capability support to determine d3cold can be supported or not. The return
> value
> of this function will tell controller drivers to know if we can allow D3cold
> or not.

Please make sure that the commit message captures this.

Regards,
Bjorn

> > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > ---
> > >   drivers/pci/controller/pci-host-common.c | 29 +++++++++++++++++++++++++++++
> > >   drivers/pci/controller/pci-host-common.h |  2 ++
> > >   2 files changed, 31 insertions(+)
> > > 
> > > diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> > > index c473e7c03bacad2de07c798768f99652443431e0..225472c5ac82c6c5b44257d68a0fc503ec046ff1 100644
> > > --- a/drivers/pci/controller/pci-host-common.c
> > > +++ b/drivers/pci/controller/pci-host-common.c
> > > @@ -106,5 +106,34 @@ void pci_host_common_remove(struct platform_device *pdev)
> > >   }
> > >   EXPORT_SYMBOL_GPL(pci_host_common_remove);
> > > +static int pci_host_common_check_d3cold(struct pci_dev *pdev, void *userdata)
> > > +{
> > > +	bool *d3cold_allow = userdata;
> > > +
> > > +	if (pci_pcie_type(pdev) != PCI_EXP_TYPE_ENDPOINT)
> > > +		return 0;
> > > +
> > > +	if (pdev->current_state != PCI_D3hot)
> > > +		goto exit;
> > > +
> > > +	if (device_may_wakeup(&pdev->dev) && !pci_pme_capable(pdev, PCI_D3cold))
> > > +		goto exit;
> > > +
> > > +	return 0;
> > > +exit:
> > > +	*d3cold_allow = false;
> > > +	return -EBUSY;
> > > +}
> > > +
> > > +bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge)
> > Please add kernel-doc for any EXPORT_SYMBOL() functions, so that it's
> > clear to the next guy what the API does.
> Initially, I had a change in my workspace which has kernel-doc, but after
> seeing this
> file I see none of the exported API's had a kernel-doc. Following it I
> dropped the kernel
> -doc at last minute. I will add this in v2.
> 
> - Krishna Chaitanya.
> > 
> > Regards,
> > Bjorn
> > 
> > > +{
> > > +	bool d3cold_allow = true;
> > > +
> > > +	pci_walk_bus(bridge->bus, pci_host_common_check_d3cold, &d3cold_allow);
> > > +
> > > +	return d3cold_allow;
> > > +}
> > > +EXPORT_SYMBOL_GPL(pci_host_common_can_enter_d3cold);
> > > +
> > >   MODULE_DESCRIPTION("Common library for PCI host controller drivers");
> > >   MODULE_LICENSE("GPL v2");
> > > diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
> > > index b5075d4bd7eb31fbf1dc946ef1a6afd5afb5b3c6..18a731bca058828340bca84776d0e91da1edbbf7 100644
> > > --- a/drivers/pci/controller/pci-host-common.h
> > > +++ b/drivers/pci/controller/pci-host-common.h
> > > @@ -20,4 +20,6 @@ void pci_host_common_remove(struct platform_device *pdev);
> > >   struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
> > >   	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
> > > +
> > > +bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge);
> > >   #endif
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > > 
> 

