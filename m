Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB73C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 02:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvhzTaFF4mKlbah7teVvLdI5FxseT4MERMwxNhSA5W8=; b=zhX3HrGgLscSxMqQ74Rv7mRSGY
	SjPaAHZlG0aZoQ9+LVuEzPYNzC1lytlAlHIawaqeuiR52Aiurka9+aSnDOhRcqrj5tq1Ib0TTd9DA
	f+nkk5j76A3H/YtioXrO662bAY5wPTNOO/gMlDsTuP3kJSX/ZHWB30/ATThsMLN+OyaMCpDKBHGw9
	Cdw/CQU3vInFMoXgVFotqNB1IqQmIcGkxfxPuxo4Y3o1wiL7/PSDFnt5kEp2OKwF7wmZcnw4R6vLS
	KmF4OqjCaiOKeTmRlQNT+4njSci96mlggOyzNupGbafWEgQK5GVUnjJgEeT3QjmaTkvOgrtHEtA9U
	2SLOmX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGuO-00000009NOw-3UUo;
	Thu, 30 Jul 2026 02:54:08 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGuM-00000009NO4-2Tvu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 02:54:07 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso287963b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 19:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785380045; x=1785984845; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvhzTaFF4mKlbah7teVvLdI5FxseT4MERMwxNhSA5W8=;
        b=K67HjcxVRrnjOcLwqIM/4WATIOtlXEQj42Mz+43belaRT5kpZD63phm4T7kVPB2fuB
         8lDcNsXpMvJh84blyKB6cJHVk6Lxdb0kLRDynTcwaJp+hyVKrdFdqFG5BSXBd1RCzjRZ
         HUUXREfhNx3jd0QcXRbWNmfIH2lWwibLnWsxX4FSgQ78LEndrjX5z1TBcmGsRzYpA3q9
         10rp50k98rTRHnNwy/TOD+p0PXorMB222B8G0AlNLibpjyu1maXipt2LQJtnzSFIKTiW
         99+oQbUs4Rl2c3kau4nMbd5fBq5MPkWkRx0/ImZTblaQ+lyzrQwhR3dgcu9iQDi/fB6l
         27kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785380045; x=1785984845;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DvhzTaFF4mKlbah7teVvLdI5FxseT4MERMwxNhSA5W8=;
        b=pd41SUKByxTBDNa5ki3sWsc5hmp/oaDMFmIcF5JvluDsHSQHACWrn4N+e43qdv5z+R
         OL8Cda3fsFNK+l4rOfx2GAvpu78+iPjzj3Gshl6pM9TuN7jsPwloqw0NIZT5hFRmD2VM
         QOb/H1wuB94igFsT8pl1KvCKI7YfCwiv4iij691vrBBP4TqoaEYJH8+m2+mM5zjRyWK/
         o8C0mJzLnpJMLhpw6zJeFZVXXctHEfSqpKnAx7YUQJ8bpKuf2lhryXLwwIcHaLPbBlfE
         4EMQxA+/aGKhZXNccvH3rQeqb0FIBZEY+M+fG4esauZFJgI9A5GgHrTGDEST2mnPqj8i
         y1+A==
X-Forwarded-Encrypted: i=1; AHgh+RpwawGcNhSBHY/zSkf2O7MT9UD03i3venCGYrTXYKA1lTt1KaDWg2lvfEKyJhL+aMR2uC9f/FkbqIdaYqSWxr7u@lists.infradead.org
X-Gm-Message-State: AOJu0Yweil6vJPluOe8rXT4kxFvt9B8DUEWI24O/eSzTMX6429XLTyVv
	v8rBM59Frwo/qETo+S+tk7d8BVPa2iJAE23Avr0FwFz5FUVUk2Q5VCu+
X-Gm-Gg: AR+sD10omD3XWFFF5JBXSoPYzfkPOC0VQT6X42n8AoGe+5PsJ7mb32JQ9w5DUvt9eC0
	906j+I7dNwvdF6sTVBbZ45dH+CNXnlt56tY1ZQcgeA15tsFzqTyN1UuN5bv7zc39/W7agExBy3W
	eb88bQ6Lup2TAMP1AZxsAWTZtxxeRQZPEP9ACxLQ75eEZEYRS6xPZYkX6lNM/aMwE1EqFiSxIWK
	vhJvMGi0rblRZZlEZanuX93EBtPuH9QLsdDdCUyib4JQdUN4Zdw+3TQ35Zy5K7eF9Gbme+dDaqy
	v1w9G4LscV4N9SI1dB45Q7l6UzrXioeCgVPKD7fbQqv1cZ+aVMyw2oqt2W0g1NIDMPQOEJKYuYy
	6FA5KvR+T93PUaM0ggMwYCq0jDkBBB5wIHXzZWVayWK39ef5Ei67881gnveq16A7jfgB+7iDTNL
	zC4tqY6hL80sU5eG8wtCqbqN503zqcbAZ5cXKzYE2wX8VYPi1OsTN87H1kjbYjhjtkAmFppDgSc
	VB3rQzQ56pRTw0t/hU9vvJATQv5bGl2kApYTg==
X-Received: by 2002:a05:6a00:428c:b0:847:9d6c:a56d with SMTP id d2e1a72fcca58-84ebde78871mr496822b3a.12.1785380045338;
        Wed, 29 Jul 2026 19:54:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0301b3csm2148213b3a.34.2026.07.29.19.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 19:54:04 -0700 (PDT)
Message-ID: <c175bc7b-aa9a-409e-ba89-b04ecc38dfb7@roeck-us.net>
Date: Wed, 29 Jul 2026 19:54:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hwmon: remove tautological dependency expressions
 from Kconfig
To: Laszlo Ersek <laszlo.ersek@arm.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Cristian Marussi <cristian.marussi@arm.com>, Heiko Stuebner
 <heiko@sntech.de>, Joel Stanley <joel@jms.id.au>,
 Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729215436.2103380-1-laszlo.ersek@arm.com>
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
In-Reply-To: <20260729215436.2103380-1-laszlo.ersek@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_195406_644415_A2FF284D 
X-CRM114-Status: GOOD (  16.79  )
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

On 7/29/26 14:54, Laszlo Ersek wrote:
> Commit 554b3529fe01 ("thermal/drivers/core: Remove the module Kconfig's
> option") [1] obviated some of the "Optional dependencies" (as described in
> "Documentation/kbuild/kconfig-language.rst") in "drivers/hwmon/Kconfig".
> 
> Namely, said commit restricted the valid/possible subset of the full
> Cartesian product "CONFIG_THERMAL x CONFIG_THERMAL_OF" to
> 
>    { (n, n), (y, n), (y, y) }
> 
> through "drivers/thermal/Kconfig". Numerically (using tristate values),
> this set can be expressed as:
> 
>    { (0, 0), (2, 0), (2, 2) }
> 
> Over this set, the "drivers/hwmon/Kconfig" tristate expression
> 
>    THERMAL || !THERMAL_OF
> 
> or equivalently,
> 
>    max(THERMAL, 2-THERMAL_OF)
> 
> invariably evaluates to "y" (2).
> 
> Similarly, with THERMAL having been restricted to
> 
>    { n, y }
> 
> or numerically,
> 
>    { 0, 2 }
> 
> the "drivers/hwmon/Kconfig" tristate expression
> 
>    THERMAL || THERMAL=n
> 
> or equivalently,
> 
>    max(THERMAL, THERMAL=0)
> 
> invariably evaluates to "y" (2). (Note that "THERMAL=0" returns either "y"
> (2) or "n" (0).)
> 
> Commit f37353320ee9 ("hwmon/drivers/core: Simplify complex dependency")
> [2], which is the final commit of the series that [1] is the beginning of,
> cleaned up the hwmon C source code in fact; however, it missed the
> now-collapsed dependencies in Kconfig. At the time of [2], six of today's
> such dependencies were present in Kconfig. Since then, two more have been
> added (such that they persist, anyway): one by commit 4f8d374b770a
> ("hwmon: (max6650) add thermal cooling device capability"), which was
> independent of the above-noted series, and another by commit 9855caf5d4eb
> ("hwmon: add driver for the hwmon parts of qnap-mcu devices"), which was a
> descendant of the series.
> 
> Remove these always-"y" dependencies.
> 

Dependencies such as "THERMAL || THERMAL=n" were supposed to enable the
driver to be built as module or into the kernel if THERMAL=n, and to
force it to be built as module if THERMAL=m. However, both THERMAL
and THERMAL_OF are boolean, so this really does not make sense.

Applied.

Thanks,
Guenter


