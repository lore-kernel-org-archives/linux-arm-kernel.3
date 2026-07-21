Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C28C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcrdkt/zpqdJhwX50ycE29+MVmNJkeE6hgzbUXIx5Z8=; b=d4Y8pY7I4AQ6xScprFz5hc59dR
	9vpUjHq9L4pj1kzDFb/6VDfSnvI8NUh1YOicc2e6LmExX7QmvDPsEHfJZZnKZ0bcRNjxun6DWCud3
	lFMdy8pSLtvRaak7w6nbsTi1TKrx8yI/HCfbdZ9X9EJXlfTinuBfp7w3Pb0A0V9DSujMOjDaUlYZq
	Q35ad0yKnhe3fWuGzqUUAdcVaRsh8WhNUDVFixHl1W6rE0G3MbEJVUirAU2vXqHWrAvtFnTlcqv0U
	sVoOh33i41DA2X9+30fTra+5mWOgTYqTtWMHNK29P+LxFIQHHmvOnVh+E+6eHpv+nCOWiBo3rqnW1
	kvc8wkug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDd4-00000009ygH-1GZl;
	Tue, 21 Jul 2026 16:47:38 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDcy-00000009ydI-18G2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 16:47:36 +0000
Message-ID: <1c128f18-0531-4761-a0aa-200a6378a882@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784652433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vcrdkt/zpqdJhwX50ycE29+MVmNJkeE6hgzbUXIx5Z8=;
	b=vzEe6KkbIvM/FVxKb3FR1k+Elok0XukYIRqpnxFDiYbwt0JtLFxnxwWS7iVMCdl5aqsQm7
	Fcuu/m5aN0TLVKTeXv1Qmc+VgE58cbt272PeWu/gIsEojhbqh3O65fwv2rnofdQcsJad9A
	Mz4WOqKFx4YNdNIuZymqjpomXu+Tndg=
Date: Tue, 21 Jul 2026 17:46:40 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: stmmac: Simplify ioctl handling
To: Richard Cochran <richardcochran@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew@lunn.ch>
References: <20260718143848.677531-1-maxime.chevallier@bootlin.com>
 <ae82997f-537e-4a2d-abce-d163fcf9d868@lunn.ch>
 <6ac12388-60de-45aa-a8d0-62fcfaf7bea2@linux.dev>
 <1e640dcb-43ce-4a3b-a74a-ed8e48706b86@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <1e640dcb-43ce-4a3b-a74a-ed8e48706b86@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_094735_086372_6B9A4580 
X-CRM114-Status: GOOD (  20.83  )
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

On 20/07/2026 19:12, Andrew Lunn wrote:
> On Mon, Jul 20, 2026 at 04:17:32PM +0100, Vadim Fedorenko wrote:
>> On 19.07.2026 17:13, Andrew Lunn wrote:
>>>> Looking at this, I'm wondering if we can't just get rid of SIOCSHWTSTAMP
>>>> handling in phy_mii_ioctl(). Looks like we can ?
>>>
>>> I'm not sure about that. We need Richards input.
>>>
>>> The code in phy_mii_ioctl() allows the MAC to be bypassed, it goes
>>> straight to a PHY based stamper. It could be the MAC has no idea the
>>> PHY has this capability, so it has not implemented the .ndo?
>>>
>>> It might be we need to hoist the code from phy_mii_ioctl() into
>>> dev_{sg}et_hwtstamp()?
>>
>> Hi Andrew!
>>
>> I think I've converted all phy drivers while removing support for
>> SIOCSHWTSTAMP/SIOCGHWTSTAMP from netdev ioctl. I believe it's impossible right
>> now to reach SIOCSHWTSTAMP path of phy_mii_ioctl via ioctl on net device.
> 
> Lets look at this, using a random example:
> 
> drivers/net/ethernet/marvell/mv643xx_eth.c
> 
> mv643xx_eth_netdev_ops has nothing about time stamping. However it
> does have a mv643xx_eth_ioctl. Which calls phy_mii_ioctl().
> 
> Lets say this Marvell MAC driver was paired with a
> nxp-c45-tja11xx. nxp_c45_probe() does:
> 
>                  priv->mii_ts.rxtstamp = nxp_c45_rxtstamp;
>                  priv->mii_ts.txtstamp = nxp_c45_txtstamp;
>                  priv->mii_ts.hwtstamp_set = nxp_c45_hwtstamp_set;
>                  priv->mii_ts.hwtstamp_get = nxp_c45_hwtstamp_get;
>                  priv->mii_ts.ts_info = nxp_c45_ts_info;
>                  phydev->mii_ts = &priv->mii_ts;
> 
> So it looks like in phy_mii_ioctl(), the conditions:
> 
>         case SIOCSHWTSTAMP:
>                  if (phydev->mii_ts && phydev->mii_ts->hwtstamp_set) {
> 
> are fulfilled, and
> 
>                          ret = phydev->mii_ts->hwtstamp_set(phydev->mii_ts,
>                                                             &kernel_cfg,
>                                                             &extack);
> 
> will happen.
> 
> Now, this combination of MAC and PHY is very unlikely but it proves
> the point. As far as i remember, Richard added this code for the
> dp83640 PHY device, but i don't remember what MAC driver it was paired
> with. He wanted to make PHY support just work without the MAC driver
> even caring.

Richard,

is it still a case? do you have a HW to test patches that I'm going to
write to restore the functionality?


