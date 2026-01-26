Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6CED13C3E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Lbj/SRmKrEupEEKNpHOh2MRQXptjLV8i6B4AHBFHR4=; b=2Ig+kS07R/itKEhhswmsUnh9Ag
	BB7BbpZ5apUk091nI7bdbCCKVt+Y3BZmp8Dr4+O7MmZKrYYaAVCtRwUzx2eHagjcNzn613FaxUxYx
	APatjcGVkJzWQj1q4yxpoQ5FfxR2yuo+8vsv5SvgFJEmrsecD+0dHN91Iey2lKO87wPwdoyDhlyM3
	YKBrKvXfoyQOEnV8UtMNFLN1yATP4fXGavzx7ty5xBAtPNC64v+kYzPXqjmFa0obo0UNPttRD7EKb
	K508r760qNfaVsDLXESvxOmsZyFxssAH0BS5j/swDcxYi6qBlULUosyypLNraGZ9aU/CnstxaxzPk
	BITX3yQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkP24-0000000CoOk-0bct;
	Mon, 26 Jan 2026 16:01:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkP20-0000000CoNx-02c8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:01:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DD6D40DF6;
	Mon, 26 Jan 2026 16:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1FAC116C6;
	Mon, 26 Jan 2026 16:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769443295;
	bh=vbKOKo1zqwByHLjQtZsnbrccfQFl5y8geWYwihFRq24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lv48+hpvfTsHWMpL2abDkYYBE7hAds8hj8Zp5X6/XmVEmhic146EMnkENPQuRymhj
	 ZRDrCiDmBFyXzlfWKA/+BpJSBX1IFnuz3yFbv0Aga9FAzsY9lPhGKKgacbQAXlAUl1
	 4LKJyr8N9Ri/NmncXH7qkWRo/fVK+c2qByK0m/PkRMeUcEv33AsYsgnPZOpigfLVPw
	 2DxDngwxhwfVPspu2PvUQnrf51kjIyeAf8ZSb6R/CxmqMyHCBbniSAMnZv2BIXU+R5
	 mgnwO6u4E6jEBck2yVdqf4f4BghaHdP8aDdDGhDvqyW7M69MBHIDKnnpAzV5dMyXPI
	 NnIIw93NUqj2Q==
Date: Mon, 26 Jan 2026 16:01:27 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: dan.carpenter@linaro.org, robh@kernel.org, kuba@kernel.org,
	festevam@gmail.com, ghennadi.procopciuc@oss.nxp.com,
	alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch, shawnguo@kernel.org, mbrugger@suse.com,
	mcoquelin.stm32@gmail.com, linaro-s32@linaro.org,
	davem@davemloft.net, s.hauer@pengutronix.de, edumazet@google.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org,
	Frank.li@nxp.com, chester62515@gmail.com, netdev@vger.kernel.org,
	kernel@pengutronix.de, pabeni@redhat.com, jan.petrous@oss.nxp.com,
	linux-stm32@st-md-mailman.stormreply.com, s32@nxp.com
Subject: Re: [v4,1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <aXeP1y7cK0XRx3Wo@horms.kernel.org>
References: <8f2139e8adf02b485a4c84d558fc23f78cf04add.1769195864.git.dan.carpenter@linaro.org>
 <20260126152430.1390514-1-horms@kernel.org>
 <aXeJYo-0iiNuXVGH@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXeJYo-0iiNuXVGH@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_080136_084162_10040636 
X-CRM114-Status: GOOD (  26.71  )
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

On Mon, Jan 26, 2026 at 03:33:54PM +0000, Russell King (Oracle) wrote:
> On Mon, Jan 26, 2026 at 03:24:30PM +0000, Simon Horman wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > 
> > For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> > ---
> >     net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
> > 
> > This commit adds syscon/regmap support for accessing the GMAC_0_CTRL_STS
> > register on s32 chipsets, while maintaining backwards compatibility with
> > the existing direct MMIO approach for older device trees.
> > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > > index 5a485ee98fa7..2e6bb41f49e1 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > 
> > [ ... ]
> > 
> > > @@ -40,7 +44,10 @@ struct s32_priv_data {
> > >
> > >  static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
> > >  {
> > > -	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> > > +	if (gmac->ctrl_sts)
> > > +		writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> > > +	else
> > > +		regmap_write(gmac->sts_regmap, gmac->sts_offset, S32_PHY_INTF_SEL_RGMII);
> > 
> > Should the regmap_write() return value be checked here? The function
> > returns int and the caller s32_gmac_init() checks the return value
> > expecting errors to be propagated. For comparison, dwmac-sun55i.c in
> > sun55i_gmac200_set_syscon() does check regmap_write() return value:
> > 
> >     ret = regmap_write(regmap, SYSCON_REG, reg);
> >     if (ret < 0)
> >         return dev_err_probe(dev, ret, "Failed to write to syscon\n");
> 
> AI is wrong on this last line - s32_gmac_write_phy_intf_select() is
> called from s32_gmac_init(), which is called from plat_dat->init.
> 
> plat_dat->init is called from two paths:
> 
> 1. stmmac_pltfr_probe() -> stmmac_dvr_probe() -> plat_dat->init()
> 
> 2. stmmac_resume() -> plat_dat->resume() -> stmmac_plat_resume() ->
>    stmmac_pltfr_init() -> plat_dat->init()
> 
> In the resume path, it is not appropriate to use dev_err_probe()
> because we're not in the probe path.

Hi Russell,

I agree that using dev_err_probe() is not appropriate here.
And, FWIIW, I took that part to be an illustration that
sun55i_gmac200_set_syscon() handles a similar case,
rather than a suggestion of how to handle it here.

But at any rate, I think the key question is should the case
where regmap_write() returns an error be handled in
s32_gmac_write_phy_intf_select() (by some means)?

