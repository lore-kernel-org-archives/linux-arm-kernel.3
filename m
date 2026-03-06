Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B12F0181F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsd9xHQXwG0L/peVfvTrqZYVlLBD0w3lIYpT1q/1u0k=; b=4/59yBxhaPiZtkLzQjZ5cKZhjN
	buc7IDgpsGxA0r8vlo9ufWg9BXlEqV4pMLHM7qX2ujlK+Z71ya9EDVIM7enAXPHnRnaXvRrvfesBx
	io5wEsQrF3cU5zAIBawm/tc8RnfRK6Wvvaa51KcAMbTWKHW4a5EfBcHvV+huBOMs6Ib6FjZ1gNAHz
	57fwCt1Prs8zhr9kEHRJYTWMzO6gruGcA2LOkobOrBzK/Mzhm4NOKuy1tdE74ObjviVAfFLhrp0zW
	A59MjbIniSmlsitbsjoVGJg2XFoUCl/evVT93sUrrAN0CwT0bvqjHLKDzjndKq4CLGiMQnRDV6sgM
	aD0+YzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVy2-00000003stl-3U4E;
	Fri, 06 Mar 2026 14:15:50 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVxz-00000003ssz-40LY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:15:49 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-660ea8bcb96so4890927a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:15:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772806546; cv=none;
        d=google.com; s=arc-20240605;
        b=Wp7ZSSlGAKTGRwRGsapSqQ4GOxCH1a0IJ9vWJQoqye8bqkxOWOd1QS6ICeyhNg68mu
         eMqW5Cn4V71wXkKnzT7K1YkT+hnCjUpWAiG4UovgC8JSu+b2qrP45XDhde3woWfhlXaj
         Gwf4kRCrf8adga+EmltJXT2cv4tle8NotvA5Er5Z/mry/dg6Ze9BLjWCKmykOpvAUCnl
         OudP+Xr5mfQHjROw/jf9fV4/CvmOsrlalSioWy1mT9+RPw3P8jyM5A4lJotJpOXsqUTU
         u1rYe1HKRVITiwnBIwaa7iwKit9bmRfUx76DOkNOJifLym7cu8TS4QR7rWKNwIT84hl3
         gb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wsd9xHQXwG0L/peVfvTrqZYVlLBD0w3lIYpT1q/1u0k=;
        fh=qG/34N04BHv7zZuVoeyp8+7EptLJNWvH0f/XUexbHTQ=;
        b=btTsBoT4Xcdt0fhwt6pv2Ar0MTmR804vKwOYke+a7/WD2asPJYp+o1G6iqe2DGNC33
         f81iQnh5RU021MXrRcB5q7p7eQh2pyUFC1UHWvrQip8p6SGHbojr29RrAduNUj+55hf+
         nRgf5PWGE9fscaaKb/QcvPUX11T+do74cSxllcUZS9bedvt82Gush/pzOcFmtpKojEbP
         BbMsNQhxUDcEPbTN3MtpwYJLntvhTMYU9oyiCwTGvIj7afwRprijoInO69YH1qwVQ+w9
         v9P3usUB3FL7bp+XTG3LGbQwD/099lN/pbSfiCy+okbM2ocDgPokVQbwDgj+R/2OD+qn
         V5fA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772806546; x=1773411346; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wsd9xHQXwG0L/peVfvTrqZYVlLBD0w3lIYpT1q/1u0k=;
        b=ApLaZeji/RoZsJ1U2Sg/G/u6nX7C4cz8qqAtoGcuia+9PF4JMuXrF+pPvTfStxlmA1
         BeWXSQlHcFw5g7f141+zhXSM8PcCiQ68z19gcV1cgbhSpoHYczgwzIE0y+5jQmfUmz/1
         aVSYjPyorZ9z5n28t1/uSVk5j+D5jtB4CFtdGzhwVtqs3bN+ckRrlM3pTI5kXwqYK0RC
         SM0DO8YMHi+Ay5zQ37FYWBesmqu25mvoNgQDV4e/ijgEvLXbwYj57y7Jap/iDTSuKQrU
         hwLkYDgMuDbtcDyF8lNKH8WNUTi6u+g5aolfAttRuSWStCn2e43ti51Z4JeS4xuZdNUe
         kGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806546; x=1773411346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsd9xHQXwG0L/peVfvTrqZYVlLBD0w3lIYpT1q/1u0k=;
        b=sSvfMyAHE6i1qUUt5Ps+Md0TnkhW1GyBuNw7mymr2jYgAzWDX55Rn1F8uM7vDza5hD
         1dJQlTKeVZ/PpXDSxmcssLjv6S5539L/cNkjYNUzJxB90NA1P111nbI6zPjp1AaQ0GWX
         65CyU5sUk0f/+6/yLBkeyJxpQ8mSzk749GznCOeMNLmM+6PyApgXLYYl43+BfLuSeWYe
         AsrPo4uYgNuC5fcyvjqtD9Il798HwpS3Lo7oxRtul/s3G4AsFHMZljouV+CPX6oJpieL
         ezw6adDXv9/HIdFgfJO76bkpNTS9cFZjntZAI302atSVbIfcVhqc0eOJT4UUkH97Lhb5
         IcRw==
X-Forwarded-Encrypted: i=1; AJvYcCX1saSsWaweEwyoa0rNg+GtnpLOazFMRBqEqYJpcVy22eColvHJyOsIHgB6rs3yC00m1SvS9CeDGHZHgJY/IMFo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw10ItaYTztzSGrOJ/3hDXyWoZCTwgtC6nmlEmbaZR3UcooEw2q
	pY32FWfIxCSwwYMXIRip9vJh1fsSpdcKJLJc19KB2QwPhYun08XNMvnpLKNXaa1azbKjqG4wKwS
	vasUxXi1wkXyblNFA7vsQBHEl4t68/cABBzMR97jsxQ==
X-Gm-Gg: ATEYQzwT7LkL4Ai5MO4phJUYw4NtWSpftvpUBeEwiD2V5gvwr30KgsRWQ7Tkuf7wUW7
	YFQEfC7xLsZt+gWzG0wklx/BIVVrfhMHWDx1ejjkENm8Z+HCawGCUsyQ7qHULI167QXFWj6kuSX
	0G4RpXhf1t22cpK0/kWcD6iOla2NW1uRlow8Ozr/suCmwIkemRVCld35CIrUryOJtq7JHB8zxqs
	Enhrrm1BEsjqQk8QY05EK54m7Tn+9sTxAO/1lbBGJHEFDJOUQGg2htgSTfyq2h5yuxFbFdSKMma
	i8mZWRHD7OWl30gpAo6tWsYAtVGCYXIjJE/wdpHhsw==
X-Received: by 2002:a17:907:97cc:b0:b94:1722:fe4c with SMTP id
 a640c23a62f3a-b942e0b51aamr127144266b.33.1772806545787; Fri, 06 Mar 2026
 06:15:45 -0800 (PST)
MIME-Version: 1.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org> <20260226-exynos850-cpuhotplug-v1-7-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-7-71d7c4063382@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 14:15:34 +0000
X-Gm-Features: AaiRm50_59W0lqO5S3dEhyJtxjXmMUrxStP6qFX90WC4mn1HuOypqUtemGTXM44
Message-ID: <CADrjBPoLCDnvWocLYrg-zGRZNcBvPVYnUi4L7DA78m7QmkmQdQ@mail.gmail.com>
Subject: Re: [PATCH RFC 7/8] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_061548_043363_6F13895A 
X-CRM114-Status: GOOD (  28.82  )
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

Hi Alexey,

Thanks for your patch.

On Thu, 26 Feb 2026 at 15:47, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Some Exynos-based SoCs require specific set of writes/updates to PMU
> and PMU intr gen blocks in order to put a CPU or a group of CPUs into
> a different sleep states or prepare these entities for a CPU_OFF.
> The same is valid for a reverse procedures like wake-ups or CPU(s)
> online. Without these writes/updates the CPU(s) wake-up or online
> fails.
> Add support for Exynos850-based SoCs for PMU and PMU intr gen write/update
> sequences.
> While at this, also add description of Exynos850 PMU registers.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/soc/samsung/exynos-pmu.c            | 86 +++++++++++++++++++++++++++--
>  include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
>  2 files changed, 87 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index 0967fa56708a..7b9b8e22d91b 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -118,6 +118,10 @@ static const struct regmap_config regmap_pmu_intr = {
>         .use_raw_spinlock = true,
>  };
>
> +const struct exynos_pmu_data exynos850_pmu_data = {
> +       .pmu_cpuhp = true,
> +};
> +

You may want to consider having an e850-pmu.c file to contain the e850
specific data and hooks.

Andre recently moved some of the gs101-specific parts into gs101-pmu.c
(although not the actual gs101 online/offline hooks). Now that more
SoCs are being added it could be a good time for exynos-pmu to contain
only the generic code and the <soc>-pmu.c file having the
peculiarities/hooks for the specific SoC.

>  /*
>   * PMU platform driver and devicetree bindings.
>   */
> @@ -151,6 +155,7 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
>                 .compatible = "samsung,exynos7-pmu",
>         }, {
>                 .compatible = "samsung,exynos850-pmu",
> +               .data = &exynos850_pmu_data,
>         },
>         { /*sentinel*/ },
>  };
> @@ -229,6 +234,65 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
>  #define CPU_INFORM_CLEAR       0
>  #define CPU_INFORM_C2          1
>
> +static int __exynos850_cpu_pmu_online(unsigned int cpu)
> +       __must_hold(&pmu_context->cpupm_lock)
> +{
> +       u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
> +       u32 cluster_cpu = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
> +       unsigned int cpuhint = smp_processor_id();
> +       u32 reg, mask;
> +
> +       /* clear cpu inform hint */
> +       regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
> +                    CPU_INFORM_CLEAR);
> +
> +       mask = BIT(cpu);
> +
> +       regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
> +                          mask, (0 << cpu));
> +
> +       regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_UPEND, &reg);
> +
> +       regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_CLEAR,
> +                    reg & mask);
> +
> +       regmap_update_bits(pmu_context->pmureg,
> +                          EXYNOS850_CLUSTER_CPU_INT_EN(this_cluster, cluster_cpu),
> +                          1 << 3, 0 << 3);
> +       return 0;
> +}
> +
> +static int __exynos850_cpu_pmu_offline(unsigned int cpu)
> +       __must_hold(&pmu_context->cpupm_lock)
> +{
> +       u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
> +       u32 cluster_cpu = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
> +       unsigned int cpuhint = smp_processor_id();
> +       u32 reg, mask;
> +
> +       /* set cpu inform hint */
> +       regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
> +                    CPU_INFORM_C2);
> +
> +       mask = BIT(cpu);
> +       regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
> +                          mask, BIT(cpu));
> +
> +       regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
> +       regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
> +                    reg & mask);
> +
> +       mask = (BIT(cpu + 8));
> +       regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
> +       regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
> +                    reg & mask);
> +
> +       regmap_update_bits(pmu_context->pmureg,
> +                          EXYNOS850_CLUSTER_CPU_INT_EN(this_cluster, cluster_cpu),
> +                          1 << 3, 1 << 3);
> +       return 0;
> +}
> +
>  /*
>   * __gs101_cpu_pmu_ prefix functions are common code shared by CPU PM notifiers
>   * (CPUIdle) and CPU hotplug callbacks. Functions should be called with IRQs
> @@ -416,8 +480,12 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
>         void __iomem *virt_addr;
>         int ret, cpu;
>
> -       intr_gen_node = of_parse_phandle(dev->of_node,
> -                                        "google,pmu-intr-gen-syscon", 0);
> +       intr_gen_node = of_parse_phandle(dev->of_node, "samsung,pmu-intr-gen-syscon", 0);
> +
> +       /* Fall back to the google pmu intr gen property for older DTBs */
> +       if (!intr_gen_node)
> +               intr_gen_node = of_parse_phandle(dev->of_node, "google,pmu-intr-gen-syscon", 0);
> +
>         if (!intr_gen_node) {
>                 /*
>                  * To maintain support for older DTs that didn't specify syscon
> @@ -427,9 +495,19 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
>                 return 0;
>         }
>
> -       pmu_context->cpu_pmu_online = __gs101_cpu_pmu_online;
> -       pmu_context->cpu_pmu_offline = __gs101_cpu_pmu_offline;
> +       if (of_machine_is_compatible("google,gs101")) {
> +               pmu_context->cpu_pmu_online = __gs101_cpu_pmu_online;
> +               pmu_context->cpu_pmu_offline = __gs101_cpu_pmu_offline;
> +       }
> +
> +       if (of_machine_is_compatible("samsung,exynos850")) {
> +               pmu_context->cpu_pmu_online = __exynos850_cpu_pmu_online;
> +               pmu_context->cpu_pmu_offline = __exynos850_cpu_pmu_offline;
>

There should be no compatibles inside probe (that rule applies to all
drivers & subsystems). Instead use the driver match data
(exynos_pmu_data).

regards,

Peter

