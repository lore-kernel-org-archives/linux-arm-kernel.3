Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DC5C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 02:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ply0/CzY0yvzBEfEzCiDMoXMyvQu4tZWubmfbiISKOM=; b=3kfNHKqjVAv4FvmQKb18KTpJDM
	Cp+eSZvL8ripoOgOr6Nr1jOVl0EKHMO6M4ePsiNF0LHEJdXkDUd3qjgabfAWjZhu/nXnbcyEQ5B6/
	Omrd8r4+0RCgS3tIFhCvLOTS4NacoGY9wjt39A3hmra06ZKpFDjwWEAhuzpI45EZXd8N1jtiUdxbg
	ov45gGa7rGm7XOXdJGlxH/9SAZ+Boeqv0qmdzr4iKHAH6P+FSnpun2QV5afXXY3r+RiJA0GFDvcx5
	ZApUCYysAvoeZh2J+PNmG3YlmbzariDZKSh/QM9FdARCNtsMuB9H0ywG8pucsTK+hknGV1aan82Yt
	dWNAUjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq13U-00000009raq-402B;
	Thu, 06 Mar 2025 02:33:48 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpzv0-00000009m5o-2H2S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 01:20:59 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so30433a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 17:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741224057; x=1741828857; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ply0/CzY0yvzBEfEzCiDMoXMyvQu4tZWubmfbiISKOM=;
        b=XNex/dm+v7zB7MeRYvOzqm9VUV8uQ2xRK76esLRkX4Uu8+e4If/NBkEMeus13tN3SW
         2CyLlbKluiLzOXZrflgJRQi7FR9hX2/QsYviltKojsByN5RkP/wWlCtAvrnmAR3gFmuA
         CA6KEYUZYY/XzVASSpfC6LlitaNVPFgQSOGiMTVFAW/CgYfLLc/S46FFWV4wwqR9eTGY
         n5HiphbcvvGJOeAKTQJDfVIWdMm8ETxg/MvvbZjRzsdax6fxLXjiOke2r/N3K8w78EVN
         l4SNOUoU5+E9ECOn/1kUI0Uz4qulWyyVovvqpMk7owVvF35gqBzyy68bIedhSXB1WRLa
         7TRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741224057; x=1741828857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ply0/CzY0yvzBEfEzCiDMoXMyvQu4tZWubmfbiISKOM=;
        b=rqw+6GBdvnj77JmQKZkVzLBdjzdfwoRBpzbXYDTdPAuTS3My403TniHVdkDwIaLLXB
         NULxwMrzG4+SrSrHWv4zHTYUd+Nv6O7FWe9fKzIFeiT/uDfhWsKOIqY261M8CPsFz1YJ
         zVcmn4B3E9itF6ineY65xfqDjG2sqOnDm0cFogfcvuIAjW/v3Ub3QvMe6rxUq++JHHb1
         WV9kTPIn534Ii7Sjm4AmtcngcXf/BpLHG/4oCMcbb/T5l9eyziW2jFF3OVKMN5jhKSTR
         Ioy8uQ1Q5y8y9h6ZuFpa9/kNeNT4IliE3iLUS1+jBd/wMoyPV4AkVPHLMd5Pc0UTJvtT
         1VEg==
X-Forwarded-Encrypted: i=1; AJvYcCV//xSYOoAC65h+YM+8lyUAE7RQqHZK7wbl3IIY3z/f7qazDwcdVVW6tNXV6+rG9/Ssjy760pPTDgAc/maFZhP9@lists.infradead.org
X-Gm-Message-State: AOJu0YzpjLkJIXf/zi/W7M7ZxH3pGoTxPd92wglvdnr9ts3hiTrrYYo+
	ZsC7DqBlbcuk61SwvO6KwVcHsS8fNoBQH37QQ/R3NL2kS+0T5+64
X-Gm-Gg: ASbGncsnzTMBHPJWVHR/2rY8sJWGiF1Vi5JBqdtgctbKAfFfU7ocqpDNNw4i70hMtUH
	8vvnGKDAwVR/26PXe5VQTHqAgr1KrS7qKCAu6pWQozX3IeuiOWcpETSp/DwZEHX2xYg6O+80v3s
	9zM7aK+WN/pxeXAruJNrwYVeHHXYJKxHwl7G9fYlP2GL74XvwQgQgep1sPCjvWhehyNyXVdlQWo
	7WGQAMWCRXJwCwvp6uZbRYZNyqTlFeNKYqzmgzsx0UCiyyGNaGpRgfpSBdNNdsHzED5x0MkjJqK
	kPD26iWbkqxNpm52ffDBa2vJ4oqA0XKec9X3DvnxY4segDIqR0Rd8ysQNr9JFZ/uDY+PIaWttJY
	GLtJd
X-Google-Smtp-Source: AGHT+IFojcpy6KUP4bTQSiEwcKBMBi3P0iygm73XtFG4pDDpmIlmVKc+itvV/UD4VcBCJUi2g4g2pw==
X-Received: by 2002:a17:90b:3c41:b0:2fa:ba3:5457 with SMTP id 98e67ed59e1d1-2ff497cce9amr10138543a91.17.1741224057323;
        Wed, 05 Mar 2025 17:20:57 -0800 (PST)
Received: from [10.89.236.32] (wf126-032.ust.hk. [175.159.126.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddfc7sm730455ad.22.2025.03.05.17.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 17:20:56 -0800 (PST)
Message-ID: <b13f29b8-2906-489d-b955-3f94a9bcb231@gmail.com>
Date: Thu, 6 Mar 2025 09:20:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: apple: Add SPMI controller nodes
To: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250305-spmi-v1-0-c98f561fa99f@gmail.com>
 <20250305-spmi-v1-3-c98f561fa99f@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250305-spmi-v1-3-c98f561fa99f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_172058_581725_20399D8A 
X-CRM114-Status: GOOD (  13.31  )
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


Sasha Finkelstein via B4 Relay 於 2025/3/6 凌晨4:26 寫道:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add device tree entries for the SPMI controller
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi | 7 +++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi      | 8 ++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi      | 8 ++++++++
>  3 files changed, 23 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> index b1c875e692c8fb9c0af46a23568a7b0cd720141b..d544a35c8af414c583d38b040e1aa753902f1c93 100644
> --- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> @@ -53,6 +53,13 @@ wdt: watchdog@2922b0000 {
>  		interrupts = <AIC_IRQ 0 631 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  
> +	nub_spmi0: spmi@2920a1300 {
> +		compatible = "apple,t6000-spmi", "apple,spmi";
> +		reg = <0x2 0x920a1300 0x0 0x100>;
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +	};
> +
>  	sio_dart_0: iommu@39b004000 {
>  		compatible = "apple,t6000-dart";
>  		reg = <0x3 0x9b004000 0x0 0x4000>;
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..0f03dc808cf7c6b7d71afc79dd29d368f957f979 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/apple-aic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/apple.h>
> +#include <dt-bindings/spmi/spmi.h>
>  
>  / {
>  	compatible = "apple,t8103", "apple,arm-platform";
> @@ -604,6 +605,13 @@ pcie_pins: pcie-pins {
>  			};
>  		};
>  
> +		nub_spmi: spmi@23d0d9300 {
> +			compatible = "apple,t8103-spmi", "apple,spmi";
> +			reg = <0x2 0x3d0d9300 0x0 0x100>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +		};
> +
>  		pinctrl_nub: pinctrl@23d1f0000 {
>  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
>  			reg = <0x2 0x3d1f0000 0x0 0x4000>;
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..4b3730c46c4d14a582627f69094b458ec7481da9 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -641,6 +641,14 @@ pcie_pins: pcie-pins {
>  			};
>  		};
>  
> +
> +		nub_spmi: spmi@23d714000 {
> +			compatible = "apple,t8112-spmi", "apple,spmi";
> +			reg = <0x2 0x3d714000 0x0 0x100>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +		};
> +
>  		pinctrl_nub: pinctrl@23d1f0000 {
>  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
>  			reg = <0x2 0x3d1f0000 0x0 0x4000>;
>
Reviewed-by: Nick Chan <towinchenmi@gmail.com>

