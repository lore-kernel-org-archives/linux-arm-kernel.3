Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE59CFD365
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 22:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=morJu8mDydjwAwCwOD18AHkhX8xE9ZqtFX2+4zhZMhk=; b=D0epZSgHRH08ED
	5QGH0Z0X5Xp8h/WzEwjqI0jbBHHfjUV9cQzCAZfH6I2m8BuS7TZL2Ws/MEVD2AszYQaO0NKqiW8XZ
	U2TK9kV3lVcpNluhCRzeGm5K5k09sVZCXPdC7mx/XA1hgG+BjIDIJnt70bELUBQqgF3Qh6cbcUrNX
	WFAYEvaD8mzesLQfKf9MwT6rGl2QsXM/Pltv8msk8ouXkAS6+QSnXD4epbfjJbBkPGI//VNbxqNJp
	ThyVB7ZDDRi2EOajo0ABRDzbUJ73sehXofoR/pTLz9JySfl+J4uCXVsUMDcJCx+sdQ6qzFa4gZCCK
	QLisXi7HLqlmaaJF8Bwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNfOF-0000000CPvT-0mlf;
	Mon, 24 Nov 2025 22:50:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNfOD-0000000CPv4-1Gq8;
	Mon, 24 Nov 2025 22:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E05D4080C;
	Mon, 24 Nov 2025 22:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DCFC4CEF1;
	Mon, 24 Nov 2025 22:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764024632;
	bh=L9vxregCDQ2mkA1oTO/p4wTdwRK2bHafb670knLdCeI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=c4X4KN3EdiwLBbtGn7PgXZnYSgyoNSzgxcz5NevhwkczGejGdZ0AFxz2+e9CVKVY/
	 xZ8nrqYXcK29Er0/xWvywyxNy1FktZ33X1PITEPOA0SDI8EDfwTveqPWkS3CUh4tBU
	 IuNU3Em4z6ZCaPeaaKU5ZLFVvG/S3rYij2zGTmiwxurIObDVX+2I73Zif5gakUuzdq
	 wCjDZ15m/X9SZYDeLfys5ZdcB0OwmRgxjICh1zIuEExKgCyP68Jnb1EX/O+zRj8CVE
	 UciEjUzm+bOsIxB/zSggy0Js1Opcw9zhZLYKQUv7zpq3EO2o21Z0ys+LSDv6xDMvyi
	 2O5HZfBiEnyYA==
Date: Mon, 24 Nov 2025 16:50:30 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Richard Zhu <hongxing.zhu@nxp.com>, Frank Li <Frank.li@nxp.com>,
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
Subject: Re: [PATCH v2 0/4] PCI: dwc: Advertise L1 PM Substates only if
 driver requests it
Message-ID: <20251124225030.GA2721839@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118214312.2598220-1-helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_145033_404255_6A93854F 
X-CRM114-Status: GOOD (  21.72  )
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

On Tue, Nov 18, 2025 at 03:42:14PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> This is a follow-up to Niklas's patch at
> https://lore.kernel.org/r/20251017163252.598812-2-cassel@kernel.org.  That
> patch clears the L1 PM Substate Supported bits for the dw-rockchip driver,
> which doesn't yet do the device configuration to support the L1 Substates.
> 
> This series does the same thing, but in the DWC core so it applies to all
> DWC-based drivers.  Drivers that do support L1 Substates (currently
> tegra194 and qcom) indicate that by setting "dw_pcie.l1ss_support", and the
> DWC core will leave the L1 PM Substate Supported bits alone.
> 
> This also includes Shawn's patches to add the dw-rockchip support for L1
> Substates.
> 
> The problem this fixes is that users are currently able to enable L1
> Substates, e.g., by
> 
>   - building with with CONFIG_PCIEASPM_POWER_SUPERSAVE=y
>   - booting with "pcie_aspm.policy=powersupersave"
>   - echo powersupersave > /sys/module/pcie_aspm/parameters/policy
>   - echo 1 > /sys/bus/pci/devices/.../link/l1_1_aspm
> 
> but this breaks devices if the platform doesn't support CLKREQ# or lacks
> Root Port configuration.  This series avoids that problem by preventing the
> kernel from enabling L1.x in the first place.
> 
> 
> Bjorn Helgaas (2):
>   PCI: dwc: Advertise L1 PM Substates only if driver requests it
>   PCI: tegra194: Remove unnecessary L1SS disable code
> 
> Shawn Lin (2):
>   PCI: dw-rockchip: Configure L1SS support
>   arm64: dts: rockchip: Add PCIe clkreq stuff for RK3588 EVB1

I applied these (except for the arm64: dts: patch) to
pci/controller/dwc, planned for v6.19.  Same as posted here except I
dropped dw_pcie_hide_unsupported_l1ss() from
dw_pcie_ep_init_registers().

>  .../boot/dts/rockchip/rk3588-evb1-v10.dts     |  7 ++-
>  .../pci/controller/dwc/pcie-designware-ep.c   |  2 +
>  .../pci/controller/dwc/pcie-designware-host.c |  2 +
>  drivers/pci/controller/dwc/pcie-designware.c  | 24 ++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h  |  2 +
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 40 ++++++++++++++++
>  drivers/pci/controller/dwc/pcie-qcom.c        |  2 +
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 48 ++++---------------
>  8 files changed, 85 insertions(+), 42 deletions(-)
> 
> -- 
> 2.43.0
> 

