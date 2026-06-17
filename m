Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A365CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 07:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1Eht0yqmtyjKLK+ckWvK3e4AnkyB7fNvSVWTQiIHbk=; b=yv9odFC/XA1FtK0SK4u32crakS
	o08WRd9qT/gXxGNhZJ2WmH814VM7nLFyD3jyvJK2xz5UbkzdUBJU2+xnPR/fSAf1/631/Yd+3xZVo
	JD/JYzG/nAeac6iJthIhKv/V2ySZqjyA5MIwwzx6f3L/zSFVeN+Uz5+cWLnd8KKYboz+Auw8+LSMC
	VBsQSChmV0s1Rs7z0K9rX+Fj3iloHAu6vRD2euls1w+RTvkNEZYctkKAKjs36qxzyb2UghYj1O9bx
	oTWwXEK4CLk0Ph/JH1WZi1Qni0rba4UmPfkk6rKvDdAkEXGYxtkeo5Tm3JdMZjuSu+n6A2mjOn+vG
	+tIPjTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkjN-0000000GpXL-0KRJ;
	Wed, 17 Jun 2026 07:30:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkjK-0000000GpVZ-3Coy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 07:30:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so57380255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 00:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781681432; x=1782286232; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1Eht0yqmtyjKLK+ckWvK3e4AnkyB7fNvSVWTQiIHbk=;
        b=LUUufPIHxkc5oNOi0g5RZU6vbMAsYqzCtvGsANgJqVD+KXm5qMeecg3wUNMS1ZWX9W
         dG/ungr+KmJfzDjvGjeTAC+f07QBlFvvrfGeUEv6ZmvIIKVzsg29myZbolBdrre97yUB
         /cqwSo65HFeloRpOxTZVGbKn9wwaSZm/B11Rzb1MY/JI5cS9Cqbed7lISTUXBxAYMKoK
         9vf1XQlHh94sCeCb/k+kYbn8+hsDTwMJngilOfu2HiKbXv2O1Yn8ddPyCqLJ4Z3C7sW3
         JINZlGfGysFwFa2tMvwaZtyFhdxJuQNJvBLytsyyxwuAofd+5pk/v+9qU9fmFb7CIWd1
         yz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681432; x=1782286232;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1Eht0yqmtyjKLK+ckWvK3e4AnkyB7fNvSVWTQiIHbk=;
        b=R1otvP6wOnvmaPutrkL2BTAJr0IQkD3Ktzq3tyPnFYLcdr1XC99eESCHliC6aPfmXQ
         AhNWKH8lj9jSgUTsm+3vHwFx3duWsjloYgLl8rD2IRWy3g/7zK/VTGu1l1xStE4CJcWo
         wFYDMLYR26+EpSy1PrE9N20DQw9NdtUrgh3vU9H4qWRByMHTp02PdmlFeY/dRSPNo3uZ
         FGtzUOMP2n2dgihAHwVHLq3mcE4FCs9RwMIAHG1d190851nSl5Tf8Ex/wAXxTMWL8mrV
         ke4Omy3TH1fkqgeUz9OiXX5Y2pMFRQpiofksFXOD0fNis07SPR7SMabcJegLCgH10tqS
         4TAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xFHpeKrwikDH6kotCdxU+/dFlCz+YkyNZ4sU4tmLiUujZiAnjTMAe6mqgd7cKd2IrQETsw3Tvk9Jo+fhtXC8b@lists.infradead.org
X-Gm-Message-State: AOJu0YyQciIHnPlBWyZAL8lIm8RCZAoHcq2i39gYvWoYQklqXTrUPxh3
	Igj9UxM2NQ79EPAIRD3An2KS4NChHrjUK4Cjy963NzP8ZqUy8jUzjUJ7T5cnSKRDc/k=
X-Gm-Gg: Acq92OGmioDLMfl9jXDn5zOCP07PlR3lYopSZR1mlIKwFGRqAgTurzT8l13lL2MBYRy
	PvrXN8FCfYYKGMSIid/1axlrMMnn00SnjgyoJMZjzwVKyrvMpBb3sb69WGUuY6JbsOisSVtqH8W
	aaYxc10p3pneVb6pOBWfV6ECyoflaMFwtd3AC/RGPOPFE22eFRdKte+gGGliG3dzz3h4mCDgD/t
	SIivKEPsjJ/CdLRVk0ctOdaEoiIGBHwedwJ+riXSeYtbYIcm8dbo4by1vEoEjX7ywahQ7FbiWH+
	pNoJPbqT08UhdRLAX5gKKqHVVq0VyuSPATQesgVCFWs/Ie/swq0NLxSNGuXhR/BjiVYPUIXh4nU
	VstS21TP2VSOu2bPIvNq23yHi7XmUhyGCYr4mCQGER4qsfwKqxNwODL4hlWSVKqGfx4qcILq+IH
	yAneP4p47oDQQPRnsKz81t2g==
X-Received: by 2002:a05:600c:19cb:b0:490:bb45:79f0 with SMTP id 5b1f17b1804b1-492333ba306mr44593555e9.3.1781681431573;
        Wed, 17 Jun 2026 00:30:31 -0700 (PDT)
Received: from [10.12.4.106] ([212.133.41.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm170120445e9.5.2026.06.17.00.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:30:31 -0700 (PDT)
Message-ID: <915e4524-d407-4b4b-9e61-e4a2274a6f6b@linaro.org>
Date: Wed, 17 Jun 2026 09:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: meson-axg-s400: Enable
 pcie_phy
To: Jun Yan <jerrysteve1101@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
 <20260617071604.635627-5-jerrysteve1101@gmail.com>
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
In-Reply-To: <20260617071604.635627-5-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_003034_813947_94160883 
X-CRM114-Status: GOOD (  13.47  )
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

On 6/17/26 09:15, Jun Yan wrote:
> The meson-axg dtsi now disables pcie_phy by default, so enable it
> for the s400 board to support PCIe functionality.
> 
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> index 285c6ac1dd61..7ba249cc3d56 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> @@ -448,6 +448,10 @@ &pcieB {
>   	status = "okay";
>   };
>   
> +&pcie_phy {
> +	status = "okay";
> +};
> +
>   &pwm_ab {
>   	status = "okay";
>   	pinctrl-0 = <&pwm_a_x20_pins>;

Please squash this one with the previous patch

Thanks,
Neil

