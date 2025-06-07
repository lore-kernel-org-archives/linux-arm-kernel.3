Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E770AC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIhYHISfph8fBpkqWC+1rBrRnlrWo4MclGDCnZfAqlQ=; b=jV+cxshA0kEHypmVoEDlO7MYG/
	sQHH/F8oyeaa9fqKxnhzd3qnhOvpboi/29E0eYz+LulFbmnUGmZRf6+LlK/HEzRld1eji2XrEAlSo
	vPUd2qsV62RfP4r61yMjblFTUw/ivwisH2pb/1jfsMmMrNlr/sjTf5j4uZrHD3k9GnWBiWMMjoWCm
	y9fBsIEuE8lwB4KN7r+A6ZqunR/yxScL6ufHdAtq6aoI7QYZnquP7BvxWC6i5Y9Nuc1zwGi09WXz9
	heIqNlubglhFHwgWh4wVZXsiq2giL+2eIPt7sGkw6yRPqwDN8/egUoKwAM73FnSExdte2v/4uq0w4
	bV49J2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrZO-00000001arM-36WK;
	Sat, 07 Jun 2025 11:18:38 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrJS-00000001ZXo-0tN4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:02:11 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso83452a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749294129; x=1749898929; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DIhYHISfph8fBpkqWC+1rBrRnlrWo4MclGDCnZfAqlQ=;
        b=LLqkdD72EL0t6YSKqWLgyVo74FkxfdaeZX3sGqm6vjVn09DQsXIDyhhQsZ1h8i8Onc
         3D/oFAJnNwxA5JX0lod9FjdYyGjY3fWFO3JvHLyMP7WrabLDzXLG6LaISurB1vvfnoKQ
         7Ag8HaMyk8hrJ/34q6kzMfe15kO530O8QzOTsA5g+/NAzdyYN9na0RxxSejdth+0ozPH
         LyOkH4UUklxYxNJqUtTkIPgW/9o03Gpd3pQ3IC7u0sw+I4KQDJYXOWKLEyFzOK5fkmaE
         5NXr7hAkkrQBbxaNORdr6F69iKoCf4UlhyMRmJIVLw/3kld5sZvSfZSKcvE/+uLzhJ57
         93Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294129; x=1749898929;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DIhYHISfph8fBpkqWC+1rBrRnlrWo4MclGDCnZfAqlQ=;
        b=lcQ7g1m1sKtKXoUWGR115lj/04heocoP6W6IffrQd59bvP4k04m5EfIHv+r41COcdZ
         ln6GIksrYU/vyZ2POR1kF2n7vb0FByLOFDWWtLSh4xi3mUY4jumhDx0dUL1mnmwcaiye
         iiAa5pguP+IeAyMzqEagNa6OlrnjXtkdetjkTN78PijHFt9K/OVZhgNW4NmbfpTI4sNE
         AAOTg8Ff5+zjrvgfAez4sxvPckK1kKBaXhOBtZ2sfwWUvExhlw2aciZ4cydg2W7A7gi9
         dBR0y1qx7EkrTs5Wr8K3mZI0NaUzqwkwo8WGV2JXQQDJoVGss6/1Rt4hPpJJwr5iBB+8
         BA/w==
X-Forwarded-Encrypted: i=1; AJvYcCUEsHJ93G+8hK5i/2WJgA1P/VmTvS3io3y+Yp3T7yG35mm/u0CndSiYqsAq8CoErGRjMr8AFOTkyMMiOywD5Idj@lists.infradead.org
X-Gm-Message-State: AOJu0YwQdyiBq/G5Zp8d3iouQ1hXqtlKGezP14Ub8KqK1Qw2YMH9RijD
	NlUaE9ZOqkH1Q8xtsYA/94BsbBA1v58/6cyUsL3a3IHLObQFyZkf/vdI7B27dExsNEI=
X-Gm-Gg: ASbGncuCqdYtxDN9FxSBVZXfirnJvGvxu6zUUlkjepvbatMzNflTASP2++0MOdz5SIz
	bXbu6GgmusrBR/FYa2FJVa+XgzeNbIZVk8+1PxShnht8j61stNP0CniIyPCKD8MwTdB5Qc1X3jY
	GQ63spNTprgWFqNyB+t9WCBYATTvPlE92rSqbTynn4Dkpm/ki/RedG+kT8bQdIyuBjxk27bJKYI
	BhpomvD8PA4L5hg6HFDj05eqNqYC9yoe421Uf81VV8Lm7w8hb19st+bQXaMxQ7fUc8X5Pdyh+aW
	tTtpNf+wZXKA5CU0rHm2IyarWP+tcNBDWHoyr+wmfZLdUIs0WNCntzlscGss
X-Google-Smtp-Source: AGHT+IH05HBrM68Mw5Ro+IZBmLCRhTkiogLWCD18qGy1T509lYtrYeeNQACDbX4n+DEb/SC/OplcNA==
X-Received: by 2002:a05:6402:4407:b0:601:a431:86cc with SMTP id 4fb4d7f45d1cf-60773be8fafmr5638626a12.5.1749294128562;
        Sat, 07 Jun 2025 04:02:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783c053esm2284059a12.48.2025.06.07.04.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:02:07 -0700 (PDT)
Message-ID: <759ec406-d388-498f-b0cc-2440a66ecbcd@tuxon.dev>
Date: Sat, 7 Jun 2025 14:02:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ARM: dts: microchip: sama5d27_wlsom1: update the
 QSPI partitions using "fixed-partition" binding
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-3-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521070336.402202-3-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_040210_258117_4E8F75CE 
X-CRM114-Status: GOOD (  13.12  )
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

Hi, Manikandan,

On 21.05.2025 10:03, Manikandan Muralidharan wrote:
> update the QSPI partitions using "fixed-partition" binding

Please use capital letter at the beginning of the sentence  and dot at the
end of it.

Can you please also explain here why you did this update?

Thank you,
Claudiu

> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../dts/microchip/at91-sama5d27_wlsom1.dtsi   | 54 ++++++++++---------
>  1 file changed, 29 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> index 9543214adc9f..b34c5072425a 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> @@ -229,8 +229,6 @@ &qspi1 {
>  	status = "disabled";
>  
>  	qspi1_flash: flash@0 {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <104000000>;
> @@ -240,34 +238,40 @@ qspi1_flash: flash@0 {
>  		m25p,fast-read;
>  		status = "disabled";
>  
> -		at91bootstrap@0 {
> -			label = "at91bootstrap";
> -			reg = <0x0 0x40000>;
> -		};
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
>  
> -		bootloader@40000 {
> -			label = "bootloader";
> -			reg = <0x40000 0xc0000>;
> -		};
> +			at91bootstrap@0 {
> +				label = "at91bootstrap";
> +				reg = <0x0 0x40000>;
> +			};
>  
> -		bootloaderenvred@100000 {
> -			label = "bootloader env redundant";
> -			reg = <0x100000 0x40000>;
> -		};
> +			bootloader@40000 {
> +				label = "bootloader";
> +				reg = <0x40000 0xc0000>;
> +			};
>  
> -		bootloaderenv@140000 {
> -			label = "bootloader env";
> -			reg = <0x140000 0x40000>;
> -		};
> +			bootloaderenvred@100000 {
> +				label = "bootloader env redundant";
> +				reg = <0x100000 0x40000>;
> +			};
>  
> -		dtb@180000 {
> -			label = "device tree";
> -			reg = <0x180000 0x80000>;
> -		};
> +			bootloaderenv@140000 {
> +				label = "bootloader env";
> +				reg = <0x140000 0x40000>;
> +			};
>  
> -		kernel@200000 {
> -			label = "kernel";
> -			reg = <0x200000 0x600000>;
> +			dtb@180000 {
> +				label = "device tree";
> +				reg = <0x180000 0x80000>;
> +			};
> +
> +			kernel@200000 {
> +				label = "kernel";
> +				reg = <0x200000 0x600000>;
> +			};
>  		};
>  	};
>  };


