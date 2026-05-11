Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E291BCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 13:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6OPa//XjNhs5kTx851nOkxuR/tf4V8SuBMLakuZqOc=; b=lbRc6QCnWBWWw691D+ukanbGCS
	UAr+atkgTE03NkM3g7Z/59UrtfWGlaZE7kiT7WkLcCm0gc88GhsPsVJaK9PsK0d+po4eQosW7pyFs
	e2A/N1fq0J4uC6KCmcVd6vedVi6MWCLv+XMtGPM76KILzMVFLk91dAX41SDqKYREZJ6oruBHdqHCi
	zFY+FVLAQ9xRcv+sbHidMMecsF+GT52bl+5zrXZn3cRSok1JJH+2IcUvcEVb89JGuni/4qJ5ZZ26t
	fozEF8DCnN69nNpZ1+ZbHb3qI9w8q6wz3jzMpSC4rroQRJpWK3azsxjraU6f+6kFC/EEKqweoBOBR
	gzO0PZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQwW-0000000DnlW-3651;
	Mon, 11 May 2026 13:45:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQwV-0000000Dnl5-0vOA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 13:45:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5781A60123;
	Mon, 11 May 2026 13:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6E9C2BCB0;
	Mon, 11 May 2026 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778507106;
	bh=YB5foC83rUXpsRNNlHJNUbPJ0U/jUjSki9mIQyMMzck=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Bx/vz2AxXZ/UO+SjlqXp2kuGwcATxAeJIGBHJcm5lekYYK24YZZsizVOSKvwkos74
	 UYH+Qam0jt6Vll15oU2Z+ymMek3jiWBIbOZ1Qp5RBJ37xunip+9P0Hw0HkuINxLNHY
	 rmNWAkSzt40AMnjbGwI+0qkFOHxx8+sW7v7f7iaSlYnbvKq25d5VWFWqF1IH9dSZ28
	 gLk4qXeWNJvR3eftJxML3f9tuMkyepjd1j9ByRPIemP5bkc+3uqgNppswak7MKXSuk
	 VyoaRtQAA9uWqW/g4kxuQxGKca/MB2/brDq6Hqh78CzpWFPXY8sXSwsj1IHm1+WpGb
	 Midbg1eFigYeg==
From: Thomas Gleixner <tglx@kernel.org>
To: Rosen Penev <rosenp@gmail.com>, linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, "moderated
 list:ARM/Marvell Kirkwood and
 Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, "open
 list:CLANG/LLVM BUILD
 SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] irqchip/mvebu: Allow EBU irqchips to be compile-tested
In-Reply-To: <20260510195047.10143-1-rosenp@gmail.com>
References: <20260510195047.10143-1-rosenp@gmail.com>
Date: Mon, 11 May 2026 15:45:02 +0200
Message-ID: <87qzni83hd.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sun, May 10 2026 at 12:50, Rosen Penev wrote:

> The Marvell EBU interrupt controller Kconfig symbols are hidden and
> selected only by platform code. This prevents build coverage for the
> drivers on other architectures even though the code only needs OF and
> MMIO support.
>
> Add COMPILE_TEST prompts and the required dependencies for the GICP,
> ICU, ODMI, PIC and SEI irqchips. While touching PIC for this coverage,
> use GENMASK() and BIT() for its masks so that 32-bit platforms can
> compile this safely without running into issues.

While touching PIC? That's related, but you want to prepare the PIC code
first in order to enable the compile test and not burry that change
within a gazillion lines of Kconfig muck.

>  config MVEBU_GICP
> +	bool "Marvell EBU GICP interrupt controller" if COMPILE_TEST
> +	depends on OF
> +	depends on HAS_IOMEM

  depends on OF && HAS_IOMEM

>  	select IRQ_MSI_LIB
> -	bool
> +	help
> +	  Support the Marvell EBU GICP interrupt controller.
>  
>  config MVEBU_ICU
> -	bool
> +	bool "Marvell EBU ICU interrupt controller" if COMPILE_TEST
> +	depends on OF
> +	depends on HAS_IOMEM
> +	select GENERIC_MSI_IRQ
> +	help
> +	  Support the Marvell EBU ICU interrupt controller.
>  
>  config MVEBU_ODMI
> -	bool
> +	bool "Marvell EBU ODMI interrupt controller" if COMPILE_TEST
> +	depends on OF
> +	depends on HAS_IOMEM
>  	select IRQ_MSI_LIB
>  	select GENERIC_MSI_IRQ

So while at it you can mop up this too. IRQ_MSI_LIB already selects
GENERIC_MSI_IRQ

> +	help
> +	  Support the Marvell EBU ODMI interrupt controller.
>  
>  config MVEBU_PIC
> -	bool
> +	bool "Marvell EBU PIC interrupt controller" if COMPILE_TEST
> +	depends on OF
> +	depends on HAS_IOMEM
> +	help
> +	  Support the Marvell EBU PIC interrupt controller.
>  
>  config MVEBU_SEI
> -        bool
> +	bool "Marvell EBU SEI interrupt controller" if COMPILE_TEST
> +	depends on OF
> +	depends on HAS_IOMEM
> +	help
> +	  Support the Marvell EBU SEI interrupt controller.

What ensures that IRQ_MSI_LIB is selected, when MVEBU_SEI is selected?

>  config LS_EXTIRQ
>  	bool "Freescale Layerscape external IRQ support" if COMPILE_TEST
> diff --git a/drivers/irqchip/irq-mvebu-pic.c b/drivers/irqchip/irq-mvebu-pic.c
> index 10b85128183a..95090d8efc06 100644
> --- a/drivers/irqchip/irq-mvebu-pic.c
> +++ b/drivers/irqchip/irq-mvebu-pic.c
> @@ -24,7 +24,7 @@
>  #define PIC_MASK	       0x4
>  
>  #define PIC_MAX_IRQS		32
> -#define PIC_MAX_IRQ_MASK	((1UL << PIC_MAX_IRQS) - 1)
> +#define PIC_MAX_IRQ_MASK	GENMASK(PIC_MAX_IRQS - 1, 0)

What guarantees that 'linux/bits.h' is included under all circumstances?

I'm really not impressed by this AI assisted slop at all.

Thanks,

        tglx

