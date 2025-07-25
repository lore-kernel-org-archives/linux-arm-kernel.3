Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C210C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APLwVADmRioCZ7u0qB0EnkXcpcl6xZc3SqFMoJI4n2Q=; b=2w19Q+n74Ls5nbKsF1R4OE6ul3
	ER4ptZMhuZfG8aRpFrql5vm/OcURcHa6TU7WqY1lJ9w9YTMEXf+AYfDpbWgqKSBTD/Q1I9VX+FPFk
	57nieIw94mYmvDxFKRzAXfMTJGdaBEZvRSmcd3DArMRPo3t6Q/Gcy+Wyq1VTd6Kn4LIKeU8i8OzPA
	Ca3gq4P7LZUz5MpBPWLwK1X2a4MUF2sl6gIpEiR8c/bzLFZNH2LNajKxZJ22nvAxGRsZnByIn6D0s
	mf9RxLB5l+TheVkfVS3qC1WMAWSY+JgTbiCij4+g8kyo2007yyq0WjpzBzsXmYoTnj75PJ2uQucLa
	hpA0upOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGM1-00000009gaJ-1hlk;
	Fri, 25 Jul 2025 11:12:45 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFSo-00000009Yja-308R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:15:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso15022095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 03:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753438541; x=1754043341; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=APLwVADmRioCZ7u0qB0EnkXcpcl6xZc3SqFMoJI4n2Q=;
        b=qZeLXK3PmfWqQIH+V/6iGgD4he5SvAQ0mlSzYy6dEGhqoXgzrfOQ8UGmn0yS3bYU8x
         hLPHHPZcGTJsZT57DAwCx8564SDhWsCZdc1RGZp5ZxclPPZPObhm3XLRcZRAsX+beQMX
         G9Tm761l+r+sSXDMQbdmV42zeJFdwVOfpgWC5n6lfbOop7i7NJLISqO/6G8gi9BioG4R
         kJ2LUTTMPXko0jPzViHO6PoTB6q+EDqnyJUEB6B3dhN6YTJiXhgI9H22PtYIzybkWSjR
         emJ91Irpa54t8u3q+qloD1HJaJTOgUKrR9du9X2CWS+SVnJHbd1ydE15Iae2rHqhfFNR
         rHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438541; x=1754043341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APLwVADmRioCZ7u0qB0EnkXcpcl6xZc3SqFMoJI4n2Q=;
        b=jTNFJuuhFeeuFwk6nasewT3DBWD1QeAedqt812/C4wcqe7DaiNmsu/CJSSMUl3Z+Ac
         K4nKnFSsfYMvlehcP+oS/y0h582cD7EFOuOW5ee8JM/yBQZ5K4YHwvsAoBYh9XFjfr8e
         QEXMgAWlCbJ0MYsEOE3JWq80sA2Xt5D03JBAPGKuuhqbm9FSIW/cOt+tOZ9eGnzmkZrw
         dTXFIlz73tCHK/K2rH8hB6QfbS4fhZA4F72FxlQ5+YifUQGEhG85e7QUeElflzCiAWuX
         Bwj7PnnVDYUYtVTgBxsoO8cSueMWGlh0x4rpTG4O2tKkvPqMmulplXpQTYdOCc5xXNkN
         T0mg==
X-Forwarded-Encrypted: i=1; AJvYcCWVSynU8a//IXvuzO32D9WnL2i+gwqNOouVnvwrYsLBq3Ib2D/d2KHvakX/HM/Vlo/mi9vLt80ZHSdVseBiCN6B@lists.infradead.org
X-Gm-Message-State: AOJu0YwgcTRAwhUrVRlLlPHG33vYyWVUFpo2Ag5BxyLomQJkCri4WmnY
	pTvypipdYtbUbmQdAiD3E3scJD8A+6/xsaqChHBbGoNx+OfOpNbQFbzn510CKsWEoOw=
X-Gm-Gg: ASbGncvwVJUsFO7Fj24eWCf0GshM3TxC3R+CfGh4FN6j5obRuJO+8jnxjjF/2kcCxj9
	VXf6ZAEb2j3yQ1AwV7vUf15o3f8STw/IS5xmKcVX2Q28yYA3V2M6iUKtOZUHzMdJYSUlqr5+Eyr
	zn992ldK5u5f/GeWzyP5HN0GiBEwmytxwd2TbtToLiUUhMtgMPjGmzG2TB5Fz7a/L+DYMbddHtv
	2eTR1qura/8qsVShueKU+pixLnsnk1FPvWN2njSG127V8eTvmlBJIlcqpiv1ms9ffrngK3bLNjp
	c2FFEVl2UC8ycyyDBqUYpVRavRYrKFZ+mMVSK+AzjDCMWJw7KkiluN5vX/2Faq5qGqj6Uwl6Y7R
	4+NGJzzC9m7rb45ao4DsuOP/GZb5NzBdYJnbvfvBOOoYDX1VOXqPdvyjXJrrBsQ==
X-Google-Smtp-Source: AGHT+IEBeHBXAtdpNhW6zbX7qpvXST3sXOdUSZ8cfnbAWldRkxy9ati6Hj+NpR/zEGXM2uDWeV3bag==
X-Received: by 2002:a05:600c:1c25:b0:456:1006:5415 with SMTP id 5b1f17b1804b1-4587630539bmr11432225e9.6.1753438541037;
        Fri, 25 Jul 2025 03:15:41 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4586f88ce71sm40030785e9.0.2025.07.25.03.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:15:40 -0700 (PDT)
Message-ID: <57687038-e70b-40d2-b2d6-d2c68fc7945b@linaro.org>
Date: Fri, 25 Jul 2025 12:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Revert commits causing
 section mismatches
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Will McVicker <willmcvicker@google.com>,
 Youngmin Nam <youngmin.nam@samsung.com>, Donghoon Yu <hoony.yu@samsung.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250725090349.87730-2-krzysztof.kozlowski@linaro.org>
 <63a6d253-305d-4ffd-9954-7cd665bd332d@linaro.org>
 <2f413942-8126-4d94-b64b-c4a05052b5a1@linaro.org>
 <a345528b-1641-4f10-a9ae-6b853f625df4@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <a345528b-1641-4f10-a9ae-6b853f625df4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_031542_768590_3C34D877 
X-CRM114-Status: GOOD (  18.91  )
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

On 25/07/2025 11:47, Krzysztof Kozlowski wrote:
> On 25/07/2025 11:35, Krzysztof Kozlowski wrote:
>> On 25/07/2025 11:28, Daniel Lezcano wrote:
>>> On 25/07/2025 11:03, Krzysztof Kozlowski wrote:
>>>> Commit 5d86e479193b ("clocksource/drivers/exynos_mct: Add module
>>>> support") introduced section mismatch failures.
>>>> Commit 7e477e9c4eb4 ("clocksource/drivers/exynos_mct: Fix section
>>>> mismatch from the module conversion") replaced these to other section
>>>> mismatch failures:
>>>>
>>>>     WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x164 (section: .text) -> register_current_timer_delay (section: .init.text)
>>>>     WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x20c (section: .text) -> register_current_timer_delay (section: .init.text)
>>>>     ERROR: modpost: Section mismatches detected.
>>>>
>>>> No progress on real fixing of these happened (intermediary fix was still
>>>> not tested), so revert both commits till the work is prepared correctly.
>>>
>>> Please don't claim the fix was not tested. I reproduced the section
>>
>>
>> section mismatch code MUST BE tested with enabled DEBUG_SECTION_MISMATCH
>> and disabled SECTION_MISMATCH_WARN_ONLY. If you have warnings which you
>> missed (although if you have warnings what did you fix?), means you did
>> not prepare testing setup.
>>
>>> mismatch, tested it and figured out it was indeed fixing the issue. I
>>> just missed the error because it sounds very close to the first one
>>> reported initially and I did the confusion.
>>>
>>> The driver is not supposed to be compiled as a module on ARM32.
>>>
>>> The option tristate "Exynos multi core timer driver" if ARM64 is
>>> misleading. From this change, the defconfig on ARM can do
>>> CONFIG_EXYNOS_MCT=m which should not be allowed.
>>>
>>> Before getting wild and revert everything, let's try to find a proper
>>> fix for that.
>>
>> I am not wild here. The issue is there since 9 days.
> BTW, merge window will start anytime soon, so if you do not apply this
> revert and do not fix it soon, it means NOTHING during merge window will
> be tested on Exynos.
> 
> Why?
> 
> Because my builds for Exynos rely on correct sections and they fail.
> Failed builds means: no boots.
> 
> No boots means no testing.
> 
> And if this reaches rc1 (imagine you send fixes AFTER rc1), then all my
> branches will be non-booting as well.
> 
> Time to "not be wild" was 9 days ago when you received reply from Arnd.
> Now reverting these is the appropriate step. None of this work was
> tested on arm32 Exynos, BTW.

Yes, indeed. Fair enough.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

