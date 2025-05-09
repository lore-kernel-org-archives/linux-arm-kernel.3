Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C77C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lz2WGV5DsARe2ef6xf9hB2gw824v2BlYjF+3OFaRa+Y=; b=X8/Fy/TThrjZ55rIS2hb6T7L2I
	SVRfd7J3iCz3QOLw0ZDw4NKgT6w4/J+fuArBs17PegKSBbAiOKj4CQkIt5V1HXS8cKB4EIWl+D/7c
	Bs7mUMr6k9EmCpQUc7JH8PqNpLbHrOssDiUfXse7cZ34zsy3cTCYnTcGITJ7oiJPBsO+HYu0hY7tU
	cByu4YjUn6VRGI7r8RV2sOU2pz+MFlXbucdPKv4IrjV4j1ZyanQUaxZQHGRnLnbMlOzpaxwKTScSF
	2bTrTMQbhn0plWEvrbtrqClRajxK3SsB6SqYNB8AHoIUb7XZxF2WC4sZewT2pRbs1TqIa+0HzbWqL
	l3SjFG/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMpC-00000003aTa-3JAg;
	Fri, 09 May 2025 12:27:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLs0-00000003Qlp-2Kwy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:26:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso9145835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746789983; x=1747394783; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lz2WGV5DsARe2ef6xf9hB2gw824v2BlYjF+3OFaRa+Y=;
        b=xpyRQu9EWG6CLR5hxCnN3z4TKw3nEsLqKuK+Y3K3QqKAXXFrMSO1veoEZkkrZx1L/7
         FWu4/c0PRtxqXV224fJkB1Bp9ziR8k/Q6pEzRxh7bUsunZsYcn7u8P8dS5n4+dkn4KJl
         2D0YDOvYSXWJDU5AcSIXZgucLUioWNGfO2I1lHnZtUfB01IAu7KcK3nmp9Y6qQd3rF4O
         PGVV8rwcn0Q9IOrgkgp2IprODx2c4dOe8wRnqW+c9DYgkDy3gm0305z/0INVx+X3sYDc
         CUvnK2VpRY2fowaRGFc+hUh0eGhN1bK8kXpDzSH3eKIDIv2zbkfzCb1jDFzlhp9xiARv
         x61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789983; x=1747394783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lz2WGV5DsARe2ef6xf9hB2gw824v2BlYjF+3OFaRa+Y=;
        b=GbxlLCx3C6Rw9eARih//WCGEYvN4IDG4Ul7CX8cDH0ahzrIGWshnS38dPg3VkU8q+p
         NbAE9LjyZUwfGlUGQTcb7aPAju6SBtzT74uV3m742DeokQVLQ3uHa2ld6XsxbQa9whdB
         aB3ucf9Rnhd6/U+tJtCp6mMW5BjO3f/pu+p/NbR90hbaTDubIAuHn1mM0/qV8HWJ0uM0
         Dksgwk8FA/R35LF4yUBMiyMjroCumsxJ+QP1LEuTVzd3kzphLTcSj5xK9M/MGvkPeKY0
         jLcbZNmpGYEcMBdfod/iszH52BH++ud8rJnT6qOwCRzAoQq9UYRFeB0raLg8/GpU04GE
         R6Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXnEPbzGvXlYUdobpSeTZncwQdaTMMkqsHzAKvbGvfYbiv7JjcxQeAo255Er3k1BeGp6yiVjojwHd/A+J7oh6ds@lists.infradead.org
X-Gm-Message-State: AOJu0YwX3Klt4dmbdKyqQnn3qdHWR7VjqXtWryyW7QaXsIAjJ67i8HM7
	dCuUJO0xHAVWhtdbalDa6uFxhri8UDbKcBIX8nv5VlKGKcHgoKBUHVC9jibG8ao=
X-Gm-Gg: ASbGncvePrfX9K+EsH2Ka7/HohVB0bIYbAKdNVw2bDtsDjjv4gJcnGHASK6ZM1UnQDt
	Md7S7X5zSlXp4Nb6R3kVHUWxgxyqxaMurS8z52dwANKB/0AWrd5TIoXKSD75FkQYUyopjlY2at/
	MBMG+wKHstaLyF9AmQfm7wqN8ndPhXQQXhdHjEilRtP/Ij9tm5g06Jcriwe79Sl6PaHK6vgjxZb
	cOL01pnFmfMIXG5dJbGdgfwKNY++f+ei6e4b+JTMYFymRRpTlfl9W+uQAWm8JU8fYNFbTJ3WWDy
	pXLZp6kYwDCA/t2fqH6ENXRPD7XuSoRcCOnZ8PQfWQo=
X-Google-Smtp-Source: AGHT+IF1DqZRXwnqEDJC6RoEDZ05/IxWbN0y1MNMAHjLg08+G1rqNk/P8xMlNeorPMh/z66y3/jqUw==
X-Received: by 2002:a5d:4fc7:0:b0:39c:1257:dbaa with SMTP id ffacd0b85a97d-3a1f64b5a66mr2078868f8f.58.1746789982795;
        Fri, 09 May 2025 04:26:22 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c7a5sm2992122f8f.98.2025.05.09.04.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 04:26:22 -0700 (PDT)
Message-ID: <4dbe2a87-2c03-4565-a486-41d4116892ae@linaro.org>
Date: Fri, 9 May 2025 12:26:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] dt-bindings: spi: dspi: Add S32G support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>,
 Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org,
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-12-32bfcd2fea11@linaro.org>
 <af92e978-e6f1-43db-8a84-334e7dd0d43d@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <af92e978-e6f1-43db-8a84-334e7dd0d43d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_042624_808360_28B06DE4 
X-CRM114-Status: GOOD (  21.50  )
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



On 09/05/2025 12:14 pm, Krzysztof Kozlowski wrote:
> On 09/05/2025 13:05, James Clark wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>>
>> Document S32G compatible strings. 's32g2' and 's32g3' use the same
>> driver so 's32g2' must follow 's32g3'.
>>
>> The SPI controller node in dts can define both host and target pinctrl.
>> The selection between them will be done based on pinctrl-names. The
>> default pinctrl will be loaded first and will be used by the host. If
>> the controller is configured as target (spi-slave property is added in
>> the dts node), the driver will look for the "slave" pinctrl and apply it
>> if found.
> 
> 
> I do not see any changes in the binding related to above paragraph, so I
> do not understand why are you explaining driver?
> 

Yes it's probably a bit verbose, it's just a standard SPI binding that 
also supports target mode. I can reduce it.

I'm also not even sure the "slave" pinctrl part is correct as I was 
testing it in target mode without any special naming. I will double 
check that too.

>>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/spi/fsl,dspi.yaml | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
>> index 7ca8fceda717..b5fac0bb142a 100644
>> --- a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
>> @@ -23,6 +23,7 @@ properties:
>>             - fsl,ls2080a-dspi
>>             - fsl,ls2085a-dspi
>>             - fsl,lx2160a-dspi
>> +          - nxp,s32g2-dspi
>>         - items:
>>             - enum:
>>                 - fsl,ls1012a-dspi
>> @@ -37,6 +38,9 @@ properties:
>>         - items:
>>             - const: fsl,lx2160a-dspi
>>             - const: fsl,ls2085a-dspi
>> +      - items:
>> +          - const: nxp,s32g3-dspi
>> +          - const: nxp,s32g2-dspi
>>   
>>     reg:
>>       maxItems: 1
>> @@ -114,3 +118,17 @@ examples:
>>                   spi-cs-hold-delay-ns = <50>;
>>           };
>>       };
>> +  # S32G3 in target mode
>> +  - |
>> +    spi0: spi@401d4000 {
> 
> Drop unused label.
> 

Will do.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof

Thanks for the review.

James


