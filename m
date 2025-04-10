Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8869C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mex8Z9dzfxz3hW33N8AMNQUPFzwP3mz+qG8H/RfxWWU=; b=yeRxHWvWl+mOVi1oxuApYquxwP
	r/IbnkkGGnxPD+X+Fw6T+P2FhuW1LmneNMcv2Gy0ok+gNFU+6PKyahusTHiL6JPcnO2Ic2XBCCPy5
	r84aCahsxjFuArLA2/QH2Gk0Dn5gRtS36QNPicJaDF18F9ilBjnV41wbw+1rXaKMw1uQMCHChyw07
	JnEWkkjwogVgpQs46CJEVtOtZvLvJ6gaP0IgzHSxQL5s1kXsAFlh5l9nRwG5p4aRHdId52h7NSOMb
	UMVwPFK0hplOcjnhuFl1tEoQQu2IN0vOLAjB1wvHyGp2k6Saqk5DSOyPWL9mdrgAF707vIIDqlgdT
	TTnO6n1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nIP-00000009khC-3b0e;
	Thu, 10 Apr 2025 08:30:01 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mg3-00000009cti-22RR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 07:50:24 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac34257295dso107614566b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 00:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744271421; x=1744876221; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mex8Z9dzfxz3hW33N8AMNQUPFzwP3mz+qG8H/RfxWWU=;
        b=kjtJwECtAgTWAzYt0yOrV+3y7tOfSqlJ+xtbIvcThJegoLQpfAg0XYxELts7D0f6wk
         HnJoPRYLlhn8a1Wy4T0SIjkphz7Gp0KrxTiNj/5O0lSYH6cKu+jHEMT/rZvB8+/BHSHR
         h4cOhW+7qvQ5G1Zn4qRvtUzdx7y6bUmnQT1DNeTwmy8db0JWHGV+9TXVVa5B85/unjM6
         syrSCHHrh7XYBIQ/bF//tfDeDI65genQzFsmoVj4M26i812fQmD2ZUdYdzwLchum0vmn
         0c4ZZFLWzxSoI99aBwTdPwlU41S4oOZlhv68nXBwnxKukBMy6yN9NpVN7CanBU7rgTzR
         CBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744271421; x=1744876221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mex8Z9dzfxz3hW33N8AMNQUPFzwP3mz+qG8H/RfxWWU=;
        b=gymV7H4NzwKd+MDw2R3WTSndf1AdxrLfUmlnyJAtxtndPuTrj4ujLdfUvP8K9Zp+yT
         nDmm5GNjFG4Xgfh0w0zyUpvBWlHO3SFS+elaeI15Y8syD1negALHPvX/Xh0ySPXmCnLy
         CQJAu/HuAz2Uu04sSteLn7g4VGcgRGt9YRXI2FV8lxxhLi16FgBfInDn8FJQZkf5w7Zb
         RUqpWMB5YXGHhPH7rw1ESqwEVipGjPdaf2vaS9BrhOWitk9s1UL3AG0KR3cNabWiwtiQ
         WJvLjWLEwWGqBxRmYkKdh7tqW55tRFqRIqjUzAyBzyo1LTJhyfUHQFE0988vJaomSltT
         YC4g==
X-Forwarded-Encrypted: i=1; AJvYcCVFQzkxcx2osIDdqK1GtKK2yBS6Qq8cZhhDKgC8ljOOEFsL8JLnIXm+8Lho0kFFavHy1Z/XJ1dcVBCNr0aQuElw@lists.infradead.org
X-Gm-Message-State: AOJu0YyddukQgkVXTKCqcvPYs8BN9CtM8COJFpcEjK+F0TeG5BDkdpbm
	jU74Baia74Nf7TZ7kjC/PgBql2Fykc5rxkxnJPuh/udoGOpQnthzgo+lDg==
X-Gm-Gg: ASbGnctx1jS2C46rYqXANrhm6gaiu87Io66FJtfBcfKqutAEejXuxdiE0YHPGCSo6OP
	uC8YF9NP1wU0MrJfjw4qNngcKCG8laI6UF+BVBJcWU12edDrBDQbnfypIwFBVeBak8CYffQEJdj
	HQgEbDm30lI53oPM/kPZ8F/Ae4ilzEGF6v8JXHft73CcmWPzl80j0zraCJcpdjWcnwM5ofulmZZ
	FDm6njuvyQLyhAbsPHslIqYvBxbMDk9zqju0qSlSXMp/InIwjOgjicS79gvs/hHWHf0VgYUtD6C
	rxAqEeStBEbrbhUhQu+hO5IeJZQtblwpgECbDLQqpT0gBmCEChfMtPrT9wO6My80QnofAZhtyeY
	OV7VRKNwp+6WWsh0iBv9eJ1fWzBwNZPpwBzJ9fuQ=
X-Google-Smtp-Source: AGHT+IEUKtIECQHfvCCQHEULrOOyIkJYLflU4RweKbQ5LyEXFJ2aLZNpy2NRTB84slWGKlTEWqpvyA==
X-Received: by 2002:a17:906:7310:b0:ac6:edd3:e466 with SMTP id a640c23a62f3a-acac008e44dmr102214566b.19.1744271421157;
        Thu, 10 Apr 2025 00:50:21 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-79-37-123-173.retail.telecomitalia.it. [79.37.123.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd195sm225096366b.130.2025.04.10.00.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:50:20 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:50:18 +0200
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Joy Zou <joy.zou@nxp.com>
Subject: Re: [PATCH v2 3/3] arm64: dtsi: imx93: add edma error interrupt
 support
Message-ID: <Z/d4OlTG6uDXtl49@alb3rt0-ThinkPad-P15-Gen-1>
References: <20250407-edma_err-v2-0-9d7e5b77fcc4@nxp.com>
 <20250407-edma_err-v2-3-9d7e5b77fcc4@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-edma_err-v2-3-9d7e5b77fcc4@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_005023_526781_5971AFB5 
X-CRM114-Status: GOOD (  15.64  )
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

On Mon, Apr 07, 2025 at 12:46:37PM -0400, Frank Li wrote:
> From: Joy Zou <joy.zou@nxp.com>
> 
> Add edma error irq for imx93.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> index 64cd0776b43d3..9f6ac3c8f9455 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -297,7 +297,8 @@ edma1: dma-controller@44000000 {
>  					     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>, // 27: TMP2 CH1/CH3
>  					     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, // 28: TMP2 Overflow
>  					     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>, // 29: PDM
> -					     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>; // 30: ADC1
> +					     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>, // 30: ADC1
> +					     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;  // err
>  				clocks = <&clk IMX93_CLK_EDMA1_GATE>;
>  				clock-names = "dma";
>  			};
> @@ -667,7 +668,8 @@ edma2: dma-controller@42000000 {
>  					     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
> -					     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> +					     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clk IMX93_CLK_EDMA2_GATE>;
>  				clock-names = "dma";
>  			};
> 
> -- 
> 2.34.1
> 
> 
Reviewed-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Tested-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>

