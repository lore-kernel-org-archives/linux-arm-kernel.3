Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B48DC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njrMv7/v3hrxrqYA6u5qEwMI8KFQ0dRUo1yYjGE3JFk=; b=5CJEz98ovYnzt0a0r63nWQiilD
	G2zDkDJGvdhg2ajuyXYq/VJFHr1KMH6UUjMtBHOgUMmjqkgVhz1bVZVJ+uVgLLx8+ds0vjGYzdEXv
	zubCr/vE6dP1suYlfkkRx1ue9kuSPldVwBXmm8Mz1jgHU8S7l+v+tFvJN2O+Va2UA49PXrnWkWIIj
	pYmIBVcbZpRj7vvIr5gqWf4fnLA6Yu9ISM7jyJL+NX5a+FXerE9Wxvaf0tKmpSZkdRFAX2yH0Y4MQ
	+JuHP/lXvds6TsTj4nsgdAZnF/6KLSIvL6XYYkSksf4GrAXfTfpLnGLPIPDB2nEHkxhpeZCa1Pgg/
	dxS0NPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taIDc-00000008VG3-3KKx;
	Tue, 21 Jan 2025 17:39:16 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taICL-00000008V37-2mgz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 17:37:58 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2eeb4d643a5so10708953a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 09:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737481077; x=1738085877; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=njrMv7/v3hrxrqYA6u5qEwMI8KFQ0dRUo1yYjGE3JFk=;
        b=O+HiiKa0BQbZoe5Luo+d++//+Cqjt0od5B0j1FoGD9DY1FjvlW/kIqsNg4ePo3xGEy
         1tT96SzU01EZvIcXYcNh7xiNQS42H3/LD8baSC+CjN8dD8oyMRwULIIOMAtF7f2aHI8E
         iQ2ukVhLrOQvkzvIRNhoLfIsDnC72XKXTCNcDDAz9kFqZaym4NQXOo8Y2ta20vDWtZc8
         F5ZtR6Z8gmNPNOyNk6RIyLifZPKwUCg6xKuk3brRPJryptXk+56/+VWYnxQD+tQU6qE+
         zZo4njbEVn4XpnbhSUQA0OHDkwE6AcBVzqXZCoz0pxbuFC9TtO6sPPdwv2jLMn30xXer
         UmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737481077; x=1738085877;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njrMv7/v3hrxrqYA6u5qEwMI8KFQ0dRUo1yYjGE3JFk=;
        b=ixFnVyuysTPFAyDKqBF9CCm0Z92UFvhiPm3oG13YkbnZ0+w7wONSsmnT9R+wVrMzZG
         18BWmQwRIqU3XcFeCn/QvebeVGg992W0RDefcs9gLa3V0kqF2ega0xMKBoy4gMC8zSF1
         gDoLBCVjoMmcDgljEgAEjlQ3xiPwlaPoz6V9IGBpCtc2k58ioFdky4UHay1svgr6Glrg
         ZEsvsgi+OJCw0h/0/Ca21ZIDgDU+++vb0lXtd6nReUMaGuEgQBH4L0TE4NAOjNYVNJFj
         rKOUhwtfy3A8flgoC8N5XN1OfVj7S1exA+9HRv/BUAyTrI4zejCp5iAxpehe1ghgsOlE
         x5tg==
X-Forwarded-Encrypted: i=1; AJvYcCUBOKJWbNQvw8b+tlaJ9Y5zeuSMS6AgQSzw5KsnyyGuKxrEzkuEKMDPmcYk7F8k5UfJ4UWkBvJazwhmzoV1IlWJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr7vt1NxQku6d31Pzs63Fe2+Azvn4Vmn/ks97J70man2emsKSZ
	vyE5slFzwe3BmJe4j1coG1Ngck0FeIm4tX+70SeAijXGUgzq/GIG
X-Gm-Gg: ASbGnctN/MrB8PTbdJKPB4jEQ1g/lC5+zcNaUcjyrg2KaMK4sc9DgEd/Dt8dkEYkVgB
	6b/sMwOM4BGln3pD/dGH/Us/0Y9rmP8sCIeU2zMl48alGyoCTGkODXgQwTLkjjk38VIrC/VsRkm
	H/odkOOmFnjfg8f/wM0qzqad5gyvejqbwdK9+nF1B7RtSzFkvrhpC2M5vhS436nYXctGqbN4sI/
	qlTJ3hHM5hQLe6ixTiQLL2yvtIGHyKH5rEd5OaOYZCwCmd+nrCXOxrEHeWb7yMdNX722TRgzE9Q
	s+6HFvxo6U0a89AelMkAYRvcMDXb7gvOto5xQ/0+vd8=
X-Google-Smtp-Source: AGHT+IEJOI4zC1nxoJutJ0GIn7T5vVTBsqgozLgVRkp1XHIsrJ/AQjPAJdeaf4DFlti33uVCSnqVhw==
X-Received: by 2002:a05:6a00:4fd3:b0:72a:8461:d172 with SMTP id d2e1a72fcca58-72daf9becfamr29107128b3a.3.1737481076941;
        Tue, 21 Jan 2025 09:37:56 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabace1bdsm9639120b3a.171.2025.01.21.09.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 09:37:56 -0800 (PST)
Message-ID: <d945ddc0-06e9-4ca3-a9c3-c19dd9457d15@roeck-us.net>
Date: Tue, 21 Jan 2025 09:37:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/21] hwmon: Fix the type of 'config' in struct
 hwmon_channel_info to u64
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Armin Wolf <W_Armin@gmx.de>, Huisong Li <lihuisong@huawei.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
 oss-drivers@corigine.com, linux-rdma@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linuxarm@huawei.com, jdelvare@suse.com,
 kernel@maidavale.org, pauk.denis@gmail.com, james@equiv.tech,
 sudeep.holla@arm.com, cristian.marussi@arm.com, matt@ranostay.sg,
 mchehab@kernel.org, irusskikh@marvell.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com,
 louis.peens@corigine.com, hkallweit1@gmail.com, kabel@kernel.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 alexandre.belloni@bootlin.com, krzk@kernel.org, jonathan.cameron@huawei.com,
 zhanjie9@hisilicon.com, zhenglifeng1@huawei.com, liuyonglong@huawei.com
References: <20250121064519.18974-1-lihuisong@huawei.com>
 <03b138e9-688f-4ebc-bd01-3d54fd20e525@gmx.de>
 <9add68ac-7d10-4011-9da8-1f2de077d3e9@roeck-us.net>
 <Z4_XQQ0tkD1EkOJ4@shell.armlinux.org.uk>
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
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z4_XQQ0tkD1EkOJ4@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_093757_709539_D6EBFE4E 
X-CRM114-Status: GOOD (  14.65  )
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

On 1/21/25 09:20, Russell King (Oracle) wrote:
[ ... ]
> 
> 1. convert *all* drivers that defines a config array to be defined by
>     their own macro in hwmon.h, and then switch that macro to make the
>     definitions be a u64 array at the same time as switching struct
>      hwmon_channel_info.config
> 
> 2. convert *all* drivers to use HWMON_CHANNEL_INFO() unconditionally,
>     and switch that along with struct hwmon_channel_info.config.
> 
> 3. add a new member to struct hwmon_channel_info such as
>     "const u64 *config64" and then gradually convert drivers to use it.
>     Once everyone is converted over, then remove "const u32 *config",
>     optionally rename "config64" back to "config" and then re-patch all
>     drivers. That'll be joyful, with multiple patches to drivers that
>     need to be merged in sync with hwmon changes - and last over several
>     kernel release cycles.
> 

Alternatively, add another sensor type for the overflowing field, such as
hwmon_power_2 (or whatever), and use it for the additional attributes.

> This is not going to be an easy change!
> 

Neither is it necessary at this time.

Guenter


