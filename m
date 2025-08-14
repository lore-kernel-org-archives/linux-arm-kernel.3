Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E61BCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Yzq4gKwNqMbNXOcYSA7ARRrQ67vchKMExUQoz8D07g=; b=hur0AwuLEiuXDYWynkafnSWZNK
	6sbjwg1eyKqNrlsxhCz4TL1eXApPlAHsMeJcGY5t9+5rNLCFRV9I064Fe1CzcXfes6eHVplapPT8K
	XQJDuJHQITg5mWo27kANiaInNYgTrgDoU3kihvKLH2fQVIDKnzlHmCIjg7XXP6Xbb6gFFDoEIpzHp
	Xr7SDUt1V0huxf6irquJHDpza+rm0IGnqnhYSRSp9kx5mXFrKtELUe4ON476esuJi1cM4AAX/WtTY
	N+HpA/S299m3GsiQFTDn6zqjwIYKxiWer5xDBKhQd0V+Q1ZZBny2Btvu8rc7Dq1UjaLhIB1Rkx9zH
	K/4YQWLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZgx-0000000HOcf-1g8M;
	Thu, 14 Aug 2025 15:16:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUvk-0000000GXFV-3azg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2672A56868;
	Thu, 14 Aug 2025 10:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4A9C4CEED;
	Thu, 14 Aug 2025 10:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755166291;
	bh=kTd9OqRGMiVwknWlc2tHcIgi2pdtVtjjVY49UoxDJjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l0XR3v0HLfn2c6LbT2X3JEXKhTuY/BLOKRuCamKHn9jijqYxJRzM4BNWjaBSIlUj3
	 67/oD3yyj9cqH0YaFho+6WR684v0PXMvo9YUbHEgh9oDW69KzSslMDZ00jDokTB2/r
	 kdMsrrwdIu2Ea7GMVgXButDw4mzQrjWQ6fukGhHs=
Date: Thu, 14 Aug 2025 12:11:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andi.shyti@kernel.org, lee@kernel.org, broonie@kernel.org,
	jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v9 5/9] tty: serial: atmel: make it selectable for
 ARCH_MICROCHIP
Message-ID: <2025081421-lapping-same-c2d5@gregkh>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-6-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813174720.540015-6-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_031132_963490_B21ABB36 
X-CRM114-Status: GOOD (  16.03  )
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

On Wed, Aug 13, 2025 at 07:44:41PM +0200, Robert Marko wrote:
> LAN969x uses the Atmel USART serial, so make it selectable for
> ARCH_MICROCHIP to avoid needing to update depends in future if other
> Microchip SoC-s use it as well.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/tty/serial/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 44427415a80d..724ad4f3cbee 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -128,7 +128,7 @@ config SERIAL_SB1250_DUART_CONSOLE
>  config SERIAL_ATMEL
>  	bool "AT91 on-chip serial port support"
>  	depends on COMMON_CLK
> -	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
> +	depends on ARCH_MICROCHIP || COMPILE_TEST
>  	select SERIAL_CORE
>  	select SERIAL_MCTRL_GPIO if GPIOLIB
>  	select MFD_AT91_USART
> -- 
> 2.50.1
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

