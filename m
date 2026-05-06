Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC53CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jERKJjknkdQ4i9JtoqjPY+iXeD3hkNunomlZQlqiv/8=; b=hoeEsZOCKIvzIhDdvqujB4a+aW
	Piq1K5aB62UWjPg33FWLfQgAcO5TU1Z3g6UHaX8N0hsMFd2+v2tD8FEkTtMBK9DGdYZ8dFA+bjK1/
	MMzh4LxD4g1uANbZkXcr/wOpofws9wz8Y/w4A8bH93jCFGIXm7bM7SLtLtQow8TIOw7bGZWwzZ/B8
	EI4Jv4j6gZMEFfqrOf47xikTsTcXgKGyO3M6H/nZim6gLSOUGWkXJZEULowmWCSBdkb8JlwQyJkWs
	wdX+oUfNsWo0rfqQrvlnlumfdqKIfxpON+YwKVInljLBSgWWYPKrULe3eHAs3wx5/W6nBSC2pwdnO
	jhoakHlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdZ6-000000019vT-34h9;
	Wed, 06 May 2026 14:49:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdZ5-000000019tk-28zV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:49:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so62179665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778078970; x=1778683770; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jERKJjknkdQ4i9JtoqjPY+iXeD3hkNunomlZQlqiv/8=;
        b=t+Mip8SPjQu/xIIZXsODgo65Ou1PlZgG2uyYQ39msfCQGDCTpeXvyUkHUMmEm4RX2S
         4ROq4uEgquxFXwgzz6agOCqy3AOAnQE1xQ10keUzTYX5aCOnMYTLH4RQ510TcLzF672S
         PzVTJN5Qocxi+HtosCkNRiw/n1ss9NnP8WkuOvmmofZTAK9YEwlWmdvAvysgolYzounK
         b4kCgPTMtKrIHLWZ00iBqA4po3x2MUg50VXqmTMh7Z6CsoZq7jHJKiDCFP3HT3gWq5Yn
         ZbX5eLmYcctNMk9OwmtAfBziNV4MIiRoQEVGDYlF+Gp3RhwwW3smuVqW4vhlnc+0iBD8
         xCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078970; x=1778683770;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jERKJjknkdQ4i9JtoqjPY+iXeD3hkNunomlZQlqiv/8=;
        b=DTKc9hPIeI58kNr8zY5NghifnGzvw10Lo8rA/NHydQDX28cgn3BDv3YsmJ0/06kPSw
         fFRvfLXj2GD9fRWBYaogsjcX6S7OZV+NptQjzYTxUZ4NEntSPTrVW8kxsREIsAvGqdj0
         id8aYPnaAOU7lKGjbW0P/6TwbCT23NHQ11xQAK9KVZPWiaZidK2cYp5i3MRU8y5/oCY0
         tIikd3QDyX+5jOKqcO6nx+rCiMiFGFhjS3x/IMPk7hVx9EJpM9k4kQcfHS7n1AGh9qX6
         vlNAUOhpp7YPlwdyEqAC+cxy6elcNyWOQhfTCb8ulLH/PxTzYSpD0fL3/+DGwLtt9PWG
         yb2A==
X-Forwarded-Encrypted: i=1; AFNElJ9fHoigVhSeUX4/YvVXc26b8AznasmD8tmjqKL+yXfARkn/gvazOifXelZLv0z6+UBHRHNBSpvzIW4rznEjg/y/@lists.infradead.org
X-Gm-Message-State: AOJu0YzGEOY+vy9ewMTW0HKX22T5kfIA13OlJU6rO4E1QuOYBH/Csrqc
	kEgSvbgLoHLAlMrCT8DxoqKhL8BoN/LdSLDwtohkQKdhROS8f86tZer1mpN2af3pbD4=
X-Gm-Gg: AeBDievfy9+KUdyqJmSzYL+B9ltS4bVuiSBMGOvQVmHmOjW01V1t8Hr7H0nzVA1koAv
	MnXdr9YQgW1BGQ+zr1Nz8K9jrJ/A3hVDhsn27pl4rPdYpMCYDSiGT8+2qfkJIv/4QUlOaA1J7eU
	40HeKh1w6bAhF/JrEX7lQAr0cAqnGCqhLkvU7a3K51iMbdiwlSAxh/ur947AY0eODE7KGX28wLT
	olrdhsZLDdrSIVApSidHB6VBeeVHpGDO5LLAWTrSGTjmbsRTu/jbReHl5cjYVK+452P66AfZUhv
	I7GdysrSg+7dDXqk/wq/aSM0aoOSpz7mek6m1AnhOBCOWKoyDTcdBZLgYO5g7mzjWgIis1qOPaL
	NvCyFdEvr4LeMJjfryF0KQwp4BvzoD/yX4h3KCPrTbiE2K5R8T+pdJXAiEeK3wlKkNKGx2mwb2I
	pFrVeroP4GpU9acwVitlN14Obx5aK3GD6XczMIwLwBZHwULsFDfWgTUIOJv6y5eyRUAByhYjOHt
	rM8+w1x9Upob/phTg==
X-Received: by 2002:a05:600c:8907:b0:48a:65ad:1881 with SMTP id 5b1f17b1804b1-48e51f32a46mr51738465e9.13.1778078969666;
        Wed, 06 May 2026 07:49:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5312dcbesm18061055e9.22.2026.05.06.07.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:49:29 -0700 (PDT)
Message-ID: <3010fcb6-f5af-41e2-aa5a-ba4401513a52@linaro.org>
Date: Wed, 6 May 2026 16:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 04/16] phy: rockchip: usbdp: Amend SSC modulation
 deviation
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 devicetree@vger.kernel.org
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
 <20260428-rockchip-usbdp-cleanup-v4-4-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-4-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_074931_738204_FACF9268 
X-CRM114-Status: GOOD (  14.69  )
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

On 4/28/26 18:13, Sebastian Reichel wrote:
> From: Frank Wang <frank.wang@rock-chips.com>
> 
> Move SSC modulation deviation into private config of clock
> 
>   - 24M: 0x00d4[5:0] = 0x30
>   - 26M: 0x00d4[5:0] = 0x33
> 
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> [Taken over from rockchip's kernel tree; register 0x00d4 is not
> described in the TRM]
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index 98562a888b42..1f686844c337 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -350,7 +350,8 @@ static const struct reg_sequence rk_udphy_24m_refclk_cfg[] = {
>   	{0x0a64, 0xa8}, {0x1a3c, 0xd0},
>   	{0x1a44, 0xd0}, {0x1a48, 0x01},
>   	{0x1a4c, 0x0d}, {0x1a54, 0xe0},
> -	{0x1a5c, 0xe0}, {0x1a64, 0xa8}
> +	{0x1a5c, 0xe0}, {0x1a64, 0xa8},
> +	{0x00d4, 0x30}
>   };
>   
>   static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
> @@ -377,7 +378,7 @@ static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
>   	{0x0c30, 0x0e}, {0x0c48, 0x06},
>   	{0x1c30, 0x0e}, {0x1c48, 0x06},
>   	{0x028c, 0x18}, {0x0af0, 0x00},
> -	{0x1af0, 0x00}
> +	{0x1af0, 0x00}, {0x00d4, 0x33}
>   };
>   
>   static const struct reg_sequence rk_udphy_init_sequence[] = {
> @@ -412,8 +413,7 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
>   	{0x0070, 0x7d}, {0x0074, 0x68},
>   	{0x0af4, 0x1a}, {0x1af4, 0x1a},
>   	{0x0440, 0x3f}, {0x10d4, 0x08},
> -	{0x20d4, 0x08}, {0x00d4, 0x30},
> -	{0x0024, 0x6e},
> +	{0x20d4, 0x08}, {0x0024, 0x6e}
>   };
>   
>   static inline int rk_udphy_grfreg_write(struct regmap *base,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

