Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E68BC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 19:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYe49kOMn0vSPqjYDLCxciDWRAv8kzL3j3Sod1atpTY=; b=dmh1R2lZhP4s/9Bz78un0u4TQ/
	EYAEKsURbjpK6gggL5/zJ3+0UxCjoZ/iqgw4hQFKEX+iAXPhel8BkAwpvfziA28H6y8BXrKZlOigG
	B5a68H1WjOc63ai/2gRTXu+qyGD3NqKg7RxcjwpFyvCXWS9tvULlcy2yljRN/66Db+WlBt4yHf51I
	n+D03djWpgOqiZBKwEELojPfAY1FJVwrMiYhYceCio31MKz42K0ei0xT/K1rF1UjttTFPHyW3Z8qn
	Haev381PVwAQJd0/H09yiELgoLbAxDsW8nOe9r0bANhsehWCrm0AG0t0XFFp3hAC1sdpKevCxcvc5
	AJ9S73nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAYDk-0000000FlUP-3zGn;
	Sat, 26 Sep 2026 19:38:04 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAYDi-0000000FlU3-0zNN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 19:38:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CC9584E41080;
	Sat, 26 Sep 2026 19:37:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F51860749;
	Sat, 26 Sep 2026 19:37:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4A73102F1E4C;
	Sat, 26 Sep 2026 21:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790451477; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LYe49kOMn0vSPqjYDLCxciDWRAv8kzL3j3Sod1atpTY=;
	b=R62xE1mTaQxatCb33DR/HwgfJGSTvghkJi850RfagXCdxe6q46ez5v2SX72SXW4yBSE4l9
	rS1AGxMot7mXdZ6ZiC0HGfcyLmdjqBYB3gCnBNj7XTrhmmwpAuwTZQhhX2VYlEVCWSP6fy
	bSXQ0pHL2S2TtsU/oEmWEJ3N4CLe2YTORmjsGbJzfMZ53ie3vSfXpObeIcWob32y/adB02
	+JDblpk8pw4wnFDkKML0eBbTOnVHhCSE4H1QcuKH/ZZX1myiGgTIq7Ve091r2xE0AUOqn6
	xoVQjWJs5rEmiBEJJIWA8uQO9/v3DZIMxlEq4A4N0rFlfGssXUgN2HTbsD0QkA==
Message-ID: <3bcac28b-71ce-4c08-97a2-4cd59ab76c8c@bootlin.com>
Date: Sat, 26 Sep 2026 21:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: Don't set or get RSS parameters when not
 supported
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260926093343.292181-1-maxime.chevallier@bootlin.com>
 <250ecb58e80b191865bcf03f7146f7c2@tipi-net.de>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <250ecb58e80b191865bcf03f7146f7c2@tipi-net.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_123802_441766_ECFCEFCF 
X-CRM114-Status: GOOD (  19.34  )
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

Hi Nicolai,

On 9/26/26 20:41, Nicolai Buchwitz wrote:
> Hi Maxime
> 
> On 26.9.2026 11:33, Maxime Chevallier wrote:
>> The RSS kselftests fail on stmmac, and this is partly due to the driver
>> reporting bogus data for the RSS ops :
>>
>>  - ethtool -x reports an indirection table and a key while the hardware
>>    doesn't have any of that
>>  - ethtool -X fails with -EINVAL.
>>
>> Let's return early in the rss ops if we know the hardware and platform
>> don't support RSS.
>>
>> Note that RSS is currently not supported on any devices upstream, so
>> code that was already useless is now effectively dead. It has been the
>> case since 2019 when the code was added, as platforms need to set rss_en
>> in their plat data, and no glue ever did that.
>>
>> Russell King ran a poll in february 2026 [1] asking if the code should
>> be dropped, without any reply going in either direction.
>>
>> Jitendra Vegiraju from Broadcom sent 9 iterations of a Broadcom PCIe glue
>> driver [2] that actually sets rss_en = 1, so there's some hope that this
>> may be used in the future.
>>
>> [1] : https://lore.kernel.org/netdev/aYd4BkAeNW6d0iIC@shell.armlinux.org.uk/
>> [2] : https://lore.kernel.org/netdev/20260402213629.1996133-1-jitendra.vegiraju@broadcom.com/
>>
>> Fixes: 76067459c686 ("net: stmmac: Implement RSS and enable it in XGMAC core")
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> ---
>> Jitendra, do you have plans to continue iterating on the BCM8958x glue ?
>>
>> Thanks,
>>
>> Maxime
>>
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
>> index 1be5310ca766..4e917a448271 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
>> @@ -927,6 +927,9 @@ static u32 stmmac_get_rxfh_key_size(struct net_device *dev)
>>  {
>>      struct stmmac_priv *priv = netdev_priv(dev);
>>
>> +    if (!priv->dma_cap.rssen || !priv->plat->rss_en)
> 
> Should this pattern become a helper? Counting 6 instances so far.

yeah why not :)

> 
>> +        return 0;
>> +
>>      return sizeof(priv->rss.key);
>>  }
>>
>> @@ -934,6 +937,9 @@ static u32 stmmac_get_rxfh_indir_size(struct net_device *dev)
>>  {
>>      struct stmmac_priv *priv = netdev_priv(dev);
>>
>> +    if (!priv->dma_cap.rssen || !priv->plat->rss_en)
>> +        return 0;
>> +
>>      return ARRAY_SIZE(priv->rss.table);
>>  }
>>
>> @@ -943,6 +949,9 @@ static int stmmac_get_rxfh(struct net_device *dev,
>>      struct stmmac_priv *priv = netdev_priv(dev);
>>      int i;
>>
>> +    if (!priv->dma_cap.rssen || !priv->plat->rss_en)
>> +        return -EOPNOTSUPP;
> 
> Not a blocker, but a full netlink RSS dump (like the one in rss_ctx.py)
> now stops at this device. Naybe rss_dump_one_dev() should skip -EOPNOTSUPP
> like ethnl_default_dumpit() does?
there are other drivers that report -EOPNOTSUPP, we could have that as
a separate patch yeah

Thanks for looking at this,

Maxime


