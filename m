Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D782C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 03:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1MobyGLfI/GmuK0n7WO7Oiwrjqt/Y28chaKKbEzA5U=; b=lJtFlu1dBiav8ngGz2yrKwzURI
	0o3VuHbQlQkZ0XAT8k3M1IkGiI7DBb3ViznhhuoC2PVeRXUGC8fCL/my/0zOha5iDLroxBy3iWntH
	UACUpyKs0DPVwVxqDsJ92IBk0SJMKuJpzJwtYfCjv0JH7wNfpcitkIcdbs5pEA16DPYsHCyYOzBk7
	YLzTRFh/5SZmJsXpc9QMqAQoNbH74H1+dePHpwSLa6djnOlb+ccU41k9ATHYnYai+PgjvX/VQvzGx
	fDxLFithFAjSpCULIBYI4ToIRaxDnFiHkauCaFdnSNwpZWaYHpoLjhSNghlvhkF6/yshc44UY6CHV
	lg8smRmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujUwI-0000000EEzv-1sQd;
	Wed, 06 Aug 2025 03:35:42 +0000
Received: from mail-m15586.qiye.163.com ([101.71.155.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujUtf-0000000EElH-44AE;
	Wed, 06 Aug 2025 03:33:01 +0000
Received: from [172.16.12.153] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1e71dd486;
	Wed, 6 Aug 2025 11:32:50 +0800 (GMT+08:00)
Message-ID: <d99c50ed-797b-4086-b1b5-d3df281d3c2a@rock-chips.com>
Date: Wed, 6 Aug 2025 11:32:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ethernet: stmmac: dwmac-rk: Make the clk_phy could
 be used for external phy
To: Andrew Lunn <andrew@lunn.ch>, Chaoyi Chen <kernel@airkyi.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Jonas Karlman <jonas@kwiboo.se>, David Wu <david.wu@rock-chips.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250806011405.115-1-kernel@airkyi.com>
 <3c401e82-169f-4540-9c12-175798ac72a6@lunn.ch>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <3c401e82-169f-4540-9c12-175798ac72a6@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a987d70527103abkunmabbf8f177f0aa3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ00YSVZPT01CTElDHR9MGkpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=hPZq8Ego38BXBeFh0nPLyfRxD634qAt3/p9YeuZs7mlvK3zqz2UF8JDVcd7x7Iu0ISGWD9ysDjHYSPFFWBw1dte+CwZssdF8F7luxfAtg/yPugeeE0IgJXf027Jg2ikOFGz4g0yofKftPXIpJx14vM5GyRvP0o9O3dLUnYsBFH4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=a1MobyGLfI/GmuK0n7WO7Oiwrjqt/Y28chaKKbEzA5U=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_203300_502941_AB6EDA6B 
X-CRM114-Status: GOOD (  22.17  )
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

Hi Andrew,

On 8/6/2025 11:14 AM, Andrew Lunn wrote:
> On Wed, Aug 06, 2025 at 09:14:05AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> For external phy, clk_phy should be optional, and some external phy
>> need the clock input from clk_phy. This patch adds support for setting
>> clk_phy for external phy.
>>
>> Signed-off-by: David Wu <david.wu@rock-chips.com>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Please take a read of:
>
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
>
> net-next is closed at the moment for the merge window.
>
> You also need the indicate the tree in the Subject: line.

Sorry for that, I will send v2 at an appropriate time.


>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>> index 700858ff6f7c..703b4b24f3bc 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>> @@ -1558,6 +1558,7 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
>>   	struct device *dev = &bsp_priv->pdev->dev;
>>   	int phy_iface = bsp_priv->phy_iface;
>>   	int i, j, ret;
>> +	unsigned int rate;
> Reverse Christmas tree. Longest to shortest.

Will fix in v2.


>
>>   
>>   	bsp_priv->clk_enabled = false;
>>   
>> @@ -1595,12 +1596,19 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
>>   		clk_set_rate(bsp_priv->clk_mac, 50000000);
>>   	}
>>   
>> -	if (plat->phy_node && bsp_priv->integrated_phy) {
>> +	if (plat->phy_node) {
>>   		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
>>   		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
>> -		if (ret)
>> -			return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
>> -		clk_set_rate(bsp_priv->clk_phy, 50000000);
>> +		/* If it is not integrated_phy, clk_phy is optional */
>> +		if (bsp_priv->integrated_phy) {
>> +			if (ret)
>> +				return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
>> +
>> +			ret = of_property_read_u32(plat->phy_node, "clock-frequency", &rate);
> Is this property already in the DT binding?

I didn't see explicit binding, but make dtbs_check W=1 didn't generate 
any warning. I will drop this in v2.


>
>
>      Andrew
>
> ---
> pw-bot: cr
>
>

