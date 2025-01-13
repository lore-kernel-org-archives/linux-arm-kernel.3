Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC0DC02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 14:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tE6hZ+Fd5mw5nOuuEkulLuKJpq+Pv/1H3hGSSWLum8w=; b=oL/rmuaBquUgNqvlmyKFJUCKgC
	Y7iMcTx2EXWCc2L3K0lzIS0zQn2BlIG/Ddt7/IICxqEEUiUA2RjDEcAIn/8zTYtHXH/HTeerCrVE1
	Qe9um2EYJ+Qa/uXt7TLycGFGEr9BzhURIkrVh6g5yTlh0LmGFVaTzAUAvOy9I3a2lYwU4DPGZiEZu
	qW8RdwYjhXSxWJHVWvRchLUkM1EJIRCnJ2CSgtOSPU20q6gFW9kwBxzR/153qEzQWGWKxnfg8BPoh
	Kln8fo3mG2y3ftL4dUlghlZ5UNgFUrxW1318bFl6DlyP/eFp+IxHEDt8oo5IrGZkMNbyHOMSGNe33
	iMBQg0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLkH-00000005TDp-3iUM;
	Mon, 13 Jan 2025 14:48:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLiF-00000005Sjz-1HaT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:46:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so31541695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 06:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736779601; x=1737384401; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tE6hZ+Fd5mw5nOuuEkulLuKJpq+Pv/1H3hGSSWLum8w=;
        b=sOGf/eRDeMz6/+jsaxTyM29A0E9CUgfh4x7Vvnpz9j43H7yHH87B2soZPpnd7r3mZC
         J8+0diVu3uJokClDQD/EsQ2XMEmKvHFI5QDCNqwNvVFl7exzskgh0WUIzfRU8KaA6faF
         RAkcBVbc9DBk+b3xx3ttHWWZOB+0xtL+zzO0cdzgpBJX6X+FhGoq2wxB2e0kW/6BDTeh
         geBdnlZzFpRlCj1p3JZwxGGHuv1lGSb2tbOQ0W53slJCaTaCEbf8EP1XGtl14xMFq3UU
         B13bT/zzdA2IXuGSGAemfXjT8isDNcx1VTfVE7hixGkAC7hzmDaNnGx+HcdXmGMvcviZ
         ES1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736779601; x=1737384401;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tE6hZ+Fd5mw5nOuuEkulLuKJpq+Pv/1H3hGSSWLum8w=;
        b=NaLJIA8+rYz+fS2aZmfHTV2prpmXCDSe4IRud7vlkTbRqxuSv4DL4WF/11JVgk2tXf
         pt+lhHjZhUJCI9+ciWq95mRlo1RJNEGQINk52T7JtNnP5s8g+Kj5QZq1foqv4MswndDA
         FID/xYaY2v4vOaqJq9dB5TDvD7frMwJJzCRs1KdUna9XLJ/9MuLqOnezXaaxnIKRvPAe
         eGCBYdmlbTADFk4jaDZ+XgENJDsUNg/lGoYfYGTAk4N/1K4DTRgfvNGxWfZgCesLOs8V
         1fa0Z4XVOPgqiJ7JPTMuJVbROGS6uQMIFymV8y19PzpScL5hhwR8I+qTIWYJ1EK2DC7O
         DRVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0Cszd5aRELUc/A/511zJ671+FHMgviKRiZfmrUI3sishX909NKlqI6NmjST6lxLPyMJ3HPaxJynMwFoFlEMrZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxFvahZWgRQ265x5wh7HaPVpCwvSm7J8tuL1ML/Yd+8IvCUPyZy
	IG2YT6jbi4j8gZ4Gwpame3am+Rq9+m0a/iidN39+xf+TAqfq9ZZOUWrbjM/qriA=
X-Gm-Gg: ASbGnct63e8Tgo0GMRTL1H+8Tr/OtXy3BeUrMXMSnCmCbxXPa7MiR6G7ezLvSe/5MER
	aL6Ecb9ijgjjYwv5h7KUG5kOrojSrFBCvfo5FBJP9pT33j4s94zYdUlIDMGU5gj5u1yTbuqP3Wh
	bUbsi99nvI9jBoqpFDkezMWhEyB6y8J5rWxJOeC9C1nGBeu72FOn4ZvZnWscWWDIaRR+QRlRStq
	ZtL4UFiSAsH/DGSzT2sUFIZGYyFb9F1Mh0AVJ/Oyyq3nxn7Wylbq4eSaJBdKASAN6tBsmC1MxyN
	y8hafZbCxbAIMxBWXuyUw7YlN6eZUldzvA==
X-Google-Smtp-Source: AGHT+IGSgrLOXrRzTlVLniHLSwjw2ewxLMRWdGdwprfbH4ZVqnu/OhLOX7NBhsM0TFAi3c/YYUsydA==
X-Received: by 2002:a05:600c:a09:b0:434:f1e9:afb3 with SMTP id 5b1f17b1804b1-436e267863emr180558495e9.3.1736779601413;
        Mon, 13 Jan 2025 06:46:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d7c2:9cac:29c7:268b? ([2a01:e0a:982:cbb0:d7c2:9cac:29c7:268b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37d7fsm144561755e9.32.2025.01.13.06.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 06:46:40 -0800 (PST)
Message-ID: <af501f2e-2dd6-4182-872d-76260edba973@linaro.org>
Date: Mon, 13 Jan 2025 15:46:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] clk: amlogic: c3: Limit the rate boundaries of clk_hw
To: Jerome Brunet <jbrunet@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
 <20250110-limit-rate-range-of-clk-v1-2-dd618adc4aa8@amlogic.com>
 <1j34hqai39.fsf@starbuckisacylon.baylibre.com>
 <2578a79d-1e24-4336-9859-e384c8f69269@amlogic.com>
 <1jr05693nn.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <1jr05693nn.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_064643_364395_3606A414 
X-CRM114-Status: GOOD (  27.92  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 13/01/2025 15:42, Jerome Brunet wrote:
> On Mon 13 Jan 2025 at 13:24, Chuan Liu <chuan.liu@amlogic.com> wrote:
> 
>> hi Jerome,
>>
>> Thanks for your prompt reply.
>>
>>
>> On 1/10/2025 9:55 PM, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Fri 10 Jan 2025 at 19:47, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>>>
>>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>>
>>>> The PLL can only stably lock within a limited frequency range.
>>>>
>>>> Due to timing constraints, the maximum frequency of the peripheral clock
>>>> cannot exceed the design specifications.
>>>>
>>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>>> ---
>>>>    drivers/clk/meson/c3-peripherals.c | 21 +++++++++++++++++++++
>>>>    drivers/clk/meson/c3-pll.c         |  4 ++++
>>>>    2 files changed, 25 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
>>>> index 7dcbf4ebee07..9f0a3990f0d6 100644
>>>> --- a/drivers/clk/meson/c3-peripherals.c
>>>> +++ b/drivers/clk/meson/c3-peripherals.c
>>>> @@ -568,6 +568,7 @@ static const struct clk_parent_data pwm_parent_data[] = {
>>>>                 .ops = &clk_regmap_gate_ops,                    \
>>>>                 .parent_names = (const char *[]) { #_name "_div" },\
>>>>                 .num_parents = 1,                               \
>>>> +             .max_rate = 200000000,                          \
>>>>                 .flags = CLK_SET_RATE_PARENT,                   \
>>>>         },                                                      \
>>>>    }
>>>> @@ -724,6 +725,7 @@ static struct clk_regmap spicc_a = {
>>>>                         &spicc_a_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 500000000,
>>> I'm sorry but the whole thing is completly wrong.
>>>
>>> All the clocks I'm seeing here are gates. This type of HW hardly cares
>>> what rates it handles. Same goes from mux, dividers, etc ...
>>
>>
>> The purpose of the patch is to constrain the clock network between
>> "clk_hw" and "clk_sonsumers". The output source of this clock network
>> may come from gate, mux, divider, etc.
>>
>>
>>>
>>> All you are doing here is trying enforce some made up "safety" / use-case
>>> defined limits that do not belong in the clock controller.
>>
>>
>> Yes, the purpose is also to ensure "safety". From a strict perspective,
>> this constraint indeed does not belong to the clock controller. However,
>> the source of the potential hazard comes from the clock driver, and we
>> have already identified this hazard. Therefore, I think it is better to
>> avoid it in the clock driver?
>>
> 
> No. The clock provider driver describe the how the clock are _provided_,
> not how they are meant to used.
> 
>>
>>>
>>> The only piece of HW where limits could possibly make sense are PLL DCO,
>>> and even there, you've got multiplier range which is way better as an
>>> abstraction.
>>
>>
>>  From the perspective of HW, the timing constraints of the clock are for
>> the entire clock network with the same name. The output source of this
>> clock network may come from PLL, gate, mux, etc. The multiplier range
>> of the PLL can also achieve a similar effect. If this approach works,
>> we don't need to define the multiplier range for the PLL (PS: Our
>> current multiplier range is limited to the case where "n" is not divided).
>>
>>
>>>
>>> So it's a nack on the series.
>>>
>>> If devices are have particular requirement on rate range, have the
>>> related driver set it.
>>
>>
>> I think that the clock configuration exceeding the timing constraints
>> is a hidden danger that all chips have and face, but this hidden danger
>> is not easy to be exposed?
>>
>> For instance, if the routing of a clock network is close to the clock
>> or data bus of other modules, and this clock network is wrongly
>> configured to a frequency beyond the constraints, causing crosstalk
>> that affects the normal operation of other modules. If such a situation
>> occurs, it will be very difficult to troubleshoot. How should this
>> situation be handled more reasonably?
> 
> Fix your consumers drivers if you need to. Set range if you must.
> 
> Those are not clock provider constraints. Those are use-case ones. It
> does belong here and CCF already provides the necessary infra to deal
> with ranges.

I kind of disagree here, if the vendor has the data and is willing to share
the range for each clock path of the system, I think it should be welcome!

Usually those ranges are not disclosed, so we don't set them, but CCF will
certainly use all those range to make an even better decision on the lock
routing.

Neil

> 
>>
>>
>>>
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -771,6 +773,7 @@ static struct clk_regmap spicc_b = {
>>>>                         &spicc_b_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 500000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -829,6 +832,7 @@ static struct clk_regmap spifc = {
>>>>                         &spifc_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 167000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -887,6 +891,7 @@ static struct clk_regmap sd_emmc_a = {
>>>>                         &sd_emmc_a_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 250000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -934,6 +939,7 @@ static struct clk_regmap sd_emmc_b = {
>>>>                         &sd_emmc_b_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 250000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -981,6 +987,7 @@ static struct clk_regmap sd_emmc_c = {
>>>>                         &sd_emmc_c_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 1200000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1074,6 +1081,7 @@ static struct clk_regmap eth_rmii = {
>>>>                         &eth_rmii_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 50000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1132,6 +1140,7 @@ static struct clk_regmap mipi_dsi_meas = {
>>>>                         &mipi_dsi_meas_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 200000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1190,6 +1199,7 @@ static struct clk_regmap dsi_phy = {
>>>>                         &dsi_phy_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 1500000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1248,6 +1258,7 @@ static struct clk_regmap vout_mclk = {
>>>>                         &vout_mclk_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 334000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1306,6 +1317,7 @@ static struct clk_regmap vout_enc = {
>>>>                         &vout_enc_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 200000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1431,6 +1443,7 @@ static struct clk_regmap hcodec = {
>>>>                 .ops = &clk_regmap_mux_ops,
>>>>                 .parent_data = hcodec_parent_data,
>>>>                 .num_parents = ARRAY_SIZE(hcodec_parent_data),
>>>> +             .max_rate = 667000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1489,6 +1502,7 @@ static struct clk_regmap vc9000e_aclk = {
>>>>                         &vc9000e_aclk_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 667000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1536,6 +1550,7 @@ static struct clk_regmap vc9000e_core = {
>>>>                         &vc9000e_core_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 400000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1594,6 +1609,7 @@ static struct clk_regmap csi_phy0 = {
>>>>                         &csi_phy0_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 200000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1652,6 +1668,7 @@ static struct clk_regmap dewarpa = {
>>>>                         &dewarpa_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 800000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1710,6 +1727,7 @@ static struct clk_regmap isp0 = {
>>>>                         &isp0_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 400000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1768,6 +1786,7 @@ static struct clk_regmap nna_core = {
>>>>                         &nna_core_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 800000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1826,6 +1845,7 @@ static struct clk_regmap ge2d = {
>>>>                         &ge2d_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 667000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1884,6 +1904,7 @@ static struct clk_regmap vapb = {
>>>>                         &vapb_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 400000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
>>>> index 35fda31a19e2..d80d6ee2409d 100644
>>>> --- a/drivers/clk/meson/c3-pll.c
>>>> +++ b/drivers/clk/meson/c3-pll.c
>>>> @@ -286,6 +286,8 @@ static struct clk_regmap gp0_pll_dco = {
>>>>                         .fw_name = "top",
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .min_rate = 3000000000,
>>>> +             .max_rate = 6000000000,
>>>>         },
>>>>    };
>>>>
>>>> @@ -370,6 +372,8 @@ static struct clk_regmap hifi_pll_dco = {
>>>>                         .fw_name = "top",
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .min_rate = 3000000000,
>>>> +             .max_rate = 6000000000,
>>>>         },
>>>>    };
>>> --
>>> Jerome
> 


