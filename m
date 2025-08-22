Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDD0CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATJu5IW6o9czFCpcKz++53lkS+0C3ST+UjmKJE/B+3E=; b=qLEZdq+hyof4Ccl7DGFmWeCYV0
	UWfWT/A1hAQVcAzR/qB9b73Hs12QAA+IcZkVKV2Vi4Yt2gTX1AgAhXvVZ4bLGS7MrnbywMqwDjEDf
	VlZaFq4OVLG0fzdb5y9fOCf42+YbT2mUD49cDfo5a1cuzMNroKgyrQZ3NoUMqPgtVioxAYFH5Q4IE
	UB+dI5AL5HtDEgDgKeRu9GItfutCSyHPmiNnusysAWMt8Sjt90lUeYDZJjDknlpMYFtippDgb+wfI
	Hvw21lSEv1umy4K5rMa6AJAMP/oIOkdRo6UfcXnKqd6J/dzF/1aMsDQSWamVwLPajnPDRIAAppjPp
	gEUNx0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTGZ-00000002vXB-3TEM;
	Fri, 22 Aug 2025 15:01:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOIq-000000025Mq-2VQD;
	Fri, 22 Aug 2025 09:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755855800; x=1787391800;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XvLLjO10ZjfDDDyrr6k2ma2BhF/RNPJ4DSCV+fvgoPg=;
  b=LshUZKoSprOctQu0cB1Xev8iZQzvK0/9/LeGVHhzwNQzxqcDjzuPCVzA
   8bPRSAKXnIj7TsKOIMtrKNrLAl910OXqJqrl3c6GwA7ZhSILiWFf4wxDy
   hGlIVb4Cx1bCxgPCW2fjBAqByAyyZ9g2pgEU426ybWYos1ffWv5ukTF99
   qhyidE4VhTHAaM1nKf+MwleGzxirF07vdwGPhYppNy0eDR2wP6+n8lG6d
   EVsn69HVpVPrTokWs8hvR3VjpYfmtw5iOT73Yq0UtT/AH1bnoFj7MjPmz
   RU2nuZSsUdgGtKv7o50FRoqs1C5LCPsrCnqvUGg6qL+ftwbMy1oiGGLL9
   w==;
X-CSE-ConnectionGUID: LGcmkA5hT8qi7s/85J+MnQ==
X-CSE-MsgGUID: YHj2pwobRuWKcPBmUWDZiQ==
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="51127577"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Aug 2025 02:43:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 22 Aug 2025 02:42:54 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 22 Aug 2025 02:42:50 -0700
Message-ID: <73371973-d6b4-418c-a51c-2e89abab61e8@microchip.com>
Date: Fri, 22 Aug 2025 11:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] net: cadence: macb: Set upper 32bits of DMA ring
 buffer
To: Stanimir Varbanov <svarbanov@suse.de>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
	<jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
	<stable@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20250822093440.53941-2-svarbanov@suse.de>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250822093440.53941-2-svarbanov@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_024320_644543_E46B886D 
X-CRM114-Status: GOOD (  13.66  )
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

On 22/08/2025 at 11:34, Stanimir Varbanov wrote:
> In case of rx queue reset and 64bit capable hardware, set the upper
> 32bits of DMA ring buffer address.
> 
> Cc: stable@vger.kernel.org # v4.6+
> Fixes: 9ba723b081a2 ("net: macb: remove BUG_ON() and reset the queue to handle RX errors")
> Credits-to: Phil Elwell <phil@raspberrypi.com>
> Credits-to: Jonathan Bell <jonathan@raspberrypi.com>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Looks good to me: thanks!
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
> v1 -> v2:
>   - Added credits.
>   - Use lower_32_bits() for RBQP register writes for consistency (Nicolas).
>   - Added Fixes tag.
> 
>   drivers/net/ethernet/cadence/macb_main.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index ce95fad8cedd..36717e7e5811 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -1634,7 +1634,11 @@ static int macb_rx(struct macb_queue *queue, struct napi_struct *napi,
>                  macb_writel(bp, NCR, ctrl & ~MACB_BIT(RE));
> 
>                  macb_init_rx_ring(queue);
> -               queue_writel(queue, RBQP, queue->rx_ring_dma);
> +               queue_writel(queue, RBQP, lower_32_bits(queue->rx_ring_dma));
> +#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> +               if (bp->hw_dma_cap & HW_DMA_CAP_64B)
> +                       macb_writel(bp, RBQPH, upper_32_bits(queue->rx_ring_dma));
> +#endif
> 
>                  macb_writel(bp, NCR, ctrl | MACB_BIT(RE));
> 
> --
> 2.47.0
> 


