Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF23F3C985
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxmjoH0uXTz41md1p9C+JzGNZXnzFWIms4029sqr8r4=; b=2aBl7FvxkAqqzmciPQOiKJ/lV1
	vReBrDKyXYP1qr2dlbA1m6rhiwhdQwjMOQJMgbjvWo379VemYwAkSDZGipZx5XNsW0t7pNwRvGrW8
	ZveJEcJh36KfhvBbgi7DlQbgX1QSiQi6dvvY3hV0upbPokikAThDJM6CWq8HedOrbIqmgDF4W8Vyw
	KCeaqvsfwj+AKDmvkrGDucjT6Lq4EEWJp6Dw/6KPqqeDgVzsVkSDTtyrw9JzNTLl+c7xxbZlhNDBZ
	hvJpEcSOWV/n5gG2KkaOPLzhWvGdKT2Fj8Wz0aeDbUfFLcJWazravRv6PN81U1eaqz7/MIzUNKeeI
	WCQPS4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutca-00000002Fln-38C7;
	Tue, 24 Feb 2026 14:42:44 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutcX-00000002FlR-02xH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:42:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ad617d5b80so35013835ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 06:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771944160; x=1772548960; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxmjoH0uXTz41md1p9C+JzGNZXnzFWIms4029sqr8r4=;
        b=N8yrTEBhdsUs+C4U7e/5hHmooZtV/QfuJL8DJdzK1ldWkulvrNStF1IilrKVHJR3x0
         tEvOzrqeQOnOzhyz4cGHS0M1Tut+aB8i51T04nOOWOEPo5eQa/giKOGnGlPos4pfvus2
         1h8y8nnOuUodk8hV2D8py+YIyIMJzIkH7jwQx8d7CI3Hj6s+sjZu/EdNlXEbM8P+jNBW
         Lw+HeuPq8+nbjzO6bWz0mIhBPVGboSAnNKyGGIkrstrVfO1SSotOsa8R6qfbV6s74wdj
         Jvdp2hOvTIClj5ZIyu4VslOsE+FrbUSZ12xIOAY3LEN78tY4S+lhfGxO0nnVUyBbOOMo
         Cw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944160; x=1772548960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxmjoH0uXTz41md1p9C+JzGNZXnzFWIms4029sqr8r4=;
        b=UGDHoB3nUD5jUNJ3GHSx/S/t46xDj8eP0vJC4fl1zaQp7kPyCFgerkWF3XJViO7Fyb
         E+6he2p/qaqqnOFupMaaXPJjcDWJhKuvXaPCtNWm0aC+Nf224oWCm5Vl6BCd7hT2stCb
         UT4H9avh7VDswSswvB3aEUTKUxuqavXdfS0aIhlr3TC7Ro2m+UgXoSlWk3YU6PjW4Lln
         gEwUiX1iWoclI8PzSLV2Eh1PTVmvqYBr+CA6rxw0baNxuaKTB8zAxKT/pSKucprGWENa
         1zyqL/UzPCZjoxY6o+BpCxG4YUC225EoLezcVTUuClR9JmaqmFEzWCFmhYLr4CVmtteE
         VxBg==
X-Forwarded-Encrypted: i=1; AJvYcCWJcreZZxO+Y7SrMSsD5oqzPX3rdncQHeJjtIS+3HLKCdXupw9KDoQvS1C/MHxJIwGg/BnkTrpVmjScrQz53V34@lists.infradead.org
X-Gm-Message-State: AOJu0YziClrzEZzm/RE6EYnNZHZJsS9cyOwXQBcatUxQl8Ik49QRMjsd
	lxzZ9Pr2hFDrV2IZ2KFq4Htnyezy9bUlRV0ueM9m1MCSO+ori7Oz9nUZ
X-Gm-Gg: ATEYQzxQmIYqMzho7Si0m50SNcolOMTlGZFhDFQ5AkjB6JLAfCOgw4EMHUPBXE9mTz6
	dMe+iGKBBhI0XbBafB/H8dg+VpQKK12v97x+4/hkGktBNxytLifKoBMM/kjhA7f6+d5wzxzqJAe
	yU7ma3FtZFoXQuYk7gMN7bJbe4Qqi8SK0JAkztqGPS/OrcwUbWRjSDRMn6KhaGXKEW7g7OE8OlD
	Vc5X8ynYz9Wivf+vgP2jpUkUUMas0iJoFu0CvSVlZIfMT9qUyKYE0sEMdZ6uvtwTHgaDUHfijZF
	bUxJSuPVkY5IgHVeGv17kTeMxBjFXPPFWnDsjeBeCG2n+gkIRuvWwqpqQ8c3iANiF73BakFhoH1
	3vpC/ofuvqaeEdSlvGBT1TdQwACZwD3iiD8GhdPexwmDIq4v7xiw9gdoslP69GAvCDDUb6IKJNp
	C0dkk711pAM9MWliSGVsF9BqRSyJ++Pj5LUnYSNhIaXavId6B9EPB3RLoiH2JUuv3gaG2U1qR06
	VRNkB8l
X-Received: by 2002:a17:903:11cc:b0:2a7:aa14:82f7 with SMTP id d9443c01a7336-2ad74418b8dmr111623135ad.10.1771944159486;
        Tue, 24 Feb 2026 06:42:39 -0800 (PST)
Received: from ?IPV6:2401:4900:8f4d:6bb:6d92:919c:951b:7d96? ([2401:4900:8f4d:6bb:6d92:919c:951b:7d96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e2a7sm104906565ad.46.2026.02.24.06.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 06:42:38 -0800 (PST)
Message-ID: <11ab7eb4-5c74-4ee1-b385-a5ab95d23b7c@gmail.com>
Date: Tue, 24 Feb 2026 20:12:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] dt-bindings: Microchip/Atmel AT91/SAMA system
 peripherals: convert to YAML
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
 <20260217-cosigner-polka-de13bb9be569@spud>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <20260217-cosigner-polka-de13bb9be569@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_064241_075848_37E0FE8B 
X-CRM114-Status: GOOD (  10.15  )
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


On 17-02-2026 23:21, Conor Dooley wrote:
> On Tue, Feb 17, 2026 at 05:24:18PM +0000, Akhila YS wrote:
>> Convert various legacy .txt bindings for Microchip (formerly Atmel) AT91/SAMA
>> family system peripherals to proper YAML schemas. This includes:
>>
>> - CHIPID (SoC ID register block)
>> - PIT (Period Interval Timer, old style)
>> - PIT64B (64-bit Period Interval Timer, newer parts)
>> - ST (System Timer, including watchdog subnode)
>> - RAMC/SDRAMC/DDRAMC/UDDRC (SDRAM/DDR memory controller
>>
>> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
>> ---
>> Akhila YS (5):
>>       dt-bindings: arm: microchip,sama7g5-chipid : convert to DT schema
>>       dt-bindings: arm: atmel,at91sam9260-pit: convert to DT schema
>>       dt-bindings: arm: microchip,sam9x60-pit64b : convert to DT schema
>>       dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema
>>       dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema
>>
>>  .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 67 ++++++++++++++++++++
>>  .../bindings/arm/atmel,at91rm9200-st.yaml          | 65 ++++++++++++++++++++
>>  .../bindings/arm/atmel,at91sam9260-pit.yaml        | 49 +++++++++++++++
>>  .../devicetree/bindings/arm/atmel-sysregs.txt      | 48 ---------------
>>  .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 71 ++++++++++++++++++++++
>>  .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 +++++++++++++
> Is this intentional? They all say "convert", but only one file is
> removed in one commit?


Yes, all bindings are present in one text file.


-- 
Best Regards,
Akhila.


