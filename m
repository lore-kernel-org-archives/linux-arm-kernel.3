Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CDAC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuVc/9e1Yj/sPI8+yIxKHV0o19gCf//rneJUR1cMCGw=; b=cWshAnvle83n6O
	3aVtY64ySfr6Huw2HFGh+kCd0IRoOZND2GIxS7J9bCYKzyMMBPj2si+IOumY+FTmowdkHjSTAdDDj
	iPFr9wyS1CMilU39/BybvNqkOY5ojkt2HvxkiLSwrEI7mwNTGaFQDKaKY4s1QiUOujncwkH5Vnzi4
	8tu+Ugd40usqHo7OGBDjeg72kyR+UW1LGOtXdSXdYnt5MviBRVCCcWqbe12Pig4yD1pJwJNlpdRpF
	KsE4nxuLeUbNfO4kYRUKid6pkzAsgt7LBV9VjzMWxH7gahb85U3b3XACZFNYrQh2Ej9vK22wlj1av
	CBGouJTdnw79+iSBUsBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxLL-00000003utz-05ba;
	Mon, 17 Feb 2025 09:23:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjx9J-00000003she-0Ee8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Feb 2025 09:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZuVc/9e1Yj/sPI8+yIxKHV0o19gCf//rneJUR1cMCGw=; b=TGA0UqMH9kGMvrtPk+DhcaM0cC
	AsYcK580LXs0cQL3HJMk48zerXPw0j4njGyo+rN7TG74MAUG8QXO8XZCMt98qQlbyjZ5HzzMeUK0Q
	DvYSF3hHmsyzXT0/Y20I5mSxBx0eWsmvoo6IsgXIzJseMj+j4op8rDeURI9csgYaq4vl4SBzgxpej
	NCBcenTD5KBLQV9sgop1SND20uQCE+NCtfGyYP357Y9p/9PnoY7baJVfKFfzlh0AWU6Q7dhMr9Lfw
	of6PfrsEj6Uo6lyyk/P1bzzJ7OboRb3CgA/ETL7OWX/CZBqLXd/zKB67P7/NvXjxyUkPW1/pRPsmG
	KSkVrpWg==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjx9G-00000001kAr-0Q0s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:10:43 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so7948595a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 01:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739783439; x=1740388239; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZuVc/9e1Yj/sPI8+yIxKHV0o19gCf//rneJUR1cMCGw=;
        b=Wrmx2qhO6WCtHU/lGxDFE9wJDGZdSnAGQvGPwjPBBb1qXS5pgkYOoRZ742LT1CMiS6
         wBdSIKN2BzdzUkwT0sM6kWZM+NLituNhQgaAfzUm4T6mbkcgw3xM6ogxGZ1KAZqx1Z0J
         68VPj8skzOZWL/b+7NqvHprvBGOCtDoZYje22NT5SBZQ0PGQK4Ah0W56H2+eXoVv+wLi
         Zk3BWOVJVsoJr7CxpOiATT5ImLmyPpilznSH/pstt+f7gSlZBhVyi1OdIqlG6fwMxGQ+
         dFVAXM2VR10g/6bkK2R6OSur0F8nxtuBYhBRzgFcO38nwjDTwUcuSM7p09PvAQiKgDBM
         ytkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783439; x=1740388239;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuVc/9e1Yj/sPI8+yIxKHV0o19gCf//rneJUR1cMCGw=;
        b=VCrZBQOjA6z0aS9zDdNHuwrAsQrELxEiUlqxMvZSiSUkOvZTQlsEZXQlNLDqBKJBce
         zLgMoi6/FjfQxccaZ/whipnedocEzthtjU0UO2gMt7Dr7u/QXOZaWnSkM6bYV1KRKUqm
         LVQYlADftyxH32dQjwtd6zywvDR+VND+CquM3GrOBnQ5mcdDtXc5FvQiBPelUdXvGaLX
         CGqkrAy5G7kI/54vkFvHx50/UQYS9sy570OLzrw3Xe/SAOEvw8H/zWkT041wFOcQDFk3
         933Y64039QtmHiiEQvn3JLGv8XRPc/4ZJGhO5jshOW7OTeA5ZpJmr4+vPpn0Yb9OFkMl
         AHYA==
X-Forwarded-Encrypted: i=1; AJvYcCVu6y5SjgsWFHD49UZxoSZmHI5vr5nK//Qza42nZXKBpwyW7DEBzONxOIByR1a+FeyQtAMypTQY70wPbGNemvuL@lists.infradead.org
X-Gm-Message-State: AOJu0YyKXWBuBvE3Q7dHy8labWTIw6p3eCWvouurdsM+E2yQYuq93e6e
	GqEFv+KyKDaA1bkUwWoh9jKyuuy3Mjvso+qCh1g5P3ty4adF5RqgEth1DaWxDvI=
X-Gm-Gg: ASbGncsAFhQxVd11DeKBESUz1JRxRx96VPkTcji8dZqEzgBPOgMD4YULDJjGGGV/BB3
	dUjvHDeIIJct1L+3VxXIerSad1U0WwpUWSUFC6iojl9/etSnOoXVj9fZNSrxCF3eYQsBEKpguAe
	yQxDDooqVtgF3vCv7vcxzqhWKQNDsBldJnrypQb9WA65ggf5gbUi54j7my2vTc2z820Lz6zvsph
	Qsm0R26aindpyfRekArfH3rgEC2mfJEMHaqcdgxhpn4x5sy2lPt7vviDyEe+7XV6t6n5dq7ELOB
	k9/1hjALLxfOQPyAoNqBuDM=
X-Google-Smtp-Source: AGHT+IH9wIn/oFp0HQ5Ml9Fr0/i0O7BRhz9FvkPajM9aPkSSBQ0mED5a3gvKqPWrNLKiBiFNMqW84Q==
X-Received: by 2002:a05:6402:4609:b0:5dc:1f35:552 with SMTP id 4fb4d7f45d1cf-5e0360441d1mr7250545a12.1.1739783439236;
        Mon, 17 Feb 2025 01:10:39 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4ed9sm6835151a12.10.2025.02.17.01.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:10:38 -0800 (PST)
Message-ID: <e01ed1d6-32e5-4e0d-a4f3-01acde843b5a@tuxon.dev>
Date: Mon, 17 Feb 2025 11:10:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/16] ARM: dts: microchip: sam9x60: Add OTPC node
To: Alexander Dahl <ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250211065304.5019-1-ada@thorsis.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250211065304.5019-1-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_091042_365670_6485843E 
X-CRM114-Status: GOOD (  15.41  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ryan Wanner <ryan.wanner@microchip.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 11.02.2025 08:53, Alexander Dahl wrote:
> The One-Time Programmable (OTP) Memory Controller (OTPC) is the secure
> interface between the system and the OTP memory.  It also features the
> Unique Product ID (UID) registers containing a unique serial number.
> 
> See datasheet (DS60001579G) sections "7. Memories" and "23. OTP Memory
> Controller (OTPC)" for reference.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>     v2:
>     - squashed with patch adding the clock properties
> 
>  arch/arm/boot/dts/microchip/sam9x60.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> index 1724b79967a17..af859f0b83a0f 100644
> --- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> @@ -15,6 +15,7 @@
>  #include <dt-bindings/clock/microchip,sam9x60-pmc.h>
>  #include <dt-bindings/mfd/at91-usart.h>
>  #include <dt-bindings/mfd/atmel-flexcom.h>
> +#include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>

This is not needed, atm.

>  
>  / {
>  	#address-cells = <1>;
> @@ -157,6 +158,15 @@ sdmmc1: sdio-host@90000000 {
>  			status = "disabled";
>  		};
>  
> +		otpc: efuse@eff00000 {
> +			compatible = "microchip,sam9x60-otpc", "syscon";
> +			reg = <0xeff00000 0xec>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 46>;
> +			clock-names = "main_rc_osc", "otpc_clk";
> +		};
> +
>  		apb {
>  			compatible = "simple-bus";
>  			#address-cells = <1>;


