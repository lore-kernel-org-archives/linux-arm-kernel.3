Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547C5C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpeOeAdGqxMbXCn6EnheQKl037hSzc1P5CMiTi/s4OA=; b=GH5n/DCGWoIueelU7x3Cvnnaaq
	VR4Ug3vsPGkckiL6YUy2MyVbrwKmLqQVkB5YF4fXru78ne/v0OKlq1yZRNWqMaM2lJvUPLcsP/G7n
	Mbwgg90+B2C9RHjpd+8qrw4E1ueD2MLhZxoPBLccLo4L4X9sapH21uZBDEXq3hsjFzqvmPt7O8Ohu
	NLaBuNhIHZAmmJfrJNbDXQ4fmhD/HRaKv4k3zTJ0OJd5x1StXoM2nL2kAvUK94XuQ9mrMAuw7B3+k
	DrLWS0NMpeoyceshKTNFfOIPgdS5pkMLV/MUm6fZKaSunUNimM/GclQ0YxUDUE1OxavEtMvYhT4sY
	D1+nFhkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNri3-00000001bPL-357p;
	Sat, 07 Jun 2025 11:27:35 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrOF-00000001a7m-3kNo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:07:08 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ad88d77314bso556981166b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749294426; x=1749899226; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZpeOeAdGqxMbXCn6EnheQKl037hSzc1P5CMiTi/s4OA=;
        b=O2ytqxRnEOyiTqUM13n8kg2Py9IUbSvfWEDSZPlgt3rKicrTzbWe6Rd/cLMWgTWOFh
         oyiaD9uu3A57q4MfmOZZN/YEoy4TbFNWjF5AI594PN3q28TXTnT5GJJp6g7C8+aE3U2e
         KNd+NkG5FMVluaQtA5UxbH+Uda9UsnyblioV9Je2akzVGeAK5sauz2rKFw5R4fwzKUEc
         QMwayDK43+AH44xVGaiRu/ILYV0EKgXORA0emkVTAnsRFSruCIEEpVH8wTTGh4U/LBIo
         mCEYB8Gek1PYMaAEjw6LALy36e0leprJ8InMPlhdDpUyW0OsOY/llO8JDwzAHAN5UvU+
         WOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294426; x=1749899226;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpeOeAdGqxMbXCn6EnheQKl037hSzc1P5CMiTi/s4OA=;
        b=VTVeowvwi4pfoJXR/Pi3e+m5rEIKIpAsTC8s0NXVLht9uISeHJosming5TM53/O+rj
         NNkz+y3SqVqKRjg2m3AQQK3V336hLRl9c2pi7AB8isyZ71bCZM7+gZIH4JQsOtiEtZVz
         BR2TfY2vvQhTKpatQukd0FRUT7VtX/q2kPFwMmB/ahzIGpwbFlvcrWmjjTwFUarkbxhr
         CM0X0NrN+RF9Y9IYOZiOmAc2n7ThcGwSsBTfm2c7Cis0ICygypHro2WdyGkOkw6OGs4Z
         +ldpa3hcql1sutiei+nJb4g1gM7qrD9cKHHEJzewCo65b7aOfUn6DqPWRAaXIpu0cYlA
         HBmA==
X-Forwarded-Encrypted: i=1; AJvYcCWeu/po6nQI0lQwfXiCApKO4JgP/W9mheglkHd0Gc+pMKiBUv5LPAIUXH8Ne+gAIeCOKIy26wuhWjDw4tkczD7w@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3lKgTfuSPZ3R7E0QhO/rxtpjDT3OivmX1onEGZQD3UD4M5xxz
	DxxVLfP/DGyiYGsez4X2rzqLlsIMTq0g3iHL6sOgfYvBXTrbbUpCzNTpggVC9+Quiu8zp1u8LVQ
	wkY0S
X-Gm-Gg: ASbGnctVKlSw9q23cq7zamoLDJrNTYdlFkhrnvaaPJpVY8HOKY8jZ/yn9jIje4CCKgS
	QFez5MUGEvtocPyzgKlGxy2rAseQBCwk4JKtRmRClk04sHw21inYJ5+If/d6e6prmAMIdazjlin
	niqaJ3ZAfJn+US1QxRJ4VTGfERWSgJ6TvNNzx/UExM3saO4Drb5aN8V8v5rpjLVxj1oDNW2aOi0
	pEV+9fwStDuyNMEPUqFzBPbNGB0Zb/FCPVpigMcC0U5R3AQ2wcZQOP9aSekIOolyO+Wwb7EwOaf
	NtQIuMVbfeFKjSUcLtL82G8cLL/jNUwIv+GQZ+4SA4HVVpN+l3a0oGNB7oxfG+I1L/4r2OA=
X-Google-Smtp-Source: AGHT+IG3M8z181em7vBtuZBZYwhYQocgtGu/WkgrN5sHYgBLnsseshvmDwY/I6GFT297t5L4kOKqyw==
X-Received: by 2002:a05:6402:4407:b0:601:a431:86cc with SMTP id 4fb4d7f45d1cf-60773be8fafmr5653795a12.5.1749294413789;
        Sat, 07 Jun 2025 04:06:53 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c8ecsm262161066b.94.2025.06.07.04.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:06:52 -0700 (PDT)
Message-ID: <55a5a22f-aaf3-448e-a628-6309db283182@tuxon.dev>
Date: Sat, 7 Jun 2025 14:06:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ARM: dts: microchip: sama5d2_icp: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
 <20250521054309.361894-4-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521054309.361894-4-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_040707_926342_9021CE14 
X-CRM114-Status: GOOD (  13.98  )
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



On 21.05.2025 08:43, Manikandan Muralidharan wrote:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 46a8a137d8f6 ("ARM: dts: at91: sama5d2_icp: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
> changes in v2:
> - add fixes tag
> ---
>  arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> index 9fa6f1395aa6..fbae6a9af6c3 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> @@ -714,7 +714,7 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <104000000>;
> -		spi-cs-setup-ns = <7>;
> +		spi-cs-setup-delay-ns = <7>;
>  		spi-tx-bus-width = <4>;
>  		spi-rx-bus-width = <4>;
>  		m25p,fast-read;


