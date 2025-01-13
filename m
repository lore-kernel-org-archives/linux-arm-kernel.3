Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9931DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 17:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onYqQa61OGFyF4QvM2h8YBVOy4czv714EXLgoMhI3Xc=; b=r3bSrBFwDXrkuPOcYO8mZynr41
	Cs4D+RjegIrUaRgzMMjDVyQwae5HLWTXpHUu6CQoeV4PKAnsVHoHAwrc128Fp8KV1tH217OlBhKeT
	dnNP0IRlFh09ZBOXU02P+xJMDNoeZTLsGOfhXq8AvC2X3b+7cORW1gTooyjgtoYqhsgA3vv2bTgOh
	0FAuvnjMnFfqfZ4NoIYQc25z65xAfJF8YJCuNkdHuAgcaiLK1RBdwfdgLS3qCU8Qkg5i79FuOFN9O
	Q7bs5Epd7tcr2wlz/7C41yK4SNbcp5ft559HK9beGff7MBY1JjR0zeKkhQoE30WCq6zHZXNUX2c/k
	MtObhRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXO3x-000000061EO-2fhG;
	Mon, 13 Jan 2025 17:17:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMbP-00000005h79-08OQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:43:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43690d4605dso31167425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 07:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736783021; x=1737387821; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=onYqQa61OGFyF4QvM2h8YBVOy4czv714EXLgoMhI3Xc=;
        b=mts+p/+32qNLvHKU6lo4p2ork588KC9PufibZ94uzToQmlJFfI14N8GNI9iVdE5bUz
         4pHIHJRvttgmd23jfIUBs+oBxTG9mMKxB7NPAsskHyfsamEmS/HGfw+T47tlEYWEGbmR
         VsBPqGG5xW/FInuxkUBQ6gzJF8+q1NpPEkR7oqZm2H4KLCAAvUkuXCSakDjJKaAlE39G
         Met8n9djlWzAED3082usbfh1ywJbMk1a/HTWMHHVEgZh9dRaddABXCcEIgcIaNSmafI1
         fMkpIqZYxRQL3/YVvMsbqZsDqSW5tlmKnoZJVsHXO1WnwJZ2HNMGXdV9FZL8MUGNFSIu
         r4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736783021; x=1737387821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=onYqQa61OGFyF4QvM2h8YBVOy4czv714EXLgoMhI3Xc=;
        b=G+z7aEdzVT1AjQGc6pYBtWtC9PYWLl51gCGdd8l1pZYlgoRf/S9Uo8r8d7iK1GAayv
         XqS4tEDUo31PJ2HYaraCLjtoeCX6SNyCWVbrCLVbsL0yT9Ec/FoFZzsLfxKEhOUKLLOV
         w7A0pL3qzWkSSFGdCq6jUPhJG4H/jI+f58h0Z0+urNyEI2cWQ1D9pMYN4f/FyI7P7t4O
         u/sbXFWQKEbZFoEY+y/xE79sBmPooUWjiXgr1UIOfZ80isO1InvsVXIdQx8FUJuhKQ7C
         MYxk1s2gB5Dd4iwkcSGCjMvN2ZTJqY2iMf5J5iIRrz7JjVs4gg5FcnFZiGyFJ16stPLb
         hl3g==
X-Forwarded-Encrypted: i=1; AJvYcCXrP5fDoKwLvg1FGSWdSS331dW6ABrdfkPJFavDwByCGvXc8rGDgMyry+RG+gPuAQgcgU8Gl3sA/bjfDbouOOzk@lists.infradead.org
X-Gm-Message-State: AOJu0YwXnNGRQ9pADuDcIpML0MqhtahkwNmezkuzYSDHL2/LXzxfCqti
	1gkohbtFzO4PfBK69tqbxa/6d6q4/hyp768zERT+RfHw02bwoTJA2rjqGPtSzxQ=
X-Gm-Gg: ASbGncsjfuUAdWY0WzLcpoVGb0MKCo1AfzhjuqYpOx436CJADF2d44kwgNjQ5tJE7IJ
	CziUFbV2QClx7IYpNMw5M2o7dxBCFMp6kPnlFbS5FWOoxNBBbgONWHDkHgvLwlguMqeLfRMyAPG
	+h8Im3uJYIPdA+SasuBX2a9iElBgeiAv4uqNBqInFftDDTSObEoT9EyNAFKmxu2MeZOvUwlL9K1
	1zaJSoTj0tJQWsk1ZjkiCqwIHuLPaJFORJGf+D9Zm+l3yFsRcOCV1Y+deSJdwQGvOLL
X-Google-Smtp-Source: AGHT+IGQr4kpiFB9wczlaOYRTmEvbwC5k8AQlqeQKyaHs7iqTu2Ox0YvNOuXblM8h6c/Pixyirgj0Q==
X-Received: by 2002:a05:600c:1c28:b0:434:a734:d268 with SMTP id 5b1f17b1804b1-436e2699dfbmr216122595e9.14.1736783021472;
        Mon, 13 Jan 2025 07:43:41 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89f29sm181691685e9.28.2025.01.13.07.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 07:43:41 -0800 (PST)
Message-ID: <760969b6-18b7-42ac-9524-2f1f845b3703@linaro.org>
Date: Mon, 13 Jan 2025 15:43:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 04/10] arm64/sysreg: Add a comment that the sysreg
 file should be sorted
To: Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: kvmarm@lists.linux.dev, oliver.upton@linux.dev, suzuki.poulose@arm.com,
 coresight@lists.linaro.org, James Clark <james.clark@arm.com>,
 Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rob Herring (Arm)" <robh@kernel.org>, Shiqi Liu <shiqiliu@hust.edu.cn>,
 James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>,
 Raghavendra Rao Ananta <rananta@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250107113252.260631-1-james.clark@linaro.org>
 <20250107113252.260631-5-james.clark@linaro.org>
 <87frloqjso.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <87frloqjso.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_074343_091076_7C68D9A3 
X-CRM114-Status: GOOD (  18.64  )
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



On 12/01/2025 12:49 pm, Marc Zyngier wrote:
> On Tue, 07 Jan 2025 11:32:41 +0000,
> James Clark <james.clark@linaro.org> wrote:
>>
>> From: James Clark <james.clark@arm.com>
>>
>> There are a few entries particularly at the end of the file that aren't
>> in order. To avoid confusion, add a comment that might help new entries
>> to be added in the right place.
>>
>> Reviewed-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: James Clark <james.clark@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/tools/sysreg | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
>> index b081b54d6d22..4ba167089e2a 100644
>> --- a/arch/arm64/tools/sysreg
>> +++ b/arch/arm64/tools/sysreg
>> @@ -48,6 +48,8 @@
>>   # feature that introduces them (eg, FEAT_LS64_ACCDATA introduces enumeration
>>   # item ACCDATA) though it may be more taseful to do something else.
>>   
>> +# Please try to keep entries in this file sorted by sysreg encoding.
>> +
>>   Sysreg	OSDTRRX_EL1	2	0	0	0	2
>>   Res0	63:32
>>   Field	31:0	DTRRX
> 
> "Do as I say, don't do as I do".
> 
> I don't think this makes any sense if we don't actually sort the file
> the first place.
> 
> 	M.
> 

I think it's ok if it avoids review comments that new entries should be 
sorted. Or maybe we do the opposite and the comment should say this file 
is allowed to be unsorted...


