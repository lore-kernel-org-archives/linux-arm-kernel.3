Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F999CCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 13:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0jubacFDSdFcQnHYVbBIaUUxwO2V0rJTSsvBZVmUXc=; b=2nYXS7DIDUG1LjiGNYEpQ+ZWGS
	K4MXwANNZBxlgAngTfbdw4W5MQXJIpqHNQ6EcXB3oRP+hSGZtVWY9cXbJsxZCcaLSxPsXPzK/XhDy
	iYqhSinu3ubs1KL+5u4n5bp3lMl1B4f8gI1cfWP9Q+Zgei1uDF/WYWQ7USZw4WBtwvM3ePZPXWJeq
	1GI5OzXDf09K2yBS9PRFISMipylwzuv3z1y+W9A/wyYV1BLd3KVTn9i9LNOXqHFWgKJhCSIw33NBm
	W5oy+XPcv9XB5AWFpXO+QYFWcIcXrL1S1b+r/EWWzjqb8tBUs14HHJzzYNdTnhrxwFAyI9pLmlNkz
	ak6v2Nmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCEL-0000000H7V0-3e61;
	Tue, 21 Oct 2025 13:16:49 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCEJ-0000000H7U1-1LKD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 13:16:48 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-63c1a0d6315so10006813a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 06:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761052605; x=1761657405; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/0jubacFDSdFcQnHYVbBIaUUxwO2V0rJTSsvBZVmUXc=;
        b=EXSJ8ExyEWvMZwuSWG8XhScwuMat4KnqtIpi7ejhnay6rRkYjwzSUB8+P5njlzYdeL
         YtVhZylIL8+5jZa4szAkE5UwUoQCk66QZ8Z/AA2lZFvkLRHVV1NhqDJQDbpmA4V2vIh5
         RqAsuTum1LJitD5N2/ob/eKmQofrF4ZdYhZa3te4RK+supHJ1QI3Ja3x/j2W1AKbTxS8
         Nl0j0TIbE4W5eZ55ZQ6yULKpju+gZp/SmCCgFum/RNDcgRlmM1K2PryN9jAkc1DCx+J/
         7zmEO/681y22azy2C9ATIv2lrxKXLALrlx+A85lTS+42VUkXJWV94F++udtlxYDO31h4
         aywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761052605; x=1761657405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0jubacFDSdFcQnHYVbBIaUUxwO2V0rJTSsvBZVmUXc=;
        b=Ap6VScISaRetlXAsHgvwEj5yQ34EchdiKYD1SLLlH+rRGWje0CI1hIuMFTULK0h/N0
         ZbUMx3bY8JsY/jB2Zyp2KLZSy0YWCQhXrbtAdl4ePlRpcIpRaF5EySc7AWnSqQ4MRnij
         6Q0dnEzmjZKuFsHxGvW5/6Ilbdj6ZWlwXwUuR/RzDad/A8cse5IYl9hxRiGsQX2Gm0Ox
         yJbNFsqaZ0wOnBSCjerNmrCO2TVABSU1WNEm9DqoJcigxsTvPje4+q9MbF3TdAdJ0BxM
         /AtfI9iPGg+glgvPdepC4aEAwmNvLQ8xo8/I0LMJ1m8t4PZKbjsXRFKvUVubs4qU16mE
         N+WQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/JLzjJ1YuqvvBGBW/UIxyFQD+NPfy/WOETp7aZx1ly5HkU75l8giL81svQRpY/hhAqI+rgksyEnqTaoHWCS4Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmrm+x8+97iQaawzmOCR5SrUaudtgeJyTJUX/fYOGaJ00R7VGT
	CLZ2HCxey4ZjjnIBqfDyZC1+yxhewjITOSE6VqadAYAH5ewW6RmCTRsP
X-Gm-Gg: ASbGncuTcAPnhWcGTehut2CK8tfwgUY2fW7HSe8OAAcRGSWi6MPRE8IUco2njMT/jvY
	5KXouQdhGwoo2ugdooY3JoDPJYXqXZLDpYXZFhpWQ7fjo6DzLYJ79MnLitXT9TRTJemxlr9t0xR
	SynfWmbohBpqwNXynCCKFEkKYHV16XVLkCvZ0w5R6j6v3XJpMQ0ycn1Ya2ptFvgkgTZJuSCnIc9
	vs2Vt0osyTWPay5JpWZgwuyQqLzYBuOlzru2o5LQ5nGG8fMaoxFJLW2I42NHjZ7DIVyjXLvpFAQ
	RM5bD0lMwXgLhLMv/a0s5veEVT+/TQt7HFY1NRmvRCXye0jKCvkhK4IMw/AAjoLl+8dYAnVgmsQ
	Pez8xM9bqu3xMxlSbyO49/Vkhuga2QNhhMTXhmTy1VuwVfKMGY+wRWP7MAOzp2Tz1hq9ZKqNmSU
	/CiftqMcJqlY5RJmbiu8MV/OtaKs/wEmuKCvcEFQx9nbE=
X-Google-Smtp-Source: AGHT+IGLK2EmnFCqdftdxAKB6j+6Ma2jSdfUwKotGCFRUzw3RKdiF0RM9WMxavQ7l+6jXDABf8pL5A==
X-Received: by 2002:a17:907:3f25:b0:b30:ea06:af06 with SMTP id a640c23a62f3a-b647324404cmr1795728766b.24.1761052604632;
        Tue, 21 Oct 2025 06:16:44 -0700 (PDT)
Received: from [10.25.219.115] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8391523sm1069741966b.18.2025.10.21.06.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 06:16:44 -0700 (PDT)
Message-ID: <f1bbd303-2798-4476-921a-62b45fdb67ea@gmail.com>
Date: Tue, 21 Oct 2025 06:16:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-8-laurentiumihalcea111@gmail.com>
 <aPJZdAQwdoOP3cqN@lizhi-Precision-Tower-5810>
 <64b28a11-337a-42ba-8765-d94b19070d66@gmail.com>
 <aPZMJb9VwylTIiCM@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPZMJb9VwylTIiCM@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_061647_384771_DA8F5339 
X-CRM114-Status: GOOD (  20.78  )
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


On 10/20/2025 7:50 AM, Frank Li wrote:
> On Mon, Oct 20, 2025 at 07:29:28AM -0700, Laurentiu Mihalcea wrote:
>> On 10/17/2025 7:57 AM, Frank Li wrote:
>>> On Fri, Oct 17, 2025 at 04:20:24AM -0700, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> Support i.MX8ULP's SIM LPAV by adding its reset map definition.
>>>>
>>>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> ---
>>>>  drivers/reset/reset-imx8mp-audiomix.c | 51 +++++++++++++++++++++++++++
>>>>  1 file changed, 51 insertions(+)
>>>>
>>>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>>>> index c370913107f5..b333d7c1442a 100644
>>>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>>>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>>>> @@ -3,6 +3,7 @@
>>>>   * Copyright 2024 NXP
>>>>   */
>>>>
>>>> +#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
>>>>  #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
>>>>
>>>>  #include <linux/auxiliary_bus.h>
>>>> @@ -17,6 +18,8 @@
>>>>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
>>>>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
>>>>
>>>> +#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
>>>> +
>>>>  struct imx8mp_reset_map {
>>>>  	unsigned int offset;
>>>>  	unsigned int mask;
>>>> @@ -55,6 +58,50 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
>>>>  	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
>>>>  };
>>>>
>>>> +static const struct imx8mp_reset_map imx8ulp_reset_map[] = {
>>>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST] = {
>>>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>>>> +		.mask = BIT(25),
>>> Register defination still perfer use macro. If not, let me know.
>> I see no value in adding defines for the masks (see patch 4 commit message)
>>
>> in this particular scenario.
>>
>>
>> Is the assignment of the "mask" field for the "struct imx8mp_reset_map" item found
>>
>> at index  IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST not enough to deduce that the
>>
>> constant we're using is the mask for the DSP_DBG_RST bit?
> This bit is NOT software choose bit, which must be align hardware spec.
> Define macro help map name to spec and easy to look for spec by use macro.


yeah, we already have the DT binding macros for that which perfectly match the name

of the corresponding bit in the SYSCTRL0 register. I don't see how adding 6 more macros

with the SAME name as the DT binding macros and the "_MASK" suffix would help you in

this regard?


>
> There are over thousand result to seach bit 25.
>
> eventhough search SYSCTRL0, may have many SYSCTRL0 in RM.
>
> Frank
>>
>>> Frank
>>>> +		.shift = 25,
>>>> +		.active_low = false,
>>>> +	},
>>>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_RST] = {
>>>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>>>> +		.mask = BIT(16),
>>>> +		.shift = 16,
>>>> +		.active_low = false,
>>>> +	},
>>>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL] = {
>>>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>>>> +		.mask = BIT(13),
>>>> +		.shift = 13,
>>>> +		.active_low = false,
>>>> +	},
>>>> +	[IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N] = {
>>>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>>>> +		.mask = BIT(5),
>>>> +		.shift = 5,
>>>> +		.active_low = true,
>>>> +	},
>>>> +	[IMX8ULP_SIM_LPAV_DSI_RST_ESC_N] = {
>>>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>>>> +		.mask = BIT(4),
>>>> +		.shift = 4,
>>>> +		.active_low = true,
>>>> +	},
>>>> +	[IMX8ULP_SIM_LPAV_DSI_RST_DPI_N] = {
>>>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>>>> +		.mask = BIT(3),
>>>> +		.shift = 3,
>>>> +		.active_low = true,
>>>> +	},
>>>> +};
>>>> +
>>>> +static const struct imx8mp_reset_info imx8ulp_reset_info = {
>>>> +	.map = imx8ulp_reset_map,
>>>> +	.num_lines = ARRAY_SIZE(imx8ulp_reset_map),
>>>> +};
>>>> +
>>>>  struct imx8mp_audiomix_reset {
>>>>  	struct reset_controller_dev rcdev;
>>>>  	void __iomem *base;
>>>> @@ -183,6 +230,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
>>>>  		.name = "clk_imx8mp_audiomix.reset",
>>>>  		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
>>>>  	},
>>>> +	{
>>>> +		.name = "clk_imx8ulp_sim_lpav.reset",
>>>> +		.driver_data = (kernel_ulong_t)&imx8ulp_reset_info,
>>>> +	},
>>>>  	{ }
>>>>  };
>>>>  MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
>>>> --
>>>> 2.43.0
>>>>

