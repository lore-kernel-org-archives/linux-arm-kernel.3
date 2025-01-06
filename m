Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADA4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 22:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3HtqhqXFvoyrIC6n47ISNYPNgplPpn301HvMRip+UY=; b=TC9kxaT82dBw79RnOfKpRROO1J
	VBWQz1EmEx3f8n72qb9CDtc/kkqMDbLULvzteLXbXSPdiZaWK7xhUQU1mfGAiuVpgeymd2pVJV4Hx
	7DM/5+fe9JeF/WbGmMABg/74bdO+301ayXEbNiKzib2MAKXD5CAIeUYtBvAhsJE/0H16ytLlmT3Fw
	Dl/vAKabBVKttSAuv5orV611KEbdyK6NQvBl0TR3S8pzer1jDaGzqJBxslWj2bqHZ6Vwf2N7LvGnn
	NoKrt7+KURkN5mxYrjQGJYONS5cdvKMoLiguix3g+Ee9+bQ7X6zq9qV1T4+J/cgGbrBH8lIVH8X4p
	Add7Pnaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUvFV-00000002pET-0x6F;
	Mon, 06 Jan 2025 22:07:01 +0000
Received: from smtp-74.smtpout.orange.fr ([80.12.242.74] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUvEG-00000002p0U-0V1X;
	Mon, 06 Jan 2025 22:05:45 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id UvE7ty6bJwCcpUvEAtVKJD; Mon, 06 Jan 2025 23:05:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736201141;
	bh=F3HtqhqXFvoyrIC6n47ISNYPNgplPpn301HvMRip+UY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=DCvdT4N4Zwqo/GPGO50yTqMrwTvthCy0KkJhtWye/JdWSp2bomz9KkT5PBD7YNnNa
	 jNNINI0+BhYWLeDnHM5q3X0jUHT2wuVKJ6mezSOfqP1fAJhBP3mGN/mfW/wvS01jln
	 kinKSXgCwb4KWt9rdRbx0Lw/MeRd+0Ix+stZ1/4zXQC7xUBcYyeBs+LjU4dRiYSaxB
	 PcghP05LBVofudikxGv2e8U4Fzmhd99XwiVgtsbeMBVKGocM29iIE62QvR77sdm05X
	 3bGEM747Y1YmvWcXNt0hUyDj+lxH0L54c7N+2ETA1b1PgIpYSwS563f0w4GzW6mSfq
	 n+uLASIoXsxfQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 06 Jan 2025 23:05:41 +0100
X-ME-IP: 90.11.132.44
Message-ID: <24498c4e-c517-46b9-8d0c-ff1e3a308228@wanadoo.fr>
Date: Mon, 6 Jan 2025 23:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] phy: cadence-torrent: Add PCIe multilink + USB
 with same SSC register config for 100 MHz refclk
To: Siddharth Vadapalli <s-vadapalli@ti.com>, vkoul@kernel.org,
 kishon@kernel.org, sjakhade@cadence.com, rogerq@kernel.org,
 thomas.richard@bootlin.com, u.kleine-koenig@baylibre.com, eballetb@redhat.com
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com
References: <20250106131925.263240-1-s-vadapalli@ti.com>
 <20250106131925.263240-3-s-vadapalli@ti.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250106131925.263240-3-s-vadapalli@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_140544_428882_1E6EE2C4 
X-CRM114-Status: GOOD (  16.46  )
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

Le 06/01/2025 à 14:19, Siddharth Vadapalli a écrit :
> From: Swapnil Jakhade <sjakhade@cadence.com>
> 
> Add register sequences and support for PCIe multilink + USB configuration
> for 100MHz reference clock. The same SSC is used for both PCIe and USB.
> 
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
...

> @@ -2513,6 +2517,44 @@ int cdns_torrent_phy_configure_multilink(struct cdns_torrent_phy *cdns_phy)
>   
>   		phy_t1 = fns(cdns_phy->protocol_bitmask, 0);
>   		phy_t2 = fns(cdns_phy->protocol_bitmask, 1);
> +
> +		/**

Why kernel-doc like start of comment?
Only /* ?

> +		 * PCIe Multilink configuration can be supported along with a
> +		 * non-PCIe protocol. The existing limitation associated with
> +		 * the standalone PCIe Multilink configuration still remains,
> +		 * implying that there can be only two links (subnodes) of the
> +		 * PHY type PCIe which constitute the PCIe Multilink.
> +		 *
> +		 * Such configurations are handled by introducing a new protocol
> +		 * namely TYPE_PCIE_ML. Both of the PCIe links which have the
> +		 * protocol as TYPE_PCIE shall be treated as though the protocol
> +		 * corresponding to them is TYPE_PCIE_ML only for the sake of
> +		 * configuring the SERDES.
> +		 *
> +		 * PCIe Multilink configuration can be identified by checking if
> +		 * there are exactly two links with phy_type set to TYPE_PCIE.
> +		 * phy_t1 and phy_t2 are modified in such cases to support the
> +		 * PCIe Multilink configuration with a non-PCIe protocol.
> +		 */
...

> @@ -3134,6 +3180,37 @@ static void cdns_torrent_phy_remove(struct platform_device *pdev)
>   	cdns_torrent_clk_cleanup(cdns_phy);
>   }
>   
> +/* Multilink PCIe and USB Same SSC link configuration */
> +static struct cdns_reg_pairs ml_pcie_usb_link_cmn_regs[] = {
> +	{0x0002, PHY_PLL_CFG},
> +	{0x8600, CMN_PDIAG_PLL0_CLK_SEL_M0}
> +};

Maybe const could be added here and below?

> +
> +static struct cdns_reg_pairs ml_pcie_usb_xcvr_diag_ln_regs[] = {
> +	{0x0100, XCVR_DIAG_HSCLK_SEL},
> +	{0x0013, XCVR_DIAG_HSCLK_DIV},
> +	{0x0812, XCVR_DIAG_PLLDRC_CTRL}
> +};

...

CJ

