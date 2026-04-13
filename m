Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC4EEBFD08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 07:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTEWMiKgWWJTQ9Wt/NJF5efY3D+FA4RYVlQMZj0kIcY=; b=SclHbjqWT8YRZZFi43SYY3kx2w
	OdYYkCLkluupnTGKq/3CFDAMWuyb/OFnnyCh3P1PG+bpjbHmFEc5oGVm5BHAgwPhR8mrHsL0f1wxu
	wRNw+t51fOvkF/zlxuAK1nN+crCnSSTYafYb0tsp/FeLGaoBBbpnN6F48EmL0YW/lADQGEwwgF7aY
	XHpA6RNrT9UW3Cim3eyJnBDI7SsWtNDSOjuUlkoUSDAfbnnAgnURRwWKF6kLgxaZj7GvXmgJGUt6q
	rZ6AtqgRmH4VpckUWSu1byj6ljOYHqjwtzNiAiakBOwfrGwME2xIHa432VbY7NO1Bwk2Ag8T5/xag
	SHoDLyzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBRR-0000000F79W-13XX;
	Mon, 13 Apr 2026 07:10:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBRP-0000000F78R-0A39
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 07:10:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso43748965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 00:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776064236; x=1776669036; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTEWMiKgWWJTQ9Wt/NJF5efY3D+FA4RYVlQMZj0kIcY=;
        b=zhMqxkaaIscyvXiu3oI4G7BXdWo2cnlk9kg6ySmOZ3+QaxHuxt5pgpu93ZDFkqPrSM
         ysYW4oWZE1wRjN24edG1MpY0jgAtO0U4sjdjzASFggkzr1TTHO29DCML+lkHNaR2zPUN
         jZ3XqtzbVHiVSu5MCaSlMpKPBWmWGr1Ov+q5C2u8/1zqLmbw12UWDKsMqjnsQ7uddwfs
         t9joLnkcQ2XkVZHQ1lCdbbYzxBXLqo1H+FXR/93a3U68LE8a3Na70vAe/HO+/p898U48
         ZyDYQWSS87F8uLFBEsjsW4Jsd0tWvkPOOGn7D4SK9jDbAI9R6ACRv/MQNb6tHGy+i712
         PHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776064236; x=1776669036;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTEWMiKgWWJTQ9Wt/NJF5efY3D+FA4RYVlQMZj0kIcY=;
        b=bLzvWV77w+wCSnIsTNgCClbDQjaxC6McR2P4/KIit7fq9ZYeboeUoyJ41DK3pp4DeW
         J00EimCYKVRbyGGcwOSo9MFGXA2FzwrH2SKVVCeUrC0L4u16B+9mU5CEvXzqGK8ljXrz
         D2quxtcQnIFmhfllEfWsjjgvyrLxfQFVEO7aSrBTTeBHq3o9mpYqAM+y3E5r4xicNKcp
         z4ub1Nsz2LiQnn2iZ3aBeuCjhf/bjgQ2wQk2JphnQFWNy9GDewTVBvNr1xAakriD6rxz
         Tyj8YNHUXKqSE2tjAjlFppB5FpXepfNYeMEMEkVtAMT1YaGJElxsphnkTqd+4HisGa6n
         PREg==
X-Forwarded-Encrypted: i=1; AFNElJ/7exvksKRagwcFLZNZEIVc4JVsaJG3vGlU3HdDd+KFvb134ieIullfnovcZT8BSL2KWVqmAW393Jex6Jc5/KA2@lists.infradead.org
X-Gm-Message-State: AOJu0YxvEXcahrD8MzJKCM6Xob/JiOmlWsh4ymQPhkTTLdsTNZGBxtV1
	pwU+ScFWmZROV96+xK0dL1fZe2A0DA1iKsaUNYRUNWX6kX8udn4pyfhn3fVNcJePHDc=
X-Gm-Gg: AeBDietRZU8LMrllv0+JcTVCI8QtcTGiJ7tznA2G7bAU6WqmKCLgRt0ibPaPSiFNfGZ
	KX09Qi8qc9aAVVpQZsdhcbr0mgMWROsYqTUBYlVoPM8t/Hz6xZVVabeoS7RkIItdVwqqwROWK9y
	8+7OrcXYAFajwjE7z+vsUxicGF3Crf/HIG3wEYGmslKfxQrDllAPzcdPGYARnVxpu2SE9m1Mi9k
	aZT+meIsk9HqhT+lg1le3IyFVaYy6HqjtW9gog0kCgK12M8qlRPeAyaDn8zlVTiftr9LVQzo7NG
	LP28RDPzFNb6X4JsQ1cLErMKpxKzNNuGineByi5T/7MoMcXtp00fcsy7zOzSCwlBJoKSl9/7kK3
	K34woasSmpN/JUEMhvhSsNP6L9pO+5BrxHFAwoglBJDsumJfzu6udfuGjxMPakRTHry1AIsajcR
	iMT6rnwJMeWVdq7UurHpDCOa95jNe2k13ZnOlmEhf6soQfecaKgTyiPnMtq94aDOw3XDZLXiNlE
	A9rLYwq
X-Received: by 2002:a05:600c:8591:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488d6abe9e4mr118911365e9.26.1776064236236;
        Mon, 13 Apr 2026 00:10:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d538c03esm276356665e9.13.2026.04.13.00.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 00:10:35 -0700 (PDT)
Message-ID: <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
Date: Mon, 13 Apr 2026 09:10:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
 <20260411-spicy-apricot-newt-afa8a7@quoll>
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
In-Reply-To: <20260411-spicy-apricot-newt-afa8a7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_001039_089835_DA3CA14F 
X-CRM114-Status: GOOD (  14.94  )
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

On 4/11/26 11:32, Krzysztof Kozlowski wrote:
> On Fri, Apr 10, 2026 at 10:50:58AM +0200, Neil Armstrong wrote:
>> Hi,
>>
>> Here's the Amlogic ARM64 DT changes for v7.1, including a bunch of fixes
>> and improvements for the Khadas VIM4 and VIM1s SBCs, plus some additions
>> for the Phicomm N1 and a couple of low priority fixes.
>>
>> Thanks,
>> Neil
>>
>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>
>>    Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>
>> are available in the Git repository at:
>>
>>    https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.1
>>
>> for you to fetch changes up to 401e5c73eedde8225e87bd11c794b8409248ff41:
>>
>>    arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-08 14:27:20 +0200)
> 
> Days in linux-next:
> ----------------------------------------
>   1 | ++++++++ (8)
>   ...
> 
> So a few things were just applied, unless this was rebased?

This one has been applied lately, but this is news for me, I always took
in account the time spent in the lists, not in linux-next.
I made sure this one landed at least once in -next to trigger CIs.

So if there’s new rules, we should be made aware of those.

> 
> I will wait with this. It might miss the merge window if v7.0 is
> released this weekend.

Ok wow, just like that... I mean the amlogic DT is stable, all patches
patches bindings checks and none is critical since it mainly touches
new platforms and the incriminated commit is a low priority fix for
10y old development boards...

Neil

> 
> Best regards,
> Krzysztof
> 


