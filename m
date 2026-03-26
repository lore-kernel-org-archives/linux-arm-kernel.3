Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A294106F303
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDXG9M4VD8sbt4ubZpnvKniIhpg/LpwkxR7DgYK7GD0=; b=PHraPpuoqWGlPR2Yzz4mYWbyCF
	ZMCxpo3zUbaG60KFOr66VSzwLWR33UZtR67MCAMLMz9V5R2qe3YsFREaAh+ytYzgBE1ht70ZaJuKS
	fW5LjpRSqbGKfRaAJ1l9+r7ME+NMXHropFMC8QM94CU/EXGataNhV+1JTEUIA1gLXbb9BFoovHkok
	qKC9b9K5i6ans4FBoK9NoCxbnSE+M2CxDiflDNQdbiQjG6D+SZGo81k5W9q+8p1aTCUMhgBxDejPN
	MaZQaSYu4dPRqUmft2y5CRXpuilcxTmxd7icVdHaHym+SK5skNoqCiT5jguWgzDugMFbX3TbLLgHN
	6hOZRB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gSp-00000005481-49PN;
	Thu, 26 Mar 2026 08:53:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gSn-0000000546N-1SJo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Mar 2026 08:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=gDXG9M4VD8sbt4ubZpnvKniIhpg/LpwkxR7DgYK7GD0=; b=Byeap1uvPeESxxPbzLJ7yvOA30
	cacCuHMhpoXlkJWBCTTQcILQRPztegujuKWYSvFF3xl2oPCOPx3pQ2DE8KftALdkmehYsyrT9ko8n
	ZOUNI6XfcZprzNI1P8+Xse8nIz/0LtGFcCPv7TQ38NH6Hy0jjLlq5Dp3misPPjoCerT5fRbt0Kk6z
	XRKe5V9Ngsyiyj466XJgNC14HkohxQ4nhvZxt5ml5qmYeOT7V4m7j7qWzSSo5TSx4TnXVLFoCnSeQ
	mna2Se2kE2LtCKkTEmhUqbjPIazWYlqZgyN6xk9AYRB0/MzUgJ3kV1NTgFHvC/wGZSGNF2j2EjXMB
	UwS1maWQ==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gSj-00000007nfq-0OAi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:53:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso6159055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515186; x=1775119986; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDXG9M4VD8sbt4ubZpnvKniIhpg/LpwkxR7DgYK7GD0=;
        b=mlZ+E0QiQaXxBBc23fkcNISXWjV7I6izhAUUYAMK4O2XT7I3NjZpcoV6u9GE3GUlT0
         45wBVgpwgwh1oA8yxI8QpH9x8e7EDPljUWyouEamA6V0i9XLbV/SDB2hZ1b7NhexZjnm
         46T5BzoDZ2s2MwumzXsnPDlLc+FvPCzNKgnIC9ZIpOQxG8p5nGjp41z8poLF7ArtfY89
         ZgxR8rpESnUzTCrC3f6thx4buCmlW+TWVr/OA1X4UjlczJ61VWJI5+lyYATXELoiGXoF
         L7FANTrKurXMkbzQZTnRRjDggV3s4rhN4I27e1bx3bTHtcMirehp3wvaM+0OqapHwsw2
         sU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515186; x=1775119986;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDXG9M4VD8sbt4ubZpnvKniIhpg/LpwkxR7DgYK7GD0=;
        b=sR3L6KtoexquhIjK35+PZW1TL/x90wLxJUnVUoW2NLYQx1cD+XGP8xnqtmpDX1HCW7
         z550erlr1l0wB6pgUyxg+iSv9BdSvZ9TSD2c4nk8oL92/2SNcTAR0LejG+fJx3e199/6
         p1eP4GXsG/J9lJK98yulAtS88Z7anV+EiCrlwiEIeAIornMwfeJcnrBqVtwUz1a8Mfif
         4sCwK1khexmOmeuFlNtm5PazYM8EqfKZximszjss6VDOeIw1v9tfsNw0/wHHpREpyP8Z
         7UvuVX34q756YiN+EZydUXm6zecmxAjT7ElKI2mDQlGkY0EWC50SMQVHLnuIBs6mVQYX
         /Jpw==
X-Gm-Message-State: AOJu0Yz3gYC+TojpAw/f2++C1Dfg9WNoUcC8igCt8TUFNQ8rHQFdfWXg
	Qoiv1Iv0DkhvcY0A+U8f9TsPWdLkjpG0X7bY8hCDlSDhRRLa//8VkBBCyf0uz9i6798=
X-Gm-Gg: ATEYQzyL/Kq//lNE76BmzlbQgHp8pGRZn22bPqoEdWPqf1xaZI4uStiy2haxdgqSvyy
	Lyg+c3l89IJ/vrh8q0RenQd7/QUGIZUpEEIPbxgv6rCwaHV1R/J8Vf53FCvreYT8xrwemMUFbPP
	plGsQNA8tprfyk+TVR6Ig9ycaKtPZd+2P/TF8RaWLRnHQP00fkv2NpIdjZff639l6hXqyOGmz36
	0H7sfPUpU/JR6EPU42CMjB2uoWXz6GwpXVu1adIq8mcJsFjZAokQGeriNBQ2wpBS3QX4PksWseG
	9dgKeP83WHLj+ruLNNuZtk9RDRnUhqWho6FiFSbvybnASDaxneV7jJP2W8YwpX6rMpc7SdZLN8E
	D9zvn8b91ZHSDGxKVZm4XLyPUia9L+I5lGBphsUqO++y/ZRuT1wMe4ziASbjUi/AEVrlsN734Dy
	HDk7S9ST+NW5w5aBPSBpm6nLZt17NarO3l30OqO2BnziqYhkJPe5ahbJe+R54DAmw+aHpcc02zE
	QH3rfA=
X-Received: by 2002:a05:600c:c490:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-48715fc7437mr97262695e9.1.1774515185800;
        Thu, 26 Mar 2026 01:53:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e708asm5819184f8f.36.2026.03.26.01.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:53:05 -0700 (PDT)
Message-ID: <d39c0e43-8c62-4a41-895a-5384dc365c2a@linaro.org>
Date: Thu, 26 Mar 2026 09:53:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/9] arm64: dts: amlogic: t7: Add PWM controller nodes
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
 Nick Xie <nick@khadas.com>
References: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
 <20260325-add-emmc-t7-vim4-v4-5-44c7b4a5e459@aliel.fr>
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
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-5-44c7b4a5e459@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_085309_353336_D819B013 
X-CRM114-Status: GOOD (  13.93  )
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
> Add device tree nodes for the seven PWM controllers available
> on the Amlogic T7 SoC, using amlogic,meson-s4-pwm as fallback compatible.
> All nodes are disabled by default and should be
> enabled in the board-specific DTS file.
> 
> Co-developed-by: Nick Xie <nick@khadas.com>
> Signed-off-by: Nick Xie <nick@khadas.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 63 +++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index eb09a26bcd0e0..581cdaebfe637 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -511,6 +511,69 @@ sec_ao: ao-secure@10220 {
>   				amlogic,has-chip-id;
>   			};
>   
> +			pwm_ao_ef: pwm@30000 {
> +				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x30000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_AO_E>,
> +					 <&clkc_periphs CLKID_PWM_AO_F>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_ao_gh: pwm@32000 {
> +				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x32000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_AO_G>,
> +					 <&clkc_periphs CLKID_PWM_AO_H>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_ab: pwm@58000 {
> +				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x58000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_A>,
> +					 <&clkc_periphs CLKID_PWM_B>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_cd: pwm@5a000 {
> +				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x5a000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_C>,
> +					 <&clkc_periphs CLKID_PWM_D>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_ef: pwm@5c000 {
> +				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x5c000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_E>,
> +					 <&clkc_periphs CLKID_PWM_F>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_ao_ab: pwm@5e000 {
> +				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x5e000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_AO_A>,
> +					 <&clkc_periphs CLKID_PWM_AO_B>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_ao_cd: pwm@60000 {
> +				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x60000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_AO_C>,
> +					 <&clkc_periphs CLKID_PWM_AO_D>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
>   			sd_emmc_a: mmc@88000 {
>   				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
>   				reg = <0x0 0x88000 0x0 0x800>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

