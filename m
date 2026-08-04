Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07586C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIv9dUKWHm/aOpY5+JLW7X8HZjzTHsriJBw+UKX0NNU=; b=UFoCuyX1rKfjGqA0nbV4MZkAI+
	aQHcD/qIWCULHVxeLB1hh71wNq7QvaVYbAGlkRovI70/jxrtZ4XoN2KPTgFIGUMm8+pjBS0yWFoid
	YWbhPdDXEEPAs387t+hj5giM1KxHURFY10HasERQ9tdKAI2tg+3RcPitFChotuqNXEweInrq0wmGK
	drwsRO03orCc6XlB/NNc3nqdW+XQw+LlSeV+uQ/g2q4tT1eYQSL0a9x1z0Ic0mkSmR1qSj3CT619t
	nsq/eNhPhQTPO4gIuAz5DL8DbjDxJIilCITlXrRKTVr0rQ1Za1YwGL2ksC50y26xlXmETveh2PF03
	a95wIwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9er-00000001FGJ-2j0U;
	Tue, 04 Aug 2026 07:33:53 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9ep-00000001FFe-3JgM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:33:52 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38e041ea211so4490349a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785828831; x=1786433631; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XIv9dUKWHm/aOpY5+JLW7X8HZjzTHsriJBw+UKX0NNU=;
        b=OR3ext4Cem3hmMtjYFj2SFy5V3fEI//FK7D9zMSfzBmHHim1cn9xO3FgCJhSmcafEr
         3Py1CenXUtEz5EIL8eDN43CecG5ejRYHCTf4PzzjDinkznYTuLpijhYn47EQocICrayr
         5xmIuFdQLlxO4kEnXdxqEes8IEGJlpdDd3R3DvXTxXQpl6JxgJKKPA8Xj+U/4S8hr64x
         UwRAjr51+QW383oCRfRJ3Cr8MmUPF9wxtpUekByg5R3rrqPddhfsd15iag6IXFEL77Qr
         6gMzYKM5+izqCS4+lWKVSXhHkL7fOIHcfcBq98RcrfsrnxvMXH5p1XIoVcx7O1wMFowg
         m/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785828831; x=1786433631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIv9dUKWHm/aOpY5+JLW7X8HZjzTHsriJBw+UKX0NNU=;
        b=ShrE7HqJ2W69Y6N3hiOEYgfZiuII1A+kwMdsGZ/bFuz8ewOAhTKUiHHagZ1PFsZ9CI
         sv/qW07VReJ02lCs8FjRPEOEl3xCaBGKlhbLSfP9pwnFkXk4W1mLjb8o6e0Yhgh0KnDU
         QMJv6VoXHnOJdYDdwc5GbIwAwPysRxZq5DEt8RN1cQlc6lXLbQPR48BsXY04Hi75nmrM
         YjSjoSqZLRB/AEP2do9MOfSwlJZkx4THNiyP/s8v/YOya1caAkfOy30e6kxkpbMpmpV3
         E/1wOtTC8AdznphZtDbp39hSN/s3H1D+22EAzjF0P9IiNBAAl2gKZ1Eba0H7/ECE2RcQ
         RnKA==
X-Forwarded-Encrypted: i=1; AHgh+RrXa1rVPc3hivoFE3YPHy2Z1d661Sw0gJc6klWoWJMetYXcKvTxqHxaW+Q6jYuwuYCvgklXmaNNxcLPmdkK9v0U@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd9ZiYOp6y5nT4FUs9pjPKrz5rv3F0W/XaCY32ixqfzU7hicav
	phyGtikBAfaQnAs+oY6k86WiFkjvXU3a9lm4L6QYP4ax+diWuvPEKhHI
X-Gm-Gg: AR+sD12wfEXEgEUaDb7o8P40kSCvKSy02Wyx956/0QMA0BbLMDIzZj9VUiL+u9TZxtb
	1wdPMDoYGAzs7XmLw62x/Kv08s74FiiiLvw4jTCJpCYjFcQpIdhZkJPrKmUuhIqZJv+ap/dh20m
	RBRRlGb1gvRFa1HVdjdEZ7sYhAtJimjUT/2BZFj8aBTxgKUVx8DxtC27MhDeRCyt05yYSzKAxFU
	WCyJfM5EPDDHkMEMiawfWjZ3a+N0SV0EmB1kXdPD/BYI/dmaS04AVRtcgL6UPLyuqLE+7McjMy0
	tPIxPIcrCjdHylJ9bqA3UZD1Y6Nu6CNz9Qui7gcye6lH29jc+oNx/oZog0RCx4RhiIJl/Hq2Q87
	cGE3EVaBNR2s9LsPuFitHxuSlnLGEFPMAk0MqPElVkLVReTcnWMpzHIHQmluR0sfjHV9c8oDCRQ
	83BMbSLCwzMfXIB0xjiVrdqEFpGUm9UfqRn+68KXabghYQ5rqogu3ebPsX+t41oJA5uXJeDdeyI
	wilfAQjGG3B4CqG/SO35wOu6b1oUJWAmVpcUcHwpWdpEJvQI9rY
X-Received: by 2002:a17:90b:2dc4:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-38fbc4067bcmr12402842a91.6.1785828830448;
        Tue, 04 Aug 2026 00:33:50 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fede7ad70sm864284a91.15.2026.08.04.00.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 00:33:49 -0700 (PDT)
Message-ID: <6acfb226-e63a-4c41-b67e-8d8e6bf93b2d@gmail.com>
Date: Tue, 4 Aug 2026 15:33:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Allow
 additional GPIO chip selects
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
 <20260803074913.1656675-1-cwweng.linux@gmail.com>
 <20260803074913.1656675-2-cwweng.linux@gmail.com>
 <20260804-smilodon-of-imminent-recreation-aa579b@quoll>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260804-smilodon-of-imminent-recreation-aa579b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_003351_831996_0C47FE77 
X-CRM114-Status: GOOD (  14.80  )
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


Krzysztof Kozlowski 於 2026/8/4 下午 03:05 寫道:
> On Mon, Aug 03, 2026 at 03:49:12PM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> The MA35D1 QSPI controller provides two native chip selects, but the
>> generic SPI controller binding defines num-cs as the total number of
>> native and GPIO-based chip selects.
>>
>> Remove the maximum value of two from num-cs so that board device trees
>> can describe additional GPIO chip selects while retaining two as the
>> default chip-select count.
>>
>> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
>> ---
>>   Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> index 377ccf4fb224..f837367e6d5f 100644
>> --- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> @@ -30,7 +30,6 @@ properties:
>>   
>>     num-cs:
>>       minimum: 1
>> -    maximum: 2
>>       default: 2
> Isn't num-cs the number of native chip selects?
>
> Best regards,
> Krzysztof

Hi Krzysztof,

Yes, you are right.

I interpreted num-cs as the final number of native and GPIO chip
selects based on the generic binding description. However, the native
chip-select count should remain two here, and the SPI core will expand
num_chipselect automatically when the cs-gpios array contains additional
entries.

Therefore, the maximum value of two should remain in the MA35D1 binding.
I will drop this binding change.

Thanks for the clarification.

Best regards,
Chi-Wen


