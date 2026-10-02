Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B560CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cztgwljGD8oX4kZgQ1gsJ1QSEaSYmGWQ7py1olDlbuE=; b=17LNORw57avKpRCKBlBRn0a2XC
	j3dNku3hOz6aYjIZWH/o91JFr47k4kRJfzU8noLYMoSpgNbUAPFcH9sc8q5Prw6Kf9QOqFaKdV+Eh
	JqTG9kvlPZG6eAu9SDd/dgFmlInIbcuyzGUvOzBW2YBTpd5vml55vi2z6VUPfmprct4KVwTacPUmS
	Rkw0ildlbDQfyQIk+fXAvS5YUXsLJ9+hLnipGhhL0QQD+PkBgGkS4J9y1T3B3bMqPlBKIorxHbBm5
	h4bJur/Dr4uE5wqmkG/ZZ/SpvDKB5iFxb+kRsLhmO8/85UZoCRRCbcBDNK6/c/1/MdnffJrw3f3KF
	kpqUABAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCix8-0000000COhR-0YHY;
	Fri, 02 Oct 2026 19:29:54 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCix5-0000000COge-0q71
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:29:53 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso285399f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 12:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790969389; x=1791574189; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cztgwljGD8oX4kZgQ1gsJ1QSEaSYmGWQ7py1olDlbuE=;
        b=OU7jueguB4fbi2qYPQ5cjNTOI47nhjs+tgAmAePzUp/mEI8eZ06eSwuNEaCac33N2P
         W8AmwkKZIBqdCBAIgVhalWUy4r7Iemuf05pZQiYK4ZrQvY6xSfrO3rn1dZzFdBQZ2OPm
         7IKUTzmAgqX67W+Dg7L0ALTh8JsqBjkVb0qBpVJetpBVI68vebZjNGTYuNaPMV9xKa2B
         RMNIlkwBd9joSd2MZ50vQn8ffLix7RrMy3ex/ZqZ/Lz3H29f6PDZmp7UrwhMimsQs3bE
         AX1BlXbX0PFY8g/Y/SC48wTJliU7qW/jMIgeoJGP23dP6Aznra9X46qhSpGdK1p0YOfR
         fbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790969389; x=1791574189;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cztgwljGD8oX4kZgQ1gsJ1QSEaSYmGWQ7py1olDlbuE=;
        b=dWwkT/SGQ529BRPtlRDPXxFKS4j0sK9bJhax7Px3kETbfPERKJLIGaSbHMCY2i7Ijw
         uNLgRz+HIYYohsSdgpUWaBeei3WMGcYoXwMgCm0sK8sVvON1K2dq0DwmfTndAqDPaNSz
         LxNh8P1P+CvWl+pTvwIKvAuLR0mLqIh6xOqdV+bUtI3qaHOdk0PxOgdMF+vX/XWl/Aib
         7kdHWT69Mhq/7D19snZQDlSppisn+uxq+HjsgXMaQiB0ekPV0P+uEcF2IUgPuKEqwIh9
         EEq9uqhq1PogJCMOQh6kk8rAiKfptRKVa3nRuqJu8gdMuLPwnICLA7SbuMvRSr7sj+mv
         x1NQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUyyrksEQzkS6myIzxe4+O8MpAh8ZjPm0WueANg5huxvgvFhEAIksTAms5DCgWiUSzWUCnzHx+W8OCJRJyKctV@lists.infradead.org
X-Gm-Message-State: AFq9FYLu7h3UcUhxn1vRhDULraEND0tHwmKHiWUZBLeqgSF4aLjtrMtx
	y4M9jMP+DtQZ44/JQlLZqid1/k+G9n7Vdl4U/oo5WHH1vEdTFV5S8SvQ8C4TpFXz5YY=
X-Gm-Gg: AYBFou21dA/V4uPXir6jFS364JajybNFiLIQmhrOCHNi1gGLMe2QBC6Kq467KGOlhBY
	Yj/PVLAmfg7Bg5Eoe/LZEYD3b3kYcAfl+PtaL4ZrigPfQEOuB3tJJNdvq6MQrscs3sXdxlg1N+T
	XjUpbBOkxBFYr5AvvlW0dk1r1JmJikw59m9oo92K96jLhasPdBHcm7K4k6R6Rtyco0bFxdYe27l
	eaxYeQh1qaUptXFxlfWLx/0rIuCvjN4ALyDKn0P677DNZ77Qkl6xFXkxBAgqEkgwcnAbzZZfWnN
	qbZ7Z7YDxnwKKubxtn4YTjDFzz74CgZvIwvn3lFG/gRWr1/5WQdk0ILstXzu5PtW5QsjNcFNw9k
	L1vFf69CAUk8+eIWFNJgg+wV0hiF8Fnjg9QSkXIv7YA9cePyQLlwNSQIU6uGnApo5RlNYSFa5h9
	rlCPNmuiHBXIE9QZN2t/ST640UF/beOpJO3+1TY9iaij5aKAyvGor9Cnwq6U7c6ZECRom6GgsOk
	zHyUbnxv9cNrrp0V0YtSIUsFaj9jDghj+jLpWvMpeIU2P961SM=
X-Received: by 2002:a5d:5d13:0:b0:488:75e4:f5b6 with SMTP id ffacd0b85a97d-48c4801c1aemr625756f8f.54.1790969389014;
        Fri, 02 Oct 2026 12:29:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380facfesm8184812f8f.23.2026.10.02.12.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 12:29:48 -0700 (PDT)
Message-ID: <23235204-8e5f-4fa7-a900-66acfcfc593a@linaro.org>
Date: Fri, 2 Oct 2026 21:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the
 SPI NOR HOLD# and WP# pins
To: iav@iav.lv, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
 <20261002-hc4-spi-nor-v2-1-8366a4f91049@iav.lv>
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
In-Reply-To: <20261002-hc4-spi-nor-v2-1-8366a4f91049@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_122951_281906_672E7F72 
X-CRM114-Status: GOOD (  21.28  )
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

On 10/2/26 20:36, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The SPI NOR flash uses six lines, but nor_pins covers only four: data,
> clock and chip select. Nothing claims HOLD# (BOOT_3) and WP# (BOOT_7),
> so they keep the boot ROM setting. After a boot from SPI they are in
> the nor function and the flash works. After a boot from SD with the
> button under the board, they stay eMMC data lines pulled low, and
> spi-nor reports "unrecognized JEDEC id bytes: 00 00 00 00 00 00".
> 
> Add them as a separate group in meson-g12-common.dtsi rather than to
> nor_pins: whether HOLD# and WP# reach the SoC depends on the board. The
> HC4 has eMMC disabled and takes both groups.
> 
> Tested on ODROID-HC4: with BOOT_3 and BOOT_7 set back to eMMC with
> pull-down and spifc rebound, the flash fails as above without this
> patch and probes as a 16 MiB mtd0 with it.
> 
> Fixes: 7178f340e929 ("arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4")
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi    | 9 +++++++++
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 +-
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 00609d2da674..3135566df880 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -615,6 +615,15 @@ mux {
>   						};
>   					};
>   
> +					nor_hold_wp_pins: nor-hold-wp {
> +						mux {
> +							groups = "nor_hold",
> +							       "nor_wp";
> +							function = "nor";
> +							bias-disable;
> +						};
> +					};
> +
>   					pdm_din0_a_pins: pdm-din0-a {
>   						mux {
>   							groups = "pdm_din0_a";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 3ece30a0a1ff..c4b93d6619f2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -126,7 +126,7 @@ &sd_emmc_c {
>   
>   &spifc {
>   	status = "okay";
> -	pinctrl-0 = <&nor_pins>;
> +	pinctrl-0 = <&nor_pins>, <&nor_hold_wp_pins>;
>   	pinctrl-names = "default";
>   
>   	flash@0 {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

