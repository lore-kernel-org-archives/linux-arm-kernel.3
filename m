Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E386BCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 09:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iO0low9A/rUTb/P7NWY7lSGziDCGb/49/rJIYgf1Ts=; b=iGVCeHpC+8SfFIZ42r4XaEJdEQ
	gjlKxXy58GsjMr2Fm/tOqXA6suuG/vGynrkr3uqKZKTo7GAX5RL4js7rtNPHP9lCtBNzVkbcx1+0f
	2ZA7h0Q7ykBN3aOqVYRdsGw6/cBDtouqKzncJLvzosxqo9qY1iqd/OgADCmv38Q8OspRfc9UtasV9
	EbRSFzKbJpL+hWp1St1nj9LzZMHdut8mzM8meij8iyyc6m2th8pp/GDmvxHYKcHOtMq5sKMgMfKpx
	kNLqcaewGGd7saxfgyWi/fvFnfdDdKOCwn2sy1HsYc6z8oOtgtDk8b1c8ogNcFBcDXgR1ttroanyx
	Z6i+73dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usHga-00000007epT-2tdZ;
	Sat, 30 Aug 2025 09:15:48 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usHds-00000007efi-3aD5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 09:13:02 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45b7eb55a02so830035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 02:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756545179; x=1757149979; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1iO0low9A/rUTb/P7NWY7lSGziDCGb/49/rJIYgf1Ts=;
        b=PV2GRpCrIZYV2zcLwhoISptLH+Tvs8gW21MQlmyrvKfM37G9MU2iHz5sq0i2CHNfx3
         fU8/ML/Ljetaob7XTmGfEmCTvYKeuAuLuOaSRWldUcDNOzDzNJQ7128tkI1Ha1eNyBuC
         QKk8qwhrs6cEg6QIvGw4l2mGarmQKijsl/zK647Yzc7FMMK51OZeL9TXPD8hLOZL396f
         XBzCuBb6bfVe33NT/fXIjPBmZ5oumHG5LA/h+gN8ZUY6RgStHp3iiWJONgG1WDsOKOso
         C72jS52C0RUXT8q2VO2H0oCklrVh5ZzSsvLRwUukAvb6DQ7wj4uwhtD5ah9qXxtU3PeQ
         R8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756545179; x=1757149979;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1iO0low9A/rUTb/P7NWY7lSGziDCGb/49/rJIYgf1Ts=;
        b=m+WMDjte7Xr1wTZXX8Gf6U7zsni2gW66u3Bs9DGOaxw0nTzWGwwqwblSvbGc7thA7k
         FgIbzKo+RpkMgPGYNOVfnxHpi96W+v+q4IzAC849QuFo9VmAlGgoQolu4EVFoVYA6CKu
         1siX3jlDONMTPpQI3CuVYqcDdvJ7wEeA9/3EffynBp5m13CAOrL6skrD/t9O2YTjz8fn
         Uz29vsrStIU08nCQf2MQX582Y3rOAPSLuupJD8cwpP1PXij5LqZa1jEnCkXhXZS/IFxt
         OL/5pEZu5JvIGzIwvFrhQ5u2jFebgXS9usE9Ii1q+b8sKkosVgpwi7hk4YHImvxmjIxv
         jmSA==
X-Forwarded-Encrypted: i=1; AJvYcCU/f4N/dBY2oz8ntiOWGKct1d9UeFNG+DupFCpQI7lXvHkoQtaNiAbR5hAwc2fcemGVSBVSa9Et9SIxCdTgpPFx@lists.infradead.org
X-Gm-Message-State: AOJu0YwBl/1rM/TDE74jJ8MksVR2v7WxNU2AS4J0RnJcpHesWXE6M3C8
	GAAds3yoY9WHAyoPwzh+r2HKOw7XFBVAKGIxSOSJWtPWSVGFtCL2j9apgfUdD+xCNFc=
X-Gm-Gg: ASbGncsrSOqnIrqFnC3PMEpgdPFeKZObZ1t1sr94wachfNWruUJ1SfC9dugHXMkP7st
	yvDR/wsruyZUsNVVy6s4qZK9qy038tfpewIApoqUSpQYvMNmMueYm55pI3fdHgcVgurDv/fbeBQ
	n0YSWcZv7fsVvn4IopN4vnOOrMX8mv6W9QSyetrj16zigf3QxE76Sc8ZzwVQRnAQonDZy2J+rIh
	t0Dl27X2nudvpPERiaVt/2EEynIppKvyHTGvLgE/vIUhBNFeI0/2SaAQx2TdIQ4Gr37YhjnrLwp
	9c7dX/kG9JznVVJIlMR9zs6/9pdla3T/uzksOGKCSbce33Cm0IkQodqxYHIPvT7NlMUxZWh+jzg
	0QzS6dQP66nSBhaj+4XGB1ufoTdau7kLjk1ApIpn3dRY=
X-Google-Smtp-Source: AGHT+IEpRzOCkC3TylDEJ7aPKDl7V/G2dwA78G2p+DY1DyKCm+s8MomBjoJ4FbBihtm4uUxbL1qZag==
X-Received: by 2002:a05:600c:190c:b0:459:4441:1c13 with SMTP id 5b1f17b1804b1-45b802e8458mr23471415e9.6.1756545178601;
        Sat, 30 Aug 2025 02:12:58 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e887fdcsm71516745e9.13.2025.08.30.02.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 02:12:57 -0700 (PDT)
Message-ID: <82e1cebd-2101-4d9c-9de2-c3b54fc3a3fa@linaro.org>
Date: Sat, 30 Aug 2025 11:12:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: axiado: Add missing UART aliases
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "soc@lists.linux.dev" <soc@lists.linux.dev>, "soc@kernel.org"
 <soc@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250828-axiado-ax3000-missing-serial-alias-v3-1-393111f4bd9e@axiado.com>
 <4e51bbdc-744b-4a23-a695-a6c49d82e779@linaro.org>
 <cb78b679-e349-43dc-a6ed-5b63b10d0d7f@axiado.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <cb78b679-e349-43dc-a6ed-5b63b10d0d7f@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_021300_918585_75D6A61E 
X-CRM114-Status: GOOD (  16.99  )
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

On 29/08/2025 20:17, Harshit Shah wrote:
> On 8/28/2025 10:58 PM, Krzysztof Kozlowski wrote:
>> Please don't do this. It just generates unnecessary traffic. See my
>> instructions you receive on your first submissions.... unless you want
>> to send patches to soc@ (which looks added here) but then this is also
> 
> Hi Krzysztof,
> 
> Yes, the reason I have resent this patch with adding (soc@) as this is 
> the fix from the previous series.
> 
> Fixes: 1f7055779001 ("arm64: dts: axiado: Add initial support for AX3000 SoC and eval board")
> 
> I missed to add those aliases and it is giving probe failures without 
> these changes. So I was hoping if this could be merged as the fix
> 
> in the upcoming -rcX before the next merge window.
The goal is correct, but you need to follow standard soc-subsystem
maintainer process. You need to have your tree in the next, then collect
the patches and fixes to respective branches, and then send multiple of
them in pull request or as patches ONLY to soc@.

My Beginners maintainer talk from LPC 23 might help you.

Best regards,
Krzysztof

