Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD16C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 21:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWQRt1yyWv2hQUZxsLlJUn3faeVrzl7c/ruwfvfePz4=; b=rMVay2gSM9pURVeCV9oIcR76RQ
	9FNyvWPJ0OAaR9AuNPleTMYpTBMGxE1z1cCk5PfjIgXiWcqsiVAIgoZymJ1Lv1KCTsVVLj4kmN8Wc
	MBQirUKI46JKs4aOPtPPvmzYCJ3lbHybPWwBeLecVYLXzCagqCY1Rs5nJ7itnBUjALXDsUbmK2+wM
	fhxGPPTCD681iYnCPjJr4Y+CH0wRYMrhKl98zzOCnifJAOHVte3EV9KJy78hv7L/HWXzkdGlcx07M
	HVWz1lK9qXpOYLXeqG+ibc5RmeCN9+Sd/i45QpjnXlPgNlDAutnmz0tNM2/gbJbcOVsNGjR+2iGyU
	a6EfUvSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlCS6-00000004XZs-4BHY;
	Sat, 18 Jul 2026 21:20:07 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlCS3-00000004XZ7-20K0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 21:20:05 +0000
Message-ID: <94bed211-037e-419b-ac99-13ad2294dace@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784409597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hWQRt1yyWv2hQUZxsLlJUn3faeVrzl7c/ruwfvfePz4=;
	b=rHAhXEPNjC8i59ukjtLt0bteaiubxrFvYwn0v4I4sPOyv9evnqXNGiN0e1nf+A/sTc1hM7
	UKd7TlsKZ+7ub/G4bVQ8Qk60rTjfUd5FEK6VGJ/3dMSwEiYI+DeKPUP5YwpXDi+fTbuO5M
	Ae4W/KlHsLDjnx2KZzx1hnUAhObyGc0=
Date: Sat, 18 Jul 2026 22:19:44 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: stmmac: Simplify ioctl handling
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>
Cc: thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260718143848.677531-1-maxime.chevallier@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20260718143848.677531-1-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_142004_301779_2CED6D69 
X-CRM114-Status: GOOD (  19.66  )
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

On 18.07.2026 15:38, Maxime Chevallier wrote:
> Now that timestamping is controlled through an NDO, we can simply
> call phylink_mii_ioctl() to handle ioctls.
> 
> The only functional difference is that phylink_mii_ioctl() ->
> phy_mii_ioctl() can handle SIOCSHWTSTAMP, but this no longer happens
> as this ioctl is not longer dispatched to the ndo_eth_ioctl().
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> 
> Looking at this, I'm wondering if we can't just get rid of SIOCSHWTSTAMP
> handling in phy_mii_ioctl(). Looks like we can ?
> 
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c   | 17 +++--------------
>   1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 2a0d7eff88d3..562d20830b94 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6371,28 +6371,17 @@ static irqreturn_t stmmac_msi_intr_rx(int irq, void *data)
>    *  @rq: An IOCTL specific structure, that can contain a pointer to
>    *  a proprietary structure used to pass information to the driver.
>    *  @cmd: IOCTL command
> - *  Description:
> - *  Currently it supports the phy_mii_ioctl(...) and HW time stamping.
> + *  Description: Forward the PHY ioctls to phylink
> + *  Return: Zero on success or negative error code.
>    */
>   static int stmmac_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
>   {
>   	struct stmmac_priv *priv = netdev_priv (dev);
> -	int ret = -EOPNOTSUPP;
>   
>   	if (!netif_running(dev))
>   		return -EINVAL;
>   
> -	switch (cmd) {
> -	case SIOCGMIIPHY:
> -	case SIOCGMIIREG:
> -	case SIOCSMIIREG:
> -		ret = phylink_mii_ioctl(priv->phylink, rq, cmd);
> -		break;
> -	default:
> -		break;
> -	}
> -
> -	return ret;
> +	return phylink_mii_ioctl(priv->phylink, rq, cmd);
>   }
>   
>   static int stmmac_setup_tc_block_cb(enum tc_setup_type type, void *type_data,

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

