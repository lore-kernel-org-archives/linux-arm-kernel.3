Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76761CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 07:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nE9mrH0UhzecibkTC58SxCDMEGe2+PqMAu5GxokQyLA=; b=R48ZRTEo7wodu00M3JK44UCBu4
	fl3CCfyH2LbHL2bnssI2oYuEjGN6SM1P3kwiGfJ8g0NxfrheG2epxMhIQcqUaCPBa9tQgAgO5OYrX
	qqblUFNzChKTcSMbsLnW4EijCjMJtnBwdD6F8Q8sP9Hw308hI/UHfWuKmwBjXBNXqF7PhBro/wa30
	pJYTwfn9XLxFLkgm+Ahl7R3kPSe1gKLsVZ59V9H69OYnTKxYqHl3Z++7KgaBuRSFy4ZZDUkbWuOoY
	0aMj1Vtap3hXK9LnzEhtHbj9FHN/U8G8FGaltUHuAAirDFZ7Nkp5AkQwdAZ2/tikDJISjOiWAF4HD
	EkxxQBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnPK-00000007fkn-18Vb;
	Fri, 15 May 2026 07:56:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnPH-00000007fk7-028n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 07:56:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4891b0786beso57391225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 00:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778831785; x=1779436585; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nE9mrH0UhzecibkTC58SxCDMEGe2+PqMAu5GxokQyLA=;
        b=ZtqDi1JwB9BpmutVKHj374axvDrLS1ETpdx3BD7+9DS4xehofQq9CGx3NW9xDamgdI
         CEhUqHLUDs2C/jsC/jRQtUGgcNRAkLf0s0w0JkzwqJPZig74GWuZmxMClr8g7xx7Eu06
         OtAm3aBD+lrrCoDpyezQnS9pMC5eQRHMbkjvaCvPNhqUMWpIs0K/4ivEKWHdkzS3NKv1
         wzsfrqwAC0MEmJwmWNHMGbydYCmNosBG26Nw/wBMJGyr9Z3HIMrifAuhutGSmDpDmwdi
         tLcZWGgSvI+Zq3Z8/zWAAd6IS3xBNOyFdXMLs4YWw+bZ82Zu3Dq7o9khfnk+0eiIJ0m6
         GyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831785; x=1779436585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nE9mrH0UhzecibkTC58SxCDMEGe2+PqMAu5GxokQyLA=;
        b=G9izawswPL69JmJBNeGlXIRnLZIEe6WbKrdwh1ctYoVUxlbsN0ssj/a2VU/CGoO5wP
         PYVDqbt0FiUXtG5tVc1N5jh8IbnJJEn+g8E97Kg9DfjSU7RdyB7aDfD1uSQ6jTCErwMV
         HxKssdOM59j0CtfR6TvpKJO+tSUz+yAGkT1UBuqSBu1xOv05hHGlqUeqv8kqvo1x7DBR
         ttTa1sgA9jQwBcUJwVR19A9fGppk9HNqrmqYNtoyVdv/xFephs5AA2jqNOhys2zcZJHb
         XgxpjTcFTgIwXxO3FVOaW9ByCMkviMLUIrrkoxYL3qJxgd31TxaP4xEIzQe63fIo8UUe
         RVEg==
X-Forwarded-Encrypted: i=1; AFNElJ8MF1eCU5aAnL08h9U/m2CRc0OeQd/LIpBxNRXXSIkkfRZ9L27E4JdOor20kQEHylT3HK5fqCxAeca7Q/LESvbT@lists.infradead.org
X-Gm-Message-State: AOJu0Yypa1FHlLPUs7yKA0rsyNiDJZEh+SzQKQIDKhQP+Eq4riSzfhiU
	lYDBxBm9zRvAPgDTktOAzb+/gN94KpkJGnsTZsySkubJfoUpsS3R30zU1nMbVDi20Ak=
X-Gm-Gg: Acq92OFgYimguHtfXrmeTRy7vjf0oQDHg/3gFCaYxc5gWXNk+uu5SpUeT6X7BhHVXGh
	zdZU5GHLZPMQAHbG87dGJG5GvPosC+CF/6mBOIMK5jdLIf/Ls2gldvPfVTCJ9tQMJrjraOJH6eW
	mXzgDurDTcZiVpPGGMxzubaHaSvvwIFG1mddkvxU0wIJFiLNg6iLHdPPqyC7lGFTaLubggALyuI
	uBGqOlpJ1kBBTgja1EuD6WLpAuQTlinlaEyd/AW7I1pqo6e2u96S9HPxM6sFBx947m/pK7RDpwN
	9mqY7Y3yPNSkXGA15gW2TAm6KQeFaxq30YxloAi3RrrOo+IX4BjPAGNo66HtrG12U7vY965MEnb
	n6XXBvyNSp8Ub30yfu1xlZCocF6xH1rjkazHxz60DSQjNlgk75TRQJYjLl2INGeiOqyD009dhAn
	Ql1zEizIql4v312LqbgWypLe+gT93tf3At
X-Received: by 2002:a05:600c:6992:b0:48f:e230:2a20 with SMTP id 5b1f17b1804b1-48fe662a1b2mr36300395e9.31.1778831785070;
        Fri, 15 May 2026 00:56:25 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88e5asm43645835e9.6.2026.05.15.00.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 00:56:24 -0700 (PDT)
Message-ID: <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
Date: Fri, 15 May 2026 10:56:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_005627_084114_7FDEC330 
X-CRM114-Status: GOOD (  25.16  )
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



On 5/11/26 4:17 PM, Alexey Klimov wrote:
> On Thu May 7, 2026 at 9:31 AM BST, Tudor Ambarus wrote:
>> On 5/6/26 6:13 PM, Alexey Klimov wrote:
>>> On Wed May 6, 2026 at 12:39 PM BST, Tudor Ambarus wrote:
> 
> [..]
> 
>>>> new file mode 100644
>>>> index 000000000000..c68d60b4c0b3
>>>> --- /dev/null
>>>> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
>>>
>>> [..]
>>>
>>>> +static int acpm_tmu_to_linux_err(s8 fw_err)
>>>> +{
>>>> +	/*
>>>> +	 * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
>>>> +	 * capabilities. Treat zero and all positive values as success.
>>>
>>> ACPM_TMU_INIT returns capabilities inside designated error field?
>>
>> yes
> 
> Heh. Okay.
> 
>>> What about other messages/commands? They just return error code there?
>>
>> all the other commands either return -1 for errors, regardless of the error
>> type, or 0 for success.
>>>
>>>> +	 */
>>>> +	if (fw_err >= 0)
>>>> +		return 0;
>>>> +
>>>> +	if (fw_err == -1)
>>>> +		return -EACCES;
>>>> +
>>>> +	return -EIO;
>>>> +}
>>>
>>> Could we map these return values with better granularity instead of
>>> returning -EIO for everything else that is not minus one?
>>
>> I think we're good as we are now. The firmware returns either -1 for errors,
>> zero for success, or BIT(0) and BIT(1) for TMU_INIT to flag some capabilities.
>> I can't tell if there are other commands that return capabilities as well,
>> or if there are other capabilities for TMU_INIT, I don't have access to the
>> firmware code.
> 
> On Exynos850 I see more than just one returned error codes. I definitely
> see 0xfe and 0xfd at least. I don't have any data to confirm that ff
> maps to -1 and fd-s, fe-s to -2,-3 though and what they mean. From my

for these error codes we will return -EIO which is alright. We can have
a more granular approach depending on the SoC if you want.

For GS101 above is alright, it matches the info I got from the firmware guys.

> experiments I suspect that 0xfe means that call/msg type is not
> implemented or not accessible and 0xfd means that passed parameter is
> wrong or incorrect or not found.
> 
> I am also not sure that I saw 0xff-s but, well, maybe that needs more
> experimenting.
> 

fe and ff will be covered as well by -EIO.

Let's keep this as it is for now, and if you need a more granular approach
we can differentiate that for e850.

Thanks,
ta

