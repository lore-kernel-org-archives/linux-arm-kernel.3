Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC101CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYzbQaZe2By8egkc4y3i3SJq/zpodmWP3KwwN0dNah4=; b=s9xbuulzmZsSMmwe/+5++dZNRL
	c+V4tNdym9osF9aGgVL5oxbtSgRLMRSEeqdxATFYfHTDYoH2d7hWgP/2tsI093sOK4pf1VadP3nf8
	XJtHnZbXdY9jgqOhx7zah6K2lpg4tdz1yr8vVsBypmhSoGmvhpn5m+a3ZMVUAUatUX30r6OxiW+uH
	k6FMmIO/oqJhSa0yOHJI9KTbFIz73vTUORJyCUCQU0FIqv+YX6rMkN2LgDZdw0zxnEQ/4ifatnUn5
	G/YjkAeFN6+WQz1ATOo7gIo728ZqrpH2NbFdBnoX727rX5IVo59BBvV4xn2acg7LtUWqWVpn2C3hO
	yxxybDLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFpC-00000009APH-3M4e;
	Fri, 24 Oct 2025 11:19:14 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFpA-00000009ANT-1dov
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 11:19:14 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251024111907euoutp016f006ad034319de511a72dfb50516be8~xaVX8g4f53225432254euoutp01W
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 11:19:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251024111907euoutp016f006ad034319de511a72dfb50516be8~xaVX8g4f53225432254euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761304747;
	bh=kYzbQaZe2By8egkc4y3i3SJq/zpodmWP3KwwN0dNah4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rrC+L+V3IoMA0ikgzSPgqXf00OP3ED2t8skXC4763eSm4erOWIVLZu42HIVJYN5Ba
	 bNk23cHfFowFDn3HxfDigeK/ifWvD0zZsfdYwd1oTxe9UcQhDq8P6zaTtJ6AlaBmPC
	 rTXla8dU5El0UPOtv3MxKTakKESkHobhfrNX9UMA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251024111906eucas1p20bb3f61c830ac6e5f776a9f5a2dd6afd~xaVXe-8wp3220332203eucas1p2l;
	Fri, 24 Oct 2025 11:19:06 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251024111904eusmtip131ad4a4bc1d1ab7f03a42110bd0da68d~xaVVgmqcF0896108961eusmtip1g;
	Fri, 24 Oct 2025 11:19:04 +0000 (GMT)
Message-ID: <c09387b9-3fcc-4d0e-8e29-21dee196014a@samsung.com>
Date: Fri, 24 Oct 2025 13:19:03 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 4/7] clocksource/drivers/exynos_mct: Use percpu
 interrupts only on ARM64
To: Will McVicker <willmcvicker@google.com>, Russell King
	<linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
	Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
	Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Ingo Molnar <mingo@kernel.org>, Peter
	Griffin <peter.griffin@linaro.org>, Youngmin Nam <youngmin.nam@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>, John Stultz <jstultz@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
	<andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251023205257.2029526-5-willmcvicker@google.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251024111906eucas1p20bb3f61c830ac6e5f776a9f5a2dd6afd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251023205313eucas1p2164ef0c1db80bccd2bbd6a79e809a1cb
X-EPHeader: CA
X-CMS-RootMailID: 20251023205313eucas1p2164ef0c1db80bccd2bbd6a79e809a1cb
References: <20251023205257.2029526-1-willmcvicker@google.com>
	<CGME20251023205313eucas1p2164ef0c1db80bccd2bbd6a79e809a1cb@eucas1p2.samsung.com>
	<20251023205257.2029526-5-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_041912_713738_51055FA7 
X-CRM114-Status: GOOD (  17.15  )
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

On 23.10.2025 22:52, Will McVicker wrote:
> From: Marek Szyprowski <m.szyprowski@samsung.com>
>
> For some unknown reasons forcing percpu interrupts for local timers
> breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
> machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
> flag only when driver is compiled for newer ARM64 architecture.
>
> Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")

This tag doesn't make sense in this patchset. Simply squash this change 
with the previous one, adding the following tags:

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: 
https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprowski@samsung.com/ 

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/clocksource/exynos_mct.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index a5ef7d64b1c2..1429b9d03a58 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -597,7 +597,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
>   			if (request_irq(mct_irq,
>   					exynos4_mct_tick_isr,
>   					IRQF_TIMER | IRQF_NOBALANCING |
> -					IRQF_PERCPU,
> +					(IS_ENABLED(CONFIG_ARM64) ?
> +					 IRQF_PERCPU : 0),
>   					pcpu_mevt->name, pcpu_mevt)) {
>   				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
>   									cpu);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


