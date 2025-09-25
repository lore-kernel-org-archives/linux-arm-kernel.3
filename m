Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84405CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04OhqlU+WA0ABhYmTZEnpjaIkFVoum1CHDRj/OYy7KA=; b=m73XoA562mv0OlUH+tXTV/t4tz
	IjFQW2nYh0GFGYP/6JAhkyFPKZ49zk+aaue6CaY3inIHlxAZbHv8hN/1SdnhWRhKNGB8g6DXIiCYy
	WNQE2HTaz+Vk/SCUD/E6BVQqKwhF0oTZXAmnX09BTBWyrrr6XVsKKTvnup/YMCI5e5lnpLeRMlNGd
	eDMDkZtzb7EIZ5KgLtyIcUPC2V+qZcALJzntHI1g/Heb4wILuSgeXBlLDGA7lDZQdAnMXZ6YXWuZj
	9An9w9MYReYxrlbSz0QNWjC3dZ4D2y9jkhBuf10AFu7meP5oiMD6LOOOu3XADZh1YPgxX0gXCA64D
	3KgHOGFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1h0p-00000006zKp-41qN;
	Thu, 25 Sep 2025 08:07:35 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1h0m-00000006zJL-2xXd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 08:07:33 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so652463f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 01:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758787651; x=1759392451; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=04OhqlU+WA0ABhYmTZEnpjaIkFVoum1CHDRj/OYy7KA=;
        b=v8/WktVda2VBkBHjfzHQnXIyjRwoQARe7CVjmssU9xCabWs4wRWKyLcV10pdmUnxtQ
         wNCpZzYRT6SEGBxa30huwszmU5hsV0C7sCIdVTKZ3+sDcGUZykLE9PU7eXf843/eKhC2
         fL/9Iu72rFsQfhh9lOjyO6RDtcPICPO4O9ahkewy+QV7hm6gyHSAORf3aDzuWrxsHS1V
         7GOYguh3nab9Wwxcv7slcpJu3hhDJcyrXhLtl2iXX2eqGXfeyJrPyZRuyqukQTWVFhmV
         qSpzBS9PnYxz3IS7P93j/aZrC44mb50TBXJTV7//ek7jXBfcvQ9dGC1yiNAB6XY37Jhr
         PAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758787651; x=1759392451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=04OhqlU+WA0ABhYmTZEnpjaIkFVoum1CHDRj/OYy7KA=;
        b=vYl4jrUO9pgjnbF8q1K7wRwsbrd5A9TrJBpAWMEX6xltq2egbxNRQFMIdZ1U0FbI++
         uvyuMSXdJjMHX48irm4rDXLCi9dgMahRf6AmW73o0CNlg0Q+q81zc1f0+eQmNpCeORE+
         JUS+5M18VUpoaB7tuQlVdCe9kEUMJ51SG71aB06p2JxOyM7Tg7U02XnB4jeMAqoLRTg2
         sCyUzEAPHgKB/Fp5dhHfm1ivZvdLLJ/4jh32Yl5QUf16CCJcKfoB5regHFAyRwfvZiG9
         WRcqC+hIxwqMRldVgSrjrv/HjD2zCQJupMfzzHqhaRz3E1IN3wOjZlInyzLzzoHzvSFv
         zKPg==
X-Forwarded-Encrypted: i=1; AJvYcCWd3+dRvD3Ywae9f7rrX71G55do06KStgm99w6I2pQQcCDvjOa1My3P09wOEstE5diApFv8jxXq/4DRFCEV/d5o@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg8FV4RztqJUxjLqwfgObnON87LWaHKhU9KGXIEim110IyRdnJ
	GZF/Ug3ffhzFer2btkl//mmtxPB+uv09bjhp0Fpeq96M1CmTIu7uwEfNpdhb2dVNgdo=
X-Gm-Gg: ASbGnctWMfjy0SafudzlHggCA0hTrr6l8C5CJnoJhMyfcvBvL1xj/H32QUpNl6+IS2/
	cwLvFnv2RYjxjqVIZH2oN9oQvDt4BNldnqwIfG1JklDxuxuYfQZtYgQu7gLgQRdZEnp4Lb/D5lm
	vnM/WVUl0mcPZ5KApf2ccbkK/PGJv0EjIS4aHM2KA7uey4GJEMG3mVN52ceoa1mn7cCt1k8Fj3w
	cPC9kQKEkaptNCAzu6yB0JKL5Uzr5QzkovjAyWiLc77dZxE8XoUTMnx0zpK6FNzJAN5ADXe1mhu
	x+pTZ0FhjsiVQHJfrHOoEnxATh0Q48VKLWU9jWxPiJZmmUePwLbrnkb/XRupUwe/YYkiVXquYrr
	p0VSrNMznAtYN683GbyFBs1V9/e5NhgxaGF5mrAFwdJVzEoEd1C/g40vmAuBO60u8orerfodPE6
	cBgg==
X-Google-Smtp-Source: AGHT+IFbP4rQd0qC/Stti6Fjua1sH3Ev3vXHXXxcw+KEizzwcVqcnJJWslwYOq75EI5o7tS2Kma8Cg==
X-Received: by 2002:a05:6000:2c0c:b0:3ea:ad2c:c166 with SMTP id ffacd0b85a97d-40e49aa11bbmr1956258f8f.49.1758787650544;
        Thu, 25 Sep 2025 01:07:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:37e6:ed62:3c8b:2621? ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e33baa53dsm22283445e9.6.2025.09.25.01.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:07:30 -0700 (PDT)
Message-ID: <e1d4c00d-d706-41d4-88f5-bd39af52d846@linaro.org>
Date: Thu, 25 Sep 2025 10:07:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 William McVicker <willmcvicker@google.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Alim Akhtar <alim.akhtar@samsung.com>,
 Ingo Molnar <mingo@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Youngmin Nam <youngmin.nam@samsung.com>
References: <CGME20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3@eucas1p1.samsung.com>
 <20250827102645.1964659-1-m.szyprowski@samsung.com>
 <8fb4534e-ffb0-40ad-8256-b0fa040a1b97@kernel.org>
 <d27df41d-58ba-41e8-9275-2e9991f574a0@samsung.com>
 <6a89a8bf-022d-4c31-b6db-95763142e603@linaro.org>
 <aNQnszeIfeHjx3GS@google.com>
 <5f69200c-0cce-4b7b-85df-8b9d37960269@samsung.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <5f69200c-0cce-4b7b-85df-8b9d37960269@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_010732_758470_707E98C1 
X-CRM114-Status: GOOD (  16.61  )
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

On 25/09/2025 08:37, Marek Szyprowski wrote:
> On 24.09.2025 19:17, William McVicker wrote:
>> On 09/24/2025, Daniel Lezcano wrote:
>>> On 19/09/2025 23:31, Marek Szyprowski wrote:
>>>> On 27.08.2025 13:58, Krzysztof Kozlowski wrote:
>>>>> On 27/08/2025 12:26, Marek Szyprowski wrote:
>>>>>> For some unknown reasons forcing percpu interrupts for local timers
>>>>>> breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
>>>>>> machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
>>>>>> flag only when driver is compiled for newer ARM64 architecture.
>>>>>>
>>>>>> Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
>>>>> I am pretty sure the patch above was not tested on arm32, thus this
>>>>> workaround seems reasonable.
>>>>>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Daniel, any chance to get this merged?
>>> The patch does not apply. However it is not your fault but a glitch in the
>>> previous pull request and the regression found in the Exynos MCT.
>>>
>>> Apparently, Thomas had to drop the entire pull request while I thought he
>>> dropped only Will's changes.
>>>
>>> A pull request with the previous changes for v6.17-rc1 and with the new
>>> changes for v6.18-rc1 is about to be emitted but without the Exynos MCT
>>> changes for the modularization. That means your change does not apply
>>> correctly anymore on the current changes.
>> Is there somewhere I can check to see which changes will be re-sent? I don't
>> see them in the timers/drivers/next branch. Will it be patches 2-4 plus the
>> fixes for the section mismatch and this new IRQ fix? Once that's all sorted
>> out, I'll base the new modularization patches on top of that.
> 
> The problematic mct patches are still in linux-next, merged via tip tree
> by commit 9703240ef617 ("Merge branch into tip/master:
> 'timers/clocksource'"). What are the plans to resolve this?


Ouch! Thanks for letting me know. Investigating how to sort it out


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

