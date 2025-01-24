Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C027C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 04:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LlyMbzufe1mtUQgB1QuU8irRUSQCL6fmb5VFoDN+rU=; b=UOMYX0D1IDPJhUticWuiP2gpq+
	8gSVWqSSumdzH/uTJAeZPK0V1hsJMaE+hdCCKkweul00+sAnZ9HByMGN9p7dA6pHG5Nn0QKpgQe0/
	uOJ80j6dJQUCMjPRaqPvrky1gexpiUeive4BwlkvJwl19aEc1kv3Yj0YtmJMm5Cnao0wuj06oEwkH
	GOqtD3wlU8BsdhvVaDQlmRH4OBmKQKc9dZ9PedRQirMAWWef4iHJI3fdKvamtGZnTJe0qxXCetvXG
	wQDrCHOpb+3a8nzDrAUqW6goL1W88mejuAprmzQPj/zkVi482SPvIXw/zKEzDU8toJWCu9IXZ1t8D
	6ntQVK5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBC2-0000000DsN2-0wyU;
	Fri, 24 Jan 2025 04:21:18 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBAi-0000000DsGi-1kQE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 04:19:58 +0000
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 24 Jan 2025 13:19:53 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id D7721208E511;
	Fri, 24 Jan 2025 13:19:53 +0900 (JST)
Received: from iyokan2.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Fri, 24 Jan 2025 13:19:53 +0900
Received: from [10.212.246.222] (unknown [10.212.246.222])
	by iyokan2.css.socionext.com (Postfix) with ESMTP id 7A0E0E1E;
	Fri, 24 Jan 2025 13:19:53 +0900 (JST)
Message-ID: <c634eb72-6714-47e8-9270-b4ae99df9edf@socionext.com>
Date: Fri, 24 Jan 2025 13:19:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/3] Limit devicetree parameters to hardware
 capability
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250121044138.2883912-1-hayashi.kunihiko@socionext.com>
 <Z492Mvw-BxLBR1eZ@shell.armlinux.org.uk>
 <ea845c58-ee2a-4660-bc13-7e05003de5d0@socionext.com>
 <Z5Ju0DtNDwj_hO0F@shell.armlinux.org.uk>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <Z5Ju0DtNDwj_hO0F@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_201956_584884_5B8F570F 
X-CRM114-Status: GOOD (  25.03  )
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

Hi Russell,

On 2025/01/24 1:31, Russell King (Oracle) wrote:
> On Thu, Jan 23, 2025 at 02:25:15PM +0900, Kunihiko Hayashi wrote:
>> Hi Russell,
>>
>> Thank you for your comment.
>>
>> On 2025/01/21 19:25, Russell King (Oracle) wrote:
>>> On Tue, Jan 21, 2025 at 01:41:35PM +0900, Kunihiko Hayashi wrote:
>>>> This series includes patches that checks the devicetree properties,
>>>> the number of MTL queues and FIFO size values, and if these
> specified
>>>> values exceed the value contained in the hardware capabilities,
> limit to
>>>> the values from the capabilities.
>>>>
>>>> And this sets hardware capability values if FIFO sizes are not
> specified
>>>> and removes redundant lines.
>>>
>>> I think you also indeed to explain why (and possibly understand) - if
>>> there are hardware capabilities that describe these parameters - it
> has
>>> been necessary to have them in firmware as well.
>>>
>>> There are two scenarios I can think of why these would be duplicated:
>>>
>>> 1. firmware/platform capabilities are there to correct wrong values
>>>      provided by the hardware.
>>> 2. firmware/platform capabilities are there to reduce the parameters
>>>      below hardware maximums.
>>>
>>> Which it is affects whether your patch is correct or not, and thus
> needs
>>> to be mentioned.
>>
>> I think scenario 2 applies in this case.
> 
> In light of my other reply
> (https://lore.kernel.org/r/Z4_ZilVFKacuAUE8@shell.armlinux.org.uk) I
> don't think either of my two above applies, and the driver is designed
> to allow platform code to override the hardware value, or to provide
> the value if there is no hardware value.

I understand. Especially I realized that I had to care about some hardwares
not having these values.

> My suggestion, therefore, would be (e.g.):
> 
> 	if (priv->dma_cap.rx_fifo_size &&
> 	    priv->plat->rx_fifo_size > priv->dma_cap.rx_fifo_size) {
> 		dev_warn(priv->device,
> 			 "Rx FIFO size exceeds dma capability (%d)\n",
> 			 priv->plat->rx_fifo_size);
> 		priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
> 	}
> 
> if we still want to limit it to the hardware provided capability, where
> that is provided.

Thank you for your suggestion. I also came up with the same code in:
https://lore.kernel.org/all/c2aa354d-1bd5-4fb0-aa8b8-48fcce3c1628@socionext.com/#t

I'll reflect this code to the next.

Thank you,

---
Best Regards
Kunihiko Hayashi

