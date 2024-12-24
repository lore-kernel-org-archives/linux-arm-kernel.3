Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC6EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 09:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLmFWbWd3SQkC6J4LYdTAks5WNvEgPSVXIlgEkT9qUk=; b=DvFqW0k34qH3L0bSqYbAhRulBG
	umYh+hLdJ5Tkqm3ghJmkGSzZcq6gpwYO2brRG9Mqe8aj6tvs+qWw5V+Kiv3IJt7UZF4aHDOrA1BSU
	vfLcKFp1kpAtunlkAKKJUvg0kxsUOTKZA8KhTy4zuvTH/tfu2UPZ9JJ9Tcu49h+Rd4ii8W6vcZRAA
	gSG1h/oCPJTnh/DdvxCXgozuVsUqk2Taqi0eDshVUGunsh0B43ltMQMeBC/Zn+mCqOsDoCQgYSuA6
	xD4d2bkTjS9Q5nl0zJ1eVf3GLEYHoLtFn7MTxzVUfR4BnJ56K+fwyZ3Blc+tq6k9yrr0iu1IUa/rk
	DsgN2MMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1On-0000000BcP9-2H5r;
	Tue, 24 Dec 2024 09:40:21 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1MA-0000000Bbys-2pQC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 09:37:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21649a7bcdcso50531465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 01:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735033057; x=1735637857; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLmFWbWd3SQkC6J4LYdTAks5WNvEgPSVXIlgEkT9qUk=;
        b=kvYccyJMdsVsQrmoe/8AygRdmxT/BVTMOIFXexLtsJo28ThDXHLI4cg7pluuG1vdZ+
         fLkUmY7FJPSV0/Lv9SvptFrbhGLX7dadyDB+Ovvr8h4qYYC5aowxDV/FPhQ9fqE9sDlV
         OO9Z7idGw1MeF8FGFzLs53QgtPf6vFBCFmrXwdr2/EXc6RQTlefPLMcWyus2BmatrzBV
         StSeNZHvH5i6DKe4VsWKxFkouQgWv+gaVutT+SmLr6Pd8RP1/K8HhDGXYPNhahftiA9X
         B8y7DOyV1aq4FhBhcFIwSTsvMGHvzmFbSF3ZktNX0Rj9OetQUckKPw3A65qLqx0xFIt2
         YaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735033057; x=1735637857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jLmFWbWd3SQkC6J4LYdTAks5WNvEgPSVXIlgEkT9qUk=;
        b=r6BRqXKL9RhQo30DoFGBRvZvgcscRWWTBOpLuQoF4ZUtEIocgjVaC1f0uSeWawdhmz
         hOgJOiIa1fGfJODq3LncMKI+Xaa5524csud0QKKEokDhecPh6wg8ldBo4GXLJntLvDhq
         grhBGKUzylwKbt5gt3xiJUX58q34JwMxU5w6hy9E2+Mqr1FTat9/eYUFSwbYCed0YBxo
         evWzbSTcllLlVgGmn15KJeM6LFP00yP+8q+6eT1JgsMNmgCQ7dqvJdDjf9e+S+mE1uIw
         ky97wZp7d10HDHS/GjbBOMmchxIs/v7ifFEch5dmwf3I/XSwPfrAz8jTQ2roZWy8RjUI
         xePQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9JW8cUx0rJ7D6FDruuNWvtxofSGWSQH8Jzsld1my7/QjXvWkn+tkzy3X9RZDUyeG0OarbalNP8br+J7gdqstc@lists.infradead.org
X-Gm-Message-State: AOJu0YxyN2cbqKDfHJH02eeka+yiGK0A7K/cX6y0mk9BwihMZpCRdAXl
	BlHEMc3TWEN8389ZzOM6udvaF9Etdikgw2woPsqpH5SF2Ld6aybp
X-Gm-Gg: ASbGnctFUbnuaDP1yMOCtCA1wuOcw7alFld4vriuBQGBiopltFLRCTInITQw7B1u4oy
	zlIhbE2NPzaKwN1Ec7l3Kbh08B/kz6V23N8PLFKbHakw0H/fWi4T1ZRKXwCPleblOr3dZ4ZAVjG
	B3cLDvK1quByRvBr0Y2LyQFooiTXxKb1XI6Tc14BW5X48GIb3MwVAaRMpeMfrl15IIKsr7wkfFk
	ito/IP5fJmwK+WWY1tooqzMXjToEZBSzuImkgG+WnZn0FG1i+yDHafFkMTAp+dkOlDAAkIU1LBb
	fTbc5sTmc3xi7n3y5XiUmcHywOgonv0qRDQ=
X-Google-Smtp-Source: AGHT+IHeB/WWKd6mmgZbT26UjUM4RGWZKImwzEuCo8jzyGFGDy66eiSE5XasK5+ZN6cxtxmkvDMOCA==
X-Received: by 2002:a05:6a00:8085:b0:725:ae5f:7f06 with SMTP id d2e1a72fcca58-72abe096383mr24761611b3a.23.1735033057380;
        Tue, 24 Dec 2024 01:37:37 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c1bcsm9590252b3a.187.2024.12.24.01.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2024 01:37:36 -0800 (PST)
Message-ID: <5ae923d7-3b4f-430c-bb43-edee7f549e56@gmail.com>
Date: Tue, 24 Dec 2024 17:37:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
References: <20241218114442.137884-1-a0987203069@gmail.com>
 <20241218114442.137884-4-a0987203069@gmail.com>
 <7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com>
 <216e7c97-e0b1-4833-b344-a71834020b15@gmail.com>
 <c800e544-82af-43d3-b07a-e7b1a4028330@intel.com>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <c800e544-82af-43d3-b07a-e7b1a4028330@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_013738_713750_5F0D671B 
X-CRM114-Status: GOOD (  13.40  )
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


Przemek Kitszel 於 12/20/2024 6:59 PM 寫道:
> On 12/20/24 08:07, Joey Lu wrote:
>> Dear Przemek,
>>
>> Thank you for your reply.
>
> sure :)
> please also configure your email to write replies as plain-text, instead
> of HTML
Thank you for the reminder🙂
>
> I also forgot to say, that you should have target this series for the
> net-next (--subject-prefix for git-send-email)
>
May I confirm if you are referring to netdev/net-next?
>
> Please also note that your v2 should wait to be send in the new year,
> as we will begin the Winter Break for netdev ML in a moment.
>
Got it! Happy holidays! 🎉
>
>>>> +/* 2000ps is mapped to 0 ~ 0xF */
>>>> +#define PATH_DELAY_DEC      134
>>>
>>> would be great to previx your macros by NVT_
>> Got it.
>>>
>>> why 134 and not 125?
>>
>> The interval is confirmed to be 134. The mapping is as follows:
>>
>> |0000| = 0.00 ns
>> |0001| = 0.13 ns
>> |0010| = 0.27 ns
>> ...
>> |1111| = 2.00 ns
>
> thanks, that's correct, sorry for confusion
>
>

