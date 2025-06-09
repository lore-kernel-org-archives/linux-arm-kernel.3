Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B46FC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 08:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diVPl0lQKW0yQkA4YVUek0ZBF2jN3vlUnkn9DLqfm9E=; b=e9jf7Rx4l7lN0Zz/CnydkCkwb/
	c2VM5kbl5aoZsgdjsudu9k6brqM86ozjKZUQffAE28qaWrxgxpuIRmvzZi6OuXRHOcOejmAVL1jYH
	817CQlBCC0+YePkSDQLKELY6cKFyir2+QLSV+8yttyDSbtmHG9Kq5HrywWAc9i4jLIi/5ZlFl2QQS
	RRMJ6jVetZPv6qXCa+gnWNwgJSLuIiy9hRj7ug0X1FSXzPxIrP9lXYaGswHS2swW6Bs397hq5sN9X
	k+tXOD4tMhbC7WHJYlay/MYhkRbZOnmYG+JDZfNv+OHgnGNcul3dP/9R0g2EWDHC3y4LyvDOvVkLS
	YwmXrRrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXji-00000003efL-34uz;
	Mon, 09 Jun 2025 08:20:06 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXhZ-00000003eOw-1MFx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 08:17:55 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-addfe17ec0bso939802566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 01:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749457072; x=1750061872; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=diVPl0lQKW0yQkA4YVUek0ZBF2jN3vlUnkn9DLqfm9E=;
        b=hJBk/01NNi9SurpY18jk5GxI4AX/ZDLyAH4TV7sHbTLtQF67b7o0INEup9xurXUX8D
         XwHzk/B5EgNPJK1d7DDNYNvQGCzoq/HYNC19C88o2A5OM4AOqqIjN8GWYGu00wcT/PNX
         Ob5tYmM5flqkQs0pSB8zwsD23mkhZDhYsbrNLcrGHz7l9doMpYIUb2y6yQl0rgY1mMrZ
         TitDRbKlJ5ZjW5KKJWcAchcUzjSD9p4XbB1Tw7dFczlGiX3v4zD7KZTuJAAZ4xTPne6C
         NZya40S46incexijsal+F7lHDgxU7FIAmp+YGuKLE7xG1v5V0BrhKa6dxdAIHvluiKqg
         KA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749457072; x=1750061872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=diVPl0lQKW0yQkA4YVUek0ZBF2jN3vlUnkn9DLqfm9E=;
        b=bt1qLb2TEzb/vhO66F/JDSC/xtiwJZLPr1X/ZXT/T0H5tsVgVWK4BChxkETeZkLiRs
         xNA0dUJPFLJWUTQLdkUnaaUTKWqVXXfzBh+TBqALfZmGf6qylW4XJcSxRyuWiVYWxtYr
         6H9M7oxdnr1jwXwNoS+0e/mcc3f7rW3c3NkHTKeOHSFAH9t1t2m6IlOvq/I85ft2grqa
         MsxKRwZ6ZG5Qo8OPKjW8eBX9OFNvaZ1Oum8wH3bnvOdAY4IDL2r6YWcrwz8AWxq1f4PE
         bm/lZ/Nm5ZBrhYuZNgTvGCDfp7b0YubkwbFUNKzv+gpzCXusJPzqKEAf4QjLs+eC1O3M
         2wAg==
X-Forwarded-Encrypted: i=1; AJvYcCVM65LypahsHb0sU4mBzeHGDQtC8XuxjwdYTU8szz+g/SzsLlksSVe4F4apV7DIUb8ITd0F9ZdoEAiaaKwzd1bv@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqb/lJtxQmHwpQYJy3t5Hx5RRuwN4gWjBUUSu0W3DDIwmoMZf9
	UJ6FabTapweulf7+WqOA5d/tbgr0Zxw+8yziEJ5po8j0MwSbzE8iL2QUd9/RQcPVgW05MMfGp0B
	UecFZ
X-Gm-Gg: ASbGncu1BZoi6ygPBC0zYpE9muyeh8zw9CuPqZDsEvIL2JH2qDxQvVqal7bhIpqxRYI
	8KZHS5SJKnLMW+MDeOUWuAhIEUmiqkepIihF87jDydlhjBUysiGsYFFHojBHliTT/Nvil/pP/gh
	Cgezg2E84ImJeWeCJv97kM26XEb3He69s33KnRUlddb/bXgUNSGi+MgRP3zOXkl0cOUMUvbOGN/
	TQ0V8m65wwxAXpBRpkIJLBelr501z+SH+N3sQyCXAfD+MrSlerFp8oeXOkhOX1CWKYlvn4QK523
	y8vrgKBMeD7OVDHagGaD5hZDp7OgqMC8sPWEQHOEGLBBQvbzdvwGrfR+yl8VgoxjVKk7rZlP
X-Google-Smtp-Source: AGHT+IHlo5foO57lawT0iBE8NHWy/Wh5VTZ1hRUSX/LNop16FvKZAplu9cVdl/qMvDgzI+koFNCPcw==
X-Received: by 2002:a17:907:cd0d:b0:add:ee2c:7307 with SMTP id a640c23a62f3a-ade075bedd1mr1646702666b.6.1749457071737;
        Mon, 09 Jun 2025 01:17:51 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc78f47sm511997066b.153.2025.06.09.01.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 01:17:51 -0700 (PDT)
Message-ID: <a15fd377-1828-4cb5-8c7b-7d26ea2a7733@linaro.org>
Date: Mon, 9 Jun 2025 09:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ARM: dts: microchip: sama5d27_wlsom1: Add
 nvmem-layout in QSPI for EUI48 MAC Address
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-4-manikandan.m@microchip.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250521070336.402202-4-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_011753_373719_7A49263C 
X-CRM114-Status: GOOD (  20.68  )
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



On 5/21/25 8:03 AM, Manikandan Muralidharan wrote:
> Add nvmem-layout in QSPI to read the EUI48 Mac address by the
> net drivers using the nvmem property.The offset is set to 0x0
> since the factory programmed address is available in the
> resource managed space and the size determine if the requested
> address is of EUI48 (0x6) or EUI-64 (0x8) type.
> This is useful for cases where U-Boot is skipped and the Ethernet
> MAC address is needed to be configured by the kernel
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> index b34c5072425a..be06df1b7d66 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> @@ -210,6 +210,9 @@ &macb0 {
>  	#size-cells = <0>;
>  	phy-mode = "rmii";
>  
> +	nvmem-cells = <&mac_address_eui48>;
> +	nvmem-cell-names = "mac-address";
> +
>  	ethernet-phy@0 {
>  		reg = <0x0>;
>  		interrupt-parent = <&pioA>;
> @@ -238,6 +241,16 @@ qspi1_flash: flash@0 {
>  		m25p,fast-read;
>  		status = "disabled";
>  
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			mac_address_eui48: mac-address@0 {
> +				reg = <0x0 0x6>;
> +			};

How would this work if in the future the mchp vendor table adds some
other info that needs to be referenced as nvmem? How do you distinguish
the info from the table?
Would it be possible to have some kind of address and size to reference
the SFDP?

> +		};
> +
>  		partitions {
>  			compatible = "fixed-partitions";
>  			#address-cells = <1>;


