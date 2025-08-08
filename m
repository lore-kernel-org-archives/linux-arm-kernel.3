Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D37ECA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuJVZzZIQCTzLTzieTR01L1RJwkvyO7UMJraS2W9Ndo=; b=4zqNzWqhmWKtZjNHMfWMPDmPB5
	BXwVStCmUSfL3exOfVbI6WfonGeBtGabxFyAHjRQtMD1IbylT80N8SdAbe6FpwTcwzM8jvU0MoH7s
	FDlHhu6Lr90tcAa8rpISFtJnAWtl3ufhTbGmMb9uiSbXpVATYP5n5uItSjN20HmBNUrnEvQ4NQ8fn
	VFH/TMWuyajWgl7HG/l+BDsLKl+GJWXN+zn3e43PIsY4VerEqdgceRgw0tozdYgJUYgKrGhtF+V6n
	pmuJm/OGKJV6VA+yeAzAyLsDr1tb+7zZJggtkQlwurQNMIhMSQRplTAUSgP1UlkWWSfvh2bWrRMIp
	/CthD4xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLwx-00000002lSq-0g8Y;
	Fri, 08 Aug 2025 12:11:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLGj-00000002ftI-1N6N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:28:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-459e794b331so12710445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754652496; x=1755257296; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuJVZzZIQCTzLTzieTR01L1RJwkvyO7UMJraS2W9Ndo=;
        b=UagEeGCGR6O09aA9/Gv/d7zP4nXisEQ9eslgoCoD6FEBWYDIzlGeSeNEfOV3vlQgcj
         BCHTjEiO+o4xhMvqYr9xURb85p6cjR1DOPsWXda2tiMwpFgYt18qxzAS8rDyazyEwNgD
         vsR2RUkHdb0NCdva6YM2YaBk57p1ouF2UnXgj1kwC7zdT1hmqfia1/cLR4AX5MFdYUnM
         4sRSCZm5IYeffccXRbZGOSEG8tH5zuSOhVaVJLkIeQSdLau8z82clSfeCoL3NbuH4I7S
         fPc3bPxgutIr5pctcyNQrO/3PYz80oToYRPvHr/ZULox+TkKU+fJavPlDcMFZ2siY9Jn
         xHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652496; x=1755257296;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wuJVZzZIQCTzLTzieTR01L1RJwkvyO7UMJraS2W9Ndo=;
        b=XPBci826Z2NZgKovcHya1fMcT4+BemWn0NHMmuAQSoxHQKTDmfEheOFHVG0U2O7v8K
         mGJH34mkPb12nsSSdTZQiRRQMWEZjTRneJwU4CAVV0k0FRBFRo3lfNRc49SGlSt4yEJJ
         4jplWrDbwlekbSKC/TqgFxtaYFCQnZ4dkc5sDzshx7WyRUtjiPrQhgMbr4oqyIp789GP
         NNrjguD+IPedRj7hrkY463zzDW4DkOVaBdpJOmAFxITX26lU1VCx8Y4N0lTMtRP1634x
         c5AVox5YoOPs41oXTC0ScLTm0Htwn/nrm43uztFzY3PfAekG8JRnGYw9m7uzvOMTR3Hl
         lBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7LpEfmPRS7MmuF7UG9AblVvoNUd39g1mq/NHbRX7Qt61Ryl0FYh4AX2l7uzZui/34StCEdNFbvEo7EsseETjH@lists.infradead.org
X-Gm-Message-State: AOJu0YyzmN+/0QQzmzGPUWEz+JpM4cEU/qwJn0d/oHNP0Z+TVwkEEC4r
	CGTVUbO8jKzRb06I5VcNz+hDh5fXPqFg7xzCQ3OzPV56mwc8SVad3SredebgCVKMAkU=
X-Gm-Gg: ASbGncuS2nS0VZcCfKJIfjc89s1ity1DOFjlXi6Y10KPhrcrXpcauu4wB/yNoLQFlVb
	1W1Y6BqaWSRU4GsF+ChZs37JhPlCJhqCThHgWulStwkTJDHxvnUUdoGqsHM/kYU3DkWfiTt5KkS
	uYTNwSD2bbawkDBi367WH54IJAaLYj1Z5wH/UGdGjN3NqnrS9KFkzwtQTIZ5nyAmasBZ3qZkcDw
	o6b+ar7dJz9dzWW82xueXyxtbVjwl1kfLyxEwIMoa/otfwFSGK+RmklLxzoRJSYsPa37a4WDcze
	jsa+EmzwzxmZkT3mchKRScLFCJ+C62ylxDGH4CLUlDa3d56LggBqBKzMlpo1p2//ZYUej4rRDSv
	s7Qnz1Wn8jSKMIvs7kt4V8Lr1NqfJbqY=
X-Google-Smtp-Source: AGHT+IEaRRICyrF0MfupXKJ2sBoN8+NsjzhBxiQBkAqrwCfw85T5RHBvLEqeXF14peiWqYwm1M7yag==
X-Received: by 2002:a05:600c:3b1f:b0:456:27a4:50ad with SMTP id 5b1f17b1804b1-459f4f3e226mr21968055e9.33.1754652495747;
        Fri, 08 Aug 2025 04:28:15 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458f713eb44sm249864835e9.14.2025.08.08.04.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 04:28:15 -0700 (PDT)
Message-ID: <fa0da331-273a-414b-b0d8-229c6772692d@tuxon.dev>
Date: Fri, 8 Aug 2025 14:28:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "lizhi.hou@amd.com" <lizhi.hou@amd.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113464920ECAC2C3CB89DE2D5864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <7c8c7a25-c373-452a-9fe8-8b2d92ddd885@tuxon.dev>
 <TY3PR01MB113467C09DF7D3D0D7833A6598649A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113467C09DF7D3D0D7833A6598649A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_042817_367236_A26CEB3C 
X-CRM114-Status: GOOD (  17.08  )
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

Hi, Biju,

On 09.07.2025 08:05, Biju Das wrote:
> Hi Claudiu Beznea,
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Sent: 08 July 2025 11:10
>> Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe
>>
>> Hi, Biju,
>>
>> On 07.07.2025 11:18, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>> Sent: 04 July 2025 17:14
>>>> Subject: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
>>>> dma-ranges for PCIe
>>>>
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The first 128MB of memory is reserved on this board for secure area.
>>>> Update the PCIe dma-ranges property to reflect this.
>>>
>>> I see R-Car PCIe dma-ranges[1] and [2] maps all possible DDR area supported by the SoC?
>>> Do we need to make board specific as well there?
>>
>> I'm not familiar with R-Car, but if there are ranges reserved for other purposes, I think we should
>> reflect it in board specific device trees.
> 
> 
> Already Linux has this DDR info[1]. Linux provides DMA memory only from this region.

What we provide though dma-ranges DT property is setup in the PCI
controller register corresponding to the AXI windows. It is the same in
case of R-Car (as of my investigation on driver).

> 
> In your testing, have you faced any issue like system allocated DMA region other than [1]
> and you don't want to use it, then the changes are ok??

I haven't currently encounter any issues.

As the values passed though the dma-ranges DT property are setup in the
controller register for AXI windows, and the DMA endpoints can act as bus
masters, to avoid any issue where the DMA endpoints may corrupt memory
specific to the secure area, I chose to update the "dma-ranges" though
board specific bindings (to reflect the presence of the secure area and
tell the PCIe controller to not use it).

> 
> Not sure, PCIe can work on internal memory such as SRAM?

Inbound window is RAM, outbound window is a PCIe specific memory described
though "ranges" DT property.

Thank you for your review,
Claudiu

> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi?h=next-20250708#n31
> 
> Cheers,
> Biju


