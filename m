Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA79ECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 09:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3GSy11eAN5yE3ErU21f7+b56CjhAjnY50C063AzKAY=; b=BMvLPWrz3eK5eBm8QZEOtsHg23
	tZS93kEFyyjdUeeDCx8iDLy10j9zh8mJhbrPSALVw08F0MYXUHn5wraBTf5KQLjbaYsqR92QRY9IN
	r5uaOqLPMAN1RjShs9VKWb9lbz0+yLtFzIINZc6ql4Bej32DlDj9iHbEsSeFa41lPUtdx4EYVrU1S
	duSiCe+P2+PRUjXVNZzMXvkaVVK6aiC4yKMpNTE3MiKi+FCIRwpPGvt3x2PpOy3EAo13d7l5UPukN
	Ow/nxEUsJuf+c5m/DrccZqkT300dVXm3otLsy+Hj7BQ3HpWXlPkRTRVw3pS+rdPvMuT9a4wtAzzAF
	uy9uiV6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIMN-00000009u3j-1BtA;
	Tue, 19 Aug 2025 09:10:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHje-00000009oR8-3RJf;
	Tue, 19 Aug 2025 08:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755592226; x=1787128226;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RCjGVgTB8l95FWGgUIkCSEdSoekdlF0bPAY4W69fdFE=;
  b=VYzW8Tu4oyxq0KvCcOq1qwyHTKoO5DyQT/o6EwfxOf5jozhYI9zg+c0y
   73VR5GuamSI/4ymKjYeufvl5M+fU+LZ0sAP2HkGgYDJy9XssH9IU9GJw3
   Jqt/qrpARjEs1n4Ubrw9gB0AkZlcvT11tlvpAdBh9DvHGaPGLDvSB+QPK
   79asvidEtPeqmSYhPnwsrvhc6JNstcgck8+AFiMMsUkXOtc9iNk0dWWaH
   x0k47Dr2gCdhU5vJum22W3Z04mnwtUyZ5r24s22rCHaJxWoCgd/AjF+BP
   SbA4vQyY0DOKr6IwRLXk3I8zMT7bCIttiZupWLG0D/GpVRmqgQk6dEYl8
   g==;
X-CSE-ConnectionGUID: rGxQvEkNTVWkP7VgrAZeXA==
X-CSE-MsgGUID: DQGDlEKeSEK7EQOEE1yQUw==
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="50924494"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Aug 2025 01:30:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 19 Aug 2025 01:29:45 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 19 Aug 2025 01:29:41 -0700
Message-ID: <37427c1a-68af-4c50-ac6d-da5ee135c260@microchip.com>
Date: Tue, 19 Aug 2025 10:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] net: cadence: macb: Set upper 32bits of DMA ring
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
	<jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250815135911.1383385-1-svarbanov@suse.de>
 <20250815135911.1383385-2-svarbanov@suse.de>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250815135911.1383385-2-svarbanov@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_013027_032969_56399043 
X-CRM114-Status: GOOD (  12.59  )
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

On 15/08/2025 at 15:59, Stanimir Varbanov wrote:
> In case of rx queue reset and 64bit capable hardware, set the upper
> 32bits of DMA ring buffer address.

Very nice finding! Thanks.

> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>

A "Fixes" tag might be interesting here.

> ---
>   drivers/net/ethernet/cadence/macb_main.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index ce95fad8cedd..41c0cbb5262e 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -1635,6 +1635,11 @@ static int macb_rx(struct macb_queue *queue, struct napi_struct *napi,
> 
>                  macb_init_rx_ring(queue);
>                  queue_writel(queue, RBQP, queue->rx_ring_dma);

For the sake of consistency, I would add lower_32_bits() to this call, 
as I see it for each use of RBQP or TBQP.

> +#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> +               if (bp->hw_dma_cap & HW_DMA_CAP_64B)
> +                       macb_writel(bp, RBQPH,
> +                                   upper_32_bits(queue->rx_ring_dma));
> +#endif
> 
>                  macb_writel(bp, NCR, ctrl | MACB_BIT(RE));

Best regards,
   Nicolas


