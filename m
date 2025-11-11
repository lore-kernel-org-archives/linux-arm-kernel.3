Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7AECCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 23:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lICPANeR5i7ubKofEPbuLu1azMSkp373dI1wQ9XQmvA=; b=vUyMQUCqeDa+wg
	G6joRjN/X9KoY1CVMMkOAQW57vyViNcQ5FTzI+JXoE1xgaLzvsjQCfioJRjNnzi89xhPYjwytRTkj
	zshEkP+rULMDe/XjVRtjWYKER+rXNApR8IIT46opuVSitwjOV2SDP0kpWSBrEqPNXSXZGop2Ct4y7
	9l2p0Vh7ejCqACTJV3PW4X/eQjaOqL+HgoHmBY/YINg2WOLKCVyrtP6aGaTN3NStkFmzYJP80Y49C
	vIHHKHL0pzIfgexc8qktS3X0SqtutQNolR6TtstPTzjeFz5J5A0bHFAebF9/FFi7bYYvBDsPF9Y6C
	I2MD4TVYfGWcg9CYGwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIxSE-00000007rzZ-2bHk;
	Tue, 11 Nov 2025 23:07:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIxSC-00000007rzQ-4BiC;
	Tue, 11 Nov 2025 23:07:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10F0760051;
	Tue, 11 Nov 2025 23:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B1DC4AF09;
	Tue, 11 Nov 2025 23:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762902431;
	bh=IWaM6CDGnSAC6qohFfgy7sPG58r65YBIiW+Qqnin45s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NIsHRwtM9RtVAveYD7hxhkQk2BIMsIkYUeUZPG2ttP4o2ZHS8gUyQ+ezYo/ROnHNL
	 ZGkfAiVYCouHoUZMCLyzLAPBVaU1V3tfo222E+IVfFEgIGTfqGu1kxwuniBfhj5fF2
	 T3bPCc7oF1rMZ4X3AqtNc0ahRt5X3OPEjEexkdaLc+BRGnE79Kmk2JQ74xaqJPX9ia
	 JWB3MLuNI635l+qnj9OXSZ8hFS9VdbUX0dLG1eYUVWHnVITxgYHka2GkmjGCTyE3WC
	 ebjeEIpdODruvkyUzuIMbDa11SMUpYR+Zjkr8XxquSvB4Tb7IXP8p9EioT2D0Kx4HJ
	 ZLwMVqRFWlBJw==
Date: Tue, 11 Nov 2025 17:07:10 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
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
Subject: Re: [PATCH 1/4] PCI: dwc: Advertise L1 PM Substates only if driver
 requests it
Message-ID: <20251111230710.GA2210983@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRO9J9ybdseyExYK@lizhi-Precision-Tower-5810>
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

On Tue, Nov 11, 2025 at 05:48:07PM -0500, Frank Li wrote:
> On Tue, Nov 11, 2025 at 04:16:08PM -0600, Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> >
> > L1 PM Substates require the CLKREF# signal and may also require
> > device-specific support.  If CLKREF# is not supported or driver support is
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
> > driver sets "dw_pcie.l1ss_support" to indicate that it knows CLKREF# is
> > present and any device-specific configuration has been done.
> >
> > Set "dw_pcie.l1ss_support" in tegra194 (if DT includes the
> > "supports-clkreq' property) and qcom (for 2.7.0 controllers) so they can
> > continue to use L1 Substates.
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
> ...
> >
> > +void dw_pcie_config_l1ss(struct dw_pcie *pci)
> > +{
> > +	u16 l1ss;
> > +	u32 l1ss_cap;
> > +
> > +	if (!pci->l1ss_support)
> 
> I think when l1ss_support true, need return.
> when l1ss_support false, need clean PCI_L1SS_CAP.
> 
> Do your logic reverise?

Yes!  Thank you, fixed locally.

