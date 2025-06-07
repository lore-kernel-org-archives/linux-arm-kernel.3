Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF277C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpeOeAdGqxMbXCn6EnheQKl037hSzc1P5CMiTi/s4OA=; b=Enxh44kDTgLIfFr8Y/T1kwvfUV
	ZA7yt9nmMZzAhb4Omim+lGhL3nAZWBhBcZZ+/e7R2BWD/VXZ8UgF5PbRrGZhrpjBMeZHnDqJ5okVf
	HGjFBgne4eV4WrBD4GJa5lVLK0q38NkguMNwvQoyBis8wzx31TOcUIFo0cGh6PtIy6wTYxbM/RBTS
	Pe4zj+95wsQPPmPL97da4G9bfv9RqJ9/Onfl9VVyuh645c9F8rAwA2/fBeyGGOr6/787ew/GPTwkc
	NnMFGyJV/gn2JgE0PvDJ+Rcao4LT3R8wjlNs8L6bBurB0Yiqlh2CqSKeNjAx61SnAfy2LkVtVFG7O
	JjVjfrjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrft-00000001bJI-3pHs;
	Sat, 07 Jun 2025 11:25:21 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrNx-00000001a3P-0fGU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:06:50 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso522411066b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749294408; x=1749899208; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZpeOeAdGqxMbXCn6EnheQKl037hSzc1P5CMiTi/s4OA=;
        b=Lu5wWRj48aTiFwr3suZekjtVTsu4Y0TPN6TfFBp0IoewOKjvU6n3TjSbbSqepCPtLr
         VRBFXTR48EvsuoKb1AJ8sJX+bUok4hbsNrH+XA6dWm6R4i+n3vpcb1dSnSCiKC4USkDl
         7E8tYJnOeZFhIIpwZtSy2X+UZjV8wY+75mqDxHZ5S3T0bw9YXiEusA6zvnK03t02vCaW
         pv6nF5jwJ6DKmMMR0Bbh8ZGr4z0KVLK6O22R895dcpoEuFnaGsDyUo9ekBP2nu2etKfm
         vvVJbn7hvehXcQRO5NUEjQ00thswUHQENfJF8yxeTdFsWFX06ExsTS4iTuc8NAKXJ5id
         XrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294408; x=1749899208;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpeOeAdGqxMbXCn6EnheQKl037hSzc1P5CMiTi/s4OA=;
        b=jqG+D2ambtIC9KTz2I5FspOxLTs0N58i3CGtbLaXDj/9pZ0QkDHsXyOba6Kc+3KQoi
         tDQ1ioN5yfZnSHLtE9C3P4XCdmjzI/L5vGOErdlEv/aL1EZQvvslgpFZcYS//NXnP3pU
         5NU5HXvbf3jlBQCWM7E08a1iphIpFwFkVAF40enntTYm7oxYq7+7nStrbtNw+rysX9pb
         AOMFcWx54kYFXLGsm2JRdCzwjmdqFRgDyhn6E3K9EPnTej+mjU+VC4yaP2BYft+5mm41
         y/mf3RWh3oU41WCP6U6Vo2B9L77jnM3uveANILQD0PlTJ18c8N9syI73bz+hW2tT9Kuu
         Q1pg==
X-Forwarded-Encrypted: i=1; AJvYcCU1edGmXeNZ0xVpNnAR1Tq4H7N5sXPRv+CzJ89LUvmR5VOeqdMfC7krw+5Rz296oz5s0fVYW62O0zPCEyiJteaa@lists.infradead.org
X-Gm-Message-State: AOJu0YzAbec+kT4sfrkzf41q3ClAyGaFKXZIkiK2lf4xGX93ATKNfS7T
	kT+/kU71lOzYfQZUQhNIvDBuakBSJqaX9y7SasQitYLx1r24XmAH2KDZLeJt2G6pm8c=
X-Gm-Gg: ASbGncv+EG+3fw62OOuh3lc3E5cG4aFD5ZMd7ejHDJtEHORnTNKDeT35BjRBKdlKCTh
	KfNdTTb5mtI3ZmhrDGZ81EaiwjcJYRXdpKnKM9tj9mg5hADy0WLPqeJxuEG+zo8M1OaKo5noniH
	7/oqkdUap6egLuoG8RTUXUtOie8Fkal6N4qJyvyd9yozRQUWDIzecKEIzVqw2+7golxth25q23l
	ZrC3ncElZDAPrdPs3lLeCyLeFJriIVUdO8JORQwChVke4IkBhj+u5tjtjsal1MhCrEE94UQrW2m
	63brurv8zWEH0VhAiKEMx+5wgT0kuI+dB9Jt8SmMOC4lP6bm3q7IoT+3i/T+
X-Google-Smtp-Source: AGHT+IHpdpfUQNhMmB8sN9hbFLLY8K5z23WOyAagshrUF6r9enZIOLN8q3wFRn/tdHnAMeprp4PVUg==
X-Received: by 2002:a17:907:9494:b0:ad8:8945:8378 with SMTP id a640c23a62f3a-ade1aa4dd99mr589163866b.19.1749294407543;
        Sat, 07 Jun 2025 04:06:47 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c8ecsm262161066b.94.2025.06.07.04.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:06:47 -0700 (PDT)
Message-ID: <3991b725-f115-4dc7-b744-c8dee5f8a477@tuxon.dev>
Date: Sat, 7 Jun 2025 14:06:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ARM: dts: microchip: sama5d2_icp: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
 <20250521054309.361894-4-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521054309.361894-4-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_040649_203304_0F60E2BB 
X-CRM114-Status: GOOD (  13.98  )
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



On 21.05.2025 08:43, Manikandan Muralidharan wrote:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 46a8a137d8f6 ("ARM: dts: at91: sama5d2_icp: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
> changes in v2:
> - add fixes tag
> ---
>  arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> index 9fa6f1395aa6..fbae6a9af6c3 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> @@ -714,7 +714,7 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <104000000>;
> -		spi-cs-setup-ns = <7>;
> +		spi-cs-setup-delay-ns = <7>;
>  		spi-tx-bus-width = <4>;
>  		spi-rx-bus-width = <4>;
>  		m25p,fast-read;


