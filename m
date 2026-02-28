Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769CDFEE4EF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 14:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RS6B8HKz3lfStaChpHPRyrCXmTOfflogCUXEfzC9Seg=; b=yWZsTRnHiEQYwTDAChNMoaB8Rt
	MmqlAusqXdcH90hCbGhgiQvlvnrS/YgdsVdtduVrwzdoSezQUGu8qFIzx2uv3z44VQGMN9eDKtHss
	zwda5wTDEKc6ixkZBuNpkfRewNeduNL5tpXEgkLTzZyD39MguzKvA4bx+VuerVgnCRXxpLvGhunTZ
	vGIZLfvG0XBbVKGZVeLWdz9gDW0ikSxZ7vq3RbknipkU5fObxxwHWkTtqDGUGILeMEUD8HjL2CbvN
	/+vXvAyB7IVe45iggNV2PuC/jzy+KKNZ1fxWoMAt4qrsKVBgJWoVUZmjB85wKpBORljwVlk4ZMGq7
	YBubu9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKsi-00000009tb5-3Hm2;
	Sat, 28 Feb 2026 14:01:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKsf-00000009taO-45Zf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 14:01:19 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so34466815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 06:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772287276; x=1772892076; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RS6B8HKz3lfStaChpHPRyrCXmTOfflogCUXEfzC9Seg=;
        b=NrvVzIyLEhdePBFTTjyYFIB1wky3/qBHBlPO9gXDWqS7A5qUJ7q9mw9Sb/gascFWLP
         jks5NMoGUlT6/Df+QH1dyRa/NxzPhoupcS74LkjTi0ZE92iYNbgIilA8YXDgLXFwvmVv
         nHy8uBnMmSDPJt2vGpvk6hhYSwY3qmlSLtB0HijWfBXDdeKwHMVqQWPZHXk9QRIKWzuJ
         LhoHPKX12YZN/srWyJw39usePACrTpnPlXA6AfNjA0PU60JfVOpAph+IZCvT2CUHJMjq
         GP+93yr5ikC73ouSoxmMUwgZL5yhkpRt3SEPPMefomK66kNfaa3smnRYrQB2Ode5H4r/
         xHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772287276; x=1772892076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RS6B8HKz3lfStaChpHPRyrCXmTOfflogCUXEfzC9Seg=;
        b=UFq1X+94CklnHp2oK+M5vMocW543vqsdFxXInX456/sP/Mnf3XB4Brugtlb/XvgbJp
         TCagh6CvONDr4JzREH9ajI9EiiYz77aHjKKvPrBG48usMpsPIlJKFFwZlbSwAv3CRsm6
         +TF5QZHdQW6ZOKBaomjVUp4LRAWFXyjZPJJLDMXs2owp5WCXNq0KSQQcMuab5TBjk9SM
         CK/U7P+RLLWzhSdDXAzK341t3GC+lCE9Cdy+e+DMYWkOVZHml8NsqWDYE+1BUqyLegIW
         UEPjncn3jrIiX7R7UIug12nvdq7XfHxLVvds1dtfMxF7f4eKhRTlV/lHobb7WH+KYBP9
         1ofw==
X-Forwarded-Encrypted: i=1; AJvYcCXIYS5Ecdq+bWpKLpATE6lK+BzH5NSZzC061TYTHPkTkJ4eLkfZaP1MJeGvk74SO8SWDYKT2pY31sk7XgaNmhjt@lists.infradead.org
X-Gm-Message-State: AOJu0YwJyMS3BLJoukVoXKbgZerS5k8IIuOqYAlGKKydUYGSkJmUt0cW
	cl7JrOPZNu+tNfPCVcZk4xxMTw6PHrivAOqs39gS6+vfnU49lr/JoEFiTs+FrHdSWDg=
X-Gm-Gg: ATEYQzw8U4cDCkc65q1ZLRVSMAD7uvSgrVITr2CDc3b9rgT8Qo6J6iIY0pGKhZcptFm
	zT792reIbMd7wi8qz3joUBgOmHxG5xNaQc99wFFNeiStTTnajJ35riTz2pqJ2cvtoBaWU7SqAHU
	eIyK017IahuuQgzoru975Gqk2+P4WXsONk4XLe3x3+Jdg5OWsZkzvPNAAUNwjBpYdFFuPqmwPzV
	ZtbNa16Ay5DZV/xKc2/IT77holtzgWOu+h4ziZCumpHO4IFWfyqFSQ9BDLtrVDD3DlTpFUYUZMx
	t46nC73Qo6tVHfnEMSoEjzRdx0VIaUAjTFFc0TA1ZIxswSeRz1ndsS24VEiBcHzW+S4Kpgp1C/K
	PUzAYkcs2Zu2ILshZl/L2VvmuVi7ktKJZ22sd6w/MxZOgUEU4EwdnRb4T9QBIGz36p85kKAa0wj
	doS2mAhpmmNDAMKu77Iw2n38dstV+WK2bCaw9fCBkO
X-Received: by 2002:a05:600c:3108:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-483c9c1d177mr99483705e9.29.1772287275961;
        Sat, 28 Feb 2026 06:01:15 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd765604sm246812765e9.15.2026.02.28.06.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 06:01:15 -0800 (PST)
Message-ID: <0e2b745b-c76d-4b53-b5fc-9991c943e603@tuxon.dev>
Date: Sat, 28 Feb 2026 16:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ARM: dts: microchip: sama7d65: add LCD controller
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 linux@armlinux.org.uk, ebiggers@google.com, martin.petersen@oracle.com,
 ardb@kernel.org, tytso@mit.edu, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Ryan Wanner <Ryan.Wanner@microchip.com>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
 <20260225085430.480052-2-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260225085430.480052-2-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_060118_661254_A2BA06BC 
X-CRM114-Status: GOOD (  12.67  )
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



On 2/25/26 10:54, Manikandan Muralidharan wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add support for LCD controller node
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>   arch/arm/boot/dts/microchip/sama7d65.dtsi | 26 +++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index e21556f46384..b2fe76115aec 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -278,6 +278,32 @@ sdmmc1: mmc@e1208000 {
>   			status = "disabled";
>   		};
>   
> +		xlcdc: lcd-controller@e1400000{

Missing a space here -------------------------^

I can adjust it while applying.

Other than that:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> +			compatible = "microchip,sama7d65-xlcdc";
> +			reg = <0xe1400000 0x2000>;
> +			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 56>, <&pmc PMC_TYPE_GCK 56>, <&clk32k 1>;
> +			clock-names = "periph_clk", "sys_clk", "slow_clk";
> +			status = "disabled";
> +
> +			display-controller {
> +				compatible = "atmel,hlcdc-display-controller";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +			};
> +
> +			pwm {
> +				compatible = "atmel,hlcdc-pwm";
> +				#pwm-cells = <3>;
> +			};
> +		};
> +
>   		aes: crypto@e1600000 {
>   			compatible = "microchip,sama7d65-aes", "atmel,at91sam9g46-aes";
>   			reg = <0xe1600000 0x100>;


