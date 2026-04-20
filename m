Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3718F5A8A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mY//u7sg+42QXalxUid10GxLcQ4s1uuTMxgqca1+Zkk=; b=w9Syw3Xy+fxT1tQ74E0PhAinv5
	l9qFv6JovD3lcX76OUVLkHm7xVhQF9+JHno2eh3LARhtWmgvBWHYnzCkWNmYasYqIAa0In2HfGWEE
	64mwSePdCi8CqHthJeE/osetmRUvaSM2jk9uH3Ptx/xaXgGrFlGi9fsyyRdiX//ypjXVS0MJ1c3iF
	w7XHK0OxW1OYc/uIkNOqfFfz9DWy140vDacOriXlGRixaFFfxUGiqeAee6C1iNNNNPu6Qi6xiOYWE
	CGYPviT2WibQlJf49Nf1VLXBsX6i0EauEjIh+CRjhjsAHylu7h3MNqo5iRYumzz6Tbc10ivDPvHJ6
	PLcw53BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsTB-00000007UaA-0fNX;
	Mon, 20 Apr 2026 17:31:37 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsT8-00000007UZP-2FPI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 17:31:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso30785155e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706292; x=1777311092; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mY//u7sg+42QXalxUid10GxLcQ4s1uuTMxgqca1+Zkk=;
        b=gROZXcGLyfMFon2RfYOoPwsK2nMWTf2ATyf8QQeBvyCnwoluScjWH810Vfd7OeZD5E
         muAHi8NsF0FBGzcpwyP5A6ihCoeqELKLk9P0QdEN8qFRYm+p7ITqNQ02JnFBKefjsiyC
         HQFsM5CzfB60BNTSst2sGyz7cYddNa4sPgT/Gthz3L2LeYuuvlAUVu7+AhnS6dMY4dRh
         22yVQlG/Zu/voU6LMOJGamNb6Ji6AzW22XCM9L4NRev0aEwjyHgwdYYLP9LMj04r7kkH
         TPvUBFpou4SM2cHK94D5Wm9khy/elmvZUUj+BIS2kXiYSJekg1peVGfO9zaB7XL7b8JG
         xjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706292; x=1777311092;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY//u7sg+42QXalxUid10GxLcQ4s1uuTMxgqca1+Zkk=;
        b=KUfVD5SY0wb5TXg/92cRfN/792G+grglI5O52J9oI66Rlp8hAlJ7HiYqFxyqupXFqR
         kK7NLCIWgjkfFLn62yCbu/zpvCalrzoUruEC78kFrBDElBLAX3MkFLQQfRRDclLW+dlu
         zJuDckSlGeB9sgmHgynX2WFAVfKSsaB4jQ9CsSs/NXCv0QFOJ9WZUITB5ag5sF67+ZqX
         jhljJbGypDnxEM0Q3sqL4HN3T5cfYwDu2lVq9V9DkBTFZMC74Lv8V4jZJ2aw/I0cTxMY
         X0f2kYWiKgmhiyt05hNw/5rPnQfrkh+9X30yqR9JP52MDhcg4H9sZcW1hjAAUL8pPOIt
         0wHw==
X-Forwarded-Encrypted: i=1; AFNElJ+aSf5GiDXGFVpRGFeYOkz4oqGWB5uVex59s7ZX4N5QCdPQHLLBDXHXyiQInsn7UG35Q3vp+SmY1MwBLsR2A+df@lists.infradead.org
X-Gm-Message-State: AOJu0YxdimkfBPauLATjDX6qw5Hipg3dQ3Y4J35u2XM9H4bjHTPiOqi8
	dPeuy85+hoxareEN2iLWslfakbUpiPodDo4ehk/Lve72jOrjlLz9t88Od15xMOyips0=
X-Gm-Gg: AeBDiesi31qKj3/lAWJc1B06xzsjcGSpo8gkWVEIpYkj+9W7ysH9nvOHRfASh2pROT8
	SfooJQlBUSMm0JmKizCtVmoyWrhv6W0a99/7jeIej+HME+vGZK0txscMn0vHFh1nepYzQKMxhLW
	1p3kd2bBdKgt56fyucRfI4bIqse92ORiJAv1DC64qYR5LXfFQwoH3MuHDYq7nF1vR7rZwDrfCQ9
	SKE8CKMSVtHQthlexwJjhmhrGtXAUhpwIcqDUQWIW+rxVsV3Y86CGW6DxOLbfSTTwsigmnTwgCD
	ekpiOMGOCiLl268cdeKIIYkSYCZGtgMeyTp4YrbZkfDN6jQ9NsDhh+c1HVdGQGsQPSp7E1/AD/i
	UhESd9MrVDnT6QAvO9/1apLbht3W3SLDjeavnoggEens59UyLc4GkdTFPJdfEL30eLbm+xpV+6W
	v1/Oouwo0ImuhSSNY/HQADgvA9Pnmd53RBP+aZIf2ohrmM1yZKE8Jbe8eBpimOZfLZQ1k3zg0Dq
	KluP54qLWV/9noHJw==
X-Received: by 2002:a05:600c:c4a2:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-488fb78eebdmr202614535e9.26.1776706291547;
        Mon, 20 Apr 2026 10:31:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:9a74:aa46:4b5c:7fd5? ([2a01:e0a:106d:1080:9a74:aa46:4b5c:7fd5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4633bsm30305685f8f.26.2026.04.20.10.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 10:31:31 -0700 (PDT)
Message-ID: <5d9c1c31-5e89-4699-b910-f5ca2c36260f@linaro.org>
Date: Mon, 20 Apr 2026 19:31:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, arm <arm@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
 <20260411-spicy-apricot-newt-afa8a7@quoll>
 <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
 <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
 <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
 <43ae9d05-5cc9-4f68-933a-99eb744756b7@app.fastmail.com>
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
In-Reply-To: <43ae9d05-5cc9-4f68-933a-99eb744756b7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_103134_619546_E4076F53 
X-CRM114-Status: GOOD (  26.33  )
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

On 4/20/26 17:25, Arnd Bergmann wrote:
> On Mon, Apr 13, 2026, at 09:30, Krzysztof Kozlowski wrote:
>> On 13/04/2026 09:17, Krzysztof Kozlowski wrote:
>>> On 13/04/2026 09:10, Neil Armstrong wrote:
>>>>>
>>>>> I will wait with this. It might miss the merge window if v7.0 is
>>>>> released this weekend.
>>>>
>>>> Ok wow, just like that... I mean the amlogic DT is stable, all patches
>>>> patches bindings checks and none is critical since it mainly touches
>>>
>>> You sent your pull very late, just before v7.1, and skipping late
>>> posting is not a new rule. It was always going late pulls, which might
>>> make it or might not make it.
>>>
>>>> new platforms and the incriminated commit is a low priority fix for
>>>> 10y old development boards...
>>>
>>> I did not check which commit was not in next. You can provide feedback
>>> to my reply with actual argument, because such explanation was missing
>>> in tag. Instead you decided to be surprised that patches needs to be in
>>> next...
>>>
>>
>> And to clarify, I did not say that pull will not make it. Considering
>> the timeline:
>> 1. You sent the pull on 10th April, Friday
>> 2. v7.1 is released on 13th April, Sunday
>>
>> and that people are allowed to take weekends off, then there is simply
>> almost no way that pull can be merged before v7.1 is released, so by
>> definition it is a *late pull*. The policy for late pulls, like that,
>> did not change.
>>
>> Lack of exposure of a few commits to linux-next is only the explanation
>> why I did not pull it while doing last round of pulls.
> 
> I'm looking through the backlog for any missing fixes that should
> still make it into -rc1 or -rc2. Just a few more points to add
> from my end:
> 
> - I had in the past always trusted platform maintainers to only
>    send pull requests when they felt the contents had spent enough
>    time in linux-next already, but I did not have any scripting
>    to ensure this was done correctly.
> 
> - I see that only a few of the patches in the branch got applied
>    during the fineal days before the merge window, while the rest
>    had been part of next-20260330 or earlier. Aside from just
>    sending the bulk of the contents earlier, I think the best
>    solution on Neil's side would have been to send two separate
>    pull requests, for the earlier and the later contents
>    respectively, even if sending them on the same day

I never did a split because I don't have enought changes to justify
2 PRs and I had some contributors & other maintainers activity late
in the cycle.
Anyway I'll make sure to send the PRs earlier.

> 
> - I see that some of the late commits are clear bugfixes that
>    we should still merge as soon as possible. Neil, can you go
>    through the branch and send another PR for anything that
>    qualifies as a bugfix? While by now it's clearly too late
>    for any of the new features, there is no need to delay those
>    any further.

The fixes are clearly low priority, but I can lop over and send them as fixes.

Thanks,
Neil

> 
>        Arnd


