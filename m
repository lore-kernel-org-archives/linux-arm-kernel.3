Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D753BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lquJ5PztwzuglOeRIwX9xUr/VMazVnds3G/8YT7Fvc4=; b=p2UJtdDVqE3y6U4iK5wQwUS1tp
	wRVqoIDePoImJqErW+qzpq3MRR/KHS17W184Me6MnF/0PFDWNBF4/nha74x4108Selxj+BnoRjqRF
	5Yz5Cu6pBx4HXq+26IuUMkDsT9FWc09CRDj/DQ/dsgd969o6e30ca9ZxCsVBBDYL0e92RFTzDSzsT
	JmuDU6NCVQivXclHrNBONFdg7froiZgVvsxqQAcwnGLkimhcw6phu1qvOfgIbZRDk/RFLPM1rFqKk
	PIZCefG7zXK84P//e8ypdYSwVsiVZjFKyM6sN3hWFRMXUlaD20eyfzmQHpywsiWKrBxJ2nI8Pfqxv
	zEpIhcDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGPi-0000000D0kD-3Pue;
	Wed, 10 Sep 2025 08:42:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGPf-0000000D0iA-3SfM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:42:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45dde353b47so19016575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757493766; x=1758098566; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lquJ5PztwzuglOeRIwX9xUr/VMazVnds3G/8YT7Fvc4=;
        b=YZlb3z1cF+JPim8BulHMcF8plrDhSDjVaoSnABVwwS3gHmsugXwuyWmXwhPlblmcL5
         CDeZb9GZklT40wfdu2lIvkhnUKICClPMy2Lg2RUO5bLSVR4sd9+SkH2b6RnMRWm2oN7I
         22JqNv/B+QD2R7ywXphsj7rrj00K07YdKRjU9gw09Z79H5ciAzFiiZ7i1+0sqEGRMWD4
         NQftvCO/rwE5MurIL9bx/J0X4Kv7kzQVw5lpiQOeiXkwu012mcNeesJEZZ67+z0e0Yo0
         /6+4CNFxzQaZ/jeKCd8Mcc9dVaj+45QaGm58PJyiqkTB6isX2ne07wqDQ98NLkW8RX6w
         4jJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493766; x=1758098566;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lquJ5PztwzuglOeRIwX9xUr/VMazVnds3G/8YT7Fvc4=;
        b=wMV+u+ZkzIIi0JOVWCfGTgeHxanBLzp88adbW1NWIt7URtcGp/3foMuN0tfAD+hqdK
         1qtGaKncCAZshCQ1Km7SdbKGKFmN4P+Rc1tJC8oYLtf3Qn8SjK83L0t0HzVlQ5l7BJUY
         sLHwPCrPW0KRWW+Wv7VH+8TMnr/MzaU6eW7q8o2D2e4UUIoldaUcO0GVmmdqPSMniEUO
         vmfZudtUy+GFXwAwhV94zOIAKxtVb9KEdQvuN9t/m8Hik9BYzn5UXv0KG3HRJXhDkzGv
         N+T/rKxeXzwG2dlm4wd2WQieYW93u9PNKHaIZL7lADeUrJPB/nD3Us0bKy56WuxDnZeb
         2Tnw==
X-Gm-Message-State: AOJu0YwbV1c4BKgYBCwZxY8FXCpvSZUOVkJIgaUNaomTbnSFnlTl9aVc
	NG4lkJqKQwbXbsa/3SJRYGFD7lHjyHstgJKPz1cpGAUl7oRXw6fIfmx9s1A0rvUmxJY=
X-Gm-Gg: ASbGnctu7TrOi4n18tBuXJA4cbwtcGtrT3RKFiwTidgpjOk6I8f5cl7fuhmu2JA5jo1
	+HB+2RUbfO6EiCQ4hbYcPFaoCWTIX2KmA2DewzV+7c9li8l494E554lpOhcSdW3/HhnCEIJN5pE
	FBZMQGP7evkJeT7/2zdGMTZ+aorcJyzbcsj3IZEv9eGlclFJUcXeFzW1gsGWQTqHdZboHvcbijP
	6RfezU6zDArVcHSK1acR8NDC4LeIrSF1Crm3bDuY6v/N3J68Yio0hzPNQQhL8+bReaYSBLp3GCT
	bYOoo5ntp3s4Llcpb7fICEOJ3z2kWObfG7ZidvUwVw4kZOQ1sqYotWe/qcOhQmrDoLVYWDlAaLS
	pMHoI2PbTsELa618zv1BmIuj9DjDfkeetkQnk/vc3Fmea0SputSTEl/6z38AS00ZR+fZySOIO2f
	ltecc9mnAOHncmcFadIIA=
X-Google-Smtp-Source: AGHT+IHVjNthO4SktB1Xz75HnDS8/BmjdCNmc8dzepzAh2MGw5GBwzE8aoUhNAen8jMgrcMcoay5OA==
X-Received: by 2002:a05:600c:474e:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-45dddecd894mr125340515e9.23.1757493765680;
        Wed, 10 Sep 2025 01:42:45 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247acbsm19112915e9.13.2025.09.10.01.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:42:45 -0700 (PDT)
Message-ID: <c7635e11-d606-4e65-b48e-d8c26ee7be1d@linaro.org>
Date: Wed, 10 Sep 2025 09:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <f1e3c3a9-9929-477a-b1ad-e485c059cbc2@linaro.org>
 <d16d40ab-8a35-4886-b11f-2eee15849e1c@quicinc.com>
 <8c1163ad-6e65-450b-ae44-c9a71a045333@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8c1163ad-6e65-450b-ae44-c9a71a045333@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_014247_890306_8461B5E7 
X-CRM114-Status: GOOD (  18.20  )
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

On 10/09/2025 08:42, Krzysztof Kozlowski wrote:
> On 10/09/2025 09:26, Vikram Sharma wrote:
>>
>> On 9/10/2025 12:35 PM, Krzysztof Kozlowski wrote:
>>> On 13/08/2025 07:37, Vikram Sharma wrote:
>>>> Add the compatible string "qcom,qcs8300-camss" to support the
>>>> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
>>>>
>>>> The QCS8300 platform provides:
>>>> - 2 x VFE (version 690), each with 3 RDI
>>>> - 5 x VFE Lite (version 690), each with 6 RDI
>>>> - 2 x CSID (version 690)
>>>> - 5 x CSID Lite (version 690)
>>>> - 3 x CSIPHY (version 690)
>>>> - 3 x TPG
>>>>
>>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>    .../bindings/media/qcom,qcs8300-camss.yaml    | 336 ++++++++++++++++++
>>>>    1 file changed, 336 insertions(+)
>>> So it turns out this code is wrong and you already sent fixes for it.
>>
>> Hi Krzysztof,
>> Thanks for your comments. These bindings are tested with TPG (Test Pattern Generator), As camera sensor testing was not possible at that point.
> 
> You cannot test bindings with TPG. It's impossible.
> 
>> This is because Monaco-evk kit was not ready which can be used to enable sensor.
>>
>> These Bindings are complete in its own, If someone want to use TPG.
> 
> No. You do not understand - they are not complete if you add new
> properties to them!
> 
> How bindings could be complete if you add now supplies!?!?
> 
>>
>> My latest update in these bindings are for camera sensor enablement which needs supplies too.
>>
>> Please let me know if this justification works to accept these bindings it its current form and add supplies as a separate patch.
> 
> NAK. Read writing bindings doc. Or internal docs.
> 
> Best regards,
> Krzysztof

@Vikram

Could you send an updated dt-bindings with the supplies included ASAP as 
a v4 of this series ?

The -supplies in your email here look fine

20250909114241.840842-5-quic_vikramsa@quicinc.com

Otherwise we will have to drop this binding and the associated driver 
changes.

---
bod

