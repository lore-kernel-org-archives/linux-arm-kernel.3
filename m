Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A1AD31A22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OC/Dw/aj2c+iGoV4mMFgj1KT3b4DGhGfHvAlSHugi9I=; b=Sv4zbJTSGEVhfJL9ylxxMPf/Db
	RiRgB0o+NprqQ7J/X9TyTr8u54J0+XHS8OQ6dLMaWMxRG2i+tc1RvdouhTOmzzpSPedbSJQiUQFeb
	Tcm0yHTuQ2l17/CQv+92cyWQhpTKhsmO9CSaYu0XPdKhfaV5NlNFkaKpTRq9blbickhYjP4MiP9yF
	9nl0DWp7DsDWQDyIe2WBVslLH4DPr8WK4RTJf82P/G7ErNMccDHIH2gxdO/t2eqcoSKICFXSWmtLk
	Gx7crdVzZe4hP22XHUNroIrBnBjwhtAQAnvNuF4WEuMUMNJY8OH9noyBcnrsXKDFB6kMk+en+VHi7
	a8uLDeDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfw2G-00000008IGP-0CcZ;
	Wed, 14 Jan 2026 08:15:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfw2D-00000008IF9-2tyj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:15:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso50292605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 00:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768378520; x=1768983320; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OC/Dw/aj2c+iGoV4mMFgj1KT3b4DGhGfHvAlSHugi9I=;
        b=inV/uPUe85cggbmy2o02hYvBOcBWXFSTNiSb0HGTcm/9wXiM6od7AFCWhKBoYiSWkM
         6m5lZVX47kKMLC3oMuDyzwOWrncQzx6wP4P2RwzRckf+nXhOoGsnrPltwaPuLu9qSdGq
         5BWGyp5gG2Nd6CC9XgwKH6pKEhq4BNYf1bgseIzRrFx+oINEOcwMHiKyo5XDulWGircl
         kP7b2m+wVyenUxEM5QM+xU7UZMW33ybzL1gjgRZklxkBpPuhRl67ozwoDbfBh/5mwgVU
         qzNuQ0XETmlyAkQ8hiPpBspu7dRIJCl6BDDC9oLqdlKDptb1NuGAEDpqvO4p2tRMKa9X
         XYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768378520; x=1768983320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OC/Dw/aj2c+iGoV4mMFgj1KT3b4DGhGfHvAlSHugi9I=;
        b=ouEG0lsnFJV6zqKNd9nm/hbYZb0t0NRU4CTWCN8cHd9lvHrFDt2ZgN0LmXHnxuv4kJ
         jCiBVyC9qz8CZ7dfC8smZy35uzQUqq7lNDKLJZGaxq7pbuVWP7Co7UCYS2OpclMwFDWw
         MAAU3wlqnSSZsgz0EqwiD3EdfnBUjQ6UKKYMjGz+H5K2oISoe9ye9KwwI6Alku6GpmGs
         DdvlIJarTO0LhnYFCzDE50Bnd61kc6ll3tOJwPgeUXuJEqfMVLhC0alOD3zXLURKdSpn
         iOKTOtLPRUYFUeJcUBejhkp4NLOYJ1SghD/GpVWb3pPe8qiDcb8KImgWtj1xjad8bDp1
         g2ww==
X-Forwarded-Encrypted: i=1; AJvYcCUJaFO/yhxB4LVPM7uonHeMaBzTPDFBfyhC9jqEkmTdmy2Rtt6pXTJuD3i6nl7Nk/waYtuoU2++7UsJWtWkZkID@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw/tvFW4zYA3e1CGHkriL09U6uYYzsdctQ/sQmFZR1sx84pQmc
	pXE4xLiTM2XzCLLKXp07jjsmmeInDm0O4MYWmc4bjCKJKAG4O9waTppw
X-Gm-Gg: AY/fxX4Hs+CJxqBI2DVz9U4A5Avrmpbodok7uqpWhCVexYKrqIIeIQ50nsD3kmfBUvV
	ZB+MIZiZjUY0uuYm+scTCgc6xuBUSr+v/yYlQCgP+QrkI3MUtBf4lwhrx4pctelTPIP0zgKOoP8
	9RGP8rKTucht6+JqPRi45aMy/Xh0sd9a72CHtq8AcLxu3jTbF8A7Y7L5mADDLxI/MTvNy427GNb
	NS5LyLLdLp9qvY9+FC7KgZyz/XcxlDY0uriZ3rYSTxpVmuEPvSAJu/17oBhJrz6gAkT545ouK2V
	eQnY+Oi3XfQczYHlV3IcTWnjWGW1KaH/5qAnELOdiMoPbo5kvKOaoCoI5OTrB7BGbA6mQPoHei5
	XnwU21aZajDzlMLPw3aKPkHw+hqTUivX7szJOJkh35qx8t6PJPqubl9ZRZWMU13aK0Ndo0eZxzk
	Ti/4xd74LLzpTA++ztFAea375CgSnCRKu9uqudIv5UvIX001EzFs6yfnbiurfwzH1ZqYQ=
X-Received: by 2002:a05:600c:314e:b0:477:9cdb:e337 with SMTP id 5b1f17b1804b1-47ee47bc03dmr11164035e9.7.1768378519599;
        Wed, 14 Jan 2026 00:15:19 -0800 (PST)
Received: from [192.168.1.27] (84.121.134.198.dyn.user.ono.com. [84.121.134.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee563ce5fsm15437185e9.13.2026.01.14.00.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 00:15:18 -0800 (PST)
Message-ID: <46785ec4-d222-4897-8427-82e3d3b1dbca@gmail.com>
Date: Wed, 14 Jan 2026 09:15:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-evb: Add interrupts to
 DA9211 regulator
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20260113110026.37032-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20260113110026.37032-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_001521_752858_9E7B4DAE 
X-CRM114-Status: GOOD (  13.07  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 13/1/26 12:00, AngeloGioacchino Del Regno wrote:
> Add the required pinmux and assign the right interrupts-extended
> to the DA9211 regulator (PIO pin 15).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> index 51118a4149d8..1049877e6cda 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> @@ -117,6 +117,7 @@ &i2c1 {
>   	buck: da9211@68 {
>   		compatible = "dlg,da9211";
>   		reg = <0x68>;
> +		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
>   
>   		regulators {
>   			da9211_vcpu_reg: BUCKA {
> @@ -179,6 +180,13 @@ pins1 {
>   		};
>   	};
>   
> +	i2c1_pins_a: i2c1-pins {
> +		pins-da9211 {
> +			pinmux = <MT8173_PIN_15_EINT15__FUNC_GPIO15>;
> +			bias-pull-up;
> +		};
> +	};
> +
>   	mmc0_pins_default: mmc0-default-pins {
>   		pins-cmd-dat {
>   			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,


