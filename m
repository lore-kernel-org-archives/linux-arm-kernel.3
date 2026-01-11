Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C575D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 14:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkabSAxRfLn0dHpHfPolIqVil9ZYQkOUo+uqCMKmtA0=; b=IHjzUkyh7WaiNv4irNbcLAb+Vz
	hA6cnyxHzcrd0egQLOqGzq2wIMd3hf/uXAzCgZ9p2oMggFgEx+WNvBgd9Ag+Lv0gefPnQ/SHPlYJ/
	FjKs1wPAmBx1jzokeW+xX0vmSmyXFF4uQm2nVLstAjo5+DBbhbhEY9mIAhcYB4JB3VUD8jEW1UJx/
	QHEif1Cc0K+U/L+Qpcoty+aFx1pMPD45ERxOo3b2tATWosdrBuTeAeFgYFe9Ot6tLqtfz4CGEZ16s
	N0x5bKW2Tv+ijg0dNmvW7aQO0/ulMOexFuFx/BS0nbiE8GSmwBu2omjRtHWnYhKiT/+uqVbuVMhD8
	HCcWtY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veweE-00000004IDC-2iql;
	Sun, 11 Jan 2026 14:42:30 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veweC-00000004ICq-00El
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 14:42:29 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-64d4d8b3ad7so9253246a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 06:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142546; x=1768747346; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MkabSAxRfLn0dHpHfPolIqVil9ZYQkOUo+uqCMKmtA0=;
        b=L4LfdhRqXzaF/Ln0U2QxSeLaZnrrDnjt9xlMXE7KDk8c33phV4/zM4lHgqvJNspE66
         06mY9xZqdcyPEMr4JKbUu8d6GMz6dRCIZgGaRpKDQuARSmNAojBZUKOc8xImAOnR0rUK
         3sR+5cRAiSfhfU29HGCrVAi1XRdrw2kXqbSz0vuYMFubDlK9hILYIx+ZcDv50LvwNPBl
         1qt8qObR759CphnEI4fZpUmXJ44i2Azz881qN2RfCjAAcLM1Xl7RvNxuMYim/PeOHKjM
         2fYxBxRM8p6EImwZwji4N+NE/bkwtXfqjtynmjeB/Xht5QPPFK6XBSGCM2wY7z9tjdEJ
         rmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142546; x=1768747346;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MkabSAxRfLn0dHpHfPolIqVil9ZYQkOUo+uqCMKmtA0=;
        b=MnXmUjl0TBKRzww2OUnDLk+RQiKnE/7yjE8kPxv13jfpbXoZxL6MrtkKiIGWaNQRj7
         +uych9lKdq6p+y2lYrFyZONAQNpzMVTXb9sdKZK+3m7lxQUvcCvoGNPmqorUrWORbBPY
         6uj/C3uU1Bpz/1EScMkw1IEoSjnRmKHhmg3M+nGcDHnUXYcm6o6wSWFYV+oMDRIPBBJS
         bU6OkO5stvYj1F01J5YUTIFDeBXFjWWUEb3gcYO6pZajU9ULvKAXqUnv15yo+ZwOz88v
         zxUhUuxt4hoy30TZmm+/Y4+Z3569iuJWkMJoUU5bXgSrWaAQl56Skk9bB4YMeca4tDOn
         12Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUqmVGX9GkA/DkyrP7UYxCQQd44GQ1jKZBITrU08TOBnl70uuqcPoOvOHhXZXKE6w8NNzMyhgUtN10YY+gHoVML@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8z5Prq4r7Z1HJErIcrO8r4YpztV+jlnnnTMY5H08+/Msk99jm
	AME+tWKuOpBZIQSR5wFEfXA27OLBfMN0WElELVuNDxF7b6GvLSrXbZaUGY7CXtPM50w=
X-Gm-Gg: AY/fxX6kFiswx5reoR/Y3IavuCUwOcKzuMBm76QMKjPWK9LoWxgbv/S7y4vjHCMleeN
	VyxvDxbvteq+MKUNXZtmwd0IHdc8qvdOG104vnuAxSxIOVGQ/ZEsUXb+DMHBM2uwWfKKBXd2Zs3
	jC4HRZs9OtUlfQGfssBsJ7Sv/FPSC7SyemwBgK7zXFmjc0xvPl9QhkHXC/b2Fv1Msqp5DTdchhb
	wGvZiJQiDKGI6MUzhcN7EDlekN7A+gAbeAufjRbxvCFaMnxU3DDejaAsl+7g+bcpcg1jJgIbko/
	LsYGC39C/l4hoGbPu34dC8riuWxOPVN15m1LPAsoODbqgnMZMzi7oknG6yGDVs/GVmn14o3TdFS
	NHUO6S28NrxMA5Gyu2/UU4IszvRbgl2KndkQ84KsF04kTsq0qC8/1LwVN3OaL8GgBuKnp9f+Bho
	q5UhSMeRA/XlQOMOwhryvinWFzGIbTQwVbGQ==
X-Google-Smtp-Source: AGHT+IFonU/ClDvId9huEtx8OVZbpqDSrZa3cVBTJbulbnKxAZxCbWxaUM02TgbsxBJ1Mah6guhUAA==
X-Received: by 2002:a05:6402:1469:b0:641:8a92:9334 with SMTP id 4fb4d7f45d1cf-65097dceb25mr14589135a12.6.1768142545311;
        Sun, 11 Jan 2026 06:42:25 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be658b3sm14914417a12.18.2026.01.11.06.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:42:24 -0800 (PST)
Message-ID: <2cdac084-4924-4ca2-85d6-2e6d9bf284aa@tuxon.dev>
Date: Sun, 11 Jan 2026 16:42:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 12/15] arm64: dts: microchip: add LAN969x clock header
 file
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-13-robert.marko@sartura.hr>
Content-Language: en-US
In-Reply-To: <20251229184004.571837-13-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_064228_090699_598C0F49 
X-CRM114-Status: GOOD (  13.45  )
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



On 12/29/25 20:37, Robert Marko wrote:
> LAN969x uses hardware clock indexes, so document theses in a header to make
> them humanly readable.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v4:
> * Move clock indexes from dt-bindings to a DTS header
> 
> Changes in v2:
> * Rename file to microchip,lan9691.h
> 
>   arch/arm64/boot/dts/microchip/clk-lan9691.h | 24 +++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h
> 
> diff --git a/arch/arm64/boot/dts/microchip/clk-lan9691.h b/arch/arm64/boot/dts/microchip/clk-lan9691.h
> new file mode 100644
> index 000000000000..f0006a603747
> --- /dev/null
> +++ b/arch/arm64/boot/dts/microchip/clk-lan9691.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */

Shouldn't this use the same license as the dtsi including it?

> +
> +#ifndef _DTS_CLK_LAN9691_H
> +#define _DTS_CLK_LAN9691_H
> +
> +#define GCK_ID_QSPI0		0
> +#define GCK_ID_QSPI2		1
> +#define GCK_ID_SDMMC0		2
> +#define GCK_ID_SDMMC1		3
> +#define GCK_ID_MCAN0		4
> +#define GCK_ID_MCAN1		5
> +#define GCK_ID_FLEXCOM0		6
> +#define GCK_ID_FLEXCOM1		7
> +#define GCK_ID_FLEXCOM2		8
> +#define GCK_ID_FLEXCOM3		9
> +#define GCK_ID_TIMER		10
> +#define GCK_ID_USB_REFCLK	11
> +
> +/* Gate clocks */
> +#define GCK_GATE_USB_DRD	12
> +#define GCK_GATE_MCRAMC		13
> +#define GCK_GATE_HMATRIX	14
> +
> +#endif


