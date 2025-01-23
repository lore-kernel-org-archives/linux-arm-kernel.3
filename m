Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198BEC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 05:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmbMqXwFzAjiG5sXzUB2nZD8nrVVqtUYwY1dhYPsHpo=; b=DK/BbvcJC9VLdoHlzlcHl76xMZ
	VrJw3tLgMYYKUkGViFROa+9okOHv7xt2ivDAIfNRLTXBFkrA18f6/3ats4nM5d3HWp5Lzt7AnBayo
	pgo3A9RebAjlhi364rCTQO3az+62QoYdnoVVMfm8v4Ts0UvMFKzSIcheNASpb+UAXnOLyCroQfwLn
	6SVQ/FoOVdHTj3Udo6CR+EouMz5eWuHF7NDNVCi86Nxa8zup1HEoyfMqoE+DQrJfMnNKSukAXUnW3
	nsVPc8CS3snjV5yLEZyg4IkkPpqwhAHknqcLYM5Rd/Rn0Htux57PPLb6vh8JUorpl2gX5jQv/x5fH
	/3bHz5Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tapjl-0000000Bjdy-40cW;
	Thu, 23 Jan 2025 05:26:41 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tapiS-0000000BjTK-44eD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 05:25:22 +0000
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 23 Jan 2025 14:25:20 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 43D572006E93;
	Thu, 23 Jan 2025 14:25:20 +0900 (JST)
Received: from iyokan2.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Thu, 23 Jan 2025 14:25:20 +0900
Received: from [10.212.246.222] (unknown [10.212.246.222])
	by iyokan2.css.socionext.com (Postfix) with ESMTP id 89253AB183;
	Thu, 23 Jan 2025 14:25:19 +0900 (JST)
Message-ID: <c2aa354d-1bd5-4fb0-a8b8-48fcce3c1628@socionext.com>
Date: Thu, 23 Jan 2025 14:25:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/3] net: stmmac: Limit FIFO size by hardware
 capability
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Yanteng Si <si.yanteng@linux.dev>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>,
 Vince Bridgers <vbridger@opensource.altera.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250121044138.2883912-1-hayashi.kunihiko@socionext.com>
 <20250121044138.2883912-3-hayashi.kunihiko@socionext.com>
 <07f2f6d0-e025-4b21-ac41-caaf71bb6fff@linux.dev>
 <Z4_ZilVFKacuAUE8@shell.armlinux.org.uk>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <Z4_ZilVFKacuAUE8@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_212521_120968_338C165C 
X-CRM114-Status: GOOD (  28.57  )
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

On 2025/01/22 2:29, Russell King (Oracle) wrote:
> On Wed, Jan 22, 2025 at 01:14:25AM +0800, Yanteng Si wrote:
>> 在 1/21/25 12:41, Kunihiko Hayashi 写道:
>>> Tx/Rx FIFO size is specified by the parameter "{tx,rx}-fifo-depth" from
>>> stmmac_platform layer.
>>>
>>> However, these values are constrained by upper limits determined by the
>>> capabilities of each hardware feature. There is a risk that the upper
>>> bits will be truncated due to the calculation, so it's appropriate to
>>> limit them to the upper limit values and display a warning message.
>>>
>>> Fixes: e7877f52fd4a ("stmmac: Read tx-fifo-depth and rx-fifo-depth from
>>> the devicetree")
>>> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>>> ---
>>>    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
>>>    1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> index 251a8c15637f..da3316e3e93b 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> @@ -7245,6 +7245,19 @@ static int stmmac_hw_init(struct stmmac_priv
>>> *priv)
>>>    		priv->plat->tx_queues_to_use = priv->dma_cap.number_tx_queues;
>>>    	}
>>
>>> +	if (priv->plat->rx_fifo_size > priv->dma_cap.rx_fifo_size) {
>>
>>> +		dev_warn(priv->device,
>>> +			 "Rx FIFO size exceeds dma capability (%d)\n",
>>> +			 priv->plat->rx_fifo_size);
>>> +		priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
>> I executed grep and found that only dwmac4 and dwxgmac2 have initialized
>> dma_cap.rx_fifo_size. Can this code still work properly on hardware other
>> than these two?
> 
> Looking at drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:
> 
>          /* Compute minimum number of packets to make FIFO full */
>          pkt_count = priv->plat->rx_fifo_size;
>          if (!pkt_count)
>                  pkt_count = priv->dma_cap.rx_fifo_size;
> 
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:
> 
>          int rxfifosz = priv->plat->rx_fifo_size;
>          int txfifosz = priv->plat->tx_fifo_size;
> 
>          if (rxfifosz == 0)
>                  rxfifosz = priv->dma_cap.rx_fifo_size;
>          if (txfifosz == 0)
>                  txfifosz = priv->dma_cap.tx_fifo_size;
> 
> (in two locations)
> 
> It looks to me like the intention is that priv->plat->rx_fifo_size is
> supposed to _override_ whatever is in priv->dma_cap.rx_fifo_size.
> 
> Now looking at the defintions:
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac4.h:#define GMAC_HW_RXFIFOSIZE
> GENMASK(4, 0)
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h:#define
> XGMAC_HWFEAT_RXFIFOSIZE GENMASK(4, 0)
> 
> So there's a 5-bit bitfield that describes the receive FIFO size for
> these two MACs. Then we have:
> 
> drivers/net/ethernet/stmicro/stmmac/common.h:#define DMA_HW_FEAT_RXFIFOSIZE
> 0x00080000       /* Rx FIFO > 2048 Bytes */
> 
> which is used here:
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c:
> dma_cap->rxfifo_over_2048 = (hw_cap & DMA_HW_FEAT_RXFIFOSIZE) >> 19;
> 
> which is only used to print a Y/N value in a debugfs file, otherwise
> having no bearing on driver behaviour.
> 
> So, I suspect MACs other than xgmac2 or dwmac4 do not have the ability
> to describe the hardware FIFO sizes in hardware, thus why there's the
> override and no checking of what the platform provided - and doing so
> would break the driver. This is my interpretation from the code alone.

Surely, other MACs than xgmac2 and dwmac4 don't have hardware capability
values, and the variables from the capabilities will have zero.
I can add a check whether a capability value is zero or not like that:

If priv->plat->rx-fifo-size is not specified:

     if (priv->dma_cap.rx_fifo_size)
         priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
     else
         return; (with an error value and a message)

If priv->plat->rx-fifo-size is specified:

     if (priv->dma_cap.rx_fifo_size &&
         priv->plat->rx_fifo_size > priv->dma_cap.rx_fifo_size)
         priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;

Same as others.

Thank you,

---
Best Regards
Kunihiko Hayashi

