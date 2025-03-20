Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D9CC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 08:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+erH12JTFHkGszHXH70kAPUXVCU5rQMoVMOmGYqd4SQ=; b=kPpl00Hr8W+uNoA/ATF0esEF49
	7/5ofJ/zhQIBQUg3E20XKz5R93RpA1U9UGU7dWVrFO4LBWgBgPAVuSyqqqEZxwn4+dZQkyicUAnWc
	My6TOttDH9dIoYjP/vpzG2fLnybN6pmmnZGmxSGZEbODl8UewfoG5oXJ1Vr0yGqF5G0IZESJ9aHKj
	wS0klJIWRtdAa9pzGsyyqtdpAf7Gew1KD9jp9k/FkEttGJXAa3iwsqNo/4xN7qMSAM6/dAe4iFbL3
	a7+ksTzFP8M/L1hv5l18WUaMKeoUmgqbJDn7+PKRvPGkWGdKHEL/ZGcfmIOLsZn7lFoQRpUHA8+9P
	0/HHjgJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBML-0000000BXq5-0UbW;
	Thu, 20 Mar 2025 08:34:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBFQ-0000000BWkc-1cTn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 08:27:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cfe574976so2392095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 01:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742459246; x=1743064046; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+erH12JTFHkGszHXH70kAPUXVCU5rQMoVMOmGYqd4SQ=;
        b=M+5+7LnLI5XhjWDZ731cW2klTxnbn4lg0bNaW5oNQwSUIerlzA9uDmPhUDGEDtt8jJ
         +H7gfO1NGOHE1ePkr8e3qtrbvTECc8KzDWbWcPglHedR+4bdwoSSVHtYhr85EV41HbGY
         TPLA/ibUpK1/e2qD+IrYHDxcqHUWMuDR9PaRQ4bd+ihzK4xdAS60lBwg1TjuITdurpbS
         AYPNchw7I7wciCYZwdgtp25NrpaEcHQV3qthXwyDzpT+mWmZOxCEoLi1g78xWUmrymOi
         RCMe/FmdQ25JwL49uBQAUh3wBYx2C/5hjGyvdH0PtdyZYBbJoY5dkWqeAlR1/DumpG67
         mcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742459246; x=1743064046;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+erH12JTFHkGszHXH70kAPUXVCU5rQMoVMOmGYqd4SQ=;
        b=jvT3k3g6DE6NgsFe4CpoWlT+GgSy/mYe2EWFtFeh5KwMuPyepp/0GONFRtSx2Nbh2f
         eJb2pY6x8an8HvMOmBF/Imak1ui0V1r0KoouBzMHeeQuWC+VzXlWQ0kCk9Bry64h64M5
         CQwmpBZQkmRw/OGFjNJH+iOk3Ddnf6FBk9JWrBpLbifjHYR/sGPQOuw8i1hvpxmSUdda
         ELjAgC55PcSginPkKlw5adywS+GyuiQeJ5TfxM2EMYAvtz1Qim0n6k/jONPcffklGsQF
         99HPeMpXNllR03hHO0yTs7UDabNWEYecz9Q78p41nEtxOJ3uW+j7l5thWxPxAZjBBmIz
         EJDw==
X-Forwarded-Encrypted: i=1; AJvYcCWGWQOqS1KXVeT875T3hhDLOrKI+oLTQf4k7dh4gOGWz+mgcX/bxXkvvIoVYvvVbzL+hMDC7VkRia1R1KnghYP8@lists.infradead.org
X-Gm-Message-State: AOJu0YwQU5MSVM+q3omX0MM9YMLe4+lhWhMKcl2gIcNJ5C3GN0rxwOV3
	JK9+sq7pX+vy46IhSGmAjrZoDXORbhsqpSfzNc8ExkDs9Q63zOuuztTBLcenIMXOJNXUZdGw70Z
	O
X-Gm-Gg: ASbGncv5Y/+2+dSzLTVNCDK8rbiYXts8CBfmhmAgbJjjIym/QYcklXWQNUMrH16N8NF
	x7iNIqC8z2Blf4OKH7aAfcs90KtmzYZQq9rxFAm/IRkmoLwIYq4myhkkAYeARzsboIX7kJYSqqh
	4lZ+7o1InhsgxXZSjZkrnuC09iFcg/jF4UK4CQ9t+dNRQbCVRv1riUpkWPxrh/dpjkuPNO4oV9j
	brCRG8don1cdjt/4FvsZa5uEz1IOt7VqSYGnu9BjeNVaISZPKTcYqgTHK5gwQelznnMWnWpsqAd
	CVEyA4vOFstL2G+C5vKhpKj+0SwiorO7LrSnsziDtmY/0wLmFMcwh4Do36gCNTKEbSdn8xufnlF
	6nE4XkEZKanhF0DAL3Bg0xBqO+g==
X-Google-Smtp-Source: AGHT+IF9ntj9rVCuYJmVSLlknrn3/lHxFJEaoLc1jGC6Y/jMguf0SnRpjv0h4ucU2vCCQxEgs4Fv/A==
X-Received: by 2002:a05:600c:4e0f:b0:43c:e9d0:9ee5 with SMTP id 5b1f17b1804b1-43d437937a5mr57216825e9.18.1742459245849;
        Thu, 20 Mar 2025 01:27:25 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:41cf:ed29:6024:4821:e502:e016? ([2a0d:e487:41cf:ed29:6024:4821:e502:e016])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3ae040f9sm55512075e9.0.2025.03.20.01.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 01:27:25 -0700 (PDT)
Message-ID: <49026ae3-bf51-40ee-990a-e1cfc03e0c35@linaro.org>
Date: Thu, 20 Mar 2025 09:27:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.15
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm <arm@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <41ced8db-caeb-4deb-9193-9802fc603180@linaro.org>
 <47683e40-aa0e-4d86-9226-94f7d56f34ae@app.fastmail.com>
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
In-Reply-To: <47683e40-aa0e-4d86-9226-94f7d56f34ae@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_012728_427353_063A3F35 
X-CRM114-Status: GOOD (  13.56  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 19/03/2025 21:57, Arnd Bergmann wrote:
> On Mon, Mar 17, 2025, at 17:13, Neil Armstrong wrote:
>> Hi,
>>
>> Here's a changeset for Amlogic ARM64 DT, also switching to the new PWM bindings,
>> adding pinctrl support for Amlogic A4 SoC with a brand new binding style then
>> finally gpio_intc node for Amlogic A4 & A5 SoCs.
> 
> I'll skip this one for 6.15, seeing that the branch contains both
> driver and devicetree changes, which messes up the way I send
> the contents.

Sure, I can strip out the pinctrl DT changes, since they can definitely wait another cycle.

> 
>  From the description I also can't tell to what degree there is
> backwards compatibility in the new binding, I assume the changed
> PWM and pinctrl drivers continue to work find with the old dts
> but not the other way round, which is why you sent them together?

For the PWM bindings, they are in -next for a long time already, and
everything was done to keep the old bindings still work over time.

So we're pretty confident it works fine since it has run over CI for
multiple months.

I'll resent a new PR without the new A4 pinctrl changes.

Thanks,
Neil

> 
>       Arnd


