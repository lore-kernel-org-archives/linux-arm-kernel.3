Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7D6CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 21:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=patX2vIVx2VZdtOMO344MhTz8iIxU1BCXzaQwd8zvfA=; b=WJSRSMoiU8YdTWHyxj8yZwJZmC
	wT8Ts8Q34mIvwACZe/ivA0+a1Owg+/zuFzIxYsEoJyZ0TLzaQwF3FZOhsaNX+dwCE2hk3qWXv/UtL
	8KsskCa8oMrvKFttoBUywqXaHkLuhLA6z4J6AtlKgE7Mk6QYBWPdZhtSJ45dEzPfORTaVytMqUXIT
	q9+FPjjFXv4ARlILHmJTruIxXdhjs9nIfbuPI4vQajhzjGuXBs6mX11WelC3R7so5R/6W5SWRXIkB
	t9er8Bw6PDii0ujl7PiWY+rzSpfjsKm+wWvP56WMmEJPEMdzYo3aiwqG8tMvwa/f9iHOWkKOp32zY
	Ir8C7clA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfX5-00000000bFK-0FYq;
	Thu, 14 Aug 2025 21:30:47 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfST-00000000alg-2yHa;
	Thu, 14 Aug 2025 21:26:03 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afcb7a16441so206836266b.2;
        Thu, 14 Aug 2025 14:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755206760; x=1755811560; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=patX2vIVx2VZdtOMO344MhTz8iIxU1BCXzaQwd8zvfA=;
        b=kmmaua/DEjtrGJXq3DC7N3kn5fhnr7eJHymsEgOfTN+z7PsMI9KQw2eiJTCR7OOUJQ
         oxCm34wNZ7CBpmIP2gJyR4lK+21SkNXVb9z1MWGwXawpsEkFSeRU2BZ78yMaLF9Tpm05
         chpHJtlGmL7JIjLRGQcH6UcQ//DdoQDry4i4nolF7lOQ1Q7h+I1R1s5CwxRcMpQjT5u7
         GwwO0a966+A8aM6DmHBgkFs7WfyXFf3kHNsXfnFSttzy4KX0LQeZE2IzvTqPW/qbkFt1
         EFs1xl7RIJ3QmVQynCx5gAqBnajZJ/QFDgGp6IEz5Dve0nuDursdfub0ej5hX59f4ScU
         VAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755206760; x=1755811560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=patX2vIVx2VZdtOMO344MhTz8iIxU1BCXzaQwd8zvfA=;
        b=UYQSShS3r9PjtfcyAgxiGfnDISUSDekm7gaT8pRYTrWjb+VXBxwhy29fEbbzxXZBFZ
         J4tkDNoedCJfzmB94lG8Uv698HxuleGI0wZjtGD3RbwX6pBT5un/4upZVNatTGbDRhYL
         UNZHh8hlF1msMG5WOobawmpzjcp6XbZu5fvH32Jid7dqYCMlhpmxyEelB5UPiJiNOW1v
         VPc2eDkVSMAjVUdXIKfFfqwJu87xex90b2u3zoLSFSjEFKY41GP4kueFLwhtjISSaFhd
         fDUqJL99kMUBlFdY8/KqKOEA9ifApAiI4Vla9Cckcta+KGfxJW2LPO0luNclSlMNxuwM
         nE9w==
X-Forwarded-Encrypted: i=1; AJvYcCUNEjhs82Irz8G03CARJCt6QlJKbHDBshEl7bBsG1pBXVoF6EV9flVCHux55PnZK8F3kLB0TjlI4HC4iPQs5JGV@lists.infradead.org, AJvYcCXGFGeY3+1PVY6O/yHs6FTgzd3qZifM9O0+i15w2he9O9JY7/WS3os+5SQezSb6lPZCbcFwhRGNvG6QpwUA8Z0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNKPb/1XhpA4I8UWN/3MqNA9yppKMDI/pWUgiicsB05/VvZWRf
	2kSnKvNvzZAjIQynl4jDy+0ihAjuoi98Das7AiyjnhzAireJD12Sras=
X-Gm-Gg: ASbGncvBiSS19r/jmczeLib4PsVVhsFEEDVlfgtDS841BX1u1PlUIVIOJZZDDDBhaoM
	WsXp/5R9Fj/HZuSqCV4hiBToMfCqQ0tMjPx5/KKvq87SjNtgvVs8RUXULkn+ijiX+kCKZHga29U
	FH6BnsPWgRSuDFTtBSd912Gfuaym26QVa1cHfn5/HVTAJmy5/S5CQ0E03j9jBZmpfvKkEqwvoTs
	TP4WjkEQhj6tFi39ar16uybLAAkvbwxh4U+2XPujqlulm670EO0pjdYiHD8h27qSXL8+1vVTQWv
	p/fDnEMqXrQubSFdqvdJK49WXgxoHU8l0qeF9IY7gxuqgEw7Ew3/C18Cb+6lqgEGmQ8v+qd+oiX
	OnueOhJwQcytdaJfMEFgF9dtIY9ZLAVxhQLuL6ijSQWRryuqWHk8/ck2ogdzpcqAW0H4s
X-Google-Smtp-Source: AGHT+IGQBAOe9+pUmD246MgUsug2rRdBSlXKtIWuZA7wf0KueWL/EGJK62RMc4Ud1fidFL3HR4xItw==
X-Received: by 2002:a17:907:3ea6:b0:aec:5a33:1549 with SMTP id a640c23a62f3a-afcb98a1765mr452734666b.40.1755206759611;
        Thu, 14 Aug 2025 14:25:59 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:a367:e001:3d74:b64a? ([2a02:810b:f13:8500:a367:e001:3d74:b64a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0763d8sm2680294866b.2.2025.08.14.14.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 14:25:58 -0700 (PDT)
Message-ID: <09030afe-553d-46d7-bf85-d1c1fa73c352@gmail.com>
Date: Thu, 14 Aug 2025 23:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, Jonas Karlman <jonas@kwiboo.se>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <DC0FTXJNW0KB.3I8DLNHJVL21O@cknow.org> <DC0GRKB9V014.1J7A2PO1B7U8H@cknow.org>
 <816fa42715e8bc4bf538371975f97b6d102a74f5.camel@collabora.com>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <816fa42715e8bc4bf538371975f97b6d102a74f5.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_142601_751224_A107B4B2 
X-CRM114-Status: GOOD (  20.08  )
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

Am 12.08.25 um 15:27 schrieb Nicolas Dufresne:
> Le mardi 12 août 2025 à 14:55 +0200, Diederik de Haas a écrit :
>> Hi again,
>>
>> On Tue Aug 12, 2025 at 2:11 PM CEST, Diederik de Haas wrote:
>>> On Sun Aug 10, 2025 at 11:24 PM CEST, Jonas Karlman wrote:
>>>> This series add a HEVC backend to the Rockchip Video Decoder driver.
>>>>
>>>> Patch 1 add the new HEVC backend.
>>>> Patch 2-3 add variants support to the driver.
>>>> Patch 4 add support for a rk3288 variant.
>>>> Patch 5 add a rk3328 variant to work around hw quirks.
>>>> Patch 6-7 add device tree node for rk3288.
>>>
>>> It looks like I had a previous version of linuxtv-rkvdec-hevc-v2 branch
>>> locally and that also had this commit:
>>> - media: rkvdec: Keep decoder clocks gated
>>>
>>> Is that one no longer needed/useful/etc ?
>>>
>>> And 'chewitt' also had a commit to fix 8/10-bit selection:
>>> https://github.com/chewitt/linux/commit/4b93b05d2ca608bc23f1d52bcc32df926d435c7c
>>> "WIP: media: rkvdec: fix 8-bit/10-bit format selection"
>>>
>>> I haven't tried that one (yet), but did  try an other variant with
>>> changing the ordering in rkvdec_hevc_decoded_fmts but that didn't work
>>> in my tests. (Can ofc be PEBKAC)
>>>
>>> Would that be useful? I do/did have consistent problems with playing
>>> 10-bit encoded video files.
>>
>> nvm about the 10-bit problem. It exists, but it's not restricted to HEVC
>> as it also exists with with H.264 files.
> 
> The referred patch is against some out-dated kernel. In mainline linux with
> have:
> 
> 	if (sps->bit_depth_luma_minus8 == 0) {
> 		if (sps->chroma_format_idc == 2)
> 			return RKVDEC_IMG_FMT_422_8BIT;
> 		else
> 			return RKVDEC_IMG_FMT_420_8BIT;
> 	} else if (sps->bit_depth_luma_minus8 == 2) {
> 		if (sps->chroma_format_idc == 2)
> 			return RKVDEC_IMG_FMT_422_10BIT;
> 		else
> 			return RKVDEC_IMG_FMT_420_10BIT;
> 	}
> 
> Which covers all cases supporte by the hardware. Chewitt seem to add a
> previously missing 10bit case, and forcing downconversion from 422 to 420. A
> downconversion is something to be chosen and applied by userspace, the kernel
> should pick a non-destructive format by default.

Please note that this patch is completely unrelated to this series, as it
is for Detlev's WIP rkvdec2 driver [0] and for H.265 codec only - rkvdec2
similar to rkvdec(1) only supports NV12 and NV15 for H.265 codec and
perfectly matches what is defined at [1].

[0] 
https://gitlab.collabora.com/detlev/linux/-/tree/add-vdpu381-and-383-to-rkvdec-v2
[1] 
https://gitlab.collabora.com/detlev/linux/-/blob/15352e295a0d38bd0450f608e7bbcbf16dfefd6b/drivers/media/platform/rockchip/rkvdec/rkvdec.c#L333

> Nicolas
> 
>>
>> Cheers,
>>    Diederik
>>
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip


