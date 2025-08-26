Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CF4CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZULyMtTc2idS17UiaomIDWxS5E26GTUAPz4WEPqaGL4=; b=xlNBIxZH6/mHNYUfA5ibJvkhss
	8v1qOL0shxumgJvYAQ6sublh1oLmrmRPswzQk12txDUMouKQAFE+Tx/ysPWY/3aNTdgWU3ysa/w5g
	q9tbbOFc6Z9A8Wu1ZSXF6kq6gXeIUcpoMexk6e6inYmn2L80Olu1iM4ju43iG3m4v+V/WOP3drnXI
	GNPzxSopFQNwW4JjjlpAxXlRqtU1Rl80OOBW4ccC3mJ/aprOg229dPPx1/5UAUAx8wrDkHxpdwhTn
	5igphUfAg+kwENsaRpz59sxW50obSlzCa/l/QiKp5Gibe54fnszHWXk7ULUcrIbfyUfS7ArPagD1D
	Z7TrEnbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquXk-0000000CF7b-2MQP;
	Tue, 26 Aug 2025 14:21:00 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqu5b-0000000C9Vh-0ZAh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 13:51:57 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250826135149euoutp010d3a8a9f4af2f694f28ca5abfcec99a2~fVW3HsXoP1552315523euoutp01B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 13:51:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250826135149euoutp010d3a8a9f4af2f694f28ca5abfcec99a2~fVW3HsXoP1552315523euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756216309;
	bh=ZULyMtTc2idS17UiaomIDWxS5E26GTUAPz4WEPqaGL4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=bHjR9T+BR5tUnH4liPvral9SsKd+bJlZDHZ7KHtU61th59XkHPlp8XlAv5V5/Apz0
	 I1ntxc+wChLrrwb6cgx0ukA7lcBwo7AFtdeJR0JnCa79mGp/z4lkQ1Zze7SSSv5tl1
	 WSd83YJ7XtzSf7rYivTV8SqRgODkz8xMtITL0/8k=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250826135149eucas1p2ef79b300c589d967c1533100e84b4049~fVW2pkj3s2476024760eucas1p2-;
	Tue, 26 Aug 2025 13:51:49 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250826135146eusmtip2cb1cdc8b30562e52ddb197a8da8a70a9~fVWzxQpNd2140921409eusmtip2c;
	Tue, 26 Aug 2025 13:51:46 +0000 (GMT)
Message-ID: <8c861182-7e90-4bbf-ac04-173d59f5af69@samsung.com>
Date: Tue, 26 Aug 2025 15:51:45 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
To: Will McVicker <willmcvicker@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof
	Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob
	Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, John
	Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, Peter
	Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
	<andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250620181719.1399856-4-willmcvicker@google.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250826135149eucas1p2ef79b300c589d967c1533100e84b4049
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250620181827eucas1p297671b9a3783026020bb357d494c2e70
X-EPHeader: CA
X-CMS-RootMailID: 20250620181827eucas1p297671b9a3783026020bb357d494c2e70
References: <20250620181719.1399856-1-willmcvicker@google.com>
	<CGME20250620181827eucas1p297671b9a3783026020bb357d494c2e70@eucas1p2.samsung.com>
	<20250620181719.1399856-4-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_065155_772546_EF30E291 
X-CRM114-Status: GOOD (  21.20  )
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

On 20.06.2025 20:17, Will McVicker wrote:
> From: Hosung Kim <hosung0.kim@samsung.com>
>
> To allow the CPU to handle it's own clock events, we need to set the
> IRQF_PERCPU flag. This prevents the local timer interrupts from
> migrating to other CPUs.
>
> Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
> Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
> Signed-off-by: Will McVicker <willmcvicker@google.com>

This patch has been merged some time ago to v6.17-rc1 as commit 
f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer 
interrupts as percpu"). Recently I found that it breaks CPU hotplug 
support for some 'little' cores on Exynos5422 based boards, like 
OdroidXU3/XU4:

# for i in /sys/devices/system/cpu/cpu[1-9]; do echo 0 >$i/online; done
# for i in /sys/devices/system/cpu/cpu[1-9]; do echo 1 >$i/online; done
[  117.100195] CPU2: failed to come online
-bash: echo: write error: Input/output error
[  118.140426] CPU3: failed to come online
-bash: echo: write error: Input/output error
[  118.148428] CPU4: detected I-Cache line size mismatch, workaround 
enabled
[  118.169613] CPU5: detected I-Cache line size mismatch, workaround 
enabled
[  118.216802] CPU6: detected I-Cache line size mismatch, workaround 
enabled
[  118.283725] CPU7: detected I-Cache line size mismatch, workaround 
enabled
#

Frankly speaking I have no idea why this happens. CPU hotplug was always 
broken for the CPU0, but this is not relevant for this case. Maybe this 
PERCPU flag should be applied only on ARM64-based boards to avoid 
affecting legacy ARM 32bit cases?

> ---
>   drivers/clocksource/exynos_mct.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 96361d5dc57d..a5ef7d64b1c2 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -596,7 +596,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
>   			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
>   			if (request_irq(mct_irq,
>   					exynos4_mct_tick_isr,
> -					IRQF_TIMER | IRQF_NOBALANCING,
> +					IRQF_TIMER | IRQF_NOBALANCING |
> +					IRQF_PERCPU,
>   					pcpu_mevt->name, pcpu_mevt)) {
>   				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
>   									cpu);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


