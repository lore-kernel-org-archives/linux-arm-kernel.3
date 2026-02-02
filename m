Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AA8E7FDCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 20:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjBpuLkcLUaCRKPdP4eX6OjLAhe9FJoKGb09vlloYBU=; b=KcDv6evia+ALr/LCM6F35SY3QR
	aTCRrmtYiJwjCJJK2qeSQFEVrGdpYSA+ycyhsI0KMbHE2T3W/ksd3khxKCRYpg+xvLZ2h0kbLmwGw
	EhLdxTHWyQsGT23bCzHbhGQHeiWoJ+4mc764FrayMgeWCc7QufDUJV9oF8FjurFFp69xj4F/gx2gZ
	BI3Z5F9nRb2JNIprqD4KBGg0M1U/jx7VtKueqOPjXRM2GKwHIfD11SRfq/ARU5XLUzwovUWoHY51U
	qZIEFRFzXzoP6NB+9wMmludrSCRn14kJMYQ4CvO2n0S49A7SwTgKTBwU8ZSQXN9HtyhZgacjqGinj
	cdpolOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn0sM-00000005dpb-01I2;
	Mon, 02 Feb 2026 20:50:26 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn0sJ-00000005dox-06xl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 20:50:24 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-658b9e95990so9404296a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 12:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770065420; x=1770670220; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MjBpuLkcLUaCRKPdP4eX6OjLAhe9FJoKGb09vlloYBU=;
        b=VQA5wyoHKEh+wqSbPe7sdHwCW0ij4OTiD3zUrePgtM3BsqApKnb8SwxWzBGBPEv39Z
         stK5tr2wk7+2I5UekJgmUDTGcMC4ykL0efVKU5RTx9YarP78lwlffFxQ1h42HBviMByf
         5KH91nyaC9S9OnrIfbH2U4EIXIA5Bj3T8HqY6P+HwVyzS+7VQWHodE9MLF2lbAnDt7Dv
         ZtFFCmw9dAY2LVLiOQ7Pqzwlyr1V+8WPBlVn/sORa5oUdTEuDCoiuGM+veGI6o9Kwggq
         kSYDC5e5Pqr33hHjOhDAAcnHUM7REfQx0so1o7aAM9vevzFpPPAMnSyiShnb66LvQeBp
         ih0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770065420; x=1770670220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjBpuLkcLUaCRKPdP4eX6OjLAhe9FJoKGb09vlloYBU=;
        b=FMchi9RsPIWUfctiUW1CsItsCxYQSl1uDfYaQLz7NICQohzgObQZiO7bhatalGknCO
         Hct1dsQazBZU+nexZAWk1KRG+8xVN0iPp2lFJImUNm60eh7G7II+GazB7bp+Dt8VlCTp
         b8iStUAwHPM176/kwuCkHEOwFdfE4wz5Gfta8Ocguw15SeetzC2cRg2KeNPydwrwkJwk
         p/z729+Ja1lyrT+RlLG7pHNXqggV51haNvweSvtoR2T7VzK7b0q17pGNbOu1crfMRSDw
         YNo5R7taYZb8jrtMl6/NUu7lt+RaNM4ewOTqyPO9EvkPo03YlwLOyeZtgF1Ku943EaDr
         z63g==
X-Forwarded-Encrypted: i=1; AJvYcCU0ePGY8RfIXRSWolRaL5yj0zyL1MnNBQy2yWurCr94g6ZWoZ+6KBB0xQyAuWjmh1tkEadGQeMlDNviEJedESy+@lists.infradead.org
X-Gm-Message-State: AOJu0YyQGWG4goI+27klIxRMAsgiyHSu/5P1F9MY71eJDK46iLiigJaa
	AiZIcLMmQy6Y2/BB+F1lDmQRYaexdoJmptT4xO7Aq/ZZgKddMNdCFovazAR7dg==
X-Gm-Gg: AZuq6aIKdmCSs8ms11rLNqiqHGVT90h7IidpCOj09axSn+H8n0UVctBb+JKIzo5rfNC
	ydZYb1iwqpB/e4vZCUmZOE9fprbovdSp2mRsYCo/udoglfmZbeqefsRCQzP6tZftC/pMMbVE4hf
	6QAkCMtGV0+uY7uVTQW750NQh7upuT+y1iEvKKhnvJ1v62dX5nEWeb/kZofWxYX/4Atp4/C1ydE
	hp+lVIDkSkLqTg5QhqsvffOdrjFXSMS6q04chkagVZTsMzGJw85aWdkRnlJ5a8wvWJEefIUKFxn
	cN3sCnxFVGfLtkLF7jZVZPB0KKGxyGm+XqM0l2EdVgMrgkKsgN8kCoyjd51bYWDMBwce2NUe9P8
	AHkkse+f84+FCCgfqWz0aXsMpqe/8WTjWbhi04JFIGeYKW3+I92rcyRK3GLokr1K4YdcEmhC3Aq
	wYv/d5nq01L1biSC3Hm/YDSjc2yLCGDpncTZE=
X-Received: by 2002:a05:600c:1385:b0:47e:dc64:f1c6 with SMTP id 5b1f17b1804b1-482db493eb4mr189595615e9.6.1770058495160;
        Mon, 02 Feb 2026 10:54:55 -0800 (PST)
Received: from [192.168.0.7] ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482db623407sm125687055e9.0.2026.02.02.10.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 10:54:54 -0800 (PST)
Message-ID: <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
Date: Mon, 2 Feb 2026 20:54:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: stmmac: provide flag to disable EEE
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
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
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_125023_108501_8D467E14 
X-CRM114-Status: GOOD (  34.96  )
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

On 11/24/25 1:27 PM, Russell King (Oracle) wrote:
> Some platforms have problems when EEE is enabled, and thus need a way
> to disable stmmac EEE support. Add a flag before the other LPI related
> flags which tells stmmac to avoid populating the phylink LPI
> capabilities, which causes phylink to call phy_disable_eee() for any
> PHY that is attached to the affected phylink instance.
> 
> iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
> along with the main dwmac interrupts. Since lpi_intr_o is synchronous
> to the receive clock domain, and takes four clock cycles to clear, this
> leads to interrupt storms as the interrupt remains asserted for some
> time after the LPI control and status register is read.
> 
> This problem becomes worse when the receive clock from the PHY stops
> when the receive path enters LPI state - which means that lpi_intr_o
> can not deassert until the clock restarts. Since the LPI state of the
> receive path depends on the link partner, this is out of our control.
> We could disable RX clock stop at the PHY, but that doesn't get around
> the slow-to-deassert lpi_intr_o mentioned in the above paragraph.
> 
> Previously, iMX8MP worked around this by disabling gigabit EEE, but
> this is insufficient - the problem is also visible at 100M speeds,
> where the receive clock is slower.
> 
> There is extensive discussion and investigation in the thread linked
> below, the result of which is summarised in this commit message.
> 

We are seeing the same lpi_intr_o interrupt storm on the Renesas RZ/V2H
EVK (dwmac-renesas-gbeth.c). On this platform, lpi_intr_o is routed as a
separate, dedicated interrupt line to the CPU rather than being OR'd
with the main DWMAC interrupt as on iMX8MP. This corresponds to the
"eth_lpi" interrupt in the stmmac bindings:
"""
- description: The interrupt that occurs when Rx exits the LPI state
const: eth_lpi
"""

Looking through the other glue drivers/device-trees, it looks to me that
every platform that defines a separate "eth_lpi" irq might have the
interrupt storm problem.

To fix this issue on these platforms, rather than disabling EEE
altogether, would it be possible to just not request the eth_lpi
interrupt and let EEE continue to work? Perhaps a new flag could let
each platform decide.

If not, maybe this patch could be merged to add the flag that disables
EEE and I will just send a patch to disable EEE on our platforms as well.

Thanks,
Ovidiu


> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/r/20251026122905.29028-1-laurent.pinchart@ideasonboard.com
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> For Laurent to add to a patch series appropriately adding
> STMMAC_FLAG_EEE_DISABLE to dwmac-imx.c
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
>  include/linux/stmmac.h                            | 9 +++++----
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 6cacedb2c9b3..ca0eee58a8a8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1324,7 +1324,12 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
>  				 config->supported_interfaces,
>  				 pcs->supported_interfaces);
>  
> -	if (priv->dma_cap.eee) {
> +	/* Some platforms, e.g. iMX8MP, wire lpi_intr_o to the same interrupt
> +	 * used for stmmac's main interrupts, which leads to interrupt storms.
> +	 * STMMAC_FLAG_EEE_DISABLE allows EEE to be disabled on such platforms.
> +	 */
> +	if (priv->dma_cap.eee &&
> +	    !(priv->plat->flags & STMMAC_FLAG_EEE_DISABLE)) {
>  		/* Assume all supported interfaces also support LPI */
>  		memcpy(config->lpi_interfaces, config->supported_interfaces,
>  		       sizeof(config->lpi_interfaces));
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index f1054b9c2d8a..5ed49d5363ee 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -187,10 +187,11 @@ enum dwmac_core_type {
>  #define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
>  #define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
>  #define STMMAC_FLAG_INT_SNAPSHOT_EN		BIT(9)
> -#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(10)
> -#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(11)
> -#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
> -#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
> +#define STMMAC_FLAG_EEE_DISABLE			BIT(10)
> +#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(11)
> +#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(12)
> +#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(13)
> +#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(14)
>  
>  struct mac_device_info;
>  


