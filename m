Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E24C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REr3JojQsOy+vlvyz0onFg9+R7wkRagQJ4eKviyK6zY=; b=EJE7KN6U8BMQ9fs9VbEjZDuTZs
	Xk6/ah3bB1L79jxYZDRLO5/Ixiiqgsk/DxxDzbTKCKDxmI6p3B86dkgQDIqU+lciIgJO3WmGNsWDv
	t/RDGRKIYNSDJklWjKvpoxcpqbdBfcNlEk2qtlfjaByJVgJI/myzVcKnja+nN+xB+qQIRk+Bp4t5P
	ucj3H+sQxgzuGiED70DBG6exrxr6RGcgQUUvq87alZJxcx2BGcdNvahNwdRgkoGChPafBOJFOluF/
	AM+8bxpiWM9qKUCzANP+DvBMJpOoZOVbXexzi1yJJd/D5GeYPbplJss+4hnPIE9Y984O26/jWYlAh
	Aez3i9rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFit-000000006E7-1zzB;
	Tue, 04 Feb 2025 10:00:03 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFhY-0000000061b-1NxS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 09:58:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so53508095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 01:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738663118; x=1739267918; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=REr3JojQsOy+vlvyz0onFg9+R7wkRagQJ4eKviyK6zY=;
        b=dab+wNg9b6l4OEp3bbtEo38nVb0baycCwwPFKsImnUk+IkmCqaXhlLIbegE0RoDw+T
         KLy82qQMCKQusTHBRZRrV3l6Fbged7nP7qnyFk/d1O/0zOg1RHSTmIOZhgHcXMp/yJFR
         yDdR/QJL1+mLVZXkr3aIRzqM9egKvCWFpRpMUqFwUC55mrfmBZiH7F4BNr7PY5k1SBm2
         /KzVeNuZ+HExIIi/pa9MBuatjOGveW7ldil8hWy7LptC8JCE9YLrjEQmsaEKrYAWD75N
         C2dDJqY44I/LStpp8/tmE93OxDoFDzBJj4be4/k+v3wclFvPXoUTrs3m59d0SB7MMIA0
         COeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738663118; x=1739267918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REr3JojQsOy+vlvyz0onFg9+R7wkRagQJ4eKviyK6zY=;
        b=TyYuqOHAHc50Uw61fOeY8B1v52b35OixttLfwpsheQOWuuwm43D6SW7fHL3F1xv6KF
         zixTY2QjYaYR70FqE3An7ntTj8KEcxdIMmpXvkCOCHJnuL59GtRHSNpO6TkbT4/xX7OW
         ifyQBt0u0ze3D7btCW8vL518wvm8/zIf4ILCwj8olhMczylmnjrc4g7CIJYvYEv+lSwx
         sako0gY3Ssd0pgbkUKt3BR3SMWhM/Eymr+w9mXj6N1QlGGXmDwwspqe3IN9T0zLon133
         ShnQUCF5idSxpdN7zLYwap1Ep//ZZQGKfLiPWJ2fjMrMsgPC+VXC+dXj7RlIXxeM+O+1
         2sBQ==
X-Gm-Message-State: AOJu0YwWUviTFVqgx97dQda0nE6s4Jlj+KRFMcTiRbXmPshuJDM/HXaB
	eRj06hr07ETCrIfJw0wPkkN6p0RY8shXEWZN5EaYVE0Txgp7mvcPdqGY7nnxM7E=
X-Gm-Gg: ASbGncufKDlf6STe0I3KgYV1a0TBvidCtc+RHljmCgEaSLLHaxfq9Gzwj1Gx9g++o4a
	SZm0MLHHBGz1x0G7cmc2/XqtdaAo9IfeevMVXt6r2UJCfCwM9ocAVhdT58fIaIClhAaPeg6uT8r
	3YdKbHH/+rGZxr4ROwpusDTFJMw5HgMQhoLYAbozHBC3RvKy6+HENa+/v3zr91/Sa1BLBYIhryt
	nM3vRONWHW1dzy3YgCeMXpaWaveXre5Wq0WgyaX3USWGhNWDSVtl5xVvAOqwseHtwueYsafwKgT
	ClNhRVad6My5
X-Google-Smtp-Source: AGHT+IGghMc4BxN9O+Qe0aM7/qh0cf8oUGD0gp1CkfwZSZ2sexK7/dNOyrn8xIzebmIsfIq0H1OvOg==
X-Received: by 2002:a05:600c:5119:b0:438:a432:7c44 with SMTP id 5b1f17b1804b1-438dc40b281mr195073545e9.21.1738663118009;
        Tue, 04 Feb 2025 01:58:38 -0800 (PST)
Received: from [192.168.2.177] ([81.0.8.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f6741esm8565945e9.3.2025.02.04.01.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 01:58:37 -0800 (PST)
Message-ID: <62589d83-f816-40f2-9eef-3f08fc9157ff@suse.com>
Date: Tue, 4 Feb 2025 10:58:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: s32g: add the eDMA nodes
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, s32@nxp.com,
 clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com
References: <20250203080919.1814455-1-larisa.grigore@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250203080919.1814455-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_015840_372766_F91298D1 
X-CRM114-Status: GOOD (  14.48  )
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



On 03/02/2025 09:09, Larisa Grigore wrote:
> Add the two eDMA nodes in the device tree in order to enable the probing
> of the S32G2/S32G3 eDMA driver.
> 
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
> 
> v2: Moved #dma-cells before dma-channels and clock-names after clocks.
> 
>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 34 ++++++++++++++++++++++++
>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 34 ++++++++++++++++++++++++
>   2 files changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index 7be430b78c83..64eac1dde05b 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -317,6 +317,23 @@ usdhc0-200mhz-grp4 {
>   			};
>   		};
>   
> +		edma0: dma-controller@40144000 {
> +			compatible = "nxp,s32g2-edma";
> +			reg = <0x40144000 0x24000>,
> +			      <0x4012c000 0x3000>,
> +			      <0x40130000 0x3000>;
> +			#dma-cells = <2>;
> +			dma-channels = <32>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tx-0-15",
> +					  "tx-16-31",
> +					  "err";
> +			clocks = <&clks 63>, <&clks 64>;
> +			clock-names = "dmamux0", "dmamux1";
> +		};
> +
>   		uart0: serial@401c8000 {
>   			compatible = "nxp,s32g2-linflexuart",
>   				     "fsl,s32v234-linflexuart";
> @@ -333,6 +350,23 @@ uart1: serial@401cc000 {
>   			status = "disabled";
>   		};
>   
> +		edma1: dma-controller@40244000 {
> +			compatible = "nxp,s32g2-edma";
> +			reg = <0x40244000 0x24000>,
> +			      <0x4022c000 0x3000>,
> +			      <0x40230000 0x3000>;
> +			#dma-cells = <2>;
> +			dma-channels = <32>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tx-0-15",
> +					  "tx-16-31",
> +					  "err";
> +			clocks = <&clks 63>, <&clks 64>;
> +			clock-names = "dmamux0", "dmamux1";
> +		};
> +
>   		uart2: serial@402bc000 {
>   			compatible = "nxp,s32g2-linflexuart",
>   				     "fsl,s32v234-linflexuart";
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index 6c572ffe37ca..4f6201d6c08a 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -374,6 +374,23 @@ usdhc0-200mhz-grp4 {
>   			};
>   		};
>   
> +		edma0: dma-controller@40144000 {
> +			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
> +			reg = <0x40144000 0x24000>,
> +			      <0x4012c000 0x3000>,
> +			      <0x40130000 0x3000>;
> +			#dma-cells = <2>;
> +			dma-channels = <32>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tx-0-15",
> +					  "tx-16-31",
> +					  "err";
> +			clocks = <&clks 63>, <&clks 64>;
> +			clock-names = "dmamux0", "dmamux1";
> +		};
> +
>   		uart0: serial@401c8000 {
>   			compatible = "nxp,s32g3-linflexuart",
>   				     "fsl,s32v234-linflexuart";
> @@ -390,6 +407,23 @@ uart1: serial@401cc000 {
>   			status = "disabled";
>   		};
>   
> +		edma1: dma-controller@40244000 {
> +			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
> +			reg = <0x40244000 0x24000>,
> +			      <0x4022c000 0x3000>,
> +			      <0x40230000 0x3000>;
> +			#dma-cells = <2>;
> +			dma-channels = <32>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tx-0-15",
> +					  "tx-16-31",
> +					  "err";
> +			clocks = <&clks 63>, <&clks 64>;
> +			clock-names = "dmamux0", "dmamux1";
> +		};
> +
>   		uart2: serial@402bc000 {
>   			compatible = "nxp,s32g3-linflexuart",
>   				     "fsl,s32v234-linflexuart";


