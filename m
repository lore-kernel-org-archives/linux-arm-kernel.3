Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9740CCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIRmX8yvWOE0keIC88cl37prTEp8JFShOTj497UPSeU=; b=HENlARW9nPsCuSMTQvmNd6Zga7
	156aSbdEZWeIoMb/5DOe0Rw6v9Jp2UpqG6wmY5IYAdNJl9DgKhKkgHstmsrDPDjg6/qRtwueDTbM6
	NrLxJjg8GPL+InvuIahsz65cCzpPT7HuHyZTEstWPGVvvIS/lrIqR1JgIpSWsQdYDdHdhnrW5iYKy
	TcNnmjQpaqsw8BIGNMMpVatyfrQYDomkkROk3/FRaR29Rt3G1Hbdeh5noThRt4qyFdkqGSqbO8+Hb
	x6UhUBjvycyogNRIMQHn/2WLONpQDfEd7gl9UiZ7UkffdJS7OccnK/IEA2UuIbrY3MShbDYko3Yt5
	GikqvPdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRHr-0000000Drb7-13f2;
	Mon, 11 May 2026 14:07:11 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRHm-0000000DrZH-0tuR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:07:09 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2f00a567cfaso2970437eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778508425; x=1779113225; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IIRmX8yvWOE0keIC88cl37prTEp8JFShOTj497UPSeU=;
        b=YS/XLeOigQdYvAxpVhFbQm4C2l9r6tRKSE7OmXh36QPrj9GhvVFX4IRRypFYb/oPMQ
         04f4NQgkKjyzrvM0c0GF35h/ESQe0xtMFtErRuktiBKIN9pLQ2FdLsvznm1U9cEkb4ue
         zseM2jNI13/wNMOuNra+p3iswGQ+bN/M4X++jp7D//YnGiFvaJ/1zBkQlE2Uwnw3+seW
         dn2DVH6vgmUPJa6LHrHr2NMhoya8Qe0bbXkifvMa1Q0F0LmRfJOjGfTXRbHQ626e/7ev
         gOTt/47nm543WHTC8JGxnXVKXPQB2ibXUSozu9KGknVfHf6IbU+sAvkY6wvYghgOcVrD
         k0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778508425; x=1779113225;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIRmX8yvWOE0keIC88cl37prTEp8JFShOTj497UPSeU=;
        b=kI6faBeK/2MSkV0TO87HpOrX2JiH250myEDeZiySm9YgtXxekrd7pNg0IWOe4pDP7A
         hISdoyZNvObh3tMwJFfiSmtl210LgYu4bJh0eWaD30CgdBr+JoPjDiKHrI4fI9l4aj8u
         1/b7ogzeqyE4m6Y+Clmkn6HKGpHKxUWqYL4yesSWjxibpYR608WwsvnUBQOw+OIElNdb
         flOULrXMCTvn4hpQBP8sDzmxbdV3u3A+oesA1naPwlyEqur2jlPSzqr4H1iGQgiqvJ9J
         S2m/BRLu6bX8GPVmJr8SN2tsbChEpxLFNcxpDa6Zh/yWsbN7HpO9up8H+LL0icMvzn/2
         B8hA==
X-Forwarded-Encrypted: i=1; AFNElJ8GWZkDuQbvYVDW43Ot9SvaJAvU5wXzN1ZVQ9jlkZWmhPAn8Xsvd8BSlvWsMeT+YwaZcd0UqmkKd+BhuRC5hvhp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1Imndzam/a1MzAJX4Kk+rNVWLSDAUT4scsIQDICJSV3HF7etf
	cxlJmhhF3djY7i1tcClVGZ/gaWp/lvATucFBbOjcIY+7uNQH3asLYe9u
X-Gm-Gg: Acq92OEOBbLkH4gcZccwcqARWxmg6iE3h4790eM83Y8STIzn7C4LJhn/zWVTCR+OW7A
	EUwY+Ld2x2z9Zgj7xQ+ZiJQrdY5+pNkYRNTZG6+aw+tG8oaFXi1Vm+VSJn2Yj/AweDJLAs39uWr
	ftJBIDfRaCQ00v6pMiwrzQXmUQwAkVwSTg768ENpd/20oRc94RhK8onnckOIFXpc2UrGz8vdmR9
	RLEzEYBSe5WMZmqdMII/HEjU95OaKk16lLvvYEloWf25vLG6TEL7IZ1xZmyo3NWzamaNUhvZjxO
	/JHzXEdPW2Lt408uKdS4S8GuxoT92dZKuasnTTkakyye9C1H3I/8J67oWkAIMpiRv0TAwmGWAw9
	2g+ZqcotwrlL36OliPvANE5Lgktx/Qxgir6jRjbo3ixyxgTl1A1/gzQr+TUAYQotnlJ0Qi0Vvxp
	4ER6MAjdGToULOxyqGp4uT3sS8rt2gvHgC8GmLUCgx+1I4djtkDIP3jHKwEZssKG4UxyVAqSFd
X-Received: by 2002:a05:7301:4593:b0:2df:498e:811b with SMTP id 5a478bee46e88-2f6e25fb074mr8270299eec.7.1778508425153;
        Mon, 11 May 2026 07:07:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm13979264eec.2.2026.05.11.07.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 07:07:04 -0700 (PDT)
Message-ID: <2b53f8ed-bfd5-47c0-a7da-146726fba593@roeck-us.net>
Date: Mon, 11 May 2026 07:07:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Mark Kettenis <kettenis@openbsd.org>, Sasha Finkelstein <k@chaosmail.tech>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org,
 Joshua Peisach <jpeisach@ubuntu.com>
References: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
 <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>
 <85ea46a7-1136-4ea0-9eec-7dfa465df20b@roeck-us.net>
 <20260511085028.GA192358@robin.jannau.net>
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
In-Reply-To: <20260511085028.GA192358@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_070706_263950_6F50BF95 
X-CRM114-Status: GOOD (  18.56  )
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

On 5/11/26 01:50, Janne Grunau wrote:
> On Sun, May 10, 2026 at 08:29:39AM -0700, Guenter Roeck wrote:
>> On Thu, May 07, 2026 at 09:33:08AM +0200, Janne Grunau wrote:
>>> The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
>>> existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
>>> "apple,t8103-wdt" used by the driver.
>>
>> '"apple,t8103-wdt" used by the driver' is not true. The watchdog driver
>> only supports "apple,wdt".
> 
> It slipped my mind that
> https://lore.kernel.org/linux-watchdog/20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net/
> wasn't picked up yet.
> 

Me too. Applied both.

Thanks,
Guenter


>>
>>>
>>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>>> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
>>> Reviewed-by: Neal Gompa <neal@gompa.dev>
>>> Signed-off-by: Janne Grunau <j@jannau.net>
>>> ---
>>>   Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
>>> index 05602678c070..845b5e8b5abc 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
>>> @@ -16,7 +16,9 @@ properties:
>>>     compatible:
>>>       oneOf:
>>>         - items:
>>> -          - const: apple,t6020-wdt
>>> +          - enum:
>>> +              - apple,t6020-wdt
>>> +              - apple,t8122-wdt
>>>             - const: apple,t8103-wdt
>>>         - items:
>>>             - enum:
>>
>> I second Sashiko's findings that the driver will fail to bind because it
>> only supports "apple,wdt". I would not mind and apply the patch anyway,
>> but the statement in the description is just plain wrong and thus
>> misleading. Please fix.
> 
> I would prefer if the addition of the "apple,t8103-wdt" to the driver is
> picked.
> 
> Thanks,
> 
> Janne
> 


