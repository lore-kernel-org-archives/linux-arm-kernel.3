Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E9FEA8537
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 16:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUsdONGIuqr07rjgXiFXfrB4ESlzFRwcXKo6efQ80SA=; b=NMQcnXsVTpI1GPy02zje/IAArV
	mc+dsp9QyJxSK55zKx4ddd0QTcYiqWH49Ric3c6teuY9wwjpztq82W1TOvClE3w7zh8AgAsThdhoO
	YZ/Xx5RWBexRoSL0XsKk/jiP1Noa0EQY9bRmgF3O7Jpak9C6/hg1GmIOeYITM6Y50wxvosUgQzWIE
	gLnXnGJdOhIuHK4aE2XMDav9whzcq7WdA4/eXpampfgHnKaqPKgT1ZSKrJYNie9vkLmdn/CpsBNsy
	ndhQIouH2TQY3A9HYttD3E606ZgvTrlRMTU7IIY99qTJ3Ws2dkseuuH/wKuKi2y3hnmRz8SlJPRWN
	A2pJjMiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHGA-00000006BeU-3a4a;
	Sun, 08 Mar 2026 16:45:42 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHG9-00000006Be9-0vnG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 16:45:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4853aec185aso1757695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 09:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772988339; x=1773593139; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUsdONGIuqr07rjgXiFXfrB4ESlzFRwcXKo6efQ80SA=;
        b=Zhds5g5bPrw2Pv7MnJwJ9xtXh85CXM6v+QJ02uqzpER01lmTi3zVd4f+V8iYRRlyq7
         OrG7ym8nuE8jLUf6jgxXf1dU+LXoEfaEY3XVK6PLOvlXlsIdaS0/+33VFpCCpOhaKaW4
         dOiIl+gz/02kiuA7fcs9XT9nMeRIjdsHopT0JCBiWlDfRr9B5ycNivMdSrz4H2ZQ5uiO
         ATetFqU7BaE5j6c9QoiZvyFg70q8riggGHK23ebw9/GPQVc7YbUCoG3bmh7nJuVCzQLB
         XFyci05USNsowoaWjP22WnCVMaweH1yju6W6LyyBsV8syVe055oO16CS5SGHMHvHnA+S
         Xgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772988339; x=1773593139;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUsdONGIuqr07rjgXiFXfrB4ESlzFRwcXKo6efQ80SA=;
        b=Xk/aOTBxCz1kFfqPhnI2zvpzCop4T/+HkaO+sySMRASS2aKIzW6jK8Qb8WqSboSgAZ
         2mIoPf0UAvo119t8rbaNolSS8t8xq2wpga8SsGuKQlylO7FhxIMFaJMJPZPtGgv0colP
         FJdrKmTwfKNfJ9rvV2pWBgqeGv5KXrYJnUApycLHraKHUqQKtKnEM1V1jiAtgS27fqIv
         ONQ6kvHibElVNv6+Ea8HUT4lUR6bKM9f9XjEd2zJAMOMbjuREPrwTo6eqDT7sK5dy+wW
         kz1VmuYfHgIrUB4Ss9Vhkg6fBS/Iljhw3ANFlsrKcL01ZigccIP3WjjUn3LeQPMKqx9n
         T6wA==
X-Forwarded-Encrypted: i=1; AJvYcCWoCM7EtCl9bS3kQXEjrdW0bVF8QtuuO6V3F7Q+120tRklJ5tzEBBCChdL6dnjmkLndEMrXbqkznhhGLyg4EwM2@lists.infradead.org
X-Gm-Message-State: AOJu0YwE9PvJsVZudnYsEEY+L4Gf1wqIw3HXrI2f1CXaiZ1IGWAhcymH
	SESxPHqucyGjIae8N9qu+usljkORHpcHYarJ20jP9XGr84GbFItBHrjlsb9AkUYsxmI=
X-Gm-Gg: ATEYQzwDXPNTdC8B0U/wRComJK2DqV2yjly3+kle+Oiq3yzlkXTv1wkF/m7bxGQx7Y2
	tYBIuu1KbQ5mjJwZCixs4sjptdbdsPRNf0nwlk4YWnYDV8icqi0iWqCQT5dB/U0Yc7eKeQ++c3K
	0XNo5yNqGicdlImWoCihIs7iVab+aCf5TrZ0PL7WngFsf5xyBHSCQEkxewBnQz/LHlpQwBWZ5nX
	K6tPZyPLB5TRhBFScZl0bYEh7Z4vEADgbvD/36gESvY1pftojIhhrBcOCtEOmtSGJ0spaaNG85/
	gJvO5R5r3Q0VrTbNaqyoTeHnFvia223G9KTWJZSLf1cxKSPtZZmjLMrmfI5FMuBYa8ZbdPwpRsc
	gfzSndtToPxQ+y84fOUKr6jRFlwU6CWbC/y76dKMUHsw/jyrZBdXs6HXxMhv5iDp4c8I3zWbJs6
	xljB721y2/6H51b/L6QgfxVMS0fpr7gw==
X-Received: by 2002:a05:600c:4fc2:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-4852692bfa5mr139387065e9.13.1772988339042;
        Sun, 08 Mar 2026 09:45:39 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48539e574b5sm40900765e9.8.2026.03.08.09.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 09:45:38 -0700 (PDT)
Message-ID: <203fb24b-9ea4-476e-a866-0befcdcd6224@tuxon.dev>
Date: Sun, 8 Mar 2026 18:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add required
 clocks
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexander Dahl <ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-3-ada@thorsis.com>
 <f406abde-c7d1-4ed6-b7dd-5336956bc795@tuxon.dev>
 <20260220-bloomers-runny-e69ab1966b9c@thorsis.com>
 <cebf4298-4dff-481d-9a77-09d4fb4f7fbd@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cebf4298-4dff-481d-9a77-09d4fb4f7fbd@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_094541_279569_6224FBB9 
X-CRM114-Status: GOOD (  20.47  )
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

+ Alexander Dahl

On 3/8/26 18:42, Claudiu Beznea wrote:
> Hi, Alexander,
> 
> On 2/20/26 11:58, Alexander Dahl wrote:
>> Hello Claudiu,
>>
>> Am Sat, Jan 31, 2026 at 05:47:05PM +0200 schrieb Claudiu Beznea:
>>>
>>>
>>> On 1/20/26 17:44, Alexander Dahl wrote:
>>>> The OTPC requires both the peripheral clock through PMC and the main RC
>>>> oscillator.  Seemed to work without explicitly enabling those clocks on
>>>> sama7g5 before, but did not on sam9x60.
>>>>
>>>> Older datasheets were not clear and explicit about this, but recent are,
>>>> e.g. SAMA7G5 series datasheet (DS60001765B),
>>>> section 30.4.1 Power Management:
>>>>
>>>>> The OTPC is clocked through the Power Management Controller (PMC).
>>>>> The user must power on the main RC oscillator and enable the
>>>>> peripheral clock of the OTPC prior to reading or writing the OTP
>>>>> memory.
>>>
>>> As this was not mentioned in the previous datasheet versions, the current
>>> driver don't handle those clocks, and it probably worked as the clocks were
>>> enabled by bootloaders, I think the clocks should be marked as required and
>>> this patch to be propagated as a fix along with fixes on driver and device
>>> trees.
>>
>> What do you mean by "clocks should be marked as required"?  Where?
> 
> In the bindings as you found that the IP don't work if the clocks are not enabled?
> 
>> How?  Is something more necessary, than already done here?
> 
> Update the required section in the yaml file with clocks, at least for the 
> sam9x60, as you found it is not working w/o it.
> 
> I presume it has to be done for SAMA7G5 as well (as this is what the newer 
> datasheets states) but that would involve adding required clocks now which were 
> not needed later. I'm not sure what is the procedure here. I'll let DT 
> maintainers comment on this.
> 
> Thank you,
> Claudiu
> 


