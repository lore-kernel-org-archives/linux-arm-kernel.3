Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3C3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 09:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yef8tR4ZPsUCn9Eonr75WkCe6lnVP+EFUPNjmwe4/ug=; b=F8NMDPLdtCBymOXQYkzrGCsPPq
	KhyoAJwzxgpC4CKdzgjgxFGQFSiRRq+h7rEpI/1hQn3ytktCZxFeI0t7AXWalvDW2W4+3cLL1JpDi
	sSbpdg3jkchW897jTzj0gh2uTB4FSESI+NlPRCDc7WxTR4oFPLrJjKJsInkKmJJ2NMBFsnVtyaCaZ
	k/nC0Wzh0eq09P9j8+jYGNqJAi9qeK1/9mbTI7jGs2KElrHGljtBFs6vZOiiK+5U1jTs91Pv9c1vZ
	dmf4xXsgvzWG5Lxxlw+C1+hHZA+oNsXqo6m+KbgJQyNRe7CR1gBY0jwfzwVsLGmbrgGx2g6Hh+ZM0
	PmAfrYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBRr-0000000Ekx2-2siZ;
	Fri, 10 Jan 2025 09:36:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBO8-0000000Ejzd-2q7x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 09:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736501588; x=1768037588;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jjJ7LK5O+a7pYF2qmcJDXghsWjUlHsE0YcIU+H6coOk=;
  b=zzG005pRfxTnz/jqsEFGN2J/kNwjlR153rw07qJGMHdgSXl7fbY6Q+YO
   a7SAXuv6/34JTISgUoSqd0vmXAXHY0rOZS2qrNRMdXbS4SeaDH++WCXD1
   T7JzLt7pC4Ejcg39ELQ6HHD1TP8Exi5ksRVeCTxbqAT7G/bzncrSAJwxa
   8dRNWCJ1Lz/2ENTAgHamlk3WCFc03nQ3H8Xxzgpqe4Z8Bf6mhymhSFAMA
   bDr/+V6yE02G+EAUych3qxHKbc8vJAuMOXIJ/q0BGVIo0h7JGD+wE5po2
   rVhuCGHh0B7wy9C6RXcgiP0UxXDsHBlPCpJlhp+5zjSijx+qTsRtqDHH6
   g==;
X-CSE-ConnectionGUID: ZmCJLco0SampymAgwNXOYA==
X-CSE-MsgGUID: CJCEpP1XR9CmnO67I8eFbQ==
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36822340"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jan 2025 02:33:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 Jan 2025 02:32:35 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 Jan 2025 02:32:33 -0700
Message-ID: <d6449ca2-8d68-4007-805d-0f71d2cea681@microchip.com>
Date: Fri, 10 Jan 2025 10:32:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tty: atmel_serial: Use of_property_present() for
 non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>, Richard Genoud
	<richard.genoud@bootlin.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20250109182053.3970547-1-robh@kernel.org>
Content-Language: en-US, fr-FR
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20250109182053.3970547-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_013308_783546_AE6CA4C1 
X-CRM114-Status: GOOD (  16.47  )
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

On 09/01/2025 at 19:20, Rob Herring (Arm) wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> As of_property_present() returns a boolean, use that directly
> and simplify the code a bit while we're here.

Indeed! Thanks Rob.

Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>


> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   drivers/tty/serial/atmel_serial.c | 18 ++++--------------
>   1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> index 0cf05ac18993..f44f9d20a974 100644
> --- a/drivers/tty/serial/atmel_serial.c
> +++ b/drivers/tty/serial/atmel_serial.c
> @@ -1727,26 +1727,16 @@ static void atmel_init_property(struct atmel_uart_port *atmel_port,
> 
>          /* DMA/PDC usage specification */
>          if (of_property_read_bool(np, "atmel,use-dma-rx")) {
> -               if (of_property_read_bool(np, "dmas")) {
> -                       atmel_port->use_dma_rx  = true;
> -                       atmel_port->use_pdc_rx  = false;
> -               } else {
> -                       atmel_port->use_dma_rx  = false;
> -                       atmel_port->use_pdc_rx  = true;
> -               }
> +               atmel_port->use_dma_rx = of_property_present(np, "dmas");
> +               atmel_port->use_pdc_rx = !atmel_port->use_dma_rx;
>          } else {
>                  atmel_port->use_dma_rx  = false;
>                  atmel_port->use_pdc_rx  = false;
>          }
> 
>          if (of_property_read_bool(np, "atmel,use-dma-tx")) {
> -               if (of_property_read_bool(np, "dmas")) {
> -                       atmel_port->use_dma_tx  = true;
> -                       atmel_port->use_pdc_tx  = false;
> -               } else {
> -                       atmel_port->use_dma_tx  = false;
> -                       atmel_port->use_pdc_tx  = true;
> -               }
> +               atmel_port->use_dma_tx = of_property_present(np, "dmas");
> +               atmel_port->use_pdc_tx = !atmel_port->use_dma_tx;
>          } else {
>                  atmel_port->use_dma_tx  = false;
>                  atmel_port->use_pdc_tx  = false;
> --
> 2.45.2
> 


