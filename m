Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527871091910
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 19:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qCQhLNUlaK92jVRFmSRxDAiEZoE/HXa9IGlyqo2jsM=; b=E93J6NatiMD6ur9A4vN0Z4ULOh
	SjKoZnxWfOEOUSNRnSpQFHu/HyhGeK3LANGv+uMaT+mnsFIR8nJ9bnBSpkvELekcCRPQTpI+XCDc+
	HqJ5U/NHEJ8K1cQw6wJimr1L83BxLutA94bUm8ZMu81qEvrs+sMnvu0VG5Lj0eQDBg2gXobIZWpCP
	wTGuMnZqgEgJa57GT3ngVURmUIxI0VpmiKKH83k4AKh7L95TOjWlcJAJ9rDRzsCMRysOqpCSW7fZK
	lpNYXLmuaM87LolVgS+9o1GvNp+J/ktasNrMqD56GgtkZiDhLd6PI2TvYlua2MsTreS4FdZYhmPMu
	Le1/WWFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ii7-0000000BQgE-28mM;
	Thu, 19 Mar 2026 19:07:11 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ii3-0000000BQfn-45cn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 19:07:09 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-662f30d3f1fso1394939eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773947226; x=1774552026; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0qCQhLNUlaK92jVRFmSRxDAiEZoE/HXa9IGlyqo2jsM=;
        b=aCnCtECs5/xp9Rl9QN9TcCiZJXl9Bi4Ktp5ywEgSqGK8BjdXDSkdgh8qmKZHjXfbve
         xBl33s2gmUYuDprgV1C9N3w7+L64CTbAn1kbs4gUJo/ILCrHcCtwXCpff/SA540+9vol
         FmVqp8Uv06vUnWDloiyjIdhIxHQ0v8R1CEgopDVFmTtXvp+KbAM6KN0DVaSaA5eHXi+7
         HH3B+bfURbrN9CTML0UG8MRv9MkCB+xdeim4r4JrOxzpGzG8t8WcjTSKOXDHtRH49dcr
         u84Wf4nHXwcDp8Fo5tagE5Q1h5QgEKes+dWv8awUvSu+EpJIrd1yKZDmkcu6N0LWyTr2
         bjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773947226; x=1774552026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qCQhLNUlaK92jVRFmSRxDAiEZoE/HXa9IGlyqo2jsM=;
        b=fqU4D7ss7R0oscluFydmeE0tEfKi//KWVrhNwlTB1ii4+LZsUTrXVNzEX9VQbhmTbB
         16lrfvcV2Za/rnqrU4LTptf81//iSvcRbjqoVd+MIoVdAlzErFgsz3c2OY0hYHR3jzk5
         YM+Yn7T4Ez16utcneB/XuSsGpkeQRUhy02w4wHQeLORsFmUkO3mhlHCSHN3m3YKoy56r
         +WjQvlQa2V6ZNmyonwdvATRHaz0iC+wGp73YW7P7/ogWdkFUnS6lPMGKF+DnUO7Qby28
         YOJBJ+f/cIMgkLx8HlI0Wt0Aw7xUpTk2KwuLls+RmZvK12h1iLmhmBifHNzTirLowkPy
         q4GA==
X-Forwarded-Encrypted: i=1; AJvYcCXUxFdkiGO61dwJmiqu/lrXAmEq64TgXu+reOFLZdZ26wO+FJgC9x+wsCMhm5RCDoTjBbN9UolBBnqKk00cW1es@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz4TIXDM63xkrV3m3TyLRSzidD8GHtH/gkYG56hTtbLfGI0w5w
	KRrdRC+b+Behwlt9Y9BEzrNnKnEsLkRb/RCvVwv8aSIVTHZXWNqkCfZkMv222miGr9E=
X-Gm-Gg: ATEYQzzFYFrf8VmszXrvPm5guZ98s5dhzl6Ak4vdKer+F58h2Nwqs3F34g7EOtLcRso
	l5bb297ywBLJArK0LZEW8e51m+zkhCKUiQDxNjIfIzPVeHhioCoU3NI8nPdM14CaKFEvX2Hh5vm
	5Lsu4QTAkyTNFw6YKFA3RiFqMNlL4cIXk8MCuMReSqW0eZ8+eMbavgAUZTTIvIal+TiwQeojzxi
	bDwXKJ95DxiU6DdRGRJeP4PTj9R2qMTeW6UrOcZ7J2l3v7WsZFhTw+FxtFN5TpVXKN11LqGQ4/w
	1ivtsOMaHRPwci0FEJG+1I3GdQKjSy9weu7G+LvRRntyUdDEV+yVffK8vdPBpoT8DnHYINTIC4u
	gb8CZjmQkdEVxTQLOWWPkUu4koVijhTE4LfUNaMAWDjqs88W7pZAMWKMZmzsErgWvVwhmtKvTjr
	nE1Uu6eEHV8iYBjD6MLkvun4R+7JMvlP79NPfE8ueBrb8Em+7vYDgkP3hhtJ+OVmRl0wgpVDtsN
	EgtVoPh6GyK
X-Received: by 2002:a05:6820:806:b0:67b:a4cb:293f with SMTP id 006d021491bc7-67c235fb70fmr249017eaf.17.1773947226499;
        Thu, 19 Mar 2026 12:07:06 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:244c:fc8c:8216:1344? ([2600:8803:e7e4:500:244c:fc8c:8216:1344])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c0d724e53sm3921843eaf.0.2026.03.19.12.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 12:07:06 -0700 (PDT)
Message-ID: <faa4e46b-1cc6-4bab-b13e-c527a67ec4c4@baylibre.com>
Date: Thu, 19 Mar 2026 14:07:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] dt-bindings: iio: adc: xilinx-xadc: convert to YAML
 format
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
References: <20260220053941.611415-1-sai.krishna.potthuri@amd.com>
 <20260220053941.611415-6-sai.krishna.potthuri@amd.com>
 <20260221-dancing-papaya-wolverine-db8afd@quoll>
 <b89933a3-5f25-466c-a2f5-6e231aa12749@amd.com>
 <21d425bc-9406-401b-9817-7255ba3d31fc@baylibre.com>
 <e4c9729f-1785-4d10-a337-37b0d26fe30b@amd.com>
 <f1706ec0-3995-4fdf-a9fb-8e1e688438a7@baylibre.com>
 <05bcc5b7-b3e8-40fb-be70-413c74afcfb1@amd.com>
 <cf749e8c-f141-4367-81ad-827e02273ec5@baylibre.com>
 <6a4e3d95-875f-4c2b-8443-c2f2b19ff166@amd.com>
 <12a06779-cbbb-4dc2-b564-7b9cdff6796b@kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <12a06779-cbbb-4dc2-b564-7b9cdff6796b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_120708_183371_C1F5A9F9 
X-CRM114-Status: GOOD (  26.63  )
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

On 3/19/26 11:49 AM, Krzysztof Kozlowski wrote:
> On 19/03/2026 16:49, Sai Krishna Potthuri wrote:
>>>>>>>>>
>>>>>>>>>> +
>>>>>>>>>> +$defs:
>>>>>>>>>
>>>>>>>>> Why this is a def, not used directly? I see only one usage of this def.
>>>>>>>>
>>>>>>>> I am getting the below error if i define the patternProperties directly.
>>>>>>>> Seems like complex vendor peroperties should be referenced via $ref.
>>>>>>>> Please suggest if there is any better way to deal this.
>>>>>>>
>>>>>>> It is hard to say without seeing the new version of what you wrote.
>>>>>>
>>>>>> In v1 series, i created $def and referenced this in xlnx,channels to avoid the error that i mentioned.
>>>>>
>>>>> Is the code below the code that causes the error?
>>>>
>>>> No, the below code is not creating the error but Krzysztof asked the question on this code,
>>>> "Why this is a def, not used directly? I see only one usage of this def."
>>>>
>>>> I am saying if i don't use the def and use it directly i am seeing the error that i mentioned. So, asking is there any better way to handle this case other than using def.
>>>
>>> If you could show us the actual code that is causing the error, then
>>> we could perhaps spot a mistake or suggest an alternative.
> 
> Thanks David, I am surprised how many emails we need to exchange just to
> see the actual code.
> 
>>
>> Thanks. Here is the code that is causing the error
>> ("properties:xlnx,channels:type: 'boolean' was expected").
>>
>> xlnx,channels:
> 
> Device nodes do not have any prefixes. Just take a look at any DTS or
> any binding.
> 
> Probably that's the reason, because nothing in this code looks
> particularly odd. Anyway, please do not come with odd syntax in the code
> without any explanation, just to make it passing the tests, so for
> example ignoring the checks we have.
> 
> 
> Best regards,
> Krzysztof

Since this is converting existing 12-years-old .txt bindings, I don't
think we can "fix" the bindings by dropping the vendor prefix.

I think in cases like this, Rob will usually fix the tooling to ignore
this as a special case. (I had a similar case last year on a conversion
I did.)

So I think the right thing to do is to not use $def and explain in the
commit message why the error is expected (we can't change existing bindings
even though they are "wrong" by current standards).

If this was a new binding, we should be using the common adc.yaml for IIO
ADCs which already has patterProperties for channels and a bipolar flag.
But we are stuck with this vendor-prefixed one here.


