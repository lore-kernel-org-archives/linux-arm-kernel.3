Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CC7C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 07:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcyMbgDgyo89MWk1toywy6KeNj1X5yjPwiq8FggZGfQ=; b=Ckkm70lmMsBdvWfyhkg6moj772
	5M/3Sg/DJ/YQOs0Rd/fCsUNNILlqMea1O3HLYIZQkF/Vo6RUrm5EjQUWpyCVanrjDr5VKu3/YDZJV
	5mx1l18tLBGrgHhwfHOVvWqpChqPbSpnirOY1tgDaxUxU/8lzov4E9z0ajnnghmeS3oRccw/xdgaH
	J7QfdkUERE7xFkjb+nGmS6SZhDdEevn1Ottpo5gBriisLFPxBtU1dsxNvpgH1IDK/iY2+W0CBkCF6
	H4uOBuryKymiN8wrIYVwF5zdaQAxr8g5SSmJxVgSbeYewf1hNQq7VkCm8CiBrWbZLzhl+4kElih8X
	FOugxcYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YzM-0000000DbUz-2RoR;
	Thu, 10 Sep 2026 07:14:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YzK-0000000DbU7-3mOY
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 07:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=JcyMbgDgyo89MWk1toywy6KeNj1X5yjPwiq8FggZGfQ=; b=drr/jUlxCF5xmwHWOWCnapAz5E
	FW4YExDqH2+NAX7qqngsVIvNQwW3Xgmmev8fy97qNJBWJMk8OZAjfCNAWHj1O8iPsn65S+o5MihNF
	ZIWSo2Ia9SufRazs1wj8ljbHeY6sBcxgg9YY4gdrL3UJLjfhfFj4CI1EfhVxkTnyhrs66jqYbHJr6
	LRPbfVepf8mzAYDpN7JXiHRz1YLHip0IwKPNILujRakP+NWBMU0DuqMZnfkCuzBUKZU644PFlUbY4
	+j3dY1ztphOiv0k0l/MAGaFWQ84bcPzymtu3SvaPlnWo5uyh0Ggc/g1ugoIDKmXScdzLR5GwQ0uI6
	3+Y1ocMQ==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4YzH-000000027TD-3ESr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 07:14:25 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-485888b3c3dso6741373f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789024462; x=1789629262; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JcyMbgDgyo89MWk1toywy6KeNj1X5yjPwiq8FggZGfQ=;
        b=b1I0qHtr2qPsk/CocS+cmdj0Spr2Al8vgl0aJGXfNKSEIS7taZSMVIZe38k+zt9E2q
         AqRPgLm/XAqC9SSWlXB3nW2jtxJcHcZUMmZBC4aY+oUfmju3yRUiqZmGCUG1Os64O5g3
         Zkc55iE6m0FDF4Va49tOP2WNgXsJrvAYY6L21NztY99F2yw5d7eDhL6RN+1BM+P35qlZ
         cpwfQd4IkljNWq38g0d2iR2P0HqzyQVUpszHjvqBhS9iRlefLShXtxmkQqxdQjiSIHK7
         0LtVtwnxfNB+40GIIRQj41DR0tUqmQ5TV1048BbltwrWuLLaobsGiXpU1baWNbbGI+nR
         UW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024462; x=1789629262;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JcyMbgDgyo89MWk1toywy6KeNj1X5yjPwiq8FggZGfQ=;
        b=oH8J1zcRzcmkleBWhvek/LWiENZTaT3ILeKkrWRMbeQINU3XiQ/riaXq2AXE3OSXAl
         Pht2byqm7lNsBGuZSb9xpBqdFv7CNBT6qNMfg3IOO0nB7T5KsL17djz2I4JNVOfmMRrf
         xxoUOJo9cDFCQkwuf/V3P1cWrL8jGZnr9EbHxOpzA1LeLVG9LMaqXhVYgTzdmf9R2cVy
         4SqzGWF2OVS62zMzL1sDezVMYFcJ9sWbR7sJWxeP0ps2gjRVR+ETX1FFhN5pVDgIaEVi
         uVQQCFqJpQC1JmgHb1CG1k5E6sGicEkbw1AuMeOtD6iP4sxaZ9p0EdA6q3yPPQnDGpxf
         PB5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwLmtV0oRQHfLscWcnmBV2nllc1M/JswoYIhXMdAEaYJzwftLanNw3IQIEUI541E0b2LBhqtpcV8JvT0aLf9J1y@lists.infradead.org
X-Gm-Message-State: AFuF++mDPL1cI5ntjFLITQM3GC1VsF66w6dPzm1i3y9Kn1VCjTc8aXVI
	gPPQYT0x6LTKQE/n5U9UJvmA5bBPD1NAuuksIxKxWgMHxW64m1LquKF101pthycBdmc=
X-Gm-Gg: AYBFou20VuF2QGne1vjEobOi8e7ZQssZvGvfT2X1ijBFISvv0kBPCBQ06mMIi0RdthF
	e/1uvAaRI8Jrd4qOvqUF9RouYVSQhC6MpQfMuqZ5Ob5TdJeY8HZhdRVvOK3lNxGcogMSjj1HkrB
	2V3HAPrO/AwL1h4RtgguaDaTy7UQOdeEsZm4ReSSkzgK+Pjm22TlBvv5eo6umLEq/fnz3CaTtt0
	ZUiDuDxzlx9+t/SzObPlFrIf3CNl+OlKQnaP+58sUIc5ztpu5INPZjDoqQxd0+btkI8wG5BYuR5
	WYPrteXwsv4J6anKmsH8LbsJm49Y8sbqTgfbJB1QvMSfy9GuFmPUXhDHN0+AIYH54DNdtV6v1Pr
	35zSShQEuxXlV4YX+DuVK/B/0ZY+UpE6O1uBd3/0yl5xb8C+WtaE0ElG0LkTmAeWVA+dkdOmRZG
	fiwWkpHMWfhKtTxUPiNBGuwj8BAcU4RlIcVj5ouJJyQPTzB3H4WveDK+h5hSC5Ne9TmNI4zaqUB
	rHsv3Lc81zdU47ZN5BM5WHYJZISl1uAbLYEiNm9Wr92zCoHJKD3pQ==
X-Received: by 2002:a05:6000:25c9:b0:485:ac96:7264 with SMTP id ffacd0b85a97d-485ac967432mr8582029f8f.5.1789024462022;
        Thu, 10 Sep 2026 00:14:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3caf:d840:c911:29a9? ([2a01:e0a:106d:1080:3caf:d840:c911:29a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm41176221f8f.17.2026.09.10.00.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:14:21 -0700 (PDT)
Message-ID: <e51d62c0-7d02-4516-8f03-9d1be8c5c64b@linaro.org>
Date: Thu, 10 Sep 2026 09:14:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: amlogic: a9: Add IR controller support
To: xianwei.zhao@amlogic.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260903-a9-ir-v3-0-cd471c667c15@amlogic.com>
 <20260903-a9-ir-v3-2-cd471c667c15@amlogic.com>
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
In-Reply-To: <20260903-a9-ir-v3-2-cd471c667c15@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_081424_303285_0FCEC794 
X-CRM114-Status: GOOD (  14.43  )
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

On 9/3/26 07:22, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add the IR controller node for the Amlogic A9 SoC and describe the
> corresponding remote input pin configuration.
> 
> Enable the IR controller on the Amlogic A9 A311Y3 BY401 board with the
> proper pinctrl setting.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts |  6 ++++++
>   arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi             | 14 ++++++++++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
> index a6b380ca47a5..389c9de3dc3c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
> @@ -38,3 +38,9 @@ secmon_reserved: secmon@5000000 {
>   &uart_b {
>   	status = "okay";
>   };
> +
> +&ir {
> +	status = "okay";
> +	pinctrl-0 = <&remote_input_ao_pins>;
> +	pinctrl-names = "default";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> index b0e0fadeed82..790109aa7c9c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> @@ -241,6 +241,13 @@ test_n: gpio@c0 {
>   					#gpio-cells = <2>;
>   					gpio-ranges = <&aobus_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
>   				};
> +
> +				func-ir-in {
> +					remote_input_ao_pins: group-remote-input-ao-pins {
> +						pinmux = <AML_PINMUX(AMLOGIC_GPIO_D, 5, 1)>;
> +						bias-disable;
> +					};
> +				};
>   			};
>   
>   			gpio_ao_intc: interrupt-controller@4080 {
> @@ -254,6 +261,13 @@ gpio_ao_intc: interrupt-controller@4080 {
>   					394 395 396 397 398 399 400 401 402 403>;
>   			};
>   
> +			ir: ir@14080 {
> +				compatible = "amlogic,a9-ir", "amlogic,meson-s4-ir";
> +				reg = <0x0 0x14080 0x0 0x30>;
> +				interrupts = <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>;
> +				status = "disabled";
> +			};
> +
>   			uart_b: serial@1e000 {
>   				compatible = "amlogic,a9-uart",
>   					     "amlogic,meson-s4-uart";
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

