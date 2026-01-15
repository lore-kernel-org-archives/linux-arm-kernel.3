Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9E0D44C73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQXGgSx7jpUFKQjZ6iyGO811lP9xodhRioXDBaDurfQ=; b=qBwpBd74E6QYWmgGt3wlHosyeg
	pf/VUJ6P0OsgRfPW7RRtBjjjPdCRGL9NYc8lGS7yLNeBJRz+Q/wr7ojW6Q+vGDt6nyZVG6jjODNI9
	FKx32lmNadGqGsG6ADLjN3cz9XDpKMdBHjJX/GfnMLAmcDuWTWY2fY5/hNUe5FubJVwnM/hktqJu4
	jLNMhZ+C2YRkcSmA69pnQ8/6Ty7CsNUZtKZugy23xd6OjqIo+KfGmheizZ41XjB+3AP99utpRemiS
	/+73zl41U7MQKGFjaM/qjOp7uylo54/w76HMMzZNVISNEUbiq5eW3ru3K94SjQL8PmL+sPqaKC/5G
	dsb8CWIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPvd-0000000CfEL-1jW2;
	Thu, 15 Jan 2026 16:10:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPvZ-0000000CfDm-3MTv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 16:10:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso4115095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 08:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768493428; x=1769098228; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQXGgSx7jpUFKQjZ6iyGO811lP9xodhRioXDBaDurfQ=;
        b=SGrrBJPRGjI7Ta9wP92xqVa+apbsdpLe8HC0Y29tuvMlt+qIhjShSdhwd4LEPu0grG
         mAmaTFvshuudmFHBgQ6+90dutxjcY8+8xCOm34Sel11TU3YXhJgt2tOALjPe+eHImJjs
         Uh/tBChEOhbX08bRr+21CclGTpCZa1fyF/k6dF8btG8JSappP+rz2EhG8DfPFzuMUZOX
         WjC/gKVrQ5TDFZL81EXbF/EgT+0TieChdeg6X2WDaM5d0YECyDhAPg8M4hSV1/+NVXCX
         SSagNCkGKsRhall1h9tjGJ0/7yODRCrQClTWDOKdpgduVHr7iWMjbQk4Al+Coepa5bN/
         m0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768493428; x=1769098228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQXGgSx7jpUFKQjZ6iyGO811lP9xodhRioXDBaDurfQ=;
        b=YFf8s2osjdBgx+Iv/r0WmZ7h9CvcdNkJgwzeYe3TNehjG8OUWGB6RbYNzbTLadX6FD
         etsWTLk4AcrUybpmbpkuVDnOdeOnUDsJSDth6TafYH4b4KVWY0zDtA6ZjSrmZpmfpsSx
         n4iXD+73wQGUParIjLSON4BgaWxqsEe07aMVOizM6hBfm5LRtvHxY6QYq9aak9A9lL65
         rP/y4jPrljP/b28eKCAKW3PVg2CUrP56YRBltVFp4t9kb3tpFJoCdYA6VAvU6P6c7YTT
         mG0uuH3/XNcCmY3C2mttXgx8quyDzrBi6v7OEha27w13+irW1DQO/f1xWv97aOfD/xH4
         B4NA==
X-Forwarded-Encrypted: i=1; AJvYcCXH9WYZMHq8U/146JBNcq7rjGj5NoTgRmfmqBki77nPBx63O7jsXwTSk/gtiCMMXoObq/s0HI8XZzCjCZQFHjih@lists.infradead.org
X-Gm-Message-State: AOJu0YzXP8bOmhWiidhWYn2P3ONwRnxwdd/HGsQRE/66ERlsJ6CdfuXb
	nsLJctrandkm8tyu/og7ZzlxHJQcwwyTlhg7y56CNc5/6e0LBw6VKHCujoxJqHhHC00=
X-Gm-Gg: AY/fxX5AHpexq9C1DBb3B66FahK4o1rBWfSULRycvYb4PxTXkvbeXeaiHQmUSignoL9
	wk95m7VlsHL2lfUPaxy3zyhDiPT8SmXpDEJi0HIbfCrGBfJ3/0NkcJGuvY1VD6X5FyD4BH9eDIg
	V7Z9yTH7yKwYk56zgXO7Uep8D+QU4UkCHYNBEwVi5Qe9LuV1Rvw9st/kYiTvKvslnJniDp2x8yy
	xjOtKs8zYL+g0l1LhEBzXtsjByKeqeW6sxdAtMizhC0cWxL7H+f5swhp+J4BcmTSEZqsEIwgLRf
	ZhV+xnFWBs6nObOFJ5boYgs3T54A6Ay2pxuh8vYvdBKLFfQScJ34sihbx4EDrInsGbb9InIwtqk
	fezsPAlDGIneYnxZUKlCDs9xuf550mZt1E0eyJQ/452xAu4/nvDMZ5nAMMkB2Y8q24Tm6g/OSVr
	zFKC29cSg8JEJo4wB1Hg==
X-Received: by 2002:a05:600c:c162:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-4801e3387cdmr3797345e9.24.1768493427759;
        Thu, 15 Jan 2026 08:10:27 -0800 (PST)
Received: from [10.11.12.107] ([86.127.43.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b789sm53724735e9.1.2026.01.15.08.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 08:10:27 -0800 (PST)
Message-ID: <fcc5405e-189d-4195-8db0-3acf35bbc0a9@linaro.org>
Date: Thu, 15 Jan 2026 18:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] dt-bindings: mfd: Add Google GS101 TMU Syscon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, willmcvicker@google.com,
 jyescas@google.com, shin.son@samsung.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
 <20260114-acpm-tmu-v1-3-cfe56d93e90f@linaro.org>
 <20260115-slim-denim-potoo-cad9cb@quoll>
 <200d34bf-150e-4f8a-b400-2f54863502ac@linaro.org>
 <e2f028d6-774f-4773-889f-7d56b833067e@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e2f028d6-774f-4773-889f-7d56b833067e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_081030_480481_FC1C43C6 
X-CRM114-Status: GOOD (  33.89  )
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



On 1/15/26 5:34 PM, Krzysztof Kozlowski wrote:
> On 15/01/2026 15:53, Tudor Ambarus wrote:
>>
>>
>> On 1/15/26 3:36 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Jan 14, 2026 at 02:16:31PM +0000, Tudor Ambarus wrote:
>>>> Document the bindings for the Thermal Management Unit (TMU) System
>>>> Controller found on Google GS101 SoCs.
>>>>
>>>> This memory-mapped block exposes the registers required for reading
>>>> thermal interrupt status bits. It functions as a syscon provider,
>>>
>>> I don't think this is syscon, but the actual TMU. Syscon is various,
>>> unrelated system configuration registers.
>>>
>>>> allowing the main thermal driver to access these registers while
>>>> the firmware manages the core thermal logic.
>>>>
>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>> ---
>>>>  .../bindings/mfd/google,gs101-tmu-syscon.yaml      | 37 ++++++++++++++++++++++
>>>>  1 file changed, 37 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml b/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..6a11e43abeaa23ee473be2153478436856277714
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml
>>>
>>> Not MFD either, but soc.
>>
>> You are right, it's not a syscon, it's just a normal thermal IP block
>> from which I need to access the interrupt pending registers.
>>
>> Then I guess I shall describe the new binding in bindings/thermal/,
>> please correct me if I'm wrong.
>>
>>>
>>>> @@ -0,0 +1,37 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/mfd/google,gs101-tmu-syscon.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Google GS101 TMU System Controller
>>>> +
>>>> +maintainers:
>>>> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
>>>> +
>>>> +description: |
>>>
>>> Drop |
>>>
>>>> +  The TMU System Controller provides a memory-mapped interface for
>>>> +  accessing the interrupt status registers of the Thermal Management
>>>> +  Unit. It is used as a syscon provider for the main TMU driver.
>>>
>>> No, it is not a syscon provider. Entire last sentence is incorrect. You
>>> must describe here hardware and this hardware does not provide any sort
>>> of syscon to any sort of driver.
>>>
>>
>> Indeed.
>>
>> I'm going to link the ACPM TMU child node with the TMU node via a
>> "samsung,tmu-regs" property.
> 
> This could be fine, but I actually wonder what's there. What registers
> exactly. For example modern Exynos 88xx, already with APM block, still
> have exactly the same TMU unit at 0x1008{04}000 with all typical
> triminfo, current temperature and thresholds.
> 

It's the same for gs101, the TMU instances have all the typical registers,
it's just that everything is handled via ACPM but the intpend registers.

>>
>> Some concern that I have is that I describe the clocks and interrupts in
>> the ACPM TMU child node. Usually the clocks and interrupts belong to the
>> node that contains the reg property. But I guess that's alright because
>> the interrupts property is expected to be in the node that the driver
>> binds to. For the clocks, by placing it in the ACPM child node, I allow
>> runtime PM to manage it.
> 
> You have to first know whether these clocks and interrupts are going TO
> the ACPM node.

They aren't, the clocks and interrupts are going to the TMU node.

> 
> All this looks like designing for drivers, sorry.
> 

It's fine, I'm not looking to cut corners. Thanks for the feedback, it
helps us coming up to a better solution.

>>
>> Do you think the below description is accurate?
>>
>> soc: soc@0 {
>>     tmu_top: thermal-sensor@100a0000 {
>>         compatible = "google,gs101-tmu-top";
>>         reg = <0x100a0000 0x800>;
>>     };
>> };
>>
>> firmware {
>>     acpm_ipc: power-management {
>>         compatible = "google,gs101-acpm-ipc";
>>         /* ... */
>>
>>         thermal-sensor {
>>             compatible = "google,gs101-acpm-tmu-top";
>>             clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
>>             interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
> 
> This I doubt, really. Why would ACPM child be hooked via CPU clock and
> interrupts?
> 

Yeah, that was my concern as well. Then the clocks and interrupts will
be described in the TMU node, not in the ACPM TMU child. The bindings
are clear to me now, thanks.

In what concerns the interrupts, I can obtain them via the phandle to the
TMU node.

The trickier part will be on how to handle runtime pm, I can no longer use
pm_runtime_get_sync(dev) in the ACPM child. But I think I can handle it with
device links. Get a pointer to the TMU device node and use device links:

device_link_add(acpm_dev, &tmu_pdev->dev, DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_CONSUMER);

This tells the kernel that when the ACPM TMU driver is active, the TMU
hardware block must also be active.

Please let me know if this sounds reasonable. I'll start reworking the set.

Thanks for the help, I appreciate it!
ta

