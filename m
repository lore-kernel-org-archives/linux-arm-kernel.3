Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9803ACA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDLKHxEV4hBOubU1hA0pF3KKCXpZ9u6NZsKj3VxloXA=; b=dieY55r6L+cysR/CsKDoyNOnhI
	wKUwYK8fnTrywZOnQga4wwpEnOZqcRbIiekvi8gomP5QnCkSx/80TSjmBMJQ6vxFgWjdwpJooK5yA
	ULl8xymKJ0O5G9mVY+Usx4X5bOzT3uRRmXXQ4l3eDb27Z9TqlmiPjRVjlc9vd7LbnXEGN/gcp5HY/
	yyRYmUNVsfPmvuTwyNjRkEiRgivXrtZrdQHI2Xa9m7G3UovIqXK1HCTAzXLIjBEEAgtgT3Pp389bw
	mlHaGIAH2b0Ou9arD1nmyyfJd16iEmDDC1J0Gv74NXfutpcx9Kz4D7j9xksKwo49YsK5lcJZ1ouFa
	AWUxopSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGZE-0000000EFWB-3trF;
	Thu, 04 Sep 2025 20:28:25 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuE5x-0000000DMmv-0B0n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 17:50:03 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250904174955euoutp02cd4f55a7f9d83dc71791f5ebf8591437~iJaUEwTBr3046630466euoutp02W
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 17:49:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250904174955euoutp02cd4f55a7f9d83dc71791f5ebf8591437~iJaUEwTBr3046630466euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757008195;
	bh=xDLKHxEV4hBOubU1hA0pF3KKCXpZ9u6NZsKj3VxloXA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=LM51+XH5yTExcGU88pRP1td8ngDXTxUnoaAgoRNqnWz/70AD7Ccf55vCTccn3Y1e1
	 skSBgRtje2OwcDcspXfx8EsJZppo7vJ3/+u1tFeWyH17BrFvQenRtdMJZdKVqqmnWh
	 TlsVqtdLkH5CDFGLBHQqW2Gd8LOWK5bee0Juq7IE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250904174953eucas1p17f0b6acef323d0a44b84b8ab177041cb~iJaS00zsD2322323223eucas1p1H;
	Thu,  4 Sep 2025 17:49:53 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250904174952eusmtip2cc300941d5463e8178ab6192d3bf54a1~iJaRhhG0z0094500945eusmtip2X;
	Thu,  4 Sep 2025 17:49:52 +0000 (GMT)
Message-ID: <28a9be50-2432-49b5-b10c-bf8b4f9ebd8b@samsung.com>
Date: Thu, 4 Sep 2025 19:49:52 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: only use IRQF_PERCPU
 flag on ARM64 SoCs
To: Peter Griffin <peter.griffin@linaro.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof
	Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ingo
	Molnar <mingo@kernel.org>, Will McVicker <willmcvicker@google.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, John Stultz
	<jstultz@google.com>, kernel-team@android.com, youngmin.nam@samsung.com,
	hoony.yu@samsung.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250904-exynos-mct-arm32-cpuhp-regression-v1-1-5d9e4dd356ab@linaro.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250904174953eucas1p17f0b6acef323d0a44b84b8ab177041cb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250904153242eucas1p12841f999bf68861f7386b0c9f3f4f60f
X-EPHeader: CA
X-CMS-RootMailID: 20250904153242eucas1p12841f999bf68861f7386b0c9f3f4f60f
References: <CGME20250904153242eucas1p12841f999bf68861f7386b0c9f3f4f60f@eucas1p1.samsung.com>
	<20250904-exynos-mct-arm32-cpuhp-regression-v1-1-5d9e4dd356ab@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_105001_674934_A0A4798B 
X-CRM114-Status: GOOD (  26.39  )
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

On 04.09.2025 17:32, Peter Griffin wrote:
> This patch addresses a regression reported in [1] whereby CPU hotplug now
> fails on little CPUs (for reasons that aren't fully understood) for Arm
> 32bit platforms such as Exynos 5422 used in OdroidXU3/XU4 boards.
>
> Note: This patch makes an assumption that the exynos_mct driver is only
> used on Arm 32/64 bit SoCs.
>
> Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/lkml/8c861182-7e90-4bbf-ac04-173d59f5af69@samsung.com/
> Link: https://lore.kernel.org/lkml/8c861182-7e90-4bbf-ac04-173d59f5af69@samsung.com/ [1]
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Hi Marek & Krzysztof,
>      
> Can you test this patch on your Exynos5422 based boards and see if it
> resolves the issue Marek reported of CPU hot plug failing on the little
> cores of Exynos 5422 based boards?
>
> Unfortunately I only have gs101 based Exynos hardware (which is Arm 64 bit
> SoC) to test on. I can confirm CPU hotplug is functional on the little
> cluster CPUs with IRQF_PERCPU flag on Pixel6/gs101 though.

This is a duplicate of 
https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprowski@samsung.com/

and yes, it fixes the reported issue.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> Thanks,
>
> Peter
> ---
> ---
>   drivers/clocksource/exynos_mct.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 62febeb4e1decec7f5db104db395884824563915..91d79b73a96a7e8a354d803c2b497bcde92af8d8 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -532,6 +532,16 @@ static int __init exynos4_timer_resources(struct device_node *np)
>   	return 0;
>   }
>   
> +/*
> + * For reasons that aren't fully understood IRQF_PERCPU breaks CPU hotplug on
> + * little cores of ARM 32 bit SoCs like Exynos5422 used in OdroidXU3/4 boards.
> + */
> +#if defined(CONFIG_ARM64) || defined(CONFIG_COMPILE_TEST)
> +#define MCT_IRQ_FLAGS (IRQF_TIMER | IRQF_NOBALANCING | IRQF_PERCPU)
> +#elif defined(CONFIG_ARM)
> +#define MCT_IRQ_FLAGS (IRQF_TIMER | IRQF_NOBALANCING)
> +#endif
> +
>   /**
>    * exynos4_timer_interrupts - initialize MCT interrupts
>    * @np: device node for MCT
> @@ -602,8 +612,7 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
>   			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
>   			if (request_irq(mct_irq,
>   					exynos4_mct_tick_isr,
> -					IRQF_TIMER | IRQF_NOBALANCING |
> -					IRQF_PERCPU,
> +					MCT_IRQ_FLAGS,
>   					pcpu_mevt->name, pcpu_mevt)) {
>   				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
>   									cpu);
>
> ---
> base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010
> change-id: 20250904-exynos-mct-arm32-cpuhp-regression-14f321e4a591
>
> Best regards,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


