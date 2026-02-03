Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E24E87841
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mRvLOCNLqjVmjiKjh0H9exGu/p/pcpVAXu1Cdl+14Q=; b=efY7J/sP3QhAgG+LDDtLWtT7Bo
	qO+vUXRc/LNzTenRrmszHfYbijHIZlc8lY2sBTTOq+v6fVsCptVsIEGzMmKQzLXE/cou9gogGXA1N
	05EyMen+Ei00/MVNJSo7EoYskq6hIlXLJv0yoDYLTX9T8pi30yenzNU8nSRADzgbP08q7O0VjM5Ui
	GjQXfBUQ01qcdkzCQf32Tgcuhi/kqCzVc4kjqiq9SxGEULV+3+M6FI3wYWbZC64IZegzNFqllvub4
	g1Dlx4WDgVGqomG7TpZrYs1yP21kDmltEiV35tX40QikOdtHUyuXrTRjNoL0yAHS9bPVpP7Z0Fflg
	chZELfYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIXf-00000006qmT-3yBK;
	Tue, 03 Feb 2026 15:42:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIXc-00000006qlh-3KgP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 15:42:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43246af170aso610394f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 07:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770133331; x=1770738131; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8mRvLOCNLqjVmjiKjh0H9exGu/p/pcpVAXu1Cdl+14Q=;
        b=R+Ac11G9qdbEs9F0z1NCpnSvcqjdPfqx+/BFJV8E6Ysefxk6KkH5o3Kxn2jG+wtO9q
         NiCvlIUy19WLJOsvuHu0AE8VQ2ujuRxh7yr6VO0lIShEaYkcfeBDXu9GGZNgRDHzS3oR
         1j5lR75GcmqSIlv6ePrErzwA/DMLb2iunHHZUYZY8JzeFh2gN88HT178TcEdGBUsRYI3
         N1CBJR9EdIIHKBvXla1GVriHEG4JV9GOxA2d9BtsbUoJAPgP3ZHc/yNYmqWlLSD6kPIK
         GHh8gOdEBk3z50B8lnkIIqk52S40wZtsCGPkQBCf1Bbmh/0Zo0YfHQKbNKK9dztu8USI
         GDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133331; x=1770738131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mRvLOCNLqjVmjiKjh0H9exGu/p/pcpVAXu1Cdl+14Q=;
        b=Em1QHh6EWS3uTILDvIis8v6Kd8LnzQ9PQxvKcKU/0qqHGBSnY1pWhMh+h8Ju74cnBZ
         AYA9JZbXaJ1GHFW4vEQEaN0g2G15pamvkscBM0gYyjqrnGWZpqiDYW/YYZ7izEni/v2w
         AcEMp+woEdAGLf1XKDRxT8D5SU2zN1qNPYYfXbCFwcYOVltSCY/vNnWI1RkKDj0lYZDR
         YVK3UpeSCu86Nv59f31bUbRgpNkmn/y2cHPeWS+eN7x3l8s3lKDE3aODhHdfrPv78vMv
         UokVhambdAeFeiaThn8+J/0e1MqEmiBfCmU/7OENbmCpIYj/2cvbI+E0pg4XReVlVRX3
         iksg==
X-Forwarded-Encrypted: i=1; AJvYcCUjD8MLDBXn+aASQiAe0IyVNzNCJ7lpVDVTmGQfqtWljl1Puh3pRRClxFkuTCfeGjt5UV5hkXkfn6b9Ay1Pvp2C@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ3ZZeJVpmhsoghfLH7EfskYSAc68Ky46M8mgHavRbvJO+ZXx9
	ZPRgR0GpHQBW6UnmNfE2nalhapp6mg90vktnSias4AzeNgoewX9aahwb
X-Gm-Gg: AZuq6aIZEX29aTbOsuf2nhDLPKGep1iFBRK0+pakWj16IhkPAnDTlvMGi7JqSrnOTGP
	HRdFi3Dhtmfkm4ei4jYBq7Uy78xaux7owrPyvyfncOhzGxwL/UNNdqGMlTH4aYRqUGOYWFAjju2
	B6YxdMBTaKt9SLENSsajJ4BDQe77oTCqcOqZghsHDN0NCujgunV1M1J9vTXA1RSB8QW/CGPJXIO
	eYf7kkmxM7lFxJaF6xTaQ6sDakuDfhwP+pdafxacs47y+Q2L6P0FazbUpbc2jFQdqsriDBZIyAC
	vd2Heaulwto0t8+Ymj3H2i2YOd2uTkjYi3EAcEYpKdhENIxEZSXMPNHf3nrLII885MLepS083a1
	+L75pADD/lKxb9sGFnhkJ091glDjUxvb/mETQEKGz0Hvw4BTDq4ttp8SbytDazF26j5MRYx2L+u
	w/KOqI7k5oVWvPaqawjfR+9lUV
X-Received: by 2002:a05:6000:2dc5:b0:435:bcbd:cb29 with SMTP id ffacd0b85a97d-436113099b6mr5919152f8f.2.1770133330387;
        Tue, 03 Feb 2026 07:42:10 -0800 (PST)
Received: from [192.168.0.7] ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm54954039f8f.5.2026.02.03.07.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 07:42:10 -0800 (PST)
Message-ID: <ea2434e6-d1db-4ea2-90f4-0a77961b7918@gmail.com>
Date: Tue, 3 Feb 2026 17:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: stmmac: provide flag to disable EEE
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Stefan Klug <stefan.klug@ideasonboard.com>,
 Wei Fang <wei.fang@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
 <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
 <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_074212_906939_21BE1D4C 
X-CRM114-Status: GOOD (  50.87  )
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


Hi Russell,

On 2/3/26 12:23 AM, Russell King (Oracle) wrote:
> On Mon, Feb 02, 2026 at 08:54:52PM +0200, Ovidiu Panait wrote:
>>
>> Hi Russell,
>>
>> On 11/24/25 1:27 PM, Russell King (Oracle) wrote:
>>> Some platforms have problems when EEE is enabled, and thus need a way
>>> to disable stmmac EEE support. Add a flag before the other LPI related
>>> flags which tells stmmac to avoid populating the phylink LPI
>>> capabilities, which causes phylink to call phy_disable_eee() for any
>>> PHY that is attached to the affected phylink instance.
>>>
>>> iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
>>> along with the main dwmac interrupts. Since lpi_intr_o is synchronous
>>> to the receive clock domain, and takes four clock cycles to clear, this
>>> leads to interrupt storms as the interrupt remains asserted for some
>>> time after the LPI control and status register is read.
>>>
>>> This problem becomes worse when the receive clock from the PHY stops
>>> when the receive path enters LPI state - which means that lpi_intr_o
>>> can not deassert until the clock restarts. Since the LPI state of the
>>> receive path depends on the link partner, this is out of our control.
>>> We could disable RX clock stop at the PHY, but that doesn't get around
>>> the slow-to-deassert lpi_intr_o mentioned in the above paragraph.
>>>
>>> Previously, iMX8MP worked around this by disabling gigabit EEE, but
>>> this is insufficient - the problem is also visible at 100M speeds,
>>> where the receive clock is slower.
>>>
>>> There is extensive discussion and investigation in the thread linked
>>> below, the result of which is summarised in this commit message.
>>>
>>
>> We are seeing the same lpi_intr_o interrupt storm on the Renesas RZ/V2H
>> EVK (dwmac-renesas-gbeth.c). On this platform, lpi_intr_o is routed as a
>> separate, dedicated interrupt line to the CPU rather than being OR'd
>> with the main DWMAC interrupt as on iMX8MP. This corresponds to the
>> "eth_lpi" interrupt in the stmmac bindings:
>> """
>> - description: The interrupt that occurs when Rx exits the LPI state
>> const: eth_lpi
>> """
>>
>> Looking through the other glue drivers/device-trees, it looks to me that
>> every platform that defines a separate "eth_lpi" irq might have the
>> interrupt storm problem.
> 
> That is highly likely.
> 
>> To fix this issue on these platforms, rather than disabling EEE
>> altogether, would it be possible to just not request the eth_lpi
>> interrupt and let EEE continue to work? Perhaps a new flag could let
>> each platform decide.
> 
> Yes, because lpi_intr_o serves no purpose from a software point of
> view - see the commit message below for the details. I do like
> removing code from stmmac :)
> 
>> If not, maybe this patch could be merged to add the flag that disables
>> EEE and I will just send a patch to disable EEE on our platforms as well.
> 
> We still need the flag to disable EEE for platforms where lpi_intr_o is
> logically OR'd with the other interrupts, so there's no way to ignore
> its persistent assertion.
> 
> 8<===
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> Subject: [PATCH net-next] net: stmmac: remove support for lpi_intr_o
> 
> The dwmac databook for v3.74a states that lpi_intr_o is a sideband
> signal which should be used to ungate the application clock, and this
> signal is synchronous to the receive clock. The receive clock can run
> at 2.5, 25 or 125MHz depending on the media speed, and can stop under
> the control of the link partner. This means that the time it takes to
> clear is dependent on the negotiated media speed, and thus can be 8,
> 40, or 400ns after reading the LPI control and status register.
> 
> It has been observed with some aggressive link partners, this clock
> can stop while lpi_intr_o is still asserted, meaning that the signal
> remains asserted for an indefinite period that the local system has
> no direct control over.
> 
> The LPI interrupts will still be signalled through the main interrupt
> path in any case, and this path is not dependent on the receive clock.
> 
> This, since we do not gate the application clock, and the chances of
> adding clock gating in the future are slim due to the clocks being
> ill-defined, lpi_intr_o serves no useful purpose. Remove the code which
> requests the interrupt, and all associated code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks for fixing this. I did some testing on the Renesas RZ/V2H board
with this patch and didn't see any issues:

Tested-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Ovidiu

> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 -
>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  4 ---
>  .../ethernet/stmicro/stmmac/dwmac-loongson.c  |  7 ----
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 --
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 36 -------------------
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |  8 -----
>  include/linux/stmmac.h                        |  1 -
>  7 files changed, 59 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 1c5a4af85b58..d26e8a063022 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -394,7 +394,6 @@ enum request_irq_err {
>  	REQ_IRQ_ERR_SFTY,
>  	REQ_IRQ_ERR_SFTY_UE,
>  	REQ_IRQ_ERR_SFTY_CE,
> -	REQ_IRQ_ERR_LPI,
>  	REQ_IRQ_ERR_WOL,
>  	REQ_IRQ_ERR_MAC,
>  	REQ_IRQ_ERR_NO,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> index aad1be1ec4c1..92d77b0c2f54 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> @@ -719,7 +719,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
>  
>  	/* Setup MSI vector offset specific to Intel mGbE controller */
>  	plat->msi_mac_vec = 29;
> -	plat->msi_lpi_vec = 28;
>  	plat->msi_sfty_ce_vec = 27;
>  	plat->msi_sfty_ue_vec = 26;
>  	plat->msi_rx_base_vec = 0;
> @@ -1177,8 +1176,6 @@ static int stmmac_config_multi_msi(struct pci_dev *pdev,
>  		res->irq = pci_irq_vector(pdev, plat->msi_mac_vec);
>  	if (plat->msi_wol_vec < STMMAC_MSI_VEC_MAX)
>  		res->wol_irq = pci_irq_vector(pdev, plat->msi_wol_vec);
> -	if (plat->msi_lpi_vec < STMMAC_MSI_VEC_MAX)
> -		res->lpi_irq = pci_irq_vector(pdev, plat->msi_lpi_vec);
>  	if (plat->msi_sfty_ce_vec < STMMAC_MSI_VEC_MAX)
>  		res->sfty_ce_irq = pci_irq_vector(pdev, plat->msi_sfty_ce_vec);
>  	if (plat->msi_sfty_ue_vec < STMMAC_MSI_VEC_MAX)
> @@ -1294,7 +1291,6 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
>  	 */
>  	plat->msi_mac_vec = STMMAC_MSI_VEC_MAX;
>  	plat->msi_wol_vec = STMMAC_MSI_VEC_MAX;
> -	plat->msi_lpi_vec = STMMAC_MSI_VEC_MAX;
>  	plat->msi_sfty_ce_vec = STMMAC_MSI_VEC_MAX;
>  	plat->msi_sfty_ue_vec = STMMAC_MSI_VEC_MAX;
>  	plat->msi_rx_base_vec = STMMAC_MSI_VEC_MAX;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index ed0b534d8d7b..d66ae6ea4df5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -442,13 +442,6 @@ static int loongson_dwmac_dt_config(struct pci_dev *pdev,
>  		res->wol_irq = res->irq;
>  	}
>  
> -	res->lpi_irq = of_irq_get_byname(np, "eth_lpi");
> -	if (res->lpi_irq < 0) {
> -		dev_err(&pdev->dev, "IRQ eth_lpi not found\n");
> -		ret = -ENODEV;
> -		goto err_put_node;
> -	}
> -
>  	ret = device_get_phy_mode(&pdev->dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "phy_mode not found\n");
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 012b0a477255..aafd8c39be63 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -31,7 +31,6 @@ struct stmmac_resources {
>  	void __iomem *addr;
>  	u8 mac[ETH_ALEN];
>  	int wol_irq;
> -	int lpi_irq;
>  	int irq;
>  	int sfty_irq;
>  	int sfty_ce_irq;
> @@ -297,7 +296,6 @@ struct stmmac_priv {
>  	int wol_irq;
>  	u32 gmii_address_bus_config;
>  	struct timer_list eee_ctrl_timer;
> -	int lpi_irq;
>  	u32 tx_lpi_timer;
>  	bool tx_lpi_clk_stop;
>  	bool eee_enabled;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 7a451ae19f50..7925575fb348 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3734,10 +3734,6 @@ static void stmmac_free_irq(struct net_device *dev,
>  			free_irq(priv->sfty_ce_irq, dev);
>  		fallthrough;
>  	case REQ_IRQ_ERR_SFTY_CE:
> -		if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq)
> -			free_irq(priv->lpi_irq, dev);
> -		fallthrough;
> -	case REQ_IRQ_ERR_LPI:
>  		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
>  			free_irq(priv->wol_irq, dev);
>  		fallthrough;
> @@ -3795,24 +3791,6 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>  		}
>  	}
>  
> -	/* Request the LPI IRQ in case of another line
> -	 * is used for LPI
> -	 */
> -	if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq) {
> -		int_name = priv->int_name_lpi;
> -		sprintf(int_name, "%s:%s", dev->name, "lpi");
> -		ret = request_irq(priv->lpi_irq,
> -				  stmmac_mac_interrupt,
> -				  0, int_name, dev);
> -		if (unlikely(ret < 0)) {
> -			netdev_err(priv->dev,
> -				   "%s: alloc lpi MSI %d (error: %d)\n",
> -				   __func__, priv->lpi_irq, ret);
> -			irq_err = REQ_IRQ_ERR_LPI;
> -			goto irq_error;
> -		}
> -	}
> -
>  	/* Request the common Safety Feature Correctible/Uncorrectible
>  	 * Error line in case of another line is used
>  	 */
> @@ -3952,19 +3930,6 @@ static int stmmac_request_irq_single(struct net_device *dev)
>  		}
>  	}
>  
> -	/* Request the IRQ lines */
> -	if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq) {
> -		ret = request_irq(priv->lpi_irq, stmmac_interrupt,
> -				  IRQF_SHARED, dev->name, dev);
> -		if (unlikely(ret < 0)) {
> -			netdev_err(priv->dev,
> -				   "%s: ERROR: allocating the LPI IRQ %d (%d)\n",
> -				   __func__, priv->lpi_irq, ret);
> -			irq_err = REQ_IRQ_ERR_LPI;
> -			goto irq_error;
> -		}
> -	}
> -
>  	/* Request the common Safety Feature Correctible/Uncorrectible
>  	 * Error line in case of another line is used
>  	 */
> @@ -7752,7 +7717,6 @@ static int __stmmac_dvr_probe(struct device *device,
>  
>  	priv->dev->irq = res->irq;
>  	priv->wol_irq = res->wol_irq;
> -	priv->lpi_irq = res->lpi_irq;
>  	priv->sfty_irq = res->sfty_irq;
>  	priv->sfty_ce_irq = res->sfty_ce_irq;
>  	priv->sfty_ue_irq = res->sfty_ue_irq;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 8979a50b5507..5c9fd91a1db9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -725,14 +725,6 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  		stmmac_res->wol_irq = stmmac_res->irq;
>  	}
>  
> -	stmmac_res->lpi_irq =
> -		platform_get_irq_byname_optional(pdev, "eth_lpi");
> -	if (stmmac_res->lpi_irq < 0) {
> -		if (stmmac_res->lpi_irq == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
> -	}
> -
>  	stmmac_res->sfty_irq =
>  		platform_get_irq_byname_optional(pdev, "sfty");
>  	if (stmmac_res->sfty_irq < 0) {
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 5199451dd0bc..2620f0217f88 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -300,7 +300,6 @@ struct plat_stmmacenet_data {
>  	int int_snapshot_num;
>  	int msi_mac_vec;
>  	int msi_wol_vec;
> -	int msi_lpi_vec;
>  	int msi_sfty_ce_vec;
>  	int msi_sfty_ue_vec;
>  	int msi_rx_base_vec;


