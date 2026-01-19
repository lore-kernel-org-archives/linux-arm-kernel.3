Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C71CCF2C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 09:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpBoFpPJWze1XjHnD2RjmJmPMWanDN2B4sDltQKPLag=; b=2J/dKDdlLzn3KPccqpnmoKfALu
	+i6pzdd8oxCrCtv7xpfeBQYGgc9QLyrfLMDhicbk+y5gBdLuqR0lKv1nmls/So4HIfcvyb8kF1wMq
	3uAvs3F7xDFzZbL8W4u72hSfrIlS2VXbDRuR2Bw+WnzQGqobG+bq5AIkEJcRHqrU0EkBSaXy6N1sy
	zC07z4s/Vh7FRG0WOgEedEcTzDsnTbuaiC/s+Ll+KJO/TptFnh4CX9K5NXIDnjyfz6uy0CjZyw5qu
	8/aaBkyUPQ0btojj++3Y37edXANbF6CGTGKXa/sj682gCP09euEsb25N/JIzU4yQyRYjCOVh2S6r4
	efBC0QzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlBM-00000001bHD-3XGN;
	Mon, 19 Jan 2026 09:04:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlBJ-00000001bGV-40EQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 09:04:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso33430565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 01:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768813455; x=1769418255; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpBoFpPJWze1XjHnD2RjmJmPMWanDN2B4sDltQKPLag=;
        b=Hi1m1Z6UAwSwH5x+Lcg7FkpOn3SpwpcJLypHn8oHCogGixZVIVbAncnW1aMDNKhL6b
         SyNGAAeG79lPgM/oQyGceVBZwNkatKz9rCpwWZSslaQu62FHXLx7OG2qrkfm9DCqRJiY
         boXklZK4or38ycx2hcVcR7SQSaMxu+6042EurB/QwVni5ZEv4Zz7R1KUBX35aBjYJMas
         lp8ndVYwbeHPmPIyTB30efZX2MQ8gglGTAi9RGIMLpAfyGVLZVuz1uN8U+Kaptii23Cd
         4Khj0Z9WgCAwCURTa5aLIluVxIOyJ4ijRYgozCX4I1nmCe4gHnUBbUKulfO0czeD6FOa
         pZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768813455; x=1769418255;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpBoFpPJWze1XjHnD2RjmJmPMWanDN2B4sDltQKPLag=;
        b=lxjaFgEqpRp2WEY+tmAJHJVbpBXjA2uH1a5RUM9zg21JwBrayzONxnG/WIhgo7LVZ8
         BeLmebF1+xxWSaZtZo9wDgkgFOV6o+kUc7t/jo4kPIwXkMhXsqdsS8dsHC+R4caXZHoL
         aRqtl4oHxPU+OCAKuthphhSvckEsmLWFCofMBmOJcmfZl0HKtp96iL9/s63qQZ0qpCNJ
         JPKbsJ40+oEWr1c9kzSJwDLn3RBrohz29EBqTApfyMema4BlRv9tPpK+NBiCSrgegkyk
         na7iqxyEnbEwt7NcMhSoPon0d48cRCUoTDBe0aaeXHjXhP4zc2PTMX9xTUmmTd0VyVhb
         yrIg==
X-Forwarded-Encrypted: i=1; AJvYcCWflzZJWH+9HZh18hIda1B3K0EEsjt2mzMsuN8PYbB0Izm5MqQpgpXFDUjpTWxKAg6CNDyzaIirGx/UzSKZR/8j@lists.infradead.org
X-Gm-Message-State: AOJu0YzOuHe4msnoSJmqIW6lJJe6b8JlDuR8seKXgk1kvNgBqEtvTeMM
	J93oIVltZ1glSf62V1EHyLI3664iLX0ta8k+nYicbR/uV83NYOXZ1uMeXFJAlRmZCZE=
X-Gm-Gg: AY/fxX4Dr08CkS5rD6+GLJIjW8wwE/f63KCVZajBOsbDfkyfQyPnfyYnLfqGzbScCuh
	dXNjxsZOgQPVdcpYbp+UbHCM1qLWQ+5wSFwEhLdcxtMyKRV6UvCrRxWf5nfVXBu0JZN/sT0IXEC
	Tid76GeuhZlDhRGn3IeLhFonn6bN+8vrIn44H5bfEs5+m3vOCrfl4DbOujJuLH2de6gWkC7Amcv
	CkdxfKyGu/kT3kpEx9Uk6a51TtOhpgdeq5kllXDWq+rH29wo4PoF+Ramkm4iFk/JvmqXlh0rngQ
	Mc+jJExLG6ou7p97zArU2HLMxzLuYQTFZUwwVpoOITClv34+kVwZ7/k2AH9sUDNUIIGVn2ssCe2
	nwTIoCJvrDzglEsZS62vCEYiOuK9kEMkH5/NR6PRQc/OTF+zvMciBzvZR7wSYOGEa5Q/UatnoMW
	q0NYhkDYzv27w8sQJ2ERL1iOr9rILWxozznD2WY8dhnQT5jFxntz/tZlOpjVq4EBk=
X-Received: by 2002:a05:600c:138d:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-4801e3432fbmr121695545e9.25.1768813455316;
        Mon, 19 Jan 2026 01:04:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:a458:3e86:7822:1c2c? ([2a01:e0a:3d9:2080:a458:3e86:7822:1c2c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d77besm186692035e9.14.2026.01.19.01.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 01:04:14 -0800 (PST)
Message-ID: <bde806a2-5c8e-48f9-aded-2a9d811b5627@linaro.org>
Date: Mon, 19 Jan 2026 10:04:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] NPU and i2c3 + FUSB302 addition for Radxa Zero 2
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ricardo Pardini <ricardo@pardini.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
 <176846437964.1204537.11505642254935473121.b4-ty@linaro.org>
 <bf433ef2-0705-4a21-b84b-321d9f68d805@kernel.org>
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
In-Reply-To: <bf433ef2-0705-4a21-b84b-321d9f68d805@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_010418_000361_B5D53B2A 
X-CRM114-Status: GOOD (  11.83  )
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

On 1/16/26 17:56, Krzysztof Kozlowski wrote:
> On 15/01/2026 09:06, Neil Armstrong wrote:
>> Hi,
>>
>> On Wed, 14 Jan 2026 23:48:35 +0100, Ricardo Pardini wrote:
>>> This series adds a few things missing from the Radxa Zero 2:
>>>
>>> 1) NPU (etnaviv), just enable the node, similar to what was done for VIM3
>>> 2) i2c3 (also exposed on the 40-pin header) and the FUSB302 at 0x22
>>>
>>>
>>
>> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)
>>
>> [1/2] arm64: dts: amlogic: Enable the npu node on Radxa Zero 2
>>        https://git.kernel.org/amlogic/c/29deec49146162d06b17739c627d062191e03814
>> [2/2] arm64: dts: amlogic: add the type-c controller on Radxa Zero 2
>>        https://git.kernel.org/amlogic/c/8f5aa8d444d1d200715c36a8f072054a49bfb410
> 
> 
> You went quite fast, but this has warnings. See also Rob's bot response.

I dropped the patch almost immediately

> 
> Best regards,
> Krzysztof


