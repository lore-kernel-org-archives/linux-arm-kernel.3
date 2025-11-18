Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAF1CEE350
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 20:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/U8laglZ/xoA/IF/5kHOgKiY/U+kbXczU0Ae9EivEO0=; b=k3veytXTFWVdhVlz1daVqVvw8G
	+bjNKyPCG905usbCWQVnIpuIuGp0tzCtTJiO6A0cVeOFd3iKS3BvmduWSc1POYODdBskz9njiF8he
	k65UrvNoEax4jXkt5g+EVjbCjvWqoJF5R7EH18FGlPQ2yzeIsbFOp2d357/LEF905SMZwAcokCw4f
	20RY/Z836EmoM74+C8qNfW+rYR3SFg2fBA5qHBw0lOMN2ZbvBbfrarABWo1f86mu2Q9WBLijG5btR
	ObaZOPfwdMNb2Q6g6ai0hIUmTLOMWxN+tkDO7K0k3YlSauX+DoA5W/EXc6XAM73ObyRcJPNsEIj1u
	+dK2z3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLRy3-000000013XE-1jZV;
	Tue, 18 Nov 2025 20:06:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLRy1-000000013Wn-1c4b;
	Tue, 18 Nov 2025 20:06:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AABD40ADA;
	Tue, 18 Nov 2025 20:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF55DC4CEF5;
	Tue, 18 Nov 2025 20:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763496378;
	bh=OWueXLv1GkidpSobbWOxzP1bNyno7+0tNkEr7FL03sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUurIK0Z0sKXeHJdsUgGZ2LIf1F7YrKZt2nQRR4Isz709nmFMo/qoMDiEkAtB0a0q
	 qiccU3CYAvBKFHEkPzn4DND9yaXDM9f9Q3No5h2j1xvWeMjaE3cD7XKzlhTVNLIVF5
	 LsMX1t/AS2eJNIE704QaNBpZSI559hShgvQ/QPMUMqpCpsxEhDFqNT7XShwrd2NWrj
	 l8IDJLQhluW8axVX9tzEZ4A/bHphXCNCkjM2T5PLydmqgMVCGYs55/f/NhT9fC7rUk
	 Gn+NggMtGQLfqe24VnT0aic3x1CFUnLoIY6e97PtARFNVHdy+tVjrmBZkpGLAYtoiP
	 B0mkVjNKqwvCA==
Date: Tue, 18 Nov 2025 21:06:08 +0100
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
Subject: Re: [PATCH 2/4] PCI: tegra194: Remove unnecessary L1SS disable code
Message-ID: <aRzRsFKkVouJDRRs@ryzen>
References: <aRRFYEgBigYDlfQh@ryzen>
 <20251118185917.GA2583698@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118185917.GA2583698@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_120621_490415_86630E84 
X-CRM114-Status: GOOD (  24.63  )
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

On Tue, Nov 18, 2025 at 12:59:17PM -0600, Bjorn Helgaas wrote:
> On Wed, Nov 12, 2025 at 09:29:20AM +0100, Niklas Cassel wrote:
> > On Tue, Nov 11, 2025 at 04:16:09PM -0600, Bjorn Helgaas wrote:
> > > From: Bjorn Helgaas <bhelgaas@google.com>
> > >
> > > The DWC core clears the L1 Substates Supported bits unless the driver sets
> > > the "dw_pcie.l1ss_support" flag.
> > >
> > > The tegra194 init_host_aspm() sets "dw_pcie.l1ss_support" if the platform
> > > has the "supports-clkreq" DT property.  If "supports-clkreq" is absent,
> > > "dw_pcie.l1ss_support" is not set, and the DWC core will clear the L1
> > > Substates Supported bits.
> > >
> > > The tegra194 code to clear the L1 Substates Supported bits is unnecessary,
> > > so remove it.
> > >
> > > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > > ---
> >
> > Since init_host_aspm() is now the only place using struct tegra_pcie_dw
> > struct member cfg_link_cap_l1sub, I think that you can remove this struct
> > member, and instead make this a local variable in init_host_aspm().
>
> It looks like tegra_pcie_ep_irq_thread() also uses it, although I'm
> dubious about that.
>
> It's odd that software would be responsible for sending LTR messages,
> but I guess this only happens for tegra194_pcie_dw_ep_of_data, and
> apparently it's fixed (".has_ltr_req_fix" for tegra234.
>
> And odd that we would read the capability register on every interrupt
> even though this driver is the only thing that can change it, so we
> should be able to cache the value in init_host_aspm().

Yes, sorry, my thinking was that this code in tegra_pcie_ep_irq_thread():

	/* If EP doesn't advertise L1SS, just return */
	val = dw_pcie_readl_dbi(pci, pcie->cfg_link_cap_l1sub);
	if (!(val & (PCI_L1SS_CAP_ASPM_L1_1 | PCI_L1SS_CAP_ASPM_L1_2)))
		return IRQ_HANDLED;


after your patch can be replaced with:

	/* If EP doesn't advertise L1SS, just return */
	if (!pci->l1ss_support)
		return IRQ_HANDLED;


Since we already know that if !pci->l1ss_support,
these bits will be cleared by DWC common code.


So, after that, we could replace the struct tegra_pcie_dw
struct member cfg_link_cap_l1sub with a local variable in
init_host_aspm().


Kind regards,
Niklas

