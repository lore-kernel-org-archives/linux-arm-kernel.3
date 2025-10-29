Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387AACCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+/I2yfPoWDJTBN37DUOvTovSE+HP8yoku6LrNjmVH0=; b=F/LgS6HByyMFYXmmryRwn7pBRM
	nPzSzXLX+4dUmMkQFNpPSNxrxwcK+Sa6JwVa6Q35UzJ1mLL0/dxHFTIo6BtVfuOUzM8oE0nLjpk0w
	p+ZnhYmHKb15rRvOYl7lxG+tRec6XASymHnxDzZLiBxtqi3tNoxHLPPTCHr1hzgjjM+edDNwwqLe7
	vpuoiLb+4QPuEJmlfFSDxo1oYHnMwIMIQE+uk+8JG/LeSBn8h3ZAeDZMyZnnZSRJcdmyzlE1h7h1m
	I11phlbQUAW2W1gXxK0n6aNMD+xQ494hS59lXA4EJrRyDdQqRYaLXrZi2xJ3zxb8TiNiHPCJ0ivDJ
	wRSJymJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7Un-00000001epR-0YL4;
	Wed, 29 Oct 2025 14:49:53 +0000
Received: from mail-ej1-f45.google.com ([209.85.218.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7Uk-00000001en2-1lHh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:49:51 +0000
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b70406feed3so98889266b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761749388; x=1762354188; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1+/I2yfPoWDJTBN37DUOvTovSE+HP8yoku6LrNjmVH0=;
        b=etukufPkiyGaGp0ge9njDHBEFsU1gCHs+c7CazFp5pli9pnlYfMqye5EGs7Brk5hwX
         KY0QbcGpLdmcvAg2G8xBAMMjHXdDCXOJB0Y/Qw7sffn9c/1vz+obbXOYnDL8fhE9UBS9
         oyjie0x0kO/qHKMSbwLzy9ond7VjeuCVaTBCyHL9LeNOuNonUsaI8E4A7Phep2587GcI
         aJi2LTK2ztd2nVcZM8uzqeFhr+s7Y/8iBVgxo4/r+baHF3Aql/GTEBCnPgtfrqW3OEj9
         Fi9bAGZAPB1TjWhNY1javjVVi/erjUWJu/cQMJJl5X1ixxxSu78RHYi545/eQH4ocTB/
         rlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749388; x=1762354188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+/I2yfPoWDJTBN37DUOvTovSE+HP8yoku6LrNjmVH0=;
        b=Axx04yIrsZg1+GiBYJ8DUMRW2iP9OaRbsXGg1H7T7ZSInuVrq1efWAMu2cmtyb+E2x
         UK4NhY/0Hp6n0PspngG92Tx7x/Wn89777C7BPXl04jYqrpX6aLqBYhh/SVlKjWz8NKQ6
         JO65jqGifK9NY685ERs4jjw0GiUUcApO3bng3431744+frDRvtlToJsqMn3HX5KmhrK+
         1CaaFL+MaxprOp4dYhDams0GlrI165RJSRSpvtUQONx+rwdHIqAWKn+Nie4H8zSWLMo4
         tdoE8RPuWqGrJZOOpj1hnNGUyJxlbKm8MfVPoeKqbPDfZtP2UoUV2BFmT6nRTHkWrylz
         M4Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVfWgZ6gbKd/5W3dkGVYfzs7zsDnfhHuDYtDmzJTS62gi7DifzFyJN1pXWVQqO6jrJWXl0wnbR+Z1FlUFOUvvDb@lists.infradead.org
X-Gm-Message-State: AOJu0YyXt4XKxqeVHb3iM0zXom/p0pmY+G7aV6oWzqAyNngfixNzhfG+
	N74jFXt1S7QA6jFvQnl2HvOECT0ojxydaaoWdaIoyPAWcc4mBs4lwlnX
X-Gm-Gg: ASbGncsphfDhqRPQZ1Dh98xhajZai7dYX7LuxIzS6eeeVZQGzwrNWr4rlOSmMnDA31X
	2mc3ZOcztMbCOsnlhan2WTjl9MKG9+R8El8HcN3RsvwBgtCxpEEu4X2IbBDZR11Y5NnJO7D6hzI
	ZciA4JnJHhvlrAFg7SJfsp2tHE6jT5woYz0H3/GecJU8gkuC+66hTG8X/q2AcsvWlOdUltEBjEZ
	pV/728vtCV6Lym0yL66i/cu/FdhgxQMYi80L0fSZNv0O/BQFLuvPFXDhX6UeTF4bGKFxqlvWScN
	iLw5UmSr+sQVmfrfYhhnepO/HSf9uRhitoCm2kVJssYqawTSI2vRM9gr6K2StzofHKW/CowLjyN
	zhH9H5TtAzewdp34EwqJjSpgG2WWNTgeTtpJklsNLJvaBQGrzG50Nr6nJG8/03leyfQOGBjxn6+
	WbkIEwcbr16tno/BEquRGtJDMgoa/MDwKQ
X-Google-Smtp-Source: AGHT+IH7Dg5hdlveNGeW6IpzIDCcpEZ/tZk4UbIRTBBgmJ7JsmueX6/YbGVE72Hk++yrO2YhhzUdTg==
X-Received: by 2002:a17:907:7f0f:b0:b6d:95b3:7f11 with SMTP id a640c23a62f3a-b703d555a7amr325167466b.58.1761749387588;
        Wed, 29 Oct 2025 07:49:47 -0700 (PDT)
Received: from [10.25.210.164] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d854395absm1463176966b.62.2025.10.29.07.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:49:47 -0700 (PDT)
Message-ID: <b939e7f7-6be6-4f07-97f2-a3146682fbe7@gmail.com>
Date: Wed, 29 Oct 2025 07:49:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: imx8mp: add aipstz-related definitions
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
 <20250821105634.1893-4-laurentiumihalcea111@gmail.com>
 <cc465cae-a1b2-4116-82fa-ae42ad0706d3@kernel.org>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <cc465cae-a1b2-4116-82fa-ae42ad0706d3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_074950_469039_7E36EE19 
X-CRM114-Status: GOOD (  10.55  )
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


On 8/24/2025 4:29 AM, Krzysztof Kozlowski wrote:
> On 21/08/2025 12:56, Laurentiu Mihalcea wrote:
>> +#endif /* __IMX8MP_AIPSTZ_H */
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> index b62bb821cf61..afcd8c785cfd 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> @@ -13,6 +13,7 @@
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/thermal/thermal.h>
>>  
>> +#include "imx8mp-aipstz.h"
> Completely unused define. Your patchset is not organized in logical chunks.


ACK, will squash this into patch 4.


>
>>  #include "imx8mp-pinfunc.h"
>>  
>>  / {
>
> Best regards,
> Krzysztof

