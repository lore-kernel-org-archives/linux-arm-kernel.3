Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2218CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0l71D8MFHugq5TyO2rGPUzHlXMYD/GEMQn83W+FG2Y=; b=x9VqwV7bcDjusLJvzjGOoYxFj3
	CbY5TvdrlMY0+V46qeWhTZGShJKVn4m7IIHdU4SixOPIdiyLTxG+7eZgNxItz0J10X2UBTLU33rjZ
	7pIGUiaLoIY9Ow/+fMSTV0k65HeKJ+9Mi5KaKBVC/c2ymboD3eCJ+XdPjoUDuUE8h9kXDZ/eWy/zi
	jleU92TGMyuBtCm8tuZQgbx8k10/rjIDJO7lONWCgxf65NPQNFSW1rEAk8wrSdiEoEkZ3Ty9AY0Gh
	b3dhIa9SoWvKgMBtw+UHA0fToJKU3vV2DOZsTEyABh/tZ657wAqSdY2Uevby1QHzo8VrYO5PttwsM
	/Sm3D68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfOb-000000014zF-1cA9;
	Mon, 08 Sep 2025 17:11:13 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbu8-0000000HMy7-0mwO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:27:33 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-77251d7cca6so3635441b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 06:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757338051; x=1757942851; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=I0l71D8MFHugq5TyO2rGPUzHlXMYD/GEMQn83W+FG2Y=;
        b=Gpm2gfN7faHXFsGqv3zRyQEZXmrWu91pzbF2jCB0/6GEICkxo/5UI/UPfPS8MqvS2g
         7w15eoRraKCnAcBcHtV+rwuOJYcZiEw0Ve7zG0keWCO3EgAvm/2YZvia9fccQsS3oknq
         13rNSRiR2qebzw9s4tQxHW0lNUDwyZxztgKnSQxaF3AHShx4XmV01+Oqa6EfXU70/A5f
         6392R90KBfqvoCdxZ0NQnzjhfmDNVLHt7OU9xwKb1+2//3iHuGM9w+/H/li07MwwW6SY
         A/vV9mwrrmWa2ZDe4JV+htEs5fDox5LsZ0RV+BhaTirbNHpobG0xJJ8eYb3jnHZg9egI
         7zNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757338051; x=1757942851;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0l71D8MFHugq5TyO2rGPUzHlXMYD/GEMQn83W+FG2Y=;
        b=IzefQABtyaNMt5VfgJNbZ7k7U9exgOS1GSP6pR2IEcOH5t37rYxp5h3CYOLNpwJG5F
         UHAcvjhi190vNjXFBBsZe7l+E5ilC69pcGXY2NOdk/wkykrQCcqJ9bHHBKim6gUhc8HS
         pAk6g1SnVZNC0Hj+zK4BdK8Q3TO06RBt50Yn/RgFjFs7nuNtmsdoKeaPCVwwNUC0rS1A
         hXVVtSNfpfMIj2bnqZQr+eFU1Onf5FeNJlMBWkKxFT9kaptaGO9kTjoQGZjMvzYPA9t5
         MqRY/z//w3lGihBIbIKowWTTxoUFMMbYZf3Yt3sHytWFULWyguTQ5xoQtLgh77cmbJdR
         U0FQ==
X-Gm-Message-State: AOJu0YyZgy30PeUp2N1dSmYwJ3Kk+PbrcMvPY7UCCbq4EFcOd6aHZBnT
	YS7vLB0TExaEDdusiCUFCYCErqC/bRUjEoGZ2SUj1E5sRKQa/M3wbw5v
X-Gm-Gg: ASbGncvQxrkDFXLVM23lCGgtDus11W3jGlcImaq30/YJAopQUTma6XIMZSzyeH/l66Q
	w+04dn99k84LxdlhpWpE3MvATYDrJwP/CwsBrryRUoKpRKA9kWOudXGxXXyPXnH1d7/GN+PhWum
	chZvENDffGazwNsmlwdjLXlc8VHXr7lUZP5s6Kg5KprUzt82USYTDPAdYCVenOL+ip7idFI3lOB
	dKovh9MYvuxrLYfHrFiVztCai+eTK7TNrmReVKOjztbBX7u/mYmKtkTG9WYKreVrOY9jIMhfQos
	qvCNOFa1b6bgG2XfdOtv+A2eFXscbaNQU+waRu39Kn9Yh8OxJ6gOBWyssxD3VAtGbL0tkElnt8B
	Zl3eKE7780ylyu4WzLiXCaFbjB1iDAM+y1MRlOeiD2GP05JK5NBjzeTBMq0PC/wlHF0HS+Sc=
X-Google-Smtp-Source: AGHT+IG5mHu1wEH4bpvsyLlzH1twN75NRcxvdgvbm4gluUQV37+2bxa2wzMIMNShSDalyUmEmo85uQ==
X-Received: by 2002:a05:6a20:939d:b0:243:fe1e:2f9e with SMTP id adf61e73a8af0-2533d6029c4mr12013727637.4.1757338051281;
        Mon, 08 Sep 2025 06:27:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a501a94sm29908945b3a.93.2025.09.08.06.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 06:27:30 -0700 (PDT)
Message-ID: <b6cf6192-faf5-4e69-aa62-b3cacfa38f4d@roeck-us.net>
Date: Mon, 8 Sep 2025 06:27:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] hwmon: sl28cpld: add SMARC-sAM67 support
To: Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20250822131531.1366437-1-mwalle@kernel.org>
 <20250822131531.1366437-7-mwalle@kernel.org>
 <83189bf7-6831-4373-a352-2a3a05526e08@roeck-us.net>
 <DCN86WR0CPF1.38V3X1O08VYJG@kernel.org>
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
In-Reply-To: <DCN86WR0CPF1.38V3X1O08VYJG@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_062732_247398_075C500C 
X-CRM114-Status: GOOD (  12.93  )
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

On 9/8/25 00:04, Michael Walle wrote:
> Hi Guenter,
> 
>>>    static const struct of_device_id sl28cpld_hwmon_of_match[] = {
>>> -	{ .compatible = "kontron,sl28cpld-fan" },
>>> +	{ .compatible = "kontron,sl28cpld-fan", .data = &sl28cpld_hwmon_chip_info },
>>> +	{ .compatible = "kontron,sa67mcu-hwmon", .data = &sa67mcu_hwmon_chip_info },
>>
>> Effectively this means that the two chips have completely different functionality.
>> One reports fan speeds, the other reports voltages and current.
>> This should be a separate driver.
> 
> Fair enough. I wasn't sure, the reason why I've chosen to add it to
> the sl28cpld driver was that I don't want to clutter the directory
> with many small board specific drivers. They all have the simple-mfd
> parent driver in common. In the end it's up to you of course, so
> separate driver?
> 

Yes, please. The parent is irrelevant. Functionality isn't.
Thanks,
Guenter


