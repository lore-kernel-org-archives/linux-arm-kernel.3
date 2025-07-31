Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56FBC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiWR9YBkQCBk6u1BEFYqq7bF5Tp24tb8A8i+jcDSHqs=; b=CaU+QuXBYGjXkpl8Y3hlLJ/pd+
	EzSEv/Kl5cOROmJNOTPBY3MLHE/lxHUTvBqQIohZbaU0do4xNpGGpT/BrYNVOiPezAeEOBY6debm6
	IzHsJgIvYe9uRKC+lEPXIpPEbQoJuY5zDqtVZL1lZCWaWjYNdPAG3yCSkQk8I3zqMGOl4dTRAuK7J
	QBk8lBstPXgkSkH/cGze6QW5qW5OEHzZ3ihKWeOMcth9wxMfVzGV2bmrhHfUlkxcIIBGrKsZamUPi
	y5W81DUYWI9KXZkwGSX503P4n56huM41q1CrUAfjc3SHlWCHI1a1KSyXuTI/xUGfEq7rpwhZ7OZ5u
	KVze6oYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOOl-000000038Vg-3zeq;
	Thu, 31 Jul 2025 08:12:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOHo-000000037Yg-156t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:05:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-451d3f72391so1232145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 01:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1753949110; x=1754553910; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GiWR9YBkQCBk6u1BEFYqq7bF5Tp24tb8A8i+jcDSHqs=;
        b=MR0QRGSN4WqTeXIvEq7icTDgW++LTjcZjItMFO4eEBv6CKii4w3rKSQWH5wWupJkmA
         gi84dIYfT3gnihyMq/5SSR5JA7c+rxyj1ItUD8LhXrH57Mg8s7wmoCiyi+Ld1kDEkKHJ
         B1qG5gorzh7a3tXhVDWB7i64IxS15ywqiwQlL/evVgbrjVz7WVQuqpCuoavEKU/UQFsh
         9OPQujYM1Ln9/eGLSJWB+fM1HijJCIIZJyuQKBb/YaSeK7CUAfpHLSPZUTV5FR5qZ7bs
         OSp/ltJh0d8Vn5emmOWZvmIah7hf4gIftYYYKSz9iHk/hydo1Jcsa3Y1r9Lqd4b3Rx+Y
         PVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949110; x=1754553910;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GiWR9YBkQCBk6u1BEFYqq7bF5Tp24tb8A8i+jcDSHqs=;
        b=ORWIWvjKdhxHZdqJM80tebpxW8zqYSQQySoxIepIFracvm5YoXHCpr69FTY+o45HcJ
         LhXbNcm5E7v3tpl2fr+zWqujwbUUDitqUJYWY1ktAmsbuLrEAsbGH59rb4EihoRvyJSm
         A27FoSz7RX2ftZS1Ys3BpkCF57EGtgxuOAD+r+UvejnF/tcGLCmNfihCCSjaPSXhKwYx
         MXVG2Gd5OomV/xkkw1gHmiF48Lh4NV0B8OI1fa1d67wVMJUlpCMSI+iUTXrefP/n6bjg
         6DuG7A9Az7mB646imkjyEj2aGbtxLbjTUpZnY0ERenJhPNhpKK7arFzdZlSIA2yp2pXS
         8BVw==
X-Forwarded-Encrypted: i=1; AJvYcCUnIXBYMpLfaqt2ODrozurASxk0rSHiiQJszujwWDP0ORbtRb+j+MOleQy8YQn+2iKPbPetwz2zOfYlzuiP3zlI@lists.infradead.org
X-Gm-Message-State: AOJu0YzrPCHrm6rL7LTbHEQGrjV9sc26V09jUlHgcCo0Jgip2mw/L38I
	TISV2YYb3IyYW5VmaqXHXMvHySRUAEOkCNFQAUgAodCkiUxPCr47u2Q+gOYOTaQZ5/0=
X-Gm-Gg: ASbGnctFYZBvUAkJlv2ig7E7mhA621kCeRPuxo5iqKJJ6ezQ2nUkxgc2XFLb6pfBEzD
	Kt0ukur13aSAI8U6nTmS4ir3GbRIWRlIOlimwopzR396qUCx8KkRbe6PlhvIOvYbTKBFr4QLDxD
	jYZED1PmC25uBl86b8TkwVv6n1G/ES+S9CN9m1x2CFbBB2o4No3S+cXHdd90Nk7qNbmyN2P9FU9
	SWrCgyNZlaA6BLQFE67Kvlu5KkYaAXEXjRzkAyhgZvqasJdlJ73GFE8IXkDGkMmci535XYn5JW+
	1sCW+20Vi4NRah7w9u3+w0rSSpURmmlYlvyicf36UswyE8c/EXvleyYRHyPR4UjDsDoPRhCkmvB
	T0b/wVJ5Ez6ORW/QKLd6hsDqe32cPXg==
X-Google-Smtp-Source: AGHT+IH/541SBqMgVRMwq19FcxpTJ84aTjtwL21hMdK7WasoI4YZqc/Qb8aQtoiT1F7mEW4j9xyVmQ==
X-Received: by 2002:a05:600c:8b83:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-45892bbf78cmr68783845e9.18.1753949110073;
        Thu, 31 Jul 2025 01:05:10 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c485444sm1527560f8f.66.2025.07.31.01.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 01:05:09 -0700 (PDT)
Message-ID: <bac5390f-725a-43db-a2b6-17a68d0d733c@tuxon.dev>
Date: Thu, 31 Jul 2025 11:05:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v8 00/10] arm64: lan969x: Add support for
 Microchip LAN969x SoC
To: Vinod Koul <vkoul@kernel.org>, linux@armlinux.org.uk,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, andi.shyti@kernel.org,
 lee@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, arnd@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 o.rempel@pengutronix.de, daniel.machon@microchip.com,
 Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <175327377884.189941.15214972441246653208.b4-ty@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <175327377884.189941.15214972441246653208.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_010512_391479_3026D921 
X-CRM114-Status: GOOD (  13.81  )
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

Hi, Vinod,

On 23.07.2025 15:29, Vinod Koul wrote:
> 
> On Wed, 02 Jul 2025 20:35:58 +0200, Robert Marko wrote:
>> This patch series adds basic support for Microchip LAN969x SoC.
>>
>> It introduces the SoC ARCH symbol itself under the ARCH_MICROCHIP symbol
>> which allows to avoid the need to change dependencies of the drivers that
>> are shared for Microchip SoC-s in the future.
>>
>> DTS and further driver will be added in follow-up series.
>>
>> [...]
> 
> Applied, thanks!
> 
> [08/10] dma: xdmac: make it selectable for ARCH_MICROCHIP
>         commit: e56982021f5303b2523ac247e3c79b063459d012

As this one depends, as well, on the first 3 patches in the series (Robert,
please correct me if I'm wrong), and there are still discussions ongoing,
can you please drop it until all is clear on the first 3 patches?

Otherwise, applying only this patch will lead to AT91 XDMAC driver not
being built for SAMA5{D2, D3, D4}, SAMA7{G5, D65} SoCs. Linux is not
booting on SAMA7G5 SoC only with this patch applied.

Thank you,
Claudiu


