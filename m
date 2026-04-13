Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC28EEBFD0A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 07:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cx2a1IZxvXHDsI/lPp8GVBpoyU8uNZ4jofzPVCpCBPc=; b=I4i+lP/6oca/j2yrP7I8otGCpO
	VKc4lU4+/7beiHnrHztsrIZ1s3ioJcIvtWsEbK3jBVLP07pDZzUoHOVCt/pFA4eOcIvD9IgXsgccC
	hjBnx0k/ptqQjhb9lw+NR77flIjX0Kgbf6CwnCo4tpeHwVw9/M/6Xg+OxL026fribeYMcp7Lf0QJp
	TME/VUjZURFPG0f62HF0GkyPsBSzqALKQ3lFzN6zz8kiCnSKLO59Sdgq3e2FTo5Nt6XIRZjLx205Y
	23T4biSoxb2eJpqiE3gfvoNJP/KxARTNfGuqURx/9uudwz8bWbqssJXpJFB0psoaislSpLHpO65mD
	P/ox2R7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBiI-0000000F9Ib-3Cul;
	Mon, 13 Apr 2026 07:28:06 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBiG-0000000F9H2-0RTP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 07:28:05 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d7605ec91so739243f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 00:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776065282; x=1776670082; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx2a1IZxvXHDsI/lPp8GVBpoyU8uNZ4jofzPVCpCBPc=;
        b=ec5Gs+mCvXUI7ydtJsoWH3Q2gc4VshJG6LZf1XTigjN6Rr1EmW1UZvPd3vH2MMedcu
         9ReYJ4S8d7SSxzGsa7SFzicXvYZR9nf5Ax6vFFNsnYD2dQcMnIIHd+LXw9uRON5q0L22
         Y9A7B692R4ojFzVUDS0ZhYOd60e+gbwxXUoeUwxXsEYGVHr8FodKHlwpTHCGogrhXaYD
         iXR0ip1AzR/ZWKIfupVfs5S44etX2TZpmekNC8G7m3061NwRrdN5feJs88lzkc96526t
         iXiQ+CRxkhNIi90PnEvj/X6UVk+fxpWsggXcvZaTvklSZ3F7W6yPo6pKm5UHgrDtpy9k
         Lk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065282; x=1776670082;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cx2a1IZxvXHDsI/lPp8GVBpoyU8uNZ4jofzPVCpCBPc=;
        b=gTQOcLhal7gPc6EK+SPhxanv8rDEqo0f41+bGoYvXnmDFPbM6eUvEF1sUkR0pM4swy
         jTLbndnJoCkfKYk0KhJY7P0CpP5R96CIqQ4HdPKBvLvWg8FjteI8xXNsP7asD5RI3qAe
         IrD9OS2l0M2GwijtqqGBSSrTpfxbOQ/FmBHJmATGAJAJ9s5s//RIlfPF9m/75Rm4p6Ja
         hBg8/Y8VDO30uxI1gnua1OOsfOjuibn2aAGjxicuXNqiLVij3Z0SEmfOnShNBdF60cg3
         JwfoDjY1TVoEBy7Pd1mVvDbVyiP1lA7J12mqSRn7kWMqzft/ebXQDJzEVj65/wQPwGBx
         iWzQ==
X-Forwarded-Encrypted: i=1; AFNElJ86kVG3cYh6KT2OAox5JZjL2s8FCz90OPF2jw9qo693acUVaL/vchO0hWYt/3R43baXhu8/OM3DopHjdhuX6B1T@lists.infradead.org
X-Gm-Message-State: AOJu0YyjMFhERqCd3c4B8aYhjI3d/YTbOv11Kf4BJzDHFxj7dwHZk/ul
	bi8uybGDfuIhCYNQg7p0lzhEZ38QLrAy4x0gXsSip52uUzixsDzNvCbwQibbt4r187g=
X-Gm-Gg: AeBDies4akoqNiHzlDpFN8pQc/3uxgK2bHWfXTBVFJ5PT0j546jnHutuMl8DQ1a3jK4
	Qkg2tQ6+GuStUW69ZSQNz0a8FWPR5/WJn8zd0yQWXXmW+aIiX/DEWaDd7QqqEi5dZl8S4PZmGiB
	R7iwZ9JUcBLUNZx5lB50hXNN5e/jk9nLlF1ZD+WTTWp+52SZyDIyHuOqQqgMAbT101iLVjWs8dV
	bNXF3uHKQQlZmGXtwx7ur9KDRNvB+8SQ9+x4+kEeAc0TDI5nC2lC/eA7OS9mfsI0/1HO1Euax+A
	EYJUsY6wUWXKvkM7VK+g5AIyCsUu9okEBd4mCIkPuIcxOsl0d+fjPZlLu1TdXizRaQSNx+njZky
	9afMVmHZMUsZRJ0ah4fGgIpC1v5nW8+DLIwyXSbbJQSoK3BV200caY4WtqgmnJB3XExop0tbgcU
	pV1vf8/LjKa9u15yvOKTuvqYHagkfb4laJR5ZaXLol05i5Zz76GFXYORvDv6CiFxJo6ZZ+nR7te
	RtqN2ZrkKsxyRoh0vQ=
X-Received: by 2002:a05:6000:2888:b0:43b:3d44:6624 with SMTP id ffacd0b85a97d-43d6427bad1mr17588580f8f.2.1776065281560;
        Mon, 13 Apr 2026 00:28:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2e4csm32927373f8f.2.2026.04.13.00.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 00:28:00 -0700 (PDT)
Message-ID: <96c11b9a-9494-40ae-97c4-af27a721df0c@linaro.org>
Date: Mon, 13 Apr 2026 09:27:59 +0200
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
In-Reply-To: <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_002804_186774_341925B7 
X-CRM114-Status: GOOD (  23.28  )
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

On 4/13/26 09:17, Krzysztof Kozlowski wrote:
> On 13/04/2026 09:10, Neil Armstrong wrote:
>> On 4/11/26 11:32, Krzysztof Kozlowski wrote:
>>> On Fri, Apr 10, 2026 at 10:50:58AM +0200, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> Here's the Amlogic ARM64 DT changes for v7.1, including a bunch of fixes
>>>> and improvements for the Khadas VIM4 and VIM1s SBCs, plus some additions
>>>> for the Phicomm N1 and a couple of low priority fixes.
>>>>
>>>> Thanks,
>>>> Neil
>>>>
>>>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>>>
>>>>     Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.1
>>>>
>>>> for you to fetch changes up to 401e5c73eedde8225e87bd11c794b8409248ff41:
>>>>
>>>>     arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-08 14:27:20 +0200)
>>>
>>> Days in linux-next:
>>> ----------------------------------------
>>>    1 | ++++++++ (8)
>>>    ...
>>>
>>> So a few things were just applied, unless this was rebased?
>>
>> This one has been applied lately, but this is news for me, I always took
>> in account the time spent in the lists, not in linux-next.
>> I made sure this one landed at least once in -next to trigger CIs.
>>
>> So if there’s new rules, we should be made aware of those.
> 
> How is it a new rule? Linus posting from 2023:
> 
> https://lore.kernel.org/all/CAHk-=wgXDTfWFbn-481=it6W_B0KTQsOhdgXL6mweVm6ewtSvA@mail.gmail.com/
> 
> Plus this is simply logic - why soc tree should be the first tree
> exposed to integration issues and robot reports? If soc tree merges
> stuff which was not on next, all such reports will be applicable to soc
> tree as well. That's nothing new about this.

1) It was in next
2) My tree is clean, review and bindings are tested
3) My PR is a minor PR, low priority change, low impact, no risk

There's still people sending commits to Linux which didn't even go to the lists,
so it's irrelevant to apply this vague rule to me in a strict way with not reasoning.

> 
>>
>>>
>>> I will wait with this. It might miss the merge window if v7.0 is
>>> released this weekend.
>>
>> Ok wow, just like that... I mean the amlogic DT is stable, all patches
>> patches bindings checks and none is critical since it mainly touches
> 
> You sent your pull very late, just before v7.1, and skipping late
> posting is not a new rule. It was always going late pulls, which might
> make it or might not make it.

Yes I've been late, my bad, not the first time, never been rejected before for that.

> 
>> new platforms and the incriminated commit is a low priority fix for
>> 10y old development boards...
> 
> I did not check which commit was not in next. You can provide feedback
> to my reply with actual argument, because such explanation was missing
> in tag. Instead you decided to be surprised that patches needs to be in
> next...

No, I'm surprised because there's still a lot of subsystems not in -next
and I've always made sure my tree were in next before sending PRs, were
building properly with no warning and bindings checked.

Neil

> 
> 
> Best regards,
> Krzysztof


