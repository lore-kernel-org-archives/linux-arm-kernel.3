Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3234D30CC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJsKBdT/ZejIFIg5BrsliCMgMJfpoIKWo+pn82kN2/o=; b=m5HcDhqEf6hwP6+0BktG67iKk5
	2lVfkyq8z4wiG2UZT2spLwIylFYiQX3ru3DG6l8ggHGg/AaDZjfgUcLTnu31y3RHe89dbNhsXB5TY
	soE7fqoHGx/AkyVCXmfc6w2rySmCIbGW2DEthJZ3PRBlxz6c2dUm/+DJDMteWhyqLL0Dhj0R2geCq
	PU3m7aem4jCMNd9aK1JclrCBBarwfozU4rtB7m7ba6KH6KRMkf8cs6pSJSJgeqYYrqeVVH0wOn3lg
	/J05E+D8HbruiBnOLCyxeKmHsPl3WUKrwN5fhmryRgcdWokGi8i7io6wAqrnqiEo6+fgzU8FTDQOQ
	+yu2pjDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm5a-00000007lfu-1ELB;
	Tue, 13 Jan 2026 21:38:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm5W-00000007leo-1WRC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 21:38:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A932960018;
	Tue, 13 Jan 2026 21:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3A9C16AAE;
	Tue, 13 Jan 2026 21:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768340285;
	bh=Ue0kX6WDxmwPMCZ/GKz/k0/R9KvOYfmHiZqM0wnXDGQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HUtJyVo6tFy6D2+6OTOd9Tv6Ujj2G4eqP8Sqsp6CvXxIi0m6pfEMUN9iQxl2niTkb
	 MZaA2823gSY+QqfaKURHBIVDbZc6kHXd5Hsqd4GW/aUmuaqZ9Vea7JPQ94ATsXpG+Y
	 RAtRBh5tNZx6yt9jD7gISK/kxvrTOs0VHn/zOsN8sEa7+raVMmkzjhQIMdXZS2txTA
	 8s2gr8MCbCvgLXZdWwiugtv+zvnvfh45af0wunCFtZQ8R7v9V0Du6A+WQhnk1Yd8oS
	 tc7eRpVIAqyjS6oMMCbu1n7emEUzmAUwM2WG51axjcZknTaW+UKkGNvjFyCD2sQYjb
	 gaJE9bb5U6EGQ==
Message-ID: <a2dc72ae-0798-4baa-b4d2-fa66c334576a@kernel.org>
Date: Tue, 13 Jan 2026 15:37:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] net: stmmac: socfpga: add call to assert/deassert
 ahb reset line
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mamta Shukla <mamta.shukla@leica-geosystems.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 bsp-development.geo@leica-geosystems.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
 <20260108-remove_ocp-v3-1-ea0190244b4c@kernel.org>
 <aV_W2yLmnHrTvbTP@shell.armlinux.org.uk>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <aV_W2yLmnHrTvbTP@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 1/8/26 10:10, Russell King (Oracle) wrote:
> On Thu, Jan 08, 2026 at 07:08:09AM -0600, Dinh Nguyen wrote:
>> The "stmmaceth-ocp" reset line of stmmac controller on the SoCFPGA
>> platform is essentially the "ahb" reset on the standard stmmac
>> controller. But since stmmaceth-ocp has already been introduced into
>> the wild, we cannot just remove support for it. But what we can do is
>> to support both "stmmaceth-ocp" and "ahb" reset names. Going forward we
>> will be using "ahb", but in order to not break ABI, we will be call reset
>> assert/de-assert both ahb and stmmaceth-ocp.
>>
>> The ethernet hardware on SoCFPGA requires either the stmmaceth-ocp or
>> ahb reset to be asserted every time before changing the phy mode, then
>> de-asserted when the phy mode has been set.
> 
> This is not SoCFPGA specific. The dwmac core only samples its
> phy_intf_sel_i signals when coming out of reset, and then latches
> that as the operating mode.
> 
> Currently, the dwmac core driver does not support dynamically changing
> plat_dat->phy_interface at runtime. That may change in the future, but
> as it requires a hardware reset which will clear out the PTP state, it
> would need consideration of that effect.
> 
> The SoCFPGA driver only calls the set_phy_mode() methods from
> socfpga_dwmac_init(), which in turn is called from the plat_dat->init
> hook. This will be called from:
> 
> 1. When stmmac_dvr_probe() is called, prior to allocating any
>     resources, and prior to the core driver's first call to:
>     reset_control_deassert(priv->plat->stmmac_ahb_rst);
> 
> 2. As plat_dat->resume is not populated by the glue driver, the init
>     hook will also be called when resuming from stmmac_resume().
> 
> Lastly, nothing in the main driver corrently writes to ->phy_interface.
> 
> I would like to see the platform glue drivers using more of what is
> in the core driver, rather than re-inventing it, so I support the
> idea of getting rid of dwmac->stmmac_ocp_rst.
> 
> What I suggest is to get rid of dwmac->stmmac_ocp_rst now.
> devm_stmmac_probe_config_dt() will parse the device tree, looking for
> the "ahb" reset, and assigning that to plat->stmmac_ahb_rst. If it
> doesn't exist, then plat->stmmac-ahb_rst will be NULL.
> 
> So, in socfpga_dwmac_probe(), do something like this:
> 
> 	struct reset_control *ocp_rst;
> ...
> 	if (!plat_dat->stmmac_ahb_rst) {
> 		ocp_rst = devm_reset_control_get_optional(dev, "stmmaceth-ocp");
> 		if (IS_ERR(ocp_rst))
> 			return dev_err_probe(dev, PTR_ERR(ocp_rst),
> 					     "failed to get ocp reset");
> 
> 		if (ocp_rst)
> 			dev_warn(dev, "ocp reset is deprecated, please update device tree.\n");
> 
> 		plat_dat->stmmac_ahb_rst = ocp_rst;
> 	}
> 
> Then, change all remaining instances of dwmac->stmmac_ocp_rst to
> dwmac->plat_dat->stmmac_ahb_rst... and job done. You have compatibility
> with device trees that use "ahb", and with device trees that use
> "stmmaceth-ocp".
> 
> Given that struct socfpga_dwmac contains the plat_dat pointer, rather
> than copying plat_dat->stmmac_rst to your private structure, please
> use the one in the plat_dat structure.
> 
> The next question I have is - do you need to assert both the AHB reset
> and stmmac_rst to set the PHY interface mode? I don't see a dependency
> between these two resets in the socfpga code - the driver doesn't treat
> them as nested. It asserts the AHB reset _then_ the stmmac reset, and
> then releases them in the same order rather than reverse order. This
> suggests there's no interdependence between them, and probably it's
> only necessary to assert the stmmac core's reset (stmmac_rst).
> 
> So, maybe the driver can leave the handling of plat_dat->stmmac_ahb_rst
> to the stmmac core code?
> 

Thanks for the suggestion. According to this commit[1], it seems that 
both reset lines need to get toggled. But I'm going to run some test on 
HW and make the appropriate changes.

Dinh

[1] 
https://lore.kernel.org/all/20250205134428.529625725@linuxfoundation.org/


