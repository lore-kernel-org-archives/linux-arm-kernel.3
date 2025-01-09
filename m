Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C90E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDgsyxy69lo5qTeUNcbMx7T4A8G8zgkMPtLrACBsnec=; b=jOj1zECLMKjYRdiS5NanWn1yyg
	8sIF0j3eELD9gJXskMcvsQs+WCLHITcgFx65gkcIYK0AKWH7TOn83ao2SiMDdbEKMuoAjQLvtZJma
	Q2YSTwiQeJLSLQSzd7fGSDhVb7PPmXsK+pswWPr7eTv/7PiiifnIn1QkrY3ieeO4atqwPw7v24e/o
	h86onbRnAjY5qgY5fyLWmvYSU1btdPQPo33Gktzc/Y2GYoM4BNwvZo+UzeuUB5CpJo8bhLE18Gv/6
	HICk64HfNYzu9dYRc9IpWYgcr0w7+r6C6UGN0Qo5PrYlAh8caCFW9VABcHNaUlsQf98uAxZsXrgSc
	QYt/JVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoZl-0000000BHwT-2fNO;
	Thu, 09 Jan 2025 09:11:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoUG-0000000BGie-2XkD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 09:05:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso641027f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 01:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736413554; x=1737018354; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bDgsyxy69lo5qTeUNcbMx7T4A8G8zgkMPtLrACBsnec=;
        b=OmOKSGDYve1+ur2Jc6bsr9Pm4zzVlxM2m/qv7RTLzm5rtddOeFW+B6hLLFFGXgjnEr
         5xPI1n7zZPmzK+mWON5UFxFpyKdmYVG8Lo1SwQStKgDlFux1tNYN0Opy2UbhZ454+vZd
         71dzJxCht4V0IlTsyfPX1vrWzpVCaP/zLjzcsMhUY3fqA23ykWPmikiJQthKHgvSmE2g
         gxkANHUPM5Dy9ciTfGeyjxe/IEylW2PUoQkSwxnh1Ox6xPw0qX8hgTYPwXYQ72bfoq4B
         KYn6PlcX0DnGmvpxca9wxxg3OIt8uoa8Ov84qYq7iCQsrDrHP5V0e/MG4la4v+7XDJcc
         9ahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413554; x=1737018354;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bDgsyxy69lo5qTeUNcbMx7T4A8G8zgkMPtLrACBsnec=;
        b=m5YAbim0UjjE68ArdS2X53uvR/tVcvMhGA1DKX9d75zdbZmlsH8p15sLEq5Recbnvo
         4hgt+uK5vYZgoPFEqTCsIm4XNPtpVGHR052olM7Z1/0zzdQE8YV2daS2J0F6IN2ONmrl
         QQjCst7v/Bjx6FkvL+xLJFgtl5+uALl6/7qaD/MG52r1KxvPiVQJOBhkl9xZLMZwMsh5
         javeCD97SihF3LVX6EsD7eQYk7JD1jm8KUjhUQGViJX2g4aHaaEUc6RRcSQuOWypykfh
         VHzF+5EYSaPD4HWp7HRds+3YGl+S2jyU3ghjriai0E0S7z1sM9hROVPjWYp4lk2ygbvY
         nvOg==
X-Forwarded-Encrypted: i=1; AJvYcCW1WyRGeB8aFyyfRwrMAjSqbGYJgVdI53Ydq61ioipVpBvwHtgA22ypFvc1DYIi3rFKm9m5cjvZXT0TOmo7Nq1h@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz+4rRQemKjY0+QnfUGbgl3kL9yUvXafN3HLXHBMBmniqiP0m8
	KQlsEVxl/25PhxzW7csLYOnKEuB1OH/1Mg+XTVkp/QcOZc1qtop7TklwLsR6VIg=
X-Gm-Gg: ASbGncsHnUWZtoWKl+0ZDoT/1htgG6MGaagAbZwtioZK6DTV7Z6WWffCVXNfKdpQfsW
	OJebm0Iv/GVmdfBrfKdEsVUKB5M1bmek9tY1rSwy+CJkZ98ySHmhdD4ISSpxBG1iZF9oWS7MhjW
	5bPnUOXh0wDXOKnR7zC5+dSSn09mnHEAj5TMj0m68gtWAtHo71LaYA13zJm5dEerlWGi4RI0VSZ
	dbzHwc+rjseg/k8fxBP5KegK4DDz4kmufWacEzyiRmPeG2VMq0DuDZqGCXXAdKZmA==
X-Google-Smtp-Source: AGHT+IGn6+tUL2qjc6KeWfUfYK5t5bwajgtXVGt6+T5gckzV+WpKCAwBT1XMgXno9e6d1ltcd1lNOw==
X-Received: by 2002:a05:6000:188e:b0:388:c61d:43e4 with SMTP id ffacd0b85a97d-38a8733e1d1mr5799766f8f.45.1736413554441;
        Thu, 09 Jan 2025 01:05:54 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e3834a6sm1214285f8f.28.2025.01.09.01.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 01:05:53 -0800 (PST)
Message-ID: <c58c3935-d9bd-4091-bb7c-d1bdc2485832@tuxon.dev>
Date: Thu, 9 Jan 2025 11:05:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] ARM: dts: microchip: add sama7d65 SoC DT
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
References: <20250107160850.120537-1-Ryan.Wanner@microchip.com>
 <20250107160850.120537-5-Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250107160850.120537-5-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_010556_842633_45B78D7E 
X-CRM114-Status: GOOD (  15.80  )
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

On 07.01.2025 18:07, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add Device Tree for sama7d65 SoC.
> 
> Co-developed-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Co-developed-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Co-developed-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 145 ++++++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 arch/arm/boot/dts/microchip/sama7d65.dtsi
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> new file mode 100644
> index 000000000000..03e1adfdcd34
> --- /dev/null
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + *  sama7d65.dtsi - Device Tree Include file for SAMA7D65 SoC
> + *
> + *  Copyright (C) 2024 Microchip Technology, Inc. and its subsidiaries

I presume the , in "Microchip Technology, Inc." it a typo. I already
removed it while applied this. Just please let me know if all good with it.

> + *
> + *  Author: Ryan Wanner <Ryan.Wanner@microchip.com>
> + *
> + */
> +
> +#include <dt-bindings/clock/at91.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/mfd/at91-usart.h>
> +
> +/ {
> +	model = "Microchip SAMA7D65 family SoC";
> +	compatible = "microchip,sama7d65";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&gic>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +			device_type = "cpu";
> +			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
> +			clock-names = "cpu";
> +		};
> +	};
> +
> +	clocks {
> +		main_xtal: clock-mainxtal {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		 slow_xtal: clock-slowxtal {

There is an extra space in front of slow_xtal. I removed it while applying.

> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +

There is an empty line here. I removed it while applying.

Everything else look good to me.

Thank you,
Claudiu

