Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EA2C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 19:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37HtimKr485PbaD3XoteeqWp1nYoQComDij3qR3WGqc=; b=x2rwCdOeExzt3ZUc9d4hPQl3zC
	k2XDGge/UBk1eRR1Wb5fSIRbYa19KvrcUk6csv9W3hfK1TN/FPg/a3Pf/mPq5TKBcE18PL+ofe+SC
	ewZKNaJHAJUVyH744zL4yt6eDx6Fc35fdD3wOJlC2WaDPU6LPEtcJFzowcYSoVc3snvFh9d66TA+I
	+Ov6eMUK1tUN1soJN0tjTfMgw2cZG0cyK9hiUZoniXlXOu69a0kejP/EcVCzcvDOgm5+z90lK5zoA
	vMde11L5RwffBnfbC8lnM97qhFlj6P7LdYFA5zcJ8w56F3n30ygLxLC++UJqEexavhY8yKU78YMBq
	Yy7b0PBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYV6p-0000000Fq5A-1foL;
	Thu, 16 Jan 2025 19:00:51 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYV5Z-0000000FpvM-2NVl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 18:59:34 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3862a921123so960960f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 10:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737053972; x=1737658772; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37HtimKr485PbaD3XoteeqWp1nYoQComDij3qR3WGqc=;
        b=O2ujaGeMHRBM+aLq5mYL1XkqSc0n5J/WcHmhZNvHSpxMqSEvG7W3SLCHGAKQyewWsn
         giEDBG6mam1/6DqAKX3ibHdGsdY/XL4+qAxpvnUQ7lKfKcdqseFu0bMkPVOQBacK/FMr
         ZNATYsQGZ+l7gzdm+5nTYGRGDDjSV9rnLDprwW5uytG7oJIVtJKyB/mVU108P9MuhQzp
         lQHaWeutMLOG2civ87zPshiMgGZfCmz/Z7UoXPertsAywraK9ENY22tozG1MBVZ8etis
         0rdJnZUhr9on8Z4VGHS0IW98qnNo6I32J5MIiqVos9AZbbPcEXW5gMcmsemW2VUlodMe
         5KiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737053972; x=1737658772;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=37HtimKr485PbaD3XoteeqWp1nYoQComDij3qR3WGqc=;
        b=A5bUFRDBxgG4N9p2wlftF69s4u/HryOIiAPH26RKB4dAbdPeJYHt88PFrHuQYD5mGu
         CtmRCR01rsceGGwXjk4Y0gVhV1wZkmTiSgqkXMRmfgtabdQWNPDxhoz3AjPvglDBEI/R
         NtA1yJ/VfsNdgB4cts2ozjaIqsurkXrG2IS+b7C4fe9byM60/o9EdqbqYCjWKrE4EtW6
         V2zwhG84lrehdjqAuz3Yapj43XV+gqzVuHQIdmenqrN2ld5v38J/q15hMLKxI1mP/XEn
         KTrxLlKxNhsp3Ay0YFTXozeyGX0T/OboLJIYQIGJwz6Ou/QasSGrzdrw0DLWagE/T2ed
         XIzg==
X-Forwarded-Encrypted: i=1; AJvYcCVKzOZH/DYrFyS8uDBvMRK3V2/EE4gGrsbmZpIOc883XbgHICsIeR+ceuyaqqcOHfi5LK3QEmUrNGAOZt+fcuv9@lists.infradead.org
X-Gm-Message-State: AOJu0YwOjODSjTIbZOel3YIz+4CW0Ivdjtt8+Ga02aUpvb1lqyPnGOYc
	S0MxnSVgGlRw3eWogyhjByrhyjrxqUmF/j2DJRaeA2lEY8JZukUpBJmn0zGBPLJ6ZU1m1qVrbSk
	X
X-Gm-Gg: ASbGnctdJlv3ZsfVQetmjdFZHV7giIVm45kAVgLjrbv2DTz7qMFRPcDRu45BMzENPUa
	HPNSKWl/0/QNBL+af6GQDDJI1lY6SWDY3u0e+oaX04RqA0BeI8RWZL/icU0ba/nABatTVOo9ZK7
	LcHacldIxtPqsSTXFGaSVdkjEB2iEeulGOzzpuXx7zy6ptSmd2kF3hUXrXy7BkXkEnmuKs2/pUH
	kK8tnevWwJN0ALrp4Vsn7jcox21bmihQ0Gu2B6Rp4VEToTw1yy8pVrN/cTnkCYmIHmoryWGt4OD
	BKaAJ/LRX6DBWtah6l/6ck3eQct8K2fthw==
X-Google-Smtp-Source: AGHT+IH3W6FfvO5MKHlIxezNlbuPTL0ABpO9AzP7DQkWpt737/v72/n+Y0P8KUBuGXfr0M9VdKfUyw==
X-Received: by 2002:a5d:64eb:0:b0:385:f349:fffb with SMTP id ffacd0b85a97d-38a8732c439mr31526672f8f.45.1737053971883;
        Thu, 16 Jan 2025 10:59:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d? ([2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904625f5sm7932335e9.28.2025.01.16.10.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 10:59:31 -0800 (PST)
Message-ID: <6bb8e9c3-5eec-40c4-8685-d016579a04fd@linaro.org>
Date: Thu, 16 Jan 2025 19:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [GIT PULL] Amlogic drivers updates for v6.14
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm <arm@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <d22513cc-c326-443c-982b-78adf755d3dc@linaro.org>
 <724c4e81-184a-489c-aaaa-85c21a19b64a@linaro.org>
 <909e85a4-8861-41ee-8b4b-97d4bad29994@app.fastmail.com>
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
In-Reply-To: <909e85a4-8861-41ee-8b4b-97d4bad29994@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_105933_600707_F3FBE7F4 
X-CRM114-Status: GOOD (  16.59  )
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

On 16/01/2025 17:39, Arnd Bergmann wrote:
> On Thu, Jan 16, 2025, at 16:23, Neil Armstrong wrote:
>> On 06/01/2025 15:25, Neil Armstrong wrote:
>>> Hi,
>>>
>>> Here's the final DT bindings change that will give 100% success in Amlogic
>>> ARM64 & ARM64 DT Bindings checks, with the mmc-slot bindings change routed
>>> via the MMC tree.
>>
>> Gentle ping, it doesn't seem you pulled this PR.
> 
> Thanks for catching this, I had indeed missed it in my first pass
> through the backlog.
> 
> When I first looked at the "drivers" branches, I decided to skip
> it and instead merge it into the soc/dt branch since it's just
> binding updates. I don't normally care which of the two (or both)
> the binding updates go through, but if the drivers don't depend
> on it, I pick soc/dt.

Yeah I was unsure which tree using, yeah next time I'll properly use the
DT tree if there's no C changes.

> 
> When I later looked through the dts branches, I skipped over this
> because the subject said "drivers". I'm now in the second pass of
> looking at everything I skipped originally, and would have
> eventually caught it, but it does help to have you look at what
> I'm doing to ensure it doesn't get lost entirely.

You're welcome!

Thanks,
Neil

> 
>        Arnd


