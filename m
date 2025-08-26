Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C181CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 09:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzaTv3xaNSj7W4Nyj7ocIPZ6aa1TlODUVDySQloqrIk=; b=y6lFNG6pfi8VyF0mahOrOvZ4vN
	vVqqXw848iHaH3RuOQgTe2g+KePVBIcihBxEE7xqA1bMIqlLMWb7FsuzpDogKQgZGjmd1GOj/8wxX
	UQLlGTdOioxODNQb3WR/GDozbOUdn4SIT5pvaSbAdvbvNMXGabPPpPfC+NpO6lm/d4DPTfCzZh5Wq
	M2BIUfbybS3JxzJKatCNgecx0XJr3sdRd2zWKAPy7SHTGJnPmSBXv3DUp5TtfMJfhrpieRvWbecTB
	H+6TLeNi67tvBuLMmeEuZJ0YDKhe3f6QL4UCEv5yZoeGKgj6wdlhr46TBPmISnCal+ntnFg7xTzxy
	tNmgOUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpo5-0000000BJf0-3I04;
	Tue, 26 Aug 2025 09:17:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpkO-0000000BHRe-0svl;
	Tue, 26 Aug 2025 09:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756199623; x=1787735623;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7k06+KU4FS2Nl7hFPiL3ggXSFJrFlkWWsqe3DM83IFU=;
  b=CEOhBMLm8+YwSZPJGXu8wYzTOvtFkpNCWXgJJmFfssnwVWGK79qsCRTh
   nBw4PKQppwFtQISe09O2YnFqGUw+gp8ugi1Yrx8sBrzOh5IiojzcHnI3s
   7hCoiNyCfPql2m8q+3jZjYu7xghXhPkIR2QroafmBjgin+coURn3jieqK
   8VlMmEFC13gHJd4VbIre2w0j4l/6rTSXWVS4EAD6OtPVlqKPABqt+o53z
   vbrOrvdhzaH7C2PEcG16sq68Ec+pfmh75rd0vfY0bnsLfCWNTUgBV2LXp
   4neZeiyEp9kr/t/OU25gkdkq/jays84VGf/4lxaMaK5zU0bibi1/KVFQo
   A==;
X-CSE-ConnectionGUID: M1JPlUWoR9q6iYMXOF8AMA==
X-CSE-MsgGUID: p1l8mJrQR+iVfmrclzS1tw==
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="213074667"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Aug 2025 02:13:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 26 Aug 2025 02:13:16 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 26 Aug 2025 02:13:11 -0700
Message-ID: <3e1c2519-e5b3-4775-bb49-ec8f355ca4b2@microchip.com>
Date: Tue, 26 Aug 2025 11:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] net: cadence: macb: Set upper 32bits of DMA ring
 buffer
To: Stanimir Varbanov <svarbanov@suse.de>, Jakub Kicinski <kuba@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Andrea della Porta
	<andrea.porta@suse.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Phil
 Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>, <stable@vger.kernel.org>, Andrew
 Lunn <andrew@lunn.ch>, =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20250822093440.53941-2-svarbanov@suse.de>
 <20250825165310.64027275@kernel.org>
 <1ecd4a9a-d685-4bce-ad06-cc8878f0a165@suse.de>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <1ecd4a9a-d685-4bce-ad06-cc8878f0a165@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_021344_426131_422ABA43 
X-CRM114-Status: GOOD (  11.93  )
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

On 26/08/2025 at 10:35, Stanimir Varbanov wrote:
> Hi Jakub,
> 
> On 8/26/25 2:53 AM, Jakub Kicinski wrote:
>> On Fri, 22 Aug 2025 12:34:36 +0300 Stanimir Varbanov wrote:
>>> In case of rx queue reset and 64bit capable hardware, set the upper
>>> 32bits of DMA ring buffer address.
>>>
>>> Cc: stable@vger.kernel.org # v4.6+
>>> Fixes: 9ba723b081a2 ("net: macb: remove BUG_ON() and reset the queue to handle RX errors")
>>> Credits-to: Phil Elwell <phil@raspberrypi.com>
>>> Credits-to: Jonathan Bell <jonathan@raspberrypi.com>
>>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>
>>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
>>> index ce95fad8cedd..36717e7e5811 100644
>>> --- a/drivers/net/ethernet/cadence/macb_main.c
>>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>>> @@ -1634,7 +1634,11 @@ static int macb_rx(struct macb_queue *queue, struct napi_struct *napi,
>>>               macb_writel(bp, NCR, ctrl & ~MACB_BIT(RE));
>>>
>>>               macb_init_rx_ring(queue);
>>> -            queue_writel(queue, RBQP, queue->rx_ring_dma);
>>> +            queue_writel(queue, RBQP, lower_32_bits(queue->rx_ring_dma));
>>> +#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>>> +            if (bp->hw_dma_cap & HW_DMA_CAP_64B)
>>> +                    macb_writel(bp, RBQPH, upper_32_bits(queue->rx_ring_dma));
>>> +#endif
>>>
>>>               macb_writel(bp, NCR, ctrl | MACB_BIT(RE));
>>>
>>
>> Looks like a subset of Théo Lebrun's work:
>> https://lore.kernel.org/all/20250820-macb-fixes-v4-0-23c399429164@bootlin.com/
>> let's wait for his patches to get merged instead?
> 
> No objections for this patch, it could be postponed. But the others from
> the series could be applied.

Some cleanup by Théo, could interfere with sorting of compatibility 
strings...
We'll try make all this be queued in order, as Théo was first to send. 
Sorry for not having realized this earlier.

Best regards,
   Nicolas


