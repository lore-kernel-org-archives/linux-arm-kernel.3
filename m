Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFFCC54756
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 07:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKU1imWgjnCI3avar2mUIPQzX7TLviFQtJlqfZ793SY=; b=H6RGQJCHHwvM6KC3H6UzbK2zrc
	bQ2EeZkn6sZ+nSi+7JtYll0siUBtPBgfcMoZ7xv8VGYZUoG4E/0ztWvIVzEL3YjtJJ8Du6fBq7HZq
	93HbjjfJaPVPFhoZjTrYppXrqY16DZw3MnRNCf4cQqBJCYjoW/DMmnd9GNX6eXop6Ca7oynJPtIas
	nQ6tYSSlQIMB/5xz+VAEGfub9jBUq9npa2YkHrq8NO6GooGpK/kNTlwP8fLCf4cYAHVq6cWgyK3m2
	/sTXROrIp0OC8x82a3ITOFQPrhV//S9eyIZCJha/FaoayxlJLDxArj+DriAFuJfudwuY/iL0GGOOA
	oWoRbmBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0KY-0000000081J-2L3O;
	Thu, 22 May 2025 07:27:06 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0Fm-0000000075J-2g3C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 07:22:11 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a361b8a664so5880196f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 00:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747898529; x=1748503329; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKU1imWgjnCI3avar2mUIPQzX7TLviFQtJlqfZ793SY=;
        b=HkZvtC9qU6gCV96+dzyMnQ9ghyvmyWUWJdvfVPdtTdPc6te3IX7IIoLWCzZl8mxb74
         hqOSQ/uA0XK9v3eeu7jJtcNiNWsARgWt/durMOji+3toTEcjP/9PBcEzAsUaHO7YBETL
         cqaQROh81YvbuUEabjBz0Z+aEp+D0AXC55lhy4E7eRNchCCKlg4OsnaxshhAXNt01NQD
         RAOF2EcVgPnBC7tOg/Q2LhaExavzZrcyztm1jxwS7ueHB2rqg96flGlS3ZFpUAOIA7Ig
         RgK70w7Wd63ZaVBjgtK7hk8ufyTeCmyUuErDxl+zEhHYOUp/+JEih9S6PVWjjBI3sKUa
         BNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898529; x=1748503329;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yKU1imWgjnCI3avar2mUIPQzX7TLviFQtJlqfZ793SY=;
        b=VouetSyEsInbSYMFr8sxzZx1UcZtuk03mSXUETGyo9lVKLgTJrzGDLc5OPIxIENNKn
         7B7zh59b5JY1t19Or0tOeG4VgzqS3WcilzppZUCDoW5PeD+9AXJlmuahUwwJbJNSp++0
         R8KApiCcN/QfwUIXezUoOqPiTzz3HNI/JovCzqWPNH4Nqv75IWtK9p4naRO9mcnaPLvG
         R6cz2jXoZPuAV9FWW480eeiMZb+ElpV/C/dU9QbpznCoNQgj/cuQL5CLzjXDaVHkPeo3
         3Nufem7GuKyiWgoekKNcFnzSPcciL435dJrghLI4JJwW4HQZd0jG7+Wffp417Pj/Tya7
         NLPA==
X-Forwarded-Encrypted: i=1; AJvYcCWi6PhstiuCSsLVw5Cvum+ruxAv9tdS86atbH2IomGsSpOd500oRK2SnUyM8hKPRaemYQXLEft9wTvHQ5VDun9f@lists.infradead.org
X-Gm-Message-State: AOJu0Yx81JNcu2XoyzWieb2mXd3jDfu7b/e3KCFDyvrKhNYONTtm6akd
	aLTpzpIYx171KKHE4pWVDR43zXsDeZeP42RxRO2B7e76aAn99HCLf0RUbeTDFSFMo5I=
X-Gm-Gg: ASbGnctk7nTWZd0cfGIbY3sxzaL3E1iCDQH7Rf2ESEf7K/rwdbmmRzTU+HmIh1yG1i2
	3O1/i9ODlQ5QdL0rdLzu5eQDOm36qRjSfXnT6zL2EvG5OXx08SMZS+kArBIgjtmknuYKCZB+mqD
	vdEbL6CSHsknh3NonbNlZA46fcSDStbF4OWzrHy0tc2KABmBFNh91UnElLBxoYUjPAWNHnnwWly
	0T9Ep6OR3bBnQOgZv0xK/FbEOChcgMzxOcbBs0X+jMEKnLZ14Y12pP31HxSe4zRhbs0tZxsnvga
	SffaZhvM490gDaTP/Q7LOihCCjiaABw3rPT5frxSgpUsCCPhf7sCFchWyieodsAxSBrMUTvAFhW
	fynDfPN9EhIQTAZneGPzoZfwuMsIh
X-Google-Smtp-Source: AGHT+IE3G6efsN69U61nJWH6Wm1uz9RoCxH2Y5mDFgiyh9RV68lG2Ng8GLSEqrPwcUEbVLsLRT5P9w==
X-Received: by 2002:adf:e385:0:b0:3a3:6282:693a with SMTP id ffacd0b85a97d-3a362826998mr17022969f8f.44.1747898528052;
        Thu, 22 May 2025 00:22:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5? ([2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca6210asm21904363f8f.41.2025.05.22.00.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:22:07 -0700 (PDT)
Message-ID: <09533aad-fbec-477d-a088-5ecbe181368b@linaro.org>
Date: Thu, 22 May 2025 09:22:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Pritam Manohar Sutar <pritam.sutar@samsung.com>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, andre.draszik@linaro.org, peter.griffin@linaro.org,
 kauschluss@disroot.org, m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
References: <20250516102650.2144487-1-pritam.sutar@samsung.com>
 <CGME20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb@epcas5p2.samsung.com>
 <20250516102650.2144487-3-pritam.sutar@samsung.com>
 <a5c1a064-d760-4140-9e78-d74823b400a8@linaro.org>
 <000101dbca1d$78ca5570$6a5f0050$@samsung.com>
 <42ddb5c6-0f17-41ed-8bd4-ab58880515b1@linaro.org>
 <bd9ab640-2469-4455-bd69-302dd3898c7b@kernel.org>
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
In-Reply-To: <bd9ab640-2469-4455-bd69-302dd3898c7b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_002210_670299_3F0C8C5D 
X-CRM114-Status: GOOD (  11.90  )
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

On 21/05/2025 14:58, Krzysztof Kozlowski wrote:
> On 21/05/2025 14:56, 'Neil Armstrong' wrote:
>>>> <snip>
>>>>
>>>>> +	}, {
>>>>> +		.compatible = "samsung,exynosautov920-usb31drd-phy",
>>>>> +		.data = &exynosautov920_usb31drd_phy
>>>>
>>>> All those new ops are only called when matching this compatible, it it really
>>>> necessary to check the version ? is there "samsung,exynosautov920-usb31drd-
>>>> phy" PHYs with version different from 3 in the wild ?
>>>>
>>>
>>> This SoC has a single USB 3.1 DRD combo phy of version v400 (major : minor versions) and three USB2.0
>>> DRD phy v303 (major : minor versions) controllers those only support the UTMI+ interface. Currently,
>>> supporting only v303 phys in this patch-set, and planning v400 phy later (soon).
>>>
>>> Yes, there's v400 phy version that is different from v303 phy. Hence, phy version check is needed to support both the phys for same compatible.
>>
>> OK so add 2 compatibles, one for the usb31drd and one for the usb2drd since those are 2 difference hardware.
> 
> ...unless this is fully detectable hardware, then use fallbacks and only
> one compatible in the driver.

But use proper compatible like "samsung,exynosautov92-usb-phy", but still those are
2 very different PHYs connected to different HW blocks, I won't mix USB3.1 and USB2 PHY
compatibles.

Neil

> 
> Best regards,
> Krzysztof


