Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF59AC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GH41p+03OT08ssRRmEqg+Cy0Qf0zi6uiF2rijzbkmOc=; b=j6KiAj2fmhkw7kfh+3xsbIDexI
	7o70kXfEix+FYMD/NGPgtUMDvtjGBcbHDGIPKdhsMblSDxjUV0R9YGX84zDVp+2Mo0qOPDgPeEUf/
	Tj9cv0n+p3MxU26qhoGofNGPVGpXDQrKnw65AQeAnET6QDVZ4d2c3flTnR7z0OP6gVcIy1gPHsLys
	qGZQyFcWc1gN5qbCx9ZW/Ra8c0JLJb3yZiBHs+lRyZzEHUaknmFBRYE1RspiHd+eHT5UMwomF/4wA
	h7GwTAXZV8CtieC328i/mNfo126uddKTYfiZfIx4J4dgNFG3cYyz1m+1SNKakg0SBTy8zfkspETFF
	IdVKs4bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1Bs-0000000HX2o-2Nty;
	Mon, 03 Mar 2025 08:30:20 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1AJ-0000000HWfv-018Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:28:44 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e4c0c12bccso7344565a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740990521; x=1741595321; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GH41p+03OT08ssRRmEqg+Cy0Qf0zi6uiF2rijzbkmOc=;
        b=g6BlRo4s/B7KtgRyT1fP/tIa+rgvEZETACIAR6RnEV65lN+TwhcJvnujYIg5dNz/Up
         GA0/mIBrsGewe6fWH+KS8jkUnbgxrgXPjpdiwwFYNF+CbCZyWgPmPq40hCDGSo/y5fV6
         SOW8iT2LrpYCt4qs93VKVHx6SgSmzyrA/nI//CenTtM1jw10Nodz5XsCjFKBMPkklbsJ
         lt/mfFeL8sfSs/gwu8EhAy1AHdguGFVS/1TLOkOQrVeS7MpkjHCozu6RHEPGT52Ye2t2
         JGCL9+Cy6vOBBm8HbY1fgBZ+5fYFSyJg0plDvJ4Nnopr4lIVq4D3NQ9EcCXIDmlQjYSW
         vRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990521; x=1741595321;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GH41p+03OT08ssRRmEqg+Cy0Qf0zi6uiF2rijzbkmOc=;
        b=kKR1pmAm188ATHssn4llYwsic+Lkl1k33LKx0yWEZPlDhcovki4RkytUEUDJFEbE50
         2chaJUkriIeJ+ldMBbuZDhMzgae8AOIvVtVhBFptKFJ2jAaat/jBbzTfOnRfQL6MDShx
         a/K8prLPqYC3dJEh9sW/L3OsSVO3pZBBiYh5U0JplsAqD4BqwYz5n/MsA0b8gttqISiH
         lLlIw1FB1txSluPaXdm76+6bG37aPlTXCuFlVMcSmm2Dm1Uy61ASwuujpT9jjPupxI9h
         4dXizdf8/CnG5AKzozei8dM0zuRAKe4nZ0jN98gzvSMSfe9sfYGqyPa+66TM3e8D+Uwl
         XOYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO+TNjGWJT63ttQyLU2h6MMFcz9iA/Rht+IJX7gn/kYHys1NW2TInWWydsHavxvBrVPiJBNpUAfaVFphdrYQlL@lists.infradead.org
X-Gm-Message-State: AOJu0YxryeAbdSGzfPokAlOIVdmiZARYkJjHujsO+SNGNR2kJ4DwF8B8
	/bpY6ceKELSsx9dWg8nexCD5xMg8Ku+VxHSETuSB3CFL2nk6MJ76/woW+0K2aQ8=
X-Gm-Gg: ASbGnctxRy7DNpmr9Xw7IU04KGtyh5dD+QhO+xxsFPdRuEoEPSW/+TWJWstDskpgb8Y
	zHCQEGXv7Ed9QwcjOkLHzZPitPE0aGr6tKb4bccPhN9ChZYmsY1MRMLIHuJtUBkWKt3ufSuNNps
	usyYnimSAHtymQu7cJ01bY87i98JEUyfVejWK45BFcgg3TRFLhpl5eT7aH5spGJAD2STWDLMsaK
	Nvw/e8AvqlxqHp5bDmskkw97eUnk9hsTGt5b3jY5LEPvAKwJxCy5dqK8c8czzERz+jz+v/Y13xs
	QecJZnN/iEJtxSxsv3xfnowzhZ/kTcV1O2iPRKKBVl3S/gvpfY0OYA==
X-Google-Smtp-Source: AGHT+IFLKelVEVi00flzE2lHP3gHCMr7kj+GRjh+qndXBWCgYVC+cKiDJx3z7MTtqx+Mlq9hmZIcoQ==
X-Received: by 2002:a05:6402:34c2:b0:5e0:8937:6ef2 with SMTP id 4fb4d7f45d1cf-5e4d6af1104mr11411025a12.8.1740990519662;
        Mon, 03 Mar 2025 00:28:39 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3bb632esm6491336a12.36.2025.03.03.00.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:28:39 -0800 (PST)
Message-ID: <3bdac1bc-b84f-43b0-86be-b9d9b18be25f@tuxon.dev>
Date: Mon, 3 Mar 2025 10:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/21] ARM: dts: microchip: sama7d65: Add SRAM and DRAM
 components support
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <ab4002faa1b672023ffc97bf91755720508c275e.1740671156.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <ab4002faa1b672023ffc97bf91755720508c275e.1740671156.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_002843_060754_555ACE01 
X-CRM114-Status: GOOD (  12.77  )
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

On 27.02.2025 17:52, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SRAM, secumod, UDDRC, and DDR3phy to enable support for low power modes.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 35 +++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index 92a5347e35b5..c10cc3558efd 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -47,12 +47,37 @@ slow_xtal: clock-slowxtal {
>  		};
>  	};
>  
> +	ns_sram: sram@100000 {
> +		compatible = "mmio-sram";
> +		reg = <0x100000 0x20000>;
> +		ranges;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		ranges;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  
> +		securam: sram@e0000800 {
> +			compatible = "microchip,sama7d65-securam", "atmel,sama5d2-securam", "mmio-sram";
> +			reg = <0xe0000800 0x4000>;
> +			ranges = <0 0xe0000800 0x4000>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 17>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			no-memory-wc;
> +		};
> +
> +		secumod: secumod@e0004000 {
> +			compatible = "microchip,sama7d65-secumod", "atmel,sama5d2-secumod", "syscon";

microchip,sama7d65-secumod is undocumented. I'll postpone this until a
documentation a patch will be posted.

> +			reg = <0xe0004000 0x4000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
>  		pioa: pinctrl@e0014000 {
>  			compatible = "microchip,sama7d65-pinctrl", "microchip,sama7g5-pinctrl";
>  			reg = <0xe0014000 0x800>;
> @@ -190,6 +215,16 @@ i2c10: i2c@600 {
>  			};
>  		};
>  
> +		uddrc: uddrc@e3800000 {
> +			compatible = "microchip,sama7d65-uddrc", "microchip,sama7g5-uddrc";
> +			reg = <0xe3800000 0x4000>;
> +		};
> +
> +		ddr3phy: ddr3phy@e3804000 {
> +			compatible = "microchip,sama7d65-ddr3phy", "microchip,sama7g5-ddr3phy";
> +			reg = <0xe3804000 0x1000>;
> +		};
> +
>  		gic: interrupt-controller@e8c11000 {
>  			compatible = "arm,cortex-a7-gic";
>  			reg = <0xe8c11000 0x1000>,


