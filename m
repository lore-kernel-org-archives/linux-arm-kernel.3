Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6430BC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMvBG083xP6dxkstmeCUA71FGvdXWAHknvGo9znoWPE=; b=TowvSUoKN0GnCsx7wTjw2rdd/Z
	0bsr+zDcsLI/OmOZNIfG49kj7dUvKLHTZx4qPL9Q9mcK7YMU3EbyFJk/WL1XMITyBic1RUnSCjpAe
	Je2LxXg/LSQ76Sn6LROJWUE3/oDXCoFkQc4k5+wokBNsPustX1dLz5nbQi324kQCgFpXZf82QAEwj
	nb+rgzo/Nndq1x+j/5jCpzQAeoxQfeFZLU54LGspeEFK367WPEpV0Y32plYsBbkaQEr2pvx3+vHIx
	h4zOYRAQySIp69u3jx/8u4Gv6SPNUa1fBEqeL2Y1QBywL7C4hlcmpMtBomc0Fq1B0SNS5/lP5G/35
	QYBOvdow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD12t-00000000ii1-30Fx;
	Thu, 08 May 2025 13:12:15 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD10v-00000000iT1-1RJ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:10:14 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ace3b03c043so155786866b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746709811; x=1747314611; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMvBG083xP6dxkstmeCUA71FGvdXWAHknvGo9znoWPE=;
        b=HKI8i69UhAbIjCZhKFIxvPHnD0MoSTgxj123E9VOtAEPD9Xqudsc85gFUbvHXAvz+T
         pqHwDxgJm92yDLIr7Lu8vzu/DIr6MwtyduBV4TV5FzWiWUFaxz6iHdKxr4s6tR4ezhE2
         tPiTh9I/BhvY90pgE0ieeTao3hKynjal1ou3DiFwUXS5kJ7KVaINJuArx7BdO29U3APG
         l15cno7maCtrBKB9A2qCVl+DpEYIjaWs7g1euCTNB7S5UQ+x3FkY3PgRKTjR0XpSME+d
         Q2P+e9avmvUqgWxhF6c5utFk/zyEx2lm3ccjnykSDkL8DxKwGOLe4wXsuwF0l3CiaPo0
         z+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746709811; x=1747314611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qMvBG083xP6dxkstmeCUA71FGvdXWAHknvGo9znoWPE=;
        b=XpY/ZvLenfJaDJx1rbmTGMpjB0DEEr2ryA5wPCtYe+0u0TwGAQCEBCK0VVaNU706R6
         7U2AcUzAzM9jlXyK4mix/oz8sqEiDt3Xxx5e8l/7KPpu9skaiuKqxDYAl/vtsSG6Kir2
         0YEgM5/uIdlafHrOC6nKbqqXlshoqOMflDkQ/AeQQSU5xYLnMRWFUZdjG0LvQcxcY5rQ
         ADVUq4rMVJh/bDBMrfaPqjh6nFiTFMvPwchHlPjKxY8r0tBTgNt3LHdt4z+GkbhkD2yJ
         /4XtEIGgYHL3gE4nSVoXISaGtwmEpgh0NIAb1Ksq6F2EKeUmRUclua1M/ubrABh/S6Wa
         C5yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyv3nrUdCnvU3Pjt+MsbkhZz6OyvkyUbP/GPISgQgmRFsz3x+o3avIVSBGP8v50TCPngMCBo948/xqqSSMK/IA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2UhLVR3P70msShcAG4oKK87Qp7+DpBdvwVvwH/TIF330Ouy1P
	nniUIVkKI84SMXPuNkfkLybIg8csQfW3TJHpzmeL74KAlJus49VI98oGIA==
X-Gm-Gg: ASbGnctKnZek7QSArX9rdo3PMkwvXh+ex0Xk2ZxzAeOfqnpPQl3MrCvWRW1t8YTR5Lf
	hMjzXdqvLA40LabN0Bv36avKD4EANTG0uul46XgH/zzPuwuJfERXLlsKHCV6vhe9JDqJjr9QCxL
	2rAmQfRH7Kt9v9Nku32tATp6KwpAeijAXh3XEYCvdsL0JmiNOTCcko+qih5rJzfGAojaFFbZqWQ
	/42QbFul0iYroy1Wui+R/CdbngRoynP4VEy4Gah5vTexA4jQoLDng1L9GXPsp8hk6fxBuBFG2OX
	ACA+PAlQ9T40gY5prgn2fOwaqBUZ4hrrLd4vhHVwSJBgOhGGnw==
X-Google-Smtp-Source: AGHT+IEB6ljN3284yI5Xfi8yEjwnnAJXLsYkUNbO+pXteYAHjEfhnYbAgRfFH7dO7rz+OnQx0ARB+Q==
X-Received: by 2002:a17:907:9629:b0:aca:b72b:4576 with SMTP id a640c23a62f3a-ad1e8c4043bmr738658966b.33.1746709810784;
        Thu, 08 May 2025 06:10:10 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0371sm1074090066b.115.2025.05.08.06.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:10:10 -0700 (PDT)
Message-ID: <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>
Date: Thu, 8 May 2025 15:10:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
 <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
 <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
 <3a7ef1bd-2c0e-4637-b0b6-2c0b73388618@lunn.ch>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <3a7ef1bd-2c0e-4637-b0b6-2c0b73388618@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_061013_384621_751123A1 
X-CRM114-Status: GOOD (  13.30  )
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

Hi Andrew,

thank You once again for helpful hint.

Andrew Lunn wrote:
>>>> +	phy-handle = <&phy1>;
>>>> +
>>>> +	mdio {
>>>> +		#address-cells = <1>;
>>>> +		#size-cells = <0>;
>>>> +		compatible = "snps,dwmac-mdio";
>>>> +		phy1: ethernet-phy@1 {
>>>> +			reg = <1>;
>>>> +			interrupt-parent = <&gpiod>;
>>>> +			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
>>> PHY interrupts are 99% time level, not edge.
>> That is correct, but I am facing strange behavior, when I set
>> IRQ_TYPE_LEVEL_LOW.
>> My board stops booting at:
>>
>> [    2.343233] Waiting for root device /dev/mmcblk0p4...
>> [   12.638818] platform 5a006000.usbphyc: deferred probe pending
>> [   12.643192] platform 49000000.usb-otg: deferred probe pending
>> [   12.649029] platform 48003000.adc: deferred probe pending
>> [   12.654277] platform 5800d000.usb: deferred probe pending
>> [   12.659744] platform 5800c000.usb: deferred probe pending
>> [   12.665089] amba 58005000.mmc: deferred probe pending
>> [   12.670239] amba 58007000.mmc: deferred probe pending
>> [   12.675185] platform 50025000.vrefbuf: deferred probe pending
>>
>> I must investigate this. If You have any idea, You are welcome to share it.
> Could be an interrupt storm. The interrupt is not getting cleared
> because of something missing in the PHY driver, so it just fires again
> and again.

After a brief investigation, I tend to agree with your assessment that 
the issue lies in the driver—likely the stmmac driver — which is outside 
the scope of my changes.

Therefore, I would suggest keeping IRQ_TYPE_EDGE_FALLING for now, or 
alternatively not using a hardware IRQ at all and falling back to 
polling, as done in stm32mp15xx-dkx.dtsi.

Best regards,
Goran

