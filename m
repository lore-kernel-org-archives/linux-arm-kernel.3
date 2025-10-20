Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2381CCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNuJNEa8H6a1Hi9ZFQNvUrGKVUMBUcGXXY/Ad9QcmGg=; b=DVJwmuLWSfiKF9lLvmukRzU5KH
	AMi90hWCWbxivh8GvGQDc+Q2JRKXbEKA3dIcuqzonaOa1RFkVBE+4+vW6l/GZHw8S9VRJiQ8yQ/a0
	/VAeNBxD4zSwy4SjqfeMdrdPJB5B9UdfE4VshsOvREndleVA1BrIwyhxTVgcB89Tze44NnBEPMIue
	MXgFIoA8Pnj2qRX0QFRScMPczQJMDcYHHYgEsglfCejNAvM5nV9WPvCt/zvEIRlWxZgcZ4rW6BzcN
	37EeXFQj4QcmFHZ4e3kqfG+hOfZKIPo/917jHz/DH5kjtenv8pDXVIbCeHA5pLyPD72OX4xfhihUi
	o/8Ng/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvNn-0000000ElJv-2725;
	Mon, 20 Oct 2025 19:17:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvNl-0000000ElIw-1MJz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:17:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47114a40161so3870055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987843; x=1761592643; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gNuJNEa8H6a1Hi9ZFQNvUrGKVUMBUcGXXY/Ad9QcmGg=;
        b=EwJfLVMWHqF4H7u/zNEH1WDIgI3odX3rUkbGplnfNqxqc0KengYkx8wjKecFC8J2RR
         EAueTa/fOehQO8/e8Ed514EJfejMyFoIYuraLCd0WkpEza5UWGZXmkyUtcoEPmYSmN9I
         X6dlBMUPnHubA32kN8YGrNqqXQZ31cqp/qN9DHbxDW6zZF2rV3IeRpKSxLdwsGCFlb2V
         pePRdjfP5J+S1pbyTguc9O5HJXeh1OoXzMvcbFLE88YdVEKSkupTYmklj0XELmO3mfXs
         oo/5K6ODn0HixxXS7JRe2feENzO+j2fQl9gpWXbWSJsd1AdlhpNFHm3hhBExkdk9tXnP
         5JvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987843; x=1761592643;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNuJNEa8H6a1Hi9ZFQNvUrGKVUMBUcGXXY/Ad9QcmGg=;
        b=Kkd+PVSZu1Jj+L8oWKMsz/XOU43KBlXKuw0iutarzvHerrRmnMLTnH7ZfNNsWJGRuH
         fevHadG2daTjhp5rroJZh92wsn60U0rDmdlg5cH2PpxEtjNtmm0mkYodWUDtFEEoAnxN
         XWDPPUnKKnN9KNwKiC/H+ILgiYYkdYKtlgNs+Xco6VY5o8roF4xZ9XqpIsdwLX1Tq6xh
         zFIdxBIKsBeBD34GncfsRZLduLdL8rf+JWvdNXJim78njqfRYQTZR6Is3wZygjvLQLQX
         fCWsya8NFsGsXTG9vQXYip/GsBqc+4fxlqDUBkeW362qTuVCMw/P5vUwUIaZUMZ9Yo2e
         BqIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVD1qgl4IPNI2rQ/rfp36PNn9nRgkO4dBLzNyr6GosL61eDoth3+cb3syLj24y0yQrg977Zs/IjybtVHUfNJ9N@lists.infradead.org
X-Gm-Message-State: AOJu0YyHlKSDB5Qo3PE2GzDmkCOR2gzF8+zpZ5x1b0yg0jMG1S7t4TJ8
	46dkotuVLcttcmKy0Ah2pPZR8XNeLulj7/CyqHNRvN4eao0kcJn4IBmuqXUkzqELHoI=
X-Gm-Gg: ASbGnctdxyft+Asf4WJWMuCB/4WuSauG9YJdCzzjR4jzzdR/Cjv70uaPFDcjyKg8KmD
	M7W88bdQ5WB3edUgex4jrYok3UbLBlMQDQ3MgrQd/eM7+q49IABb2itJkQ1hNG4TEYZXl3gq2wX
	q8NiWTAkZrQMIRCNENIxnZlfJpgEc2j1Hu+BmKLSxnI8anKM5VOxlFLlVk0NxrA9RRFG/pX0xVE
	wUeifCnbgWed7VH5zrYSiRpyf7YW8mCjQj8q6J8B2cM8PVAEOtmrUhxYVFzVPYzO9huP2Po3qBX
	dws3eCi+ZZE3mWd5YmJu6TNm1hFd75AKMuPLnjYqEOLXJSo6MM2AUz6AofTnjPGWvEDhh51yU2e
	a1NKRd5Fd+qC3puM+6L0ymNsfluML+hTAn2vhgpka9YpPu4efJ0ZkAtvRrQqYEwgpQ8qyPy/UQg
	rmotNpib2/zHs0dG4IsIs=
X-Google-Smtp-Source: AGHT+IESk1yhEUcjFDijdAA3soTez4joNNS0ROTIat4Ft5zVYJZ3e548G/BmPG8k76dQyy5/TyttJA==
X-Received: by 2002:a05:600c:470d:b0:471:12c2:2025 with SMTP id 5b1f17b1804b1-471179140abmr122949465e9.32.1760987843277;
        Mon, 20 Oct 2025 12:17:23 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47152959b55sm163583265e9.6.2025.10.20.12.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:17:22 -0700 (PDT)
Message-ID: <27aab227-01e3-4074-8aab-38623b4d9808@tuxon.dev>
Date: Mon, 20 Oct 2025 22:17:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <6979b3734462c97381159f3968a3f22b6193e04d.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <6979b3734462c97381159f3968a3f22b6193e04d.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_121725_380054_37153DE1 
X-CRM114-Status: GOOD (  15.84  )
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

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add support for clk_parent_data in usb clock driver.
> 
> All the SoC based drivers that rely on clk-usb were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Remove the use of __clk_get_hw() for the slow clocks.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to the changes.
> Change how the main_xtal and slcks are initialized so they match the
> parent_data API]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/at91rm9200.c  |  2 +-
>  drivers/clk/at91/at91sam9260.c |  2 +-
>  drivers/clk/at91/at91sam9g45.c |  2 +-
>  drivers/clk/at91/at91sam9n12.c |  2 +-
>  drivers/clk/at91/at91sam9x5.c  |  2 +-
>  drivers/clk/at91/clk-usb.c     | 41 ++++++++++++++++++++++------------
>  drivers/clk/at91/dt-compat.c   |  6 ++---
>  drivers/clk/at91/pmc.h         | 11 +++++----
>  drivers/clk/at91/sam9x60.c     |  2 +-
>  drivers/clk/at91/sam9x7.c      | 21 +++++++++--------
>  drivers/clk/at91/sama5d2.c     |  2 +-
>  drivers/clk/at91/sama5d3.c     |  2 +-
>  drivers/clk/at91/sama5d4.c     |  2 +-
>  drivers/clk/at91/sama7d65.c    | 24 +++++++++++---------
>  14 files changed, 72 insertions(+), 49 deletions(-)
> 

[ ... ]

> @@ -882,10 +885,10 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>  
>  	sam9x7_pmc->chws[PMC_MCK] = hw;
>  
> -	parent_names[0] = "plla_divpmcck";
> -	parent_names[1] = "upll_divpmcck";
> -	parent_names[2] = "main_osc";
> -	usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
> +	parent_data[0] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
> +	parent_data[1] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw);
> +	parent_data[2] = AT91_CLK_PD_HW(main_osc_hw);
> +	usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", NULL, parent_data, 3);

sam9x60_clk_register_usb() could be converted to use parent_hws member of
struct clk_init_data instead of parent_data.


