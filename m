Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC77CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 19:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zX0FQJMNOkesxTSiczvMscK9aHeUEgUhQXWADwrmqhs=; b=Wefcyv+X0UgGGYaJbrSXcb7QDf
	fE9G6OufXjq+u2+4Poc8iwCbaIpecmdghZgM875Ra1vsDqiszsLuVXSGmt8tqnwc228R8LB4z0j/r
	T//wF9p2DHqdH3YJeMOKyfvPGNp+SHPgO1HgoUJRuhwRWgIw53vPLHBoDUasZczIaA9FN/mSLQ5Tg
	yjH7G4rOOh9FcriuHJTiovlAjZ9E8GxOjIhZSEMcUSjdUUuh2zczXZD5EnmlrkOP8fMqYUzU1rdYK
	JG8hLvlybJWvyPVtNbkA7wvblKNi5Lvt75kt3T5Lls+R5T1al/B/tUNxpBkO1V2q90rZMi8yNpXBL
	SI8sVXtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96vE-00000002h2w-0N5C;
	Wed, 15 Oct 2025 19:12:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96vB-00000002h2J-37D7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 19:12:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so52332935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 12:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760555544; x=1761160344; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zX0FQJMNOkesxTSiczvMscK9aHeUEgUhQXWADwrmqhs=;
        b=nnKzjHGMwvBzBqXXRcQyumF9Q0gcm4yVk8sphI6UBgTYMtSkA/MLoowsHp2mILgetg
         oNmpZTcM77q9vhXPT0oMAeVrKyWNBPPdEKy+fZ5QB/5t09rgcLokObU1BNfDbAE7GAsO
         IpEVAVMQT1h4vstSEKS/sfmUgxlM4DPCLzl0+8h37e9FCsN0NZ0d6fiVvhwwbvUOD7Za
         MipPpUBVuVvoF1FA+M3jU34o+zxEjl15X4iJM4xd23wKFwhGL9P0j6pp7oR3ggDO8E0K
         Z/EGlUm7KOkcquS4YvypnYsRrAxndCuoA3LxodZTVgCBu8rgy3z3RakV53NmxIa1DST6
         7YpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760555544; x=1761160344;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zX0FQJMNOkesxTSiczvMscK9aHeUEgUhQXWADwrmqhs=;
        b=WyJYLS7gi94eGPIwQK7MhYAXPAiaB1gsNvh18WACyAIc21SXFmpTORGej1LGnPQcjX
         02HEAtkuhzNTOGRv9CdfUw1l0YrbgktIKIOCl3VujWDGjwP0MBJTni/w0obVR/a8UBR/
         aPaZRxBU+3qbllHLKgFq5bGBKhwlkqcJp8PZNhmSmiTdCyrRNmcJvTdWqaIGW9YxKRC4
         mljQ28e4ZHCfiFLSkqNc02o6fYYR7yDLWKXKZ9LoxfkPp+x+Lt+zi2wffIxd7GuU5PIZ
         4XsUeC0LntKiT/x1V6+kRu1qyeTdvVFOc+usiXiQhQ5FMEkYVI0LDp2gWwVzCuHFm/ZB
         0n8g==
X-Gm-Message-State: AOJu0Yyzg5Bh/GK4jaOonSJPPFDdHjKd1t12nopwMGDTqJH2PZoVUczU
	+Sigu+fcTdBy+t/6icf2a31vhO0mqdYYWLhitipsUH6ASgjH1SdfmGuqFIpYGBmvhp4=
X-Gm-Gg: ASbGncvOS5Gs+rDioB3JaXpVGCBswz9XnEshQHYD9oNsgd8kIDcm/PigAnwXf/io/i2
	geNm/Ra+Cx3TPHfBiwqFjR8K1KC8w53CJCGcERXlBd/gljoMnlimGI4dToKNSwaBUDlyR+r6yuQ
	CqMFBnepvMyPl784xX63xwgSDHby524xFxYkP/bm4DmlHWZfzlngeTYYeW9nkN5GTRQiew1mc/z
	95WEzMFQ8er0OMLaBEbM4UQtPVAd0pbx8CUY2UVP3Ph/ja2iW5dFWbbNpv6lDcaF2am69DRVtPb
	DkKYhwilJLsrnWyWwMTnMRIW+3fwiLVpeRKrVVvQ5wtnKcRs7HSO4iQZIhSHgJDOBI9K01Szv/h
	yIKB475ZxYcpclqyBMLq6O2S8sbg8TzzyOO98v0SsmsQZRq0t4yA/o93TfEIUXMJnSvMoNUX9uy
	LdryXJX20quGIZkNJ13HaI1A==
X-Google-Smtp-Source: AGHT+IHbd0cW44W3/gflLhZW99H6UzVn2a320v+osYcGxzgftCt49JmvdlRHRiYyZeC4FCtJAzNpwA==
X-Received: by 2002:a05:600c:6383:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-46fa9a8b48dmr229438345e9.6.1760555543790;
        Wed, 15 Oct 2025 12:12:23 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d49bsm32016093f8f.10.2025.10.15.12.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:12:23 -0700 (PDT)
Message-ID: <15b35191-eaff-4971-bae5-2d5a8cb9f864@linaro.org>
Date: Wed, 15 Oct 2025 20:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,qcs8300-camss: Add
 missing power supplies
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <bfa0d4f2-45c6-463e-8afc-d90edcf8cf2f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_121225_798700_61057466 
X-CRM114-Status: GOOD (  14.09  )
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

On 15/10/2025 19:41, Vladimir Zapolskiy wrote:
> On 10/15/25 16:01, Vikram Sharma wrote:
>> Add support for vdda-phy-supply and vdda-pll-supply in the QCS8300
>> CAMSS binding to reflect camera sensor hardware requirements.
> 
> What are "camera sensor hardware requirements"? You do add properties
> to the ISP.
> 
>>
>> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300- 
>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300- 
>> camss.yaml
>> index 80a4540a22dc..dce0a1fcb10c 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
>> @@ -120,6 +120,14 @@ properties:
>>       items:
>>         - const: top
>> +  vdda-phy-supply:
>> +    description:
>> +      Phandle to a regulator supply to PHY core block.
> 
> What is "PHY core block" here?

I mean come on, I think the meaning is clear.

>> +
>> +  vdda-pll-supply:
>> +    description:
>> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> 
> This is a copy-paste example of a known to be wrong pattern.

You're right about the name, please align with this commit

git show cba308979b012664c7fe7c5baa818fcb68e86363

Thanks for spotting.

---
bod

