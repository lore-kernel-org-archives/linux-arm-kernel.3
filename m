Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E9DCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zN4bBjWuku4YGSJ5wJV8vC52FeQTa3WBF3IWa4pnW0k=; b=Cm8ZgPWIq9Nxo7n3ZAAlMWyBA+
	15gOU+PzkLxb8/XzsDgjAyDN/L3UKzcrVFaVv7Y3chXu+omIVCB7yYKEAewe4XlueXLNC59Ac4/RP
	scub2tkkCbNO7m6j7KM/2vScxQuYaRPRUjlgSHNBTeeKnMjiYp2E5cK8YO4IoG44NwuEIMZjkROeh
	/Bz9MgGRkqylkJCvVSwPrD4Cjr3vnOmvrQHdduVFzxniWavo0IIzKis97VzquJ4uzzLDb6ErsYhbd
	rkLoQcNLax+yp+udYUIwY9XRtEsMouOUQlXyZK8xqfB9bFbtD8B4QHi828LmRM4z/jxQkpaw93t+D
	JPFW9eOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZg9-00000004reB-1yl9;
	Thu, 30 Oct 2025 20:55:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZg7-00000004rdn-3SD8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zN4bBjWuku4YGSJ5wJV8vC52FeQTa3WBF3IWa4pnW0k=; b=BGJFrbiO4xTz0lthO82EgzMjEp
	9lm7Pqb0HfFSs9tjeIzNWY/F3/mRJPkTRQxPyY0bx1wDug7ft5yJHWOvzCAg56TGRtJMm31iYkHEr
	lFLEpP6GWVZvIE7fS6gBQheAdid5OLh+cb7cALIm9USXgBocwSzZTJFjVBdL9q9ar/WqIcoIdNXvu
	7iP34IpwroCtRibkbT+hEOPlkFfbPNoKqLhkn5GxT27D1rNoEHQEpnysaL5CVG9o9Bhg1MXkXG7Gf
	2UpBFjOr5eSaM/9wa8S/ZQd+LmsPcIrHw/YxE1SrFWCzG23ivWEB6ZXnKB30xIUMlYDC7WVvEzVXy
	y8ne4I5g==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYoL-0000000A14B-1nVp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:59:55 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3407f385dd0so374748a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761857722; x=1762462522; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zN4bBjWuku4YGSJ5wJV8vC52FeQTa3WBF3IWa4pnW0k=;
        b=eYwlCFp3oSRxMvRvNEBUYZAsniMwEs3iqMnrr9mDDPQOEcckGYFjLzK6v8v2isc78G
         Igc5j8WNOag8t5ohcgBIrVOaGVnxVmxRoNx2JpTsAkjrxZZJqqdFxi+6Sqp1FJDImbXM
         TQjvaUuIgeoBCIrGozYuqhtFJWhH7iGYLO85Ly3iWKF7VfQQXiHi0oaf0MPpeI8JUQRZ
         49UjvdnAykfyx3QJ1OCWIISyxsAVhZh33vnTNS8he/Gw2S+SE5GwPu8rDND0B0NCQDnZ
         SIlxJ7PyTgo/RIgs1IZA/TeNAMUzITryfUIqXJV42mlydl2JX5krvUH8WDy4KaMLnqFc
         h3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761857722; x=1762462522;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zN4bBjWuku4YGSJ5wJV8vC52FeQTa3WBF3IWa4pnW0k=;
        b=vJEudH0/oRqxtW5g7T1AzUJIUY/8r60QGFS7PEaWbHV60i9+YHB9/eubs4DNypOeDH
         U3wVvZXxQcNQkHi1WRhrrugM0yPZVlp3n7Mkh2tfHVWRnfnfPNKtPmUkiqialT2O0NVY
         uay8v8QHoRh4e7fUrq4mGqsgh11Td/1T11AtN/njcOTPDOH7KjTUcjiZwfV09ZZ1MQgd
         uRv8U6hdvSYGD7U1S0P9ZYFYzgXD/f6O9PqDP7PfVNtXSYGTjm45rD+EHf63beA4ODx7
         ty5WzYteIFrH4wm6Sdr5zF8U/VOGwaK/v0hZ+0Ad8ZzOFBKRcUvtsQWvzYmxF60dKxQa
         J14g==
X-Forwarded-Encrypted: i=1; AJvYcCViab8rDOHlY27sUcn2c54h5Yser1WeEirOPPgNtYQIXts6WdO+Fbxwi0jMxFf20nQwy9zTCSuGwN7OJVqDPkOi@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg6wAw7wT5sJPPoa3ePyQy21SqZaEyydqu7EBMPQPaDqoraQbj
	/4JE0XA9coTx1BIEAtr6g2+FyKf9UWTRh8Ed/uuDSAIRYxUhCkoZTDYp
X-Gm-Gg: ASbGnct3DaKjYLbfEzOlyDZGvoPzTo1947cKacBaGCgW8mzhrg3wGCJvxg2PYbR/kJi
	rctb7XMpcm+h7o8iuOSp6/yaVuEG6cN7xlD8ZJ29rk1kJCQjaV0DuL5gGDLqOzMDmuQxzcppG64
	v22yEmwbYXd9Dwn/k+34GR406npb5FLn2Z2lubX2YwW6qTLrCirGg529+AABltZiMFJZxiXhbYQ
	LeiuX0PzPwHJA3tB5aS0QvwGUC1ny0T6JNqnErcwKIbFNJrdEICR/+/dd8CnIETkMxilj6p4r4c
	irJ70SoXypoqcvVNBwLMUqJjryk8XWeS4q0T2iKJf3K6BmMCtSRDofV99GWJzmOqrwsCInieTl6
	Hdv7Gaq89i3nqfO6b7jrhU+hJMLSjftRy/TFMWiwWlzL2Fhoyv+55HJwfYkuIL5XMbw5ZbWRDOq
	sHm0Z6lo3mdgg0aDQ3917Q3lHpBMosyncPmp67U1fIUi6XBUu8
X-Google-Smtp-Source: AGHT+IGTTrpX5NE0hCMUgu+CiuNJR8hM9WwkQlMhpfTOtremrzl3woSoRrfo65WzogsJVDOPBg4/eg==
X-Received: by 2002:a17:90b:4b88:b0:32e:c6b6:956b with SMTP id 98e67ed59e1d1-34082fc656amr1413168a91.4.1761857721722;
        Thu, 30 Oct 2025 13:55:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34050bb4828sm3611307a91.18.2025.10.30.13.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 13:55:21 -0700 (PDT)
Message-ID: <12e946a5-b7d1-46a6-92a2-2b4bb165f671@roeck-us.net>
Date: Thu, 30 Oct 2025 13:55:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/11] dt-bindings: watchdog: Support MediaTek MT8189
 evb board wdt
To: Jack Hsu <jh.hsu@mediatek.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, srini@kernel.org,
 ukleinek@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, chunfeng.yun@mediatek.com,
 wim@linux-watchdog.org, sean.wang@mediatek.com, zhiyong.tao@mediatek.com,
 andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, jitao.shi@mediatek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
 <20251030134541.784011-9-jh.hsu@mediatek.com>
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
In-Reply-To: <20251030134541.784011-9-jh.hsu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_195953_518278_5556F8F2 
X-CRM114-Status: UNSURE (   6.70  )
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

On 10/30/25 06:44, Jack Hsu wrote:
> modify dt-binding for support mt8189 evb board dts node of wdt
> 
> Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>


