Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CFBC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 10:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vazgg8MBBoKJAnc66Ha3O1o73O9xFvjsj3CSjHEZTB0=; b=3T4klY4GyHiY+4EVX4wJgdGIgh
	1Bk+/wK4qu9TvsmtqekwrAsFcnjUwxudczEt71McxxLS8FIZo7nP9av0V12LNDVcYDPaiw/HnQ7b1
	RXjgBhpUe7gI+t4wylRvxgZlHt27D3hvutMiEv+SI7dU7sECe3YGiJCYATIiYUoDLCB0gDSB7se3N
	H0HgnitU4ug1FSIVpL6YcgLkxNpeRgTGvB/WFIb+HaFESUyYwJmq+viacpZUZGoB6YXwxKY4DWv9A
	RA9d1NnPk2UsthyTnjU7vQ21jGMGdqtQQPtWFXkalEliXZYbYAkhawCMYD/PbQywxYTs94NGlbWtt
	EgIr5M2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTpq-00000006xPA-1Wur;
	Tue, 17 Jun 2025 10:46:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSfJ-00000006lGE-0qYG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 09:31:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4533a53a6efso2404095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 02:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750152696; x=1750757496; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vazgg8MBBoKJAnc66Ha3O1o73O9xFvjsj3CSjHEZTB0=;
        b=WsyD2+XJSH8XgQSBb4cY6TJgK023R79rhWkvYlOfYVWqKO2PjJUORL429LJtQ13c7w
         NwqGFJOdlpc2emtyzBKuXIi/tiKqXP8S1XCPDjNKRTygTJt2CSqCCn3EyNWWroQag6Xh
         OiTB2j8K5skZt7YYajUWfMeXZK65k1DiKKqlStMAfk6D2cGj7rQFfUk+bCl8gi60qObf
         K1HCwm1snDp91NgGIs6/RClhAvguYovdYAEPlaVrmdJqn918pCzoESMYGmZ0KstGJQR/
         BUVXzeKLo3vC757VEkDErkldlSMTy7kaxvQVXvjVSB3LNJbZZPnxMwak2z/ygAwy8ueW
         2yYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152696; x=1750757496;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vazgg8MBBoKJAnc66Ha3O1o73O9xFvjsj3CSjHEZTB0=;
        b=Lth4CQ/avgMC5fyJxyfZ3vlW02jUMfuNcoqAoIXeCYi2igWhjLUmIskarDFF03NVZN
         CApP/5YN54teAxSdjB4EpcsWGHWljtyfonu4ea7QDZ3oXgPePej9ohxqqkkva4fL3h9A
         nSukXMbTMn9+q3SXmgLprXTLyFzjc1vy1+BcxrblJsuUtaHvHt6PEF8AbhM+gKEEkZC0
         mMNdpCc+CAmVb9vPCGqtMhgpzY/ijbB6axp970aHOHAol4wMJWsG9AYasa3JYoyAoWOQ
         CSuHb3SNMypHCmAKwfywyXcTg7LnnU0Ec6kKxfYEVDbi73rpBcRFKdFt6KEFBj72vh/O
         jdKA==
X-Forwarded-Encrypted: i=1; AJvYcCXjOxhoBEUToHtZPDKOrzHjC6BgETMWt+VTPM2uExrmxYcoOgiWqWD+HkItwlmTRTZqP5TN58+Ny7Mi0sQZBvKj@lists.infradead.org
X-Gm-Message-State: AOJu0YziNpjM5GhZqZByaobRf4ScB5Y4TgvfcDPqF7B5wympD4Iv26Gm
	xg4ggOi90X1GA4pR3Wkzu0AeKyfz+F73iCy+YmspuzRxcXZQS4YLmV9Zrwb9TP9HtIs=
X-Gm-Gg: ASbGncvn8YXcceWiBdzsfSr/PYgRUfbYsdI4c/dles2KTNBqGxIZEPVcP7c7qR9iIDP
	vLFOlagV0OK/wm9OPxfTCtyvdVB0ZDb4vLAmuBA+lHKup0QZf6FYN6/9fCgxzKWPFCmPRhzczS/
	IyVwr3s6wuABsvDyYLdv1CyU1rHyUmvpZVWIzgDiLxGNGwmmQj65ROdouT0HECuv5qUa8UJWIkc
	JgVMblW/TV+N5P7194lAEwQ41wRvFbKS5HbY1obJlIvwSNLbeteDyT7HuRiR2OysLyPKN0GmMoz
	kSpSAgZt/H5rk3HSrXan7yITzykd8osy5g/6/iwLviepUx/5ikuC9gOrSFARx9LPGqykPgtEf3u
	iv04dKTEFbB9MTY+vieKCzsbGVc6EKHPjRzhIOZriKmzrpzi5qw==
X-Google-Smtp-Source: AGHT+IHnkTMalr/l7z/gjX0Vxp3eTn0RvdP8sEl4pN/4V5YFWj81Jh87iSjRIoA3+uUkg9tC20g/fA==
X-Received: by 2002:a05:600c:4eca:b0:453:ec2:c7b2 with SMTP id 5b1f17b1804b1-4533c8ef254mr122607865e9.7.1750152695562;
        Tue, 17 Jun 2025 02:31:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3819:3250:4f73:db31? ([2a01:e0a:3d9:2080:3819:3250:4f73:db31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2618f0sm167835855e9.37.2025.06.17.02.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:31:35 -0700 (PDT)
Message-ID: <0f2b8934-9b3d-4913-b734-b4fe7f0c7d0a@linaro.org>
Date: Tue, 17 Jun 2025 11:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588
 variant
To: michael.riesch@collabora.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
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
In-Reply-To: <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_023137_279249_5BB21111 
X-CRM114-Status: GOOD (  15.82  )
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

On 17/06/2025 10:54, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
> Add the variant and allow for the additional reset.

No names for the new resets on the RK3588 ?

Neil

> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 60 ++++++++++++++++++++--
>   1 file changed, 55 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> index 5ac994b3c0aa..6755738b13ee 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> @@ -21,6 +21,7 @@ properties:
>         - rockchip,rk3326-csi-dphy
>         - rockchip,rk3368-csi-dphy
>         - rockchip,rk3568-csi-dphy
> +      - rockchip,rk3588-csi-dphy
>   
>     reg:
>       maxItems: 1
> @@ -39,18 +40,49 @@ properties:
>       maxItems: 1
>   
>     resets:
> -    items:
> -      - description: exclusive PHY reset line
> +    minItems: 1
> +    maxItems: 2
>   
>     reset-names:
> -    items:
> -      - const: apb
> +    minItems: 1
> +    maxItems: 2
>   
>     rockchip,grf:
>       $ref: /schemas/types.yaml#/definitions/phandle
>       description:
>         Some additional phy settings are access through GRF regs.
>   
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,px30-csi-dphy
> +              - rockchip,rk1808-csi-dphy
> +              - rockchip,rk3326-csi-dphy
> +              - rockchip,rk3368-csi-dphy
> +              - rockchip,rk3568-csi-dphy
> +    then:
> +      properties:
> +        resets:
> +          items:
> +            - description: exclusive PHY reset line
> +
> +        reset-names:
> +          items:
> +            - const: apb
> +
> +      required:
> +        - reset-names
> +    else:
> +      properties:
> +        resets:
> +          minItems: 2
> +
> +        reset-names:
> +          minItems: 2
> +
>   required:
>     - compatible
>     - reg
> @@ -59,7 +91,6 @@ required:
>     - '#phy-cells'
>     - power-domains
>     - resets
> -  - reset-names
>     - rockchip,grf
>   
>   additionalProperties: false
> @@ -78,3 +109,22 @@ examples:
>           reset-names = "apb";
>           rockchip,grf = <&grf>;
>       };
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        csi_dphy0: phy@fedc0000 {
> +            compatible = "rockchip,rk3588-csi-dphy";
> +            reg = <0x0 0xfedc0000 0x0 0x8000>;
> +            clocks = <&cru PCLK_CSIPHY0>;
> +            clock-names = "pclk";
> +            #phy-cells = <0>;
> +            resets = <&cru SRST_CSIPHY0>, <&cru SRST_P_CSIPHY0>;
> +            rockchip,grf = <&csidphy0_grf>;
> +            status = "disabled";
> +        };
> +    };
> 


