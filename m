Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321D1C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 06:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tV6O8u5baPyDAN2++gVv3AGZDh47+5YWRmz1Uxg1Dk=; b=sSgUF9CUpY9unZqq+SMOoCGy6+
	oVNSZ+S0sRPIFXRcV36vg88bYv5H/G3aCuVPTO/x1nK708/FUZTucAMSDVWbZgb6HXzGibotnwXnZ
	VDAYGLJ7nvqoepxHMB6PXomGbgXvEDCzeqvfpziPE0PihW2rF4cqF3eUdO9P8INrLAN/xet4g0MsP
	wjmbknIoWEGezv41rd2w4Pr7PmRWvHneH1eUXfJQg4Bn4+RX2U8KxlDHsIbyqfkShV/yy3oJO0Uxn
	3wP1fY4yYLfOUr2Ea3E+01g1CdZ/ks5xyuyYlSUdQzw0MSeoUdOHnQWTMKNGCsXVuRKqXKdAp7Paq
	7g13p1Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jR6-00000008VuZ-0RjZ;
	Wed, 16 Sep 2026 06:48:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jR4-00000008Vtu-0jRj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 06:48:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BACC5152B;
	Tue, 15 Sep 2026 23:47:52 -0700 (PDT)
Received: from [172.18.224.124] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 195A63F86F;
	Tue, 15 Sep 2026 23:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789541276; bh=/NuyNdwGAP6B87EGLnfIuEHCUMBTUh8tcjbfbMaSbHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GEp3tSpa8XB8QxBd0oa+aNvXs9Wjp9F5h+mc45cc2tPJ/TQ4PzMB72kjHbIaDBAKT
	 u7WRTBkobBSO/RWXjbM3yh1a6bBVxuCM7aJFUZiL2zN9ic950zfUYQHttfNJ67o1Kl
	 EGgI+2sQatABtrP70AjVtaa89ouzZzY6As3vlon0=
Message-ID: <ad2ca583-1562-4d31-8601-fef6da88f694@arm.com>
Date: Wed, 16 Sep 2026 08:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/4] net: stmmac: dwmac-sun8i: Add Allwinner H616
 EMAC clock index and internal PHY support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Alastair D'Silva <alastair@d-silva.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, James Hilliard <james.hilliard1@gmail.com>,
 richard.genoud@bootlin.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
References: <20260916044119.475666-1-alastair@d-silva.org>
 <20260916044119.475666-5-alastair@d-silva.org>
 <579d7650-583e-49bd-aa51-02fc52940ea1@bootlin.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <579d7650-583e-49bd-aa51-02fc52940ea1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_234802_321710_03DBD420 
X-CRM114-Status: GOOD (  23.72  )
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

Hi,

On 9/16/26 08:24, Maxime Chevallier wrote:
> Hi,
> 
> On 9/16/26 06:41, Alastair D'Silva wrote:
>> Support EMAC1 and the internal Fast Ethernet PHY (AC300) on Allwinner
>> H616 and H618 SoCs:
>> - Allow reading a register index from the syscon property to offset the
>>    regmap field for EMAC1's dedicated clock control register.
>> - Add emac_variant_h616_internal with support for internal PHY, MII,
>>    RMII, and RGMII modes.
>> - Delay the MAC software reset until sun8i_dwmac_init() when using the
>>    internal PHY, ensuring the PHY has powered on and begun generating
>>    the receive clock before the MAC attempts to reset.
>> - Skip setting H3_EPHY_SELECT for H616 internal EMAC, which does not
>>    use the H3-style EPHY select bit.
>> - Handle -EPROBE_DEFER cleanly during clock and reset control acquisition
>>    in get_ephy_nodes().
>>
>> Assisted-by: LLM
>> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
>> ---
> 
> Even if this is a duplicate some of the work done by James Hilliard, this
> raises interesting points.

I think the point is that this patch is just wrong, in many parts ;-)
I think much of the code stems from the original Allwinner BSP code, 
which is just, say, misinformed in many respects. The use of compatible 
strings, and shoehorning the PHY clock into the MAC code are just 
examples. More below.

>> Notes:
>>      Tested on Mellow Fly-C5 (Allwinner H618) under Armbian, verifying stable
>>      EMAC1 probe, deferred soft reset with the internal AC300 EPHY, and 100M full
>>      duplex operation under load.
>>
>>   .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 65 ++++++++++++++++---
>>   1 file changed, 55 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> index 48c52eb96233..1728893589a6 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> @@ -130,6 +130,16 @@ static const struct emac_variant emac_variant_a64 = {
>>   	.tx_delay_max = 7,
>>   };
>>   
>> +static const struct emac_variant emac_variant_h616_internal = {
>> +	.syscon_field = &sun8i_syscon_reg_field,
>> +	.soc_has_internal_phy = true,

For instance this cannot be true. internal_phy refers to the H3 
generation, which works quite differently. We had this issue already 
with the H6, and there is a comment there mentioning this.

And this becomes obvious in other parts of the code, where this patch 
reverts the has_internal_phy tests, because they don't apply here.

>> +	.support_mii = true,
>> +	.support_rmii = true,
>> +	.support_rgmii = true,


>> +	.rx_delay_max = 31,
>> +	.tx_delay_max = 7,
>> +};
> James's series [1] says this SoC only supports RMII (yet includes RGMII timing
> control), and here for seemingly the same device, there's MII and RGMII
> support listed.
> 
> [1] : https://lore.kernel.org/r/20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com
> 
> Maybe you can coordinate with one another, can we connect that SoC to a non-internal PHY ?
> If so, can we use MII, RMII and RGMII ? or is it just RMII ?

This MAC is *only* connected to the AC200/AC300 PHY, which is a separate 
die, but co-packaged into the SoC. So that's set in stone. And while the 
MAC IP might support more MII modes (because it's maybe the same IP as 
the primary MAC? We don't know), it is irrelevant here, since only RMII 
is usable.

Cheers,
Andre

> 
> Maxime


