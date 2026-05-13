Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A902ACD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyU4Sq6iUSpynWqIwbV4HNx55pG0GP3Xn1AeqfpoAcY=; b=qhrV5OgncRhS/bcYSz3k+leE0/
	iWy7PCDY7VD98erghJefjfW0SkjLRvCHtCz7SKoeMuebjNnKsFqAZ06DUFrIymAHBtNlTfp5BOmxd
	omrkwgpjPTorAA0wsDIm0eE9ezNPJGGckT5n4KOgMozV5cGJchniD+6OrXWK1jnobYHFd/g9h3Yc4
	rrFW6KyI0vPC+4cfWp9G5DFhHc4LZcW+47kT/KcH77SE8YdDti1XZb59lWhx/NhRfw9pP6c3gCgba
	TCtXEt/ec7yFr3hZRTgTveQb1Hp4kdTRY6mFGEZ4ubU3ybtnuLXT9cg0cv0YMiYQr+pitwkx1cVHY
	2kEklopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8ai-00000002SrH-2e9w;
	Wed, 13 May 2026 12:21:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8ae-00000002SpQ-1PI7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:21:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso60412745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 05:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778674886; x=1779279686; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyU4Sq6iUSpynWqIwbV4HNx55pG0GP3Xn1AeqfpoAcY=;
        b=acaE6XLstju+sGNmXUxSTe7m8+Y0YmBUTaryiFNPLkocS6qjO9xiroNLQoNZ7bRsHh
         RazWc7B58K3DoWpYt/r7Lo+YV1gCuDsyF3P2mt2kO1KKLbMj/KuHgRLKjomvuoK3i5dJ
         YZs3Ffyr9nn22n5JnZxSvzTsz3kQvfAf+hx7mxYc8UIH+cDZ/pb8MYe1tUb1AWWEq4CT
         f5wVKivLGguA4tzSQ9X1/C4snTyPtnJQsDHmwFuRtXLZVOeIOICUxU4iedm7JDq0IzeQ
         SpsseOQ3T18xUQCwIZt7d6p1v0agZof29PBFVcrlK3MCPqpW3XkP2/MkwOu3dDSqr+EY
         5vAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778674886; x=1779279686;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zyU4Sq6iUSpynWqIwbV4HNx55pG0GP3Xn1AeqfpoAcY=;
        b=agyMVtBuShzFb6BgnjAnU51xgZfOH99sNMIAZPUah8ySygyzKRkL1Ds4WH7LcDjgC8
         kH0cAm0ZQ4xCYMMrVVkuq0ig7JZILKFs/gVM3vdoosT5ZoUJ/7DEMfJ7aHtvhdwzhF+/
         8nIPSCT417UP8Ty5tl0+jb4KxPa8NiQZX4zLLS6IqIYEkAablDHtH6QbHu/neEeat7sV
         H0lh4rrQ86C+/7efqYHjNFJcYGRtotTLshfaZQUsyF1vgFbz9KCgCwjN5bIDQyzAq6Bn
         ZsZ9ZLUiHnJo1H0XtO0/XhSjzP7vLB087Fga0z3q8x4lczclHac76XQbAdbYKJHkBuFi
         PukQ==
X-Gm-Message-State: AOJu0YzbNKjtFmpqFw+4tfNJnJI9JXEBOhfibin+9yl/F38wa5WbhB8p
	bwiruziQzluNuEFxuiHDqkwZjakLt+O78JGzfB3m85+I0zgs/qKCnDCVgI6lRFzP+cM=
X-Gm-Gg: Acq92OE4vJV4X29cM3esxliPRxD/ObqtbVibLxIkqeYYCdCvUNEpAJWYD4bw1OYc9Lz
	x/OJ6bWXMZ89yAwcPHg3y5caJPT4/u6kDR7zGLtNxxKwTIvClLRh+eG59EnLfgYV3ioqOTmXAPq
	AGHR0SuJFXBlwq4/NxLA2+5SP0fcDdo3oBolV6lN6O1bgjpYuJSnKc5XEtbVoYvUi01yM+fcct5
	bBIrISNNVznxc2DPJd33LW26W3H7sNFxOb0F9/kNmGHn1yKe+6CraIt1djDuuKm/8db6NB3gdk0
	zj+bPOl7vLw33HGpMjqrP5xvAVExTwiIRvgOZ3lAwWJQafNMJmcaTCAz9BU02no1OBe1doeOV8f
	FtPZx3trfoDH6AHcMq4ic/FqLbL1eIWxyGt/7QWBmczPglSt1mjlyL9rELt3DVHz3TVOF7X8v0C
	LgZ3h0hzaPxEMYXVh9H2bjfxh36yfdXCCfm9P+FnQYTnqCMjYZEZg5YaYqEdGtJ8wM1/e+0dhgw
	3bYI3Nk5NMWPfw=
X-Received: by 2002:a05:600c:19ce:b0:489:a4:e578 with SMTP id 5b1f17b1804b1-48fc9a34777mr40690665e9.14.1778674886244;
        Wed, 13 May 2026 05:21:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d68b14sm71555635e9.12.2026.05.13.05.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 05:21:25 -0700 (PDT)
Message-ID: <f965ac54-f302-4e0a-b079-564abcaaa38f@linaro.org>
Date: Wed, 13 May 2026 14:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: amlogic: t7: khadas-vim4: reorder root
 node
To: linux-kernel-dev@aliel.fr, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
 <20260513-add-kvim4-sysled-v2-2-3ec9779e8875@aliel.fr>
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
In-Reply-To: <20260513-add-kvim4-sysled-v2-2-3ec9779e8875@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_052128_400272_5B1F1A6D 
X-CRM114-Status: GOOD (  12.90  )
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

On 5/13/26 12:43, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Move the xtal-clk node to restore alphabetical ordering.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts     | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 69d6118ba57e7..fd1b983354a01 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -45,13 +45,6 @@ secmon_reserved_bl32: secmon@5300000 {
>   		};
>   	};
>   
> -	xtal: xtal-clk {
> -		compatible = "fixed-clock";
> -		clock-frequency = <24000000>;
> -		clock-output-names = "xtal";
> -		#clock-cells = <0>;
> -	};
> -
>   	dc_in: regulator-dc-in {
>   		compatible = "regulator-fixed";
>   		regulator-name = "DC_IN";
> @@ -155,6 +148,13 @@ wifi32k: wifi32k {
>   		clock-frequency = <32768>;
>   			pwms = <&pwm_ab 0 30518 0>;
>   	};
> +
> +	xtal: xtal-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xtal";
> +		#clock-cells = <0>;
> +	};
>   };
>   
>   &pwm_ab {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

