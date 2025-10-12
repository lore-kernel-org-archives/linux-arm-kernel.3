Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF53CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 06:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMI7wRbzRfPNICl70mUsYJErke1tBJAXXVxBPXEiK5c=; b=EuDfdMilqQZRxsB3qn15LbVaHN
	4KDYc2xT2JvKqx7Mpjc1DWlDNa4ZGfryZYbcH8TLCi++u9cmCtI7Im9y3V20Qb2aw71ZcQvA6mugW
	7cJMg2ldgN5w0KK1YS0TWQ+wUnKw+ehd5XNZxezp9q2BYrDZlgcXAQk173Kfb1gESlT0PcR86TGGh
	waBYvjHsE9obkP8t5jhwSRj4xdKTG5nQz/AzDZMZdz4deK7dkAEcAlDjPhik6fCYQb1SMd1LLpeJY
	So/4OEIImza58Jbkx1V3wJo43gTIBRBv2Z8O8i7Pg6TCh3YwJlQd8AvMCtlwDuulK8GJLGmJHA8Q9
	aFnj9u3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7pET-0000000B6gE-3GbA;
	Sun, 12 Oct 2025 06:07:01 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7pER-0000000B6fr-1BD1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 06:07:00 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-855733c47baso594687985a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 23:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1760249218; x=1760854018; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rMI7wRbzRfPNICl70mUsYJErke1tBJAXXVxBPXEiK5c=;
        b=TM3qAx+7xi7lNfC/GEBr8XfkCOWSovloTy/kber/3ks73NpDKBmbQ/NsMAbKr7fqbQ
         MTeWUAf/IkCNpyFSsJvUkHjmFGAm0zKogTV95V72S2LBYWfpT0/JVFCV5NyA3gDAFc9V
         7tUEr6cjAlWRtww+dbYQZFpN5iJ0brzUgIZA8XejZVueHPv1pcdF4A2Gzv4z4mc9wiDb
         UuOG6b3IKhs5lUGF4JcdUFonXJ4XMBtT/yoBhGyQ+bOZoN582eUe4U4hkTjzdD7iD3s6
         +VCFIh2Z9mKEDIsVASQ5qnI0q60Cwbrt94oGHVyUIbmHZGx/Tdytq1eVBurvxbuRdjq1
         luxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760249218; x=1760854018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMI7wRbzRfPNICl70mUsYJErke1tBJAXXVxBPXEiK5c=;
        b=eufx9N+Yt12ljqp5Cwz0ZoO8+9gsjv7AtBIHGJaTcZK5bZh6Kg3DAgu87NxB8DAvdc
         eJobup8F1w0qpcvEaZN08j7slDlPJOlS49MSMALwIb45aQbpAnigYL0eT8FGRkkbvp+X
         KPNiGdAG1QrzCg+ERKC/59YH/swUBajVNSaxM5kaf4OWK/pkSGvIZG8wb9DNktMptP4L
         cjGy07CSC9uB+fb9siyWN/CM3xsmbJLplX5ORWAGRFItpc8gBrStdNP1ZouoN0ubhSPh
         ElzuHOBI9afv1un7GZ1Jdqkv3G4BEij+XUu1FT3+ZicRZQqGYqS975s3XsYh3o/oTeNR
         FWXA==
X-Forwarded-Encrypted: i=1; AJvYcCVD5Jj9GQECkt8qq86G3BiNLd3JEYRWRBYs9ndHsdAlpoLjz+zvih9gBqAlAI5JHc04SKBE1kJDujwxaTCut65j@lists.infradead.org
X-Gm-Message-State: AOJu0YwWa+/I1KAfQ5m6fxzbBLV8yHBlC2+RWmtV9Jwe0U/PigZhNk/4
	8RDSaZubIK9Y96/duj4z+IUIlqjLf5ugMNFBwOdBb+J0g/sJnvz7ortZhxskGkzD+L/xKLCd3Qr
	oylBipE0=
X-Gm-Gg: ASbGncuvF+/hefRnk21RkU5qeHG3z2ae7V+m7rjpqR6V1LPPSSV1+7YqkRW55FcUTQr
	IvpmBT37W+YOu2yIfYMP75O5JRpDDcheDTQzDbAaw5Pd6TZjcy9OvTK51AFur3kuAeGwS1WHQ61
	jeIpWnEqfgAyLzcSdJZhkqOtOz1tF14/tTxZI753IVOJHMICkbYIQA09Fc9w/41mbAvofUZUri9
	aQIkwEoEqbOF3GWwti8oFt+3qmoNFysc9OhT09EhCt0faCp7IyVoDpTrfz8+w/Einlx5B2jRGSU
	L2Iq9/zDpsxQ8ffW6WFoTuzCxWgJp/XrBl5ATcsKO/5IjIwaB7ClB3I3Rt1izOPdMBfjNt1U51q
	rCDkneX4p52x/TRrHK1XLPzVs/Jyl8dsGtycy0GWsbXJz3wZkllCQ1Z2zsXDq/C4mzYZ9CHx4zU
	RsT5JROenMiCml0dpXgsPOPCJlehRNHbt+D9RkY1JQEpn8k4PdUA==
X-Google-Smtp-Source: AGHT+IEMl4hzF79Bq4DCeP0JM3aR8UtTQq0FlGDLXT7cxwwHa5K+nkf//3379/x4FHU0neaf3KpzLg==
X-Received: by 2002:a05:620a:a901:b0:886:17fb:9436 with SMTP id af79cd13be357-88617fb9445mr508393185a.71.1760249217775;
        Sat, 11 Oct 2025 23:06:57 -0700 (PDT)
Received: from [192.168.2.8] (bras-base-stggpq3702w-grc-09-74-14-126-215.dsl.bell.ca. [74.14.126.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a1ca17dcsm738639285a.36.2025.10.11.23.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 23:06:56 -0700 (PDT)
Message-ID: <458ba722-ab52-4b30-b020-30039102ce57@me.ssier.org>
Date: Sun, 12 Oct 2025 02:06:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
 <5a9a2ed9-9e95-4bb0-b5b9-e4e0edcfa8d8@oss.qualcomm.com>
 <1d60b78e-136f-4051-8296-245d111ca49f@me.ssier.org>
 <84d7ab07-4026-4313-8919-b5f9205132c6@oss.qualcomm.com>
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <84d7ab07-4026-4313-8919-b5f9205132c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_230659_336083_5109916D 
X-CRM114-Status: GOOD (  19.15  )
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

On 2025-10-09 05:30, Konrad Dybcio wrote:
> On 10/9/25 7:50 AM, Alexandre Messier wrote:
>> On 2025-10-07 06:04, Konrad Dybcio wrote:
>>> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>>>> From: Alexandre Messier <alex@me.ssier.org>
>>>>
>>>> Add the touchscreen device node for the HTC One (M8).
>>>>
>>>> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
>>>> ---
>>>>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
>>>>  1 file changed, 36 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>>> index 36eb42f0f3d9..040a256f9465 100644
>>>> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>>> @@ -65,6 +65,35 @@ vreg_vph_pwr: vreg-vph-pwr {
>>>>  	};
>>>>  };
>>>>  
>>>> +&blsp1_i2c2 {
>>>> +	clock-frequency = <384000>;
>>>
>>> This is not a valid I2C frequency
>>>
>>> You're looking for 100/400/1000 kHz
>>
>> Hello Konrad,
>>
>> This frequency value is used in the vendor kernel [1], hence why I used it.
>>
>> I did a test at 400 kHz, and the I2C devices (touchscreen here, and NFC in the
>> other patch) are still detected, with basic functions still working.
>>
>> Let me know if I should still update to use 400 kHz. I would prefer to keep
>> the value from the vendor kernel (and in that case, I will update the commit
>> message to add that information).
> 
> Hm, I grepped around in old vendor trees, and it seems like there was
> a period of horrid wild west wrt this..
> 
> I see 355 kHz, 384 kHz, next to "normal" values of 100/400..
> 
> Let's just keep it as-is, but please note in the commit message that this
> is intended and that's what the downstream sets too

Got it, for V2, I will add a note in the commit message, for this patch and the
other one (for the NFC support).

> 
> Konrad


