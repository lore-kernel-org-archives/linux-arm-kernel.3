Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20F2C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysnX75Tn/EjCtvlKfH+8JyVTdQnIBC9jdgJfrr5Y8hM=; b=NuXh3pMAmbsX6WsJExhJ3VFzkz
	uvDlUufT0wIhUPEIlcp+9nH3irFnLfJp6H5i7cZqAxS2SY7hvw24Sw2Y6y5cEbzNRdjy5vUG3zTkq
	jlklxMKvxPkZx1PeBLaMNzObEVUdV/2wKnP5BpfHYWRuLL2IhmJ0Km0ThKjGo8iVoZuEmEPVehiI7
	xnqBZXqJ4pXaSuIq74NMO+RrDoHzFb6TeGVH+mSh2vv55jccqA0F9Te/UN+BBfW1SdB9VAp0idSCj
	7zBfrGpuW/5VFgpCTIIoMHrO+BxJ0RlhCLYp/T7GZThTfDs/MJzM41022aWNq4cSIcxYW+mOvmsVi
	/ZZFePZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tev6d-0000000FIts-2Ly4;
	Mon, 03 Feb 2025 11:59:11 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tev3R-0000000FIEy-1usM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:55:54 +0000
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 03 Feb 2025 20:55:52 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 475BF208E5DC;
	Mon,  3 Feb 2025 20:55:52 +0900 (JST)
Received: from iyokan2.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Mon, 3 Feb 2025 20:55:52 +0900
Received: from [10.212.246.222] (unknown [10.212.246.222])
	by iyokan2.css.socionext.com (Postfix) with ESMTP id 672281A9;
	Mon,  3 Feb 2025 20:55:51 +0900 (JST)
Message-ID: <2b22ecba-93b8-479c-ab16-42cf24cf2c06@socionext.com>
Date: Mon, 3 Feb 2025 20:55:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 3/3] net: stmmac: Specify hardware capability value
 when FIFO size isn't specified
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yanteng Si <si.yanteng@linux.dev>, Furong Xu <0x1207@gmail.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
 <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
 <4e98f967-f636-46fb-9eca-d383b9495b86@roeck-us.net>
 <Z56FmH968FUGkC5J@shell.armlinux.org.uk>
 <905127b5-96c8-4866-8f69-d9d8a7091c99@socionext.com>
 <Z6CLDJJ21MMml3cD@shell.armlinux.org.uk>
 <e1654cc9-a696-454c-a9c7-80a8e1a148ff@socionext.com>
Content-Language: en-US
In-Reply-To: <e1654cc9-a696-454c-a9c7-80a8e1a148ff@socionext.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_035553_614517_FC8A0C5A 
X-CRM114-Status: GOOD (  32.24  )
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

On 2025/02/03 20:32, Kunihiko Hayashi wrote:
> Hi,
> 
> On 2025/02/03 18:23, Russell King (Oracle) wrote:
>> On Mon, Feb 03, 2025 at 11:45:05AM +0900, Kunihiko Hayashi wrote:
>>> Hi all,
>>>
>>> On 2025/02/02 5:35, Russell King (Oracle) wrote:
>>>> On Sat, Feb 01, 2025 at 11:14:41AM -0800, Guenter Roeck wrote:
>>>>> Hi,
>>>>>
>>>>> On Mon, Jan 27, 2025 at 10:38:20AM +0900, Kunihiko Hayashi wrote:
>>>>>> When Tx/Rx FIFO size is not specified in advance, the driver
>> checks if
>>>>>> the value is zero and sets the hardware capability value in
>> functions
>>>>>> where that value is used.
>>>>>>
>>>>>> Consolidate the check and settings into function stmmac_hw_init()
>> and
>>>>>> remove redundant other statements.
>>>>>>
>>>>>> If FIFO size is zero and the hardware capability also doesn't have
>>>> upper
>>>>>> limit values, return with an error message.
>>>>>>
>>>>>> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>>>>>
>>>>> This patch breaks qemu's stmmac emulation, for example for
>>>>> npcm750-evb. The error message is:
>>>>> 	stmmaceth f0804000.eth: Can't specify Rx FIFO size
>>>
>>> Sorry for inconvenience.
>>>
>>>> Interesting. I looked at QEMU to see whether anything in the Debian
>>>> stable version of QEMU might possibly have STMMAC emulation, but
>>>> drew a blank... Even trying to find where in QEMU it emulates the
>>>> STMMAC. I do see that it does include this, so maybe I can use that
>>>> to test some of my stmmac changes. Thanks!
>>>>
>>>>> The setup function called for the emulated hardware is
>>>> dwmac1000_setup().
>>>>> That function does not set the DMA rx or tx fifo size.
>>>>>
>>>>> At the same time, the rx and tx fifo size is not provided in the
>>>>> devicetree file (nuvoton-npcm750.dtsi), so the failure is obvious.
>>>>>
>>>>> I understand that the real hardware may be based on a more recent
>>>>> version of the DWMAC IP which provides the DMA tx/rx fifo size, but
>>>>> I do wonder: Are the benefits of this patch so substantial that it
>>>>> warrants breaking the qemu emulation of this network interface >
>>>> Please see my message sent a while back on an earlier revision of this
>>>> patch series. I reviewed the stmmac driver for the fifo sizes and
>>>> documented what I found.
>>>>
>>>> https://lore.kernel.org/r/Z4_ZilVFKacuAUE8@shell.armlinux.org.uk
>>>>
>>>> To save clicking on the link, I'll reproduce the relevant part below.
>>>> It appears that dwmac1000 has no way to specify the FIFO size, and
>>>> thus would have priv->dma_cap.rx_fifo_size and
>>>> priv->dma_cap.tx_fifo_size set to zero.
>>>>
>>>> Given the responses, I'm now of the opinion that the patch series is
>>>> wrong, and probably should be reverted - I never really understood
>>>> the motivation why the series was necessary. It seemed to me to be a
>>>> "wouldn't it be nice if" series rather than something that is
>>>> functionally necessary.
>>>>
>>>>
>>>> Here's the extract from my previous email:
>>>>
>>>> Now looking at the defintions:
>>>>
>>>> drivers/net/ethernet/stmicro/stmmac/dwmac4.h:#define
>> GMAC_HW_RXFIFOSIZE
>>>> GENMASK(4, 0)
>>>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h:#define
>>>> XGMAC_HWFEAT_RXFIFOSIZE GENMASK(4, 0)
>>>>
>>>> So there's a 5-bit bitfield that describes the receive FIFO size for
>>>> these two MACs. Then we have:
>>>>
>>>> drivers/net/ethernet/stmicro/stmmac/common.h:#define
>>>> DMA_HW_FEAT_RXFIFOSIZE    0x00080000       /* Rx FIFO > 2048 Bytes */
>>>>
>>>> which is used here:
>>>>
>>>> drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c:
>>>> dma_cap->rxfifo_over_2048 = (hw_cap & DMA_HW_FEAT_RXFIFOSIZE) >> 19;
>>>>
>>>> which is only used to print a Y/N value in a debugfs file, otherwise
>>>> having no bearing on driver behaviour.
>>>>
>>>> So, I suspect MACs other than xgmac2 or dwmac4 do not have the ability
>>>> to describe the hardware FIFO sizes in hardware, thus why there's the
>>>> override and no checking of what the platform provided - and doing so
>>>> would break the driver. This is my interpretation from the code alone.
>>>>
>>>
>>> The {tx,rx}_queus_to_use are referenced in stmmac_ethtool.c,
>> stmmac_tc.c,
>>> and stmmac_selftests.c as the number of queues, so I've thought that
>>> these variables should not be non-zero.
>>
>> Huh? We're talking about {tx,rx}_fifo_size, not _queues_to_use.
> 
> Sorry, this topic is just about {tx,rx}_fifo_size.
> Above comments are not needed here.
> 
> These value are only referenced in stmmac_main.c and stmmac_selftest.c.
> As far as I can see, there is no usage that requires the values to be
> non-zero.

Comment to myself:
This is incorrect as it depends on how the values are used.

Thank you,

---
Best Regards
Kunihiko Hayashi

