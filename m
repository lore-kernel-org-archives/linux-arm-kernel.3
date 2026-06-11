Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166ADCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sr3m8r/i7ovHfjfbNC82N3Y0eijmiJMV+xkhP6DvT20=; b=kJ0gnDi0CNfY4vI0OXBqe9lbbY
	eYfbCH+Yxq9kITEiCpyT+kjE1oIh2LtWCisfIZL+1u8buhSGxKvLm780HGWT76kyJ0q8VZA7b0y/P
	bqpJg310uyJmJk46T9Oa6VtLx4t652OTMsufvc5U7Vcy69akkh65LrUTuCdjBBKSe9dNfPeA3Rhwn
	UhqGAk+lY3LxZOktrVl8Lxj9x1fEjLUspH9XhOjXTA+wZ8LkLl6wh3U8Lyfkq0X2CmJD9RQu5x2+R
	nxmwUFqWrGWaKY3B1jAL17iVhI0SjrkrOXsnyEIvkG+HQ0whUCv3gH3LAcT5/1Z2svo0O/Ifi1A8N
	+457MG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXgW8-00000009b8a-15eh;
	Thu, 11 Jun 2026 14:36:24 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXgW6-00000009b6x-06pt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 14:36:23 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so2583684a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781188579; x=1781793379; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sr3m8r/i7ovHfjfbNC82N3Y0eijmiJMV+xkhP6DvT20=;
        b=XdNYn5pTaqpB7dVcjDcxLu1nWSiPMqoMvW3LrxSR1duEakegfS74EX5ccUFZ18wGsg
         VV1s9tVC0R3fS6SqaDmaUzGAr06jOWvkk2oQ8QNiRSr7xx23sRmshKMvdMloezXXXdRq
         15iH44oKbCTS8UUzN7PGc/yVa+b9JGg/ohcXhJKAik6O5Xpnh8y5Wt8Bdihix+wXq31s
         R5KsGn0+Fg7K/hN+5Kbz1X53UBP1BSxVkjmS7vrEmiNF5SnwFL+B2RYAxH2yDIRHdADs
         zZaO4A9fpRCJFfvFIjSE2D5Mnr3x7gA9m2xOwIMtYMkypmVnZvnhGFXYa2UO2j/7CIS+
         29Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781188579; x=1781793379;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sr3m8r/i7ovHfjfbNC82N3Y0eijmiJMV+xkhP6DvT20=;
        b=bflE5n6Utfllh5YwgnR1e8Cw2At3Rz/5p136UXwUh1iGp535wZGhNX4RZEqlVrSVz+
         RT3Vh4BSM7E5MnFUm6ntTHskNprgoLxGOFIe1+lKTC7JTfFoG9LT9tcBCHFXD1Hlbe4Q
         KvBy9r+mGcsYmQrsS70n37zB46s/C+nO0erqQ+pH2NBeCMJ8N2NMybuzjj41Aoc0z4a1
         dXpZkMxZhE2JfNJouJa5KhrPDMyERNJEOVEspkruRM6thbQfIf+tmH60wrlwYh1Rt/yF
         3hvWD8TSp3xU6u3+kKvuV8FzyOBvM8HAfgJAPBOfDG/E4zbXn3QgyyNgRaeX9PLYBC18
         LCnA==
X-Forwarded-Encrypted: i=1; AFNElJ+566G1Y2hzlBkfsNcnvZu9iybB17c989K1KmxwfktISNLRfBPvGlWVAqfkaC77WL+FSthSOXeoePsVe4kRKenn@lists.infradead.org
X-Gm-Message-State: AOJu0YwewaztRmyti+yct/veDzhKaXSIcZnPnhNF9Z6tyFX4++QU+8tv
	/Gvkpi7JIJ/mmnNSlyHOMe01WxwdFr/2VIb4y1xgvCVRfXV7CtH7V15OPPDSq/b+xJU=
X-Gm-Gg: Acq92OElEWTlsRZNkep+9sI4vGeFrjwz0SY/FTAc+RgQUVsv+E0ndZzVmjh0PmpoGza
	gcIgjnNvDsegaKG952bqkC87pVbrtfGb2/+JIXfCqth6RY7UnlUCCjzAvyKl/A57Ja5JKTSfpL8
	4fXwmxH+2BFgXZiuBvIjeG45lnBmyEVNHBSPVLcYySdn3gFdx4c79l/chJzgebulXp/uEJGWLkN
	LlMXzVoeMIB5cwloW/Au9NXqYOiwKwDruoq4OtcjVDoFASGAVyO9NkBrBswRSkedD5pQi4R7j/t
	G/fHE/5SqFxEYJRzzzPOnqxRfASC7ug5tREt0AT5lecY2fF7x+QahXEnpFXYQ5WXU0VDXv6TXkm
	SPJlN+gKuGZZ6fG2tionrCYb/zzyZFLTDPCFkeUqo3cml4GthaTskGj7SE0ynk49cOeJZg7Gyng
	Zmrqz4dX4/A2plOVkz0IsHZjqwroUtQkVrHhqvDxR8ITJpiw==
X-Received: by 2002:a17:906:6a05:b0:bda:8e57:5639 with SMTP id a640c23a62f3a-bfc85e9049dmr144570566b.20.1781188578927;
        Thu, 11 Jun 2026 07:36:18 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm7011436a12.29.2026.06.11.07.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 07:36:18 -0700 (PDT)
Message-ID: <ab1055a2-6916-4083-a360-62eb15171fe3@linaro.org>
Date: Thu, 11 Jun 2026 15:36:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
 <20260608-reliable-vivid-stork-f4ea6c@quoll>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-reliable-vivid-stork-f4ea6c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_073622_106270_111B9633 
X-CRM114-Status: GOOD (  15.91  )
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

On 08/06/2026 21:46, Krzysztof Kozlowski wrote:
> On Mon, Jun 08, 2026 at 07:36:38PM +0530, Nihal Kumar Gupta wrote:
>> Shikra contains the same Camera Subsystem IP as QCM2290. Document the
>> platform-specific compatible string, using qcom,qcm2290-camss as
>> fallback.
>>
>> Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
>> single IOMMU context bank instead of four.
>>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,qcm2290-camss.yaml    | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> index 391d0f6f67ef5fdfea31dd3683477561516b1556..4f39eefb4898ebc22117407f26cfb4f41deb111b 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> @@ -14,8 +14,11 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,qcm2290-camss
>> -
> 
> Do not remove blank lines.
> 
>> +    oneOf:
>> +      - items:
>> +          - const: qcom,shikra-camss
>> +          - const: qcom,qcm2290-camss
>> +      - const: qcom,qcm2290-camss
>>     reg:
> 
> With this fixed:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

@Nihal.

If this is the only change you get asked to make, I will just fix this 
up on application for you. There's no need to v3 the series for this.

---
bod

