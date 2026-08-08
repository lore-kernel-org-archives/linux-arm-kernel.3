Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14B1C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 00:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jt0bpdMVi/3j/bZABoi0jP8ZxqRZtLjg2lc4An7moT4=; b=ijUUxywpBHp9Fp751r+uvxO2n2
	D+Iy4wi3Eg+IDIF8NYln/0Gm5SDJ5lI4TKLHF+yvYNy8JW3P0VpGpzuKJ1pXZfqO7mD2u9YpMpm3B
	8A1z+oROpYbYPnueIEkFBZ/JZZDNOeWmhdS97WlKp9EZ6MERqWzzwzc2GU12DcfdKva/Fy4A2+jTc
	/6rdkVvctWH2wACknQOEPfTBICgWtghPFORaXxcRrZDLnedTxt1OKG/vConmmQb3dQZZPKGxK8Lm/
	l02STwxPHEzqOGpcfpUmdsS3oWaZoL/vFs3s3GZyadtNy8dMKiCn3xcDJW9Ce0eKzG1mjVQ+HNuad
	nNwcGXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUqS-00000008uZz-22H1;
	Sat, 08 Aug 2026 00:23:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUqP-00000008uYo-1upT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 00:23:22 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ccf2360620so1145895ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 17:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786148600; x=1786753400; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jt0bpdMVi/3j/bZABoi0jP8ZxqRZtLjg2lc4An7moT4=;
        b=Mgq60loaGPy5fuGPogtgL2EHpnVWljrLq8S68J4WSh03QXTbNUFELY3r5T/LwNwl6u
         xf61lgdOkwJDCNLMxqxmQWsCVbJj0B9Z8/ZxwWsAUeD1/SzN+wVY+BpdjsyHsTxhPqsD
         +H6dhhARXRed3VPmrvQSUgkcSadWOtJIk53/su5SJYmxHiPfSB6kr2zcn/lG+d/ZRO3+
         dQ49JViMrJP8eohAV8zYLnj3UQuTGBnfB4BHTtQvZ6kcXiz3UvpAujbOd3d0eZ3cbPoY
         NpisHcNpafaW96qMrBE12IYX+vmbGFJgizLxrdmqUbBZS64rPQyr9IDcC3+/eaii0+OU
         DC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786148600; x=1786753400;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jt0bpdMVi/3j/bZABoi0jP8ZxqRZtLjg2lc4An7moT4=;
        b=TPm8e4zzrLkKb2eiKzLY+Jhbdwn1373XSa7eBY5UT/IGqNEeEOHHs8SL0v1RC8jfJ1
         CNM8YI8shOLyJckUwiiL1wl9RoqfsK/jDuJQEbUzzqOLkYSTM5E8Vq7qgc9ezYVLrfj1
         a16XavDqYqzDpW55l6I2x563ZFzUrpvcoOCvHo8Z7kU1cZ5CLfhTB6Ezmgr3Kum65J4x
         ON4ocnT0l2Sld1VAE8VU+3QGU3qIwrI2N4bjtmaaVG6Fhatpjgn+ntAqHA2BnZmc14ey
         qijz/AYLYYkvg2rs0YhaGNf8vUD/T/+RLZrZeSkfzVNHWqzDNyKOMwCvEt+irHTXFgq2
         VfJQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJIICp1G4QdA8Qo/4mzD4G4uptoikXbzVnqkd7LQ6/q6Y19i8s1LGrHKb6PCu/lKg1cx6TdbXVL2rWWNCjPTmH@lists.infradead.org
X-Gm-Message-State: AOJu0YzkbRSNY72zC0EjByAnZUkIuQrhuU7r5dJkXev9Go7iRUnePEdw
	Sh/qA4qroEPVNxVh6TlvBYHz8uUw4g41e0NI+wuCn0wEXJuvn/muV0KK
X-Gm-Gg: AR+sD12RQMqIRxVv+fIGKXo0sl+LxzFCatWxOcIVGhNnLtZKXDEY3zhLpiapq1qm7XF
	DtRG6V0qnyM1lkKn16qGaAum8B2iqyZs/rAum5kgQF0zFRoPpi4b5AxCTSzpIFUiqQy5Mqod/gs
	uZxBUXQF0aw2KMR0bJiPAJxyE9ITeCRCU2vXjq1zKb5S1pNtXCEGMjIpC3zNX5h+685D/H6kCIS
	UDXgZS7CoObH6FH1+mBjsU8zgigb432qbxGe8AHvm2f4V8tt9cocMm4lvaDTgZpXwE2mH90tqEu
	IqcDuG9jNi4meIxezBKnEjsJBEbUK7mxmNiuqaUtPWztLaZAP/jqfWUtl4yRrt8juJnjjcipIXa
	cY11c0MAOau/5kqO3i0meVhpIbv17PIsW/wU1NrlQ/SDfVyP+0ecoT3+rAbLoRNaUe2rDkQSC+R
	a4Yg47IRa+lyk7nLB3eTDr99VwmrejyAeCiyP4JHD7MrrzmYpB2pN84HzXeong9dFeSxQrLG9sh
	VDNWp/jF5L56aC+3/Jsku6j+7FJZOEamGLnQPvARpsBABW3eg==
X-Received: by 2002:a17:902:ced1:b0:2d0:cc92:f7a9 with SMTP id d9443c01a7336-2d106a1a2d5mr146246905ad.4.1786148599808;
        Fri, 07 Aug 2026 17:23:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4e7e89sm14214285ad.74.2026.08.07.17.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 17:23:18 -0700 (PDT)
Message-ID: <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
Date: Fri, 7 Aug 2026 17:23:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ
 lookup
To: phucduc.bui@gmail.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
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
In-Reply-To: <20260807081652.38692-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_172321_556696_907A201B 
X-CRM114-Status: GOOD (  18.32  )
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

On 8/7/26 01:16, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Instead of only checking for -EPROBE_DEFER, propagate all error codes
> returned by platform_get_irq_optional() other than -ENXIO, so that
> failures are properly reported to the caller.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   drivers/watchdog/qcom-wdt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 49bd04841f0c..a8eb1d8f24f0 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -298,8 +298,8 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>   		wdt->wdd.info = &qcom_wdt_pt_info;
>   		wdt->wdd.pretimeout = 1;
>   	} else {
> -		if (irq == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> +		if (irq != -ENXIO)
> +			return irq;

This is wrong. Check the if() path - the code ends up here if pretimeout == 0,
even if irq > 0.

Guenter


