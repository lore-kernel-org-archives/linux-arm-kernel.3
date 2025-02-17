Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A91C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDTAaNjPvymL+5POOcQD3DHgYRwOtZyMkyZgmLHZc7Y=; b=gmS2Tk2cnntcj4
	g6ghx07ITCxxZ5vr26yrH1LQ5xN8GevGUkdzD3x1aT1VPAf3WANpRoCCnyI12xWdiU8YNYuNF3VJO
	OEiff4v69S+xNfkpf9skMtsrm/xhOeRA05SJOFa08OHB5CZHuIsnAh+B4xeAPCR1qM379Ei8XbnSR
	MG7qNMHcCWR5aStov50A5tOc5JxWsJ7LiMExYKFFQFYbbZLgKx/VviN6FMV5zarLNpkIxiRdleTu+
	KchCADY1epSRVcFneeXCvK4yqcd/PpeO62tItZpfhJ0WUFRV2SnmqItuBHX8sgL39vjz85o8HZIFJ
	Dw8OJZv8v2nfQo/h99oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjvDt-00000003YeJ-3I4M;
	Mon, 17 Feb 2025 07:07:21 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjvCR-00000003YSG-1m8C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 07:05:52 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso595409566b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 23:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739775949; x=1740380749; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDTAaNjPvymL+5POOcQD3DHgYRwOtZyMkyZgmLHZc7Y=;
        b=XYSFJ1l16xN7OUif4TDulDRwQitwo0pfXGJAdlFa7ib+jJ6w4QN5pYNG8do9zId5oV
         PVQvl6/3ffnNcoFhmXIjwK64uXDSlscurheeffq0ZcODhQTt+lmJxsmRDyhb5uNh5dxk
         oQr2tElebcscfQM43a5TMnrj9rwwI7yKXBf+2vOPVCCv3FLUnVG4/p1EibZDNP/963ab
         lKYcBg1GgmjHvMIMDMldEfkZ79TSSNYSLaep+l81m8On6Sf/4HeGRne5NyLH1mtrOyvR
         ETdWj1TYhqRtqFXdRwA/5h6IAZ4ZU9+ZJkF9Y8OqvwLhm0pTUKB2YSzsJsQBVVeq+49I
         YW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739775949; x=1740380749;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDTAaNjPvymL+5POOcQD3DHgYRwOtZyMkyZgmLHZc7Y=;
        b=T1iX+NeFurPq/54X0Zth95ejoXz3i7ILuTezEw/DI2SLKORZOmzg0IOxDB+F0Cci0P
         mx1910A78TpMY/g5m+mWbpvGCoJ5WBSnINILQueMRh6aKuPU9qdafE1l6xTzCPaems1I
         Wr72EtV6AdAnOqNm5dHbIeH6WjtUD7bZ0ZYACtE0H1MwtkXFCW9KxGGvgiiootTITJDD
         E8EjkmFmrPWvVIaEEu+GATOlcifQ56HSJdBQA7ZRAxF+UCSr/6Eey/uH20FDjkEfxwdw
         nggiJxiuDF+ucf73lJi6JAl6BJ/OrGOPcIG0+q0q4cDV41OJ44f0+fw0L1YpZVSEzJ0t
         w5rA==
X-Forwarded-Encrypted: i=1; AJvYcCUHas97o0LodLrEGJHxrXGhnNgzzaTYDU6RGJ8B5yvp0+4SlHqVIXdp0dOp7lDmUgG6H3zV9+bQc4aKuHvrlu+Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwVsrhOb/IUtMgvRLuuRWCu8yPbcUjd5zzV5t4NaOez5eCEI2qP
	2wQeqhTqTCAhHgb9LNBYIw5pLBIcK1m9wHeQC1DDi34hI5fPBXLXCTMWgC7QmTQ=
X-Gm-Gg: ASbGncunFUR8cR1Gwu2w/3saLmD6IyScmqZrnk+KABIpntNS0dmx+TAiIPG247HpLDx
	1nL+P0DHDGQ4SyiZRZ0tHR1GLdX8c78+rKTNg9IyxndhnPM3ocJ0UeN6HiJPbzWtjD39sc6qfo5
	IMPCVkTtyu/vagMTkuIRdFkknD9dHpHPItgDp4w256zSz/u11pr6QmNeJ4MmjnRftTbO9xO4reE
	7ByrC5uLI1/attn+AYfrlhvQzo+uKfeaPy7u7HpyF+aqoHsjXjfR2YXJeTn/veGS8zGHMsJAhm8
	TpntVB87yPOedlbDOkGjV4A=
X-Google-Smtp-Source: AGHT+IE/V6kFksjmU9jpYeXFzBYu7bIgsDyXTPfFPUEcs+l8eg8Sk2rnVz8ksJX5C4iCTediHir1+g==
X-Received: by 2002:a17:906:c154:b0:ab6:db3e:2649 with SMTP id a640c23a62f3a-abb70a95729mr814742466b.14.1739775949500;
        Sun, 16 Feb 2025 23:05:49 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376326sm827729466b.87.2025.02.16.23.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 23:05:49 -0800 (PST)
Message-ID: <c04fc470-5ac7-4cef-98ef-5f06c3315ce4@tuxon.dev>
Date: Mon, 17 Feb 2025 09:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: Move address/size-cells properties
 to SoC dtsi
To: Alexander Dahl <ada@thorsis.com>, devicetree@vger.kernel.org
References: <20250204165205.2375940-1-ada@thorsis.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250204165205.2375940-1-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_230551_503272_91A21376 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, open list <linux-kernel@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Rosin <peda@axentia.se>, "moderated list:ARM/Microchip \(AT91\) SoC support" <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi, Alexander,


On 04.02.2025 18:52, Alexander Dahl wrote:
> Avoids warnings with board dts files enabling ethernet-controller node
> together with phy child node(s).
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
>  arch/arm/boot/dts/microchip/at91-dvk_su60_somc.dtsi    | 4 ----
>  arch/arm/boot/dts/microchip/at91-sam9_l9260.dts        | 2 --
>  arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts | 2 --
>  arch/arm/boot/dts/microchip/at91-sam9x60ek.dts         | 2 --
>  arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi    | 2 --
>  arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi  | 2 --
>  arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts    | 2 --
>  arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dts  | 2 --
>  arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts  | 4 ----
>  arch/arm/boot/dts/microchip/at91-sama7g5ek.dts         | 4 ----
>  arch/arm/boot/dts/microchip/at91-tse850-3.dts          | 3 ---
>  arch/arm/boot/dts/microchip/at91-vinco.dts             | 3 ---
>  arch/arm/boot/dts/microchip/at91rm9200.dtsi            | 2 ++
>  arch/arm/boot/dts/microchip/at91sam9260.dtsi           | 2 ++
>  arch/arm/boot/dts/microchip/at91sam9263.dtsi           | 2 ++
>  arch/arm/boot/dts/microchip/at91sam9g45.dtsi           | 2 ++
>  arch/arm/boot/dts/microchip/at91sam9x5_macb0.dtsi      | 2 ++
>  arch/arm/boot/dts/microchip/at91sam9x5_macb1.dtsi      | 2 ++
>  arch/arm/boot/dts/microchip/sam9x60.dtsi               | 4 ++++
>  arch/arm/boot/dts/microchip/sam9x7.dtsi                | 2 ++
>  arch/arm/boot/dts/microchip/sama5d2.dtsi               | 2 ++
>  arch/arm/boot/dts/microchip/sama5d3_emac.dtsi          | 2 ++
>  arch/arm/boot/dts/microchip/sama5d3_gmac.dtsi          | 2 ++
>  arch/arm/boot/dts/microchip/sama5d3xcm_cmp.dtsi        | 2 --
>  arch/arm/boot/dts/microchip/sama5d3xmb_cmp.dtsi        | 2 --
>  arch/arm/boot/dts/microchip/sama5d3xmb_emac.dtsi       | 2 --
>  arch/arm/boot/dts/microchip/sama5d3xmb_gmac.dtsi       | 2 --
>  arch/arm/boot/dts/microchip/sama7g5.dtsi               | 4 ++++
>  28 files changed, 28 insertions(+), 40 deletions(-)
> 

There are some other warnings triggered by these changes:

  DTC [C] arch/arm/boot/dts/microchip/at91sam9m10g45ek.dtb
../arch/arm/boot/dts/microchip/at91rm9200.dtsi:213.29-225.6: Warning
(avoid_unnecessary_addr_size): /ahb/apb/ethernet@fffbc000: unnecessary
#address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
property
/home/claudiu/repos/linux-microchip/build-arm32/arch/arm/boot/dts/microchip/at91rm9200ek.dtb:
ethernet-phy: 'reg' is a required property
../arch/arm/boot/dts/microchip/sama5d3_gmac.dtsi:66.29-77.6: Warning
(avoid_unnecessary_addr_size): /ahb/apb/ethernet@f0028000: unnecessary
#address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
property
  also defined at
../arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dts:50.8-58.3
../arch/arm/boot/dts/microchip/sama5d2.dtsi:382.29-393.6: Warning
(avoid_unnecessary_addr_size): /ahb/apb/ethernet@f8008000: unnecessary
#address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
property

Thank you,
Claudiu

