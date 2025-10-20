Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D91CCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JR/OKSNOnF+l4tQRJr2FhhTssgUWExohKzJa6PLCZs=; b=B3AFjVkvhEQp8XlemH5SidCN6F
	weTM+07oOurvWoZApuCdlzWlaSoOWmLoKS79tSaBI5mWL+57qPIIrSCrLLQRmW7I3yMKEDI1bgIMt
	xX1QOoLGuxpHjM6HM2XhfTsCHjxzhExVNECPqTqCZ0ln5rWK2YEAQhdBwSy0yADgLnMLEROx41/Yd
	AdyAzIcLMERH2HmledY5QIfAaMrgZBHievbbA8QHg05/GFPumiWqs24b8WKqbS771SW9FDnhpxpJK
	b5+3OZIH1u8JPjeHXupG99Ntaa3OLOyM93usH1H2ciX+vuDMSypCccdHnLUdZegsSLEzo1ADdk+BA
	xZ7NeFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqtF-0000000Dy1o-0Tl0;
	Mon, 20 Oct 2025 14:29:37 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqtC-0000000Dy1E-35my
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:29:35 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b3d80891c6cso1059493166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760970573; x=1761575373; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2JR/OKSNOnF+l4tQRJr2FhhTssgUWExohKzJa6PLCZs=;
        b=jJmrkoxiCPAt9iES7N/5dDf8r0POiOdzqbREx7qJRXyCnIKcGFv87+dnS1ECrK3cf2
         UCabGAUeqdRFN650f1I1HM703fGRTbT1nDL7lgvtB95AGt0n70T0GQ6c2DdvludyzhQJ
         p8XJH+FxsVYzh+75nX7QNpk5tNL11/f1w3h9cE66dkZ+X4SqLewhMDnBw3iM4wsUUyoZ
         NArdV501GIyi51RMg0geaL8a5o2k7IrI9ag8RGeYlhWybt/uD4XnvxVJ/6Bu78H/pydB
         bEADmpjpo6YVxZ9qfBI0GOHHO+xK9w4XtQeyjDKVRhc4WETVaErFUVDhWYDfCg4XkgKS
         F3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760970573; x=1761575373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JR/OKSNOnF+l4tQRJr2FhhTssgUWExohKzJa6PLCZs=;
        b=HcjfT9I4ybUShraJJr0OXGrmEbmFSqBKq1M7xVRwMP5dWnXfxt/ufzVZCUiwD0yFSa
         OkrD4fHgAlJCN+Ye56XI9vYLqcNkxe35peyIE6nJ0K4FM2rGlNUSkrNNMY6pEEQY0/pt
         /aY4E1IT6BEmOUdiD2S/ihmljl+laOhTeppf9q9pFBUuc39xzGoSaDg2UkuflrOjeoSu
         HU5yrLNe6xXMZLgOzzEJNaJCDYgjUY1qg9BJl92kPWxS8iON1z0KMoJQpc8saKPGZ9/s
         uzqIgUgkwAMFTGryTRRMyDGYrV+BzRayl3MUxC71qzC07/W3wwj0ErnJb7bdwcXU8Bxw
         YgIw==
X-Forwarded-Encrypted: i=1; AJvYcCWHJWQix4hTDA4cdgqkWN3P8fbNeZ1M12xZdTB4OgKUovVdzn0OsWIyZrWeJcZFqdDVKTbn3a07P8zGK14BWGJm@lists.infradead.org
X-Gm-Message-State: AOJu0YwDIbAwPdKQn7nel+qDb/HUfXJ5QIgRJoOHJXjpYx1CXbPprXLC
	uue4EYMKVDPHuR9NqCVIf+RRxbtPw0rSnSLU6y0THC4hifUZf93BPadt
X-Gm-Gg: ASbGnctbYOs0n/sGhhglNdhxEQDUT85jQW0HHoUczAOuknKFc0wjq0DViVZDsGYeduz
	t75x1NnZxHHaX7EtMZs2b+EpmHucIK6P9xWK/ChA1vqbpGdP97vMC87gDnnaTwnOJm+dRdxaw4w
	Lj3t8nyLUPh8NoOUssfd62+y8hb0kd0b+jxQA0xEdwziLasbmC087q3DRS6jV6ugd9aNvUFNgUY
	nJnrfWl/gWYIa7qMz3/5ZWpcSPvkhTtRwLUlVO6v+BzxVlfWW5brfGts+ke6BEkBbb43Ekjfn0U
	HQ6FqYzCaN39q0BnqJhkXmJSQS47zZLcPb1uyTfboRxAwimSNAuJBkqXK2tV6q/jS8INKeReDql
	W4cj1PKAlIHLutQNuZLwxZxU+AAt+7Uq9BQbqskVA9ARZa4qOeEXzNIVQ7khJraF/tNMTcuMgZf
	mdbZthhpnNUC73KUCeb2afwaYXiRdsJRNh
X-Google-Smtp-Source: AGHT+IG/fdWt7ok35oOxO1wrbFMUAezRTf+f2uzPz94aKfhnEmWUajzGD6PhgGurEGjl/Gai/41dbw==
X-Received: by 2002:a17:906:7315:b0:b3c:9bee:eb95 with SMTP id a640c23a62f3a-b645c9cd378mr1808744466b.3.1760970572663;
        Mon, 20 Oct 2025 07:29:32 -0700 (PDT)
Received: from [10.25.213.231] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8391523sm803404466b.18.2025.10.20.07.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:29:32 -0700 (PDT)
Message-ID: <64b28a11-337a-42ba-8765-d94b19070d66@gmail.com>
Date: Mon, 20 Oct 2025 07:29:28 -0700
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
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPJZdAQwdoOP3cqN@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_072934_805076_1AE8AB36 
X-CRM114-Status: GOOD (  17.79  )
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


On 10/17/2025 7:57 AM, Frank Li wrote:
> On Fri, Oct 17, 2025 at 04:20:24AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Support i.MX8ULP's SIM LPAV by adding its reset map definition.
>>
>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 51 +++++++++++++++++++++++++++
>>  1 file changed, 51 insertions(+)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index c370913107f5..b333d7c1442a 100644
>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>> @@ -3,6 +3,7 @@
>>   * Copyright 2024 NXP
>>   */
>>
>> +#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
>>  #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
>>
>>  #include <linux/auxiliary_bus.h>
>> @@ -17,6 +18,8 @@
>>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
>>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
>>
>> +#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
>> +
>>  struct imx8mp_reset_map {
>>  	unsigned int offset;
>>  	unsigned int mask;
>> @@ -55,6 +58,50 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
>>  	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
>>  };
>>
>> +static const struct imx8mp_reset_map imx8ulp_reset_map[] = {
>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(25),
> Register defination still perfer use macro. If not, let me know.

I see no value in adding defines for the masks (see patch 4 commit message)

in this particular scenario.


Is the assignment of the "mask" field for the "struct imx8mp_reset_map" item found

at index  IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST not enough to deduce that the

constant we're using is the mask for the DSP_DBG_RST bit?


>
> Frank
>> +		.shift = 25,
>> +		.active_low = false,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_RST] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(16),
>> +		.shift = 16,
>> +		.active_low = false,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(13),
>> +		.shift = 13,
>> +		.active_low = false,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(5),
>> +		.shift = 5,
>> +		.active_low = true,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_DSI_RST_ESC_N] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(4),
>> +		.shift = 4,
>> +		.active_low = true,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_DSI_RST_DPI_N] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(3),
>> +		.shift = 3,
>> +		.active_low = true,
>> +	},
>> +};
>> +
>> +static const struct imx8mp_reset_info imx8ulp_reset_info = {
>> +	.map = imx8ulp_reset_map,
>> +	.num_lines = ARRAY_SIZE(imx8ulp_reset_map),
>> +};
>> +
>>  struct imx8mp_audiomix_reset {
>>  	struct reset_controller_dev rcdev;
>>  	void __iomem *base;
>> @@ -183,6 +230,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
>>  		.name = "clk_imx8mp_audiomix.reset",
>>  		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
>>  	},
>> +	{
>> +		.name = "clk_imx8ulp_sim_lpav.reset",
>> +		.driver_data = (kernel_ulong_t)&imx8ulp_reset_info,
>> +	},
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
>> --
>> 2.43.0
>>

