Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C609106F305
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alkbuVKROditw0aGu/OnnUsWfxL3CtIz8SG2uW8L1eU=; b=L5sy4oBVkAFAyCeXjZuHdKZVMn
	A7wpPnXdyHxOUcsQxXAr/V9RoYatlJy/4NfWa6zWBm7J7cwpt3ML0aPNpoG3qQDMSxBj44gLMN8/G
	lbhvW6RsZCati07y2y3chP5SWGFQviAyTARwXberX06qFAWZO7D14Zh1EdrtHRhs2xXp0GD8NTvt/
	AwciJ7wWQ1agyroZswvt8ZwtbUO/6dBkyAJDPGv8KGBZ2mZ/o6QSciQV8DmoPgFtoDXD/SySe6Sqn
	UK0iEtm2IvD6IyphvQbCxdaBXDRiFfJW5dPjkUjsrGK1llEPRL+p2J+/dcO2gh5tW91oeTwOZ+gQd
	1MWHWrDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gSb-0000000541D-1lW3;
	Thu, 26 Mar 2026 08:53:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gSZ-000000053zp-2BEE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Mar 2026 08:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=alkbuVKROditw0aGu/OnnUsWfxL3CtIz8SG2uW8L1eU=; b=a/ja65JeU7p1s1uLdoY+H9uZxg
	QQpE5gzZTJmfHOO4SRn6BbIL6q/Sgdl3LULbbMt1bjHNFoc5vMsTkcjONkdvFOsjpr8DpsPW1OEwO
	pA7V1qIY+DoFYD17oxPSVo1uXRY61Xp+xIOgkACk7p07dmZOFoQUFrl6jwWySW6DG1OefRsAUoQHO
	d03rh1s3SSMh3M2fgVl0traan2DlNP3rk/NuYIiTYnU81W1LuP7aAXXWq9GqSIXjU89LfCOBptyVp
	XshdErWmR00ojboF/Ln/cOLtOU/cUHncYa0BzZ3cC2WNQCz2zMGJv8ORZH5UHxuRhXmmT+L+C5erY
	zcfC/29Q==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gSW-00000007nda-27Hm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:52:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso5702125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515174; x=1775119974; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alkbuVKROditw0aGu/OnnUsWfxL3CtIz8SG2uW8L1eU=;
        b=tEtxp2nLSAhUM6tE2ee0LpJp94DEPQNP6tfHkWqPwc1IbBZIg+tmODO9y5CbRUKlVN
         pQ091wrpc4f9g4V/usZztGeXHCS0+vZJuquoR0U2l1m4LY4GFULYFzWbMufSkCQUzP0k
         jif5xnJOtMvnRQybfzs3mHJ9tctedshPvhQJwgAdGcELidfz7HK9rs3+2KwdHQsJWzOy
         MkqNwoW5yUYDyZ6fQ8MOlapwlUHFPfe44U367fs3Mr5Mu0ktxSNK3yOcsgRsNmDTQSDV
         NJ36DebtmutEvv6THsQgOFfY91YcsT6/iOD7iDLmLFUMRUgrHsloTVEnleXhrnoqfGxm
         sZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515174; x=1775119974;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alkbuVKROditw0aGu/OnnUsWfxL3CtIz8SG2uW8L1eU=;
        b=VMYeaGjmNKdxRaZ4PQPndV5GTePygDd1dtYEZ86OPsGP0ZJF4V/LHdndypFReAuOBS
         H1UAd1ZDHlnlZG/Nwl+OcmQ6sFppxu25fXeeUivM/YHRHBjoPPPr0cqTKN8HY1jK0jn6
         lybmZZLHYpwHvZ/EW8LF3K6hBeoiWlOGXqyyw/WRFBFBUpAP2sTFhgI+wBacMXvcSxJH
         hUeFJNMHyU0roGZw67YdfDSuL2TmElp2tGxWHBZ4Ag2KV/gV0yUPgKX6GJa8aERjn/EU
         Q1aufB/r6PgEUvoZMTbIOKR+Ei1ySBqDZKmn+d72X02h+sCGwMG2wzdxVc7mouSh+XAe
         d1kg==
X-Gm-Message-State: AOJu0YzshVJvbKZMQoX/k1V2H5qone7KoU4cJGHeZDWCfJQB0N+Moz5b
	oIeUF7hY+E0t+AJ2ewfzpseoMeQa4rhbARgjEo2sf6sj7L+77o/wO2mn/zbUGLVim0w=
X-Gm-Gg: ATEYQzx9/2S2dtacC3RJerIfqjqKrY52DwbnXvj4EoWaLybrncBV3Jady2o5ssQetbQ
	HjqaJQM6Lzvj6VsC0N9CfZPlSNFOUZhLQbeO6YbpKNNcLb+ZNwt+BtCeIKmf9JQ/bfKFRz9l7hg
	SyeHXCX7qPi6UpJBcIZRwYyPD8oYBamX5fyYLhsa+4sDlJtA3xtEY3ybRUM56mKMx330TLk6cjn
	ZrxOapvLw84cRV3fboLgCrsMEx30alAYCiEi+Nwo+i53YlshWxspV+XpQxkqLkJiZ53Uui0j3n1
	aQYro//hCTxnEJ1WvLcRHdGpDRbDHztbWmeU+2blzfYfFvLCklvxVocG/LTeKDJIWprjzZTSCNQ
	BVKkCO1ZAddkSNd+LfSSf1gGB0joZKOOyN2yeW8JX83Bfx6ZnhcFZp0IKFi47TbLLjENAezFKvr
	JYb4TPBZSnK3UMmBTrBEja8N+EUd7obJvD0rjXdNt991TJrMQQTBoytvx8oUBo53WzFNWWSfbFn
	lCwtsg=
X-Received: by 2002:a05:600c:4ed4:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-487160083f4mr106443395e9.15.1774515174254;
        Thu, 26 Mar 2026 01:52:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9179b212sm6621276f8f.0.2026.03.26.01.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:52:53 -0700 (PDT)
Message-ID: <7c207f00-fff3-4506-858e-db7dfdc32ccd@linaro.org>
Date: Thu, 26 Mar 2026 09:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 4/9] arm64: dts: amlogic: t7: Add PWM pinctrl nodes
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
 <20260325-add-emmc-t7-vim4-v4-4-44c7b4a5e459@aliel.fr>
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
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-4-44c7b4a5e459@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_085256_679452_D4B6C370 
X-CRM114-Status: GOOD (  12.89  )
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

On 3/25/26 10:15, Ronald Claveau wrote:
> These pinctrl nodes are required by the PWM drivers to configure
> pin muxing at runtime.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 136 ++++++++++++++++++++++++++++
>   1 file changed, 136 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 62c87d0ef7065..eb09a26bcd0e0 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -307,6 +307,142 @@ mux {
>   					};
>   				};
>   
> +				pwm_a_pins: pwm-a {
> +					mux {
> +						groups = "pwm_a";
> +						function = "pwm_a";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_a_pins: pwm-ao-a {
> +					mux {
> +						groups = "pwm_ao_a";
> +						function = "pwm_ao_a";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_b_pins: pwm-ao-b {
> +					mux {
> +						groups = "pwm_ao_b";
> +						function = "pwm_ao_b";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_c_pins: pwm-ao-c {
> +					mux {
> +						groups = "pwm_ao_c";
> +						function = "pwm_ao_c";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_c_hiz_pins: pwm-ao-c-hiz {
> +					mux {
> +						groups = "pwm_ao_c_hiz";
> +						function = "pwm_ao_c_hiz";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_d_pins: pwm-ao-d {
> +					mux {
> +						groups = "pwm_ao_d";
> +						function = "pwm_ao_d";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_e_pins: pwm-ao-e {
> +					mux {
> +						groups = "pwm_ao_e";
> +						function = "pwm_ao_e";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_f_pins: pwm-ao-f {
> +					mux {
> +						groups = "pwm_ao_f";
> +						function = "pwm_ao_f";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_g_pins: pwm-ao-g {
> +					mux {
> +						groups = "pwm_ao_g";
> +						function = "pwm_ao_g";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_g_hiz_pins: pwm-ao-g-hiz {
> +					mux {
> +						groups = "pwm_ao_g_hiz";
> +						function = "pwm_ao_g_hiz";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_h_pins: pwm-ao-h {
> +					mux {
> +						groups = "pwm_ao_h";
> +						function = "pwm_ao_h";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_b_pins: pwm-b {
> +					mux {
> +						groups = "pwm_b";
> +						function = "pwm_b";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_c_pins: pwm-c {
> +					mux {
> +						groups = "pwm_c";
> +						function = "pwm_c";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_d_pins: pwm-d {
> +					mux {
> +						groups = "pwm_d";
> +						function = "pwm_d";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_e_pins: pwm-e {
> +					mux {
> +						groups = "pwm_e";
> +						function = "pwm_e";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_f_pins: pwm-f {
> +					mux {
> +						groups = "pwm_f";
> +						function = "pwm_f";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_vs_pins: pwm-vs {
> +					mux {
> +						groups = "pwm_vs";
> +						function = "pwm_vs";
> +						bias-disable;
> +					};
> +				};
> +
>   				sdcard_pins: sdcard {
>   					mux {
>   						groups = "sdcard_d0",
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

