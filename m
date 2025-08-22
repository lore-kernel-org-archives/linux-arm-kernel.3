Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C961CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xz+pem1H8lGZXSPwjCuSR1YFeknKnIx0zJlkxd0skAE=; b=uMPpQp2EfIdgYD9gwrOlngJ+EZ
	3Ffa7NyqIKq3oVdYBnqoHWnMw07mBRfmp3bQ+8Y3qlflI69Xe8LYjYbFC2va1E6qccQfiS0gpUqdf
	6JGZM9C0c+T8XIu5G6UGFZSwvccRiYutH6W/3RXD5ByKhIRwQMJ8GWKsowEOuJzjqeWeFfGhIZIJd
	FY0FGYWZvp8upmmaX5gkoAMXs55luWe7xjTw8190hDeBWan3/MtXPTd6V0fB8lG1+VKQqXaqJb1Tg
	aA/h/w1r8C7tSnQi1iTFtOe/KIxvvvQCxistlX5Vf5e+Ow8qA2fsvJ8yPJIigzhm0vXaCjx4Ib3sc
	xnHPW/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphk0-00000003wJ1-3ymw;
	Sat, 23 Aug 2025 06:28:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQf0-00000002RnQ-2NvS;
	Fri, 22 Aug 2025 12:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755864863; x=1787400863;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xUzCqw8G2JO1bhdytol3kfokW1GSmJ1/SVm3V50NR/g=;
  b=efkPsPxDyeSmin3h92LXaPHkhyH8TRIT2IHPABGWz0U+yJkUauEVCBfQ
   9Gc68dMlf8qjUgCoZH9kmE527KeZzAca1xIaGUbz4rzekzj931urVrZlS
   0EQXY2Mpvdbby1gFWjQ1tT8Ws/Xlom+Ye2plF89tuxAPR0VB7rZ7Rpsy8
   FdsutwNAbAcxybMMYbULAQhqtf9hM5MGPzaSBihLjKCCvdZxZPw6FElTW
   SPZV4uves2RD5xtFx93CqYMz9KjCcQmJiOvlUeAAwxzzr6AOgRP0hqYUn
   FnOi98I5lmSbHvezI5U0jVrWTn/t0nDqqixMfToWy3FFk1fnWqr7xeNoz
   w==;
X-CSE-ConnectionGUID: UKvKOVZXRqugqNL71FaA+g==
X-CSE-MsgGUID: /uRisEj6RXar0b2HQ8WGoQ==
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="45527384"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Aug 2025 05:14:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 22 Aug 2025 05:13:59 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 22 Aug 2025 05:13:55 -0700
Message-ID: <364fadbd-20fd-4f89-8a86-ed5b8d87ab42@microchip.com>
Date: Fri, 22 Aug 2025 14:13:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] net: cadence: macb: Add support for Raspberry Pi
 RP1 ethernet controller
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
	Andrew Lunn <andrew@lunn.ch>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20250822093440.53941-4-svarbanov@suse.de>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250822093440.53941-4-svarbanov@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_051422_828579_668F39FB 
X-CRM114-Status: GOOD (  16.00  )
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
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The RP1 chip has the Cadence GEM block, but wants the tx_clock
> to always run at 125MHz, in the same way as sama7g5.
> Add the relevant configuration.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   drivers/net/ethernet/cadence/macb_main.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 36717e7e5811..260fdac46f4b 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -5135,6 +5135,17 @@ static const struct macb_config versal_config = {
>          .usrio = &macb_default_usrio,
>   };
> 
> +static const struct macb_config raspberrypi_rp1_config = {
> +       .caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG |
> +               MACB_CAPS_JUMBO |
> +               MACB_CAPS_GEM_HAS_PTP,
> +       .dma_burst_length = 16,
> +       .clk_init = macb_clk_init,
> +       .init = macb_init,
> +       .usrio = &macb_default_usrio,
> +       .jumbo_max_len = 10240,
> +};
> +
>   static const struct of_device_id macb_dt_ids[] = {
>          { .compatible = "cdns,at91sam9260-macb", .data = &at91sam9260_config },
>          { .compatible = "cdns,macb" },
> @@ -5155,6 +5166,7 @@ static const struct of_device_id macb_dt_ids[] = {
>          { .compatible = "microchip,mpfs-macb", .data = &mpfs_config },
>          { .compatible = "microchip,sama7g5-gem", .data = &sama7g5_gem_config },
>          { .compatible = "microchip,sama7g5-emac", .data = &sama7g5_emac_config },
> +       { .compatible = "raspberrypi,rp1-gem", .data = &raspberrypi_rp1_config },
>          { .compatible = "xlnx,zynqmp-gem", .data = &zynqmp_config},
>          { .compatible = "xlnx,zynq-gem", .data = &zynq_config },
>          { .compatible = "xlnx,versal-gem", .data = &versal_config},
> --
> 2.47.0
> 


