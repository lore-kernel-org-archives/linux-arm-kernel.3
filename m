Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA21DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycoLQD9jfqJEzFVkDVUgdOPCxS45bX18gNlDKBK7d6s=; b=st2+pEFZsI6Fgrm1rRDCOEHGYS
	GfKqgLqkKpALVM2j1tL7zNvABGCuTDBKNcrQ8EEKWfpFpJOFkO3ThMPb/LsSCebQQafWSeJbNs7qF
	5ABuiyQMe5H3Yi7AoPmEVaeeRDpVUg1m1B4Hbu05sU1RKm1rp66HoLQvcVKu1IMjO9yQdYes5i2DU
	JZ0MOuA53DE0Rv9Pcb4VLF8nLiDKFqYC7G5pSElM7NEYZzqmtAOpdy9YfzmmSork5zCOkpxil9zf6
	XUDx/CJa3DyMvrgKVVBdTq358PrP8Xl2gXloGRMC7wt1z5/c4xofAhsNnmYdnpOd7ROwhDMAr3cR8
	z1cfUnFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Fal-0000000E8Fa-19Pw;
	Fri, 11 Apr 2025 14:42:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FP3-0000000E64P-2sIW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 14:30:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so18028945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 07:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744381844; x=1744986644; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ycoLQD9jfqJEzFVkDVUgdOPCxS45bX18gNlDKBK7d6s=;
        b=atdGjuMp013+vXEaAgD28EuYc5te5NkyCRo8k6KgLIHf41IqeP50IaWN3/cTkBkts3
         LLhaKyYs0bawfbquq7ZKbV8uGt/rLAh69YCSpVQtjgIKBfvFwjLsGUd9PolrHIRgMMko
         eslSZqM0dyW3vCsfFPI1yyHoj1ndrxug3HWld84cVKb09fG5yP0tej5+wM5KRwRSkstG
         4+xqYppNCMvzWiXSuzP6AvM6pf2GN4bW/cgNkECFnVBpg/3tCE+eNzGtITqbh6ZmCwJ4
         lvhrY1DJyOBUuRQdpl8OkYnviX+Xm5h7EM3VHQ9MHdrtrcsDvT2dreWDVxuAi4PRie5w
         ceGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381844; x=1744986644;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ycoLQD9jfqJEzFVkDVUgdOPCxS45bX18gNlDKBK7d6s=;
        b=fuc/ngwg9cMFyqjpfHkVXT2hKu5k/rNUJNV0kVtZbv5ToMJ+TAXN9GoddLELOZvALb
         oELS+f0eP8uQW8xrgfildpyYpqRkwBSBa0p7IdwTIb6nQy1xWO4g/rJDVRhssW7apiOK
         dJgCnizAMZde8fC0e9xyfVFDJ1vhyJH7s15lnRiPmQEgzOralOPtmewyCbHT8uFCO4Pz
         Tncv/rRxTImxRcdgczAaUXLqWDSNfncPTKY2acCXymOijH3ynO9wrwi3anpekJbhHrNy
         EYgFllpRphiLwkLtVrxrpLcH67MDzkUU1AgCRUDCzJaaEBpmc4JmMXfFL0FpClN688B9
         OrVA==
X-Forwarded-Encrypted: i=1; AJvYcCU0pfjARbr5DoVlgDvGwWUuMEOvXY0ofG9C7ZumiSN1tvCXGrLlwS/57bmjtxkOho/4LDZLiSbPHn4WUFnQ5UIA@lists.infradead.org
X-Gm-Message-State: AOJu0YzKOL9QRI3YAsWNBnNOAxTYRhDghJOn2Lv6aWVGLS0xzXSd1y25
	tnOyJsHLY1tJBViQtX261TLxXsz7h8LxppYHwj5O0Q3sNc/kBHmd6h/K4sH8lNs=
X-Gm-Gg: ASbGncs0DAU+60wCFNfUqQx7cuOo9mR3ceiGX8iD4+d0/NX5+nMTai9fWLTruEYu97w
	1WWhy/4xNWextn+AU90lHySCniij8rnFbS2PhJ2f0iBxHx05nL7re6VPGwTaR6owyZDBvOGcUqT
	jt74shtxTCHry2kSy/0ywH/X5uwZwLWmI63CW4kKPU1rt0N4L6sZJvykzGM5gf2IRvVQc7JjNcd
	Z/LIVB0h5NMaOfMk3q6iJ1Yl2fNpPq613wR+bl6PFP1KheDAMxZ3ULiCBTpbg9YEDbw9RO2d4Yz
	bnhA1yrzRZ/UMZUvb4bZsRznrZ5OHtN7IhEGfBk+CPNgqLJn
X-Google-Smtp-Source: AGHT+IG9KQqbQeJI3TgkREXxzGXE7lhS6pak+H/rKFHdsabVkH8R63JSXWChvAVJyUcLu4rOG+zckw==
X-Received: by 2002:a05:600c:5107:b0:43c:f4b3:b094 with SMTP id 5b1f17b1804b1-43f3a92552dmr24937985e9.6.1744381843883;
        Fri, 11 Apr 2025 07:30:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c81f6sm84049845e9.20.2025.04.11.07.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:30:43 -0700 (PDT)
Message-ID: <6e52883b-2811-4ac2-9763-5974ca463274@tuxon.dev>
Date: Fri, 11 Apr 2025 17:30:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ARM: dts: microchip: sama7d65: Add MCP16502 to
 sama7d65 curiosity
To: Ryan.Wanner@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, onor+dt@kernel.org, alexandre.belloni@bootlin.com
Cc: nicolas.ferre@microchip.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
 <60f6b7764227bb42c74404e8ca1388477183b7b5.1743523114.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <60f6b7764227bb42c74404e8ca1388477183b7b5.1743523114.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_073045_751008_F12A23A5 
X-CRM114-Status: GOOD (  14.73  )
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

On 01.04.2025 19:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add MCP16502 to the sama7d65_curiosity board to control voltages in the
> MPU. The device is connected to twi 10 interface
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../dts/microchip/at91-sama7d65_curiosity.dts | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> index 441370dbb4c2..81abc387112d 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -30,6 +30,15 @@ memory@60000000 {
>  		device_type = "memory";
>  		reg = <0x60000000 0x40000000>;
>  	};
> +
> +	reg_5v: regulator-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "5V_MAIN";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
>  };
>  
>  &dma0 {
> @@ -99,6 +108,132 @@ channel@4 {
>  			label = "VDDCPU";
>  		};
>  	};
> +
> +	pmic@5b {
> +		compatible = "microchip,mcp16502";
> +		reg = <0x5b>;
> +		lvin-supply = <&reg_5v>;
> +		pvin1-supply = <&reg_5v>;
> +		pvin2-supply = <&reg_5v>;
> +		pvin3-supply = <&reg_5v>;
> +		pvin4-supply = <&reg_5v>;
> +		status = "okay";
> +
> +		regulators {
> +			vdd_3v3: VDD_IO {
> +				regulator-name = "VDD_IO";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-initial-mode = <2>;
> +				regulator-allowed-modes = <2>, <4>;
> +				regulator-always-on;
> +
> +				regulator-state-standby {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +					regulator-mode = <4>;
> +				};
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-mode = <4>;
> +				};
> +			};
> +
> +			vddioddr: VDD_DDR {
> +				regulator-name = "VDD_DDR";
> +				regulator-min-microvolt = <1350000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-initial-mode = <2>;
> +				regulator-allowed-modes = <2>, <4>;
> +				regulator-always-on;
> +
> +				regulator-state-standby {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1350000>;
> +					regulator-mode = <4>;
> +				};
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1350000>;
> +					regulator-mode = <4>;
> +				};
> +			};
> +
> +			vddcore: VDD_CORE {
> +				regulator-name = "VDD_CORE";
> +				regulator-min-microvolt = <1050000>;
> +				regulator-max-microvolt = <1050000>;
> +				regulator-initial-mode = <2>;
> +				regulator-allowed-modes = <2>, <4>;
> +				regulator-always-on;
> +
> +				regulator-state-standby {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1050000>;
> +					regulator-mode = <4>;
> +				};
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-mode = <4>;
> +				};
> +			};
> +
> +			vddcpu: VDD_OTHER {
> +				regulator-name = "VDD_OTHER";
> +				regulator-min-microvolt = <1050000>;
> +				regulator-max-microvolt = <1250000>;
> +				regulator-initial-mode = <2>;
> +				regulator-allowed-modes = <2>, <4>;
> +				regulator-ramp-delay = <3125>;
> +				regulator-always-on;
> +
> +				regulator-state-standby {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1050000>;
> +					regulator-mode = <4>;
> +				};
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-mode = <4>;
> +				};
> +			};
> +
> +			vldo1: LDO1 {
> +				regulator-name = "LDO1";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +
> +				regulator-state-standby {
> +					regulator-suspend-microvolt = <1800000>;
> +					regulator-on-in-suspend;
> +				};
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vldo2: LDO2 {
> +				regulator-name = "LDO2";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <3700000>;
> +
> +				regulator-state-standby {
> +					regulator-suspend-microvolt = <1800000>;

I can't find the schematics for this board. Is there a reason for keeping
this @1.8V in suspend?

Thank you,
Claudiu

> +					regulator-on-in-suspend;
> +				};
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &main_xtal {


