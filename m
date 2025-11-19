Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372F7CF319B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGfsSv8y5MOAY2uFeT6xZHqpJ+yDfOFNiR3TCLmk5jA=; b=vfAI8Vw4YB8jn62yGnXiK5SDi0
	wqcwvErPQ9iVWp9bw557620ShbobWBVSXz4YdfHLuPSk3ccK2K9F9Nxy4PBVqd50JcJBMzDaP1y7n
	p+8MIfCYTH0PwxVhiiBaocIP0q6CJPquGh2xe12BKXigJ0dNdVcNFgJydfbNcSCHhDEk99kVQpXbo
	tIopsYykyI90X8NGvKiWw2tiLWAPbMqMJ4ORctr0jPGpklqqc5N9R5JHyhk6xHS1CPv05v8MME5mp
	gReHWHkiBWvR0q2JPS8iVSW1r7pf1oFntCaS87Q+qcGgA5Lz33GkLJKa/AfA9aiQ0bzHr5AxrG3DW
	GgpcRlEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLg3V-000000030eE-0eYG;
	Wed, 19 Nov 2025 11:08:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLg3S-000000030df-0NXR;
	Wed, 19 Nov 2025 11:08:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50F094356A;
	Wed, 19 Nov 2025 11:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5474FC19421;
	Wed, 19 Nov 2025 11:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763550533;
	bh=i9B40rXvO4To44vDLCPvVcioheN0Q6vh2sMRTqdfAAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFbkS3ItMYkCvXQBowRYIX3QCL4BzIbk1Z/T4w+vthqVM7dO2duydfViADLoc+28z
	 jAVLswki+uqnYk3baXc1/xCPjJfR5AAVkweeYyd74OzQFAuRatReJpfNOMwr6OrSsn
	 t/ukjM48syDrh5wEAKKvmTrwPM3rKHGZu1DKQYu8DoEMLmPge4Ramv+COrtVKAQOnQ
	 60K0dMSN27vkVmSXH4FkMkxJrjSJtmT8xMAoBi8xerAfNemTyR9dy2nc17hKwr6vOF
	 p+m7U5E5v86hrPOipyimgLTfy261+7s1J3d77Xp1583aHJiGVx6/zZ2JYwCMv2/V0O
	 wf1kQrOefETjg==
Date: Wed, 19 Nov 2025 12:08:41 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
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
Message-ID: <aR2lOZDBEdGVd9On@ryzen>
References: <20251118214312.2598220-1-helgaas@kernel.org>
 <20251118214312.2598220-2-helgaas@kernel.org>
 <aRz0ak6onKzZs2lY@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRz0ak6onKzZs2lY@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_030854_170221_27A1980F 
X-CRM114-Status: GOOD (  26.72  )
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

On Tue, Nov 18, 2025 at 05:34:18PM -0500, Frank Li wrote:
> On Tue, Nov 18, 2025 at 03:42:15PM -0600, Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> >
> > L1 PM Substates require the CLKREQ# signal and may also require
> > device-specific support.  If CLKREQ# is not supported or driver support is
> > lacking, enabling L1.1 or L1.2 may cause errors when accessing devices,
> > e.g.,
> >
> >   nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
> >
> > If the kernel is built with CONFIG_PCIEASPM_POWER_SUPERSAVE=y or users
> > enable L1.x via sysfs, users may trip over these errors even if L1
> > Substates haven't been enabled by firmware or the driver.
> >
> > To prevent such errors, disable advertising the L1 PM Substates unless the
> > driver sets "dw_pcie.l1ss_support" to indicate that it knows CLKREQ# is
> > present and any device-specific configuration has been done.
> >
> > Set "dw_pcie.l1ss_support" in tegra194 (if DT includes the
> > "supports-clkreq' property) and qcom (for cfg_2_7_0, cfg_1_9_0, cfg_1_34_0,
> > and cfg_sc8280xp controllers) so they can continue to use L1 Substates.
> >
> > Based on Niklas's patch:
> > https://patch.msgid.link/20251017163252.598812-2-cassel@kernel.org
> >
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> >  .../pci/controller/dwc/pcie-designware-ep.c   |  2 ++
> >  .../pci/controller/dwc/pcie-designware-host.c |  2 ++
> >  drivers/pci/controller/dwc/pcie-designware.c  | 24 +++++++++++++++++++
> >  drivers/pci/controller/dwc/pcie-designware.h  |  2 ++
> >  drivers/pci/controller/dwc/pcie-qcom.c        |  2 ++
> >  drivers/pci/controller/dwc/pcie-tegra194.c    |  3 +++
> >  6 files changed, 35 insertions(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > index 7f2112c2fb21..ad6c0fd67a65 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > @@ -966,6 +966,8 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> >  	if (ep->ops->init)
> >  		ep->ops->init(ep);
> >
> > +	dw_pcie_hide_unsupported_l1ss(pci);
> > +
> 
> And, I don't think EP need clean L1SS CAP flags. If EP don't support L1SS,
> it should be force pull down #clkreq.

I think the problem is that we cannot force pull down CLKREQ# in a generic
DWC function. That would have to be done in glue driver specific callbacks.

Bjorn, perhaps we should simply drop the dw_pcie_hide_unsupported_l1ss()
call from dw_pcie_ep_init_registers(), and consider hiding L1ss for EPs to
be out of scope for this series.

That way, we could still queue this series up for 6.19.

Thoughts from everyone?



Kind regards,
Niklas

