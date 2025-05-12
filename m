Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54266C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 08:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTzHIKjFiKmyPbI4xGH6KvZ5G+KJhLs/y1YftexbnRA=; b=xySCpQndWUL5xlsLUEiWWTIMwv
	/4StGsxX6HtXbDrwdgxoGdFY/AS6OWg2y2yerbId/jeLxcBwcyQa0RepyIQXyM3B35OHutLKzYtDq
	7RZ1a650rZJNI+6PpC9sIP2JH/D/+iwOPj5gWaZAq0hdthoBsqTK01BfTn4cr8vmozQtkdb79POxy
	i3f2uR+0Ou8wS0TkbhsntPZhiVcJJ+tsUR21zznG7DqcMLNVWp0qoNuZim9syVaM9+rHasm/6VT48
	f1V6l8mdsvYhAqge6XcFFrEayS7Izail/fSOmy4aacCMWH1kJ1YgN/m9ob1BhlQz9s5XaeHIk7n8g
	kSwNevWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOiz-00000008mrG-0gFI;
	Mon, 12 May 2025 08:41:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOb7-00000008lVP-2s9Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 08:33:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso27301285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747038795; x=1747643595; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTzHIKjFiKmyPbI4xGH6KvZ5G+KJhLs/y1YftexbnRA=;
        b=WnA0aJ3iB+E6ZVL/jiC2TqIY0GM7T2Jxe8vSJfdUJT6CdjuO7Jgwj4jUD4cX9mhz6d
         O6VpEjm7hoSpHCnz2MJvC2EsscnBSu3IKX1E6QGlGHoneJtMNirxHWyy18R55ZL8Ldja
         QgoT39WTHhDCuQo4nEfdnjHytVMY+zBRUn21me4CZJ98aY0YvswOutA+MmLcpZxHTfHC
         CjtIahLyEbiZIL80hTtz+Qq5vbUBTlM9aP++D6xt/I38d3MvOOZe3iiWOz76HktX7dnJ
         x7iauVn7lAMeXfK4ZCPBrota4YWxOelpFVnM6kF6MPbW+3QUUrY1a1LKlTuZFXDnDvF3
         h2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747038795; x=1747643595;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wTzHIKjFiKmyPbI4xGH6KvZ5G+KJhLs/y1YftexbnRA=;
        b=gjr8wM5XwXUMbkcw/w1nG/ag1/6WCkYl7mJejDrIHuEXUM/Cx7YWnU1sM3IiAnRpid
         TtQZMOC0Ae+OWy9AnQA94zhPJPgMi0QKxgLzaBrXB+B11KB0Jx6Jy3r+jqgFWajXiwIO
         vhIR/iMK4AxJnhdReR5aw/YUKA/nNvJjZjuIoqsnjou48eajt8wpTEfadeNdfCBTvpeD
         ekeBdMibKahfVXF/pc4yEfdJcLQIrQ+EbgkvPE+JVrwN5SXuiV3Yi5FzpCxfxQeZpuia
         uPu0y4jlwch6IlPZZUuJUYJ250NRWaJlEcVRGYa65DV1E5DGSZOJRxoLteOXUXbe9N6Z
         1lDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8ypWoGS2CFNMztGDgwVHvMEumoieY+zTgGKxndH60P2VfGSISUHf5LnhpWh3UgqtqKGKJgSRLGNxJWN52NL0+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw795GIvzX/U+EBcXFmAEV28eIflf72FiV0Hpxd558qy3bqMDr8
	a7d+TWHAfOflmVSuriHODEDWFFJlmuMXIF6u7ZXCvWnx9+AT5ChfvEy57Zo/Row=
X-Gm-Gg: ASbGncv2uobCYQSeQO7617WFxIdMjuk76u8hWUD1XweLWxLl1ut5MTfQPmHXdZ/QI0n
	o2w3GwsjGO/hyuijD2XbVwgt5ur8Ox9xBU5jK01XTs3fzKxr56jZuHUjbj23ON/RjcmYyGStDDL
	LMGg7Om41gmwa27MjJTJCaXlCqzZuSuKYhf6s4spZSvaJHIvuslxIv0kc03qBI/R5YsNhH7Eo75
	BjQF2PCdq17ty3/yH74vZyXAHT3J3gvWqNrF1p1i9o3ukGHTVnfiTGuB3ndcWRanRUv2QMa29Bk
	Ww5SXY1b14T0Rr5WATN/IhbsxJzm7y5yJ1FsgCWtfWaSCfU2iKV97AxBdEaizc6zsnk/krTHFQe
	OYSXfO3torsLxT/41UAjIDo8cZ164
X-Google-Smtp-Source: AGHT+IFuQDvMvD9YeofWnuHOmfxKE1aBgD/3Qr8iHneAgHf//6SuN6jkgPv2gPV91PBlbLB7la43DA==
X-Received: by 2002:a05:600c:8012:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-442d6d3e6e8mr115012785e9.14.1747038795575;
        Mon, 12 May 2025 01:33:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a88a:91be:2fd8:4f9f? ([2a01:e0a:3d9:2080:a88a:91be:2fd8:4f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7b83sm156129235e9.33.2025.05.12.01.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 01:33:15 -0700 (PDT)
Message-ID: <9d72fe73-3b71-4f40-a34e-fc7bdb907cc6@linaro.org>
Date: Mon, 12 May 2025 10:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] clk: meson-g12a: fix missing spicc clks to clk_sel
To: Da Xue <da@libre.computer>, Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: stable@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250511173926.1468374-1-da@libre.computer>
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
In-Reply-To: <20250511173926.1468374-1-da@libre.computer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_013317_727381_954DC9D3 
X-CRM114-Status: GOOD (  19.51  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 11/05/2025 19:39, Da Xue wrote:
> HHI_SPICC_CLK_CNTL bits 25:23 controls spicc clk_sel.

This sentence can be removed, this patch doesn't change anything in this= regard.

> 
> It is missing fclk_div 2 and gp0_pll which causes the spicc module to
> output the incorrect clocks for spicc sclk at 2.5x the expected rate.

The sentence is not correct, the spicc sclk will be at the freq computed but CCF,
it simply can't achieve the requested rate without the missing parents.

But I'm against adding the GP0 PLL since this PLL is required to drive DSI panels.

And GP0 isn't needed since on G12, the SPICC has the "enhance_clk_div" which should be
able to to reach much more rates with the fclk_divX clocks.

Neil

> 
> Add the missing clocks resolves this.
> 
> Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK Source clocks")
> Cc: <stable@vger.kernel.org> # 6.1
> Signed-off-by: Da Xue <da@libre.computer>
> ---
> Changelog:
> 
> v1 -> v2: add Fixes as an older version of the patch was incorrectly sent as v1
> ---
>   drivers/clk/meson/g12a.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 4f92b83965d5a..892862bf39996 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -4099,8 +4099,10 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
>   	{ .hw = &g12a_clk81.hw },
>   	{ .hw = &g12a_fclk_div4.hw },
>   	{ .hw = &g12a_fclk_div3.hw },
> +	{ .hw = &g12a_fclk_div2.hw },
>   	{ .hw = &g12a_fclk_div5.hw },
>   	{ .hw = &g12a_fclk_div7.hw },
> +	{ .hw = &g12a_gp0_pll.hw, },
>   };
>   
>   static struct clk_regmap g12a_spicc0_sclk_sel = {


