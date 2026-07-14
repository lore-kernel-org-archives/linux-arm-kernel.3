Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C53EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 01:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7Ilth6iiexMyu52cr63C3cGXl/20AI/2yHPhIPwQK0=; b=dy6vg7145JUWnF42Sl9b9bFkDQ
	XMMFlsdXivaqza1D4V38Tp65mG48wMxKWsH+HRy/9muXcLiAKARJdj6qLAL9vEcEAo+p8cYR6KDdl
	fmJfvF4daJs0EuErvO40qMQ4UJOq56kUWIfhkW/zcCA69mTi66ptJ9eisp1emr9sfALm3ntUkfUlL
	n/7fYruH1zHClEuN9RJtX04BdMhfG8MH5e33xoMbO7Ndd4SmajmSwQfD0JneAxzZw9uzAft4lElde
	+NHXuBzwSjSI6DpjxN14Kd9H4HzxzDcQloeQZHaKIc+BOMCFDjUONa49PRAz3OwSAJx2nET7x7ATa
	29mvRZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjRv6-0000000Afe5-1tZp;
	Tue, 14 Jul 2026 01:26:48 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjRv4-0000000Afd8-2J2G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 01:26:47 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1665278a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 18:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783992405; x=1784597205; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7Ilth6iiexMyu52cr63C3cGXl/20AI/2yHPhIPwQK0=;
        b=Sq/eTEjOILjXLm2HM0KKnbADNwUaHIsjP+Kxf8Pasuk5JVQep/L3ScBuPTjO8ztSum
         hvsPswwp16EZRSd0gWVwugcH3DrcHhlSdA8sF6GPlLaVl65kCa+r98Y0jZQn5p53WJFv
         DD96c1qx0cUh1YRjgMG0L3mGQnwB/4NHwEdT5MiA6TsreDxi72XQGeGwub1jj06oUy0v
         osFjOW+JXIW6A8+azSbZ5jcxe0F2o2csCcRnRql5hRT41wZlHpr8HAT2Yqfav5LCiDkv
         UG3zZZzrFMyivhKdXd6VLOlpxWr2z/R9+orf6GLj3vnUubimv4WMXGKV7wJLa4CLnSps
         GckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783992405; x=1784597205;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7Ilth6iiexMyu52cr63C3cGXl/20AI/2yHPhIPwQK0=;
        b=AhACZ8zGWbNxhIWg4OoVIeYLYWtmY1lryrCPk1o/ukmSkWDljtIuY8llrz/qS8ZcKr
         FOZUC7Imgk6uzxLrh40idu7mjzqkUgFK0xrEgVIic812Zzg3by6ucdVGiXLxpWEQfFmo
         mzXFXQUai93N8QgtSEzWdSZKhICHE8mm4FQHlu/mBr8QSoDgdsOOFrNer+HFvIniti/j
         yxLqiX7xSepcMyeo0qcp5sLV7/0xfiwJWlyjuCTFNmxig9ivZjCcK/oedFw15GB/Fsri
         Hhz42AdI0r43C8yCQsnqs/6gmxL5PApaGP+zhraGatlv32tARfaiSm2tVilkl5T/8ywL
         D/jw==
X-Forwarded-Encrypted: i=1; AHgh+RoRoNDy4kSVbekqq0TYtt/ViK64mKNGq7t7cCnw+uNngv4Gw3Qbz1mQUv59FlU6EZ9n4R6zx5om+4US5yfwVt/j@lists.infradead.org
X-Gm-Message-State: AOJu0Yz124qO8/heUVvkvGcYs2Y3RqkkrWq8VXUzmqdHqhwBNUB+4Hk6
	hDFCvPLvDrtmNh7lRMGQw72mTjUohaVnMK5TqnuTPQBkXIVaWvdENXhk
X-Gm-Gg: AfdE7clZFEHvFrd5vlO+1keFYEAu6Mo/ayYraY3aqSrLHPheB4bVKWnlXCAX+LWBn0G
	zzdXV9793dsBA4af2JcuvszXBPjhlBdK1FconaIsuOyg/Hs4uSKN/X/EfJ9uYoHLghcRVvUQmZX
	P2vbFitO0HCT3aXMNZYAcxN1NsvDBi0hUqBklySmveyGxrmfmEv7dZcdbomI6NUBg7jJXJV6fYJ
	bV03vMoJK/Rp5cvu9eBskY1WC9BcwoHnipaaHLo1NNYePPeVQPNHzKaHgC9x/vh7+qJB2CVHbVq
	cP2kwfO1ibTsm1WBukfL9EnPtIhRLtstNnVeLbHjAFxUT4VIRNQvO/ErTDO9qbDK1IzE959g1+3
	IYpPKxuxT5qjuj6m5mquwn53XR4XbIz0pIJhxVyKidqato1+EXIqfKKkftx5gYJPdMrNmAblmpK
	BvodYNmSOxkmERjc4XWsZX96ponDH6/i8CPI03lSkQ0Tsb/LBaaCRnfALJTda58P3nhA==
X-Received: by 2002:a17:90b:224c:b0:37f:9ce1:cdb0 with SMTP id 98e67ed59e1d1-38dc778a27bmr10194596a91.30.1783992405139;
        Mon, 13 Jul 2026 18:26:45 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1745a3fesm604483a91.13.2026.07.13.18.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 18:26:44 -0700 (PDT)
Message-ID: <fd2a645f-1144-4e08-9e3b-df06aba0db55@gmail.com>
Date: Tue, 14 Jul 2026 09:26:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend
 for dual-port and OTG
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260708103606.1462960-1-a0987203069@gmail.com>
 <20260708103606.1462960-2-a0987203069@gmail.com>
 <20260710-strange-prompt-python-c2e1d4@quoll>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260710-strange-prompt-python-c2e1d4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_182646_602077_80292306 
X-CRM114-Status: GOOD (  15.70  )
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


On 7/10/2026 4:54 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 08, 2026 at 06:36:04PM +0800, Joey Lu wrote:
>> +  nuvoton,oc-active-high:
>> +    type: boolean
>> +    description:
>> +      When present, the over-current detect input from the VBUS power switch
>> +      is treated as active-high. The default (property absent) is active-low.
>> +      This setting is shared by both USB host ports.
>>   
>>   required:
>>     - compatible
>> @@ -39,7 +78,7 @@ examples:
>>   
>>       usb_phy: usb-phy {
>>           compatible = "nuvoton,ma35d1-usb2-phy";
>> -        clocks = <&clk USBD_GATE>;
>> +        clocks = <&clk HUSBH0_GATE>;
> This change is really redundant. Instead, add optional properties like
> nuvoton,rcalcode and nuvoton,oc-active-high.
>
> The rest looks good, so with above change:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
Thank you for the review.
Agreed on both points: the clock swap in the example is redundant and I 
will revert it. I will add nuvoton,rcalcode to the example to highlight 
the optional properties. For nuvoton,oc-active-high, since active-low is 
the default, I will leave it out of the example to keep it 
representative of a typical board. I will address this in the next patch 
series.

BR,
Joey

