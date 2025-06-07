Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9272DC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPCdCVNPh60CQIkFZngFhiCNDUpIdQrQuGF9ErPiZBI=; b=Y2bSAq8hgICdpYgG3bNWpW0srD
	nGoCSSIURYL0p3M22GS4gW1Fhls+cqb1z5fjfiF6Qv93kyJKhfPQUA4PdaUb0MoxaMmWUBw7nW3Fc
	Qda9BRAm1it74UvEvTRIf/gLYuvYhZ4Y7B1vu18+1wFL2wE+NN77/k9sHgLUNEK8x+nQdnMipS4fW
	iW8iVQbEOHrthWjFo5on3Cz4LQ9uEcxuhBVIjumNQDs1BAWyLnyq8ERq3TVTbEne+LXvhmSwVoJmW
	lceA4YqdjuGwRJRZd/BEUJDIK6YmDC4DGFELKSDNdU3LHB5ywPWxJdvW9wC2H2/Z/HHbWalno6o3r
	VhmriyJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNsDi-00000001e8i-28E9;
	Sat, 07 Jun 2025 12:00:18 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNsBU-00000001dzM-1TsU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:58:01 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-60768e108baso3089467a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749297479; x=1749902279; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yPCdCVNPh60CQIkFZngFhiCNDUpIdQrQuGF9ErPiZBI=;
        b=rTWDSFsI0soRQRrjZQ/mZEVxM1lPtiFUqSilBiW3xNaQ/d/MqsTKRh8qVnz0Hxl6+e
         IiUGFoJh44NxkXIbDmi88UN+2BYXt36qm/A4r5Rw5ifhinXUgCEXegVcE7nOqispcTpc
         KGdM/TR29y2mEMhiZrwDGUprC80SMevjVoLWwh0AAgsGmiY+GFfBOyH240+5kmEYrFWh
         22NjHTHaAtUSs8TC/I/8jOU34gF5Ove8GLZUPUgxT0gPY1JRFFo8QWeyCC/1FgFsWPTz
         vZ5qDlzRqBFi5AbfoFFd+/LLCyfyVoBOE2KsQ44M/04//nGBUSnH7KT5FgxXYZU7zk0x
         9K2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749297479; x=1749902279;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yPCdCVNPh60CQIkFZngFhiCNDUpIdQrQuGF9ErPiZBI=;
        b=NbYgBfo0UygnE4HLjyMtpcNq6XKdJbRKlAA0pBHa7pHgxnL/JgEeLGeFa54dug0XnT
         cgyPmb3uC6GYxFExWq0XWxHYyZK/LlOzoGX/EyMzUM4FyA/ZMpIKcyXXwwzk5Q03GDsE
         3LuW3exgERUQFBS3eHscvvmO30RtlkqXX/UH1viOdmHqK84iBDumpYzsHiclxdKdYeHR
         KMZCRtfRGTzJMASfcSMIlpfOH7f3SywlveeXSy8FPP9QJgTnRvCkbpbhuWNza4IRDlI6
         2mgbEv0Pn7/gHJKcuh4fj82X9vGAqEHT3Fpn0cVS0azKlDvzGp7Itx1bXDhMxEspREPo
         E3Vw==
X-Forwarded-Encrypted: i=1; AJvYcCX1RdVaFBNtBrFnTuIJxzj3EPyDLg62yBLYtY5IltY3l+nphPFXkRSblsgY9O8681o7rFXCsj5Yv8XK7Ue2QIJh@lists.infradead.org
X-Gm-Message-State: AOJu0YxDiaggxPvt1zs9MF+VMGeEH4xNvg1B71AOTCfoU+oVDVwRJJ7c
	vy3mKaL3jEmNVcTRYIa8me2ezmJOKoCnweqbO2R+beHozMcGsIOyixEJDusmtOWEXRs=
X-Gm-Gg: ASbGnctPmXhHbGNPOcfZzEanGZLSzFOf9MatCBmpuCzUP/fVvFLvSpiVHK1LulVZd/m
	QTNxCWv9ZTSvlebOWGrAYUiRDM4VHDMoPXK1km6TRYE6ZnOW86uYyRQGSiHq/gCh49wwnxLGOrD
	kokNYGeiRa7NJTmpTZSGxRrwVljps3HFMGcISuRR5pIU5+xDTYfxknNrdlnXczVIQTGeStGe6ba
	keM62zL5ACv+JKUE4qd7ykayU+3GIbAfTcZsmerdQ1q74ej2NBqKB5uwyA2Bv7+yBskpPRa6Vt0
	PrATfnp+z38lDjVNNbijC/y4A4Kv1GWaA8W61wfMzBz/HkcyKPZIL3bS2FGxIwGJUUjEaUg=
X-Google-Smtp-Source: AGHT+IERrOwE41W6Vc1R8qsjoPAiIrdHWQSf8w1zwFS94QITX4oTtjAckH9gOjzfGmcTrsxtMCJSgw==
X-Received: by 2002:a05:6402:27d2:b0:602:17a1:c672 with SMTP id 4fb4d7f45d1cf-60773ec86a5mr5416133a12.8.1749297478809;
        Sat, 07 Jun 2025 04:57:58 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077812571dsm2334797a12.0.2025.06.07.04.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:57:58 -0700 (PDT)
Message-ID: <dc0c2777-ed5b-4729-8ae3-6563d8996e2e@tuxon.dev>
Date: Sat, 7 Jun 2025 14:57:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ARM: dts: microchip: sama7d65: Add clock name
 property
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1748030737.git.Ryan.Wanner@microchip.com>
 <f6ae8a38a005e1a4e025b25ddb29113c5e65dead.1748030737.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <f6ae8a38a005e1a4e025b25ddb29113c5e65dead.1748030737.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_045800_400885_698C7B0D 
X-CRM114-Status: GOOD (  16.61  )
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

On 23.05.2025 23:24, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add clock-output-names to the xtal nodes, so the driver can correctly
> register the main and slow xtal.
> 
> This fixes the issue of the SoC clock driver not being able to find
> the main xtal and slow xtal correctly causing a bad clock tree.
> 
> Fixes: 261dcfad1b59 ("ARM: dts: microchip: add sama7d65 SoC DT")

Can you please prepare a similar fix for sam9x7. It is also affected by
this, right?

Thank you,
Claudiu

> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index b6710ccd4c36..7b1dd28a2cfa 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -38,11 +38,13 @@ cpu0: cpu@0 {
>  	clocks {
>  		main_xtal: clock-mainxtal {
>  			compatible = "fixed-clock";
> +			clock-output-names = "main_xtal";
>  			#clock-cells = <0>;
>  		};
>  
>  		slow_xtal: clock-slowxtal {
>  			compatible = "fixed-clock";
> +			clock-output-names = "slow_xtal";
>  			#clock-cells = <0>;
>  		};
>  	};


