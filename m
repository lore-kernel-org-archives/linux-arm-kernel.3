Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661C8C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzBPjq7zJ/E4WWNdaVu+VzaEbNExyKV4C2BkFHWH5JM=; b=4OJc7SWItcWGD3XmX7vMaC7pg3
	c9ICewRbtCKwt2AD6YXZ4kA5RKZtztwkX1RnsLkchzNBEWsBFhs29LxFeRQgRccTly4UMHmsoCZXR
	PnSw67Dg+WBT38v7Xz0lxNYyaSBU04DzBlypmiWBJDm7CSCUhqWZMNWoqYHUZtkhC6GNMOVcN/4xu
	pNjbZKLZTd3YIk0Pn1KLleeuykazi6zEXhRP7kLdESgOYPFw5grvLig0ANwRFg4v2fOPPCAiAl0Tc
	GHCJumXA+5mLQdX7WTpLsmhn8B43TVqRMaQ73/2a3DFnRcqe6YjkupQDZAfylHtaGCFOHGn5v0CBa
	4/bFii7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAP-00000006N8Z-3PnH;
	Tue, 08 Jul 2025 19:39:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCIz-0000000696G-2OXS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rzBPjq7zJ/E4WWNdaVu+VzaEbNExyKV4C2BkFHWH5JM=; b=vgUKd8v++Eqkxpg6mZRw6MBhUs
	L6B0/4PxzDGgU3aatVWOahA8IabF7XTcbn54qC5w0KfxKVHMEx6UT45rPfIXoM68b5HIzawTXC3Wn
	IY+4vJFuwmsqlGuSP8twmV2XkJH8rnJg1vrr0W4AfqULD9obkLggL0RfSexdLwHHLyJg8vro3/A34
	rSDwrKVBx4FMZ9Es4iFaZtg9q6qEU4jk7yPGm4tLCEDcZnNWTS4TWEI5tUDmJW2wTYc+xXXg29AKY
	8t9zgN2X4OVHXC5W4zeYXzKxwdp9BNVktd58g0dHu0E4YA5/SgPAgoBvH6HCRIlyzN5DuQeZYcJ+x
	YvrFdBRw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35708)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uZCIf-0006vc-11;
	Tue, 08 Jul 2025 18:40:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uZCIY-0001nm-3D;
	Tue, 08 Jul 2025 18:40:07 +0100
Date: Tue, 8 Jul 2025 18:40:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Lizhe <sensor1010@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
	maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Support gpio high-level reset for devices
 requiring it
Message-ID: <aG1X9pPYDGO8kfM9@shell.armlinux.org.uk>
References: <20250708165044.3923-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708165044.3923-1-sensor1010@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_104033_611716_FD9C16F8 
X-CRM114-Status: GOOD (  18.41  )
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

On Tue, Jul 08, 2025 at 09:50:44AM -0700, Lizhe wrote:
> some devices only reset when the GPIO is at a high level, but the
> current function lacks support for such devices. add high-level
> reset functionality to the function to support devices that require
> high-level triggering for reset
> 
> Signed-off-by: Lizhe <sensor1010@163.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 836f2848dfeb..cb989e6d7eac 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -458,6 +458,7 @@ int stmmac_mdio_reset(struct mii_bus *bus)
>  
>  #ifdef CONFIG_OF
>  	if (priv->device->of_node) {
> +		int active_low = 0;
>  		struct gpio_desc *reset_gpio;
>  		u32 delays[3] = { 0, 0, 0 };
>  
> @@ -467,6 +468,9 @@ int stmmac_mdio_reset(struct mii_bus *bus)
>  		if (IS_ERR(reset_gpio))
>  			return PTR_ERR(reset_gpio);
>  
> +		if (reset_gpio)
> +			active_low = gpiod_is_active_low(reset_gpio);
> +
>  		device_property_read_u32_array(priv->device,
>  					       "snps,reset-delays-us",
>  					       delays, ARRAY_SIZE(delays));
> @@ -474,11 +478,11 @@ int stmmac_mdio_reset(struct mii_bus *bus)
>  		if (delays[0])
>  			msleep(DIV_ROUND_UP(delays[0], 1000));
>  
> -		gpiod_set_value_cansleep(reset_gpio, 1);
> +		gpiod_set_value_cansleep(reset_gpio, active_low ? 1 : 0);
>  		if (delays[1])
>  			msleep(DIV_ROUND_UP(delays[1], 1000));
>  
> -		gpiod_set_value_cansleep(reset_gpio, 0);
> +		gpiod_set_value_cansleep(reset_gpio, active_low ? 0 : 1);
>  		if (delays[2])
>  			msleep(DIV_ROUND_UP(delays[2], 1000));
>  	}

NAK. Not required. The GPIO layer can cope with active-high and
active-low signals declared in firmware without needing driver
modification. Use the right data in the firmware and you don't
need to patch.

/* Bit 0 express polarity */
#define GPIO_ACTIVE_HIGH 0
#define GPIO_ACTIVE_LOW 1

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

