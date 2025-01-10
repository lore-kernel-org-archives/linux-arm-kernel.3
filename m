Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5203CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 08:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxSn76+HXS+LBGws2ThHr+S6dBafkbCiD1wgZAt8HHw=; b=eTHK5idD2rvy2zckVbEPEMswQh
	uSA7Csn9C3qCoh/6y/mbI6oECf8mP3Dw+aXryUC/kC4mrO4ehSYS2wVFt4uqDiLU+2viXqbRvnJjI
	17YNjxRR++LpZMXDSuA6DIcxp0v6cy3BGEonOEx+n/AI7YCMzffHiYKHLIWD6o7NWLGkCxX9oDp0n
	grb9/MPrjwpHwFd7IXS72+FfdMiJjvsDvJhAsOSOpQ22hR14fi1sW5MjjusJ9N1FV+pipCFqQBGXB
	1kEsJfXBvA7fZHHQteLTjsFmxnSCSMM0p9e7HBnCmSK+neV374Gq9Fs0BRhM2yCqbzqxK3ZYgeRx1
	AjxiwZvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAAB-0000000ETpn-2rqo;
	Fri, 10 Jan 2025 08:14:39 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWA8x-0000000ETiT-08pH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 08:13:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04E07240002;
	Fri, 10 Jan 2025 08:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736496796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxSn76+HXS+LBGws2ThHr+S6dBafkbCiD1wgZAt8HHw=;
	b=MJK3vIa31kDZMfbecXlWrbQJ0sgpg90ldaVb/ml7+HNKPLoPIdk2kqKNEq7XNEDgkhem6m
	Ve53lgB4VZ0oM48fmWQDvIPt/nA9nkIrjcY+IWR3nKN3122VKbqNHv/1Ap36fFhY9hWf6b
	H1outDJitoPvgf8rIt5GzP/HbUtEEt+cib4mkBTKjaUN9K0+AzqMVIo4onHYw4nkvwxjzf
	PC85PuLOS0SDc62i38/gdCyig4zokF5TjBEckWCO9f5sawfOYXya90ivx+2pE8UDSjCvaX
	fx8vViJmTwk/C6X62X1GKwGt2lNxZg6d/J3mACDEtItIroOVaiwobOJROq3vQQ==
Message-ID: <baf1d437-917b-4fe6-bab8-65dfb3ac1e6a@bootlin.com>
Date: Fri, 10 Jan 2025 09:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tty: atmel_serial: Use of_property_present() for
 non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250109182053.3970547-1-robh@kernel.org>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20250109182053.3970547-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_001323_208380_C9B127CC 
X-CRM114-Status: GOOD (  15.34  )
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

Le 09/01/2025 à 19:20, Rob Herring (Arm) a écrit :
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> As of_property_present() returns a boolean, use that directly
> and simplify the code a bit while we're here.
> 
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
>   	/* DMA/PDC usage specification */
>   	if (of_property_read_bool(np, "atmel,use-dma-rx")) {
> -		if (of_property_read_bool(np, "dmas")) {
> -			atmel_port->use_dma_rx  = true;
> -			atmel_port->use_pdc_rx  = false;
> -		} else {
> -			atmel_port->use_dma_rx  = false;
> -			atmel_port->use_pdc_rx  = true;
> -		}
> +		atmel_port->use_dma_rx = of_property_present(np, "dmas");
> +		atmel_port->use_pdc_rx = !atmel_port->use_dma_rx;
>   	} else {
>   		atmel_port->use_dma_rx  = false;
>   		atmel_port->use_pdc_rx  = false;
>   	}
>   
>   	if (of_property_read_bool(np, "atmel,use-dma-tx")) {
> -		if (of_property_read_bool(np, "dmas")) {
> -			atmel_port->use_dma_tx  = true;
> -			atmel_port->use_pdc_tx  = false;
> -		} else {
> -			atmel_port->use_dma_tx  = false;
> -			atmel_port->use_pdc_tx  = true;
> -		}
> +		atmel_port->use_dma_tx = of_property_present(np, "dmas");
> +		atmel_port->use_pdc_tx = !atmel_port->use_dma_tx;
>   	} else {
>   		atmel_port->use_dma_tx  = false;
>   		atmel_port->use_pdc_tx  = false;

Acked-by: Richard Genoud <richard.genoud@bootlin.com>

The code is indeed nicer like that!
Thanks!

Regards,
Richard

