Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC7ECA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 12:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFFCk3oD5mOkAzLuXB6XLVMdJMHaibq0TJviAsZVl/c=; b=FIVZnMHIBHdp32iiE68s4gxEiG
	P/BMg6FV3q7Gs5oMzeMKlT24BSYSgovEg5uXMCmRceehZnSHBvpwCc5SLIS9fSX3roPrNpNDhUp3k
	qfVYwzC21MZsr+4wq9H2EIUkbdKUWyRM2UYkm2YOaFpUqV2S3Enmbl3ZC5qqZUWbHgoEfl6Fn7nnm
	E+pOb9H9evF91ArldYZJl1dm2Xsz5iqHGg9mpfhg9ZZ2TCfBR7CQDYfOESTgdHPV3BHlZFWMLr4oZ
	MYrjheQg43ww3igXq1ICfqEC0HX+Oml83rAhufVfS2TFHJWVe/4AUO9DAVLEJXprISqYrhwniZp87
	PHTMW8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu98z-0000000BaaL-1bg4;
	Thu, 04 Sep 2025 12:32:49 +0000
Received: from mail-m49201.qiye.163.com ([45.254.49.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7kJ-0000000B4xF-1qbR;
	Thu, 04 Sep 2025 11:03:16 +0000
Received: from [172.16.12.153] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 21b2ed1f3;
	Thu, 4 Sep 2025 19:03:11 +0800 (GMT+08:00)
Message-ID: <b5fbeb3f-9962-444d-85b3-3b8a11f69266@rock-chips.com>
Date: Thu, 4 Sep 2025 19:03:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: dwmac-rk: Ensure clk_phy doesn't contain
 invalid address
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Yao Zi <ziyao@disroot.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Wu <david.wu@rock-chips.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250904031222.40953-3-ziyao@disroot.org>
 <aLlwv3v8ACha8b-3@shell.armlinux.org.uk>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aLlwv3v8ACha8b-3@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a991465108003abkunm0f56a227434cd4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxhDQlZLGR4dShpIS0pDQkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Xit9gLr6c2F67gZWiRJ3knK+6v3aqUFhgRcIQ2qpT3IVYWVLjxjDx+93FZxit8MYIQ2q4QDexxikifP7ohn/GuR6WZl8TXLXN7BsZSF1phcaUvWq4h0bSxKVFlB7oNT+jkw/9A/nyTQILFNQSy4ZP7NbYAiYNyjQ3WrTJxtEWzs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ZFFCk3oD5mOkAzLuXB6XLVMdJMHaibq0TJviAsZVl/c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_040315_648925_1E4AF7DA 
X-CRM114-Status: GOOD (  21.60  )
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


On 9/4/2025 6:58 PM, Russell King (Oracle) wrote:
> On Thu, Sep 04, 2025 at 03:12:24AM +0000, Yao Zi wrote:
>>   	if (plat->phy_node) {
>>   		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
>>   		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
>> -		/* If it is not integrated_phy, clk_phy is optional */
>> +		/*
>> +		 * If it is not integrated_phy, clk_phy is optional. But we must
>> +		 * set bsp_priv->clk_phy to NULL if clk_phy isn't proivded, or
>> +		 * the error code could be wrongly taken as an invalid pointer.
>> +		 */
> I'm concerned by this. This code is getting the first clock from the DT
> description of the PHY. We don't know what type of PHY it is, or what
> the DT description of that PHY might suggest that the first clock would
> be.
>
> However, we're geting it and setting it to 50MHz. What if the clock is
> not what we think it is?

We only set integrated_phy to 50M, which are all known targets. For external PHYs, we do not perform frequency settings.



>
> I'm not sure we should be delving in to some other device's DT
> properties to then get resources that it _uses_ to then effectively
> take control those resources.
>
> I think we need way more detail on what's going on. Commit da114122b83
> merely stated:
>
>      For external phy, clk_phy should be optional, and some external phy
>      need the clock input from clk_phy. This patch adds support for setting
>      clk_phy for external phy.
>
> If the external PHY requires a clock supplied to it, shouldn't the PHY
> driver itself be getting that clock and setting it appropriately?
>

