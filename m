Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1181DD2B92B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 13:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MBA9Ajwg7j/Lzr7EbUtyDFPdeq0ZUuoOLYden2W4g4=; b=xktN9cawwG2F1ySJyswkctC2Is
	h3BXUZ1Dx4OtJe82/+2Z93Lqdp4FRFKkP/8nJlzjixLFk+7FYgjp88M8ZC3eqta+Tl8+NQv8D8MnU
	SxeE4pI5jcbrttvuyO7HN1CGeD9+PqBYhdDFnFsit9WNsG8nHJopfAllGeBfDHCyEPo4KYOz8PYm5
	WKG9VEGY0fGZFkv2ti3TVfTzFvdl6DhW4GMynB/Az9b+W0x5dpu5FE8uJ82fKmRnqidFJKLwHuYpZ
	TCs+w16hlmLC4Fo4blvl7Dglocko7z7Uo9JUKFBUTlhfwnm6JyeVtn2STR0258RHUw/AsQfKnU7YQ
	CDyt+OKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8JiM-0000000H8Xs-24Yf;
	Tue, 05 Nov 2024 13:35:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Jgc-0000000H8Bs-43VV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 Nov 2024 13:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6MBA9Ajwg7j/Lzr7EbUtyDFPdeq0ZUuoOLYden2W4g4=; b=SSLmYjzD4ELJCGtyW+aTLwuv3s
	LnFji7lD4mtwVeRafy86irICATERSDvQhERuNeeuaSfrd69yJWnGlgNVi30BM7fzLJvL3+/2k220/
	IaU55Zh1xzgwumYsrEw9N4ODXsIWYkGSY9XHIAw+hnbzbl7P5x0g61ykGHfZ0C9iE4NQ8c4CGHF+3
	q9VPttvRM+O4DXUdiBCYJ+gJA6YD+KgF6CCyxiubxPmZx91CIxmWP2+AH9s1IiNMC3jpOUAt+Inuk
	814g0ohqEoOvgyMLZwEUP1igB27ipX71b4sjImKEGXzWSP1XFK0XD656MRfvHC0kzPqHM76r+cJfQ
	ACuH52pA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8JgZ-0000000Bki1-10LG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 13:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730813611; x=1762349611;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZfBfd3utH5fUj2d21rZC/jQ+ZTHQNpW9dd2J7Q6Qexw=;
  b=YyV+pGHAMrwMC2XuyoIbrYHToMLBnzeAha/Z4cqlVBzuNVSOX9wrskXh
   DpA52kgV59fV9QvN6ItBwRNQuOYs/h24ho9WgRV8sPMe7V2i5JwrP7BSa
   sRVyd41dn78FlRQ86tC5Q0rRf5eXfyVJO9VUDu3ZT8pttnx0w5XeQGXQy
   eHecIp1KGLVyzKoLu8Qmr6SUseQz3ihsqgR8pTIroWhqrYC8Q/8qyYz1V
   y6bc3jyXQTiGoAuLtqc4qimwE8M1ktn1J4fNNRtOMaBOezOIFTl901uQO
   F7/8/ATIuk5cBTUCZONSf4zMC06XFHgFN0g33w8SxWUVahRLSZszWJ8sP
   A==;
X-CSE-ConnectionGUID: eAALYus2R3+DR7TSlO2+qA==
X-CSE-MsgGUID: IVBMUznwT+26g+nP8tI3jw==
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="34412050"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Nov 2024 06:33:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Nov 2024 06:32:43 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 5 Nov 2024 06:32:40 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <mihai.sain@microchip.com>
Subject: Re: [PATCH] tty: atmel_serial: Use devm_platform_ioremap_resource()
Date: Tue, 5 Nov 2024 15:31:56 +0200
Message-ID: <20241105133155.67025-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105131946.22449-1-mihai.sain@microchip.com>
References: <20241105131946.22449-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_133331_747918_4064D258 
X-CRM114-Status: GOOD (  16.67  )
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
Cc: alexandre.belloni@bootlin.com, gregkh@linuxfoundation.org, claudiu.beznea@tuxon.dev, linux-kernel@vger.kernel.org, Andrei Simion <andrei.simion@microchip.com>, linux-serial@vger.kernel.org, hari.prasathge@microchip.com, jirislaby@kernel.org, richard.genoud@bootlin.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 05.11.2024 15:19, Mihai Sain wrote:
> Simplify the request port function by using a single call
> to devm_platform_ioremap_resource().
> 
> This will also enhance the printing from /proc/iomem:
> 
> cat /proc/iomem | grep flexcom ; cat /proc/iomem | grep serial
> 
> f0004000-f00041ff : f0004000.flexcom flexcom@f0004000
> f8020000-f80201ff : f8020000.flexcom flexcom@f8020000
> f0004200-f00043ff : f0004200.serial serial@200
> f8020200-f80203ff : f8020200.serial serial@200
> fffff200-fffff3ff : fffff200.serial serial@fffff200
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>

Hi,

Tested-by: Andrei Simion <andrei.simion@microchip.com>

Best Regards,
Andrei

> ---
>  drivers/tty/serial/atmel_serial.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> index 09b246c9e389..e1107f14ec98 100644
> --- a/drivers/tty/serial/atmel_serial.c
> +++ b/drivers/tty/serial/atmel_serial.c
> @@ -2419,17 +2419,11 @@ static void atmel_release_port(struct uart_port *port)
>  static int atmel_request_port(struct uart_port *port)
>  {
>  	struct platform_device *mpdev = to_platform_device(port->dev->parent);
> -	int size = resource_size(mpdev->resource);
> -
> -	if (!request_mem_region(port->mapbase, size, "atmel_serial"))
> -		return -EBUSY;
>  
>  	if (port->flags & UPF_IOREMAP) {
> -		port->membase = ioremap(port->mapbase, size);
> -		if (port->membase == NULL) {
> -			release_mem_region(port->mapbase, size);
> -			return -ENOMEM;
> -		}
> +		port->membase = devm_platform_ioremap_resource(mpdev, 0);
> +		if (IS_ERR(port->membase))
> +			return PTR_ERR(port->membase);
>  	}
>  
>  	return 0;
> 
> base-commit: 2e1b3cc9d7f790145a80cb705b168f05dab65df2

