Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800C6CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 06:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAEkg+oPP2b/JZz9myImwCnXMGQd4xA94/pfnmR4uF0=; b=j+171oqpMlEgWsAtnrBzfj6Sp4
	ydVFw1q+DFwUw4lTe0AcgJ9NSyOyPNIJKk7wrWjx9JPdh2xGNU/GqrnDhJZPM33pnfJ+DVHhwD7dV
	uL1eE0t3l0rnk/sPRurnmlVMr+lC3N07nINUDHpK96WCby8JoogJqz4AkpOOcubZFCY+bPH8qh5Ke
	TKCLpmwBx9p9zip4WPCpT6koKHQUojYWpssHlkWsXmUCh8A913xQpi1NqDI5mj+Y33p7ou6zoJBF4
	0gqVSVgNLgmYdpyTlAZey8Vjt1wJ6EVzAEtTtD/LifMDN9h3BrRHWxZ7EDrcfhVgZhyjp+0/f8+4n
	EQue13zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uumQb-000000071CQ-31M0;
	Sat, 06 Sep 2025 06:29:37 +0000
Received: from mail-m155116.qiye.163.com ([101.71.155.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uumNl-0000000710i-1GDt;
	Sat, 06 Sep 2025 06:26:43 +0000
Received: from [172.16.12.153] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 21e46c877;
	Sat, 6 Sep 2025 14:26:31 +0800 (GMT+08:00)
Message-ID: <5d691f5b-460e-46cb-9658-9c391058342f@rock-chips.com>
Date: Sat, 6 Sep 2025 14:26:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: dwmac-rk: Ensure clk_phy doesn't contain
 invalid address
To: Yao Zi <ziyao@disroot.org>, "Russell King (Oracle)"
 <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Wu <david.wu@rock-chips.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250904031222.40953-3-ziyao@disroot.org>
 <aLlwv3v8ACha8b-3@shell.armlinux.org.uk>
 <b5fbeb3f-9962-444d-85b3-3b8a11f69266@rock-chips.com>
 <aLlyb6WvoBiBfUx3@shell.armlinux.org.uk>
 <aLly7lJ05xQjqCWn@shell.armlinux.org.uk> <aLvIbPfWWNa6TwNv@pie>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aLvIbPfWWNa6TwNv@pie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a991db47afa03abkunm6f5b97526997b6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRlJTVZKTxpPTU4fTB1JQ05WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=XeollWZr90ZLf9L7AdJ3LQbsRm2o9/RlO6fnKUc1fCiUZVidPuq4AywnynalP0/pupRK5Fn/V141DZqMKg6Or8cwAa9y0ysjWi/3FI7BGU/AW4bcdOEc5Y30uM5F1jnwWVDYZe3IbI/KYC9P81XZ7KUdvA0qDfkfDWwVrYpGR48=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=iAEkg+oPP2b/JZz9myImwCnXMGQd4xA94/pfnmR4uF0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_232641_834171_80550680 
X-CRM114-Status: GOOD (  15.90  )
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

On 9/6/2025 1:36 PM, Yao Zi wrote:

> On Thu, Sep 04, 2025 at 12:07:26PM +0100, Russell King (Oracle) wrote:
>> On Thu, Sep 04, 2025 at 12:05:19PM +0100, Russell King (Oracle) wrote:
>>> On Thu, Sep 04, 2025 at 07:03:10PM +0800, Chaoyi Chen wrote:
>>>> On 9/4/2025 6:58 PM, Russell King (Oracle) wrote:
>>>>> On Thu, Sep 04, 2025 at 03:12:24AM +0000, Yao Zi wrote:
>>>>>>    	if (plat->phy_node) {
>>>>>>    		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
>>>>>>    		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
>>>>>> -		/* If it is not integrated_phy, clk_phy is optional */
>>>>>> +		/*
>>>>>> +		 * If it is not integrated_phy, clk_phy is optional. But we must
>>>>>> +		 * set bsp_priv->clk_phy to NULL if clk_phy isn't proivded, or
>>>>>> +		 * the error code could be wrongly taken as an invalid pointer.
>>>>>> +		 */
>>>>> I'm concerned by this. This code is getting the first clock from the DT
>>>>> description of the PHY. We don't know what type of PHY it is, or what
>>>>> the DT description of that PHY might suggest that the first clock would
>>>>> be.
>>>>>
>>>>> However, we're geting it and setting it to 50MHz. What if the clock is
>>>>> not what we think it is?
>>>> We only set integrated_phy to 50M, which are all known targets. For external PHYs, we do not perform frequency settings.
>>> Same question concerning enabling and disabling another device's clock
>>> that the other device should be handling.
>> Let me be absolutely clear: I consider *everything* that is going on
>> with clk_phy here to be a dirty hack.
>>
>> Resources used by a device that has its own driver should be managed
>> by _that_ driver alone, not by some other random driver.
> Agree on this. Should we drop the patch, or fix it up for now to at
> least prevent the oops? Chaoyi, I guess there's no user of the feature
> for now, is it?

This at least needs fixing. Sorry, I have no idea how to implement this in the PHY.


