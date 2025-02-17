Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AB2C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 08:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ed0dltqBzdC5HZEa2Ds04Fdf98U466s3nHyR/nqOJbA=; b=nEnCwQkWPQvLUCLkomwdGd1gEh
	NCifwlM07W9ytaq7ga6fxHEy5fZvZJb3b+YbuH8WE5MllanEq3Q1CdNJJ0S/x3cCiwAQDwaoaF88N
	9NdQ4rGfOTGXxu9ZFWdXnd4kxp27KPPgl9y24vXuWT+vW/7PT2dQKsQVrGrz6MyRAenTHzD0Id0cG
	Aam7q8ybgPgL1gzwZR7ahAhe+wve5Nt1lzgzxpUdjgO1+M3m+QszlpAGuTiubymfYnQij38Sa+3vr
	jrpfS+mbNljFqQo9i4Al1A+FDWICwnZWkOeCorvrXfQcIQJ3f2wtxK85Cg3ZKUv4u3IROjXS0r2UU
	6WzcPUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwHl-00000003jLL-0cEy;
	Mon, 17 Feb 2025 08:15:25 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwGI-00000003jAg-101U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 08:13:55 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e0373c7f55so2906950a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 00:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739780032; x=1740384832; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ed0dltqBzdC5HZEa2Ds04Fdf98U466s3nHyR/nqOJbA=;
        b=WQ7dNrZrFiamIDvWB0CCu6L2z40L4cp5ygHZZEbFw8gK5uPxEbk4PI1AqXlHI4AAz6
         oMwRsWAzF8tBshgc0D2DwWz7Nx9gLQSCX58+5QLA0r+8hXx7L/HM1cZtgjjaiHzRcMXy
         UjtrcFKIoyaglHUYX99tZlfeOWxY5eV7rQT6bj6HCB1nSJvY3V6tCvGomivCXxD9VHVy
         MPzuojLtaUOXl21ZU43sDdbT4lBYVU3i7nIPszQ9+UAg0ehTtxMnlLC401O6/iujtW4I
         j/EcxA3y6LxdxTnCgL0RIPrn+Af0zmkVI6j65CWp4Sj837Xf5NFHV2w8EevjVeh1ICcS
         XDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739780032; x=1740384832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ed0dltqBzdC5HZEa2Ds04Fdf98U466s3nHyR/nqOJbA=;
        b=RjzCK2NNewGkJO/Q3wX0vTHaEqamdJPZa8UQW+yxVFWKFtlFgcMPZpInEoM0kqvzsT
         2LFeLzn+jUHKG1rXtSylVhAM0LMTRZ4ztOo53n12lahQDuwZJGE8KKk8pWAHsBPCmFdD
         gRvdCj/lvMGqyT9th7vw3bG+YDB7nDOr4r5TkQMrICrjj1CFlK9w6toVw6CyKiPneg35
         /wTTCwWXfClKSVE6mvdfhBgiw2HuES7TbApV/Q7um8thoZQc7XkfLedY0vCjLfJX5Grn
         34TnnEW44imJ0b+uL2ftAaAb8+8cgyMKLNQzYzpjvt56iLKgeY83c9P0rouBXv6WwiMx
         zFtA==
X-Forwarded-Encrypted: i=1; AJvYcCVBbphv5HIOpnUDjfK34WxfqHLqeHEdXEMxVe50OkknC6zkrmwXLUOOWYd+avwrEf+KzIf1gIkYlUv/xft1C2Xd@lists.infradead.org
X-Gm-Message-State: AOJu0YwyK3sJnYOVsAlj4ny00kmkkeFKa6So9sAArNaW/LQFv1KA6NRy
	X2Xrl8cLIt0aXSHlCIgkzEpKjCOBPXlXyQ1dVHWpauOYT8pgVAp7
X-Gm-Gg: ASbGncscOVEFMRxc6QQsM9tFpHGqli5K0FLWMZXGqFxIZZeAOn63P6Jv8lV01sWK2Lu
	cl+LcYtJhlvy3uZTj3B8lGhXhrKMj1Iv9HLnpkU2xX87KcbwGe+4qrywUxQ2ZNRFYGNGqSHJI8s
	CCsM4EWo8aOtu5YxHlrHpf0XMK+Ny+AEoRsDjSA08t15ejHX0MgBOUI3M5MdBGrtAGNjG93t+fs
	uju3gqKhndU1MygbmZV3Sq1uUZFeELtcm11MXB0tirj05TmWvJfk8AnV/c2dOMYCp4WE04A0T/O
	dgokosrXKR39N7dmX5/N26we5BgEQKqI42Tiq2G6jrreJ3GZtGSpohtVYGwHe78ytg==
X-Google-Smtp-Source: AGHT+IH9hASZetg0pomp/3PLBU1jTDpvzjle4RrQcRZBFNibluAmBZRivSYjX4BTIAIbbRumPxxbPA==
X-Received: by 2002:a05:6402:2548:b0:5dc:8ed9:6bc3 with SMTP id 4fb4d7f45d1cf-5e036217ca2mr7647503a12.26.1739780032077;
        Mon, 17 Feb 2025 00:13:52 -0800 (PST)
Received: from [10.13.13.3] (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e53sm6846077a12.9.2025.02.17.00.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 00:13:51 -0800 (PST)
Message-ID: <603e7d61-71ab-4ec8-8c37-133dd9847aca@gmail.com>
Date: Mon, 17 Feb 2025 09:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: allwinner: rg35xx: Add GPIO backlight
 control
To: Ryan Walklin <ryan@testtoast.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-9-ryan@testtoast.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20250216092827.15444-9-ryan@testtoast.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_001354_280690_9178D034 
X-CRM114-Status: GOOD (  14.98  )
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

Tested on RG355XX-H

Tested-by: Philippe Simons <simons.philippe@gmail.com>

On 16/02/2025 10:27, Ryan Walklin wrote:
> The LCD backlight for this device can be exposed as a simple GPIO-
> controlled device. It would be more accurately modelled using PWM to
> enable brightness control, however the PWM driver design for the H616 is
> not yet upstreamed.
>
> Add a GPIO backlight node to the DTS.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>   .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> index 388487d4720e2..29d1144fc3987 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -21,6 +21,12 @@ aliases {
>   		serial0 = &uart0;
>   	};
>   
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&pio 3 28 GPIO_ACTIVE_HIGH>; // PD28
> +		default-on;
> +	};
> +	
>   	battery: battery {
>   		compatible = "simple-battery";
>   		constant-charge-current-max-microamp = <1024000>;

