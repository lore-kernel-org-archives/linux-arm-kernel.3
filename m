Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2180CC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 09:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d++95DEEqRY9z7LqAnuNyrlBAMbvjNxXsrC0i45rWs8=; b=e4hzNN9e/KpSM7JlxMNCYdEDh8
	PS0MTIC7uYb+ZkONys6JyFOZ7v8uizFBOzF74yt7jzwKwPEDZuleqJQoTJcZzhNP1pNLhoD6E8gdK
	DN0Fmv8q+uwCW0otZmWUl7L2zJDQJUQpuKibVDFByEMsnm7ryR4mOkvuup+pdAbHeSoTDINVO+a2p
	xMmjikvaGRJIuQUJgki7Zq6Ia76ontZQnS/5EBKIh9cWtKI0ni4qiqxB0zkBx/n2SWYWcf4ci7bug
	vH60hhbOXZZyC8v6hNymJP6TfbrRhkZFpJgW5qBq050NW/HlV20ngaxm3Qzh2ty17Q+8b6/g2o7Ia
	uyBPC6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufF4B-00000009U7X-3Tuj;
	Fri, 25 Jul 2025 09:50:15 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufF1j-00000009U0t-1W1Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 09:47:44 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-607fbf8acb6so215973a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 02:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753436861; x=1754041661; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d++95DEEqRY9z7LqAnuNyrlBAMbvjNxXsrC0i45rWs8=;
        b=K95c9Vfu5VKShqqIg1EW+Ue2AeRwMPktPGH0eLmzQCDmFkHka9M0zcVCx/2TibSuV8
         yAmxwRtWsqbzfMxxLlYWefATMMRUQEV+vO+TlJ6ldQK25xHNVOAk0+xSjwMouYXWHrke
         yB2L3gdPaguqvp3+pzEnCZkF7o8YqljUVobgTJ8pREwNqYZv9QnKOAUl2WSpJ17suRX+
         3EcJ0AaxkKO7+1op6Hw7mdbc9yxyflXSJcJ+Rh461ZkaGv+5RMz3I93AIDZU40ZDEx3X
         beauDYnpvO8GX1XKTXOGEuFxx0mivgJKxceinsdH5LjPo0bCbmqRfHp/ve7/adNxG1MB
         KkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753436861; x=1754041661;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d++95DEEqRY9z7LqAnuNyrlBAMbvjNxXsrC0i45rWs8=;
        b=HoRE9v66OSMtm6Bh3I9X/3NoA2qdmUizxlo2k9VrKtjmYUglWUqhwiq4jTelgbe0zr
         9yjGcOOTKNXHBwvCmg1GVom09Kr2GQjEY0+9sqj18Yex0hpWMrgQMW83HNauvFgEQ4H0
         Sil4ptwnSBEjPaRCBeXrdt8dD7bjgJEchKrOqFbhjCA/d6HWBiy96LA8D8ChBQDSD58k
         MkgRa3bro67tFaaJPsN+cZW1VyfHho16doukXRs9Gp9VAy31li7EZ5TBv+pxl0Fw4pvg
         sUU5YqeiJX+33AuLplkfDjJtjXh5WAo9RGAU4whsJJJZL9CHuhWMWtOoHafIVTL4DUG8
         L56A==
X-Forwarded-Encrypted: i=1; AJvYcCU8P6YiTb7Jz6BwL2y5ayuHZu8Kig627J0wHYhD+jn7H3vtd1At64uvjF5OT5h7Sb6oJF3SGc3y8/Bc77AHtkgl@lists.infradead.org
X-Gm-Message-State: AOJu0YxLq3FIc6sr2OIIl76Ptfvp7pgs+FnOGsgry1Rn6VrbX2v4JssQ
	E1+XEUdiW09zTS/huDY60Eqzo5F6q2LBD/4ytPHPlZ6PvgVjYNcLCnYf9yyootIJJxw=
X-Gm-Gg: ASbGncsaL/tptPvoUru3Z9TB88Ba8GIlJcWFSxlTBJJskgshOyasat8kmn1knYXE32F
	XUY2V0wZGUJoiTYCt/3KLmewPviPFqfwwH0JNC50hqckNxUQSscNL+xGzHShxB+pUfR1srxfFOx
	lzdIzo3fnkL6viXxHHqqCH0OXcfeg1pib3w8u2sBGaPVeoCScXXYVUd/AtB05FeWNwae0CslARJ
	GNc3lWc04hG7nq22TTZ5WUqByL8WAyYi+TkpjsXgSnUb4rdx4sbc0IQCExxdQBU2KyTj9ii6QoU
	kEyGDZ4IdtloKuOMF9JbfCZItAJdpB43V40J0g+lugceBRWY+VmmghXGR49UqfoNOcXlo38j+95
	sKGmagcQx+snoPy22C+B0x5vH9V+ZbBPrgEcDRPfVWw==
X-Google-Smtp-Source: AGHT+IGt4Tl+Ezasy8itQmEdKvcNMQR6PoUhq2rRmHXq00x0XuE90hd52Zy9YkCWuEt6FOh+JdkGdw==
X-Received: by 2002:a17:907:1c8d:b0:ade:902e:7b4b with SMTP id a640c23a62f3a-af61cca78f4mr49006666b.7.1753436861413;
        Fri, 25 Jul 2025 02:47:41 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47f44d8c9sm246902866b.68.2025.07.25.02.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:47:40 -0700 (PDT)
Message-ID: <a345528b-1641-4f10-a9ae-6b853f625df4@linaro.org>
Date: Fri, 25 Jul 2025 11:47:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Revert commits causing
 section mismatches
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Will McVicker <willmcvicker@google.com>,
 Youngmin Nam <youngmin.nam@samsung.com>, Donghoon Yu <hoony.yu@samsung.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250725090349.87730-2-krzysztof.kozlowski@linaro.org>
 <63a6d253-305d-4ffd-9954-7cd665bd332d@linaro.org>
 <2f413942-8126-4d94-b64b-c4a05052b5a1@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <2f413942-8126-4d94-b64b-c4a05052b5a1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_024743_412901_4D80F307 
X-CRM114-Status: GOOD (  19.04  )
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

On 25/07/2025 11:35, Krzysztof Kozlowski wrote:
> On 25/07/2025 11:28, Daniel Lezcano wrote:
>> On 25/07/2025 11:03, Krzysztof Kozlowski wrote:
>>> Commit 5d86e479193b ("clocksource/drivers/exynos_mct: Add module
>>> support") introduced section mismatch failures.
>>> Commit 7e477e9c4eb4 ("clocksource/drivers/exynos_mct: Fix section
>>> mismatch from the module conversion") replaced these to other section
>>> mismatch failures:
>>>
>>>    WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x164 (section: .text) -> register_current_timer_delay (section: .init.text)
>>>    WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x20c (section: .text) -> register_current_timer_delay (section: .init.text)
>>>    ERROR: modpost: Section mismatches detected.
>>>
>>> No progress on real fixing of these happened (intermediary fix was still
>>> not tested), so revert both commits till the work is prepared correctly.
>>
>> Please don't claim the fix was not tested. I reproduced the section 
> 
> 
> section mismatch code MUST BE tested with enabled DEBUG_SECTION_MISMATCH
> and disabled SECTION_MISMATCH_WARN_ONLY. If you have warnings which you
> missed (although if you have warnings what did you fix?), means you did
> not prepare testing setup.
> 
>> mismatch, tested it and figured out it was indeed fixing the issue. I 
>> just missed the error because it sounds very close to the first one 
>> reported initially and I did the confusion.
>>
>> The driver is not supposed to be compiled as a module on ARM32.
>>
>> The option tristate "Exynos multi core timer driver" if ARM64 is 
>> misleading. From this change, the defconfig on ARM can do 
>> CONFIG_EXYNOS_MCT=m which should not be allowed.
>>
>> Before getting wild and revert everything, let's try to find a proper 
>> fix for that.
> 
> I am not wild here. The issue is there since 9 days.
BTW, merge window will start anytime soon, so if you do not apply this
revert and do not fix it soon, it means NOTHING during merge window will
be tested on Exynos.

Why?

Because my builds for Exynos rely on correct sections and they fail.
Failed builds means: no boots.

No boots means no testing.

And if this reaches rc1 (imagine you send fixes AFTER rc1), then all my
branches will be non-booting as well.

Time to "not be wild" was 9 days ago when you received reply from Arnd.
Now reverting these is the appropriate step. None of this work was
tested on arm32 Exynos, BTW.

Best regards,
Krzysztof

