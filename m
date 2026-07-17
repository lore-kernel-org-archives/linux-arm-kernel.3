Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2437C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vt8OGv0LOWuxwEqoxCWnUi3qmJywPj+Zf/7zdmhZMDg=; b=GnUU03kl2RsbMrdGHWA5XQsXGJ
	s3GiRF13gtfTbBCcTnfL5lVkfXm+HRtXZ8Frd7o9PFwpw2ej5ehOm48mc3KDZmWvq9Fuv6ad74Oxo
	sitjJJ0sX0F/Ghsi1M8xxtvrEAPHFjvLTY8e+F7tTnOXclnWrBZDFW4UjL0xb9lL5ZFTvDm2Lgrj/
	fDz7m6fI8wTkxzl8NmBIbcUBotKB8sJl6MHEomZhu2N4LM51sNhhXbNSR9zIztT1bNfEbdlKRWB7X
	qfgSia+LKsMfPVmkDtdt5KZXepc0drwb5fZ+/vvTWxzoxKdRUUwpXKDomdQfdNZgPDTMXPe0a7Jb4
	xBDveX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkc4l-00000001H1v-3cbf;
	Fri, 17 Jul 2026 06:29:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkc4k-00000001H1i-1uhp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 06:29:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2796E405E6;
	Fri, 17 Jul 2026 06:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25741F000E9;
	Fri, 17 Jul 2026 06:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784269774;
	bh=vt8OGv0LOWuxwEqoxCWnUi3qmJywPj+Zf/7zdmhZMDg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jQWnXn/gZ9d+ngHHYffqEyswTJpcv3dvrFX+fp69lrDhwhp+vl4Rm25w+/+TUD7LM
	 qX7x07iUjh2KB0LYZovBcztWpt95CWKHfMYyYFMdJnwWl5qRUy5bn08QIXa578jYLF
	 jpB3pz6gDCyFoxFSAgp1jZtdPboppUDsJ5kkJDvnb+iTN/fET8J6apsXHz7Vdip1AX
	 j1rpqTCe+LjZQra16etOQleDdrsuSz3ImmLlqsfjkP2xNG/x/3EBz1uzQt6PLr9MTk
	 8+CI9R1FYVK29dHyUdqJupzpYNu01PGAGBfU/FJELqLo5Q5MfLcNEdXOf6mcA56gd3
	 T/nbPqapn4Mqg==
Message-ID: <563ae255-a9a6-42f9-8f5f-77b341fed69f@kernel.org>
Date: Fri, 17 Jul 2026 09:29:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: lpc32xx: only run SoC init on LPC32xx hardware
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260713192506.7782-1-kmehltretter@gmail.com>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <20260713192506.7782-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 7/13/26 22:25, Karl Mehltretter wrote:
> lpc32xx_check_uid() and lpc32xx_pm_init() are arch_initcalls that poke
> LPC32xx-only registers. Since the multiplatform conversion they also
> run on other ARCH_MULTI_V5 boards where access faults e.g. on versatile:
> 
>    Unable to handle kernel paging request at virtual address f4004130
>    PC is at lpc32xx_check_uid+0x2c/0x9c
> 
> Drop the arch_initcall() registrations and call both functions directly
> from lpc3250_machine_init(), the machine's .init_machine hook.
> The calls are placed in link order (common.c, pm.c, phy3250.c) to
> keep their previous relative ordering.
> 
> Fixes: 75bf1bd7d2f9 ("ARM: lpc32xx: allow multiplatform build")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> v2:
>   - Rather than guarding the two arch_initcalls, drop the initcalls
>     entirely and call both functions from lpc3250_machine_init(), which
>     is already guarded properly. (Suggested by Arnd.)
> 
>   arch/arm/mach-lpc32xx/common.c  | 5 +----
>   arch/arm/mach-lpc32xx/common.h  | 2 ++
>   arch/arm/mach-lpc32xx/phy3250.c | 2 ++
>   arch/arm/mach-lpc32xx/pm.c      | 5 +----
>   4 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/mach-lpc32xx/common.c b/arch/arm/mach-lpc32xx/common.c
> index 304ea61a0716..35ed3569c5a3 100644
> --- a/arch/arm/mach-lpc32xx/common.c
> +++ b/arch/arm/mach-lpc32xx/common.c
> @@ -106,7 +106,7 @@ void __init lpc32xx_map_io(void)
>   	iotable_init(lpc32xx_io_desc, ARRAY_SIZE(lpc32xx_io_desc));
>   }
>   
> -static int __init lpc32xx_check_uid(void)
> +void __init lpc32xx_check_uid(void)
>   {
>   	u32 uid[4];
>   
> @@ -119,7 +119,4 @@ static int __init lpc32xx_check_uid(void)
>   		system_serial_low = uid[0];
>   		system_serial_high = uid[1];
>   	}
> -
> -	return 1;
>   }
> -arch_initcall(lpc32xx_check_uid);
> diff --git a/arch/arm/mach-lpc32xx/common.h b/arch/arm/mach-lpc32xx/common.h
> index 32f0ad217807..06b20bea324e 100644
> --- a/arch/arm/mach-lpc32xx/common.h
> +++ b/arch/arm/mach-lpc32xx/common.h
> @@ -16,6 +16,8 @@
>    * Other arch specific structures and functions
>    */
>   extern void __init lpc32xx_map_io(void);
> +extern void __init lpc32xx_check_uid(void);
> +extern void __init lpc32xx_pm_init(void);
>   extern void __init lpc32xx_serial_init(void);
>   
>   /*
> diff --git a/arch/arm/mach-lpc32xx/phy3250.c b/arch/arm/mach-lpc32xx/phy3250.c
> index 66701bf43248..ddc6333ca55d 100644
> --- a/arch/arm/mach-lpc32xx/phy3250.c
> +++ b/arch/arm/mach-lpc32xx/phy3250.c
> @@ -71,6 +71,8 @@ static const struct of_dev_auxdata lpc32xx_auxdata_lookup[] __initconst = {
>   
>   static void __init lpc3250_machine_init(void)
>   {
> +	lpc32xx_check_uid();
> +	lpc32xx_pm_init();
>   	lpc32xx_serial_init();
>   
>   	of_platform_default_populate(NULL, lpc32xx_auxdata_lookup, NULL);
> diff --git a/arch/arm/mach-lpc32xx/pm.c b/arch/arm/mach-lpc32xx/pm.c
> index 2572bd89a5e8..9b5c5e1462ed 100644
> --- a/arch/arm/mach-lpc32xx/pm.c
> +++ b/arch/arm/mach-lpc32xx/pm.c
> @@ -120,7 +120,7 @@ static const struct platform_suspend_ops lpc32xx_pm_ops = {
>   #define EMC_DYN_MEM_CTRL_OFS 0x20
>   #define EMC_SRMMC           (1 << 3)
>   #define EMC_CTRL_REG io_p2v(LPC32XX_EMC_BASE + EMC_DYN_MEM_CTRL_OFS)
> -static int __init lpc32xx_pm_init(void)
> +void __init lpc32xx_pm_init(void)
>   {
>   	/*
>   	 * Setup SDRAM self-refresh clock to automatically disable o
> @@ -129,7 +129,4 @@ static int __init lpc32xx_pm_init(void)
>   	__raw_writel(__raw_readl(EMC_CTRL_REG) | EMC_SRMMC, EMC_CTRL_REG);
>   
>   	suspend_set_ops(&lpc32xx_pm_ops);
> -
> -	return 0;
>   }
> -arch_initcall(lpc32xx_pm_init);

Reviewed-by: Vladimir Zapolskiy <vz@kernel.org>

-- 
Best wishes,
Vladimir

