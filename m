Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7072CCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymIxetTWocC2/T6DcUZLUqfBudVyTjFDiSDhCwPR4IA=; b=PHlt6w6S//sQv2ZBAbM8wqzHRy
	2GPOiJ3FFOfedbRsLU9gpNBHLIyAG6xj++dIVK5wnv/CCIAFSzRoGgWLf00AKdMNZfckWqXt5uf5K
	XoAgBLXcRPFoFvSEDlvDdLs+BtFbtRFiDu24rdfyuQBbtDe3OSFjSH5KWGxq7G56HniX9kKLil7NO
	+lB3diIcr1G28Wl+akEP7xCYzjqclhzA0AdkY7UXLWqh3g4ci21nEMGcX8RhwDMq9QZHa8QhwRSfe
	me6E0oigSKtgtKw35Rgbw1NT1Rnw5/OXxOiRwpBM9MD9LkVk7KzwsLaOwrZn13VR9O6bqDeF/mzgY
	BRWm8XwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbdR-00000001SJQ-2px2;
	Thu, 11 Sep 2025 07:22:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbdO-00000001SHZ-09QE;
	Thu, 11 Sep 2025 07:22:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8941EC6B3AB;
	Thu, 11 Sep 2025 07:22:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C391606BB;
	Thu, 11 Sep 2025 07:22:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96128102F2882;
	Thu, 11 Sep 2025 09:21:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757575334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ymIxetTWocC2/T6DcUZLUqfBudVyTjFDiSDhCwPR4IA=;
	b=BP0dghcvk2HqRbfKQS3O7ySBOrhO100W9n5AqVrR5PeKtATxfQw0Fg34/tSl45/GNCqkB5
	4YDn3TU+esRYKH/S7xLXUPXNvWIRKopAHuqEnYhzTqOUVbkXD55NDWUtJs2pjGQaJesftt
	4UyhJvGAks1d4dAvYXnQCbrr99n+3bCVBOl1UC9ecNzEoDjWRsI8lWbZQqgdjHlJEaAybm
	wVUUwXjiHFuXkBHSHLPSqCRtPjtCqbF4BeojkAze1q8uA62pIfkwavllHdygrvVrct1wTr
	rgMfHHXK5dOG9RdqE9rA5g4ojdhyInfMVW5tD3BRfmQ2KzRRrXlhsvcwN2UlPA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 09:21:34 +0200
Message-Id: <DCPSFZLWJLG7.1B4NISSDKLWBQ@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v2 1/5] net: cadence: macb: Set upper 32bits of DMA ring
 buffer
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rpi-kernel@lists.infradead.org>, "Broadcom internal kernel review
 list" <bcm-kernel-feedback-list@broadcom.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Florian Fainelli"
 <florian.fainelli@broadcom.com>, "Andrea della Porta"
 <andrea.porta@suse.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>, "Phil
 Elwell" <phil@raspberrypi.com>, "Jonathan Bell" <jonathan@raspberrypi.com>,
 "Dave Stevenson" <dave.stevenson@raspberrypi.com>,
 <stable@vger.kernel.org>, "Andrew Lunn" <andrew@lunn.ch>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Stanimir Varbanov" <svarbanov@suse.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20250822093440.53941-2-svarbanov@suse.de>
 <20250825165310.64027275@kernel.org>
 <3bccf773-abd6-4ade-a1c5-99f2a773b723@microchip.com>
 <DCPA2BR78XM8.HWKZZ8WQF3S8@bootlin.com>
In-Reply-To: <DCPA2BR78XM8.HWKZZ8WQF3S8@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_002222_465554_D55067B0 
X-CRM114-Status: GOOD (  20.86  )
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

On Wed Sep 10, 2025 at 6:57 PM CEST, Th=C3=A9o Lebrun wrote:
> Hello Nicolas, Jakub, Stanimir,
>
> On Tue Aug 26, 2025 at 11:14 AM CEST, Nicolas Ferre wrote:
>> On 26/08/2025 at 01:53, Jakub Kicinski wrote:
>>> On Fri, 22 Aug 2025 12:34:36 +0300 Stanimir Varbanov wrote:
>>>> In case of rx queue reset and 64bit capable hardware, set the upper
>>>> 32bits of DMA ring buffer address.
>>>>
>>>> Cc: stable@vger.kernel.org # v4.6+
>>>> Fixes: 9ba723b081a2 ("net: macb: remove BUG_ON() and reset the queue t=
o handle RX errors")
>>>> Credits-to: Phil Elwell <phil@raspberrypi.com>
>>>> Credits-to: Jonathan Bell <jonathan@raspberrypi.com>
>>>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>>=20
>>>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/et=
hernet/cadence/macb_main.c
>>>> index ce95fad8cedd..36717e7e5811 100644
>>>> --- a/drivers/net/ethernet/cadence/macb_main.c
>>>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>>>> @@ -1634,7 +1634,11 @@ static int macb_rx(struct macb_queue *queue, st=
ruct napi_struct *napi,
>>>>                macb_writel(bp, NCR, ctrl & ~MACB_BIT(RE));
>>>>
>>>>                macb_init_rx_ring(queue);
>>>> -             queue_writel(queue, RBQP, queue->rx_ring_dma);
>>>> +             queue_writel(queue, RBQP, lower_32_bits(queue->rx_ring_d=
ma));
>>>> +#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>>>> +             if (bp->hw_dma_cap & HW_DMA_CAP_64B)
>>>> +                     macb_writel(bp, RBQPH, upper_32_bits(queue->rx_r=
ing_dma));
>>>> +#endif
>>>>
>>>>                macb_writel(bp, NCR, ctrl | MACB_BIT(RE));
>>>>
>>>=20
>>> Looks like a subset of Th=C3=A9o Lebrun's work:
>>> https://lore.kernel.org/all/20250820-macb-fixes-v4-0-23c399429164@bootl=
in.com/
>>> let's wait for his patches to get merged instead?
>>
>> Yes, we can certainly wait. As RBOPH changes by Th=C3=A9o are key, they =
will=20
>> probably remove the need for this fix altogether: but I count on you=20
>> Stanimir to monitor that (as I don't have a 64 bit capable platform at=
=20
>> hand).
>
> I when looking for where this patch came from.
> Commit in the raspberrypi downstream kernel:
> https://github.com/raspberrypi/linux/commit/e45c98decbb16e58a79c7ec6fbe43=
74320e814f1
>
> It is somewhat unreadable; the only part that seems related is the:
>
>> net: macb: Several patches for RP1
>> 64-bit RX fix
>
>  - Is there any MACB hardware (not GEM) that uses 64-bit DMA
>    descriptors? What platforms? RPi maybe?
>
>  - Assuming such a platform exists, the next question is why does
>    macb_rx() need to reinit RBQPH/0x04D4. It reinits RBQP/0x0018
>    because it is the buffer pointer and increments as buffers get used.
>
>    To reinit RBQPH would be for the case of the increment overflowing
>    into the upper 32-bits. Sounds like a reasonable fix (for a really
>    rare bug) if that hardware actually exists.
>
>    This wouldn't be needed on GEM because RBQPH is shared across queues.
>    So of course RBQPH would not increment with the buffer pointer.
>
> If this patch is needed (does HW exist?), then my series doesn't address
> it. I can take the patch in a potential V6 if you want. V5 got posted
> today [0].
>
> [0]: https://lore.kernel.org/lkml/20250910-macb-fixes-v5-0-f413a3601ce4@b=
ootlin.com/

Coming back after some sleep: my series does address this.
It updates macb_alloc_consistent() so allocs look like:

   size =3D bp->num_queues * macb_tx_ring_size_per_queue(bp);
   tx =3D dma_alloc_coherent(dev, size, &tx_dma, GFP_KERNEL);
   if (!tx || upper_32_bits(tx_dma) !=3D upper_32_bits(tx_dma + size - 1))
      goto out_err;

   // same for rx

In the MACB (!GEM) case, bp->num_queues=3D1 so we will check that the
start and end of the DMA descriptor ring buffer have the same upper
32-bits.

That implies macb_rx() doesn't have to reinit RBQPH/0x04D4.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


