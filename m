Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E58C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 01:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puNCcAQgnHBQGEW2IyF2W/7TwW8FZJyVJNvbseQ4Bks=; b=3qwJPNsfDk+pQ9dZqo1Jpom06e
	qIx7/isa85EiggNFCzyvS+3mrD5QTjvq12nAkyNC5XdTXrDjUPtLme49sq7nLswGRwiTybsjXo8me
	urWJKQojqZpZEXj7ZQ75xxc2SKQ4XTyTHNGd5niSfrZ/5QMWxe0GRwrkJ01b3PvcnCJVPfFmIdneL
	ySCGfrqeT9sPiQw+UcATP66s+JdCqHO7FWa091E0S9E+XyEG6BZgY02/KAyGG4qf+h4rXR9lV9qpN
	vCE6q+xJlwWXNt6J/5H6trtzNS2gpnm1xWwPkmAr/lDkpB8adGVBQ99Z+7uq59rsDu4ks1YN+Y9KU
	HLEjTX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcDnL-00000001HbV-2xU8;
	Mon, 27 Jan 2025 01:20:07 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcDm1-00000001HWO-0lR4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 01:18:46 +0000
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 27 Jan 2025 10:18:39 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id B7431200C4F1;
	Mon, 27 Jan 2025 10:18:39 +0900 (JST)
Received: from iyokan2.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Mon, 27 Jan 2025 10:18:39 +0900
Received: from [10.212.246.222] (unknown [10.212.246.222])
	by iyokan2.css.socionext.com (Postfix) with ESMTP id 06C8FAB186;
	Mon, 27 Jan 2025 10:18:39 +0900 (JST)
Message-ID: <bc3734ba-e68d-4700-8596-2710f6101f8f@socionext.com>
Date: Mon, 27 Jan 2025 10:18:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 1/3] net: stmmac: Limit the number of MTL queues to
 hardware capability
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yanteng Si <si.yanteng@linux.dev>, Furong Xu <0x1207@gmail.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250124101359.2926906-1-hayashi.kunihiko@socionext.com>
 <20250124101359.2926906-2-hayashi.kunihiko@socionext.com>
 <Z5N8-2XVAFBn1BCY@shell.armlinux.org.uk>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <Z5N8-2XVAFBn1BCY@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_171845_339279_93A9037B 
X-CRM114-Status: GOOD (  21.50  )
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

On 2025/01/24 20:43, Russell King (Oracle) wrote:
> On Fri, Jan 24, 2025 at 07:13:57PM +0900, Kunihiko Hayashi wrote:
>> The number of MTL queues to use is specified by the parameter
>> "snps,{tx,rx}-queues-to-use" from stmmac_platform layer.
>>
>> However, the maximum numbers of queues are constrained by upper limits
>> determined by the capability of each hardware feature. It's appropriate
>> to limit the values not to exceed the upper limit values and display
>> a warning message.
>>
>> This only works if the hardware capability has the upper limit values.
>>
>> Fixes: d976a525c371 ("net: stmmac: multiple queues dt configuration")
>> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 7bf275f127c9..be1e6fa6d557 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -7232,6 +7232,21 @@ static int stmmac_hw_init(struct stmmac_priv
> *priv)
>>   	if (priv->dma_cap.tsoen)
>>   		dev_info(priv->device, "TSO supported\n");
>>   
>> +	if (priv->dma_cap.number_rx_queues &&
>> +	    priv->dma_cap.number_rx_queues < priv->plat->rx_queues_to_use)
> {
> 
> While this looks "nicer", which of these two do you think reads better
> and is easier to understand:
> 
> "If priv->dma_cap.number_rx_queues is set, and
>   priv->dma_cap.number_rx_queues is less than
>   priv->plat->rx_queues_to_use then print a message about
>   priv->plat->rx_queues_to_use exceeding priv->dma_cap.number_rx_queues"
> 
> "If priv->dma_cap.number_rx_queues is set, and
>   priv->plat->rx_queues_to_use is greater than
>   priv->dma_cap.number_rx_queues, then print a message about
>   priv->plat->rx_queues_to_use exceeding priv->dma_cap.number_rx_queues"
> 
> With the former one has to mentally flip the test around in the if
> statement to check that it does indeed match the warning that is
> printed.

This patch focuses only on the conditional lines, however, certainly
it's not good to have the meaning of the message and the condition
reversed.

I'll fix it next.

Thank you,

---
Best Regards
Kunihiko Hayashi

