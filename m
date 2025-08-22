Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECE7CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01l9E8APFDy0rJCIS9v/0up+4Me1wtCwE3XT69D7epQ=; b=N4cdGW4Q1ToP03hVn1VUi+yN/J
	F1BbywLOHHC0NZjp6PBb9ezgltOa0E6krjpPNm+VhaYiAt5p4EelE9DSmdbKIidn2UoaX/2wBuG/D
	b/VXw8r4s/6FZ5ad7rUfp6MD4D3F/9fYDbKC9Fs94B86fg/0XlgzeiLERyxaqEnAfIacuNceM/0WQ
	brAEoEJ6Yi+Hb+BKooizREhyU+eKeM9bkCw6KLVXAJGgIwSANDnsjxoCllR76gUfXCooSyiktvr4T
	J3vAkKUiPl4SezDtWrsvVgiNoBwDGOfQf/fpsTbZMbgMVK/u/gyynhw37qwbWtnDXc09DfZlE6ker
	B1UlETrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdt-00000004SGU-2mkZ;
	Sat, 23 Aug 2025 09:34:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRqb-00000002dBu-3eWq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755869426; x=1787405426;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2DH9qi5H2xuATxSxcQMWteVKmv1srr8oRnYkAb20zFU=;
  b=joYwC7dRmROy+8m/BNWHE+T9DL0bi6zzfJK+P7nEG+MJHxI9Ke+uJS2j
   3BakGiwG934yx4bROb2kNWT36B65MPwZqFK4/tRVfcR0V0Mv2+EvgYa9O
   Mf5uAK+cwZokptcxxr5is+Pr/E/hTa1s0OUOU5XrugCndmyTEFYac7ILZ
   bcMS8WE0XDpfBUdggosTZxXfN4w6JaQC/EAy11fhYI5Wi4KtOKBi0cJiC
   tKectg453r4ccQb9iaRiD3mf9ZXmxhk2zwwNtFHnunOZOdgnjCid9WLfP
   MQjXSXvQZjl+NhndFvx5d9IHEYzujreWDcXRnQ1DaDyJrRrzp22/Fqdwc
   Q==;
X-CSE-ConnectionGUID: 11sNJxGJTCmAhZhLDIkO7g==
X-CSE-MsgGUID: PQ+t1yHES5qhKvGsxuqnOg==
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="45530272"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Aug 2025 06:30:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 22 Aug 2025 06:30:12 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 22 Aug 2025 06:30:07 -0700
Message-ID: <552bae37-bb1a-4564-9ba7-4fed134c3d78@microchip.com>
Date: Fri, 22 Aug 2025 15:30:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/9] ARM: at91: select ARCH_MICROCHIP
To: Robert Marko <robert.marko@sartura.hr>, <linux@armlinux.org.uk>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <olivia@selenic.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<andi.shyti@kernel.org>, <lee@kernel.org>, <broonie@kernel.org>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <arnd@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<o.rempel@pengutronix.de>, <daniel.machon@microchip.com>
CC: <luka.perkov@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-3-robert.marko@sartura.hr>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250813174720.540015-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063025_918324_8C7EB23D 
X-CRM114-Status: GOOD (  14.62  )
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

On 13/08/2025 at 19:44, Robert Marko wrote:
> Like with the ARM64 Microchip platforms, lets add a generic ARCH_MICROCHIP
> symbol and select it so that drivers that are reused for multiple product
> generation or lines, can just depend on it instead of adding each SoC
> symbol as their dependencies.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   arch/arm/mach-at91/Kconfig | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
> index 04bd91c72521..c5ef27e3cd8f 100644
> --- a/arch/arm/mach-at91/Kconfig
> +++ b/arch/arm/mach-at91/Kconfig
> @@ -1,4 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> +config ARCH_MICROCHIP
> +       bool
> +
>   menuconfig ARCH_AT91
>          bool "AT91/Microchip SoCs"
>          depends on (CPU_LITTLE_ENDIAN && (ARCH_MULTI_V4T || ARCH_MULTI_V5)) || \
> @@ -8,6 +11,7 @@ menuconfig ARCH_AT91
>          select GPIOLIB
>          select PINCTRL
>          select SOC_BUS
> +       select ARCH_MICROCHIP
> 
>   if ARCH_AT91
>   config SOC_SAMV7
> --
> 2.50.1
> 


