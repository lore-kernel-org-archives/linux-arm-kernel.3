Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5D3C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSPX/TbzronNETf+6T1qob9Fj8RgDBqBjqNXnAsD94g=; b=NUjkC5J+5EjkcEO/pJ7GCWFXsQ
	880RWO2iKBswW50mjLSwtmj4bj7rLYj5oBfvDQqZZbyMZf+DacXTCmfHJaZmean9JSqE4gJSc5EHE
	hXST8qT1c2fX/3bFU8y6nCe5iey8Ow/6fAwxectA/hKJBYIyaufaWdlha07M0zhRumBYajYut21GZ
	Zr1cjOGqgXywotRp+BhK7HMdllyxGWCr7t3rtQVi94/8+Gr3BJrQaluxyybRw6FeWDSF66L+Nk8gC
	ODUS3VuL4SfkSscP8RquKhS8MXj382zj4E/1Nfn9MSdv8xOEeR7CBMMIwM1RsBqCtHI9CTdlHNu0u
	iuOnm/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KKC-00000002GCD-189J;
	Mon, 14 Apr 2025 13:58:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KIJ-00000002Fic-0MkC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 13:56:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cfe574976so30404835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744638973; x=1745243773; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wSPX/TbzronNETf+6T1qob9Fj8RgDBqBjqNXnAsD94g=;
        b=yuebA3yYY1KB9ZrFWBqIPcf7NeSdqN7/bZcCp2yZtfxOuat7M9NA2fN0H63/9HW7M1
         CQLhWZ+ouyfoU3rMFbXFYlDfli2mQM3uUGHsnakZGyZlXTKPk53wJtPeWQPmWGlf3sAb
         15fu7A/PHUVghZXI6PduytYknCVpa5JrccJTju1jq7tyvL86xrTvOQdY2F9saIT/V0so
         ygtT2jrwbi2mGnnAAgrPRiX2Ah5kbOS/fCJ8RX2/86ZHIgQdIh7rGlE/QTS2Ty48r+5H
         EkkPSkvBMbdsG2DP1g7gJiZEOZLJMwjFQ7XTaNwZRGdAx23anq0MDr0XJLSm/mI6mAhX
         RrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744638973; x=1745243773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSPX/TbzronNETf+6T1qob9Fj8RgDBqBjqNXnAsD94g=;
        b=EN0lxq1KJB5dBXVk/NhoQtrroPU55MiKSt2NO4SfWOl6IVs14zQH5HLKewCRtuDkYJ
         087jomHdfz5qgGSUxbTe4Cb7kedviuTL09lXY0+EbCwgo+vQmTSg/pIT1oWN76c75eFa
         yhTyuz9Azxu0zQ8QSSLQEEBi2NGNnxRA8yCsgdo91WA3AE0+8W6vF/TLWkAruCAFSBAB
         MXf37pp7yQvx534m5WZDri6QR58cSng5pc0xLoKBADk944NKYalzEygRyxNlJpa3ttol
         8uGRyQsDz5sy1p3K2Rqx0kdeNbxnkiv/BL4AX5CSzLeq/1jRmkV+KpdmxijMRh1Bf4TW
         J2fA==
X-Forwarded-Encrypted: i=1; AJvYcCVftWsnlw87SjM39hhL0m+tU3rDFhlkrIKC/AB3ADwPxF3kIuTCqHIWpN1e1nJ3VC2yS04mdv/AsbV/FPgwAGry@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq9h07YfkXr97zhxzFFu7DmnqGe3bmavTIaIyfSmmfJhnrcopD
	yTgZHFRAHHK/hbQhbY7Mhh3lXeX3PeitHBH9lOHEBnBT4j2sTKxUCSydzN+VQ9g=
X-Gm-Gg: ASbGncumfjfdPMDo1ShMlH75bc6gcqamrVppWyaabYoex8VE3xD6eap7YhDPS+Km/Jb
	/HhAT1ye+YyQl1m4fHyXvk/k5/21xgUN2laHySirEiiZrvE50pLeKyIOWOXLXn+uMQ4F8VE46ao
	G0Zh0j1K8Vd8YE6jP6RFCO7Pur05k8AioYH/yekkrvFnDTvyEYCbuQQVP71ia4DuxAXc5YYEkri
	JuIWY3RKJc03UauCN5E0Y1A0ccxKdn5OaI9ifRj+y5iXI6KxMy7KRQ46XHuXWdxjg6qHGdC4Jaq
	rTBxb1QXrGznj0NNN7zIkz1hxB46BvogYWiWvqRWo/hH73LJwIt2vBAitT/xNZevm4dSaYsE9eA
	oJRNRCR6ftqBf
X-Google-Smtp-Source: AGHT+IEiisaCyzTv/c4YGT/191xkPS9XSCL07GXPd0MhBX6X1cLo7SxgbsZldJJbAyTaapzLfN0VMA==
X-Received: by 2002:a05:6000:2507:b0:391:6fd:bb65 with SMTP id ffacd0b85a97d-39ea51eef37mr9727002f8f.9.1744638973332;
        Mon, 14 Apr 2025 06:56:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:5ee:79d0:2dda:96f4:b94d:164c? ([2a01:e0a:5ee:79d0:2dda:96f4:b94d:164c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae97751fsm11004403f8f.41.2025.04.14.06.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:56:12 -0700 (PDT)
Message-ID: <97cfeafe-7044-4f06-b2e6-e4a158419473@baylibre.com>
Date: Mon, 14 Apr 2025 15:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
 <20250411133609a1295543@mail.local> <202504111339359e840246@mail.local>
 <968001f7-96d1-4ad5-8c36-28cac5dc30f1@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <968001f7-96d1-4ad5-8c36-28cac5dc30f1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_065615_128512_0656C023 
X-CRM114-Status: GOOD (  23.72  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 14/04/2025 13:09, AngeloGioacchino Del Regno wrote:
> Il 11/04/25 15:39, Alexandre Belloni ha scritto:
>> On 11/04/2025 15:36:12+0200, Alexandre Belloni wrote:
>>> On 11/04/2025 14:35:57+0200, Alexandre Mergnat wrote:
>>>> The start time parameters is currently hardcoded to the driver, but
>>>> it may not fit with all equivalent RTC that driver is able to support.
>>>>
>>>> Remove the start_secs and set_start_time value setup because it
>>>> will be handled by the rtc_device_get_offset function using the
>>>> start-year DTS property.
>>>>
>>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>> ---
>>>>   drivers/rtc/rtc-mt6397.c | 2 --
>>>>   1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
>>>> index 692c00ff544b2..d47626d47602f 100644
>>>> --- a/drivers/rtc/rtc-mt6397.c
>>>> +++ b/drivers/rtc/rtc-mt6397.c
>>>> @@ -291,8 +291,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>>>>       rtc->rtc_dev->ops = &mtk_rtc_ops;
>>>>       rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
>>>>       rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
>>>> -    rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
>>>> -    rtc->rtc_dev->set_start_time = true;
>>>
>>> This is going to break the time for people upgrading their kernel, you
>>> are unfortunately stuck with this.
>>>
>>
>> To be clear, the breakage will happen when upgrading the kernel but not
>> the device tree with 5/5
>>
> 
> Yes, you're stuck with this. Devicetree has to be retrocompatible.
> 
> Besides, this start_secs is what gets used by default, and the start-year
> devicetree property should take precedence and effectively override the
> start_secs default.
> 
> Just keep it there.... :-)

When you boot your board for the first time, is the date January 2nd 1968 ? If not, that mean it is 
used as a finetune offset year.
IMHO, mktime64(1968, 1, 2, 0, 0, 0) is a workaround for the rtc framework issue we try to solve in 
this serie because start_secs is negative (1968 < 1970). Now framework handle the negative value 
properly, even if you keep mktime64(1968, 1, 2, 0, 0, 0) , the device time will change. I prefer to 
notify you.  :)


TBH, it's hard to follow the logic, so I've a question:
If I push in my V4 a framework fix that drivers using year < 1970 will need to have a new start_secs 
or start-year value to stay aligned with there previous value, do you will accept it ?

Because drivers implementation are based on a bugged framework, so it's impossible, IMHO, to fix the 
framework without impacting date values.

If you don't want to touch framework, then consider offset year in the drivers to reach above 1970 :)

If you have a solution to keep "rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);" without 
having the date changed, don't hesitate to tell me, I'm not forcing for a specific one, just tell me 
what you prefer for the V4.

Regards,
Alex


-- 
Regards,
Alexandre

