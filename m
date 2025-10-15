Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050A1CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 19:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mjpeIrj5Li1/mScwEA3BsQSOlfS1kTZ1a40z447tpk=; b=EHS1Q2/Tsmxo3Xu4F6wslquv7M
	qcZtsB0hSRKTDOgrkzEZWUBfZ0VgfNXXVkxC4vAoYPIOTGIn9jV+nI3K3FSHFJI/WtpqjutSGkOof
	q2fU645QmFHQKxAA+dTrCg+WMCyCF3pNIEUP4l2ms0VXnscFnEEaTRPsOa+zY1JsaGtzpUtJkyP+8
	apJVWtHOBLSyvnH+OkGFKDuuSB1f3uwu21MSr0Byx77vtgrzCo+BV4bIb++3yIlij6cmRoHroax7X
	R3o5N3zEuOK6icajZaP7p6WZciAK816e7QaVHLSkXtcUB3PT9JM1C1+RcxrfMNWE7AKp+QoZg/ESQ
	zNo+Xugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v972u-00000002hlK-1HzR;
	Wed, 15 Oct 2025 19:20:24 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v972p-00000002hkV-23kU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 19:20:22 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-37777f72838so1186621fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 12:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760556017; x=1761160817; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8mjpeIrj5Li1/mScwEA3BsQSOlfS1kTZ1a40z447tpk=;
        b=Hy0BWSCFD8Ix6OFbWV/9+a7x2baFhcjCg1xzFoXJ0y5Q5RENf8UIGPAoBI1tpWM+Nr
         BzzPYi0qVOLJwBsvtEvEwKugRIBOpLnESYVuI0L/XxrXaikoikwVOCWchbCBQZbiFoAu
         BK2MGvNyFy3tOxdEbnBH032LmrTTXkHk3vyqCrAZtFbglTszG7/bkJNNkp1YNNF6MduM
         vsBf0a1ygzhfVrDlTR++4b60sGj/beI9U/Rgpp8AA/faYuLM6Fbidq79iuQqzm7BpZvn
         dwYVAYD0MVlmZaQ+961Qiic7OXgPslI3Cn02bczW0Ip19n2lHiJ+r43zJ6jMkJhi8H5x
         0pQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556017; x=1761160817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8mjpeIrj5Li1/mScwEA3BsQSOlfS1kTZ1a40z447tpk=;
        b=M/uiQ/4B+YeTCDSQ0xBtF2p1X8nUPt9UCbpz5ZOdm//TxxZAIp2YADCCx9oWKFUHC3
         TRv1V+s3jEjyktQY8g+wZNQC1UUGqYYFfkiqJJMa8mOeROyU1LtXbLdmC0i3LOcIa+HM
         cwyNzLprfSjOdTV/uGeGJRH8PvflvdchQ9JaPlhc0DOyLi80reUbq/o7uWfnp9cwn10y
         ejQHQ3bbo8IpBFimtPqzYDxOw2Pyh/Cr+OEfynP/YgtaDKc4v1alemvdps7I5nIsAp5r
         c58lDwvz7ERxFWRKfxQmBiGTyAk4hfsxAKvE/rtJF3A3zqyjGEw1XcV2sSDnmTlngigH
         PSWA==
X-Gm-Message-State: AOJu0YwoCCu36AY+8JKuyjg3cocRJOnVrs46GmeJChupsjmPj9IFlbKT
	sy7Dq95So0DFcDcmHbkbi9ciukZsVNYrdoMG2iAE+IX5y7W1BSe9z5WU2GZBGLT2pIM=
X-Gm-Gg: ASbGnct1c+qLz/wjIz8atUBdIGRTKk3QXec6pzjAwSkGy2QuKkn/pPKXgfDug6cqTZ/
	IFBAN4DXa5PjtSGDsT3F7eUlPN4BSPhCkoyTrk//H+pFIXOz4x4NgDxkUK3F8npvX/FOTj4ITTI
	XQWjJQOz8A1gIixz2ZR6YasSNZpGF4+P6Y8pY1frEVKx45cDOjCTFALUjFpvv5BZBP9fxGiJdaZ
	KvplHEKRy1TM8RipuYL3L87MHDCD5EAbmPA+2vqCS5Scu+TnS0t+h9E426FG1f1vZ/SZ5+3AAIF
	YlFRs3qE3kiII7U48hm7oStjFxac9tOmF84/0FkOFOflUjCr+R4mlnnem0Ahk6RhVT43jR30gTJ
	KHePIEWeKqY0LjyqUUi7QgBDIo6l9b19rgqfG6Pl6cAntTOrsWd7JfQ44b2LvPJAQfEJuV3HzKN
	Hl+UP/8czjKEiaAw9nK5iAxpiHkcql+ijhtG8Q/SvtBp1ZzLecyUyfPSPVHmA=
X-Google-Smtp-Source: AGHT+IGIsRWmI5ge5lUIdUu2k73q0laJqSFh/LT9P2c/QCskl/jxZ4XreU8Hx9BrNbAPGj0+NboZdw==
X-Received: by 2002:a05:651c:41d6:b0:377:78cd:e917 with SMTP id 38308e7fff4ca-37778cdeb32mr7411751fa.0.1760556017299;
        Wed, 15 Oct 2025 12:20:17 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762eb6a963sm49042991fa.57.2025.10.15.12.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:20:16 -0700 (PDT)
Message-ID: <4eb4bb48-a8b1-4e58-a41b-b9277fbff6e9@linaro.org>
Date: Wed, 15 Oct 2025 22:20:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,qcs8300-camss: Add
 missing power supplies
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
 <bfa0d4f2-45c6-463e-8afc-d90edcf8cf2f@linaro.org>
 <15b35191-eaff-4971-bae5-2d5a8cb9f864@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <15b35191-eaff-4971-bae5-2d5a8cb9f864@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_122021_426144_5C2F4A4D 
X-CRM114-Status: GOOD (  16.18  )
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

On 10/15/25 22:12, Bryan O'Donoghue wrote:
> On 15/10/2025 19:41, Vladimir Zapolskiy wrote:
>> On 10/15/25 16:01, Vikram Sharma wrote:
>>> Add support for vdda-phy-supply and vdda-pll-supply in the QCS8300
>>> CAMSS binding to reflect camera sensor hardware requirements.
>>
>> What are "camera sensor hardware requirements"? You do add properties
>> to the ISP.
>>
>>>
>>> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>> ---
>>>    .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>>>    1 file changed, 13 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-
>>> camss.yaml
>>> index 80a4540a22dc..dce0a1fcb10c 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
>>> @@ -120,6 +120,14 @@ properties:
>>>        items:
>>>          - const: top
>>> +  vdda-phy-supply:
>>> +    description:
>>> +      Phandle to a regulator supply to PHY core block.
>>
>> What is "PHY core block" here?
> 
> I mean come on, I think the meaning is clear.
> 

The meaning is clear, the expressed concern that the given description
of the property is very unlikely match the meaning, as well as the
description of "PHY refclk pll block" below is the mismatch to the
meaning.

The misleading information shall be removed.

>>> +
>>> +  vdda-pll-supply:
>>> +    description:
>>> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>
>> This is a copy-paste example of a known to be wrong pattern.
> 
> You're right about the name, please align with this commit
> 
> git show cba308979b012664c7fe7c5baa818fcb68e86363
> 
> Thanks for spotting.
> 

-- 
Best wishes,
Vladimir

