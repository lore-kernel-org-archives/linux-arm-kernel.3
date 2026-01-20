Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B546D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 08:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3+3UUuGy/B6GuVgP/n+D0fJxxzWSK2/g/0DLsfuws8=; b=Q2NQyt5m5cl7L0Ypt1pjAz7bZF
	IPfBG2tqTc+ggAumyQ1DjNpfKGt5VMTOLtf0cMGKL4QDveIBaFFoNZzRiRHqooLQlt31obll7GVdI
	m6Tsq/AMGHDwlTFscadMnr+g7iMIhgBubIacBsQKnpcrA8yCR50NPMPEa9PEEp6+eWKBK5MHUyPKY
	2PJ5ElNl/J4gRiMlWDdz1W3wB3NixQqIjAsAkPnMur7Hft4yOczKnjT+CW8qyasOML+NxG8W5AuA4
	WU2Qt40cvYRwSB8YThtYDs/NZwZB1enlfvB7as00d9zvhia4id5Y6J5Zrn/vn4dhzSZaq4NHiNqDT
	q1/X7VcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi77v-00000003SuS-3WAh;
	Tue, 20 Jan 2026 08:30:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi77u-00000003SuD-1iIO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 08:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=p3+3UUuGy/B6GuVgP/n+D0fJxxzWSK2/g/0DLsfuws8=; b=J/2yVomi6GRDSqW1g3tnjSTYF6
	dsH4L2/a2ihB2fSmWtFuLUbCiXiXvetJv3RNWHSNBsWHSJxlKSZdrO06ovgUcGHPXR0QYaeW4+ilc
	rgHg2eIu5Q9oLg6V1ULz7Wu/7pqNWuD5Afh34etYd2EJXRcUQx1by2MwK1xN/A9aUbS4LahpTL2t8
	R86Cco9St2/H/bQIX9JXqonbn4iN6HaeIgurduHV+vI0+jwte+VRWfKc1NuK4olUPlbt7UfYUUiVE
	WKq1uZCJQ8erzhNlFN+aRRaUlh6UIROpeaKQZzTUPnoMAt/xvEQrOvO4CJqvcecwHcrTWptKzg82F
	5DFvtfzQ==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi77r-0000000DbAC-1STF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 08:30:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4801d1daf53so34801655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 00:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768897809; x=1769502609; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3+3UUuGy/B6GuVgP/n+D0fJxxzWSK2/g/0DLsfuws8=;
        b=Xo3RFehxv64LyGV1zFG2zIkI5bwi0Yq/GSJHE559FLMhPMORqdUyKo60EIvpORGNYY
         h/40zrhYsZ9x30fXcusCBDMp++JwSzoHQPk0NOGDwSQErLIIP8c37KuPjgNjDRmUILR5
         D4jhf2LrVO1bTbA+kFOSzpsRxWaZ7o2cnTF3nO0536P7Lsz6Y3UOOSxF/2EcBe4Z3QWr
         wRD+MePDfYZSt9E+IafgOZKJA/z6sDmbOcwPmqj+W8kspuStZEkaD/deaMIn8iGD+tx5
         /u2utVCC9Y7/qYXjaDBHxLAZ//bGdU/1dGjsYtznLApXvNRAoqC6CjyQMfeyjjH4Q5Pf
         ikSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768897809; x=1769502609;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3+3UUuGy/B6GuVgP/n+D0fJxxzWSK2/g/0DLsfuws8=;
        b=jonTpNhep6xuN0Iufev6dBNBLJj7gtTGu5mB25ymEzb5HupeFG+oEbR2aNQXcKh0H4
         NzoFE/hjXNuEkgcXR82zRiEP7m8VA9B2HOx3Vg5/rTfQK0f4Z9c9c/LCpz7jkYEI+vzc
         UxW+ga7P8i8czTPpIupOs7KQPKJW/tadEnHRDD2KFXKtGOIcDvBx3zFn5tanCwXZnxsl
         tUVJeOCgrS/B+lCnlqOxEgEh1x5xmfWr6c3iLM7zgZdNaP66/rnNX0LWl+7tSWuoTyj5
         OJmTZlBIlr1sjjFWaD/3M27E/gomoKdic1/BiBy6FJ0bjSKSWaQb3PiG7GK2O/NueOtP
         SVLA==
X-Forwarded-Encrypted: i=1; AJvYcCV2tny6dIvoB63cywOCJKugH4aK4l07/8K8orBEm50qGbKRQhXNyxbA2tockexPBpY7gsHF48KktkECqdtTuJKP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/g5RI4XEtepEqJ2LyzH1h6CeMJ5cyxTgyizeaffIg0sn6fYRk
	e4Pr9N3XLsV/MAQ1HEA8CH24kpgLbdwdwgTa+6QwtP9MecrRhyk+kCF5gIxuIQkoi2c=
X-Gm-Gg: AY/fxX6EoRaMcWdlwfks1ZXU+Q+4WuM98tiladTesxo7Of5CsGTM61KA8qw1G2jHF/r
	JhuivnwfyK9zm6joM3cgF7omp6+YX1gNFzquWe6Sdy3pSTRv344jguSiU3hIxr3foMsk2AQv74b
	miOoNbhBw8PQFXb35hDHHvi058AUpJ7eHmrQsg7KSkJvJrMMbec+g7T9FTAYTIbiPlSf0VZTdEX
	9gAI41CY9jlI8EsoMCYB3htFSVdpr2gxYhUYUzmuNAxNYgxufCzGTMVbtfwEHI567+PExbX1026
	lU5VRrgMR3VshtY+Ol4rDdQgEg5neQdeEQ0ndIYSPcNJYFjRvyWriO+b1kfL3K1Pr9uAYhCR70X
	ur57cW0krb/a87OHDE/GbkcKow0oHTHjfr5hLhIwAoixwM0IaIr3zOu/QX6Ey7vqSMsL0VqlFNk
	F7w62IHc4+Bcaf0luapSmr0747YuQqQBfhOm8FQV1hUs+3yRofOEDqXsZimOJ1HEg=
X-Received: by 2002:a05:600c:3b8e:b0:47b:d949:9ba9 with SMTP id 5b1f17b1804b1-4801e2fe362mr172842035e9.13.1768897809018;
        Tue, 20 Jan 2026 00:30:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0d5:3a84:e303:190e? ([2a01:e0a:3d9:2080:f0d5:3a84:e303:190e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e9d8ba8sm101682935e9.3.2026.01.20.00.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 00:30:08 -0800 (PST)
Message-ID: <23f8d531-26fb-4049-a0d3-6ffbaae46b3e@linaro.org>
Date: Tue, 20 Jan 2026 09:30:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: add the type-c controller on
 Radxa Zero 2
To: ricardo@pardini.net, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260115-arm64-dts-amlogic-radxa-zero2-additions-v2-1-948bb0479a45@pardini.net>
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
In-Reply-To: <20260115-arm64-dts-amlogic-radxa-zero2-additions-v2-1-948bb0479a45@pardini.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_083011_457233_AD785C23 
X-CRM114-Status: GOOD (  23.32  )
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

On 1/15/26 18:52, Ricardo Pardini via B4 Relay wrote:
> From: Ricardo Pardini <ricardo@pardini.net>
> 
> The Radxa Zero2 has an FUSB302 controller on i2c3 at address 0x22 and
> INT# wired to GPIOA-13; include a minimal connector.
> 
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
> ---
> This series adds a few things missing from the Radxa Zero 2:
> 
> 1) NPU (etnaviv), just enable the node, similar to what was done for VIM3
>     (dropped as was already picked up in [1])
> 2) i2c3 (also exposed on the 40-pin header) and the FUSB302 at 0x22.
>     Describes it minimally, adding no functionality, but reserving the 0x22
>     address since i2c3 is also exposed on user-accessible 40-pin header.
> 
> Krzysztof: v1 followed the node name I had found used in amlogic; I've
>             looked around more broadly and found 'fusb0: typec-portc@22'
>             to be quite popular, so went with this. Hope it is acceptable.
> 
> Neil: I've fixed the interrupts pin, and described the required connector
>        even more minimally than you suggested, as to avoid including pd.h.
>        It is also done this way in a few other boards, hope it's correct.
>        I've rebased your/Christian's full-enablement patches on top of this,
>        tested with an r8152 which then works both ways, it's available at [2]
> 
> [1] https://git.kernel.org/amlogic/c/29deec49146162d06b17739c627d062191e03814
> [2] https://github.com/rpardini/linux/tree/radxa-zero2-fusb302-minimal-plus-full-impl-rebase
> ---
> Changes in v2:
> - npu: dropped NPU enablement patch as it was already picked up by Neil
> - fusb302: dropped 'status = "okay"'
> - fusb302: declare as 'fusb0: typec-portc@22' instead of 'fusb302@22'
> - fusb302: use correct pin (74 -> gpioA13) for interrupts
> - fusb302: add a (very minimal) connector so dtbs_check passes
> - Link to v1: https://lore.kernel.org/r/20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net
> ---
>   .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    | 34 ++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> index 1e5c6f9849456..5d32c04de938e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> @@ -364,12 +364,46 @@ hdmi_tx_tmds_out: endpoint {
>   	};
>   };
>   
> +/* Also exposed on the 40-pin header: SDA pin 3, SCL pin 5 */
> +&i2c3 {
> +	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	fusb0: typec-portc@22 {
> +		compatible = "fcs,fusb302";
> +		reg = <0x22>;
> +
> +		pinctrl-0 = <&fusb302_irq_pins>;
> +		pinctrl-names = "default";
> +		interrupt-parent = <&gpio_intc>;
> +		interrupts = <74 IRQ_TYPE_LEVEL_LOW>;
> +
> +		vbus-supply = <&ao_5v>;
> +
> +		connector {
> +			compatible = "usb-c-connector";
> +		};
> +	};
> +};
> +
>   &ir {
>   	status = "disabled";
>   	pinctrl-0 = <&remote_input_ao_pins>;
>   	pinctrl-names = "default";
>   };
>   
> +&periphs_pinctrl {
> +	fusb302_irq_pins: fusb302-irq {
> +		mux {
> +			groups = "GPIOA_13";
> +			function = "gpio_periphs";
> +			bias-pull-up;
> +			output-disable;
> +		};
> +	};
> +};
> +
>   &pwm_ab {
>   	pinctrl-0 = <&pwm_a_e_pins>;
>   	pinctrl-names = "default";
> 
> ---
> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> change-id: 20260114-arm64-dts-amlogic-radxa-zero2-additions-905549fbed3e
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

