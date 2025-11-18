Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB8ACEE355
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 20:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKq6BtJop5WbOxfWpp5r+PsG+9UJgqbxSVP+h8Bq6VU=; b=CNs14+8MC06lryvrzr51m7mp+9
	GTKekmEnvEngsuM7GFgu7c8ORHAG9Wc+nibWXdQqoHxDZX0TBp4/2PKSXeO4aQloG8CS6+7R/s1No
	x0mGCIrDA5VYSajRvWRl1rQ9ZX7lrZXE82lwpJe5xBX2euwv+DXioGpA/lhiWZAsm+BrJgn4KqE0u
	GJ+WmUYM47U7INfR7/uZJ6ZkrlKFkmbWXpy6grqUWBNkTWg/ngPBsHc1W4OIIC9WITzCdg3QLGUQy
	0aABLZ1txaSYXSoqF+YThQ8+waqKAcnFH8KyJOOmnOdI9DHcMwpZkjFCkfn/odBA5zC2q0OaOyEjI
	sBF2Q21w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLSa7-000000015xr-2PrR;
	Tue, 18 Nov 2025 20:45:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLSa6-000000015xb-2LsY;
	Tue, 18 Nov 2025 20:45:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3511601BC;
	Tue, 18 Nov 2025 20:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F59C2BCB3;
	Tue, 18 Nov 2025 20:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763498741;
	bh=LrsefOmy8EGZJbBvhiH/EY4R37o/mLzhhIaUXiOgkgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBNTS4dFeqs1FxFndbuiQs+P0fZn5Hw4UTyl3rTK+ReloR30FDw/Xxk8gH4fQQpsF
	 GwZoCV9JcAUtQmYn170bze64xD2/1D8MUO1meUJ8qXd9NLZ77u+7dIMTcUFDE4SV+L
	 lRlB2nMpf+fyuXhnqkEys4h4pN/+b+Zv3zfG2fjxtVhI8l7OMzddngHZkyio7ZVa9L
	 NhFNrhYDRt7+lj0mhg/yarjQMG/1RM3w0lr15pXPSELHseWixdv4RsZDCEjJ1iF0Df
	 WIKGjP8UwpA+NT3MigFbYOnUA0ddqkKduzZA/AM79ITWi0prkGNCj/CUrWuvujYr5B
	 jGu5g4/hp5R1g==
Date: Tue, 18 Nov 2025 21:45:30 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
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
Subject: Re: [PATCH 1/4] PCI: dwc: Advertise L1 PM Substates only if driver
 requests it
Message-ID: <aRza6quobL4obC58@ryzen>
References: <aRRDzKFVTFTIuvvh@ryzen>
 <20251118203638.GA2591575@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118203638.GA2591575@bhelgaas>
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

On Tue, Nov 18, 2025 at 02:36:38PM -0600, Bjorn Helgaas wrote:
> On Wed, Nov 12, 2025 at 09:22:36AM +0100, Niklas Cassel wrote:
> > On Tue, Nov 11, 2025 at 04:16:08PM -0600, Bjorn Helgaas wrote:
> > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -1060,6 +1060,8 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
> > >  		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
> > >  	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
> > >  
> > > +	dw_pcie_config_l1ss(pci);
> > 
> > The name dw_pcie_config_l1ss() sounds like we are enabling l1ss.
> > 
> > I know naming is hard.
> > 
> > Perhaps dw_pcie_disable_unsupported_l1ss() ?
> > 
> > Or something similar.
> 
> "disable" sounds like something we do with a control register, and
> here we want to remove the advertised support from the capabilities
> register.
> 
> Maybe dw_pcie_hide_unsupported_l1ss()?

Sounds good to me :)


Kind regards,
Niklas

