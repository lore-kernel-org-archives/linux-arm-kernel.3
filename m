Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7476CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 16:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lyug+3qlgRJRhXiV8Js+LFY/rJHmnY0zI7jbnl8sttM=; b=X8OgXsBsObgicaMR/khRSIN8Jm
	vzRohQAn83lLUniz17m3KbujFO34Pi4hwTLqvPA0EXsF3x9MS/pYDUJpJjfajJep8/d1eR9mCE6DZ
	ITcY1gznJj9cYDKzAUvbJTB9FkdmAi+kOlzk5/b4tN+ocOquC+/7TxT6oyXAg/Flg7xTxVXUFa3NS
	awBxcqUxnzaolI+LREkVzuv5Nf4U7ZRIHZn3T+g7YtjHKLmkVPaw+/UMpX2AJKQdpkm6rkmEzacnt
	LWz1HDkX7pkCi6Vvrvy3xp0mN/rmPs1KmB/7otbGfM4jBFDc005k3sZRd6gnw80J4plzdG6Totlv6
	zjN1e4SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolcB-0000000EO3u-3c5O;
	Wed, 20 Aug 2025 16:24:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojuK-0000000E6K7-0svF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:35:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso37093725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755700518; x=1756305318; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lyug+3qlgRJRhXiV8Js+LFY/rJHmnY0zI7jbnl8sttM=;
        b=grSSet/3mXyQzaO1miCpUY1ZquSnQDCGSfxvJsF1RdzfZYK17DHhIKoyJk/LFuUUdt
         A+zKoP/F0vWOXm+3ymuR7P/nX0ufuDYoN8/AQiDc5Zwf+B9fwHC4U4NoZqojuBM0DB4E
         XIYheUcTaGbhEcKAvWfmsQkMKuW/XMHwOuZeMlJtW3jD7UZxBm+d5W0Dr4LgAhuILday
         zX+X5IeMynh+I/xQqN6BnomWofaigk1ZhfLsb5pcXN6fyYmDcO/Doj6oRF2TtD6/qq7y
         yT1DzjvUimJdH7DKggUa/yVj0i6LEgdhPyaXgrw2TWPIJFUssVFXLI5NPxsRuhir590g
         rLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755700518; x=1756305318;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lyug+3qlgRJRhXiV8Js+LFY/rJHmnY0zI7jbnl8sttM=;
        b=AVwdM3Yqly0Oaa6s8POVd63cIKbQo5fVcqVEtf181quFUo9oczzpm7iaya3au9CFL3
         JRFPoX4VUoXXxGaNczpOwq9+pjb1v2HhCVZVXqWCd/vEFZjWAWeVlzTPgOvU9TK3jTN5
         3ZhAW+hwl19n+dY0ACOBA82VxkzJT4AtbF24FSA2FQaOYnXCEpoTowerk901kN5zBSDX
         T77DuSTyf7SwkxaM4d6FCs/2Y/R5lOB/4ucXUcL6AdLBZgDPANbrcGGQAx//pw5A7Jw7
         uMfDBiyCOcRYkGWYKIEF8HIvZx5I/aKsuc6UJ4v0QJJYEmJUW7iobCz1CSvAE+ikX3bm
         4kbg==
X-Forwarded-Encrypted: i=1; AJvYcCV/azt/tUiv32N3bM3BnPFHN/WJMCEbxioe8a6sulh2i+LZKOrPX3/vngI6PuLT9flpwnAMoGcnCIvM3Cfa0PVk@lists.infradead.org
X-Gm-Message-State: AOJu0YxsRxlBUnzMxvfvldUOetLHhom7WaXSobReyDtob5yIcVETIHHd
	e94dfgIUykWwxpLi5woqJQocrpXuJ44Iz6GJI8lhFQ3HMJI+EI1eW9K+SEeSM8zGPEs=
X-Gm-Gg: ASbGncuEoQoXLH55wEnD3I0iXykO5q9lUU3bhfsKFGMtxLW4hKqrsm5tJXtwlT6gKPg
	4daIHVuxf5iS8V3dFXzJ3t0tcHp/cDBHF2S7HjxDvTR4ulNIvuTJnfcJXag1HMK1iJ3E+JHBIvQ
	7smv+YDVZfd+HLV3XgpKwe8oObD1z5+FVWd3VWdA+bgopIcOMHPYPKXGqsdeWfZsYXki5SHLGKt
	4NJnJL+EtlyN1EHGx1EOsZLc5Y8HICDB8WPXH931qwK8oIWgw7slTSTmbK3JXqP4bCP+noVNPJA
	6Bd66DpHDi8L4PpkSIbBehGBb0NUd6nzQiEn2mVcOjpIMpsoTP9P3OJ/Yxnv1WfDr+P20nG3szc
	p6d5mfUDyETFvyQ9oTFWHQYlMgYSvvHkRHLc820543qMDXre8+lIT8AyZO+5fpu309zbpTH1dTO
	Y5s9xxVyjQ3Q==
X-Google-Smtp-Source: AGHT+IF9B7tqIKdb0iENG78IKFvAW+b3aPLefvK3bcUp3eG0jsgNx9wqXhniQbUfVg6Xi43bgw/eBA==
X-Received: by 2002:a05:600c:3144:b0:458:f70d:ebd7 with SMTP id 5b1f17b1804b1-45b479f7aa4mr22885645e9.20.1755700517998;
        Wed, 20 Aug 2025 07:35:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:dc4b:4af3:f382:7aa7? ([2a01:e0a:3d9:2080:dc4b:4af3:f382:7aa7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c29c9dsm37952745e9.4.2025.08.20.07.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 07:35:17 -0700 (PDT)
Message-ID: <d1c0a646-8089-4d5c-ac5a-068c4910bb66@linaro.org>
Date: Wed, 20 Aug 2025 16:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCHv1 4/5] arm64: dts: amlogic: Add cache information to the
 Amlogic S922X SoC
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240205171930.968-1-linux.amoon@gmail.com>
 <20240205171930.968-5-linux.amoon@gmail.com>
 <cf47b82c-6307-475b-af3a-eab7f09715f0@linaro.org>
 <CANAwSgTOpDmZGR33veBWrzr75=xEZ-28iu=GeCzqa0ZPXxDchw@mail.gmail.com>
 <f87069a4-042c-467a-94fb-0b65bfa4758d@linaro.org>
 <CANAwSgR1+Fb5Si6yBU6JXCfRiq-XU0xjr-ecVbnALMj7qmv0Sg@mail.gmail.com>
 <CANAwSgQvYyE3rZqBHR2_Q0FzggznOh=fhtBQVJZ1DRn73P24pQ@mail.gmail.com>
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
In-Reply-To: <CANAwSgQvYyE3rZqBHR2_Q0FzggznOh=fhtBQVJZ1DRn73P24pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_073520_254635_C7B6673D 
X-CRM114-Status: GOOD (  22.06  )
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

On 20/08/2025 16:00, Anand Moon wrote:
> Hi Neil,
> 
> On Tue, 27 Feb 2024 at 18:34, Anand Moon <linux.amoon@gmail.com> wrote:
>>
>> Hi Niel,
>>
>> On Tue, 6 Feb 2024 at 20:31, <neil.armstrong@linaro.org> wrote:
>>>
>>> On 06/02/2024 11:15, Anand Moon wrote:
>>>> Hi Neil,
>>>>
>>>> On Tue, 6 Feb 2024 at 14:30, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>>
>>>>> On 05/02/2024 18:19, Anand Moon wrote:
>>>>>> As per S922X datasheet add missing cache information to the Amlogic
>>>>>> S922X SoC.
>>>>>>
>>>>>> - Each Cortex-A53 core has 32 KB of instruction cache and
>>>>>>         32 KB of L1 data cache available.
>>>>>> - Each Cortex-A73 core has 64 KB of L1 instruction cache and
>>>>>>         64 KB of L1 data cache available.
>>>>>> - The little (A53) cluster has 512 KB of unified L2 cache available.
>>>>>> - The big (A73) cluster has 1 MB of unified L2 cache available.
>>>>>
>>>>> Datasheet says:
>>>>> The quad core Cortex™-A73 processor is paired with A53 processor in a big.Little configuration, with each
>>>>> core has L1 instruction and data chaches, together with a single shared L2 unified cache with A53
>>>>>
>>>> Ok,
>>>>
>>>> Since all the Cortex™-A73 and Cortex™-A53 share some improvements in
>>>> the architecture with some improvements in cache features
>>>> hence I update the changes accordingly.
>>>> Also, I checked this in the ARM documentation earlier on this.
>>>
>>> I don't understand, Amlogic states it's a shared L2 cache, but you trust
>>> the ARM documentation instead ???
>>
>> Yes please find the Cortex™-A73 TRM
>> L1 Cache
>> https://developer.arm.com/documentation/100048/0002/level-1-memory-system/about-the-l1-memory-system?lang=en
>> L2 Cache
>> https://developer.arm.com/documentation/100048/0002/level-2-memory-system/about-the-l2-memory-system?lang=en
>>>
>>>>
>>>>> And there's no indication of the L1 or L2 cache sizes.
>>>>
>>>> What I feel is in general all the Cortex™-A73 and Cortex™-A53 supports
>>>> L1 and L2 cache size since it is part of the core features.
>>>> but I opted for these size values from a Wikipedia article.
>>>>
>>>> On my Odroid N2+, I observe the following.
>>>>
>>>> I have also done some testing on the stress-ng to verify this.
>>>
>>>
>>> Ok I don't feel confident adding numbers that comes out of thin air,
>>> and even more since they are only shared to userspace.
>>>
>>> I think we should only add the numbers which are 100% sure
>>
>> Best way to let the Amlogic SoC members comment on the CPU  L1/ / L2 cache size.
>> But with the lack of pref PMU events we cannot test this feature.
>>
>>>
>>>
>>> This looks pretty, but let's keep exporting verified data.
>>>
> I just wanted to revisit this patch series with some updates on
> 
> Here is where the Android TV provides the cache details.
> [1] https://androidpctv.com/comparative-amlogic-s922x/
> 
> Amlogic S922X Hexa Core SoC has four ARM Cortex-A73 cores capable of
> reaching 1.8Ghz
> with 1MB L2 cache + 2 Cortex-A53 RAM processors with 256k L2 cache,
> 
> https://boardor.com/blog/understanding-the-architecture-of-arm-cortex-a53-cache
> 
> Also  Amlogic A311D processor utilizes a "big.LITTLE" architecture, combining:
> 
> Quad-core ARM Cortex-A73:
> Each Cortex-A73 core has:
>       64 KB L1 instruction cache 64 KB L1 data cache
> The Cortex-A73 cluster shares a 1 MB unified L2 cache.
> 
> Dual-core ARM Cortex-A53:
> Each Cortex-A53 core has:
>    32 KB L1 instruction cache, 32 KB L1 data cache
> 
> The Cortex-A53 cluster shares a 512 KB unified L2 cache.
> 
>  From what I understand, CPU caches are a core feature of the CPU.
> Do you think I should update these patches and resend ?

Yes sure,

Neil

> 
> Thanks
> -Anand


