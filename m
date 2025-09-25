Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8AFCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 22:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uiMopYw+uvp09bcMkYJbMFnB1r1OaTVELHQGa4Gdne0=; b=4gDsHJUA2Btm/XpR09rJf7Md5h
	cAIgwUn69oT9xcttWF/OAlRtIuavsD5ahJCx0EM3qF3BBICTItqwTxL4kvKCmslxJ0vktrNTdDjx0
	7zFNKoVPBrckgR68OudG8wmBo8wk8jxYfrW+mGTANc6/9HLaRtqAktQZ704BukZWJTyQiXwGzW3Qm
	JOYBA0w/8Ag6+JeA06/iyqQThFbVYAtG746HDEOdvmXQT2gr3QXA8s2Ggm3swtEu8y3HKRNBeLlxi
	gfNqL5wSHJUWleuz6RDRFNl38RNwQ5w+QcwBwg1vReZov0sKlSWLMt2dqszzterWYMQcaWgT1lLVZ
	FveXGOgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1uqs-0000000Dl3R-32f7;
	Thu, 25 Sep 2025 22:54:14 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1uqq-0000000Dl2L-1fOp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 22:54:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so23028375ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 15:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758840851; x=1759445651; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uiMopYw+uvp09bcMkYJbMFnB1r1OaTVELHQGa4Gdne0=;
        b=VL6Ei99rXyofL0XZYvyBrZoTh/uvJ0mWK9prq5crSN3NI97eF75cwSLsreq+J4q3As
         AyZya/56tNb30aiabCcJ4xXi5gWwcTNBxVkXww8pt75czhRLWoz5/AibcKjI3cN0eIhv
         3qwsAJZPmQZ8VYrnZYsL09nAd4U5JkPR8X8P1NJ/W0+6Avp7J1G5t9/OzVu1h7JSQGuI
         UHoAfaNfcP+lxKfIUfy1bbHz8PwcQTKP1/Oi4M6b0tBpYtxRU4aTDUUt3039AdNv8AOg
         lx8JxbFB3ewFRwpVhOtodjqgM4MTbokKF9qQDoYTBXq3v7PV3AyHFNDo3/tJF1sWzrLV
         vdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758840851; x=1759445651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiMopYw+uvp09bcMkYJbMFnB1r1OaTVELHQGa4Gdne0=;
        b=X9EyHFIEvDzb2+SEuuzmTtwOB1zrSOit2Cs0RyuhdAd7s/usrwOY2OUjdWZkFn6hj3
         3MvahVATNb9+AyHhe/+D2NlyZ3IfiQsDmrrZ8qvmmipxwmvnb6s0IzBtCx0YmhAVSpLg
         XZMe2WT+NM+kXUnCb1w8UwGVWkr6pXbtBl4wgpwXld/SuYMEoqYBw8jD73GzBkN/hbsJ
         KpRr+yHgdRDZ7tHhP21Cu2EQJ1FeJCCm3UPWXx3X9zs7J6l+Ho/PWGbkW9axRnYjKz1D
         4Istd5tSSw63LPFnPgAB2HP4x+csALXv2uD/4QMQ/ULAzUpupS/kZ65vMntNGLzpeIIh
         ht8Q==
X-Gm-Message-State: AOJu0YxOfj9PCky7p6L3TIK4IfhcKV45LTH23fefEa7f5XesG7Y26IhY
	cbHF4MkmR2jKPTJVSCZjeJSaquZ2gmLT8jVUMjKxsKIlfZ0HXz2V5UKm
X-Gm-Gg: ASbGncvx2IM18UShGwsh6U6JB1cou6mRtvzEIzCehYnK7lT4N3uW4iIu49lKdJBiBO1
	ylON6XMxyNYfWU5Al0F5CzfdsD5a7d5HXFQNqorDoe3Hii4i6ryT5vZPt59XnApWWmOsKicw1z7
	Z+8sp3aqvBVbViB0X2Bw4kI+43fVnz0Vt1oYoq6tq0JSsQu2JLTBWIkpw4TsG09rg/OVxb/UqyC
	eHpBO7qrpD6qRohBO8ilQ//uyP+SD7zwejA4j5S8z5u7MI1gPkXL2yPsHDmbDKW2I+xU9GgDScy
	D+fSfW3GvC9Tz717gNGoeR1DhZqCSAslCVGrwRydVXZs4DJEjaruvP6hFZzzuzv7TZH6bLdLBnZ
	StpcCy60a/ch/vSkN7VBTia+v+y8W/6vKpM8jI8rMljpg0UNx/qc5pPXNK6VbRD4fKhmexbA=
X-Google-Smtp-Source: AGHT+IFubr9ugo6lIW2e4vSA1SauD/zZYankZqVCG2PaRl4/Wxdy7CPEfHTDg3wKwAAUl0nVW/cgXQ==
X-Received: by 2002:a17:903:478d:b0:24c:cae9:77bd with SMTP id d9443c01a7336-27ed4a665camr60071315ad.54.1758840851512;
        Thu, 25 Sep 2025 15:54:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ab640esm35486115ad.128.2025.09.25.15.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 15:54:10 -0700 (PDT)
Message-ID: <ecec5b7d-0cc5-4862-b8c0-e9819f559551@roeck-us.net>
Date: Thu, 25 Sep 2025 15:54:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Hanjun Guo <guohanjun@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250919184025.15416-1-will@kernel.org>
 <778ccdfe-791c-4d67-a7f5-354ea84159dc@roeck-us.net>
 <aNU9FPYAUnBMMznn@willie-the-truck>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aNU9FPYAUnBMMznn@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_155412_447293_A931C2DB 
X-CRM114-Status: GOOD (  15.29  )
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

On 9/25/25 06:01, Will Deacon wrote:
> On Wed, Sep 24, 2025 at 09:09:16AM -0700, Guenter Roeck wrote:
>> On 9/19/25 11:40, Will Deacon wrote:
>>> Big-endian arm64 configurations are vanishingly rare, yet we still claim
>>> to support them in Linux despite very limited testing or visible
>>> interest. Supporting big-endian adds unnecessary burden to reviewers and
>>> contributors which, without any known active users, is hard to justify.
>>> For example, recent work to improve our futex routines and to implement
>>> nested virtualisation support is non-trivially complicated by having to
>>> support both big- and little-endianness.
>>>
>>> Back in 2019 [1], it was claimed that Huawei were using arm64 big-endian
>>> machines in their telecommunication products but I don't know whether
>>> that's still the case and certainly haven't seen any patch contributions
>>> to help support or maintain it.
>>>
>>> Make CPU_BIG_ENDIAN depend on BROKEN as an initial deprecation step
>>> towards its removal.
>>>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Marc Zyngier <maz@kernel.org>
>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Cc: Hanjun Guo <guohanjun@huawei.com>
>>> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Link: https://lore.kernel.org/linux-arm-kernel/73701e9f-bee1-7ae8-2277-7a3576171cd4@huawei.com/ [1]
>>> Signed-off-by: Will Deacon <will@kernel.org>
>>> ---
>>>
>>> Cc'ing Guenter as a heads-up in case he needs to turn down his testing
>>> to avoid this causing a false regression report.
>>
>> Cool, one more architecture to drop. I wonder if I should drop arm64 big endian testing
>> for all kernel releases. That would simplify my test infrastructure substantially,
>> and it would avoid useless regressions due to bitrot for older kernel releases
>> if no one is using it anyway. Thoughts ?
> 
> It's entirely up to you, but I'd suggest leaving it running until 6.18
> is out and then turning it all off if nobody has chimed in to say
> they're using this stuff.
> 

Makes sense. I'll do that.

Thanks,
Guenter


