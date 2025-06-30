Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72968C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GB6kqlhEVlWK49BheheggyPQDPPVU2nVQPu/NkUByig=; b=EMTuNIVcujS7MvMibdPqgunFyy
	HIzcRrsO0T5yUg3kMEP/ROAYyYIc0uV74bnBDHdIsqQLIE07TYD1e7T9S4hrrN1iweSNEglrO3n78
	vPrXrZ8y8x8CB8xhKwqUfJT/nzngGztMTq4/L2uFfBrSDxnAlrV6tQuNJ6WELSVekwQMkWgQ5JJ8j
	hu5LCHNP9iv2S88TnhDM6fG/qNXuM5XBxnumJJxvguFYN5JA6j17Gl8WEoj5trF5zQFMLIj96I/W4
	IbDxvFZ71UC3rj/wL/cdDAXUt2RLwt+nUNgnSv9RUP17h9fU9D5i75q0WANM98tOvhmzVR83SzTUj
	GVykroPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAMK-00000001gcE-0aMJ;
	Mon, 30 Jun 2025 08:59:28 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWADJ-00000001f5L-0xtC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 08:50:10 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-453426170b6so27010385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 01:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751273408; x=1751878208; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GB6kqlhEVlWK49BheheggyPQDPPVU2nVQPu/NkUByig=;
        b=Im3nHK3MH1gdm03Ko9ypiqQiwRV4K/9+q+yT2wkitR3eh6gda8KTJxGL+1g9B8vv4t
         kG07AFaipEWqXeFaOnDKy7ZSLyZRygXnywueNPdmou9swhuR/ukpNe0dmnOxuJFEdzOX
         25s2r5C7Afi7FKt2e2sjTSizbenbuz4zsDaBD8tZJgTo++AEmCNdfXNOrjusRnMuRqvv
         ZSLDrdzG6/gHTRcewLCIAauInzoC/9ldVLIcJdK7nJ+QHoNA7/XF6o9d864G9GoxV9UT
         h2QM+dPpdATm9p4bQt5BGi1RZmVzkwJBczACBwo7Ll4QLszFZch7tcE/ITNuzvK9H5G7
         mMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751273408; x=1751878208;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GB6kqlhEVlWK49BheheggyPQDPPVU2nVQPu/NkUByig=;
        b=BzAiqVqwiuxjOigCD7aNhiDT7RJZxtay2Rg0b30vuq/yPoO/ZdSfLZht48HnwuGqwO
         OZRHMuqB2s7QjG/QxmKWJLkhouKuHwiLbAaLSeQ2tDE5Q5sFf9qTka+EHa/IAmer6vrG
         zCGfCJcYXjqoo+oUDnwuCzpFnVfSNdsjG5uGpI43j7bPtK167VbcOBdEmI8EtbG72AEG
         Ko2MDomFTjEcmCV0sakt37VUJqT544CZrgpp8HG2k0Y2/Tji0+hevP3iJqNk2Oxg8Gh2
         svthvutsypYieKLZYlqLStvZ5Lg1rMIgzcPJ+IbzKHvgra3RsQ+m5Xtkkcx0K7484Lt/
         rO0g==
X-Forwarded-Encrypted: i=1; AJvYcCWhhbt02SOefQscLh3QJf6NmusJFvMvE8pyaueWgmV81ypX+v4Z2AaK+aSSnUr04O85/oHnzS6yNerJHs++7sVk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9FBiT0lxM0T1Az8dCJlEmrXDBBa+qb32Hx6A89lkfIeudaQ51
	NqcFGqf4uBD5oJaobHbEc5V+H1SFxJyUrxngnBHbD6p4vje2z/ARkrHrdkTqT5K1+zI=
X-Gm-Gg: ASbGnctFuxcX127NhCUyEVeV7TbnUd1wKUJSrRWyNsKgf0uR+3qwI+yQtoja7L7eUcz
	yyvMjoNYkb6xRZaHFqDdN8JfxaMXmCgCJGaZ6FXIU1wLvegfcQkcdDPu2LB4eNucoVeZWQD4kCf
	Yi8TFk8BpYVZ+LIX1WnJ6BXzyvEkRzsw1m1AoUVBxvzY88IItqgV0wrwecjqo3GlgdVFsFTotXb
	ktONaIMhvsl5evaGGuZypdrC05nveyr6mgR1WIp6JC5pavhquwYVPwCQo4osn8/MOj2x2kOzyvN
	KCVGT95QoUErtcRmORzFd8017k7jyX7l0ZQd/kHiL6vrGcxvhK7f1WQF8ujunUDbssPWpB7sIfc
	B4dDesWIZlNZxXC+YP1S8nnFiIlUMlAzWakQGCDQ=
X-Google-Smtp-Source: AGHT+IFQAwSBLqR1ia3wYSYaqryv4RHVS3dP8SA58uVGB0hKz2a6J2muOxRZ3XU0t7/A8x0wCssU5g==
X-Received: by 2002:a05:600c:8184:b0:453:92e:a459 with SMTP id 5b1f17b1804b1-4538ad600f0mr146846295e9.16.1751273407684;
        Mon, 30 Jun 2025 01:50:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb? ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453941c67c2sm82419835e9.5.2025.06.30.01.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:50:07 -0700 (PDT)
Message-ID: <a4b5fb4d-27c5-43df-8fa1-f3b92257e6d6@linaro.org>
Date: Mon, 30 Jun 2025 10:49:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v7 3/4] phy: rockchip-pcie: Enable all four lanes if
 required
To: Geraldo Nascimento <geraldogabriel@gmail.com>,
 linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rick wertenbroek <rick.wertenbroek@gmail.com>,
 linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1751200382.git.geraldogabriel@gmail.com>
 <b203b067e369411b029039f96cfeae300874b4c7.1751200382.git.geraldogabriel@gmail.com>
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
In-Reply-To: <b203b067e369411b029039f96cfeae300874b4c7.1751200382.git.geraldogabriel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_015009_275065_2E31F314 
X-CRM114-Status: GOOD (  15.17  )
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

On 29/06/2025 22:58, Geraldo Nascimento wrote:
> Current code enables only Lane 0 because pwr_cnt will be incremented on
> first call to the function. Let's reorder the enablement code to enable
> all 4 lanes through GRF.
> 
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-pcie.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
> index bd44af36c67a..f22ffb41cdc2 100644
> --- a/drivers/phy/rockchip/phy-rockchip-pcie.c
> +++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
> @@ -160,6 +160,12 @@ static int rockchip_pcie_phy_power_on(struct phy *phy)
>   
>   	guard(mutex)(&rk_phy->pcie_mutex);
>   
> +	regmap_write(rk_phy->reg_base,
> +		     rk_phy->phy_data->pcie_laneoff,
> +		     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
> +				   PHY_LANE_IDLE_MASK,
> +				   PHY_LANE_IDLE_A_SHIFT + inst->index));
> +
>   	if (rk_phy->pwr_cnt++) {
>   		return 0;
>   	}
> @@ -176,12 +182,6 @@ static int rockchip_pcie_phy_power_on(struct phy *phy)
>   				   PHY_CFG_ADDR_MASK,
>   				   PHY_CFG_ADDR_SHIFT));
>   
> -	regmap_write(rk_phy->reg_base,
> -		     rk_phy->phy_data->pcie_laneoff,
> -		     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
> -				   PHY_LANE_IDLE_MASK,
> -				   PHY_LANE_IDLE_A_SHIFT + inst->index));
> -
>   	/*
>   	 * No documented timeout value for phy operation below,
>   	 * so we make it large enough here. And we use loop-break

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

