Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0236E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 14:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yoqiwu0ZPISAmlNURS49rP/IFDhT/w9s1QlaAD1nD1w=; b=WmJMM+gx23BK5/dHwHoA6GC/FZ
	EYaoDgxGHwDsfNhysU/EMNp7526Pmp9LzbgBOu+3vHB2gkGXUjPE9l23q9/QI46iJRGGUKxZbQGzb
	qsN8v00vY71hmhyTcUfowbkWclkEukBOW9cWyGytPqYoib5xEkS4QL92eBC2WYdkmOdYYpknwJWOt
	5lO2f2yu2cpyRy/s1jgnlL1mMY5Iuz9Gs3KGqwO2pMy3L3fIPzdj9uqqWrp+89ZDJHNxAltWS0Yu1
	IXpkf7YCD7HayA1pK5f/Ti/HJGczEK94+bmb1dNJCLOFclLuJorjbCYAG/Uy7gQukQ57K7RlNkCX9
	9V4ajf3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTizg-0000000DAWZ-0ryI;
	Fri, 03 Jan 2025 14:49:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTiyR-0000000DAJH-1R7l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 14:48:28 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436345cc17bso89708895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 06:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735915705; x=1736520505; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yoqiwu0ZPISAmlNURS49rP/IFDhT/w9s1QlaAD1nD1w=;
        b=x2dylvaiPUvRSLtqogaBn60IOvnOSS8+6g3qmgn/PNZoJGoSM4sZ47OF+b7jYSkqk8
         rlgJZX+GhZmJewhygmpd8e9gBfpv/QXK33/ol2uHuUSSjOvJ4pBnlM0gzqL2eUftBmB3
         wDuHmHB6v+752MpI8vLZi9FaDo4OGBgrylLEmE7Qr5B78n+ij4OmKCsEbCtN3M47W0Tw
         87zvjpoZ4laNefIw2esFLRhv14TWPTuMTvO0OWrAPYM9iAZKyV1DanOXo0XnnJF/2r7y
         7d/6c4Hkfu0xjfUoJCOBuxqJNYpZwR8ZOUtFtvjwIza/O7kiicy5kVNG4BD+FwDMgGOX
         8mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735915705; x=1736520505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yoqiwu0ZPISAmlNURS49rP/IFDhT/w9s1QlaAD1nD1w=;
        b=SFZyaJTCh1FaTEzSQ540EHhjSnaxasVtESP7SW+lDMRCQMxj9K9tZx8pLqxDBaRfak
         hBNG/LFic7CF4hycSzTNc+og6Io1QUz1ukL1V5THy2Q4rmvYNHLC0HMZG4MD6/2tLGJX
         R+0BHVLOtmKALO9s/mz0LPcLKnDazOgn4mPiYQAR1UOshMvTfgAx1wVEvtKFJaLNp9om
         cLAhCvf0becuiEtX/O4/qFtbf1QIP/wo0mvmmnhXCPv1BzXlAqGxGE+Qz+qsuG/JqBAO
         m4HbhLeeNjUN2noNSaX0TFVZ39HI47FCLfojr4bi333aBebiHtMRdUYr7Z3IRNc5GXkR
         itUQ==
X-Gm-Message-State: AOJu0YyhxH+WbAQxP3jxm0fM/0mHOatkOeUmxR3MbnhpGC2JBFNCysT/
	jwGGv5lZjfpe0Lq5Te+uSLAtkx/wDiBeg549gYvqKHunNacvSqKLF0n7Hj7CKR0=
X-Gm-Gg: ASbGncuv8PB1sqpjbwoMu5UngaalbzlsbwZWNC5vyj95JsN9Lo6ZsoQRhW4Y15jL+5l
	pSMsqheQSNRk6nZ7ErBa+zmlPkP2F1C2soEYJBzs9zkjafrlyjlgOFT3IO+ynqppJpLWgiVlOsC
	9Onq9nqfK+eurMmMiXchjsrtxN6sBPE5JaNjX2Fnp5adMrsFFxsM+JvG7F4RSFd5+24g1cCAvms
	zzTUCruaPY0ZkR6o0UlKLa9uD1bFbG6Jq/ZLZsTTBChLZ3enIkI29O+JrtWjd4DD99PLQ==
X-Google-Smtp-Source: AGHT+IGfednntDvu6ZXrObE1Cj/rDH9xIbJPG+EOjHXzT3RtNhQEXlwqANJ26bIHkmmk2a7qppbxug==
X-Received: by 2002:a05:600c:3b02:b0:434:f609:1af7 with SMTP id 5b1f17b1804b1-43668547462mr416110305e9.4.1735915704896;
        Fri, 03 Jan 2025 06:48:24 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119b6sm523254265e9.22.2025.01.03.06.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 06:48:24 -0800 (PST)
Message-ID: <3e3136e5-cb59-45a8-8bd3-43bf401c14cb@linaro.org>
Date: Fri, 3 Jan 2025 14:48:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-5-quic_vikramsa@quicinc.com>
 <22479c27-9265-4994-8974-9739ecbae5ee@linaro.org>
 <99cf5f7e-43f6-4ac4-a4a2-dc731b695572@oss.qualcomm.com>
 <c7253f5f-eb4a-4636-b0f9-7d284a2f5a8d@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c7253f5f-eb4a-4636-b0f9-7d284a2f5a8d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_064827_408200_2DDC6594 
X-CRM114-Status: GOOD (  19.50  )
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

On 19/12/2024 19:32, Vladimir Zapolskiy wrote:
>>>> +        rst-pins {
>>>> +            pins = "gpio78";
>>>> +            function = "gpio";
>>>> +            drive-strength = <2>;
>>>> +            bias-pull-down;
>>>> +            output-low;
>>>> +        };
>>>
>>> I have doubts that it's proper to embed a reset gpio into driver's
>>> pinctrl suspend/resume power management.
>>>
>>> Konrad, can you please confirm that it's really accepted?
>>>
>>> I'd rather ask to remove this reset pin control.
>>
>> There's certainly some appearances of this in the tree.
>>
>> You could make the argument that it makes sense to prevent 
>> misconfiguration
>> (i.e. the bootloader may set the pin in input mode), but then the counter
>> argument is that the (Linux) gpiod APIs request OUT_LOW/HIGH, and we 
>> would
>> expect that the driver uses that if the GPIO is requested through
>> e.g. reset-gpios.
>>
>> I'm not particularly sure what to recommend here. Krzysztof?
>>
> 
> I'm worried by a possibility that a device reset/shutdown control GPIO 
> could
> be turned off by entering the "sleep" pinctrl setup. If a particular 
> GPIO/pin
> is off, is it still continuously functional as a control GPIO of some 
> device?
> I believe it is not anymore in general, this is my concern here.

I agree for this particular case that rst-pin should be excised.

- RST is an active low signal, which is typically _pulsed_ for a period
   when the sensor is powered to trigger a reset in the state machine of
   the sensor

- What is the use-case of pulling RST down the GPIO in suspend ?
   I'd remove the output-low though it should make no difference as
   the sensor regulators will be off.

- MCLK I think should have a suspend state specified or at least
   I can't think of a good reason right now why what I see here is wrong.

For the default state this patch disables the GPIO pull down bias, which 
to me seems logical and correct.

TBH I don't have a big concern about the RST pin in reset because the 
regulators will be off.

---
bod

