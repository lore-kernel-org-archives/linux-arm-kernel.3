Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E18BFE51F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 10:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xq07QUD8xIc4JRSL4PxKVMWxBFYSl0vshdBEVj4c9kM=; b=ZNZbrhvNga7cZUCSjH/gPQkTzQ
	7pkeA2IoEDjpev7gONlxvcD7slG367XGetzRI4/SUy3wweyEQ62WKQ3DPheSXyx5UXBGGiMmhKjT9
	tmfzOhBjXWlkIx1uXP6i1bEAqWHKK2vXGbnvw6b/2X9JS/yTqIFlRyxoGU5KbfgNP3faFnZUDMB27
	ncVvQduf1p/aTGcgQpkJIN7XOOTYjXtT7IuBG9DcBko3AYQ4ffic++AqzMdjMFRA6GtaGJDr7Croo
	R9sJJEPcQCfXQt+B16gzShmRIAa66eYAMor0f5h/TcAfEpQKKXISAH1VGEl1+dPGZ5R1LIOzJrkup
	zXU7hjDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDLK-0000000Cyu5-2OoF;
	Fri, 24 Apr 2026 10:01:02 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDLF-0000000CyrP-1Izq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 10:01:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso71476655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 03:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024856; x=1777629656; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xq07QUD8xIc4JRSL4PxKVMWxBFYSl0vshdBEVj4c9kM=;
        b=ZhiWgtYDglV+VnPo8+8lw2ZRLYbhasobfAHSHWyernX7kctLuE2y449Uh2HJJz3bNh
         eC4LZjcshBCArPJSLPaOw0i+Wfa/+1sWGd+k1w0yiZyizxUjp40guufy2dRtHWoi95wE
         cNTH7zcvX0ArH7JkZ3RjaZteWE96KaJ9eBf0PSgRA+MMh0lQtJaHSYItAOVa9t7gVCv3
         Vnzt81pv8n8JaO6fgSM3wi5GsHSgL9FSsKj2yn/IZxXA0nVYKkCovjrKQ34wfmBnGygA
         w6CR0FP7kMbCwwk9C19TSPfdH6UZP/UbsM9hOOV2PIwJxizEbg2mxS/RVN1O9R/nRTGr
         6JiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024856; x=1777629656;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xq07QUD8xIc4JRSL4PxKVMWxBFYSl0vshdBEVj4c9kM=;
        b=ASoioV1Tz0n8jAGX+Y8huHum3amE01iAAGrr1qt6RBF70OGCAh59vBo/BqT3sJS2Zd
         7H+niluX0dHOhvHKpSgrYMuQIiR1f0tGwZmkWa9M1woIvYCY854DYSLeO1hdCl3ryUXa
         tOsgzpoG1A9RfXmfjbg3w8+/B5QWXOv23MbHzECnOfw+CWQjO5lKDWvLGc8n/p3V/74F
         7/S5hKKbFkgwrqw5LxLKTBnxaUH1B3EwwUYiHR+uA2XNGLpS95fzGn0R8fH3f6pSA+1b
         hF4hoBKPIry0TdNm8QJhZrwAKzT5zviS4RHgNmhsQEfdrnGxnoSCT7aP7WAwEO7Qr7rd
         qYQw==
X-Forwarded-Encrypted: i=1; AFNElJ/6xqJ7oUMdnu6XkihbB7TZbhhVEUiebqGoTgmk7GSGvTDhiSwVlYwMK0ZgrjIQDI/yVPRiP+WQXe8BKXJsC+ik@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7s51t0h40eb7IzBXds49AX2NnUUoWChHmxVZ56Slw9oH1GgDD
	YaOOYS1QeF/kA+Nkj+JOxqVhIZq1IB94sWPeMuN+BtgCaE7IAdrOgHUbRPT5ujLzhvo=
X-Gm-Gg: AeBDietjIaKhn4EcD/L0Mqwk2NNBdwOWV78vjDNfseK+6lFBr1UQnuVE/UoAI+oHnzK
	jvLxOeA0o40h8fKpAdRv1WcKLGvSXj/7sYiROJun3RQzNme34Ce/ZJlF44LdIFFz0y6VZQ2xzoI
	ZKOz6sc4leUnW0AZ1SZrMcI5+55cR+/acBG0htkvX1OSZTaa98JvZ+gq0U5nHYOY5thlFR4BiLN
	/OtzxAZK/8YuuQyVk2uY+i6PVuzk66ufM54xZwVU4cvApfbslIhm4PKkn05CfP6mqg8uU4bzLwS
	cB8OP9wkoFo2Gb51Eq029LMq3PWh5MKU59ca1w+JvEEQX9F1cHuajW4HMlafzcZBCvEJB7cAdcf
	KB8rLCKOZifk22DtF/6El+Nv4Mz/KLkG8PSa+p6ETVGUdeZiVFQrCbSbwmOymNma3a1VNo+e59o
	4JKJgdXbML+51t1NSVBCBOY2ghGo8N9DaxBCiHdjZ6zohwRFnPoc56WwXHY9CYAGFSINb9W04yf
	iIFDUn2XJGdSv5ctw==
X-Received: by 2002:a05:600c:b90:b0:488:b99b:4177 with SMTP id 5b1f17b1804b1-488fb78ee4emr429943265e9.25.1777024854110;
        Fri, 24 Apr 2026 03:00:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7a0b60sm169961765e9.17.2026.04.24.03.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:00:53 -0700 (PDT)
Message-ID: <e65c3933-996a-4ab8-8431-3f6ae18e44bc@linaro.org>
Date: Fri, 24 Apr 2026 12:00:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 6/8] arm64: dts: amlogic: t7: Add i2c pinctrl node
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
 <20260421-add-mcu-fan-khadas-vim4-v4-6-447114a28f2d@aliel.fr>
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
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-6-447114a28f2d@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_030057_391525_057E44F1 
X-CRM114-Status: GOOD (  12.08  )
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

On 4/21/26 13:49, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add the T7 pinctrl used by the Khadas VIM4 for MCU communication.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed623..e96fe10b251a0 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -376,6 +376,16 @@ mux {
>   					};
>   				};
>   
> +				i2c0_ao_d_pins: i2c0-ao-d {
> +					mux {
> +						groups = "i2c0_ao_sck_d",
> +							 "i2c0_ao_sda_d";
> +						function = "i2c0_ao";
> +						bias-disable;
> +						drive-strength-microamp = <3000>;
> +					};
> +				};
> +
>   				pwm_a_pins: pwm-a {
>   					mux {
>   						groups = "pwm_a";
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

