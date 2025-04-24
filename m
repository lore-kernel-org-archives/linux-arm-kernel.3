Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903C4C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:From
	:MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNx1WPqtWYJcrBW98RXW8ncyOy163qc9hiiFTZ6Ipn8=; b=CJ4pRrgjnYQuKpKevBm8izWGNO
	ltE5VWuvhRUaf+AuBBdNUrQS4GP83zC7rgY2F/qgb+r/GgIXIUer/NqFIirmcP7/fN5BpNrm4WXN/
	ttjnP2032wEDNtcUVj9sJzD7qAnoOV0PYTWTVUJ8d2+nb9nYNdf+wg+u6YXrrGoDRhMDYi4waIXeW
	dSNAKiL4er/2HzJdJ1TGYkwK9FwgUo9VnwRe5Gd7QuKVxr4SwPjMk9vFuja2V62c/SyPAV67fcrV/
	lDYSU+yT7Rl1GlEzwdFx9PtFansMRgKOSHYcAxL4F5AIbRUid7TKqon8KYgiStuvmbcRVOjb1Cedz
	6rAnqhLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tvI-0000000DhUv-2F28;
	Thu, 24 Apr 2025 10:35:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t36-0000000DXUQ-21AS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 09:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:To:Subject:Reply-To:From:MIME-Version:Date:Message-ID
	:Sender:Cc:Content-ID:Content-Description;
	bh=xNx1WPqtWYJcrBW98RXW8ncyOy163qc9hiiFTZ6Ipn8=; b=jWtyomZnLDeiSnvTjI5gkAC+QJ
	4PFfXWWK+Tg16M2gX8Wl+HnJrEU+DWGSXEUQoEovIIcBmiL0rRhmaOIxBkgFwa0yjmMD5Syq+pAKw
	33SzxsehyBVfJZarpH0mxaGoODjeZmKmQp3mJaj0jP5tRYdCR7+Ap+2NrQlM+RafHTe6yegBYOjPk
	tH+akjvkqXSYhWzh1VPNOK/AcQiJo7czXrCYjVt0X15RC7WpPEfA1ATusvbG0EuERRTblwK9GsXjy
	jglro3nOAoOP/J8pW7sUDhtUaA8A9Ut7XKTE+RgVAue8zNisjEEdV6IVakZlTwgljotnznz+2TXnI
	A7ArGy5A==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7t33-0000000BgrP-1V6f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:39:15 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso3285125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 02:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745487551; x=1746092351; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNx1WPqtWYJcrBW98RXW8ncyOy163qc9hiiFTZ6Ipn8=;
        b=REYc32HAp5bePStoZQLIh3BUX4RqKScKaVLfLBWsUb7a9sB73cFx+TfmGPXgiT9yfr
         9EPsjEg+F+a+74Pur8gWpm15L4C7dGiWnewzovNN0SEHOfTyv6qRsg46LPKRs8vE0wRZ
         heTQPtjRwipZ1qnEdFMzNSwPrpvv316/3Ncn7w14x7pk/BTzXGGTEFtXgKOz/uRqU8Ld
         nU2R0Y7Pe1cwXv2eEO9xA5W9cki4+ci0nty4T8m842LP5JovfI6Lg1Etqz01h2kIi3H7
         UR92Zw5HMXEXFo1QuYd73xf1/XRIfn9b70rNFXPV7Zw56m6ErtHySgU8UD3BxaEU1QWm
         US5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487551; x=1746092351;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xNx1WPqtWYJcrBW98RXW8ncyOy163qc9hiiFTZ6Ipn8=;
        b=IXjSChBNFoetY10jRX2Jf5p75im35phK/YuPBbVjxYu6UZDZE7sUg1rN6yQ4fJ/syQ
         QGO8UyfDy1Nf6SMAX/qfKB6vm6D5eHCgXLvdk476MvVsuRbMvuQu5i3dR7vUkxmzlaSV
         RTHcCaaJ3hm1CDr7+uoz5OSLLfT2PFD0cZjichaqvr60WsQwtiWiJOyI44ealDZw6RxW
         mAyy1AhjRXchi2n3QKo5d1gQU2wFaneDF+o35wy5rha4j5aeawm6fpM4nB7TL7KtmE0q
         Kg2ZfALuDZUXcZWnf0oMsmEXWu4mtqbpb0WXS01TvCgeY/xPB7lqVOkb73BgPp6T5a8/
         Fs8g==
X-Forwarded-Encrypted: i=1; AJvYcCWfYaCyXRd0cp0XCnjejLV8uojpFMLQc29xBtly0mj3qE/X9n/JQinIMEdzozxgs3K7ITwwTN3pK6f1tIUkihnH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz55cQdEbVqPnjEdAmLxniqLBvXxxVDmoDLRDTWhfhh7vLCYgia
	TmMAfBZaQnHvxfrVrSEyK9ziPhNZn1Zj95ARwdOhn+lmzfI/U4x+IyXCbaOW7cGA7hOTjVbJoiX
	6
X-Gm-Gg: ASbGncsshvg1xPk4RNmmscyAdi8nXdkmPAXcv3fsxSfo753PZc5upaV2miEGb2PwER5
	nHQoWqBph6nWKfnDuxAgqWM86H3lTx7T4gB+N8tToDRIyobnmtOGDEsb5Tbs8099cRIv9odXA/Q
	eTxcfWESvn9Rw74hOBm2Tefr00kzgSos4qCgO28yPFSv6cO69C+cW4EKiaGoQ2byiGXwW/GPQKk
	vRBGkvI6sKoO6Lr5hQ6atVC3V6APf6/RAfbD3rB6+L/xZoOQ8pBWiqaeqPJsblxGruukNM8CdpP
	HJTumuXLO4xyLEXEJEjPCnN/lXfomFdQxkppLpxAdX9xYDr74QxjEde1ifxCJV6rD6ALZ8r5tia
	nAbxS0fkaqcxY7zqWLw==
X-Google-Smtp-Source: AGHT+IGtCxdUC1xTXeKfOpcQHvdI3o0HG4SnS9XsPqaKHix8/5R2mY47yF7JotIiZRIK89NFdpuEbQ==
X-Received: by 2002:a05:600c:4fc8:b0:43d:7413:cb3e with SMTP id 5b1f17b1804b1-4409bd0a445mr15832535e9.1.1745487551324;
        Thu, 24 Apr 2025 02:39:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a24a:bfda:f031:720d? ([2a01:e0a:3d9:2080:a24a:bfda:f031:720d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a01cdf59sm2453785e9.33.2025.04.24.02.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 02:39:11 -0700 (PDT)
Message-ID: <3c3c3652-be5f-4f54-a0b8-4829f9549116@linaro.org>
Date: Thu, 24 Apr 2025 11:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: Align wifi node name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103913_582753_8B391143 
X-CRM114-Status: GOOD (  12.57  )
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

On 24/04/2025 10:47, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>    meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> index ecaf678b23dd..9d5a481b309f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> @@ -217,7 +217,7 @@ &sd_emmc_a {
>   	vmmc-supply = <&vddao_3v3>;
>   	vqmmc-supply = <&vddio_boot>;
>   
> -	brcmf: brcmf@1 {
> +	brcmf: wifi@1 {
>   		reg = <1>;
>   		compatible = "brcm,bcm4329-fmac";
>   	};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

