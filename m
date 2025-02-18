Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF3DC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 17:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9Kw7qFxKXcr45whwRwvA4Mj2NB/oA7RxSCK/IlKNzo=; b=crdcsPvDIbDAFAHldKsAQ6xbLI
	UzDw71goCaXiCcdYEZc1OBGh0LBg2D+qxZ9DmxZwdnwz9DlgG8V7R4eWWUadmWK4k8Wg7tF6FDztk
	gWDmIklrlbhsUsVqhUGRQ8Ohq6s31qTQvgFvdlDlEh3hEKpfirXblqDXT6zti1cCM2H36Y3I5fqQ8
	OlxPAdjuA+p0da3qXQjMK6RrXWAuR1IDrGx64FJHyUow7/56DNHwpFD2zX16DUmrrP/os7O8msQWu
	3qLCZq9BkqJrD9NlmLToHD3aqAr8U3iJtPotRUe8vhywMTpD3RZknDKBqRGuWkgcxiXJdjILFGSV4
	zmBu1/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRQV-00000009BvM-1L6j;
	Tue, 18 Feb 2025 17:30:31 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRKA-000000099sF-43Xy;
	Tue, 18 Feb 2025 17:24:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4398c8c8b2cso22024635e9.2;
        Tue, 18 Feb 2025 09:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739899437; x=1740504237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9Kw7qFxKXcr45whwRwvA4Mj2NB/oA7RxSCK/IlKNzo=;
        b=RkdmtE7i5ZTi+nvAEl9yLtcacXRrShR6xA0RSjXy+MJJOWjctXaGvMX+gNTNWVec1o
         KwWpjXeVhn1BocLHwVts/Z0pd0GEDFstoiCrOgHypTrucN+n6Ul0T+gTDIoBL/wQ+gLW
         8NZ5JFayVuvMXc80mWKZgmfc0ovtfxrGJsr/xgC7jTBmryrtpuNKFw6BXTiTzJbYMNHs
         nx8BrRYyYpd9lB30uHG0e/9IwwoEnBdI2zXyxDFPssajSxgXevd4E1s3USupxborR5nA
         Zb6NA9S6BrEH0y2b+DgsL/FkjU2AwjrBuEwiZo9i7kXe5jsfcK3o8uxEONr572GtlcAi
         CmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739899437; x=1740504237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9Kw7qFxKXcr45whwRwvA4Mj2NB/oA7RxSCK/IlKNzo=;
        b=nQZ07D2Qcdg/FNl0qmwwo72fY4+7dvLWNViN+gtaksjTrO1h1cYZ/jUdXEtawK+dPI
         WoDnbcEhC05y7gAN5my/5LeLZyl/nbU7N6lTXz+7KJ+NDXLX/++Fyjx+Hu+n3+uAJs0Z
         tLotBaNeP0p/Ah3EpPjnjE4ssQPLOIDFmMlZOAq1083z4f4Aay5WJPJd0FcI7SDuPV9R
         aIojyl6ykV16lVhWbktane+I5AdhJ40js5WxxwQYpKiKqrL2VAqtj48o8C0zMbLeYmEp
         Lq5I/fBTNzhM5KogmzNDQeVqS2GJ4kPZjoT/r1ClRXQM3Y2iMm/1TfAYPOhL94YKhm+b
         iXMw==
X-Forwarded-Encrypted: i=1; AJvYcCUqlALI7KdPCVsuZRJDvrL5Rt1lnQqkMY/Z3pUdJzGe5+wb9+bR7EkZgE0Siig3FdvM9/V7zyxbRpGfd3TkI6DF@lists.infradead.org, AJvYcCXLvhnhNJNmJg5gqaSdygJOXFB6dDAxyDNC2Lts15ykbMlTRmUSU32N6VVav7Vm2AlerGprxRU64pClk/g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnqRbhFmpv1SfKD9fYut67RaHEtekphovDTiysHJL8WsvFwJDz
	+4m87cJ1yuhkIIdprUYCofwiow/Zedz4lUtEqu8KIFBq/JTuR5c5
X-Gm-Gg: ASbGncv5RinamgmGGcvpFix7x4/vwVHWwDLeVlwrtq3Cm5yJiki9zoH9EAfhXWTGBlL
	BdO/bpPDJYp4vbfnYGdsnIm8Sko2mlgTgcX7H2d+6pkiLnvyIkzscqxWfFg2e7bsYFpGqYx7guu
	M5/1vSprJIMmzD6ci1Jx/xk4nScQ9xE9Ko2f0LZYn4y9sLCyv7uAejJwPC4yy5vNMTJkMjRPe8y
	SfiWGTGMrd0uQtE8DMvR5sGbbPxyJC1En/R1oH/7fPG6UbX4fQNtud9o3RUtPqvoPumvwcupfI6
	Da+JnNlvuIZadgxUcLKYjr4CsGkqJP9d6qwnn+gJXoRmNQw91B4vehjjqv554XOE91M=
X-Google-Smtp-Source: AGHT+IGdwqkgJU4MRYllMptDMTLx9Cq7fV8Bn0/VLRCRyd2ghtgYLKpjvlKzjZW3cSM9dRF5TKWB+w==
X-Received: by 2002:a05:600c:4450:b0:439:916a:b3db with SMTP id 5b1f17b1804b1-439916ab5bdmr58879435e9.6.1739899437098;
        Tue, 18 Feb 2025 09:23:57 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439922141a5sm32958965e9.2.2025.02.18.09.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:23:56 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Alex Studer <alex@studer.dev>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Alex Studer <alex@studer.dev>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add CPU thermal sensor and zone
Date: Tue, 18 Feb 2025 18:23:52 +0100
Message-ID: <4628970.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20250218020629.1476126-1-alex@studer.dev>
References: <20250218020629.1476126-1-alex@studer.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_092359_012838_DD0FBC20 
X-CRM114-Status: GOOD (  15.86  )
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

Dne torek, 18. februar 2025 ob 03:06:29 Srednjeevropski standardni =C4=8Das=
 je Alex Studer napisal(a):
> The sun20i THS (built in CPU thermal sensor) is supported in code, but
> was never added to the device tree. So, add it to the device tree,
> along with a thermal zone for the CPU.
>=20
> Signed-off-by: Alex Studer <alex@studer.dev>
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 31 +++++++++++++++++++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 16 ++++++++++
>  2 files changed, 47 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/b=
oot/dts/allwinner/sun20i-d1s.dtsi
> index 6367112e6..bdde82aa8 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -3,6 +3,8 @@
> =20
>  #define SOC_PERIPHERAL_IRQ(nr)	(nr + 16)
> =20
> +#include <dt-bindings/thermal/thermal.h>

Put above line on top (before SOC_PERIPHERAL_IRQ()).

> +
>  #include "sunxi-d1s-t113.dtsi"
> =20
>  / {
> @@ -115,4 +117,33 @@ pmu {
>  			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0x00010000>,
>  			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
>  	};
> +
> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&ths>;
> +
> +			cooling-maps {
> +				map0 {
> +					trip =3D <&cpu_alert>;
> +					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +
> +			trips {
> +				cpu_alert: cpu-alert {
> +					temperature =3D <85000>;
> +					hysteresis =3D <2000>;
> +					type =3D "passive";
> +				};
> +
> +				cpu-crit {
> +					temperature =3D <100000>;
> +					hysteresis =3D <0>;
> +					type =3D "critical";
> +				};

Where do those limits come from?

> +			};
> +		};
> +	};
>  };
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index e4175adb0..fcfcaf06c 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -426,6 +426,10 @@ sid: efuse@3006000 {
>  			reg =3D <0x3006000 0x1000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> +
> +			ths_calibration: thermal-sensor-calibration@14 {
> +				reg =3D <0x14 0x8>;
> +			};
>  		};
> =20
>  		crypto: crypto@3040000 {
> @@ -934,5 +938,17 @@ rtc: rtc@7090000 {
>  			clock-names =3D "bus", "hosc", "ahb";
>  			#clock-cells =3D <1>;
>  		};
> +
> +		ths: thermal-sensor@2009400 {
> +			compatible =3D "allwinner,sun20i-d1-ths";
> +			reg =3D <0x2009400 0x100>;

Size should be 0x400.

Best regards,
Jernej

> +			interrupts =3D <SOC_PERIPHERAL_IRQ(58) IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_THS>;
> +			clock-names =3D "bus";
> +			resets =3D <&ccu RST_BUS_THS>;
> +			nvmem-cells =3D <&ths_calibration>;
> +			nvmem-cell-names =3D "calibration";
> +			#thermal-sensor-cells =3D <0>;
> +		};
>  	};
>  };
>=20





