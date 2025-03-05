Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7167CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hi3lb83o4Mx/JDUwSimDORw8AZUwvlawfiEKSRI9jhA=; b=yCxtll0oxzk2VwcCPi8we2PD/M
	neVAsV7kaaaZI3/NAd/xmrzCUmfHqsRhwgdce1NW7OSyEVgwKSJb6htLxrfV7tvKrlMlxIa6kkm2Y
	mSz9YySxgr1Q1UpzczDiuxwTK1dSA+lCv2C77BA1/2PuflDdRkoMrVuPxZ4iAXOuPwWKMpbizaIs0
	zFRWP2tToTjIF3B2CHGElvojqaxXB0Zm3PnJaBwdLXWVYOjwKcVYOa6aOHPI7VrBynkjA2jJjo2gc
	Ll1+hDIpw2C488TC5RrwYRbyCxDkALRcgPbT/9yT46WcpwbPkOj8MIumYQkk+RWetgo4+6T0G7UzC
	i92od57w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvmi-00000009Hi5-173c;
	Wed, 05 Mar 2025 20:56:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvUU-00000009F0b-3EHe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 20:37:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2BE29A460A9;
	Wed,  5 Mar 2025 20:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AFFBC4CED1;
	Wed,  5 Mar 2025 20:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741207037;
	bh=kc8GnKy2/k0p40SmNBMlY8YXsE2cIHImyde1WkmdQgk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=S9e/BATt0zrHcP3OeKno3G5WCfyLYnsSZ9kd4u0NuysbnHADrvKJHWTt1fYBwH89g
	 opw0tBV7p3BurcsIYO2FkQTFc1FJ5T0r+b5OQx1fi2PRxH5zbr98B2pEXoWqdNw2tE
	 KMxERN6wJMzhPT+mQoUKpY7tQl0zq6bkepCOdR9ZYL7DTrPIjbct7Yjl6IaM8hi9wo
	 RaAuULk794YvF/aS3NSv0vvnlBLnaQzcq6ui6DL36oFxaIAeYoB62OWQN8gStp/nc1
	 /IElfEfhDDDl8tFlTIhUWZLV5jCU6bOUAJUiOzeoInmg9siTjibZQiqLO5NwyqBgJG
	 MuD6lyhf4j/8g==
Message-ID: <aacbf2c0-1fda-4ce6-a04b-69663a34f0a0@kernel.org>
Date: Wed, 5 Mar 2025 21:37:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] clk: samsung: add initial exynos7870 clock driver
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Kaustabh Chakraborty <kauschluss@disroot.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org>
 <20250301-exynos7870-pmu-clocks-v5-2-715b646d5206@disroot.org>
 <b4fb36bc3970293ebdf1ac793bb3d752.sboyd@kernel.org>
 <0a7c72cb-4b59-4146-8438-52d13b457a18@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <0a7c72cb-4b59-4146-8438-52d13b457a18@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_123718_940677_F5F8E625 
X-CRM114-Status: GOOD (  23.26  )
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

On 05/03/2025 21:14, Krzysztof Kozlowski wrote:
> On 04/03/2025 19:16, Stephen Boyd wrote:
>> Quoting Kaustabh Chakraborty (2025-02-28 19:57:13)
>>> diff --git a/drivers/clk/samsung/clk-exynos7870.c b/drivers/clk/samsung/clk-exynos7870.c
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..2ec4a4e489be30bd1cd2e6deac006bb8ac5bdc57
>>> --- /dev/null
>>> +++ b/drivers/clk/samsung/clk-exynos7870.c
>>> @@ -0,0 +1,1830 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (C) 2015 Samsung Electronics Co., Ltd.
>>> + * Author: Kaustabh Chakraborty <kauschluss@disroot.org>
>>> + *
>>> + * Common Clock Framework support for Exynos7870.
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>
>> Please remove this include as this is a clk provider and not a clk
>> consumer.
> 
> 
> I fixed it up for all drivers.
> 
>>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/platform_device.h>
>>> +
>>> +#include <dt-bindings/clock/samsung,exynos7870-cmu.h>
>>> +
>>> +#include "clk.h"
>>> +#include "clk-exynos-arm64.h"
>>> +
>>> +/*
>>> + * Register offsets for CMU_MIF (0x10460000)
>>> + */
>> [...]
>>> +
>>> +static const struct samsung_cmu_info peri_cmu_info __initconst = {
>>> +       .gate_clks              = peri_gate_clks,
>>> +       .nr_gate_clks           = ARRAY_SIZE(peri_gate_clks),
>>> +       .clk_regs               = peri_clk_regs,
>>> +       .nr_clk_regs            = ARRAY_SIZE(peri_clk_regs),
>>> +       .nr_clk_ids             = PERI_NR_CLK,
>>> +};
>>> +
>>> +static int __init exynos7870_cmu_probe(struct platform_device *pdev)
>>> +{
>>> +       const struct samsung_cmu_info *info;
>>> +       struct device *dev = &pdev->dev;
>>> +
>>> +       info = of_device_get_match_data(dev);
>>
>> Use device APIs please: device_get_match_data()
> 
> 
> I expect here a follow up patch.
> 
>>
>>> +       exynos_arm64_register_cmu(dev, dev->of_node, info);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static const struct of_device_id exynos7870_cmu_of_match[] = {
>>> +       {
>>> +               .compatible = "samsung,exynos7870-cmu-mif",
>>> +               .data = &mif_cmu_info,
>>> +       }, {
>>> +               .compatible = "samsung,exynos7870-cmu-dispaud",
>>> +               .data = &dispaud_cmu_info,
>>> +       }, {
>>> +               .compatible = "samsung,exynos7870-cmu-fsys",
>>> +               .data = &fsys_cmu_info,
>>> +       }, {
>>> +               .compatible = "samsung,exynos7870-cmu-g3d",
>>> +               .data = &g3d_cmu_info,
>>> +       }, {
>>> +               .compatible = "samsung,exynos7870-cmu-isp",
>>> +               .data = &isp_cmu_info,
>>> +       }, {
>>> +               .compatible = "samsung,exynos7870-cmu-mfcmscl",
>>> +               .data = &mfcmscl_cmu_info,
>>> +       }, {
>>> +               .compatible = "samsung,exynos7870-cmu-peri",
>>> +               .data = &peri_cmu_info,
>>> +       }, {
>>> +       },
>>> +};
>>> +
>>> +static struct platform_driver exynos7870_cmu_driver __refdata = {
>>
>> Having __refdata here looks wrong.
>>
>>> +       .driver = {
>>> +               .name = "exynos7870-cmu",
>>> +               .of_match_table = exynos7870_cmu_of_match,
>>> +               .suppress_bind_attrs = true,
>>> +       },
>>> +       .probe = exynos7870_cmu_probe,
>>> +};
>>> +
>>> +static int __init exynos7870_cmu_init(void)
>>> +{
>>> +       return platform_driver_register(&exynos7870_cmu_driver);
>>
>> Is this supposed to be platform_driver_probe()? All the __init markings
>> in the samsung clk driver look like potential problems if anything
>> defers or is made into a module.
> 
> Indeed code is confusing but still correct. This is called from
> core_initcall and nothing referencing __init/refdata can defer nor be a
> module. There are modules but, AFAIR, they don't use __init/__refdata.
> 
> The __refdata here was probably so this can reference __initconst in
> other places.
> 
> As you pointed out, probably the correct solution is to use
> platform_driver_probe().
I'll fix this and existing drivers.

Best regards,
Krzysztof

