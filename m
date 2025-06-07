Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5202C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6NM0r2GKpKHtz5Be10A+IWfM525/OoNZ5yJnNFLV3s=; b=WZh8kNLM0syfwknMCV6SMORyem
	W0dON+j/pD9PhgfDFCK3hEwrbi3UEb0qUBpVJUUjN66WxGfucTMwsbtENZ9ev3w8r3nkZgBNddFn1
	0K6IH2nPXJelUvDc2Rz5Nq7B/EL/fdz2HLOHpBdzzGpDmOzqk2WGxVgGiKq9OHh17tKkFkJ+PXHVo
	+U1H8cRSvU01xZAvTHpv3AEhD540bQUeJRN5NARV4QEAIy5IlMaUHQ7QVcApVIhQmJw+E7O8nFkdD
	MerIOwX5rJcK6B62IBxmAcEk7LagY/jO4clePvX3bhzZieaWa+a1/z3rV/bzv94Rhqz402/ECDGke
	zGPFcgPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNsAB-00000001dsU-2wzz;
	Sat, 07 Jun 2025 11:56:39 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNs7P-00000001dar-0cXT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:53:48 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-607c5715ef2so465756a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749297226; x=1749902026; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6NM0r2GKpKHtz5Be10A+IWfM525/OoNZ5yJnNFLV3s=;
        b=VGjqjBkHUZC9UZuyikt3TlwtP386PX7tDGE8Dx4xx4WzZKXMpEwpDhBVdWOpyNE40j
         If+kpPopExyh5wsIRpyjZ2v+TJuRuoQthd7LxC6zIl6xvgrTH41Pl1v7+n0KvL5cqX7M
         +obJ16/H33nDCqCEDswPc6/dIdncxkG0Y+z8eSFkQr9Zy0Rb52uUYaeFIN5H4qpxb7AD
         DJOs8/kvnV9lSJe+Ez9GcVyjGw95v7AsGWpZcwpaD53F34Yx7fDF/KZAwAbz+5rq6nBi
         OJWyFi4CbLwEViwFy1i+zhpBOCEmtg633n2IAUv4URAJo6wdsE7XO3XcPnUH4vJXi6wK
         thZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749297226; x=1749902026;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j6NM0r2GKpKHtz5Be10A+IWfM525/OoNZ5yJnNFLV3s=;
        b=G0AUCm4AML54zzyKAMPyFDTvibHcgeO66VXM1B7oqC26RND1LtAabBY2cym6X5W/R0
         cWK2m+BSc6RkS+tVXoFY19WmPoHkx2Nm+6HL16lFc4260zVLHIIvIeNIjOIBPSAv8093
         Zlbc1ioc9RxydrCBCl8TSlWagizZy4Dh4Zda3gxJtBPcluWlNhC+vyuS9dh/uidl20Mc
         mIjfX4XDQrhmVQx37REvxzkQz2CkGd3+dIjXacVQ9GzCsdzIcK+pCZJqMNaxm+yGi2ds
         aT6cZZuYNL6AoMMDiLPOmmO1mX2hjJwQ5R8bpNxulJzTDzt/ZjT5/XXN4x1tT64En5B/
         FZ3w==
X-Forwarded-Encrypted: i=1; AJvYcCXCYFW1ThZq5Watgcd4HRYRQOXwrf+8BHKQD8EUYsMhJGajZ2xSeRR+yioA+GWN85gYFq2KoAtqxV33l5wRnAQx@lists.infradead.org
X-Gm-Message-State: AOJu0YygoGeW97je+AMZdYTbw4JpRP+vAGlHB4voniOilaH31Vk0GT6H
	CNt7iL6OZGJXwT+PjykY1MwxCjj/Ry9EyxRFFA9s42oPALX3AEt7v4prIGvaKtoDEC4=
X-Gm-Gg: ASbGncsEUVJ0NPrfKY2RJSG+w6lhqMAS3tJfqzE4ur64LH/302YnZ7MS19CClYdPOvX
	ih/zjvhwPT6hd6Ltk9TXKAyGMvcBFe0Pddxw7Kqu2xyCJFxYQ4/rhd7Ez/Qx/nuM7ogEwd2ZEBU
	kndVgv8a1H0L578a8lXMXI3FAp12oeXt72QciJwciCJeMZHKu4QWLKVyyX3RDDmS8y3jC+B/q9C
	XjFHxdIrAbT9Dw+FLkLVFwjEDsZFmmhIjKVGSoRsCkzbTHL1F+Z9vOjjO65l+F+gpolN39/irex
	D0gMh+YI7dS3ajvFKP2xoAnWq3RBNNsYtgQLT6cttc2acFn1lttMFyn/sxg/
X-Google-Smtp-Source: AGHT+IGv3DrJQc4+ybtE0JmCBcsdqL7KbDx6979eNC8Qxq/j+eIgzAGuXvZa0SEaHvSSsMoEslL4Sw==
X-Received: by 2002:a05:6402:1ed0:b0:606:c48c:fb91 with SMTP id 4fb4d7f45d1cf-60773ecd3a6mr6255248a12.17.1749297225668;
        Sat, 07 Jun 2025 04:53:45 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077836ffe2sm2265535a12.4.2025.06.07.04.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:53:45 -0700 (PDT)
Message-ID: <96de4b6c-0e17-44c7-9cf7-832a97a24c2b@tuxon.dev>
Date: Sat, 7 Jun 2025 14:53:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] ARM: dts: microchip: sama7g5: Adjust clock xtal
 phandle
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1748030737.git.Ryan.Wanner@microchip.com>
 <569e194346975ac3bb5786c02dc6681625771c00.1748030737.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <569e194346975ac3bb5786c02dc6681625771c00.1748030737.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_045347_194108_17553552 
X-CRM114-Status: GOOD (  15.10  )
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

Hi, Ryan,

On 23.05.2025 23:24, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Adjust clock xtal phandles to match the new xtal phandle formatting.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 18 ++++++++----------
>  arch/arm/boot/dts/microchip/sama7g5.dtsi       |  6 ++++--
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
> index 2543599013b1..79bf58f8c02e 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
> @@ -35,16 +35,6 @@ aliases {
>  		i2c2 = &i2c9;
>  	};
>  
> -	clocks {
> -		slow_xtal {
> -			clock-frequency = <32768>;
> -		};
> -
> -		main_xtal {
> -			clock-frequency = <24000000>;
> -		};
> -	};
> -
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> @@ -512,6 +502,10 @@ spi11: spi@400 {
>  	};
>  };
>  
> +&main_xtal {
> +	clock-frequency = <24000000>;
> +};
> +

Please keep it alphanumerically sorted.

>  &gmac0 {
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> @@ -917,3 +911,7 @@ &vddout25 {
>  	vin-supply = <&vdd_3v3>;
>  	status = "okay";
>  };
> +
> +&slow_xtal {
> +	clock-frequency = <32768>;
> +};

Same for this one.

> diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
> index 17bcdcf0cf4a..411db7e375a6 100644
> --- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
> @@ -117,13 +117,15 @@ map1 {
>  	};
>  
>  	clocks {
> -		slow_xtal: slow_xtal {
> +		slow_xtal: clock-slowxtal {
>  			compatible = "fixed-clock";
> +			clock-output-names = "slow_xtal";
>  			#clock-cells = <0>;
>  		};
>  
> -		main_xtal: main_xtal {
> +		main_xtal: clock-mainxtal {
>  			compatible = "fixed-clock";
> +			clock-output-names = "main_xtal";
>  			#clock-cells = <0>;
>  		};

While at it, can you please also address usb_clk ?

Thank you,
Claudiu


