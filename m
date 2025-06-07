Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AE2C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wX5KfR9MOdyE8SuFH1WwTnQT5xWHkVGETwnX9lS5vz8=; b=oqtZkHy3MLUt5doQfvgk0Mu/Gg
	a31332BKTgZ+WzqwjbK3TtcJYhSneYoCFYVL5KFSreJve3pHItcE+tJiGGrbOsSQz5jAIUHWliv8V
	fINCkRmdvDriw/jFw/+3c6I0m6b9c3aBJrE45qPOLZqX6/dqV4gfvcISjl0kvPFj5x+/RlQXEnw/1
	4lXnNKSzbbMIE5l2H9fe5FN8N/AbxIl2MArUrqwj5kYZDXiOUF7NlJ6NYovYnITE7UMaD4+yFb/qk
	7hI+NT2rgD0+1No9Sfhd/lgY7KUSYPmXUEadPetNW4NJ+JSPZ8KBO8AdN6fvGGMSoTNyneQRWuRui
	/KH6KzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrdi-00000001b7X-0u25;
	Sat, 07 Jun 2025 11:23:06 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrNd-00000001Zyz-0aK5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:06:30 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6069d764980so7478114a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749294388; x=1749899188; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wX5KfR9MOdyE8SuFH1WwTnQT5xWHkVGETwnX9lS5vz8=;
        b=N/TrxMtuxuy+ZdmMMnO+AOhvFp1bYdiM5VxW9A7n6Wbb4ZxmqYPJ4i9aDeT0CFLMDn
         hYxxztlbZgRRGY38M9SeSciaf2+6fz3HrnD0WvtLDMQEQZ2KCau7fnFwpbSo2fbskiZz
         CVULmfiP0GEAi7xYQYwjdU7Z0LPw18UWpsGG1itLm9e/uUXR2u4uNRT157Gcath8dV/s
         iGnTM5Kpcy9BQth6DYNfcG0uSWiAqqTyqwk9ePtioIkBp/IGnZZXdmXHpvRk4F033zk4
         dI+NPWdGEnKRdxocIC3cwAqUut3P6U6tvV5JkZy5veL505RBGJtke/lbesEQ5NIyzTO/
         cVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294388; x=1749899188;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wX5KfR9MOdyE8SuFH1WwTnQT5xWHkVGETwnX9lS5vz8=;
        b=Xk8TFO3Ph/e2MoUm2wxtJNiyy24MOphcEJlBQ7SPH7ciOplyQRX3HquPEAEnwZBQ0f
         sTU7tEluR/fcA4O+IDseRFbNjebHnoWPKnMMFbi7YxI/s3VctnCYUo6Jf5U5meJaLPX9
         z3A9gfsNlpWrl8a2liYTsYDtxkAKIMXyadj8XpPP9yuZM2WE+k9oH56lmc/IwcPPZfVs
         AB2nWCN8/G5k/Uj+fHU0IpvhNIHf7sBbHqUD170KRS1GH4WBi5KIS7J77GSWd263qo9/
         +JzGhI4G+q1Zw62YWu8ndrVESDJ436RMFM4j0XNBciru/npwSqeicxBtAeF4EUYmg2w7
         /3nw==
X-Forwarded-Encrypted: i=1; AJvYcCXua7v4exHdMfzdLYP/owPMPzFX9ZiooAB2UJ7lMEqvDB2RZvy+bq196EZw6uTUE7N7PrPKI5O13Fq3xmsY5Lvl@lists.infradead.org
X-Gm-Message-State: AOJu0YyCp/fdIZxq0fbn/wAnEBGgWJsIU5krFCgtrR2g0tL/B+Vktc3l
	nJWDJtbJodWdaF3EdMH340te2wrLgQKO/KQWtPaXZx2GePckdj1CyJUlSxVLWuz20kE=
X-Gm-Gg: ASbGncuoK5cyWpu6uRtq0byYHGGbsGC6sBSmZlT4rz+pHRfz27LuyFvxftN4iHCpBW9
	Ax1UClt0+lVr1OsgQMOSeER7+qL85RsbYW4O92h2XYD99iO9n9PF2D89TVv8aVRy9HkV4RcKLhE
	uCAqAIK+fjpCxzQuPmb50ggH+1ItKJ/kqWwCyBR8Gxs73X/fQRhVCKZEypty8uNYH+uzhmwKmdQ
	kqbzgcSj8Mzxp8jLnSQJvX7HdiezVOTZt6jUqHU2DkddgGUZC1ULYUDKKRrB6KwQIOuxQtX48eT
	05iKp5i0ApQYUDbUeZNe3Gn9eggEtygvaQL8PUVn1dgzlZipgLmK2HNljK8C+U1Xfr81MlI=
X-Google-Smtp-Source: AGHT+IE+q4EZEeGcYbHs9Cr6SWwfg3TvuJIon+Nk+US7johX0he69tUZyS1HyJZxxpkozjkb+cd2AQ==
X-Received: by 2002:a17:906:6a27:b0:ad5:2d5d:2069 with SMTP id a640c23a62f3a-ade1a9da675mr665733666b.13.1749294387390;
        Sat, 07 Jun 2025 04:06:27 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d75467fsm263858366b.14.2025.06.07.04.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:06:26 -0700 (PDT)
Message-ID: <62e644dd-e193-4375-8d05-82b51a8cf0a4@tuxon.dev>
Date: Sat, 7 Jun 2025 14:06:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] ARM: dts: microchip: sama5d27_wlsom1: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
 <20250521054309.361894-3-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521054309.361894-3-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_040629_180511_D0F6242B 
X-CRM114-Status: GOOD (  14.08  )
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
> Fixes: 417e58ea41ab ("ARM: dts: at91-sama5d27_wlsom1: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


> ---
> changes in v2:
> - add fixes tag
> ---
>  arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> index ef11606a82b3..9543214adc9f 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> @@ -234,7 +234,7 @@ qspi1_flash: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <104000000>;
> -		spi-cs-setup-ns = <7>;
> +		spi-cs-setup-delay-ns = <7>;
>  		spi-rx-bus-width = <4>;
>  		spi-tx-bus-width = <4>;
>  		m25p,fast-read;


