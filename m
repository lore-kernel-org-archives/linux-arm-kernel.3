Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E035CFD355
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 21:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=mnds9ittkkG0MQy2z7ZBbj3I4X0T9DuA0twtUJAmeNA=; b=amfUJxHbyV/5+5
	jTHmiN4NdmRDSwAsmzfMQCnhLJrd4YSWaOsehexNUtQRtmYDSjCraFlFXPuwvBEuQDooEZOW5Kiei
	mqihBJigwnnz9bjB5U8G/aUvbEdLq/pRuKIFB8JTluPy4q80l0uAYBUiWgDheY9ymptLFir94T80X
	XBgjKKfeOTtKS3xqBw+sGBrCcz6+WgQpS/xjXWQe9rM+8OdzDQ8kYwg8yUCGkhOjS0zOM6jOJ6mcj
	wlepE9Ot2vVmUY61jc39XcJbb3JneEGJai+lcpp4MiXp2POimqzQqqJHcSAB89EGA6r+SksEeiMUC
	7eD+r4z+MvEOXNuPhNxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNe12-0000000CL1z-0MYg;
	Mon, 24 Nov 2025 21:22:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNe10-0000000CL1R-14bp;
	Mon, 24 Nov 2025 21:22:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C11B43690;
	Mon, 24 Nov 2025 21:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB27C4CEFB;
	Mon, 24 Nov 2025 21:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764019349;
	bh=RgrwDiinUzSpRqOGQiyfN+hRdSZO/OtpULDIPl/RaxE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qUnwH3pWJBpE5n0hprzgUyQmQnyYDnqdsNL/7ivetkau8W72rzPw6TL6kyAZV06Cx
	 EESXAQ4m3JglpM69+IQcbANa/HFyP8qH9IXLwafZrKq+OV8OsiNXw7UDN2s3xWfS86
	 iq3U1hEgP0NdFE3xGqp8dkXzBpw21zocJN6AvpzNM2DQC4J5F8Y0wv+ajYA8mS1YIM
	 NSphcDi7VxA//qJ0GbJa8B2of/bu+R600bs7kWLaj+FzTWGKztJcxFQqO5ST1vsMHv
	 IH56mX+FT9s3Pcesq9w7rJJUrVxwhFgELcKZui4Ji52NlX0oO74l74Nq+azyLy8Ntb
	 49DxDSoqMqi4A==
Date: Mon, 24 Nov 2025 15:22:27 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hans Zhang <hans.zhang@cixtech.com>, linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@pengutronix.de,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 1/4] PCI: dwc: Advertise L1 PM Substates only if
 driver requests it
Message-ID: <20251124212227.GA2713330@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR2lOZDBEdGVd9On@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_132230_354870_C6EC1E56 
X-CRM114-Status: GOOD (  30.14  )
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

On Wed, Nov 19, 2025 at 12:08:41PM +0100, Niklas Cassel wrote:
> On Tue, Nov 18, 2025 at 05:34:18PM -0500, Frank Li wrote:
> > On Tue, Nov 18, 2025 at 03:42:15PM -0600, Bjorn Helgaas wrote:
> > > From: Bjorn Helgaas <bhelgaas@google.com>
> > >
> > > L1 PM Substates require the CLKREQ# signal and may also require
> > > device-specific support.  If CLKREQ# is not supported or driver support is
> > > lacking, enabling L1.1 or L1.2 may cause errors when accessing devices,
> > > e.g.,
> > >
> > >   nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
> > >
> > > If the kernel is built with CONFIG_PCIEASPM_POWER_SUPERSAVE=y or users
> > > enable L1.x via sysfs, users may trip over these errors even if L1
> > > Substates haven't been enabled by firmware or the driver.
> > >
> > > To prevent such errors, disable advertising the L1 PM Substates unless the
> > > driver sets "dw_pcie.l1ss_support" to indicate that it knows CLKREQ# is
> > > present and any device-specific configuration has been done.
> > >
> > > Set "dw_pcie.l1ss_support" in tegra194 (if DT includes the
> > > "supports-clkreq' property) and qcom (for cfg_2_7_0, cfg_1_9_0, cfg_1_34_0,
> > > and cfg_sc8280xp controllers) so they can continue to use L1 Substates.
> > >
> > > Based on Niklas's patch:
> > > https://patch.msgid.link/20251017163252.598812-2-cassel@kernel.org
> > >
> > > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > > ---
> > >  .../pci/controller/dwc/pcie-designware-ep.c   |  2 ++
> > >  .../pci/controller/dwc/pcie-designware-host.c |  2 ++
> > >  drivers/pci/controller/dwc/pcie-designware.c  | 24 +++++++++++++++++++
> > >  drivers/pci/controller/dwc/pcie-designware.h  |  2 ++
> > >  drivers/pci/controller/dwc/pcie-qcom.c        |  2 ++
> > >  drivers/pci/controller/dwc/pcie-tegra194.c    |  3 +++
> > >  6 files changed, 35 insertions(+)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > index 7f2112c2fb21..ad6c0fd67a65 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > @@ -966,6 +966,8 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> > >  	if (ep->ops->init)
> > >  		ep->ops->init(ep);
> > >
> > > +	dw_pcie_hide_unsupported_l1ss(pci);
> > > +
> > 
> > And, I don't think EP need clean L1SS CAP flags. If EP don't support L1SS,
> > it should be force pull down #clkreq.
> 
> I think the problem is that we cannot force pull down CLKREQ# in a generic
> DWC function. That would have to be done in glue driver specific callbacks.
> 
> Bjorn, perhaps we should simply drop the dw_pcie_hide_unsupported_l1ss()
> call from dw_pcie_ep_init_registers(), and consider hiding L1ss for EPs to
> be out of scope for this series.
> 
> That way, we could still queue this series up for 6.19.
> 
> Thoughts from everyone?

Good idea, done locally, thanks!

Bjorn

