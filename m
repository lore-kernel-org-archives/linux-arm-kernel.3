Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BBFC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 07:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGDYyJHeIvbN67HiPEdMBYxe4lOwRgtICljAixydSZg=; b=HnOreo/PyVuv3oQv1O9xoB/U4D
	s8RhhdLuEFcJcuIejo8yq1Rr+7mAlFT9IWE+t+5RMPiZzHMYVi2Bh7aqkPYxFBN4BBhfEObirZwYw
	lzJ0CmNVlTFoCpuH2RTsTa0j8rIdxv0d3I+qLtIDENUW6yLcVDa/IAFBwqdKpP3PnKYj2TQQEV3LD
	BEfSZfjudgaFIX0nyyhdIcQ7bTRkZPjeqESPf+toR6PRSfPonI/S/t5fuClN9Uf98rjMn0rH7Ajzc
	zYY+GOO1yZ059V4wOfmRLdNPxGWEuc8/6hC2UWKgu743SSiz5aoLlAZzG7e5RDRlNLvYACKAxhS/8
	ZwFlIv3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmSiB-0000000CXvN-24e2;
	Mon, 24 Feb 2025 07:17:07 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmSfQ-0000000CXPS-3DiV;
	Mon, 24 Feb 2025 07:14:17 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38f378498b0so3407876f8f.0;
        Sun, 23 Feb 2025 23:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740381255; x=1740986055; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YGDYyJHeIvbN67HiPEdMBYxe4lOwRgtICljAixydSZg=;
        b=AAA8S3R35C4b6nX20fp3aiD3qNUct8KABJvFAr8oviBpmLb4MP8rpjnMhLbTXuUfxq
         IJvsAgic9vnbpvVh2+Hm2Vkt34nhkjWWTcWoe2jdW6D0yuoA0tnls9myDfLG1GJ08nTM
         45EvSP0Fcn26Dok2G1A2RcNOo3aoly6dK7zYAf3Ymk+D60pmKV6gXJtJVYoSq55flD77
         SX8kVjUh9tNOWzDzJxwqImMte4JmyvfLIkYqLkHX3D+w2QPsVqEs68JlNWcz0I3q3aKP
         Lc8CA/10agYc605KRlAY1ni14eHkULHNoVruJh5c2nD6SYaXfW+VXJ9Hek9er2hjBZiQ
         phoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740381255; x=1740986055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGDYyJHeIvbN67HiPEdMBYxe4lOwRgtICljAixydSZg=;
        b=c6W+OVeuU4x0lvoZmVlbZZbn6Y5555pgav9MLTGHP+j3ZoPgVJtT0ZvSjNElNkJtDi
         8nrIESIcw0SQP4K/goBNSSX/4ZgNrqtcPh/HNb6bp1q5YksnfTCwaPrSTfZDfQCjWgAs
         V6IO2ZmCbyHb2LmPa3aVpMDkE5GhAcZkzUIK6aHwlJTL/jRdXIA46DVSJPlo0paPIHha
         dOB8V+UDBoCyoRme3b5X7W/4XLMMUSd0MJ0MEw4MLPwdyvUDe+qy/7Lsj7Kn14Qp+GAw
         N/mSzHdFpnhZtk5jJGi0zPmG4kD8EmgrWcPXiBmRdyAxW8pVFCRc4VdBTx6TevFyyz/p
         ZLXw==
X-Forwarded-Encrypted: i=1; AJvYcCW1uJhfUOuYvV6Kg1eeA2g+tlFrWQJhWRH06wIsyY3OWNk8PxvJedztEOv68lU26rvnC6fLmao15necpTD3/yEd@lists.infradead.org, AJvYcCXVSMhJjQYosIkb5sGXpWGxWMXdpmIWmP7IrhCICmnIPIiS5K6SuZaxYKHPRBTdCai/M5B/mwwae0HI@lists.infradead.org
X-Gm-Message-State: AOJu0YwihHZQaFeoWEpZ7Ej05BC/Ddil47wTf0mznzXcyzyxOdgl4P9N
	pnl3BJDdej5LCjUrfgBoFLTI/nQT+MmBCC5wPzqvxe11XsjLI6JyUSY/GA==
X-Gm-Gg: ASbGncueboIO+q+VENR5zKmn0SLPsxUlcyZ4v8OuCu63z+OFysTuOsH/+OE3M8cY4Gv
	lS4vwqe4/W5W+jM1+zQQX/MOe6jLs+63S8VtK3tWzsgTiPcbRXs7BKKxeZF1XSKbH9vWkMIiV8D
	bWGn4/g+/nowI40zOTjhtEsMm5COA+SUWEfEeOkFJPKFACJz/6EUHfw9kRhC66L+Zf9+uTcGM+Z
	WF2tKW/iknLlegX6n1OuyuMHdNH3ct5hubk7qB3Z1id2EBxr3oIm769fC9WIqPxdPc+ZnwztRmu
	hgzW+30vQA+t2Rdrau8S3avu5rK85s0UPmznSsiV
X-Google-Smtp-Source: AGHT+IGwNUNxA01WRc9bPdVz1GSmsf5EHfuq7knr43OKBQrWqaclxDJN2pEyp9jAXY6JIC3+Wo1lJg==
X-Received: by 2002:a5d:5885:0:b0:38f:2a32:abbb with SMTP id ffacd0b85a97d-38f7d1ffc25mr4536838f8f.4.1740381254826;
        Sun, 23 Feb 2025 23:14:14 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399be79d92sm111533745e9.0.2025.02.23.23.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 23:14:13 -0800 (PST)
Message-ID: <3d23ec54-6e55-4ee4-bc1a-179ca97878ef@gmail.com>
Date: Mon, 24 Feb 2025 09:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: snps-eusb2: add exynos2200
 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-3-ivo.ivanov.ivanov1@gmail.com>
 <4tvpl3pujnuw2qjwu7f7ryrr5dndxow7srkkp2223wmexr23bi@7nmgrpq6znpg>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <4tvpl3pujnuw2qjwu7f7ryrr5dndxow7srkkp2223wmexr23bi@7nmgrpq6znpg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_231416_813242_21CAD901 
X-CRM114-Status: GOOD (  10.91  )
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

On 2/24/25 01:43, Dmitry Baryshkov wrote:
> On Sun, Feb 23, 2025 at 02:22:21PM +0200, Ivaylo Ivanov wrote:
>> Exynos 2200 makes use of the Synposys eUSB2 IP, so document it in the
>> binding. Unlike the currently documented Qualcomm SoCs, it doesn't provide
>> reset lines for reset control and uses more clocks.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov@gmail.com>
>> ---
>>  .../bindings/phy/snps,eusb2-phy.yaml          | 64 +++++++++++++++++--
>>  1 file changed, 57 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
>> index 22c77968f..f4164db71 100644
>> --- a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
>> @@ -23,6 +23,7 @@ properties:
>>                - qcom,x1e80100-snps-eusb2-phy
>>            - const: qcom,sm8550-snps-eusb2-phy
>>        - const: qcom,sm8550-snps-eusb2-phy
>> +      - const: samsung,exynos2200-snps-eusb2-phy
>>  
>>    reg:
>>      maxItems: 1
>> @@ -31,12 +32,12 @@ properties:
>>      const: 0
>>  
>>    clocks:
>> -    items:
>> -      - description: ref
>> +    minItems: 1
>> +    maxItems: 3
>>  
>>    clock-names:
>> -    items:
>> -      - const: ref
>> +    minItems: 1
>> +    maxItems: 3
>>  
>>    resets:
>>      maxItems: 1
>> @@ -58,11 +59,60 @@ required:
>>    - compatible
>>    - reg
>>    - "#phy-cells"
>> -  - clocks
>> -  - clock-names
> Why? Clocks are required in both if clauses.

Right. And "ref" is a requirement. I'll fix that in the next revision.

Best regards,
Ivaylo

>
>>    - vdd-supply
>>    - vdda12-supply
>> -  - resets
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sm8550-snps-eusb2-phy
>> +
>> +    then:
>> +      properties:
>> +        reg:
>> +          maxItems: 1
>> +
>> +        clocks:
>> +          items:
>> +            - description: ref
>> +
>> +        clock-names:
>> +          items:
>> +            - const: ref
>> +
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +        - resets
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - samsung,exynos2200-snps-eusb2-phy
>> +
>> +    then:
>> +      properties:
>> +
>> +        clocks:
>> +          items:
>> +            - description: Reference clock
>> +            - description: Bus (APB) clock
>> +            - description: Control clock
>> +
>> +        clock-names:
>> +          items:
>> +            - const: ref
>> +            - const: bus
>> +            - const: ctrl
>> +
>> +      required:
>> +        - clocks
>> +        - clock-names
>>  
>>  additionalProperties: false
>>  
>> -- 
>> 2.43.0
>>


