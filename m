Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD7BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 14:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lzSqgmLuDsaT1UbcCVkz5i3150XmTSjjDVRV2LRjBs=; b=iKxF+dD/HVa/skLQeFPtXHekSQ
	CBDosvblBtmDe1FX+xZSnhesPhAtgiuSrUzwNtLofOiuW46UjxOsCviRbuTTkdraSx7YV9yBf7QHX
	5rLMVKL3MAC11WMsnoiI8felSdQNRgW9jRDoCFDJ5BTThkDsYcqGK2mUfMOxlY+ogdSyNOW1lH5pA
	pIFdFHBTqZX3rbqlwPNxWhZl/3n8OHFs7KEyY4vycSe+M2B/jCs2lU5hZt3VFfyKhRsk1FEIEA9Tr
	7dhrkj59znsjzfJMaOrqLn7H/02emrmnTAGGO+J6w8GPwwJU9hsz8PNdkeBNtSs1OADjEBNuxwTb7
	msRL3Ikw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujesJ-0000000FPPf-0CiR;
	Wed, 06 Aug 2025 14:12:15 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujem0-0000000FODg-09lv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 14:05:45 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-615d0b11621so1638280a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754489142; x=1755093942; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+lzSqgmLuDsaT1UbcCVkz5i3150XmTSjjDVRV2LRjBs=;
        b=RFSGv1+zSYXytJesy0uVG3IHdLEEDcFpM56GXV15bqYk6YpmHNjx7lzIi0J02TFv00
         tcKk+FU+NQisSvqDOWH7aZnT26Be0Vc+WfbGjuF3s3M8AzscatDctIE0E2Fj+foTDHEI
         hALqtN2JAga0OrJVrcOu9xYKspxc/Vmw5CVUE/bxwzhJ8kJXoh8roWOEAm1nu++okmmT
         en/OG31VDoJJMdOdHXpzXciKx/bizF+WNZPzKD4F4ejFTGbpuVLmeOL+rjki6OS6osL0
         B5N1c5QYoNXrhImyhu8Z4Fg7L5qDy1tUwZJg6tYm/UdynizwQUtYdjL+XVO1hMvdXArP
         onEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754489142; x=1755093942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lzSqgmLuDsaT1UbcCVkz5i3150XmTSjjDVRV2LRjBs=;
        b=Qb7MsSBtDO/5uqQ1W521MsO41CBfVQ3NRp/GUvwAKX5wO2cfqB3tWaev8vWt2EeMl3
         dX6s/aQBaaNz105S23etBfrHzAy7tGnpfX/7vpBuztShwZgC9TwtOQoTNPDBE5STO97O
         pqRQKy3Waf35A4FGh8HtK2bwBvyu1hhicX1eMeH9CexZZ//91remg0iuuwKDse9I+Qd8
         ift+osT3fAGTwwJO1nxitsSLm4dl5qqs9XOKjGaIzEHPATf70uTDB/eom/6Cn4dwm7Sl
         QOZn9I2lEY+odxq5i7U4e8UcPZYUvFGfi4iBlRi92mLVuUPos04j+/szqCYW6hIXT/Fj
         l8/A==
X-Forwarded-Encrypted: i=1; AJvYcCVSK8ZIng10JC+NFqKoynlsANoTnoK6YHsNpf+IMSzD/p5b9tuCj7LEdd+HKeogalJI/1ou1vNT5aEqMQ8YVm8a@lists.infradead.org
X-Gm-Message-State: AOJu0YyYvkmpY1k1IXb/9EiwxUVyWLNZYcVvToDXxrFcVl3QfN5JoRyu
	Gnozv/h8q+8BeYGy1W8uNmQQ+ubBQf9ST15BXxJlXmLHuiM+hAC+YzZ2YSmqCg==
X-Gm-Gg: ASbGncvV3RLPlVkQie8ni4vW+HJ0/BpHFha9+nBks9ZFekS7TF9JaGZU49/rxT2H5Bw
	uASwOSRVUhmllMk4UwcqWdXYWmS2eYFuYr5PCPfXWROjn75nKsDD9YJW4rz6bQpJ/YMtmH70jpR
	RCAaHMqpI6MPCRxTJEotDxUAcaJtcRHn7ZPv11evKUMdiyresded4+Rma62YRUHR1QcjRGWQfqD
	1ltfwdSk0Ng4MGxgCI4jWeFZnYCUsSsfGS5jD3BzbmrFnGLNAPHr/L5jElS1SbTjqfGntqXpRf7
	KD36+zPKmJjVv6LWcZ4m6NYR4NYB4awA2wiInosSkwEByCkzvAxjkQPmPInt3laqYd7r09dGpBh
	7k2dBwP2a/nP12u8dzla+bu3pG6N91uIPtIA3svqXC3klt8FKEaLtgzn5AQTBWYQIAIK05Ea5pY
	89
X-Google-Smtp-Source: AGHT+IGi2hEZYx2aJxgqivrh7ZZi3SqYFIp+6WucXhT44MYse/YZgsazsogj6Ura8DuadHFDLR5xmg==
X-Received: by 2002:a17:907:971f:b0:ae9:c8f6:bd3 with SMTP id a640c23a62f3a-af9907c2fb1mr311163566b.7.1754489142006;
        Wed, 06 Aug 2025 07:05:42 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91b36e91dsm1071448766b.69.2025.08.06.07.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 07:05:41 -0700 (PDT)
Message-ID: <adca090e-27ba-40db-bf99-54d27069415c@gmail.com>
Date: Wed, 6 Aug 2025 17:05:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: exynos2200: increase peric1 and cmgp
 syscon sizes
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
 <20250730074253.1884111-4-ivo.ivanov.ivanov1@gmail.com>
 <CAPLW+4=QwTv96KMdJ7tcWd+Swh-fC7+h9bo22e2aZMeRbg4wKQ@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CAPLW+4=QwTv96KMdJ7tcWd+Swh-fC7+h9bo22e2aZMeRbg4wKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_070544_083992_D2F96389 
X-CRM114-Status: GOOD (  22.26  )
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

On 8/2/25 01:11, Sam Protsenko wrote:
> On Wed, Jul 30, 2025 at 2:43 AM Ivaylo Ivanov
> <ivo.ivanov.ivanov1@gmail.com> wrote:
>> Some USI instances have swconfig offsets that reside over the currently
>> defined syscon ranges for peric1 and cmgp. Increase their sizes.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>
>>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> index 943e83851..bab77b442 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> @@ -328,7 +328,7 @@ cmu_peric1: clock-controller@10700000 {
>>
>>                 syscon_peric1: syscon@10720000 {
>>                         compatible = "samsung,exynos2200-peric1-sysreg", "syscon";
>> -                       reg = <0x10720000 0x2000>;
>> +                       reg = <0x10720000 0x3000>;
> Exynos850 TRM says that all System Register instances (in Exynos850
> SoC) use 16 KiB (0x4000) of address space for their registers. And I
> can see some SYSREG registers actually have offsets over 0x3000. In
> reality though all IP cores are aligned by 0x10000. I have a feeling
> Samsung does the IP cores integration in the same way for all their
> modern Exynos SoCs. It can be actually deduced by looking at the
> starting addresses of the nodes in the device tree, they are always
> aligned by 0x10000.
>
> Hence I'd recommend doing this:
>   1. Use either 0x4000 or 0x10000 size (not 0x3000). For the
> reference, Exynos850 and gs101 use 0x10000 value.
>   2. Replace the size values for all sysreg nodes in your device tree
> (not only peric1 and cmgp), for consistency and to prevent possible
> issues in future.

Alright, thanks.

>
> Also, maybe it'd be better to use "sysreg_" prefix for these node
> labels (not "syscon_"), as it's called System Register in TRM. But
> that's minor, and probably out of scope for this patch.

Does not matter that much imo, just a label. You could make a patch to
rename it on other trees too.

Best regards,
Ivaylo

>
>>                 };
>>
>>                 pinctrl_peric1: pinctrl@10730000 {
>> @@ -471,7 +471,7 @@ cmu_cmgp: clock-controller@14e00000 {
>>
>>                 syscon_cmgp: syscon@14e20000 {
>>                         compatible = "samsung,exynos2200-cmgp-sysreg", "syscon";
>> -                       reg = <0x14e20000 0x2000>;
>> +                       reg = <0x14e20000 0x3000>;
>>                 };
>>
>>                 pinctrl_cmgp: pinctrl@14e30000 {
>> --
>> 2.43.0
>>
>>


