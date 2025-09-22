Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A902CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQRpOTdPlsJ/I3ie9xITMLFON03T608didGjNtYqmd8=; b=2K83lHtKK6fj6auWx/50A7iEDn
	NODHTpx0zU4Z5tCYSiK11WfDtGCMibF9QYkfSnVDQ8QQeR+T99x8rz2Kme6GtmSeOGuqmJcfv6171
	wR4PBU+4kf1wH6gmGe4RlAv2GLoeiq1Ruwfe4cly7GS+Bz8b7RPRvz1T//pdZ6gWJ3pe5TrS50kw8
	4rLEsuX8RothxZ+/5+CHKp8LmYG1SMVNjLPrSK/xvi2k7kwbf6iqb/LxuWjxq0ychCbiTiU74CFmd
	caUXUTAJ8PfqW2sISVmyv+2hHJAP/q4nV2FPIoj+Ru7SL6k4CyzZPIcUhM5Cg0tJQ+xhLpBadMJ5k
	adsYEqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bRr-00000009Zgd-1PLy;
	Mon, 22 Sep 2025 07:58:59 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bRp-00000009ZfC-146F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 07:58:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45f29e5e89bso49023575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 00:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758527935; x=1759132735; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQRpOTdPlsJ/I3ie9xITMLFON03T608didGjNtYqmd8=;
        b=tDxcXonZzx2UFVytHvG/6xZDps7Xicj7Oh1CRNcPgV0T7fmTfTz/VIkMGSyb+H/bXh
         jaUhlTQK4xm8f9INnRdgogbWkJ1jlO5/rZMGvr7ymq6fN3f2mEzPC2EJB/1WSMrk5025
         wxLsaJFZZxnH+JeNUbmxMQVGN7RZtel3BX5DPDvUfp1R9N61n5aYFwST/U1KfM1CKCnc
         08q1/KDQMP0tWJpSYDbBH2mfyZWKBeU8suCp5InPszkh2cNCnGPFH3okgTkuuBUY8eJf
         QPYTJQjOuUOF0U16R76KSbKxn/JWlmkfiFpQ38KRtBFXMXJvhDr7dn/YkjqqOQ6kOuAU
         4xAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758527935; x=1759132735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQRpOTdPlsJ/I3ie9xITMLFON03T608didGjNtYqmd8=;
        b=lBah/7Dcekf3aMt8BUS52XfVvV1Gqz0jFw0zeeWtzr52av07ANptvGMgttOy9PNzrY
         XzrRZd8xM81ijq1qIq2MGJLHiK1aTB3qNi6cBzSfRp99fuIwYDOX/AnUZng7V0/amj1m
         hz4VneBNhMqbLtATwvT12LdTL0qriU34XT/ZuQctGsijWExAHMwg/EqSoeGUjFspOqMO
         UrOhYtsHTwztWjhYhJhkhzUuTAzTziDgvXwKBeyn49DcFpwKDXiOmgGjETigDBdVgOJX
         T5SF3Kj+EWHZHfiqo7w8ukgVa0oSEJ8qpvcHVlqs/Y/VDvayX0q9+D+UTEQM6YZn+qzM
         kKQA==
X-Forwarded-Encrypted: i=1; AJvYcCX7VNiYIDDoKoU31YmUY9TekjpJbCRhAfsNWu2+VPxSSBmrtWdLKB1EjlyUG0bkJlCVPdmc4RhtkB5LDPkfvTJR@lists.infradead.org
X-Gm-Message-State: AOJu0YziDx/ovRlQzCqu/wv0aR8yZFVrCgnFtl4DgcPuABwfGl0KRoGW
	DwxSw/6wyXBf/cLfWITqAtrdVb6UOsxI63iBDxVRu3Nc2FIb5uFMZaGeiC6AERlhpC0=
X-Gm-Gg: ASbGncsgGlmP2B5Wrr2uN1yTutuRJGMSr9lkSKeI52D5fTPphl6JMev7hMQzNcup6I/
	PmY0qiDUwInJhfTpRdLBuVhfm61fYCTi1838lWSMTyhKUMzMA7rUhiNQk2iLQcprEwM55vjx4VX
	2nv+7cWfaXeLeyC6sFxpg51UZ8a4U2uf65H1IhThsKPw9bQz8ojrgtgYOW2B1vNsMxJwGJ1y4vm
	qnL9BYWMXOD9st5NOUB71/s8B8gDyjCLYpRkASnwR/HHCUiihC4znqYp/MnB99gRgko0lQy98Xl
	E/m5j6e4vXnwYfhzDxtNQs/rHdvRKICcMt8H0iDbP80rcMUW1Yl3RyZaWsIgBqTbwguC+JXQr7N
	fpQaaPs5xUIPdCMt1CoMEBO9MycRqvxCi
X-Google-Smtp-Source: AGHT+IGv/gvgtd+VyFOGRY+JKmS6raLqaaGrk4Saz9mqQNEkVwU+lxnyBc+9ONztYTEGxxuU7e9nsg==
X-Received: by 2002:a05:600c:3555:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-467eb048bafmr104267165e9.26.1758527934709;
        Mon, 22 Sep 2025 00:58:54 -0700 (PDT)
Received: from [10.11.12.107] ([79.118.185.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac3fdsm186423945e9.1.2025.09.22.00.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 00:58:54 -0700 (PDT)
Message-ID: <905d8c89-56d3-40c9-928f-d6418a0f9193@linaro.org>
Date: Mon, 22 Sep 2025 08:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] clk: samsung: add Exynos ACPM clock driver
To: Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
 <20250908-acpm-clk-v4-4-633350c0c0b1@linaro.org>
 <175848703636.4354.2936744718103927060@lazor>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <175848703636.4354.2936744718103927060@lazor>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_005857_635465_26E7A585 
X-CRM114-Status: GOOD (  29.13  )
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

Hi, Stephen,

On 9/21/25 9:37 PM, Stephen Boyd wrote:
> Quoting Tudor Ambarus (2025-09-08 06:12:45)
>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
>> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
>> --- a/drivers/clk/samsung/Kconfig
>> +++ b/drivers/clk/samsung/Kconfig
>> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
>>           status of the certains clocks from SoC, but it could also be tied to
>>           other devices as an input clock.
>>  
>> +config EXYNOS_ACPM_CLK
>> +       tristate "Clock driver controlled via ACPM interface"
>> +       depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
> 
> Why is COMPILE_TEST limited to !EXYNOS_ACPM_PROTOCOL?


otherwise on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:
ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko] undefined!

> 
>> +       help
>> +         This driver provides support for clocks that are controlled by
>> +         firmware that implements the ACPM interface.
>> +
>> +         This driver uses the ACPM interface to interact with the firmware
>> +         providing all the clock controlls.
>> +
>>  config TESLA_FSD_COMMON_CLK
>>         bool "Tesla FSD clock controller support" if COMPILE_TEST
>>         depends on COMMON_CLK_SAMSUNG
>> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8566495265ee3e06dbf370f9e424d5540f5c7457
>> --- /dev/null
>> +++ b/drivers/clk/samsung/clk-acpm.c
>> @@ -0,0 +1,184 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Samsung Exynos ACPM protocol based clock driver.
>> + *
>> + * Copyright 2025 Linaro Ltd.
>> + */
>> +
>> +#include <linux/array_size.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
> 
> Is this include used?

ah, it's no longer used, I'll drop it, thanks!
> 
>> +#include <linux/platform_device.h>
>> +#include <linux/types.h>
> 
> Are you avoiding kernel.h? If so, please include container_of.h and

I tend to include just what's needed, yes. kernel.h has some things that
are not yet needed in this driver.

> device/devres.h to avoid implicit includes.

Will add the two and recheck whether I rely on implicit includes somewhere else.

>> +
>> +struct acpm_clk {
>> +       u32 id;
>> +       struct clk_hw hw;
>> +       unsigned int mbox_chan_id;
>> +       const struct acpm_handle *handle;
>> +};
>> +
>> +struct acpm_clk_variant {
>> +       const char *name;
>> +};
>> +
>> +struct acpm_clk_driver_data {
>> +       const struct acpm_clk_variant *clks;
>> +       unsigned int nr_clks;
>> +       unsigned int mbox_chan_id;
>> +};
>> +
>> +#define to_acpm_clk(clk) container_of(clk, struct acpm_clk, hw)
>> +
>> +#define ACPM_CLK(cname)                                        \
>> +       {                                               \
>> +               .name           = cname,                \
>> +       }
>> +
>> +static const struct acpm_clk_variant gs101_acpm_clks[] = {
>> +       ACPM_CLK("mif"),
>> +       ACPM_CLK("int"),
>> +       ACPM_CLK("cpucl0"),
>> +       ACPM_CLK("cpucl1"),
>> +       ACPM_CLK("cpucl2"),
>> +       ACPM_CLK("g3d"),
>> +       ACPM_CLK("g3dl2"),
>> +       ACPM_CLK("tpu"),
>> +       ACPM_CLK("intcam"),
>> +       ACPM_CLK("tnr"),
>> +       ACPM_CLK("cam"),
>> +       ACPM_CLK("mfc"),
>> +       ACPM_CLK("disp"),
>> +       ACPM_CLK("b0"),
>> +};
>> +
>> +static const struct acpm_clk_driver_data acpm_clk_gs101 = {
>> +       .clks = gs101_acpm_clks,
>> +       .nr_clks = ARRAY_SIZE(gs101_acpm_clks),
>> +       .mbox_chan_id = 0,
>> +};
>> +
>> +static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
>> +                                         unsigned long parent_rate)
>> +{
>> +       struct acpm_clk *clk = to_acpm_clk(hw);
>> +
>> +       return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
>> +                                       clk->mbox_chan_id, clk->id, 0);
>> +}
>> +
>> +static int acpm_clk_determine_rate(struct clk_hw *hw,
>> +                                  struct clk_rate_request *req)
>> +{
>> +       /*
>> +        * We can't figure out what rate it will be, so just return the
>> +        * rate back to the caller. acpm_clk_recalc_rate() will be called
>> +        * after the rate is set and we'll know what rate the clock is
>> +        * running at then.
>> +        */
>> +       return 0;
>> +}
>> +
>> +static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>> +                            unsigned long parent_rate)
>> +{
>> +       struct acpm_clk *clk = to_acpm_clk(hw);
>> +
>> +       return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
>> +                                       clk->mbox_chan_id, clk->id, rate);
>> +}
>> +
>> +static const struct clk_ops acpm_clk_ops = {
>> +       .recalc_rate = acpm_clk_recalc_rate,
>> +       .determine_rate = acpm_clk_determine_rate,
>> +       .set_rate = acpm_clk_set_rate,
>> +};
>> +
>> +static int acpm_clk_ops_init(struct device *dev, struct acpm_clk *aclk,
> 
> Maybe acpm_clk_register() is a more appropriate name.

okay, will update.

> 
>> +                            const char *name)
>> +{
>> +       struct clk_init_data init = {};
>> +
>> +       init.name = name;
>> +       init.ops = &acpm_clk_ops;
>> +       aclk->hw.init = &init;
>> +
>> +       return devm_clk_hw_register(dev, &aclk->hw);
>> +}
>> +
>> +static int acpm_clk_probe(struct platform_device *pdev)
>> +{
>> +       const struct acpm_handle *acpm_handle;
>> +       struct clk_hw_onecell_data *clk_data;
>> +       struct clk_hw **hws;
>> +       struct device *dev = &pdev->dev;
>> +       struct acpm_clk *aclks;
>> +       unsigned int mbox_chan_id;
>> +       int i, err, count;
>> +
>> +       acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
>> +       if (IS_ERR(acpm_handle))
>> +               return dev_err_probe(dev, PTR_ERR(acpm_handle),
>> +                                    "Failed to get acpm handle.\n");
> 
> Remove the period please. Most error messages don't have proper
> punctuation.

okay, will update.

> 
>> +
>> +       count = acpm_clk_gs101.nr_clks;
>> +       mbox_chan_id = acpm_clk_gs101.mbox_chan_id;
>> +
>> +       clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
>> +                               GFP_KERNEL);
>> +       if (!clk_data)
>> +               return -ENOMEM;
>> +
>> +       clk_data->num = count;
>> +       hws = clk_data->hws;
>> +
>> +       aclks = devm_kcalloc(dev, count, sizeof(*aclks), GFP_KERNEL);
>> +       if (!aclks)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0; i < count; i++) {
>> +               struct acpm_clk *aclk = &aclks[i];
>> +
>> +               /*
>> +                * The code assumes the clock IDs start from zero,
>> +                * are sequential and do not have gaps.
>> +                */
>> +               aclk->id = i;
>> +               aclk->handle = acpm_handle;
>> +               aclk->mbox_chan_id = mbox_chan_id;
>> +
>> +               hws[i] = &aclk->hw;
>> +
>> +               err = acpm_clk_ops_init(dev, aclk,
>> +                                       acpm_clk_gs101.clks[i].name);
>> +               if (err)
>> +                       return dev_err_probe(dev, err,
>> +                                            "Failed to register clock.\n");
>> +       }
>> +
>> +       return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>> +                                          clk_data);
>> +}
>> +
>> +static const struct platform_device_id acpm_clk_id[] = {
>> +       { "gs101-acpm-clk" },
>> +       {},
> 
> Please drop comma here so that nothing can come after.

okay. Thanks for the review!
Cheers,
ta


