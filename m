Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F50CC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKAztWAMbkIxg0BaFKadJXM0+B/yzJVqX90pmclYaLM=; b=MJgwzBgyIM1eBXAp4AkeGzLB6W
	P14aVrNtBw38pbMkOs0d2aMuiKgQDUArES8dzVP4JN1ZoSXFbEIurdSgsVgjtJe7AieSXvBWrw5FN
	9eyWacnYy0pNU6sJAnDVaPpw2WDnXgtXlmfhId6U3zhECIO/5I+1wQRe7xchz3pDk8Ivly4tTc9L2
	BoyA1fMpn1H8aQdUtGHp9WsZ0k8IggLHaDffOJosOoMDw18Cy/I8HyyFCypWesommcTDaDwdp844O
	KNUEqUWwRJaVNiDd1nDacso+YxlY0GF/PQ+Wzk3I71dQ3kCBjNT67+4Vl3a0f8S4Gj3arwaN8k81E
	3p6Bs9tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcDb-00000004jcN-0g3H;
	Tue, 15 Jul 2025 09:44:59 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbXn-00000004buX-2MNR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 09:01:49 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso2922570f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 02:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752570106; x=1753174906; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lKAztWAMbkIxg0BaFKadJXM0+B/yzJVqX90pmclYaLM=;
        b=JLP6zZO+d88dHG3qkf6M4PjuLmsxxC3XjfWSrmPUqaEJmaZFv6lYDKqaFIBRjuJEpf
         G2jtyAnUebjGooqlhvfZ3fvMcsu742j0/1Wpebx8I61L4VA+hXiCZzREQ2jZxWYqT7b3
         fogeKG6T1cEGT5LdLaAqQCQ0/jRO2bCOAv/ADnTRcLtwjbXYZpfuHZsjJLSs7b+jNNx+
         eMiwbemBNa3alMfn+s6vIuwEaMN0yeY32pfNgJKGJIU1QAeLA0jrRCRrkK777JGtAZBj
         zrehHQJiO2MowsxnZCjZkAjpw6dEVOJ8H4bfLVK/yEtfNrnEDtUcnuJQ5T+wfKcmGnq/
         7E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752570106; x=1753174906;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKAztWAMbkIxg0BaFKadJXM0+B/yzJVqX90pmclYaLM=;
        b=wnURu5Dg+qcEqVzSxfMf6GwsF93I1eScwuP8KkI9iiItyzWPk+PnH7wk0ZCDIN7kxE
         1vl/QGUVSeOJXlTVmmzNW5JK+1ZpkRtJ4IIFxS2V3N3jrGfZuqPsRR/CJbXnW0jNXUkJ
         p1vhuxVGe9Nl6/pYw4CinzJzb57dNa51KYuWu5Es3BtzMiSMQZP+jplTZ2FjX6+/yhfk
         uiiAd7Rx8fKI0toJbVqUM7DHI6uoGbGglDpdIov/FQAKz0ottMDYgeaDOpZmUHvnDZnY
         5oQg5rOQG64hIQTQ+WVXtq0QPTtecS7A7jQAIZR2f+i+0xIvPABVwBLwlqvIuMngyOUW
         qpRQ==
X-Gm-Message-State: AOJu0YwW+BRo7zbhOsRTkczZ2gfIjmWBCQx8iOjYqg46HkXf9rWuuJdZ
	Usq+mUgwyffULdVpX6noqPwN5IyOGJIbJhqw9GnOtLBJ69tC8bJgyoRAoWAcjS9kUTYoz7hV3v5
	E37Oi
X-Gm-Gg: ASbGncs486G68M8++xD3DcfKipjNbtnSq92VB7FIB/LRVzuCuVBiXVyGDnT9QmN4SAC
	4qglkz7/mixSSwb1e3kfYVYG6M1JlIjPv/IigImerFJQTGT8WKppco5a+eESiVXm91SOwiQzheo
	nxlx1z8bQ1XgFKM2LPLeg5RqrKg6e1qk2xk6PWsmUf3aEEmuXuoWJ3i0cVNW+NscMohUW/t0CHL
	stsMsuPU5SIbEKIQ60ql2yKldsdMNBNp1OPdR9T2QjAXCaUC+En/THBGLgoDQbPqAdbTl0KV2DS
	+w6X8oovsR/jlUxX27fD8YLu9hh6/Ftq8afZdJBToATR1qkcQzikIWY/ee/epbhaBIXI9FrumSL
	ZNOqgsrx4kdPv5UKdf2JHLCZOGUdE/fTd1hkUgBeXJPLY8FlfdA==
X-Google-Smtp-Source: AGHT+IHjdABMGwP4YDfDRViIsowhzhMCSRqyKy2Co98dkY73R43zduNO7uR1yP8yqGGz5RWX6pbVAQ==
X-Received: by 2002:adf:e191:0:b0:3a8:30b8:cb93 with SMTP id ffacd0b85a97d-3b5f357895bmr11563876f8f.32.1752570105679;
        Tue, 15 Jul 2025 02:01:45 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd71ffsm12029434b3a.23.2025.07.15.02.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:01:45 -0700 (PDT)
Message-ID: <3d24641b-7273-4658-ad73-691e621c4609@suse.com>
Date: Tue, 15 Jul 2025 18:31:41 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PWM fan control not working with Rock5B and upstream kernel
From: Qu Wenruo <wqu@suse.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <e9ddcc05-e6db-49b0-aad6-c7873c38c427@suse.com>
 <5271313.GXAFRqVoOG@workhorse>
 <f33da910-7e83-40a0-bfcd-a6131a356358@suse.com>
Content-Language: en-US
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <f33da910-7e83-40a0-bfcd-a6131a356358@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_020147_604533_AC486F75 
X-CRM114-Status: GOOD (  36.33  )
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



在 2025/7/15 18:14, Qu Wenruo 写道:
> 
> 
> 在 2025/7/15 17:19, Nicolas Frattaroli 写道:
>> On Tuesday, 15 July 2025 06:10:45 Central European Summer Time Qu 
>> Wenruo wrote:
>>> Hi,
>>>
>>> My Rock5B board is running edk-rk3588 firmware and (almost) upstream
>>> kernel (6.14.6 kernel from ArchlinuxARM), using upstream dtbs (the
>>> firmware is also switched to device-tree boot mode)
>>
>> Consider using mainline u-boot instead. I think the only ones who
>> insist on edk2 forks are the BSD people, as they don't want to
>> write device drivers. Linux has drivers, so inventing UEFI abstractions
>> for things probably only makes your experience worse.
> 
> Well, having something more user-friendly and more similar to a 
> traditional PC setup is definitely more attractive to end users.
> 
>>
>> Kernel 6.14 is also quite a bit behind and not supported by upstream,
>> you'll likely have a better experience compiling a kernel yourself
>> using defconfig as the base. ALARM likes to roll dice when it comes to
>> their kernel config and then not update their kernels for half a year.
> 
> Thankfully the latest one is 6.15.6, and unfortunately it doesn't make a 
> difference.
> 
> I'm fine compiling kernels for my VMs to run tests, but for the host I'd 
> leave this as the last resort method.
> 
> I'll try the Uboot if required, but no pre-compiled upstream one is not 
> really inviting end users.
> 
>>
>>>
>>> Before that I'm using ACPI mode thus no PMW support, but the firmware's
>>> fan control is working properly although running at a fixed rpm setting.
>>>
>>> But after switching to the upstream kernel and device-tree mode, the pwm
>>> fan control never works.
>>
>> Check /sys/class/pwm, export the pwm associated with the fan in the DT,
>> then manually set a period and duty cycle that corresponds to a period
>> the fan supports. If it doesn't spin, then the problem is likely that
>> there is a disconnect between what Linux thinks the PWM signal is and
>> what it actually is.
> 
> Mind to explain it a little more?
> 
> Not an expert on device-tree, I normally use the board just as a 
> headless VM host.
> 
>>
>> I'm guessing the problem here is that your firmware of choice leaves
>> the clock tree in a bit of a state, and the PWM is clocked from
>> something that's incorrect. If it's not the right clock period for
>> the fan, it won't spin.
> 
> But my bootloader (systemd-boot) is explicitly loading the dtb, not 
> really relying on the one provided by the firmware.
> 
> Or that is not really enough for this case?

I'm a total idiot, the timing when the PWM doesn't work is not the 
change from ACPI to device-tree boot mode, but the timing I switched 
from fanless case to the PWM fan again.

And I plugged the 2pin fan connector to the WRONG PORT!

It's connected to the RTC battery port, I didn't notice until I recheck 
the name of the connector minutes ago.

Really sorry for wasting your time on such a stupid error...

Now it's working again without anything problem.

> 
> Thanks,
> Qu
> 
>>
>> A logic analyzer would be able to tell you definitively whether that's
>> the case.
>>
>>>
>>> `sensors` command detects the fan, and the pwm seems to properly
>>> following the temperature, but the physical fan just do not spin at all:
>>>
>>> center_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:        +80.4°C
>>>
>>> bigcore2_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:        +84.1°C
>>>
>>> package_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:        +81.3°C
>>>
>>> pwmfan-isa-0000
>>> Adapter: ISA adapter
>>> pwm1:            128%  MANUAL CONTROL <<<
>>>
>>> gpu_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:        +79.5°C
>>>
>>> littlecore_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:        +82.2°C
>>>
>>> bigcore0_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:        +83.2°C
>>>
>>>
>>> I'm wondering is this a bug in the upstream PWM code or something else
>>> is missing preventing the fan from working properly.
>>
>> The upstream PWM code definitely works, and has worked for every
>> Rockchip device so far. The PWM fan on my ROCK 5B (mainline u-boot,
>> mainline kernel, mainline TF-A) works just fine.
>>
>>>
>>> Thanks,
>>> Qu
>>>
>>> _______________________________________________
>>> Linux-rockchip mailing list
>>> Linux-rockchip@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>>>
>>
>>
>>
>>
> 


