Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D47C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 14:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUvXvaO0Ss+nXb466/o7COpKXUbAueaXJWixHz+8ykQ=; b=F/0QA+Xgpt6469hJS29bdfp3o0
	ztXuKbSA1xWgdLymjEwTCfBRdjtr13xBNjxdkVIYI9dT4H0eqdk0xOj7ouPyLgvbRGB6JinBYkFsO
	VC48wQk/R6OeNYDHjgrcAV0QeUaCiW78no4Tbhh8fN5xphM6lE/yxkyEUMa+Q/4WbMKoyF9DR3c2p
	TNHxV0t+zKMZEE9Z3mp9u1hLPxwZCwAQm4lBVAZC/IwdPx3fLvC6NoCDCjbXtHz2IlOljkr5I+zqy
	VYCXM++GRBAhzWY1D37l5wdNqCvIlyeOZTDISlVJy6mUani5Z4f6JPlkys2Jtd0NFMiktQmLJi3F7
	855SM82Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabrR-0000000ASIl-0DSh;
	Wed, 22 Jan 2025 14:37:41 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tabq8-0000000AS6n-455N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 14:36:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-216426b0865so121556265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 06:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737556580; x=1738161380; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MUvXvaO0Ss+nXb466/o7COpKXUbAueaXJWixHz+8ykQ=;
        b=lVN9ZV4DZMT+xnxhGHnGy/SrzDip8S+VJNkKWBB4HOdXU289a5xYXIW7tsHZMfOnKh
         eiFo+rB0EvWOpWkLSJS3zVMXE3tk9G5xdifYryALY+1/5hmlR6uftT/Hd0PAtLGlmFAj
         hTvIBQ+g5DnvZAQfOFisuIRtIE2dIhjAKqKOtbP51keaWZ7V5TlDnFcNrERk3TVj6YBS
         6sdMaDR9jaB4kIYIP3uJYBnlDy6Ccxv3CZX7mkMRcmxXYzbW3Q0Kqu7/bo8BL8BnETLy
         SYV7tip0pU1tdasLvadPF6+Po65X1sfgvK/V+iSrzWcf6EKPgADoL0VHdfZPKjCEPsNM
         Tasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737556580; x=1738161380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUvXvaO0Ss+nXb466/o7COpKXUbAueaXJWixHz+8ykQ=;
        b=gGrSBSjKLX1oyyLeeWNsb6fmmbtqJLjjCWlgg6hLV41R6PyFAWilziZ0k/TDVr4ulk
         JDXpR2+9WB1pLaJBTvGNsGqQMzeBPI03kS8+NkUI0uiDMrhnx7V3xNYCMMnAFrz/Ra4t
         YA59HmBslW9Uc8Cyel2IP5Zu6HMNH2IGchuNYB6dgFtqpipQ07px/U/lskVMb8qKJJGV
         19h0bAMyhSFbMERVj065JgQxuz91JvfL8KWUMYbsAhKKjwnuUpU26bzlXUZK1co2iC4b
         X4E/TGX5frge63Id04lzGnr78tcbfN5aSHyCTteUOwVJITSpgQftITJrvJui2RWSUIn0
         8hgw==
X-Forwarded-Encrypted: i=1; AJvYcCVBifAS2vuq7qeylbhBXeAz4ZT7zbX7sumZz1imAuE/f6BHgvB93b1uXM8ja986KvZ2I5G7aDk3WkfZ81FPct7k@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7i+h6cyyy9KBphtSPlyg6Rm8lLmtwpyZYPnMxC2QnCB1SBjRo
	9katAJlFK0oFcrs3Jn4M80e4/iRhLuMVwugi8DNvD+iFIeTOzi0u
X-Gm-Gg: ASbGncuOUFsB2Fnj352bJW904wVkZk/KMmCQwLbmm02fcKHJP/lJ2jqf+1jWPCuehW7
	nTiE4UzKYkY8qc6u745vZW9sSmBCOvfpFBMQfp1Yo+8lpzh7qym2Z5rG05WwZ5R4BCxe7Gl0kwj
	cxIfqI2Rro5bNPuEO3Q1V0Li6BiY5lfvFjuO04tIQbB+z9cAbuHe1HlxJZJ5V7kyAMeUw7sVoWM
	DJ5sAPy+my46BKXyk/qC1qtg1XmKhzk7G8rXaPzN0zP8sfASsCu6VumpLu2vBJ2qy+BRwvvn+24
	zGcS9uvK0QkaZh9pfGX/rGxkiESCN5jQEa6/MMvL8vM=
X-Google-Smtp-Source: AGHT+IE5AzrnFf/Nma9OYi02LQfUZX52yZkuUVNniayLmYZBB0ifS+2Uz1Ehi/Gv2whWoMr2zKYJnw==
X-Received: by 2002:a17:902:c412:b0:215:ae3d:1dd7 with SMTP id d9443c01a7336-21c3540c88dmr336405415ad.19.1737556579588;
        Wed, 22 Jan 2025 06:36:19 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3aca8asm96019665ad.130.2025.01.22.06.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 06:36:18 -0800 (PST)
Message-ID: <4e9d0552-b565-48e0-8183-d9cb5a85c76a@roeck-us.net>
Date: Wed, 22 Jan 2025 06:36:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/21] hwmon: Fix the type of 'config' in struct
 hwmon_channel_info to u64
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "lihuisong (C)" <lihuisong@huawei.com>, linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
 netdev@vger.kernel.org, linux-rtc@vger.kernel.org, oss-drivers@corigine.com,
 linux-rdma@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linuxarm@huawei.com, jdelvare@suse.com, kernel@maidavale.org,
 pauk.denis@gmail.com, james@equiv.tech, sudeep.holla@arm.com,
 cristian.marussi@arm.com, matt@ranostay.sg, mchehab@kernel.org,
 irusskikh@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, saeedm@nvidia.com,
 leon@kernel.org, tariqt@nvidia.com, louis.peens@corigine.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, kabel@kernel.org,
 W_Armin@gmx.de, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 alexandre.belloni@bootlin.com, jonathan.cameron@huawei.com,
 zhanjie9@hisilicon.com, zhenglifeng1@huawei.com, liuyonglong@huawei.com
References: <20250121064519.18974-1-lihuisong@huawei.com>
 <870c6b3e-d4f9-4722-934e-00e9ddb84e2e@kernel.org>
 <d42bf49b-e71b-d31e-2784-379076ebf370@huawei.com>
 <4959c2c0-564a-4e3c-9650-228dede9a1f9@kernel.org>
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
In-Reply-To: <4959c2c0-564a-4e3c-9650-228dede9a1f9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_063621_011184_C5358BEA 
X-CRM114-Status: GOOD (  14.85  )
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

On 1/21/25 23:51, Krzysztof Kozlowski wrote:
> On 21/01/2025 09:14, lihuisong (C) wrote:
>>
>> 在 2025/1/21 15:47, Krzysztof Kozlowski 写道:
>>> On 21/01/2025 07:44, Huisong Li wrote:
>>>> The hwmon_device_register() is deprecated. When I try to repace it with
>>>> hwmon_device_register_with_info() for acpi_power_meter driver, I found that
>>>> the power channel attribute in linux/hwmon.h have to extend and is more
>>>> than 32 after this replacement.
>>>>
>>>> However, the maximum number of hwmon channel attributes is 32 which is
>>>> limited by current hwmon codes. This is not good to add new channel
>>>> attribute for some hwmon sensor type and support more channel attribute.
>>>>
>>>> This series are aimed to do this. And also make sure that acpi_power_meter
>>>> driver can successfully replace the deprecated hwmon_device_register()
>>>> later.
>>> Avoid combining independent patches into one patch bomb. Or explain the
>>> dependencies and how is it supposed to be merged - that's why you have
>>> cover letter here.
>> These patches having a title ('Use HWMON_CHANNEL_INFO macro to simplify
>> code') are also for this series.
>> Or we need to modify the type of the 'xxx_config' array in these patches.
>> If we directly use the macro HWMON_CHANNEL_INFO, the type of 'config'
>> has been modifyed in patch 1/21 and these driver don't need to care this
>> change.
> 
> None of above addresses my concern. I am dropping the series from my
> inbox/to-review box.
> 

If you need help with that, and if it wasn't obvious:

NACK for the series

Guenter


