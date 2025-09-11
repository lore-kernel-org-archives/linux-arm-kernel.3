Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEB3CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 18:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLnSFY5/QAndl78OHoWYd50tPooQqwlEKZC1g+O6M5s=; b=OtpIgTd84Duvh0WYkpC57fkqfd
	6K1vXZPMNeX3ec2lfFuzjHxyADR2EFbkpo4vqFVOywkqLHSHLGnbyld0EwqRuiDwns3F0iz11WKUG
	CiJF1Lh/eRDb3sTJgjZsxzzBHQSg9hk2YBfvSlzXwnfKMnCPZYxFojP3oMXSYXbav8ng1NOQoS6hg
	4QpqcaL1Gi6seiuEmKsrAi5RwTFZ4iSa8/v54JvoowdYcL9QF6cRytVhq2OeVNZRlRgCeR+gglJRu
	geipFYYDkSbfE2YwehOAoUEtIZzma/ssotvxVyXNiVnyqtvLyIH8f+ELxunStCgpUTvyCXXJvFizl
	o/GMi32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmJ6-00000004oei-2WZS;
	Thu, 11 Sep 2025 18:46:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmJ4-00000004ocr-3iP4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 18:46:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so7749335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 11:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757616365; x=1758221165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLnSFY5/QAndl78OHoWYd50tPooQqwlEKZC1g+O6M5s=;
        b=RnffovTgfPOLklwx14CAlx8ATID9LdXaG2I+80hByR09QmpVxYLDZZ74IOoLhEFGyZ
         fizOJPtf4GJoJ8p+UmK7X23hwbfhcoJ95aRD+qSDQ7m/iiwFiIZ5dM+WW5W8HJL6h4pt
         4x+ZoFnJvm9OWxRvR2FZEPtyqylBhXI/g8E3BBb5HXBcf4+ClvYM8COeNfeINJR9U72U
         dKKlfIxcVUxoHLXezxkmmT2AQ8lMtrRV/lRou9UQmQZ17Urfp6f7BMS/MwHq46+q15vC
         F1nDwf3eJ/pCMn3X+coP5275DxGly5Fu1TWeg3gxb3xpz1YTiY1+x/JxqAbBUJOQqDg1
         EOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616365; x=1758221165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLnSFY5/QAndl78OHoWYd50tPooQqwlEKZC1g+O6M5s=;
        b=GKsPb1j3eFBkSZk6rAHC0bvxJdqECGrySLPb7qdhZSIkZ0BXEzzd9RZ2juHg466qJr
         QxFWjJR3qkm4D2iWZvWew809L6l718SRINfa113yQXsMJBJdlMJgJ8oXlmEKROLXyaDy
         BL81zVg3PRxeEhpCPtUBX8WcEmGch+GGDxt0Imv18znPeU3V39mpHaZop1om3DiRs3bz
         Zi+Of9D7bfqkPucWQXKNcvlZ8Y/TanNDMVN7yKsvKtizqSkMx57KaubpqTHus4eNJXVZ
         3RSSFuKJqxDAoygmyZZC3wHu8jIUajt9U7m+kqgQwtCbwCs0EyhQluVPDGPaZmLZ3pgK
         X8qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTXOUARolu7DBG7ZNHMWCKWaW/fb8iJagripPs+D8f57pc1aKKRjp3SVPENofNlcMmWtaOYX9Z8AzjqktLAufk@lists.infradead.org
X-Gm-Message-State: AOJu0YwoGT4ba4K5U+UTGXcVcbkK01GqgKubMEQ2vFUFCpg7fakF9F1Q
	UeSm9mZiUVBUBuJ/WPZ3IvtHbO6ULilQwYr1DvRVyvL5a+KdAcQwo1cd
X-Gm-Gg: ASbGncvSPxQVOViQrI5OR1V4KRSccCzjVY/D4/hp2p696HtUqEracQRNomta/E2yblp
	4h9Ht7wb4RNFQfSUmU3y7FfC1xz4aQ+htXyNsaQJaxlswbCcaPc4HzZW50d5t6C2EvxzUQTf9ek
	QT5nmVqUjwgMxvCVHV+rHol6+nNG+FyLC/WfCfBFQWzN1pvC/uJjcCFOBYB4Yz27TwTnScNtjLk
	ATEVNS9JFYq8wMqgs7d/Os5OtW/JnUHxct3byoTzg5B5sXMHJsGjxSKbsxGk1ZUBClIb32b9L1y
	6N+yYRATIzULESW/Up3b+cy1ZvVXny8Uw+jscx01JNITtva8hT6ZN3QqiW2BEw97t3au4ZkTZXL
	LF8Y9GJX4jbLXtyuqerfW+WjitKr/VAAXAaT1NmITZh0ihL1KsOfT/87+cl82ym6W/pf9gTXjby
	QZ2twbQfNh5NPoozC0du2MYp988D9qvw==
X-Google-Smtp-Source: AGHT+IH1eoAESwH3mOqBEu1EDRUwtU9bT+NVdrf9ZOgZBSqxSfPicQG9iVoecXpREjH59drqKdf77A==
X-Received: by 2002:a5d:5d89:0:b0:3df:c5e3:55f8 with SMTP id ffacd0b85a97d-3e765a12a7fmr375119f8f.54.1757616364866;
        Thu, 11 Sep 2025 11:46:04 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e3a91504fsm20727255e9.13.2025.09.11.11.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:46:04 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: allwinner: a523: Add MCU PRCM CCU node
Date: Thu, 11 Sep 2025 20:46:03 +0200
Message-ID: <2380002.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20250911174710.3149589-7-wens@kernel.org>
References: <20250911174710.3149589-1-wens@kernel.org>
 <20250911174710.3149589-7-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_114606_939407_394A74A4 
X-CRM114-Status: GOOD (  15.90  )
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

Dne =C4=8Detrtek, 11. september 2025 ob 19:47:09 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> Add a device node for the third supported clock controller found in the
> A523 / T527 SoCs. This controller has clocks and resets for the RISC-V
> MCU, and others peripherals possibly meant to operate in low power mode
> driven by the MCU, such as audio interfaces, an audio DSP, and the NPU.
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Changes since v1:
> - Enlarged MCU PRCM register range to 0x200
> - Moved "r-ahb" clock to the end of the list and added "r-apb0" clock
> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 79bd9ce08c7c..f93376372aba 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -4,8 +4,10 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/sun6i-rtc.h>
>  #include <dt-bindings/clock/sun55i-a523-ccu.h>
> +#include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
>  #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
>  #include <dt-bindings/reset/sun55i-a523-ccu.h>
> +#include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
>  #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
>  #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
>  #include <dt-bindings/power/allwinner,sun55i-a523-pck-600.h>
> @@ -825,6 +827,31 @@ rtc: rtc@7090000 {
>  			clock-names =3D "bus", "hosc", "ahb";
>  			#clock-cells =3D <1>;
>  		};
> +
> +		mcu_ccu: clock-controller@7102000 {
> +			compatible =3D "allwinner,sun55i-a523-mcu-ccu";
> +			reg =3D <0x7102000 0x200>;
> +			clocks =3D <&osc24M>,
> +				 <&rtc CLK_OSC32K>,
> +				 <&rtc CLK_IOSC>,
> +				 <&ccu CLK_PLL_AUDIO0_4X>,
> +				 <&ccu CLK_PLL_PERIPH0_300M>,
> +				 <&ccu CLK_DSP>,
> +				 <&ccu CLK_MBUS>,
> +				 <&r_ccu CLK_R_AHB>,
> +				 <&r_ccu CLK_R_APB0>;
> +			clock-names =3D "hosc",
> +				      "losc",
> +				      "iosc",
> +				      "pll-audio0-4x",
> +				      "pll-periph0-300m",
> +				      "dsp",
> +				      "mbus",
> +				      "r-ahb",
> +				      "r-apb0";
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};
>  	};
> =20
>  	thermal-zones {
>=20





