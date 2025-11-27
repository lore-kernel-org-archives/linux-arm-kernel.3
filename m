Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90390CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzNVt4edw+6opeQvEovqvvtpzMRtvUD8paPkTQc5bO0=; b=mzwHpJIj/9ns+GCRvIQpJ8FfwQ
	YkV4B/0QldN0PRj9rFzzKSh4YyDpYAtOuizS5bDGNkHBUxGorjkKQwUS3ulLv3v2bhgpqn+3PqZot
	Ooe8i9c68Xp+2l4uO1+VxGjDaSf40CP4HHf/OouKrw0i0OXWQ8+OyR4HcL1Ht9fF93wjh6e2UTI7i
	Mmk7l24D2qq8Xrl21C4fkZorgD0LjkOaAj02qZdPdA8N0+5PbUzQgogNFlMRcwrpMaqCLYrA5eAfb
	+F0Jb1aCxfKsNVL388ZPvEAHY4n4c55IvHYo7FboZ1Pkff0nEKei4mcbcC8rYScpXva4MQlCtHvfp
	jNlwDZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXvw-0000000GFZg-2a4f;
	Thu, 27 Nov 2025 09:05:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXvt-0000000GFXo-0SX7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:04:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so5145395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 01:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764234295; x=1764839095; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qzNVt4edw+6opeQvEovqvvtpzMRtvUD8paPkTQc5bO0=;
        b=dkym0Z+UdVjWv+jf+fu0Omub1/L9/6Ndp8FDoa3k31Sq9BuNCeq/QNWVKNyf9FdqBa
         9q4oeMF/3HJDe5+uw5XUfxEm/zH9CA1fXJ37UdaaIKsMV4DyPeJ8EPhR1ntUuqAVbd1f
         OzHRdef2y4JRkqBzoZj1DpGKlM8j6VpBn86LNDduWUSEzpV70rvByLDMTEmXW2mKoV46
         QgLU8hcFzVIGezw9d6s39m2w9Nx+208yrmS+CfBQjRqdzF5iRjeNOLbR6NNiLBon0TpW
         86WIZfQF0zbRy/ROaDfx+l6QFxbyCPeGA6rpfFo99AccQOkE2ObhCz3qvnDoDGsPQRDN
         6Qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764234295; x=1764839095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzNVt4edw+6opeQvEovqvvtpzMRtvUD8paPkTQc5bO0=;
        b=Sj/MEGR+qWNZcJG9ckCXsX8nJsHN3GDBLEIZNekn9G6rHnEiL6Fia3Ex7xPgntHqNc
         P59Jr9Nyv7enEoqSC6ihoR5w/sgnNClq0FfEZ38wkiqNboqhQl02axvn7K1VSaQQViaT
         YRaSvRgIb4ekogXGFDO5/QrduYrlprejvYTLpBzDFzuMaTpPnOqoChTKnlimpxf2gqqu
         JKa92s5o0OdujgQuRI7HitLgc2qNyCV4KMkYbXz33pF7JnKaMB3f7pDqeSjpj+5FWwz9
         J0N8cYKY1iNVaTS7dTVVyE1XitQiegF5XUOF2P1z+Fu/P9hhbCW7zzL7AK52J1bYSIY6
         wHSA==
X-Forwarded-Encrypted: i=1; AJvYcCUzZvN4UgTjfTMLmdO67fLz7McP19x/gXzu0mOMv1hXui40CWz8NyVsY9XZAbsJZqMNpPP1xxQOrutmqYor5LbI@lists.infradead.org
X-Gm-Message-State: AOJu0YxJQAHLuEuJuz204hna2Wf7Dhc5+P6h83dCcZonpsPpZ6wQJMXU
	sttjM6da47YSJ5OQOQWlKtBhNZwcY56cY/fE3WppT/jUmHSzpj8z/QEnla4DCG31PxA=
X-Gm-Gg: ASbGncvZ7rEBozuYqxM8lxk5d5yxBJMt7FYofqC57CmHIyvyI04Kvhv4LTSwB55HQcK
	MbREcj0fs3lgxejS/jcjssk1UoX+RKMM3f0EXTo3LxaJXcjxryncGSHAsDjS1XdTePBQGpQPsoN
	jvLqFze9jzBrf6O+GDv+21/yEpvfGeWY5SX14PIXXy77Ca6OzCeiqabFjs2SPOMFAEYahR612u9
	3S0eAuo6FyBsg4jFVtrAr7iNcXeKL8yt6LeTsXbobFBHPCTiZk04k6fBHAWpI8qkS0MZXYTB8aL
	ZaSntqhUXOVL3BaGZtqfS/RlUNb9mvVij9LYvovwWWCIkWUklcmxa8Qc5GdhP6CP6tddBpGdT8r
	40UDOL3mK+6YW1060qbD78KRvLbEXgpgc8JbxyeiXCeuI8TigHMWPvBqJL1mkjnkXOCcMyfguQl
	kq1KfYqlKjxCbYTj0l
X-Google-Smtp-Source: AGHT+IFbciJc0QuPqY8817jh9ayaj34ju268qD8qT/yXzTe2XR/9rQ64lR1MMMrRT5JTdMmt+0pm/A==
X-Received: by 2002:a05:600c:1c25:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-477c114ed70mr327208565e9.24.1764234295194;
        Thu, 27 Nov 2025 01:04:55 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479111438b9sm24372775e9.2.2025.11.27.01.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 01:04:54 -0800 (PST)
Message-ID: <1704827d-f273-4360-bcd5-c18818a85034@linaro.org>
Date: Thu, 27 Nov 2025 11:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
To: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>,
 'Bartlomiej Zolnierkiewicz' <bzolnier@gmail.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 "'Rafael J . Wysocki'" <rafael@kernel.org>,
 'Daniel Lezcano' <daniel.lezcano@linaro.org>,
 'Zhang Rui' <rui.zhang@intel.com>, 'Lukasz Luba' <lukasz.luba@arm.com>,
 'Rob Herring' <robh@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>,
 'Alim Akhtar' <alim.akhtar@samsung.com>, youngmin.nam@samsung.com
Cc: 'Henrik Grimler' <henrik@grimler.se>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 'Peter Griffin' <peter.griffin@linaro.org>,
 =?UTF-8?Q?=27Andr=C3=A9_Draszik=27?= <andre.draszik@linaro.org>,
 'William McVicker' <willmcvicker@google.com>, jyescas@google.com
References: <20251113064022.2701578-1-shin.son@samsung.com>
 <CGME20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237@epcas2p1.samsung.com>
 <20251113064022.2701578-3-shin.son@samsung.com>
 <5a6a749b-b2b7-41bb-bcb4-a2342e7f4e98@linaro.org>
 <015501dc5ea5$0c7dd460$25797d20$@samsung.com>
 <401ed9b9-19a4-4a19-b397-0f353e9f0c97@linaro.org>
 <019301dc5f4a$e9aadd60$bd009820$@samsung.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <019301dc5f4a$e9aadd60$bd009820$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_010457_196085_04D926BF 
X-CRM114-Status: GOOD (  22.32  )
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



On 11/27/25 5:07 AM, 손신 wrote:
> Hello, Tudor Ambarus

Hi!

> 
>> -----Original Message-----
>> From: Tudor Ambarus [mailto:tudor.ambarus@linaro.org]
>> Sent: Wednesday, November 26, 2025 6:22 PM
>> To: 손신 <shin.son@samsung.com>; 'Bartlomiej Zolnierkiewicz'
>> <bzolnier@gmail.com>; 'Krzysztof Kozlowski' <krzk@kernel.org>; 'Rafael J .
>> Wysocki' <rafael@kernel.org>; 'Daniel Lezcano' <daniel.lezcano@linaro.org>;
>> 'Zhang Rui' <rui.zhang@intel.com>; 'Lukasz Luba' <lukasz.luba@arm.com>;
>> 'Rob Herring' <robh@kernel.org>; 'Conor Dooley' <conor+dt@kernel.org>;
>> 'Alim Akhtar' <alim.akhtar@samsung.com>; youngmin.nam@samsung.com
>> Cc: 'Henrik Grimler' <henrik@grimler.se>; linux-pm@vger.kernel.org; linux-
>> samsung-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; 'Peter Griffin'
>> <peter.griffin@linaro.org>; 'André Draszik' <andre.draszik@linaro.org>;
>> 'William McVicker' <willmcvicker@google.com>; jyescas@google.com
>> Subject: Re: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new
>> hardware and update TMU interface
>>
>> Hi, Shin Son,
>>
>> On 11/26/25 9:19 AM, 손신 wrote:
>>>> Looking at the exynosautov9 registers that you described and
>>>> comparing them with
>>>> gs101 I see just 2 differences:
>>>> 1/ exnosautov2 has a TRIMINFO_CONFIG2 register, while gs101 doesn't
>>>> 2/ EXYNOSAUTOV920_PEND register fields differ from GS101
>>> TRIMINFO_CONFIG2 doesn't exist on eav920 either; I simply misnamed it.
>>> However, the PEND register indeed differs from GS101.
>>>
>>>> Given the similarities, and considering the EXYNOS9_ registers rename
>> from:
>>>> https://lore.kernel.org/linux-samsung-soc/20251117074140.4090939-5-
>>>> youngmin.nam@samsung.com/
>>>> would it make sense to use the SoC-era name instead of specific SoC,
>> i.e.
>>>> s/EXYNOSAUTOV920_/EXYNOS9_ and use the latter for both exynosautov9
>>>> and gs101?
>>>>
>>> First of all, as far as I know, EXYNOS9 is not the same as exynosautov9,
>> and exynosautov920 also differs from exynosautov9.
>>
>> See also see this patch, or maybe the entire patch set:
>> https://lore.kernel.org/linux-samsung-soc/20251117074140.4090939-2-
>> youngmin.nam@samsung.com/
>>
>> It's not just autov9 and gs101 that have similar TMU registers (with the
>> two exceptions AFAICT), it's also exynos850 that seems identical with
>> autov9.
> 
> Yes, Do you have any plans to upstream the GS101 TMU code? From what I understand,

Yes, I'm currently working on upstreaming the GS101 TMU code. My plan is to
do the acpm tmu helpers and then integrate the gs101 TMU support with what
will be the new exynos TMU driver.

> Autov9 and exynos850 are unlikely to be upstreamed in their current form.

From what I understand from your email exchanges with Daniel, you're going to
propose a new driver. Is my understanding correct? Do you have a timeline for it?
I'll then follow with the gs101 support.

> 
>> All seem to be part of the same "Exynos9-era" SoCs. Let's think about how
>> gs101/exynos850 TMU addition will follow. Shall one use the EXYNOSAUTOV920
>> registers? That seems misleading. Shall one redefine the entire register
>> set?
>> That won't fly because of the code duplication.
> 
> I kind of admit that.
> 
>> Thus I propose to use the EXYNOS9 prefix for the register definitions, and
>> if there are SoCs with slight differences, that can be handled with
>> compatible match data and specific SoC definitions, but only where things
>> differ.
> 
> However, I am not sure whether Exynos2200, 7885, 990, 9810, 8890, 8895, or FSD share the same TMU hardware layout as exynosautov920.
> So I’m wondering whether the EXYNOS9 prefix should be limited to GS101 and eav920, or if we should consider a different prefix that better reflects the grouping.

exynos850 has the same reg layout as eav920 and gs101 too. If Exynos9-era is
a common terminology used inside Samsung then we should be good to go with
Exynos9 prefix I think. Especially since we have a predecessor, the renaming
tried in pinctrl. But if you're not sure about it, use just EXYNOS_ then.

Cheers,
ta

