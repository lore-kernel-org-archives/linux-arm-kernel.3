Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA7DC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 18:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLm2u+K+PI/38ypNwBYrTuGrq0xLDvMbTxRXLnz2xDI=; b=hUz7asBlBNG5dLyPQRR3bwP3lR
	KMkJNTSUDaEWFtQLtst8BwsUlcPfO3YosU4lID0SKx2Tzzub/B3yPlDEBDs/h3pI2+pSCMRcLGtSr
	HruxCnlBjlS5lNa93+sx6WQqE/ls+sgFi57ScTKBm2PkKTp9SfYnsPPyVJGPc6kecVQ/T/rhHWMdw
	hDEbAChzpCVIp3SP2mhSkTJhWqdZ9tRcIuSUbzKMva9vNBcpumyoJYrvRaOhIf6/9e1bVRbj4UzC4
	mZFvk3GVSs9v6zE5ccL+ZvGL0wDyZkDi3q+nDPT4LVLGNNhHVUpmJGzdTHbZ+egNwCT2caYTsOxCJ
	DVU4NMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJcTG-00000009MNx-1lG5;
	Mon, 26 May 2025 18:22:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJcR7-00000009MIW-3YOH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 18:20:35 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a375888297so1663074f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 11:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748283632; x=1748888432; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLm2u+K+PI/38ypNwBYrTuGrq0xLDvMbTxRXLnz2xDI=;
        b=R6nT6V/gxBJRJqvTfdpKvGeSXazrBVrpi55iT3F1Zpo2agBmetRl/IBZkW03OtYjbz
         rnhAvGkvu+lSQetRu1ctvxvFZvQM1o/twSnQJsXh/CYVqVoSzu+5LYV8opZ8ebK67S7C
         GrM3Xuh69cFq3FUa2AWXGvrl4oGu8UugcTVovWVPt0n8wU1AV2Df4f/bNugPSyDgOCB7
         xm59zbFoKzmuSktPp350UGm5FEhGYY0wUvDh3fvZUHbLLZlnybxijasg3AtKEcvLha4u
         gEJUBwkY3fy0omA5Vtttwo8A7DhVcCoC+nqcwW4XEY3BwwAqullj/XA8PfGP20te1xur
         x+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748283632; x=1748888432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLm2u+K+PI/38ypNwBYrTuGrq0xLDvMbTxRXLnz2xDI=;
        b=GWpT7aY6GSGSEgWhEkphPySPFjiHqlLF55McgYkRahfr5yTbRlye88laPtFNxswaZo
         CsjD8x8Ojh06/SJ0Ayflxd/AluXNtDDYKQsyinV5n82mGKwXRGa4oXjGnBj2q67C8nrp
         P3ooPd3NthBO3Lzoh17ZBswpYFm0JnQX03VpPW1++zJlPLbA3Ouml9ZvJYBRJOxww3Ku
         Rz3L7QIjoevF9l6inlG9ZoliFoaQovVt/NDHfDsBK0Jnji6vvda1iatsYlANpOtxrzDk
         aUnEu2iEtqPV2uHjHwE+NimZCsngiTtLT73dLlhwAwz4Qn8UZtHjbo+J8yzufidoN1hP
         6wCg==
X-Forwarded-Encrypted: i=1; AJvYcCU9wSZO25QzfFFivB0a9jGgb08YOp3rLkxouA8VvIDZrarMJ/9zrNdbdtwlmZmS3w4xFgcbRQddAog0s6NeHMSi@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx52gGXsxbdt/HPxsCPQq4YFzdKfFlikR8PPrJbfiVJ0qN99Zh
	YBPDLNE225LX4IbBG/YPz8ami58JSGIcRwwNx8TWLgSGv4Bz9hrZ7DdI5yh/D6zIFuY=
X-Gm-Gg: ASbGnctpBXravW3fHjtr7AK0qh2WAupy4zMsp0Pz967/XUI1dNJiJ80dDtjcb4bRUxd
	QVPQQLXMH/pfVDtxMsOejr60WuySSn0SQJp+S1HIWsEiqLk4mQ+RaAp8ykUu6WtInNwWT7uWVbw
	rwn3FLsRoVxEtz8L2Ahv4zokKnr2UKiMbfYdzeAyYm2uSaBnGEgmrmjpwPNpospVN25V0vJ0+Fs
	3TEMuZQUocxYdD0co1CnP67oXGMxsWjrZaIx15Qk8fJqfaWvpsnMnLyIyzLNZ0YlSHRxGuDiI0Y
	XJjnRyvj8oV23gkV4LjdsGL15vykmusW+3miTSHzkUpgswYskfW7
X-Google-Smtp-Source: AGHT+IHu8Gg1J8BbsWgqjCqgkp/CdznFrPX5IKNjnPHBnTXYL0HJEukNqC3gh5NYw3XdXDtRMjCSCg==
X-Received: by 2002:a5d:588d:0:b0:3a3:6a77:3391 with SMTP id ffacd0b85a97d-3a4ca4139bemr8058309f8f.15.1748283632092;
        Mon, 26 May 2025 11:20:32 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d53ce0b4sm5179796f8f.37.2025.05.26.11.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 11:20:31 -0700 (PDT)
Message-ID: <7f986e07-69b5-48fc-89f1-8ae37b998faa@suse.com>
Date: Mon, 26 May 2025 20:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: s32g: add RTC node
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>
References: <20250526162140.2460122-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250526162140.2460122-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_112033_900855_653C3897 
X-CRM114-Status: GOOD (  14.94  )
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



On 26/05/2025 18:21, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> The RTC module on S32G2/S32G3 based SoCs is used as a wakeup source from
> system suspend.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 8 ++++++++
>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 9 +++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index fa054bfe7d5c..39d12422e3f3 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -114,6 +114,14 @@ soc@0 {
>   		#size-cells = <1>;
>   		ranges = <0 0 0 0x80000000>;
>   
> +		rtc0: rtc@40060000 {
> +			compatible = "nxp,s32g2-rtc";
> +			reg = <0x40060000 0x1000>;
> +			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 54>, <&clks 55>;
> +			clock-names = "ipg", "source0";
> +		};
> +
>   		pinctrl: pinctrl@4009c240 {
>   			compatible = "nxp,s32g2-siul2-pinctrl";
>   				/* MSCR0-MSCR101 registers on siul2_0 */
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index b4226a9143c8..e71b80e048dc 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -171,6 +171,15 @@ soc@0 {
>   		#size-cells = <1>;
>   		ranges = <0 0 0 0x80000000>;
>   
> +		rtc0: rtc@40060000 {
> +			compatible = "nxp,s32g3-rtc",
> +				     "nxp,s32g2-rtc";
> +			reg = <0x40060000 0x1000>;
> +			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 54>, <&clks 55>;
> +			clock-names = "ipg", "source0";
> +		};
> +
>   		pinctrl: pinctrl@4009c240 {
>   			compatible = "nxp,s32g2-siul2-pinctrl";
>   				/* MSCR0-MSCR101 registers on siul2_0 */


