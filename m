Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337FFCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iD6vtrRiqRZrqacv/A5UUfoAppBPQ2mnaERSKSCrLnk=; b=nGd4HCM5jHcqfW1tN6flH9jhQN
	c+07f+jBSlbWXZ0UCH/RA5XbKjdMNK00ar9sOf7eXhxd8p6baOm1sEVUYbMpBq8N9ZI3EGYkUkw7t
	ulcpRd7/dOjRvziksz2GoMmgkZgqB8LTWz+iOB6E2ySw+5+aTFO6hBqfFYqE8HlYkx29/IxJeBk45
	wdZ6S87haiyyxkmaTVnL/VSOfbpouU23UvllTYordwzhWKnIZ5GNJOOT8jGo++kvtzo2DqXvUHnc2
	xjuI3Vqrj1DGqfMHMLtyewHAwlcWEJip8j2RT5x4dFOMDH3jzfOJT0+6Tpn8XfvuysM6HKC8FfMl+
	J7VogSvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJF0L-00000009H4E-02Uq;
	Wed, 12 Nov 2025 17:51:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJF0I-00000009H3l-1zNi;
	Wed, 12 Nov 2025 17:51:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 145EF44231;
	Wed, 12 Nov 2025 17:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D3DC4CEF8;
	Wed, 12 Nov 2025 17:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762969893;
	bh=T7knzhZ/hAoWyK2lUxIZdB+Ka4TMwRh1ujkOMO4Lf04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rO6Mud0EMKXzwiNc2bQlzO+QiF4pc3XFFext9cJ/t5Wa69rSTMlzvwp4mvrpz5ern
	 1/w711HXbiu7bl1ydAB5DUdFcwgQ1lJWeN5IpVji2dEdgRtnIF2lrTd0he6MlSGbV+
	 Zu6LUatZFmxfv4DqArs0FAoWQnazXwpImSlLMqQBPAtLcvSFfO6Qh9Ae3bcMYyPItL
	 aHx51+xOY/Tg8XTyidCaat1h3AuReI9ji7hHyBaIaStsRhn2b+K5jgPh7En09xzheM
	 0NaPZ/ftBPYlEZu+UPAyMN6G+DftPSkldBOvdcp8DKUWQSRJl+tUyr3vPq+x1twkib
	 lhmGS0PYRvO5Q==
Date: Wed, 12 Nov 2025 23:21:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
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
Subject: Re: [PATCH 1/4] PCI: dwc: Advertise L1 PM Substates only if driver
 requests it
Message-ID: <22srj63j7fzmsebwxwjnnxnpmdn2iwxo36gkrl36gdm7ge2xif@dmrdbfgu3hn3>
References: <20251111221621.2208606-1-helgaas@kernel.org>
 <20251111221621.2208606-2-helgaas@kernel.org>
 <aRRDzKFVTFTIuvvh@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRRDzKFVTFTIuvvh@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_095134_579836_969AA3E3 
X-CRM114-Status: GOOD (  16.38  )
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

On Wed, Nov 12, 2025 at 09:22:36AM +0100, Niklas Cassel wrote:
> On Tue, Nov 11, 2025 at 04:16:08PM -0600, Bjorn Helgaas wrote:
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -1060,6 +1060,8 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
> >  		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
> >  	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
> >  
> > +	dw_pcie_config_l1ss(pci);
> 
> The name dw_pcie_config_l1ss() sounds like we are enabling l1ss.
> 
> I know naming is hard.
> 
> Perhaps dw_pcie_disable_unsupported_l1ss() ?
> 
> Or something similar.
> 
> 
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -1067,6 +1067,8 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
> >  	val &= ~REQ_NOT_ENTR_L1;
> >  	writel(val, pcie->parf + PARF_PM_CTRL);
> >  
> > +	pci->l1ss_support = true;
> > +
> >  	val = readl(pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
> >  	val |= EN;
> >  	writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
> 
> While it seems like ops_2_7_0 is the only type that explicitly does a
> register write to enable L1ss, other versions might have the register
> as enabled by default, so it would be nice if Mani could confirm exactly
> which versions that should set l1ss_support = true.
> 

Yes, on the rest of the platforms, this bit is supposed to be enabled by
default. AFAIK, all Qcom platforms should support L1SS, atleast the
non-IPQ/APQ ones.

We should set it for below cfgs:

cfg_fw_managed
cfg_sc8280xp
cfg_1_34_0
cfg_1_9_0
cfg_2_7_0

I excluded msm8996 due to one recent bug report.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

