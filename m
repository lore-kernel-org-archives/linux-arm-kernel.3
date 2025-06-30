Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC9EC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 07:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZ+BSaUYjMYZPFRc5ahI5f+VB6TZxnMY7+aM/BHB0gk=; b=pYmYrwK3C1WQxU6aE4+Aq5HQCE
	nawJi7w1I7yYUi39kvfpa1dmKbAOVORJIiAaZ3PfMnWHnligChbGBoIFj8xRSlX7H1eJ5ZB8IFLV7
	3l05GG/3mJJqVF5YiU0Kf6oHH4qDeU3VUab+mgVn2m+iuUzpqEVjjMnwfDoSxGttafHrl48y0qpbf
	i21Wnw2lgs4toTvFJxKrA78Lv4G+bYAdw5lbqWFxhotKK4p/8vhxy/Kglpw8QDbmr2iU9HKduNt6o
	c/Ehk2RWzct3W5tY08rw6jBvM3PLXpYwzALSQKysD0isT1wzRe32yleJi0slB8oI6UdD2wdWk5739
	9o/cBNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9IF-00000001VxV-3MR7;
	Mon, 30 Jun 2025 07:51:11 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9Fw-00000001VdX-2PLL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 07:48:49 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ade5a0442dfso790715166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 00:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mandelbit.com; s=google; t=1751269727; x=1751874527; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tZ+BSaUYjMYZPFRc5ahI5f+VB6TZxnMY7+aM/BHB0gk=;
        b=jxB7P6fhYQ6wUNuN1SavOawEmlV4Kf7Bf+yyojXagRVMHwQPlTYIRs8+BOo1Zvklt8
         7I5BGvdoQSEFb9LpuFuiZWs7HIGsniKPoUm+HdGkprJUMGkGViCKL8cUPMvE8DjpTME/
         kEoJQrMq+AYvucv07+HR9n4pVrfigkbdA8IsxPJWYUFsvo1PN0GJTmYp0WX3u5QupR4i
         b6Kwg8Eak8K1W2RHkatISET1uhsWmvqOSzwEOIKWpzON71vk7xOQSSWR/6lqbrcXyVW3
         Ga9QNtE1yhvJFBKxP95huNjex1vRqOK4Ek7jvm5lJJEpL80Rh9+JAlvtdwkVyjb5z6os
         71RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751269727; x=1751874527;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZ+BSaUYjMYZPFRc5ahI5f+VB6TZxnMY7+aM/BHB0gk=;
        b=At48davnMNjldxWmF2L+u+HOphM3txg5Lc0rVMY5+uu+R1z/4GbZ0z/jmLL5KSttnI
         mFXf0XTcwiCAOhBgnxjGb0vfhvnpTap6S4auqehUO4SghRgN7Mz+Z1gkgxzVLR3xhBeK
         VG/BVi+lFJw0ltd9e+8aql0XK2+zscylYaDxnm9gV/6gDRR/iWKKH7awfvijO7Zfm4Gr
         f5Jn1qCZgdJqg9x01kuCfn1aBjVB/Z07+hPJc9vHRrIoOkZ2oj0lPWoV8LLMF2oqNJ9P
         i3t/2sEL8xgbixZTYzwHmONbSDZeTL1IsqdBNNnd1LyDhSDa0Ev73i9E47Be7ScLMamk
         re0w==
X-Forwarded-Encrypted: i=1; AJvYcCUe/TCY/DmBYim2G3i7/QZihnkb3+MY2zDpiOI+kQx8kmXOM/CfUJr0qXjPBCM4VKlHT7sDaR0ZKnk4/dSGx3nh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+LNAsbxAGCiTHfWUwgkEAmYHPoXHCQwEM400PE6C8lvZsW6dV
	WfXwAqybhc1O9XqnK31cTpL1ebEi3H9ngpP6pnpEKNuPNc5O6f97kVjK0nRY+whrBoU=
X-Gm-Gg: ASbGnctEEAz0OqwigsFBvjT04Cpk9kFWUbNwXIOuXLsaa6g/ueOrJTEudu6bP8w57k/
	8P0IA7GawCBuu38pbKvTDZ6vAbFr0ejHPjxyVJKneLzuPF1VVbA6Tw3DraZ+sKSL+HSh8KvDA3k
	15afyX1SBrH9deyRgEtJ8jDfm1+5fvJZxOWePVNgeFo1ghPtYxZsFF/ivpOUydLGkCbM62/TAXS
	5t656L/O7dlG+9B4OHgQBSAKhNU2HvSDkpfrQIWC8/ZNUCGYEncmoiu8y29yum80BxZDKwVeUOS
	IvWwCcgB6WVLk6b9IAvsWgo1fdinWqhRbMaWcCDae5WKZSllD9DWT4ef/gIkH0+DBYUY4VeehGE
	ic15Kzv7wePBmGezXmDcU5bEN
X-Google-Smtp-Source: AGHT+IFG8mxwherCyB+H+Ce/MDetYKrbqKrvuEJkbWn3WcmopojqghsC9D4gNWRWL3XhXfmKmOCezQ==
X-Received: by 2002:a17:907:8691:b0:ae0:ade2:606b with SMTP id a640c23a62f3a-ae34fd8ecebmr1192187566b.19.1751269726337;
        Mon, 30 Jun 2025 00:48:46 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:f5fc:eb97:a20:8b31? ([2001:67c:2fbc:1:f5fc:eb97:a20:8b31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b1c4sm623062966b.31.2025.06.30.00.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 00:48:45 -0700 (PDT)
Message-ID: <1c6f4024-be8a-4734-a724-f12b85a52ed7@mandelbit.com>
Date: Mon, 30 Jun 2025 09:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: stm32: fix NULL check on pointer-to-pointer variable
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>,
 linux-spi@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mark Brown
 <broonie@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
References: <20250628000227.22895-1-antonio@mandelbit.com>
 <1f49b8f3-44c9-43f3-a3bf-b931fb0726f4@foss.st.com>
Content-Language: en-US
From: Antonio Quartulli <antonio@mandelbit.com>
Autocrypt: addr=antonio@mandelbit.com; keydata=
 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
Organization: Mandelbit SRL
In-Reply-To: <1f49b8f3-44c9-43f3-a3bf-b931fb0726f4@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_004848_634325_B6A7ECA9 
X-CRM114-Status: GOOD (  21.62  )
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

Hi Clement,

On 30/06/2025 09:34, Clement LE GOFFIC wrote:
> Hi Antonio,
> 
> On 6/28/25 02:02, Antonio Quartulli wrote:
>> In stm32_spi_prepare_rx_dma_mdma_chaining() both rx_dma_desc
>> and rx_mdma_desc are passed as pointer-to-pointer arguments.
>>
>> The goal is to pass back to the caller the value returned
>> by dmaengine_prep_slave_sg(), when it is not NULL.
>>
>> However, the NULL check on the result is erroneously
>> performed without dereferencing the pointer.
>>
>> Add the proper dereference operator to both checks.
>>
>> Fixes: d17dd2f1d8a1 ("spi: stm32: use STM32 DMA with STM32 MDMA to 
>> enhance DDR use")
>> Addresses-Coverity-ID: 1644715 ("Null pointer dereferences 
>> (REVERSE_INULL)")
>> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
>> ---
>>   drivers/spi/spi-stm32.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
>> index 3d20f09f1ae7..e9fa17e52fb0 100644
>> --- a/drivers/spi/spi-stm32.c
>> +++ b/drivers/spi/spi-stm32.c
>> @@ -1529,7 +1529,7 @@ static int 
>> stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
>>                              DMA_PREP_INTERRUPT);
>>       sg_free_table(&dma_sgt);
>> -    if (!rx_dma_desc)
>> +    if (!*rx_dma_desc)
>>           return -EINVAL;
>>       /* Prepare MDMA slave_sg transfer MEM_TO_MEM (SRAM>DDR) */
>> @@ -1563,8 +1563,8 @@ static int 
>> stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
>>                           DMA_PREP_INTERRUPT);
>>       sg_free_table(&mdma_sgt);
>> -    if (!rx_mdma_desc) {
>> -        rx_dma_desc = NULL;
>> +    if (!*rx_mdma_desc) {
>> +        *rx_dma_desc = NULL;
>>           return -EINVAL;
>>       }
> 
> Good catch for both pointers !
> 
> For readability, I would suggest to define two dma_async_tx_descriptor 
> ptr at the beginning of the function such as :
>      struct dma_async_tx_descriptor *_mdma_desc = *rx_mdma_desc;
>      struct dma_async_tx_descriptor *_dma_desc = *rx_dma_desc;
> 
> And then use them all along the function even in the assignation.
> 

Thanks for the comment.
Will send v2!

Regards,


-- 
Antonio Quartulli

CEO and Co-Founder
Mandelbit Srl
https://www.mandelbit.com


