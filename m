Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD29CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 22:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epk83XHTGPqCs40eb3YUi50QD9q370QPRDNXcn99T0k=; b=i4YVXzU+kMhmanEJMiOtqlLrod
	+SZBGQdPRDznygyRMObkrV8wHUsKgKWsZSEltlF4Retqilr/9MTmyUP0PXwxJeBkaIs0008xSBuM3
	pE1PuE6R97dh/IAu1fw3IqXYdlL4OtXK0bUQHc4yy60CNowVJw1wFUoPwH0tTm5OBaP+NACQBufa9
	+yCM1jiTl2t0sTGWEU/b/t3j/SpiGao0XgmTMkQrWar5P1pngkXWBDqU4C+c469UYKkxghTXtqJ6X
	OMtW2C+YjAz0HNRKFLfSxKTfO0suSCue3+TFwSENYjpiM+Lut0p1UJKTvPpSPWmjFRAvIVzNX6J/c
	7Bz0g3Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXRjo-00000008QVA-38F2;
	Wed, 10 Jun 2026 22:49:32 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXRjl-00000008QUp-3nom;
	Wed, 10 Jun 2026 22:49:29 +0000
Message-ID: <30ecb791-a9dd-4146-8d8c-b77f1fb31dde@infradead.org>
Date: Wed, 10 Jun 2026 15:49:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] tty: serial: Add UART driver for Cortina-Access
 platform
To: Jason Li <jason.lee651024@gmail.com>, jason.li@cortina-access.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260610112821.3030099-1-jason.li@cortina-access.com>
 <20260610112821.3030099-4-jason.li@cortina-access.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260610112821.3030099-4-jason.li@cortina-access.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 6/10/26 4:28 AM, Jason Li wrote:
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index cf7dba473b20..99a1c9308395 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -1592,6 +1592,27 @@ config SERIAL_NUVOTON_MA35D1_CONSOLE
>  	  but you can alter that using a kernel command line option such as
>  	  "console=ttyNVTx".
>  
> +config SERIAL_CORTINA_ACCESS
> +	tristate "Cortina-Access serial port support"
> +	depends on OF
> +	select SERIAL_CORE
> +	help
> +	  This driver is for the Cortina-Access SoC UART, present in the
> +	  CA8289 (Venus) and related CAXXXX family of SoCs. If you have a
> +	  machine based on the Cortina-Access SoC and wish to use the serial
> +	  port, say 'Y' here. Otherwise, say 'N'.

It could also be 'm' since the kconfig symbol is tristate.

> +
> +config SERIAL_CORTINA_ACCESS_CONSOLE
> +	bool "Console on Cortina-Access serial port"
> +	depends on SERIAL_CORTINA_ACCESS=y
> +	select SERIAL_CORE_CONSOLE
> +	select SERIAL_EARLYCON
> +	help
> +	  Say 'Y' here if you wish to use the Cortina-Access UART as the system
> +	  console (the device which receives all kernel messages and warnings
> +	  and which allows logins in single user mode).
> +	  /dev/ttyS* is the default device node.
> +
>  endmenu

-- 
~Randy


