Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2E0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9TdY8wDAQIhgT2ZvDa2oy0Rrrdx753hIU59bQKGYyc=; b=Pj5q1nsSLEWh+l/QbhRcX/bNuU
	YZrnVdeQksZKMGzCRO4EJwTzH6rn2PnmVZP0fx2US3OvUQKEBofSCWxQUrMh9bsJCsoqMPHwN2CWg
	LbXQ+vNDJ8BzLxj9oOwud4rXiV/esyRG4Qy9jXDfF/x6YlLc0oGPKazMC57d2U53RzJHk+FqB/b6p
	iEgtMxdnkf8DnNqiPkOJDGXi3X10nlYqtPH/ZQS+63Gob5tRwur/D8l+kRUY8PIhMmgLcrRMhmBYe
	n+SJjEeoEfPh6J8KP1LSU/RgzALMuIwEWtqNOhyRjt3HoGgIkbsuC3yzvb1zdfaUX6FGz/n2Nk4P1
	QcJysawg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNGFE-0000000B1Fz-1tn8;
	Mon, 16 Dec 2024 18:55:05 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNGE6-0000000B12P-26vm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 18:53:56 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385e2880606so4163536f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 10:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734375232; x=1734980032; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9TdY8wDAQIhgT2ZvDa2oy0Rrrdx753hIU59bQKGYyc=;
        b=qTjTKkHvTaA6laRHW3HFKbVXHYThDCvH4q1yc5pz/ExWw5Wth4Z8VpZbMhgffFaIT6
         3+r2d2FJT4JiCyKy2FT+k6u49WYnsHMIJrUYOA856aAb1+DEoVzmnX98t6MlgRci9L1N
         m00xa1l3Y3unOUaddjd6lUZY64eFqtR9Ks/kNjcU0STWpOGTpgOwTyYuBBSJL2F+b0V/
         R5dn+xP0T1wa2KAmvOoaQYc2/NV4/oDN3wp4VHAY0G2nroAi18POgjpNL/+iTysNbqpG
         7wVUUVfHt1aZeOHJmy55nJfbUBLgWp2KbOvdeJywDO23PiDsRQnUPixl9Mqyv7PSpZqs
         lkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734375232; x=1734980032;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O9TdY8wDAQIhgT2ZvDa2oy0Rrrdx753hIU59bQKGYyc=;
        b=GGkoaMHUZfj47pO5F76WJNipkNKy/ICJnjWEkFvikexq+vsreos8DyOpJptabZ6sS1
         NN6oS8vyVI9aVOvyzpdgvxKtsrM+tHL0KsHkI+Q1rKGfEfRG4FC9h0EjxXOv06pu0FM5
         +wc5DO++FP6hk76+R6UuCHZPU4kgAEUeE07Qq3a45AJTrWL5UBsjm/o7Wrs4tJ8Wk7b8
         Tx34PaLWifDHC+XRBs5SO1C157gLFTz3vj7YzHcraiLPIJ5EJOkk6L+VE6y7eHPFLeoI
         N7PemtBAOqfbX/39efS9v0GM3f0OSMHo8ZmBPoVvuXjxVQvtB93SRzMehKP+SUUoqVmy
         A0sg==
X-Forwarded-Encrypted: i=1; AJvYcCXlTC76x5mI27RvgQBPUb6yRA1C+1wbCRCdOOAUEQFXRwBW9N7B2RtCfPM39iVrCkyu71JGTIMnAehLuj5hTO3W@lists.infradead.org
X-Gm-Message-State: AOJu0YwNnteEzs434NYsJ5xMlxYnZ/llzaWEFdfZGrjzwEwjWwjeIpw/
	jB36pwLBM59Wv33eugZ4/pRGAPgINZxTTL7G6F9DWXwqMDfZBoJireAmzVQMjI4=
X-Gm-Gg: ASbGncvKeTvqPANSbLaE5BxqkYgiHsC6HYj6KwvcUtjHBSjjtmkOaxCBuLbFk8sw/6V
	o0+J44paX5uZEq98obTm0bh06ZM5+3p4omoQPsA7r873Dip3UwpmFSPeLUgkW8zE1IonQdyRWWN
	p1Lui2VuRXn6uMaQNjcEE24L8sGt2GhE3s6FOYvEKTuB8rPmQLdzg7pTX6UszW3HWAmTh9a9Q2z
	aj9Q/MckIa8a9L0uFKEDE1WfNuyOnIFJjtNgLNIAVTsRzeE3pTr7PReUXy5wn2DoO7JAKxbdOig
	Ze09DKKYLRdDMKhZN8b8GtpwbRITMAiEiA==
X-Google-Smtp-Source: AGHT+IG59oeD9k/rUOCvesGIKAV/ezj83uuhcluTrje5318wlJogWM8odJk4nxizFM14ZiA9HZnziA==
X-Received: by 2002:a05:6000:471b:b0:386:3835:9fff with SMTP id ffacd0b85a97d-3888e0c06c7mr12974884f8f.59.1734375231995;
        Mon, 16 Dec 2024 10:53:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8b75:a430:7bc1:919b? ([2a01:e0a:982:cbb0:8b75:a430:7bc1:919b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c805d489sm8978020f8f.88.2024.12.16.10.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 10:53:51 -0800 (PST)
Message-ID: <5c8691c4-4a57-40a9-9da6-00accf3d1a4f@linaro.org>
Date: Mon, 16 Dec 2024 19:53:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] clk: amlogic: g12b: fix cluster A parent data
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241213-amlogic-clk-g12a-cpua-parent-fix-v1-1-d8c0f41865fe@baylibre.com>
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
In-Reply-To: <20241213-amlogic-clk-g12a-cpua-parent-fix-v1-1-d8c0f41865fe@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_105354_596399_82636134 
X-CRM114-Status: GOOD (  21.09  )
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

On 13/12/2024 15:30, Jerome Brunet wrote:
> Several clocks used by both g12a and g12b use the g12a cpu A clock hw
> pointer as clock parent. This is incorrect on g12b since the parents of
> cluster A cpu clock are different. Also the hw clock provided as parent to
> these children is not even registered clock on g12b.
> 
> Fix the problem by reverting to the global namespace and let CCF pick
> the appropriate, as it is already done for other clocks, such as
> cpu_clk_trace_div.
> 
> Fixes: 25e682a02d91 ("clk: meson: g12a: migrate to the new parent description method")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/g12a.c | 36 ++++++++++++++++++++++++------------
>   1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 20be7b037c07535bd2115f6e70404a95a7832756..4e6584377e43fa7c9956017ddfcd3f295fafd686 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -1137,8 +1137,18 @@ static struct clk_regmap g12a_cpu_clk_div16_en = {
>   	.hw.init = &(struct clk_init_data) {
>   		.name = "cpu_clk_div16_en",
>   		.ops = &clk_regmap_gate_ro_ops,
> -		.parent_hws = (const struct clk_hw *[]) {
> -			&g12a_cpu_clk.hw
> +		.parent_data = &(const struct clk_parent_data) {
> +			/*
> +			 * Note:
> +			 * G12A and G12B have different cpu clocks (with
> +			 * different struct clk_hw). We fallback to the global
> +			 * naming string mechanism so this clock picks
> +			 * up the appropriate one. Same goes for the other
> +			 * clock using cpu cluster A clock output and present
> +			 * on both G12 variant.
> +			 */
> +			.name = "cpu_clk",
> +			.index = -1,
>   		},
>   		.num_parents = 1,
>   		/*
> @@ -1203,7 +1213,10 @@ static struct clk_regmap g12a_cpu_clk_apb_div = {
>   	.hw.init = &(struct clk_init_data){
>   		.name = "cpu_clk_apb_div",
>   		.ops = &clk_regmap_divider_ro_ops,
> -		.parent_hws = (const struct clk_hw *[]) { &g12a_cpu_clk.hw },
> +		.parent_data = &(const struct clk_parent_data) {
> +			.name = "cpu_clk",
> +			.index = -1,
> +		},
>   		.num_parents = 1,
>   	},
>   };
> @@ -1237,7 +1250,10 @@ static struct clk_regmap g12a_cpu_clk_atb_div = {
>   	.hw.init = &(struct clk_init_data){
>   		.name = "cpu_clk_atb_div",
>   		.ops = &clk_regmap_divider_ro_ops,
> -		.parent_hws = (const struct clk_hw *[]) { &g12a_cpu_clk.hw },
> +		.parent_data = &(const struct clk_parent_data) {
> +			.name = "cpu_clk",
> +			.index = -1,
> +		},
>   		.num_parents = 1,
>   	},
>   };
> @@ -1271,7 +1287,10 @@ static struct clk_regmap g12a_cpu_clk_axi_div = {
>   	.hw.init = &(struct clk_init_data){
>   		.name = "cpu_clk_axi_div",
>   		.ops = &clk_regmap_divider_ro_ops,
> -		.parent_hws = (const struct clk_hw *[]) { &g12a_cpu_clk.hw },
> +		.parent_data = &(const struct clk_parent_data) {
> +			.name = "cpu_clk",
> +			.index = -1,
> +		},
>   		.num_parents = 1,
>   	},
>   };
> @@ -1306,13 +1325,6 @@ static struct clk_regmap g12a_cpu_clk_trace_div = {
>   		.name = "cpu_clk_trace_div",
>   		.ops = &clk_regmap_divider_ro_ops,
>   		.parent_data = &(const struct clk_parent_data) {
> -			/*
> -			 * Note:
> -			 * G12A and G12B have different cpu_clks (with
> -			 * different struct clk_hw). We fallback to the global
> -			 * naming string mechanism so cpu_clk_trace_div picks
> -			 * up the appropriate one.
> -			 */
>   			.name = "cpu_clk",
>   			.index = -1,
>   		},
> 
> ---
> base-commit: 799ce46951dcc75682223cdab12fdc905f2fe735
> change-id: 20241213-amlogic-clk-g12a-cpua-parent-fix-64362495fc9b
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

