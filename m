Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63E1C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 07:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjtwVIeb8KP7j4LUHx7LL745xRZ8BRrZvz5Uu55XH1M=; b=ACH3CBA4rj/IE+eWHT2ImT6BGr
	z7ZnU31m8By1ntnC62ZlY64jp98qNJMubxosulutkQJBLqGyysWxzwQ/nVVu5mb6rvliQJLBbISSK
	F567OAvZrjekx7FgGWRwX8lFtvr6BR8+Q1ekZA61FlV+WF/oDvzLwq+RBtZbzog8aQo17TrcgfHPc
	HwqYM0EYauybq76Th+Wna03rwW5vPXtnwI90Kgppw00g7BZGChiTTh7Yb1/Li3HHBnTeYFUuRU3gq
	iJmGtodwmjXY9Hle23MntSbBgSy5JWTM7DxOIIAwnbKE7tdOUiYBLRvyOTIcKa6f3lX98xqLGNaqY
	fYjJYxxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHHNN-0000000BqwF-39IV;
	Tue, 20 May 2025 07:27:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHHL5-0000000BqSk-1u7s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 07:24:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so57936165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747725878; x=1748330678; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjtwVIeb8KP7j4LUHx7LL745xRZ8BRrZvz5Uu55XH1M=;
        b=Vv/NPVvNd9/6QCcXEVzcisUbeGxuu+9SjtVO8AY1iZpJGc56gESLV0DL89x653PIck
         6sW+AtCX11MdiPL/YdeiOLcaWkjnoaWqomlqfOsmZhLBmuqgVPUppFkPiBhwaIHnW7pR
         9Z+i9m7oLSe69orLxJKiDHk0FrvUU+0z3Zl9wwITrooCJgawkjd63WPp0AD1QueWO6tA
         On6XXOWqk+z8gz9g9hA4vmJdjfBAfwqcaPuwiUZ6usyABZHFOHA9clc+aLaBbqWFWM4S
         JY9u4iqRmnjF4kmgEeMtiFfQmjQtH7ly9nw1ZvtEmVg+OHxLSs1No1xIoEhX42MhXJhF
         6QJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747725878; x=1748330678;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NjtwVIeb8KP7j4LUHx7LL745xRZ8BRrZvz5Uu55XH1M=;
        b=QYgtoxXW9bD+DxSR6HS91dNXcn4gWJDyi4EcjKFmv6k5qw8xyJ84fTIwbuSJ4UlAOK
         ALPucR9Mi/tq/AXuZtvdyR1frRCYCQMYM4w6MkeBQ6iqpVZR1KM39PkJXbD+T6k7vuHH
         zQJfWjl/OKwhJyP+RL3ZKDu9JxPqM+dx4mSos3TNbbwisNN1RnYyHoZ2L7bKsCLi8p9i
         53wCTtP5T1PphXhM7UU6zZl9Xnk53o3/H3UzsIsLV2QJhk9GQMfB0mZbdXYDZfehEVhn
         M34lDkIqg1y3RwA2pl08NC9cyWWHeCVv2Y2ny7KUuSOv04lXN0oP4OyTnUyGvzKk8WKa
         XGDw==
X-Forwarded-Encrypted: i=1; AJvYcCUiV6eJBbo/5FYzNpz1p6Q1QIuViZhyEuWYby7e7zIBEpfDQXBjuVzorui/PKwchon4bvzrAeFIbVj6SbXHQzOz@lists.infradead.org
X-Gm-Message-State: AOJu0YyQLLWPAeZsLZ8CThEfXCyDH7ycPSvVaa06XG/IysZBZ0eShRgi
	vXCER8wklDWB6vwN2dTZL5uSuGHHxXdAcf70vvGq+v9X2vufnZg5a6VXNVewPzMlhUs=
X-Gm-Gg: ASbGncvz/4zjjrmcLfKlvRl/fux0mMbmdO109eFKFOs8EvFyOzM+/XlstVg6RLA93cn
	LFHDD5Imyxh3/2o58RGcKIcNhgUZuanMLuAeLkKsnvUsDeJLYzQ9+7RpKm2gwt3XAzQo8/9eowj
	0j+Cj6iuyy/Az+8R12xSfws5O73rXgOkPKW1zde0KVV5Sjbv1SAZR0LA2p2WEJ7x2zYhYHy8crw
	+bbl03/8LP5MAxkHdBcjl1PT61AnTSYWyOdWSZXLj9aiTyfvi0viQBgl82lmt6f2VwQGKbTc3XE
	31eBXwjJQWlPHVJqVphKEQKwi2Ij9/OfBFisd4T5QJMpUZzJIq94b3IQc6XypOiFFdPEJLL5+FT
	g3EA24es9IQOUJa8v6WAM6PrWKtfj
X-Google-Smtp-Source: AGHT+IEJpZSEMv+5rch7EvwPkXN0SGph1lLlO3XlZnPDxQO4judg+KNufcAsGR1YU4k0/O2TJFSGrQ==
X-Received: by 2002:a05:600c:1d8d:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-442fd60a41cmr161114225e9.2.1747725877694;
        Tue, 20 May 2025 00:24:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7ca2de7sm18762645e9.35.2025.05.20.00.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:24:37 -0700 (PDT)
Message-ID: <ab2692a5-e428-40bf-8071-cad6ae96dc3b@linaro.org>
Date: Tue, 20 May 2025 09:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 3/5] phy: rockchip: naneng-combphy: Add SoC prefix to
 register definitions
To: Yao Zi <ziyao@disroot.org>, Diederik de Haas <didi.debian@cknow.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250519161612.14261-1-ziyao@disroot.org>
 <20250519161612.14261-4-ziyao@disroot.org>
 <DA0DU2P8UWSV.3U07EFFLKBPXQ@cknow.org> <aCv8vRu8gjrvK8wr@pie.lan>
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
In-Reply-To: <aCv8vRu8gjrvK8wr@pie.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_002439_512661_867B9A04 
X-CRM114-Status: GOOD (  16.37  )
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

On 20/05/2025 05:53, Yao Zi wrote:
> On Mon, May 19, 2025 at 09:26:05PM +0200, Diederik de Haas wrote:
>> On Mon May 19, 2025 at 6:16 PM CEST, Yao Zi wrote:
>>> All supported variants of naneng-combphy follow a register layout
>>> similar to the RK3568 variant with some exceptions of SoC-specific
>>> registers.
>>>
>>> Add RK3568 prefix for the common set of registers and the corresponding
>>> SoC prefix for SoC-specific registers, making usage of definitions clear
>>> and preparing for future COMBPHY variants with a different register
>>> layout.
>>>
>>> Signed-off-by: Yao Zi <ziyao@disroot.org>
>>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>>> ---
>>>   .../rockchip/phy-rockchip-naneng-combphy.c    | 560 +++++++++---------
>>>   1 file changed, 288 insertions(+), 272 deletions(-)
>>>
>>> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>>> index ce91fb1d5167..1d1c7723584b 100644
>>> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>>> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>>> @@ -21,78 +21,80 @@
>>>   #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
>>>   
>>>   /* COMBO PHY REG */
>>> <snip>
>>> -#define PHYREG33_PLL_KVCO_VALUE_RK3576	4
>>> +#define RK3568_PHYREG6				0x14
>>> +#define RK3568_PHYREG6_PLL_DIV_MASK		GENMASK(7, 6)
>>> +#define RK3568_PHYREG6_PLL_DIV_SHIFT		6
>>> +#define RK3568_PHYREG6_PLL_DIV_2		1
>>> +
>>> +#define RK3568_PHYREG7				0x18
>>> +#define RK3568_PHYREG7_TX_RTERM_MASK		GENMASK(7, 4)
>>> +#define RK3568_PHYREG7_TX_RTERM_SHIFT		4
>>> +#define RK3568_PHYREG7_TX_RTERM_50OHM		8
>>> +#define RK3568_PHYREG7_RX_RTERM_MASK		GENMASK(3, 0)
>>> +#define RK3568_PHYREG7_RX_RTERM_SHIFT		0
>>> +#define RK3568_PHYREG7_RX_RTERM_44OHM		15
>>> +
>>> +#define RK3568_PHYREG8				0x1C
>>> +#define RK3568_PHYREG8_SSC_EN			BIT(4)
>>> +
>>> +#define RK3568_PHYREG11				0x28
>>> +#define RK3568_PHYREG11_SU_TRIM_0_7		0xF0
>>> +
>>> +#define RK3568_PHYREG12				0x2C
>>> +#define RK3568_PHYREG12_PLL_LPF_ADJ_VALUE	4
>>> +
>>> +#define RK3568_PHYREG13				0x30
>>> +#define RK3568_PHYREG13_RESISTER_MASK		GENMASK(5, 4)
>>> +#define RK3568_PHYREG13_RESISTER_SHIFT		0x4
>>> +#define RK3568_PHYREG13_RESISTER_HIGH_Z		3
>>> +#define RK3568_PHYREG13_CKRCV_AMP0		BIT(7)
>>> +
>>> +#define RK3568_PHYREG14				0x34
>>> +#define RK3568_PHYREG14_CKRCV_AMP1		BIT(0)
>>> +
>>> +#define RK3568_PHYREG15				0x38
>>> +#define RK3568_PHYREG15_CTLE_EN			BIT(0)
>>> +#define RK3568_PHYREG15_SSC_CNT_MASK		GENMASK(7, 6)
>>> +#define RK3568_PHYREG15_SSC_CNT_SHIFT		6
>>> +#define RK3568_PHYREG15_SSC_CNT_VALUE		1
>>> +
>>> +#define RK3568_PHYREG16				0x3C
>>> +#define RK3568_PHYREG16_SSC_CNT_VALUE		0x5f
>>> +
>>> +#define RK3568_PHYREG18				0x44
>>> +#define RK3568_PHYREG18_PLL_LOOP		0x32
>>> +
>>> +#define RK3568_PHYREG32				0x7C
>>> +#define RK3568_PHYREG32_SSC_MASK		GENMASK(7, 4)
>>> +#define RK3568_PHYREG32_SSC_DIR_MASK		GENMASK(5, 4)
>>> +#define RK3568_PHYREG32_SSC_DIR_SHIFT		4
>>> +#define RK3568_PHYREG32_SSC_UPWARD		0
>>> +#define RK3568_PHYREG32_SSC_DOWNWARD		1
>>> +#define RK3568_PHYREG32_SSC_OFFSET_MASK	GENMASK(7, 6)
>>> +#define RK3568_PHYREG32_SSC_OFFSET_SHIFT	6
>>> +#define RK3568_PHYREG32_SSC_OFFSET_500PPM	1
>>> +
>>> +#define RK3568_PHYREG33				0x80
>>> +#define RK3568_PHYREG33_PLL_KVCO_MASK		GENMASK(4, 2)
>>> +#define RK3568_PHYREG33_PLL_KVCO_SHIFT		2
>>> +#define RK3568_PHYREG33_PLL_KVCO_VALUE		2
>>> +#define RK3576_PHYREG33_PLL_KVCO_VALUE		4
>>> +
>>> +/* RK3588 COMBO PHY registers */
>>> +#define RK3588_PHYREG27				0x6C
>>> +#define RK3588_PHYREG27_RX_TRIM			0x4C
>>
>> Would it be better if RK3588_PHYREG* comes after RK3576_PHYREG*?
>>
>> Cheers,
>>    Diederik
> 
> It's intended to keep RK3576 definitions below RK3588 ones. The RK3576
> driver makes use of a register introduced for RK3588 variant
> (RK3588_PHYREG27). Since similar reusing doesn't happen reversely, I
> consider the design of RK3576 a superset of the RK3588 one, and put
> RK3576 definitions later in the file.

Sound logic, RK3576 was announced after RK3588, thus the order makes sense.

Add my:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

> 
>>> +
>>> +/* RK3576 COMBO PHY registers */
>>> +#define RK3576_PHYREG10				0x24
>>> +#define RK3576_PHYREG10_SSC_PCM_MASK		GENMASK(3, 0)
>>> +#define RK3576_PHYREG10_SSC_PCM_3500PPM		7
>>> +
>>> +#define RK3576_PHYREG17				0x40
>>> +
>>> +#define RK3576_PHYREG21				0x50
>>> +#define RK3576_PHYREG21_RX_SQUELCH_VAL		0x0D
>>> +
>>> +#define RK3576_PHYREG30				0x74
>>>   
>>>   struct rockchip_combphy_priv;
>>> <snip>
> 
> 
> Thanks,
> Yao Zi
> 


