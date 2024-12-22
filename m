Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CE7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 14:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEgpgPcyCg7jDwysVxgFPHsSofyHT1zBrfeYXN+E8VA=; b=kIe9qVAwadh6aXDpEnuhpP8MTm
	H3b2q+fsMLrPseoQ8YyMkz8r4IN8FOwPr6D7r/UcrglWb2XdsDXOEPyrGuUnCPvmOp+O+NLZvnKVT
	Jvb36CsJgdB+Q4KT/+WisWR9Gv9fGRGPf7YtOGVsqoOKwT7Gdkgi/TGRRkvz3ZWr5Wcf2L3sRl9NC
	GAAEXlbmQxmV2GFzUaZ9wlhHRvhuhv5ziHTVXNfSmkktyS8tzECrlMUdaW1renefYpgSyqTyxtv1s
	jZkQNMdJyjxxKftPQCHCE8pxx9zN7JGu3tgiaVFWl+Oaq2pw4rIrpuhqBuAm8X+THvnm0qX131u4k
	Bbjtfkag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPN1K-00000008OM3-3X0D;
	Sun, 22 Dec 2024 14:33:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPMsV-00000008N7n-38LF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 14:24:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AFF45C4A0E;
	Sun, 22 Dec 2024 14:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C783C4CEDC;
	Sun, 22 Dec 2024 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734877459;
	bh=0XcZORZTYCC8Zsw33n+0LgRXzG40hhH2RqpgjdwCwhE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PkkAXBZb9TGY0K7hOXgzRvYEdaZZgkETkLX4L7yI+IGjpFqSTODldC6ewGhBfrNVe
	 8m0gQW8KXjEuMRxdoQR4ehPMGkdMBo5pI53dbhMj+hybUWrGU3l4e93b/vNY9uiN/M
	 MJ6JSsZ7eAaXWvHTOHmq0Mcf2krJTCOfkv6ULOi6h8JQwW2raWXLIur2IEW585TQ2O
	 dOY7zH7BnaPRXtB+98sYHhJpHT+nrYQHlvIIOofUASxpRLVRfp8mcRyPes7G8EOLY7
	 mIItlupS0xvHYunHHvar3TumKvvGVw22gIDxQDzKRg6X7fu7gzg2BfS+xAi3EkmBA+
	 9gcBjkQUmXYHA==
Message-ID: <fbdeffe0-c908-4df1-9096-350a7d330570@kernel.org>
Date: Sun, 22 Dec 2024 13:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] soc: samsung: exynos-pmu: enable CPU hotplug support
 for gs101
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com,
 kernel-team@android.com
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
 <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-4-c72978f63713@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-4-c72978f63713@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_062419_920341_1B52EE71 
X-CRM114-Status: GOOD (  18.69  )
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

On 13/12/2024 17:44, Peter Griffin wrote:
>  /*
> @@ -325,6 +328,52 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
>  
> +/*
> + * CPU_INFORM register hint values which are used by
> + * EL3 firmware (el3mon).
> + */
> +#define CPU_INFORM_CLEAR	0
> +#define CPU_INFORM_C2		1
> +
> +static int cpuhp_pmu_online(unsigned int cpu)

exynos_cpuhp_pmu_online
or gs101_cpuhp_pmu_online
same for offline

> +{
> +	void __iomem *base = pmu_context->pmuintrgen_base;
> +	u32 reg;
> +	u32 mask;
> +
> +	/* clear cpu inform hint */
> +	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
> +		     CPU_INFORM_CLEAR);
> +
> +	mask = (1 << cpu);

BIT(cpu)

> +
> +	writel(((0 << cpu) & mask), base + GS101_GRP2_INTR_BID_ENABLE);

I am not sure if I follow. You want to zero-out all other bits or enable
all other bits?

> +
> +	reg = readl(base + GS101_GRP2_INTR_BID_UPEND) & mask;
> +	writel(reg & mask, base + GS101_GRP2_INTR_BID_CLEAR);

reg is &mask twice.

I don't follow this either, are these auto-cleared? It feels like you
wanted to update some bits, but you are updating entire registers in
both cases.


> +
> +	return 0;
> +}
> +
> +static int cpuhp_pmu_offline(unsigned int cpu)
> +{
> +	void __iomem *base = pmu_context->pmuintrgen_base;
> +	u32 reg, mask;
> +
> +	/* set cpu inform hint */
> +	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
> +		     CPU_INFORM_C2);
> +
> +	writel((1 << cpu), base + GS101_GRP2_INTR_BID_ENABLE);
> +
> +	mask = ((1 << cpu) | (1 << (cpu+8)));

What does 8 stands for?

> +
> +	reg = readl(base + GS101_GRP1_INTR_BID_UPEND) & mask;
> +	writel(reg & mask, base + GS101_GRP1_INTR_BID_CLEAR);
> +
> +	return 0;
> +}
> +
>  static int exynos_pmu_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -377,6 +426,28 @@ static int exynos_pmu_probe(struct platform_device *pdev)
>  	pmu_context->pmureg = regmap;
>  	pmu_context->dev = dev;
>  
> +	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) {
> +

Drop blank line

> +		pmu_context->pmuintrgen_base =
> +			devm_platform_ioremap_resource_byname(pdev, "pmu-intr-gen");
> +		/*
> +		 * To maintain support for older DTs that didn't specify pmu-intr-gen
> +		 * register region, just issue a warning rather than fail to probe.
> +		 */
> +		if (IS_ERR(pmu_context->pmuintrgen_base)) {
> +			dev_warn(&pdev->dev,
> +				 "failed to map pmu-intr-gen registers\n");

Test old DTS, I think you do write() to the ERR_PTR when
offlining/onlining...

> +		} else {
> +			cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,
> +					"soc/exynos-pmu:prepare",
> +					cpuhp_pmu_online, NULL);
> +
> +			cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +					"soc/exynos-pmu:online",
> +					NULL, cpuhp_pmu_offline);
> +		}
> +	}
> +
>  	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_init)
>  		pmu_context->pmu_data->pmu_init();
>  



Best regards,
Krzysztof

