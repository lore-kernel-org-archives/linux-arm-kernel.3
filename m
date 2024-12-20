Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEED9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdJ/eOxCZGHcu9pA14lAD6dnUt0v18sp+NWLvry5BiA=; b=ckiiGJpjvM7IHw1TZup34MSEg0
	kXnCWVAgCvZJVR9xfEoo39jN1S+9ewAJMwWjm2hxEof6RH+rtByAwrGESLyIvGBHFbzqpK5JBh6Z0
	QlnFnlPmnxLwpO10k6+pb6qkK5AHyNmV9d5vGjheiX33BKAVZJ4dI2qq/lSB22rsLma6Y30P6R7ZS
	k4yPjvRiHilb51EZAYWHgJTXeAvCCtLe4XcNnhZm+EgBm07GfknUlSSyJdqPWnSvCJ5VMdCKGmW/7
	hx8OGsQ0WnqSZJsVFRKBCnJ0D3JB4amgcxs81EW6jkEpEI6bjsw/z9fJsXlgVi/MNAz0B5P9UiZ3H
	Zhs8mDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOave-00000004g7n-082r;
	Fri, 20 Dec 2024 11:12:22 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaF8-00000004aou-0cE6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:28:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-436249df846so11880315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 02:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734690504; x=1735295304; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdJ/eOxCZGHcu9pA14lAD6dnUt0v18sp+NWLvry5BiA=;
        b=cZHyabbB3mOQ2ccw5nON5gpY2RDmvyKDGtPUajd0tQFUtjLadqzcZ5Q5xvtE17L+G0
         6rdHOjbbonwpX3xzOVDjbvz3bmxTD9VPVx76PU/3XQYXBhLIHFKFMynfFsHLX13ATjge
         fej18QA2FmtqEWto2fqxNtQC+qU8U9pl2GZhpo+IbUnFU3rVnYvyiKho1aUiD6UnJMb9
         E4y7C/8kxj1bKkA0qg0VCOpNflsbTXHvSPX6tN39JxISNz1H8s+F+7yMDsckVYqOpqh1
         45R/T3Yx62JKdmo+siwOF915V/ekV3FK3zXmPLe5sfCJ9Plwuegrsbo5cCvOMcYa4hUR
         Kuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690504; x=1735295304;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HdJ/eOxCZGHcu9pA14lAD6dnUt0v18sp+NWLvry5BiA=;
        b=VzhusrPKIEAH4EAlqq/Try4o8WOsxjfVRbGgkWqnXDxMZYMEQsrLtGrKdAUkwamye8
         nrVORgDABOkn88iSyGU20oCywstu1SZ0yyyUNX4E/KpaQuNIG/ggiW1n9jn+NiezEBrk
         Qz+UsA9DsKt6gnxONimHJU0uqc4XVX/25ZAQii8N90Mp7HG44L9u9J/ZQcMyuzKnotrv
         M7SXCdb+bn5qWKNgOr2eO8/rlamjozEnJbCHluAYXJeYNrwuN4Sdh5i4UTxE+UOG/3eD
         i6GKhqnXdtydoglZptWu4kExhxRkzKSi0iopWiUKv86c46hc4qEFWoZpztIQuT5OtLu1
         U5LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYBX7e8X1k3rJH+fGyRVnxHeN+d3VNbxx6TLxbwHOkED0kBALEjIS40qGXPNCDFdkV1fBkMbVz+FzAfIEZsZ18@lists.infradead.org
X-Gm-Message-State: AOJu0YzAAmxBb9CRa0QGWOWVfKYHVqw1NkQ3QhGi+5Rbm2AYv2FaSA0u
	EKWPHs4HDYjwVdPIGmbPORw4mRgTp3vKckPOW8KAXDCKv1EsINI2J/t906ifjcQ=
X-Gm-Gg: ASbGncudTykFS7escPisDEopN0ODK+cA6kieEcqnkqY+/3qQWFnJ8PaTir2akXBxZwj
	3LgSk5dq8igV5ZB8rGrwzmNz/F+AriG5lCBD0ky50xITXBwdpgsYHZqopZcTYcxKm4RjNYiRokV
	6jOjTdupDBw8TKr8jhhVSS82bTYhgT4WI9xSQ0BwXi+HN6GzZ0413GmG9APfaziyBfQYSbAKfLW
	QRUphCND0AXBlA89zfFe0snvQ3QMUajQTcaq1G6uZL6EImVsaFzf0T9/SWw1UpcDNTO
X-Google-Smtp-Source: AGHT+IEYzK+j+dey8xf+KzqWLoGsi0Q/WX4eyBcHDbdTKpfLYjVtZFyqCoMyxH7cKJs47i+/dXz29A==
X-Received: by 2002:a05:600c:470b:b0:42c:c401:6d8b with SMTP id 5b1f17b1804b1-436685482f4mr17044165e9.7.1734690504486;
        Fri, 20 Dec 2024 02:28:24 -0800 (PST)
Received: from [192.168.7.191] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4274csm76509465e9.38.2024.12.20.02.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:28:23 -0800 (PST)
Message-ID: <e74da1e8-d1fe-4937-9f41-63347beb40a2@linaro.org>
Date: Fri, 20 Dec 2024 11:28:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] clk: amlogic: gxbb: drop incorrect flag on 32k clock
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
 <20241220-amlogic-clk-gxbb-32k-fixes-v1-1-baca56ecf2db@baylibre.com>
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
In-Reply-To: <20241220-amlogic-clk-gxbb-32k-fixes-v1-1-baca56ecf2db@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_022826_250547_B3439F9D 
X-CRM114-Status: GOOD (  17.02  )
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

On 20/12/2024 11:25, Jerome Brunet wrote:
> gxbb_32k_clk_div sets CLK_DIVIDER_ROUND_CLOSEST in the init_data flag which
> is incorrect. This is field is not where the divider flags belong.
> 
> Thankfully, CLK_DIVIDER_ROUND_CLOSEST maps to bit 4 which is an unused
> clock flag, so there is no unintended consequence to this error.
> 
> Effectively, the clock has been used without CLK_DIVIDER_ROUND_CLOSEST
> so far, so just drop it.
> 
> Fixes: 14c735c8e308 ("clk: meson-gxbb: Add EE 32K Clock for CEC")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/gxbb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 262c318edbd512239b79e5ad26643ae6c7b0173b..62494cf06e7d775bdb18b2242c3d45bf246bdd0e 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -1306,7 +1306,7 @@ static struct clk_regmap gxbb_32k_clk_div = {
>   			&gxbb_32k_clk_sel.hw
>   		},
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_DIVIDER_ROUND_CLOSEST,
> +		.flags = CLK_SET_RATE_PARENT,
>   	},
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

