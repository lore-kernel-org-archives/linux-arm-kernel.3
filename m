Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F14EBFD0A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 07:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXpz2O0o7IAOiW0wpCsudNdz58SNhf9Y+6JQ1Zpf05w=; b=3xjxFM0ZvtiavhgQ1GYl4i0BQL
	cjS8X+P+HZXcvttzyNszOOBcejqIeHETeTxdQnLeKSrbYjQwtxmvfTNCdqXCkikzVw9HeYDvM64Hk
	K/BGFkzA9gD5/8yDKS7f7+aYk7Ws61soW4Y+pk5PdnpS2sXE2nMObt0nNuIkwQ0vqGLcDB+9xa1pd
	wtll3umPRUjRJRIdtNfwvqOKWsDphnQK92LZYnv1B0AIYA++e2HpLD3WHXSlnxRlsg6Pmw0pPxI15
	ykN0hpSMs3bEZCYmwNfjuWfPD8GN13DO9CYIkBLxeAjgdZ6tTiivgMrP2MNtWpgXqX4ZacmbPBa+V
	EmG1z66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBzF-0000000FB9y-45lO;
	Mon, 13 Apr 2026 07:45:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBzD-0000000FB71-3Ceu
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 07:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=uXpz2O0o7IAOiW0wpCsudNdz58SNhf9Y+6JQ1Zpf05w=; b=i7oSkCuH196utwCkQwy+3S+aWb
	ddQFpggLmjVA7gMt2CZqmIEWx6Kyj3wbSBjCgwYkmwi4G4ahGXRvNNeX4DypSwFkZ/yKdtkzCaLCf
	PGBJvNYWvLSNoZg1aqZfpTWrUPqAFyEMmt542GVCziWIWxRce7lqU0B+cKBiX+0XpgQdakknTd5Hu
	NwDglUqLaoqWGEYNhqTkFEK+cA6uzSwNWBYTLy4ua2zNMA0oXvD8gjYM8rYLJn/oW/ghsLrkNKS6D
	f3RcUER62sb7IqHWBDmjzjM6M2kWe8UAX2K0yeL8OJPpMDmigagUWw82NC6MXPCHiB6XI/QW87PiR
	AKKdXgxw==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBz1-0000000GJCW-1dHq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 07:45:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so51435695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 00:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776066321; x=1776671121; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXpz2O0o7IAOiW0wpCsudNdz58SNhf9Y+6JQ1Zpf05w=;
        b=tLx3Uz2EwQZIqo2M3Lz8eMw5CqIozbMpASkaiisZ2UG1jKkj5m4D6BmuVUl07NnFkO
         DLCTWEg7ge2w2+K+IdGPo8EFUxjTmMShz9UEClWs6EQIUjG4n3pDVjDpJJEoJjR9t82O
         DCvItlAMbJKZ6F9RSGjcFgF46lJe+KVdtAFj3JLlplZaYtlKoi9njSu5E+9yuUNyOW6L
         uuKcwXMAhsRewn8j4HBoEy2FRSEZ0VEOGbAZgUzFhdffbXmi/5qO1U1iWt9J4z4jdPFB
         3G9OisQ6WDS93kGo3pfju8i+hA02LCZme77sKbhXp/WJd4jr53hP50o/32xGZjk1rOXp
         L4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066321; x=1776671121;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXpz2O0o7IAOiW0wpCsudNdz58SNhf9Y+6JQ1Zpf05w=;
        b=JoDD2w8OsM6+LM9zpL7k2fnvZ2hnCuXLi2Sg4cefQCuLZ5h6xFT8PIClkLum0HiVeP
         +8n345XNPxkVHvL4MRbRNzBPkGdO5LuOpqEMDvJ+R26VuGPsSYvP02IdVvYcRX3z0pyt
         jUCYnZHj0GF5Whb9nshp9EAsNOYVrHh6cn7hJLCKIUxTWdTxlhtlsiOx+ltpdDkb0biF
         XNgKNl6ZYDGOt8mIdBRgB/u8fRvxaNP1o32mRjz7JI+aWKVYfK/SZFib9q/3QRSFHESV
         F37hbReMe/A9tGLSJ0hHpHUwSuicIJQNF58Grs1hr8odwkenQ4WnEHjr53uSKAHciDfS
         zEzw==
X-Forwarded-Encrypted: i=1; AFNElJ9JL0dBZaaHFHYAYcN8kDZB6UjZRJeT/2Ou0RV02PKMyNaTd0oio+VpnsF3NWqODvBgQ1L5oZYNTN5gBvTRRkuC@lists.infradead.org
X-Gm-Message-State: AOJu0YyO0iAi/68hFzv+rm1pXXTpjiDlkp5c8jQYsxxtzuaNGfa5kMfY
	es37lfNVwttkDhfMEjEor39Zs+wLo/hORZxcouanM6ruh03JPUI2EiChMx5MX7pBf/Z87TASt3e
	TGniG
X-Gm-Gg: AeBDieuO+StoRvibj24q8pssWKmpfmB0CKigip9LRKelIaUBYilmYhsch/LtyTX1DtM
	eFeDURE1mdveXo5yujctgtvW0Vdb6TLd28XoY8ny4vcYwLKDMpRpILC43A+mNULJj+HbdCSXg4w
	8V+rcy5qhBIExsb37YS2BmABrRrDhpi5xvOMLjxofDVj1LE4ie2NX68VvEeD/CiEMpyMuiBKn9G
	Dw5drZ1zIIAtqVs4qMilleCAOMls7CLZOSpjvc/S5YXLWrzqoDNHbuP8LWqrLn/4z1xXkLLj9j3
	S1WBWqNGqYCdMJA2JdI+qEDYHRqodJa8gf/htaSCKAREKfNHP8jFfZoWfNmGNNxQ9CtjoLyNQHo
	Df2ohj7sEHkPA2KOsJCaPSg9xulR2XdBYnbEfT2JKuL7AEukjEsFQPxCkJGc1VT2DZdY7H/L2cY
	wwDjetHpv3Hpw02zF+ooDh3wOQf004JI2ohruZf4EM5vsSaIASUQipK5b2RFjgB0iyFc6Uac0xG
	AjYrocv
X-Received: by 2002:a05:600c:4215:b0:488:d9ea:3da7 with SMTP id 5b1f17b1804b1-488d9ea3e0cmr86555425e9.10.1776066321406;
        Mon, 13 Apr 2026 00:45:21 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d684b55fsm92669805e9.26.2026.04.13.00.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 00:45:20 -0700 (PDT)
Message-ID: <6adde3fe-7eea-46e7-a6f7-de536f054c06@linaro.org>
Date: Mon, 13 Apr 2026 09:45:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
 <20260411-spicy-apricot-newt-afa8a7@quoll>
 <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
 <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
 <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_084530_677152_ECECD185 
X-CRM114-Status: GOOD (  22.42  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 4/13/26 09:30, Krzysztof Kozlowski wrote:
> On 13/04/2026 09:17, Krzysztof Kozlowski wrote:
>> On 13/04/2026 09:10, Neil Armstrong wrote:
>>> On 4/11/26 11:32, Krzysztof Kozlowski wrote:
>>>> On Fri, Apr 10, 2026 at 10:50:58AM +0200, Neil Armstrong wrote:
>>>>> Hi,
>>>>>
>>>>> Here's the Amlogic ARM64 DT changes for v7.1, including a bunch of fixes
>>>>> and improvements for the Khadas VIM4 and VIM1s SBCs, plus some additions
>>>>> for the Phicomm N1 and a couple of low priority fixes.
>>>>>
>>>>> Thanks,
>>>>> Neil
>>>>>
>>>>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>>>>
>>>>>     Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>     https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.1
>>>>>
>>>>> for you to fetch changes up to 401e5c73eedde8225e87bd11c794b8409248ff41:
>>>>>
>>>>>     arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-08 14:27:20 +0200)
>>>>
>>>> Days in linux-next:
>>>> ----------------------------------------
>>>>    1 | ++++++++ (8)
>>>>    ...
>>>>
>>>> So a few things were just applied, unless this was rebased?
>>>
>>> This one has been applied lately, but this is news for me, I always took
>>> in account the time spent in the lists, not in linux-next.
>>> I made sure this one landed at least once in -next to trigger CIs.
>>>
>>> So if there’s new rules, we should be made aware of those.
>>
>> How is it a new rule? Linus posting from 2023:
>>
>> https://lore.kernel.org/all/CAHk-=wgXDTfWFbn-481=it6W_B0KTQsOhdgXL6mweVm6ewtSvA@mail.gmail.com/
>>
>> Plus this is simply logic - why soc tree should be the first tree
>> exposed to integration issues and robot reports? If soc tree merges
>> stuff which was not on next, all such reports will be applicable to soc
>> tree as well. That's nothing new about this.
>>
>>>
>>>>
>>>> I will wait with this. It might miss the merge window if v7.0 is
>>>> released this weekend.
>>>
>>> Ok wow, just like that... I mean the amlogic DT is stable, all patches
>>> patches bindings checks and none is critical since it mainly touches
>>
>> You sent your pull very late, just before v7.1, and skipping late
>> posting is not a new rule. It was always going late pulls, which might
>> make it or might not make it.
>>
>>> new platforms and the incriminated commit is a low priority fix for
>>> 10y old development boards...
>>
>> I did not check which commit was not in next. You can provide feedback
>> to my reply with actual argument, because such explanation was missing
>> in tag. Instead you decided to be surprised that patches needs to be in
>> next...
>>
> 
> And to clarify, I did not say that pull will not make it. Considering
> the timeline:
> 1. You sent the pull on 10th April, Friday
> 2. v7.1 is released on 13th April, Sunday

Stop this nonsense, there's a very high probability release are done after rc7,
but it's not a strict rule at all.

> 
> and that people are allowed to take weekends off, then there is simply
> almost no way that pull can be merged before v7.1 is released, so by
> definition it is a *late pull*. The policy for late pulls, like that,
> did not change.
> 
> Lack of exposure of a few commits to linux-next is only the explanation
> why I did not pull it while doing last round of pulls.
> 
> Feel free to ignore that explanation and take other one: avoid sending
> pulls a one working day before new release, because it is considered a
> late pull.

I understood your explanation, crystal clear.

Neil

> 
> Best regards,
> Krzysztof


