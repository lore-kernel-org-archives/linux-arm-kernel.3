Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72724D58D40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNSe8A4X72eX+krq9irFan2BInCT8GLtodoqFddP0BY=; b=MTUWcVok45hhthi6ic57ohVk7X
	SU3gHma8HIILHHx07NPLVJiAlEaTcnAMcf6hO+My55THw4FSNkeUttwJIro2OLPO164NxnjSUudHl
	j51T4LQyHBikvfvKxr95yqn79RaxP8iGmV2LKsyR2Crn5v7ex4yDdYRQKqCn4k+WDEjTSqBbGQrhm
	8iWq5u7T9pB/foCCcF7ds6P4q5XJ7bjiy8Arl+sQSXFXJj7lPJ/1zdqUu7f76bzYOipqNAniQfEy/
	oUQIx8nGowYDYCzWnBP7/O1VL7DnWquVG4bZ/VChLAnr7Ijk1kNupFXVEac8gEZC3Rcz6PTOMKxto
	Pep4oMZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYxj-000000086Mo-2nqw;
	Mon, 25 Nov 2024 13:17:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYwl-000000086Bw-2Wua
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 13:16:12 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38242abf421so2966483f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 05:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732540570; x=1733145370; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNSe8A4X72eX+krq9irFan2BInCT8GLtodoqFddP0BY=;
        b=lMGBAbdxuq5g+2Sf+xq/SEMIhl7Xafsec7MnKl2Ko3SzAp0jzesEs78V4szeLkCBO8
         QakEs3PDVcDH11Nv2d1zaKknWuNzW43i/Sly/e3Xjyek8DcsjN2oiugzRPdJ85GnOl6M
         cB2UH0xaA7xvPCe2JLP3DZynXyG3IDPHtzmrzi4N1aTSgcISIKFNCzgOcmZuyGgvy2T/
         C5TZYZ8eaNvYxV5jKZ/n4i27oW7yzVBbNthTphV0htAy/pf8VnIsKipttFFw6lJp80Wn
         jsFsVVCmhulKAdpBB0VU00qH2W+nAJ6c8J65GDhfCwse0eQvi2JS+E6smqu55JOneaFA
         9+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732540570; x=1733145370;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rNSe8A4X72eX+krq9irFan2BInCT8GLtodoqFddP0BY=;
        b=QNMl4poQvmfqP+sAueeI+OB6SY5j9ziHClZzqNUDOH8CYQaQ+nK6/SYV8OHhUCmf9g
         KZRw5kVDK3N4CB1JEvht8D9njIZ/HMEhjFwRChq5MMaCaxkAq8I3Rd1puC6IbviIZIcP
         dcTA92+pwGYkcUIDtRD32HDqEeb1RmhwEmBM2bIHktBwFV1kGr5y79F0VKfseQMMGj50
         G24OquGGEpM1cygy4rnlJttIm9fkFLsj1xOh4jPTQ0/WdcYT3GGhZwuu5U5hf0IRpJVK
         WMXK//juYoSRNWwSiGVZWzwdkQWyp/6ECFLsZJFBXKGkFcflZmQeZ33rprFsvS7CNtTv
         YM7A==
X-Forwarded-Encrypted: i=1; AJvYcCXkbqFRvmZ15MwumRw+3s7Y+H0nROxoC1izcy4AlwjN7svGvG4Nhk+h1O+N5H+A7dZcRf8v2gVsktYDyjp+dD1E@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt9WFugtxkG/slGTIwdK6v5iurCjm0WHsILSydds5DegdO/o1l
	f67iOpEjPe6BYQnKnFTHsp7MIMPDa1RIXl9D4hcNBsoxlJ6eU9UMBmPnllP6mMM=
X-Gm-Gg: ASbGncvudqgbaWpUn9zOAU9LIzEzb6DJ5UdEINc88qs8+QQ7DVnBpygvK5YScyOLprJ
	toip6mAivtrqI4CKChyZ9zQyb9xvi8QqitVpd5f/YRg5GT1LNA3NuByNDTLtqbbYDzGETyRpNN4
	6Rew59NNgLwcTsCeSTogKgPN4BXrzRZHZ/Miu2bDYRWJQRI1ANORh+p7nNou/gJao4F86tUcN5p
	Rqpe0g8UF89ktJkocIS11R84E5z9B6WalUNqkLbC9kLyGecv84gvz1mGyUPiC6eXzRfyCKFdW+h
	BvUvafXWQRIEmsCZ7SDdv+VjBlE=
X-Google-Smtp-Source: AGHT+IEW90vTWXzKP0+A5/PY4aSbYc0IFzHeJgOYo0pEkGOlAkr3IdZEHYei+L9Azyi/uj4duLGLyA==
X-Received: by 2002:a05:6000:2102:b0:382:3419:46e6 with SMTP id ffacd0b85a97d-38260be1efcmr8739174f8f.52.1732540569999;
        Mon, 25 Nov 2024 05:16:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b? ([2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad60c3sm10632716f8f.2.2024.11.25.05.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 05:16:09 -0800 (PST)
Message-ID: <81e46854-13e1-426f-8e0c-549a36ab5b3d@linaro.org>
Date: Mon, 25 Nov 2024 14:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
 <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
 <c6b0273f-16f3-4469-a4b8-9564f7355400@linaro.org>
 <CAMT+MTS3Nmy=RzsE4wUf=jHBsu8ghyyqpXWPyB8qoR+W3EUscw@mail.gmail.com>
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
In-Reply-To: <CAMT+MTS3Nmy=RzsE4wUf=jHBsu8ghyyqpXWPyB8qoR+W3EUscw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_051611_664865_20A6E65A 
X-CRM114-Status: GOOD (  10.90  )
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

On 25/11/2024 14:14, Sasha Finkelstein wrote:
> On Mon, 25 Nov 2024 at 13:57, <neil.armstrong@linaro.org> wrote:
>>
>> On 25/11/2024 12:24, Sasha Finkelstein wrote:
>>> On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>
>>>> So this controller only supports a single mode ???????
>>>>
>>> Most likely. On all devices it is connected to a single built-in display.
>>>
>>> Ack on all other changes, will be fixed for v2.
>>
>> OK, so instead make the panel driver return this single mode
>> and from the display driver just filter out anything that's
>> not ADP_SCREEN_VSIZE & ADP_SCREEN_HSIZE.
> 
> Not sure i follow, you want the mode hardcoded in the panel driver
> and the controller driver to fetch and return that?

Yes, like a classic panel driver.

Neil

