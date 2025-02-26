Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E01C19777
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNXNzVmrOgaR+bECtlN/olDKqfbUj02dZv1R9QJQ0Hw=; b=eXGitOmhkzAta66Rj4uFlvoQ5M
	VfcIa8mM7eq2hQc+5CaJqRF49Pce0KOiSDwccSWK3+VMTnDVqslozLjpOPlfidICrSQFjdd4c4Fyz
	YPeHSNL/wHlbjjMwFVwkP3jLkon08nVy5wKSgRAI1dbh19XpsH9OQXYl1EIDlf5qJb80yD2KKPmvw
	9FFsFDFrSIq30Vz1o0yTtvFgkGzd/NlmuhgL/i6JDWYsgU3VcwZ+jb3HTApOk0VMDm6zf1NeN4cyv
	K8/NZDTreJlvqVD7sKr7IacHqBWaC9+/MgarZyQ8NYPtZxHLzRV7iuSzKFrQd67wVDbkzD6YuTF0+
	8I7w5iEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHQa-00000003rjL-2GVY;
	Wed, 26 Feb 2025 13:26:20 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGBA-00000003bqu-35EQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 12:06:22 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5decbcd16d2so1277507a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 04:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740571579; x=1741176379; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HNXNzVmrOgaR+bECtlN/olDKqfbUj02dZv1R9QJQ0Hw=;
        b=XasbfPDzW8UdEd0FtcL3UvQ4hjJn0UMPzgYdy14n4YgoeJ9B/dM7dpnjwQBjo2bSLF
         8CdbO6jVBbhxguGJdW8ibotOhMG4sAs2n0C5ASfQovj8KKLQsuyhCR7KtudlQ6A84ska
         hUBvXW6XJToJ2MAbxLQ8ZCo6iw4hSf6nDqeRFzu2AiVGfXLR4VW5H3sRd8JLQSgHdFaD
         /XMhAsZSV3vI4OjHIU1jiWlsciIOZsen4xhzxC2B9F1NRCOBrLqLGN0wTvGLqn+4yM81
         xQQTmYegMt8qz1W/RDykE5pwJR0v5HXfcR2f9y8XvktRqRBJrJD9gzr/m5ze4O6fifEI
         tN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740571579; x=1741176379;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNXNzVmrOgaR+bECtlN/olDKqfbUj02dZv1R9QJQ0Hw=;
        b=a7TOc6JEP+ie02gc32PXQ/krplbCFfp5P0IjTyvSWe4WpLzZbC8PHGW89HYgiYUHTp
         EPN/bAfED5dIYSZyyKTQ/xJnCJdDa5TK7DwRMOwlIaOMpr9mQucrnfQdWStgAZmPF7OB
         O1/jtJhihM9ezFf2D5DNTtRpz3+e0ueZZFkkmIdQiozgIzFIdF5wIyX2VOOWCDOsnVtj
         JQ8LpZmb+gm1IQVbKxdlXIeHtjcAmtLliaPUNkexFYlcs6KcQ57b/F89wjHTd+Eehg6H
         WVt41dAdccWZRYTnKG1viUOybnT9WiFeNEpuXejHITzGwyVpN6miIvBKo47zWnItPhuA
         P1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzV15XBbk1gpLxqd17RaAHw8J9wTB8cTUn9hRUPtv5RXISSeXBVopNbMCp9Sm5nhupqR7YhXhSQUP0cBmma/6y@lists.infradead.org
X-Gm-Message-State: AOJu0YzrGcVmvXkAgA+WLx3grGogD66VzOJEg48KgUatrkxi7Ophv72W
	OH989maZ0tnIOh9TQagpBPR7VZXazKdYZ6exHFj07mHfeda35Nm0hBoW5ZJrZLEDSll3Bq3PP51
	eLVI=
X-Gm-Gg: ASbGnctHINWMgmyG3jPEf2689gsFVu/9zTaNrR08T4GrX8L29ILTMrgyMQTsBnojOCa
	bP0Qx+Js9/9wnQ1ZvGC7gOaiwnCxpZA81QP+/qYVchXuBJwilx9tsTg69Ifmn4g+8ELmsPviuBM
	Gy5CyNBPYy2KFrN1B9dzYgwcbUnAdxklhBdQKYIQmRZwA/5nkNh50WzOBP7o7Op2P8F7Wy4QVCG
	+NwjNMpP8IgC7ytI/wt19JyUpVHntaGrzI8YmLCyTmlUbNkcm7Gco4oNMsdz3LRVsNhaPfuZNrV
	PNbr6drVyfVFxehgsa/bUe6HpvyTH5MU8K3PMjB7NQanTIhyC47SLnm0WBT0JkU0mDn4lzYtq7L
	c//1SgA==
X-Google-Smtp-Source: AGHT+IH+7jstz2VlJvmNcVTmHSTGS7gvGZ/ZCQgLWkgUNLHbPoENhiPRMVQwEoVSMCIWUmWee4AFzQ==
X-Received: by 2002:a05:6402:3584:b0:5dc:cea7:4e2 with SMTP id 4fb4d7f45d1cf-5e0b70ee34emr7031925a12.4.1740571578816;
        Wed, 26 Feb 2025 04:06:18 -0800 (PST)
Received: from [192.168.0.104] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e492120418sm2294952a12.14.2025.02.26.04.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 04:06:18 -0800 (PST)
Message-ID: <a3fc706c-3825-49fc-beea-3fea7d9c0038@linaro.org>
Date: Wed, 26 Feb 2025 13:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH] arm64: defconfig: Enable HSR driver
To: "Malladi, Meghana" <m-malladi@ti.com>, Arnd Bergmann <arnd@arndb.de>
Cc: quic_bjorande@quicinc.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, srk@ti.com,
 "Anwar, Md Danish" <danishanwar@ti.com>, catalin.marinas@arm.com,
 will@kernel.org
References: <20240419060013.14909-1-r-gunasekaran@ti.com>
 <686f583d-6bf4-4486-b9e4-20c1e268eda6@ti.com>
 <d4954e5e-e51f-41c0-bca5-6e14b4640022@linaro.org>
 <0d33dea6-c021-4f2a-bb3f-92efd6eebd18@ti.com>
 <6081917c-9c20-48fc-baaf-7ac9a9679a72@linaro.org>
 <1982291f-4a02-4ed2-b4bf-778a2fe0ad9e@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1982291f-4a02-4ed2-b4bf-778a2fe0ad9e@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_040620_790185_C028188D 
X-CRM114-Status: GOOD (  19.19  )
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

On 26/02/2025 12:54, Malladi, Meghana wrote:
> Hi Krzysztof,
> 
> On 2/26/2025 4:18 PM, Krzysztof Kozlowski wrote:
>> On 26/02/2025 11: 44, Malladi, Meghana wrote: > > > On 2/26/2025 1: 35 
>> PM, Krzysztof Kozlowski wrote: >> On 26/02/2025 07: 18, Malladi, Meghana 
>> wrote: > Hi all, > > Apologies in >> case you are receiving this email
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the source 
>> of this email and know the content is safe.
>> Report Suspicious
>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
>> updq3RaPV007wGXFFrPD30z5a3GGYjpJweyhUcIfUTTaUs-8q0QpC4Yk9azBiFp7cBAf2Knk6fnVs4Fs-zRjTMEn8kmpiGo$>
>> ZjQcmQRYFpfptBannerEnd
>>
>> On 26/02/2025 11:44, Malladi, Meghana wrote:
>>>
>>>
>>> On 2/26/2025 1:35 PM, Krzysztof Kozlowski wrote:
>>>> On 26/02/2025 07: 18, Malladi, Meghana wrote: > Hi all, > > Apologies in 
>>>> case you are receiving this email for the second time. > Any reason why 
>>>> this patch hasn't been merged yet. Other than re-basing > this to the 
>>>> tip, anything
>>>> ZjQcmQRYFpfptBannerStart
>>>> This message was sent from outside of Texas Instruments.
>>>> Do not click links or open attachments unless you recognize the source 
>>>> of this email and know the content is safe.
>>>> Report Suspicious
>>>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
>>>> updgnZav1ue7gKXOnHOpH5hg8gLmw9Osqsqh- 
>>>> KTLRTnBEurV_VetrG7mzU898vB_5xFrYgbRkkuuFMBobM-uhFAmUgccRSk$>
>>>> ZjQcmQRYFpfptBannerEnd
>>>>
>>>> On 26/02/2025 07:18, Malladi, Meghana wrote:
>>>>> Hi all,
>>>>>
>>>>> Apologies in case you are receiving this email for the second time.
>>
>> BTW, Arnd when responded with Ack described the process.
>>
> 
> Yes, I wanted to re-confirm before posting it again (just in case).
> 
>>>>> Any reason why this patch hasn't been merged yet. Other than re-basing 
>>>>> this to the tip, anything else which needs to be addressed to get this 
>>>>> merged?
>>>>
>>>> I don't think you sent it to your platform maintainers, so no one would
>>>> apply it. Usually people ignore emails they did not receive, although I
>>>> am here an exception tracking missing-DT-patchwork things... :)
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>> Hello Arnd/Krzysztof,
>>>
>>> Thank you for the replies :)
>>> Was having ambiguity since this is not TI specific change. Wanted to 
>>> confirm before re-posting. Will post v2 patch including TI platform 
>>> maintainers.
>>
>> It is not TI specific? Then which upstream boards benefit from this if
>> not TI?
>>
> 
> This change enables generic HSR protocol support in the kernel which is 
> required for HSR driver support in TI boards. When I said "not TI 
> specific" - I meant this change is not internal to TI driver. Hope this 
> clarifies the miscommunication from my earlier mail.

Yes, sure, but this defconfig change benefits and is sent for certain TI
upstream boards, so it is TI upstream maintainers field. It still fits
the "Submitting Patches for Given SoC" in SoC maintainer profile.

Best regards,
Krzysztof

