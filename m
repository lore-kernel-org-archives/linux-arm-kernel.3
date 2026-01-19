Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB91CCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxI6gJrq2FL8Px7oECSMbsgNnQ9Jnllpf1H+z4cLrRY=; b=QOJhxTq9G++TScPZAx76To7Dyd
	7ww1W4JY8GqlfIWN9WLkorq5/sIrF7+NfBwb6940HZnH5t5TrwTz23Dpiv9bD1iu3Bs9VjX5lh5f0
	TIm/kclnalb52jCmZDMowlvwWSib1607kiq7WpBjNwGjTuVEnwBr8EtjwqtjtiGPoJZoze3gOfcOh
	P/qxGgHKCzaiLu2WbRXNPIfGjz1YTasln+p1XsBL0830qHfl1EgP17Lh9LNeait9pz8gr6AT5Q6YI
	eyrS8x6nZO9IMXxwrRF9De2HPxsj90d4QK7P32ZoKZG6Hu1MQMK++adNsXrVaLBKlg/JYPhae25lA
	3tc683qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmjo-00000001nvm-2kd9;
	Mon, 19 Jan 2026 10:44:02 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmjj-00000001nqn-1zD7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:43:58 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b87124c6295so570143066b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768819433; x=1769424233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rxI6gJrq2FL8Px7oECSMbsgNnQ9Jnllpf1H+z4cLrRY=;
        b=PkmWMA9FAvcm1WnuDZqLQ4bF0bmN8qa3BipHE+tAIZAxLUYLkumD/0WKXZkjKrjE+W
         e2PWFcuE1EG4nHV35TEMbwaP4kGek3DuBckR9y9cYnQvrEku47u+5qR5mQy9FEWDP266
         vyvG6LbnmSSxap9cYAkWhgnYB1tu/VaNwfu4zsSE0/kLRj/t/B4gu4Ie6cu/4h50oewG
         amVgIUai2Yk9yCMBnQm71yvn2QerG3Gu8dnjbZYBZGd9KjPa45Tff4RB1tY7ASm77zZ3
         0vIRpqp2PmkGljJyuFK5fmqqBVUxQtDCpmXp7ob7/mzAak/oDvv1uBgHEGV84ZU7AneH
         xAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819433; x=1769424233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxI6gJrq2FL8Px7oECSMbsgNnQ9Jnllpf1H+z4cLrRY=;
        b=rX2xwQJpNWZnRr5ruB+pAGP3mDpThwguslS+BKr8QQqm9Js0SbM71PUGWFFZyzAuPy
         RG4qa9x2Ym5BR/qYEKIli9u5zKlg6E3CrXvSAuKieV3CkyV0LcJeEp9pYD99uyYdi7I5
         4VMMtz//Ga3irGe37GcGsPi0Bvf/nitIED4pL/udrwYPlHFfDfPq6F1aflQH5ywgcQDV
         rasmAA+pEJ7XPv04qCzPcJEJjK1q5ECpxH2hEeWaLaZrOUVBs+j8NbPkhWoAB0UAc6zR
         rIpm95lORXUuhuRDwJzXn8OVyspMq23anMMQLWe4gcrq2Zh/C+kEViYO38x1ASMf9Yzr
         Ijyg==
X-Forwarded-Encrypted: i=1; AJvYcCUX/i/a/RuvvxmZaBSj6LfnwcEat7cujTg32dSWRRGsIlg5aCKBiXMPpzzf/kvMvDlMu3L+QNOcnElRxWWV68XF@lists.infradead.org
X-Gm-Message-State: AOJu0YwwcTHbRohqgq6jQT0yJ0vMefigEwBfSCJASXBhCZvZ69iuSnTC
	cq9+aa1rt27NAJhlwskOzYqcx4U00WLW0Fp88PaVFUk9j35J2yoahgk/
X-Gm-Gg: AY/fxX6owXJ+qA0zm68TeklTavjYSyvZhGPimsulqHdMl9jAcc4MVp91KxxOxmTfNmf
	fIQEvUDnP9el8w0nZOLvg9+O0/hy0qoRS7DVZhE5h0HhLuK8VaWfrji1rD5bmWAv/rcuGPiR/RO
	REB4R82CilPxh0HX4rulpQZNc2BTy/09C8OE3pA+uiGh8ZCLCzMfu/lbpZbDvAl8p83evkzIHyr
	nzhxmvOSRm8eYmCSJw6r24CshUxfBgoDxoiZZ3ZHDWjOqCP0vTcnLta5Xyb+xKE1rhvv/DKC9AG
	lXc+nzWv676316PvoZVrx+yj+CatHuyUYdaIXfw2+JSBQzsg/uqxqBxlyg4u07NppFZHceIVDHV
	GpLDnvwZQI7Ql62im4wA9uvvUHSkT1zVz/WeAvUHeev3x1wmPQSgAIWEmiVN8kDgiUVmIJ8TdlO
	ipvM6x3h5xaM5bmNMfxHaAptnDVd3iQwHysPqDjfwRwz5bj/UUMNtLaeZilo1Nj0z7ozglmPX1P
	iLD2VCNc3TZVHXr7qYpxGj+sF4p8N8xVRQBVJFHoVZw+lsohg==
X-Received: by 2002:a17:907:930b:b0:b7d:3728:7d11 with SMTP id a640c23a62f3a-b879327f46fmr849354566b.50.1768819432497;
        Mon, 19 Jan 2026 02:43:52 -0800 (PST)
Received: from ?IPV6:2a01:5a8:51e:a2d5:41ab:52ed:e3e9:4896? ([2a01:5a8:51e:a2d5:41ab:52ed:e3e9:4896])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879528dcc7sm1076503966b.29.2026.01.19.02.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:43:52 -0800 (PST)
Message-ID: <ce6d0f29-6ce0-4c31-af9a-522335b0979b@gmail.com>
Date: Mon, 19 Jan 2026 12:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: add exynos8890 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
 <20251017161334.1295955-2-ivo.ivanov.ivanov1@gmail.com>
 <20251022-affable-arrogant-coucal-3f7fbc@kuoka>
Content-Language: en-US
From: Ivaylo Ivanov Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20251022-affable-arrogant-coucal-3f7fbc@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_024355_585222_71F53824 
X-CRM114-Status: GOOD (  21.42  )
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

On 22.10.25 10:44, Krzysztof Kozlowski wrote:
> On Fri, Oct 17, 2025 at 07:13:29PM +0300, Ivaylo Ivanov wrote:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8890-cmu-aud
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: External reference clock (76.8 MHz)
>> +            - description: CMU_AUD PLL clock (from CMU_TOP)
>> +
>> +        clock-names:
>> +          items:
>> +            - const: oscclk
>> +            - const: pll
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8890-cmu-bus0
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: External reference clock (76.8 MHz)
>> +            - description: CMU_BUS0 ACLK 528MHz clock (from CMU_TOP)
>> +            - description: CMU_BUS0 ACLK 200MHz clock (from CMU_TOP)
>> +            - description: CMU_BUS0 PCLK 132MHz clock (from CMU_TOP)
>> +
>> +        clock-names:
>> +          items:
>> +            - const: oscclk
>> +            - const: "528"
>> +            - const: "200"
>> +            - const: "132"
> 
> We do not want the frequency here, for sure not frequency alone. There
> is no such code/syntax. Really.  Please do not invent your own style.
> That's just pclk. You describe here the logical name of this clock
> input.
> 
> ACLK is AXI bus clock, so if this block receives only one ACLK, then
> this is just "axi" or "bus". Recently we were calling this "bus".
> 
> Same in other places. If two AXI bus clocks come in, they could be named
> bus0 and bus1, or in this case - because these are sources for
> generating further ACLKs - bus_528 and bus_200, to indicate that one
> will be for AXI bus clocked 528 MHz and other for 200 MHz.
> 
> Please wait for some other opinions, because same rule I would like to
> apply to ExynosAuto, Artpec and Google GS.
> 
> @Raghav Sharma, @Alim Akhtar, @Sam Protsenko, @Peter Griffin, @André
> Draszik  - share your thoughs please?
> 
> And to clarify in simple terms for others or for the future:
> 1. HCLK would be the AHB bus, so also bus. Both ACLK and HCLK are for
> memory accesses.
> 2. PCLK is APB bus, for registers.
> 3. SCLK is for main operation of the block (called special clock, but no
> clue what is so special about it).
> 

So the consensus is to do something like this..

- const: oscclk
    - const: bus_528
    - const: bus_200
    - const: pclk

.., right?

Mentioned people haven't replied. I'm asking because I think it'd be more
straightforward to go with just aclk_528 pclk_132 sclk_... or axi_528 apb_132.

What do you think?

Best regards,
Ivaylo

>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8890-cmu-bus1
>> +

...

> Best regards,
> Krzysztof
> 


