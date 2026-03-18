Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B3E103E19D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3OxEB2yN+2GerMbkLU+TUfu7OMQbU8BdF0KGaxmiRU=; b=Q6wZiP3LmOdw8RrvCXRmNsSVem
	UzCXuW6GW4CRdHZmAIfcnPDrNtwR5aOrjuc5s/Bp5Ra89Yp7yMBNynTUtb9A+HCBRcgRayg5O+ciC
	ZrUW8SEfN3aIq96OUeB3QJyCBEIilI7CycrDD087LTmdGFrwfamVcNgm3/MQVbv/smoAHTIXbzG8l
	O3NsEDfWOUkx0uDGeqP8V61OaZBQ9REtO/66DUGPEoE9TYgmL9ZoQ5qGUaTOCED6xqEDFhDpvsYRV
	+TTxPH1lnrwKV42uDrq8Ger9pZ1nY4K+VT6mZSox0ndCk5SpadrtGXSO/m0l5TShFpVNe9pxJ8A9z
	trzKWoPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sod-00000008hel-0aXa;
	Wed, 18 Mar 2026 15:28:11 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soV-00000008hXy-3yJe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:28:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so28198355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773847681; x=1774452481; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W3OxEB2yN+2GerMbkLU+TUfu7OMQbU8BdF0KGaxmiRU=;
        b=TIMck739002GdE9HkTZuvdPH38gpDCt7Y3vs81Wo7znD7FK+dcsK5iqe87T/Q4C7S7
         mrxknPn0BxFei8e2S0R0Fp4JcZR3Girf26OChKWucXeh4mgZykxUrQkC5D81vDsQoCvj
         Ay9ZfBC7956hTfPX7X5/5Wxn03FSCqyByF5I8i8f9uTPy9e5GWAjltdYjAYz1a+oTlzH
         XYINg5HMwmaEDhlJAztwR7ecCBQrs5YVVDWVXxkNgUwLEOmnWnO/+m5g0DnlwWV0YdOk
         FpVULFjEH8kyw7/Xs7Vq9NLfcQCwGfXKVLffu92Pd0P6qAZ/VmIpIidwT6d2pVo01KYq
         YWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847681; x=1774452481;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3OxEB2yN+2GerMbkLU+TUfu7OMQbU8BdF0KGaxmiRU=;
        b=ZflinGPjoxGX+k4/2p1nVxyNtYhzc6HqN0L+PCYUVTHKeyHX24okC448ZG5Galq5EH
         Af1GtnMrXfbn4SmpKthHU5jOxchVijeboScE6W5U66MMTNzChssLPbXxsG5lvr1YVUpp
         TFaXYvrYiOQZiA0V3csxa5ef1c/JwEXb7qQb/UuSMS4gRIhTvzt3Wb2NKgh8HynXGaP4
         VirwGJYq4tZi2zVSzbM2PBhJA8Sn8drlgR02J+ac/7Za7uS0DPQNtFTmg2jIFfIhjpum
         ppvbbRE+p1lzx2xJmygtUTO7E41fSD+iAiAKgEJa73tQddGfXmQoGNa5tEQWq616EPA1
         /BOg==
X-Forwarded-Encrypted: i=1; AJvYcCU+6gAjj3Bh2I6iKMO28R8IzfD6BUR/wjBYIiTIfGHveT1/gViQCj85e5zmoDQ/Zoj5VSkfkCj2aEOq5n9cp4Ar@lists.infradead.org
X-Gm-Message-State: AOJu0YwEdRRK0aGNcnslsPz0NwHDIdLK+bm/bGTKKQ8y+lOxQnjg3rBj
	dQM0lllSe3gJ5YjrmKx5vySV0KLUHvOucFo2OvVzYtSzFyLCHMJx2ydpbdZYS9FmIBY=
X-Gm-Gg: ATEYQzxVXXaSJrjmKdtH6htra5tuOsU4UVB56a7JXijcj56SR58P+g1bhN+U44H5fbi
	ptbTleJHmvktegGBorBdyR4t1Cdoa7ZL1idutdwLipabP1UyR7UUWVRCyRhotnBIs1Dab8OlGTl
	T8ZYcVl3LC2x1FtsJVCzduSXieHdEJ7Cl+EEYvepVc/NLUwIRjjuGClYBl3TTxmJ1EQnNOuNQCb
	7FD+opLhRBIq9P3YU/Ir0How4yy0oL3niUAM605205fQsf7m2XkfNMmatA2kAr+JuBmT8C2jxkK
	4IhdI8uqcfcJl1HZSTWYdstfDbz0VNb54HqCPaOetTFUza2v43XVwWEnIEzD5841jQTC1OCG9Nd
	pbwigP7yvAwjSUYAT1/3fmxJO4BjsRqhBj85SxxEfLT0799J6PUoUL/Tjn1DnHtOFndYlxW3cd0
	hUlyE8H9PD/gQwvDjUgKyvbfDz0JDIFPU7ENF4RrzMERqd1u6ioSaj0goh5814dJpHwJJYx6ojx
	hJuQgs8RdYTsRoVJHREMHnjX0YfYnmePHbjzJ4p+cedEMUyXrLetQ==
X-Received: by 2002:a05:600c:4585:b0:485:39d4:2dd9 with SMTP id 5b1f17b1804b1-486f45708e5mr67334395e9.33.1773847681338;
        Wed, 18 Mar 2026 08:28:01 -0700 (PDT)
Received: from ?IPV6:2003:c2:c71e:d000:d65d:64ff:fe46:1d1? (p200300c2c71ed000d65d64fffe4601d1.dip0.t-ipconnect.de. [2003:c2:c71e:d000:d65d:64ff:fe46:1d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b0b99dsm664065e9.1.2026.03.18.08.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 08:28:01 -0700 (PDT)
Message-ID: <bbabf0f1-99fa-4822-85c8-df76ce89da01@suse.com>
Date: Wed, 18 Mar 2026 16:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: realtek: Fix memory node unit-address
 mismatch
To: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkA==?=
 =?UTF-8?B?5ZCbXQ==?= <eleanor.lin@realtek.com>,
 linux-realtek-soc@lists.infradead.org
Cc: Drew Fustini <fustini@kernel.org>, =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmP?=
 =?UTF-8?Q?=5D?= <cy.huang@realtek.com>,
 Stanley Chang <stanley_chang@realtek.com>,
 =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>
References: <20260318114047.2804171-1-eleanor.lin@realtek.com>
 <405a9783-0f77-4ce0-8288-43eaada09cff@kernel.org>
 <e4c0187e-566b-42fb-920c-3cf73ed6cd6a@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>
Organization: SUSE Software Solutions Germany GmbH
In-Reply-To: <e4c0187e-566b-42fb-920c-3cf73ed6cd6a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_082804_071346_9544EBC9 
X-CRM114-Status: GOOD (  22.85  )
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

On 18.03.26 15:28, Arnd Bergmann wrote:
> On Wed, Mar 18, 2026, at 12:46, Krzysztof Kozlowski wrote:
>> On 18/03/2026 12:40, Yu-Chun Lin wrote:
>>> The memory node unit-address should match the first address in the reg
>>> property. Correct the unit-address from @40000 to @50000 to align with the
>>> actual base address (0x50000) defined in the reg property.
>>>
>>> Fixes: b095c27fc874 ("arm64: dts: realtek: Add Kent SoC and EVB device trees")
>>> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>>> ---
>>> This patch series is sent to both Realtek and ARM SoC maintainers.
>>> While Andreas Färber is listed as the Realtek maintainer, there has been
>>> limited activity recently.
>>
>> Unfortunately nothing new, likely two years ago I was also complaining
>> on lack of maintenance on Realtek, but the solution is not to send
>> patches to soc@.
>>
>> Solution to that would be to remove the platform, for example. Or work
>> on maintainership.
> 
> They have already offered to take over maintainership, see
> 
> https://lore.kernel.org/lkml/3ab263bfa4904b428245152b83340363@realtek.com/
> 
>> Did anyone from Realtek offered reviews to my patches posted 3 and 2
>> years ago? I don't see that.
>>
>> Kent SoC was accepted under condition this will improve.
>>
>> I drop this from soc patchwork and please do not send code for review
>> there, but either fix the lack of involvement from Realtek or let's drop
>> the platform if Realtek does not care.
> 
> As Andreas has not replied to the MAINTAINERS updated, I would
> prefer to merge both that and this patch in the bugfix branch
> for 7.0.

Sorry for that, still lacking time, but at least receiving now...

I'm happy in general for someone with more time taking over.

Last week I spoke with Realtek (at EW) about testing the newer SoCs.
As a reminder, the mainline removal of TEXT_OFFSET broke my ability to 
test the older SoCs that I had access to. I hear that Kent and other 
recent SoCs do not have the same bootloader limitations anymore.

We would need to consider moving me from M to R and possibly changing my 
email from .de to .com due to recurring quota overflows.

I.e., new maintainers would need to queue patches and send pull requests 
to soc then. Are they set up with GPG keys / kernel.org tree to actually 
take over on their own?

As for review, there was one other review discussion about ISO/Misc 
areas that I found concerning: Those areas have been clearly documented 
and (on the older SoCs I know) contained registers wildly lumped 
together (from kernel PoV), so that having them in DT and accessing via 
regmap seemed the best way to me, compared to trying to map individual 
words to specific drivers. My old branches may contain some example 
usage in queued but non-merged drivers. (Amlogic may also have similar 
concepts of always-on vs. PD-controlled peripherals grouped in DT?)

Another open thing would be help with mailing list moderation, if we 
want to continue using it. Any review responses by non-subscribers add 
to its moderation queue (plus any spam).

Regards,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany
Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG Nürnberg)


