Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D595DCFD364
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 05:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+XlqYejp1nd6UpVqZkSXuV/N5F57js+F6ejiEmgZEM=; b=oMS+ctEIxUg2bSCbrrL1yt2inM
	dBeTyiiy0SWEgI4waoW+SnOOWDwfKzkHgcYh2IlLvMuiaDiq9vEemJft4Xw20PNsyD+ZnjAXFuM5r
	QfnfmC9cu1WFQrlvlSvewZtzswznzDPhIfbHjgTTMtoEyIqQVRXX4p7ZBj7aPfNlNWk1FoTNI8/z5
	KsxE3ur8o+aUm0Aw1bzqdm9xMKPzAzbD9yOoDUjlbmWUR1y56ZBPHAlftXxJlWjAiXtGDC3L6TcQk
	Oy8Yb3JgoIp5DakklcD7cr/vgJdb8dlKM3rqcKeXsk+irsFMNb9UAGRjfO/rIe66ZGne/H7kUF0wi
	SHGRJsYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNlYN-0000000CmUc-1YzJ;
	Tue, 25 Nov 2025 05:25:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNlYM-0000000CmUR-0k5T;
	Tue, 25 Nov 2025 05:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2316A600CB;
	Tue, 25 Nov 2025 05:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B55C4CEF1;
	Tue, 25 Nov 2025 05:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764048324;
	bh=YHZk6TcZwXmXzYNfBZm7hYEmK00oZ2fzc7kALopA/iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NCRQKFYe4AGwbOGth+WonBD537brle2qfV23NP/0JbJqlNKIMy34lTEnbNZnsouqP
	 iGDQsNWg34Enf6PU6Mqn3gIs4luGiFY608RjtOWmTLeHgRjYX/OfmjnbRIWhVDBWc5
	 IFja6EOGJpovJUa6QxGzx6czN9OYxf1k99RH/PPAn4Lu8uZB1Zh7bfVxrpVHDJexKh
	 i4KbLJOncMBRudrHnQ8xQNvwjPNRnunAqaLE9WwUAohaSK8zynKgO/rdyYQqY/zMsG
	 DF5OhgOJ9mBs1TlZoj2BM/wJvkhKvT3SpXXKrBrNXkgYmuA73WF0UABBYvuAXaqF0k
	 oDFfjlwCNIDNg==
Date: Tue, 25 Nov 2025 10:55:05 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Simon Xue <xxm@rock-chips.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Dragan Simic <dsimic@manjaro.org>, 
	FUKAUMI Naoki <naoki@radxa.com>, Diederik de Haas <diederik@cknow-tech.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Frank Li <Frank.li@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Hans Zhang <hans.zhang@cixtech.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, kernel@pengutronix.de, 
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 1/4] PCI: dwc: Advertise L1 PM Substates only if
 driver requests it
Message-ID: <swchohhrkhyuzukrtonu4f3bzx3h6mha23rt6twqict42we2za@pq5hwfa75fps>
References: <wja7vxtg7bqq2udepl5r3mvgg5swvuqtuzk6cnimgcbw2aegqs@hru6yzg4xx3o>
 <20251124211903.GA2712341@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251124211903.GA2712341@bhelgaas>
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

On Mon, Nov 24, 2025 at 03:19:03PM -0600, Bjorn Helgaas wrote:
> On Thu, Nov 20, 2025 at 01:10:56PM +0530, Manivannan Sadhasivam wrote:
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
> > 
> > Going by this reasoning, why can't we enable L1 PM Substates for
> > these platforms by default?
> 
> I think we can, in a separate series.  I don't have time to deal with
> this before the v6.19 merge window, but you can certainly do that.
> 

I will take it up. Not sure if I can do it for v6.19 though.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

