Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0C1C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9o1OG5gJMnbyvyc0DC5kIEpva13qObOrgWmt6a2YYaM=; b=bfg4le4e7ECr2Ug3k/HL58WDSb
	W2VP+cURT9HeBVJlgfGc5Jnrk4/E8W8UT7jguRANUxwXOm/aE1DBk1J78Q4hFd6D2reeCWGhSewuL
	VwEXrtxL1IAiNwBDvLQWPbJkEkN0TN5RRCkPjG9/+o7SEZopxzV79/8Zyuj5YDLRadiotlkAQfkN/
	+CsnkoYvzfEsMIfi5NLhEmQjfl8oDhbO91DqcXAHuVDrATrMhub2MfyQMmPtwPtQyUu6tYHov9r+h
	7jDaIVlo8eBsTBpa85HWp14qmZTknb6Q5M1pdokBKhFU2yRjHsgNQ/T15eQyYiLqJ+0z/sGtQqa2P
	VA1aHGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRde-0000000B1rA-0rdM;
	Tue, 03 Jun 2025 13:25:10 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRbQ-0000000B1Wf-0zBB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:22:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so2050495f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 06:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748956970; x=1749561770; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9o1OG5gJMnbyvyc0DC5kIEpva13qObOrgWmt6a2YYaM=;
        b=AyuI7UhgW99YPSoVWilSYcqToF5AroywIMOyWshnFDE+2fbDalZlX5DiRWKrLUf+RC
         PBRV/Eflfhvak7vfslqHB9Rj+5xEVm0eEX9V4rWVPEflqv6Mmx1hlpCh+0UWdgZfmnHt
         zoYWcBh/7GTkt6GDnmedGT0DA1ct1FeSFG8tYbyREMrr6gy3BYwe5k8uFAn/Lwpy+lnw
         tZkr3V79HSmLBLE5FOVs/tmfFZpZmPOCbqAIroWgLmvjdjXp5881SEUSeHjWaQVG4OA8
         4GO/X/8HMF8AYv+7Vy7ccO231rkmwgbSv140XJWZTOw/cb9BRjjI7UXITUoQ4EhWsmnA
         u2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748956970; x=1749561770;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9o1OG5gJMnbyvyc0DC5kIEpva13qObOrgWmt6a2YYaM=;
        b=l3QtyZv5Vmv6hHw7J/7lrxQcMH3yTJC1DGSTd29DwZIu7SUJUU2gQqghhI3PtLWMkO
         ov09MU+hvW+9Iv9zIhmDwTlfcRhd4lebqayz4GCE/ndF2ZCnyGZHw8q6D53SB5W5ggeX
         eVfvhK/1/DBHN9PXAsEAz0bqXSjQlInnCk5GC2tbgVbhquUihr9yd89Cf7VlbvrzZNgF
         GzCpoH72j/oLgqQ2F8J2giy+ktLcLg09kouffVtzTgnLx33yNrTbVJYXuTf85rGQ4pK/
         efwovGEEZOacw4lvThsUcyELLFmkT7831hUtjf7M3s0UVJCRLeoMZi8Fq1ng2iD1pixy
         LJtw==
X-Forwarded-Encrypted: i=1; AJvYcCUZjQIKQCsiDJR6cPZlLhnJtkah/Dn4nmNc0zJau4O+7G92XducXref/WSrtFmu4AE3olaInX8VnGPxoXQP5PDI@lists.infradead.org
X-Gm-Message-State: AOJu0YzisFMk5/wqK5gysiykimZoOe9fx6zlO2uxiNpUhKScLWpRx8mR
	kjWRK6dMJZBmhxD1CWv6qxQdZLNrq4CSKn7mAg/jHtVy6SMHdJ3jaKdxF2LAh+ddZVA=
X-Gm-Gg: ASbGncs+l0MC52100nVlnP8gR+EgFOt+XS1ubKw5Mu/jZoZReIXDp4z08yaceV3uNto
	5Xz8fyzlbZ2DvSNkYMWwZdvnVEO66s/zqZ3l9M7e4+mOqnul56edLZGIKb6+FUCriq8LNcpC0kN
	gPpl80kp0aFBcbEvCmUtCmjsPRIdR223vpHaX76tsBbdIVn8eGm2wL9onPbRkU7RHFakE8p3ud9
	eBlJVZh2NpXXv5vAoVT4OGXFr8OPibuugQZpYVoVGSDeCIgggTvWllQDzru9Qcz2OWv2g0l10om
	ptwzqiCDazJj41oIQzAYx0XzS3hiasLsocuXYpmm6Lt1yyQxLmkknRLovFSOXDe1/s4chjeZYtc
	IWVoQ3OaPXwyuJqoaSb9FRf4z04fYMk9LFIYr
X-Google-Smtp-Source: AGHT+IGwM1OzgbnP1nAlLY2AaZkYQUoZH8oN0rymNrDg+49LiXGRY5PKTqcJSZ1tfnP2AMJFUo1T8Q==
X-Received: by 2002:a05:6000:230d:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3a4fe39363cmr9636222f8f.36.1748956969885;
        Tue, 03 Jun 2025 06:22:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:563:3654:17de:c930? ([2a01:e0a:3d9:2080:563:3654:17de:c930])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972f3sm18588651f8f.69.2025.06.03.06.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 06:22:49 -0700 (PDT)
Message-ID: <d950d77a-2bc0-4f8d-88c0-3d4da9cc772e@linaro.org>
Date: Tue, 3 Jun 2025 15:22:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-gxm-rbox-pro: fix wifi node
 name
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250603-topic-amlogic-upstream-bindings-fixes-dts-round-3-v1-1-2d54a476757d@linaro.org>
 <366cdccf-571c-4f7f-ae26-2e529de5d5ec@kernel.org>
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
In-Reply-To: <366cdccf-571c-4f7f-ae26-2e529de5d5ec@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_062252_271722_396C812D 
X-CRM114-Status: GOOD (  10.59  )
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

On 03/06/2025 11:50, Krzysztof Kozlowski wrote:
> On 03/06/2025 09:47, Neil Armstrong wrote:
>> This fixes the following error:
>> meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'
>> 	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
>>
> 
> I already sent it:
> https://lore.kernel.org/linux-arm-kernel/3c3c3652-be5f-4f54-a0b8-4829f9549116@linaro.org/
> 
> Can you pick that one instead?

Sorry I forgot, of course I'll pick yours.

Neil

> 
> Best regards,
> Krzysztof


