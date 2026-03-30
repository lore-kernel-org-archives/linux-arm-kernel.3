Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D33FF4958
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 07:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUItjZv34EZ10kX4LACTE3wjNz+JATlDo11i94BXg48=; b=1hWCNOc6mgG/kWOLKACk4B26eI
	PlLpYocBn41nMB0vG1a2vgSpMonZK28T2sA44ckBpletP8vBAn4MyMaQ9zlyTGgRaEOPIMlVFJrYe
	YzSg5RzGs0OGnwU6b0QLzpebo10yeTHqUJrfxb84HmPFcQrXdISv8kGBqPBJ8huQ/NJw44J0RHPqW
	4tf6hrqdoN4GSPa+pMIikobYN92lsJSxkxb9Jfb0oB7zxNTnSg6B30aMUZMs1UlsRBvB4ng7q+gNY
	0Fg5Bgq8oLPF3aE81T3v+gYvWQeHyZdKE1DJavRbSZkqe/Eu/sK393DI5c5BKEhXxunB1lPfAArPL
	sD1Wd6NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77TI-0000000AnUq-2uOv;
	Mon, 30 Mar 2026 07:55:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77TF-0000000AnUK-0noT
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 07:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=AUItjZv34EZ10kX4LACTE3wjNz+JATlDo11i94BXg48=; b=Z+N3/3ws8BxgjbSF7KFHKi2wm7
	GCYVx6dNWaOJMK9+3qKMGMJhd4bP6LTcOBXcArfENLrhlFakFw5E4yW2vMmTtr4Ob5HD/LGOG7dh+
	bWa3d21kxew0F5AnCCTvsiXF2cmkz1FSuDCRoDx3Qbqjl7B6c39lPujWhm8YegB/+LFVWYnShgvTX
	NRj5PkPL65ecXiLg+GPxVdqCNp3CXCHDYJ2TDLsuF400Icap2sx0Px2FikoceOVZXMJXjdble2EQn
	oUqc0czwLRJAkcZHfpy8mSevHU4VeG/y/RB+EwRBbtP0TpNnem4mbFSDba+lhkf6JZniVcySTEqPI
	bbWOcyzg==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77TA-0000000DG1W-38tL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 07:55:35 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso40599715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 00:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774857330; x=1775462130; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUItjZv34EZ10kX4LACTE3wjNz+JATlDo11i94BXg48=;
        b=mA+a02G9c7zhX/cvaLeBmG0Q9neUD9YgmOf9z6mCwARXp82zA7yhSOcNMWkjdzrnh+
         RPaZ4ao/FIEOcYm6r4Lu6oqGiLIQ1qsTsN8+YUUbSq1DGra5ymNBXnkhZf46J8wWPwa4
         1uZZkTDzWd5s75shKIohqODFwJ/6KbzxRBMKzdVgCD8ngvJi/9tCGOMnnj4XHzRDVMrg
         vu9AW31ZMYDF7wDuHJU9smJMREBDUDJvxZ/kIgZ2k5KvX081SY/FP6o2D9ib/OIQ79xb
         9mKo9/r1951FvYK0U23GCmJULxdCgISIH0JBbe8NioIZ7xLiMrqPFBC2VFpU1OX8zQLm
         CiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857330; x=1775462130;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUItjZv34EZ10kX4LACTE3wjNz+JATlDo11i94BXg48=;
        b=jgqlvW5/TNXFc3qIj0OArE6enT+1Yu4G6uiHyNwD0KkUJqPr5rpAhLy/01MduiZoRB
         z1vkD90z4MNvQBbsCriPWtQ1kZUg8X5iZHvlc4QH70eSM17CGGF3ilTqshkAneUMrr7X
         pNoU4183xo/RBsTv03MpGRbdRCwk3JfI2ZuhKInaHA/zcOVe2HmM+HCBMRCpkk+DBnaJ
         Tbg6N7hWr+28pPWRGU4InVxceYeZ2IZdrZsMTcw2A9n4EcAgriItc7un1wiAOf7S5CJP
         DsapGuHQr4OReEf89dzzxMgGmccXUAJFu8iX2MVJlfx+rMuWU3lHVMaNqZyPvpdRcSLi
         IhvQ==
X-Gm-Message-State: AOJu0YzQS3bQke7EyD07EodU5b8Uv3Osu762i7+t6dHTWYQELt5mlxVD
	M6FsaQYvnSKEPcjgtmFvDbIKCb4hyXarX6YWBMSEoVLSCaPEbLmAi4p38wf3I9hlG+s=
X-Gm-Gg: ATEYQzw3Ti68AF7JAaFKXBNI7yks3mNL83XLJlgWWeMwl4DQs2sANkjAfQ3aWWVHzYL
	7uPGvHU8sAc/6Ripi01C4H5sF8WJt9K99wOUk9wnpXuGc2UeuvuWDS0BSHh9LhEtFwgRJxsUHFw
	4U7+ij8p3i5w962jMd5gpKQ6ZyAbhZn7/uLGNOT+LxLgJqSrUh9FrEa+FE851pk745iwZF30UDz
	oQOfPlKca6F2b21/03uHOuRq1RNZ0gqQbuUGbfIch0F/SX5s+MUaXVmPIVOzJBLl6A7GR72yOJL
	y2yf//wJOnQ6xaIrRKp6gxHGAGWQFh0U6E7kOQghhWXDiBzqs7Y5L6Tc4ay+iY9qGcJHYxlZNdk
	pyd0cV06Fwch6tnFxHWKi0V4/2c374n236bAziPnygwscnzBdhJOFKFu32papNQwUxwnum4NBBk
	ZLLQHvniF5b5XhjaLFOrjSYqZ6JWsM1RgYUfkdMc54+v/FlkKHbpSf/kW4n9HzDgEI/RChfQKe4
	DInKCc=
X-Received: by 2002:a05:600c:4f91:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-48727eda62emr178938295e9.20.1774857330208;
        Mon, 30 Mar 2026 00:55:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:cb3c:d0d2:870b:6ad0? ([2a01:e0a:106d:1080:cb3c:d0d2:870b:6ad0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48735faac9dsm60393575e9.0.2026.03.30.00.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 00:55:29 -0700 (PDT)
Message-ID: <416d42a6-8d99-421c-91aa-e705f23576e2@linaro.org>
Date: Mon, 30 Mar 2026 09:55:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 6/9] arm64: dts: amlogic: t7: khadas-vim4: Add power
 regulators
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
 <20260326-add-emmc-t7-vim4-v5-6-d3f182b48e9d@aliel.fr>
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
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-6-d3f182b48e9d@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_085533_004847_0C97A0DC 
X-CRM114-Status: GOOD (  13.67  )
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

On 3/26/26 10:59, Ronald Claveau wrote:
> Add voltage regulator nodes describing the VIM4 power tree,
> required by peripheral nodes such as the SD card controller.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 90 ++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index fffdab96b12eb..2450084d37642 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -6,6 +6,8 @@
>   /dts-v1/;
>   
>   #include "amlogic-t7.dtsi"
> +#include <dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h>
> +#include <dt-bindings/gpio/gpio.h>
>   
>   / {
>   	model = "Khadas vim4";
> @@ -45,6 +47,94 @@ xtal: xtal-clk {
>   		#clock-cells = <0>;
>   	};
>   
> +	dc_in: regulator-dc-in {
> +		compatible = "regulator-fixed";
> +		regulator-name = "DC_IN";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	sd_3v3: regulator-sdcard-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "SD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddao_3v3>;
> +		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
> +		regulator-boot-on;

> +		enable-active-low;

This properly is invalid, please send follow up patch removing this,

Thanks,
Neil

<snip>

