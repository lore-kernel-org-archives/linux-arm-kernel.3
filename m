Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21B3C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 10:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o33oLnMielbFrEtDRyMZaAuvjdFFETaeX/NS9ZkliSI=; b=fYFd0+aWVl+ZRY2EKalrUi6RrF
	QhdaGEDiJYpU/ejeh78CyqPhmHO2VZK0lTblf1qNtxC5VtNUK/KatQCW8cKnj67ntbZMfXaaHVBjh
	J6IPy9yRkR5bMY83GX4VpUo/MtRKFgBlVlnIOvtzS/aHZ2p7azPZICbmBprQAyUg5dZUip3GXxWio
	QVhIEUaEKvnsfQCZwfs06Wo5AWVuriLOHVXtW+CrpHktuzuend+iKjE8m+hO93VrvatmS4R1Zvm3T
	pqC7DfC1+wACXK3kCoq5RT5PwKc7BsUIaCAYVxc6HtbocC66XSAINEbRqJQEmjrJLYiUhy1G+7sEH
	TBX/GXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMk0-0000000ERol-2VQA;
	Thu, 16 Jan 2025 10:04:44 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMhW-0000000ERNS-2Q1q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 10:02:11 +0000
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 16 Jan 2025 19:02:09 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id DC6F22006E93;
	Thu, 16 Jan 2025 19:02:09 +0900 (JST)
Received: from iyokan2.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Thu, 16 Jan 2025 19:02:09 +0900
Received: from [10.212.247.91] (unknown [10.212.247.91])
	by iyokan2.css.socionext.com (Postfix) with ESMTP id E56A21A8;
	Thu, 16 Jan 2025 19:02:08 +0900 (JST)
Message-ID: <2d88c997-f417-4fd0-a871-a9af4a28213e@socionext.com>
Date: Thu, 16 Jan 2025 19:02:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] net: stmmac: Limit the number of MTL queues to
 maximum value
To: Furong Xu <0x1207@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250116020853.2835521-1-hayashi.kunihiko@socionext.com>
 <20250116020853.2835521-2-hayashi.kunihiko@socionext.com>
 <20250116112814.00005bef@gmail.com>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20250116112814.00005bef@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_020210_729618_45CE3FAD 
X-CRM114-Status: GOOD (  21.85  )
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

Hi Furong,

Thank you for your comment.

On 2025/01/16 12:28, Furong Xu wrote:
> On Thu, 16 Jan 2025 11:08:53 +0900, Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
> 
>> The number of MTL queues to use is specified by the parameter
>> "snps,{tx,rx}-queues-to-use" from the platform layer.
>>
>> However, the maximum number of queues is determined by
>> the macro MTL_MAX_{TX,RX}_QUEUES. It's appropriate to limit the
>> values not to exceed the upper limit values.
>>
> 
> The Fixes: tag is required too.

I see. I'll find it.

>> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> index ad868e8d195d..471eb1a99d90 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> @@ -165,6 +165,8 @@ static int stmmac_mtl_setup(struct platform_device
> *pdev,
>>   	if (of_property_read_u32(rx_node, "snps,rx-queues-to-use",
>>   				 &plat->rx_queues_to_use))
>>   		plat->rx_queues_to_use = 1;
>> +	if (plat->rx_queues_to_use > MTL_MAX_RX_QUEUES)
>> +		plat->rx_queues_to_use = MTL_MAX_RX_QUEUES;
> 
> MTL_MAX_RX_QUEUES, MTL_MAX_TX_QUEUES and STMMAC_CH_MAX are defined to 8,
> this is correct for gmac4, but xgmac has 16 channels at most.

Yes, but these macros are used as the number of elements in some arrays.
(used in common.h and stmmac.h)

We can change these value to the maximum (16), though, the size of some
structures will increase so be careful.

> Drop these legacy defines and always use
> priv->dma_cap.number_rx_queues,
> priv->dma_cap.number_tx_queues,
> priv->dma_cap.number_tx_channel,
> priv->dma_cap.number_rx_channel,
> seems like a good option.

These values can be obtained in stmmac_dvr_probe() and this patch checks
the queue sizes before stmmac_dvr_probe(). I think we need to change the
way how to check them.

And when checking only with dma_cap values, the number of elements in 
the arrays might be exceeded.  It is necessary to take care of both the
arrays and the capabilities.

Thank you,

---
Best Regards
Kunihiko Hayashi

