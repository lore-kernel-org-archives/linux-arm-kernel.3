Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180D6CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 10:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzPIUE0kq7RazblEJidW9b7e/wLqz9BuPeB8RaG4tE4=; b=fUDQaorFXSoaQkFR67VKX4S3te
	79MImZJ7VyzXQ6DGQb/RFEcRPTQ/KjRTzArnoINw3srDdnn3DYKhLFGf4B0l3oCpEllEGRlbhD0lg
	AUIkrIAbhd4HSTRFWkIS8Q+l/sZyF38IjcSlc+vjVSmrClqqKxjSwToG+HVhwiK95zC5DfvhF4pDG
	ZiYTysDJx4E9cx2G/f40x5quS3tUliPqCJ3bchZKU/CjLjlLbU8wOoj55TflR1nfknM+JP+UKmWDE
	feItisUHeUsx0MtLa7mzU5eDLUjsViMQAPMC12f/Geplwwojfo0fIpub1rjdSYLWM69tWgZS2aWxK
	eOxJaolA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Age-00000008IbJ-0BJt;
	Fri, 10 Oct 2025 10:49:24 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Agb-00000008Ias-35PD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 10:49:22 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-77f1f29a551so2605891b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 03:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760093361; x=1760698161; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QzPIUE0kq7RazblEJidW9b7e/wLqz9BuPeB8RaG4tE4=;
        b=BIHAlUjd3IOzXXVaQOPK9tFORMDTyutzjcryblPQYhpzPn/yi8i7GTE1MZdxixSW4S
         6iaj/t5OUc7LGYWq9rra071+gZ+/oKwVSeFlJU7qtKA4ESeoWwEj2k87/XwsSdWwMcgN
         yrwNJYDUItS4ETyx8DXDo/H9kwncWTYu61xEpLoQfUngbzFUQ24tOSRs/G3d8ahtPRwe
         AUmbnfc7UOcHPhXvz2BkdDqQMCDpE1vTSlpXrofl+IwXdIMQlUGZDkmqNMv/dI8esVjX
         DAboaS4H14a74gmeIVy6u+Ufnue3i0kGoGAyC7Aqax0G4Xg6ZPpGKKAqS8dW8jSVY0BJ
         qMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760093361; x=1760698161;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzPIUE0kq7RazblEJidW9b7e/wLqz9BuPeB8RaG4tE4=;
        b=jCo16qJlflUFoJRCq7WOPjvnL8/R8pzDZ3esw05KlUsgnxlhQX1Iqe7I0mhC224pLh
         HsnxfgAv2pRAX+nF93qvP2scPuXXw+zvvsDZCBhmC7WQXGvTY+0fPiLFO1MpxHxCvKQF
         SyejpuEJ1RZy/oVARvI8mF+MPspamSDgQx816KPUMtYXRrRkof/rPWGBqG3ryLV5q3cj
         apdpuVXIJMd8R9WXqv//D6bvMXq4x4Tq59nzfsUWIGpJU1n1UYs8GPcEqF2F7R4yDGcS
         K5jTJKwH2fFK3RNlJnDXdqNeadd1jsfNCZAv1WHnxNQd3aq5I3P5RXO+OrDaFOE0+X5R
         hntw==
X-Forwarded-Encrypted: i=1; AJvYcCXkw47yAS8qDz7Qdj9aIwZ14gWTmbBdwE9oSFL5NYmQQN1oLxZuCJVKLbjVFGHYe++mhfCbvBjZEeua/SvrH6yp@lists.infradead.org
X-Gm-Message-State: AOJu0YzOAVTmSnqruR82ZdAKc9SyO2p5kl2sMGUMv2+Yts0Zhat8DJnn
	7JeHy4NDV3CqcGWLm+17RIuSTjMebUTcCcPpTKV9e7c9YFMdnbIgqO8j
X-Gm-Gg: ASbGnctw0ZoiHZ7lw1G3EwOSebOG3Gqf64RVIZNQDIuv290izO70a32t3gN/XilRPZq
	+/OrLHIrOMfaG7I7thyVlKrvdRtc7Qs67kyDezVm1mwsYh1hGXiDPjA1mR7IPMeViqSsp7mt/H2
	BYjbrAzXeusMpVcj1hfqM+I9tbAtMBOrK1wgPnmmMCJ/KPioe6jiK4pDIh1lieeg+9oogz13Duz
	bsXPhWKvJSOowX3437I9nKkAbEzZ9LFMX+5DbAEYR4Kx5wHuyPIhFQVWs5KHnp4oedRklFHdoU6
	Zi8fp/MWrYhKVAuha5qi6jRaYdEyJpL8xBa2qeYp6YdTHVUdyqARZXk9YRu22tjvJb68YeZa6Lm
	AOpJPaoardQmuQm7ONdBTwRp0A4GMDEKQ7kxrRvATyvGTmfhRNU0rs+CycN8VdKq/gF/4Sht+IA
	EG//twNNHKSqwfYA==
X-Google-Smtp-Source: AGHT+IFBvTAbJQG+MxhyANCbjpJn05Ip49+Cj9nha4KjK9n7ztA6cSQ8VpgOYMJmhMkKmcyk9pdApg==
X-Received: by 2002:a05:6a00:80c:b0:782:5ca1:e1c with SMTP id d2e1a72fcca58-7938723daa6mr13371334b3a.21.1760093360826;
        Fri, 10 Oct 2025 03:49:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d2d2e42sm2508787b3a.62.2025.10.10.03.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 03:49:20 -0700 (PDT)
Message-ID: <8424b26a-e267-4481-b027-b372700ccd0e@roeck-us.net>
Date: Fri, 10 Oct 2025 03:49:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] watchdog: aspeed: Add support for AST2700 platform
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, wim@linux-watchdog.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 BMC-SW@aspeedtech.com
References: <20251010080315.816628-1-chin-ting_kuo@aspeedtech.com>
 <20251010080315.816628-4-chin-ting_kuo@aspeedtech.com>
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
In-Reply-To: <20251010080315.816628-4-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_034921_780756_36341107 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

On 10/10/25 01:03, Chin-Ting Kuo wrote:
> Add AST2700 platform support to the ASPEED watchdog driver. This includes
> a new per-platform configuration with SCU reset status register at
> SCU1_070 and support for 5 reset mask registers.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


