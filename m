Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8405AC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 15:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32r104ragES+JBKWZpr/5fwyEiz2V+wgrRvKzXjgako=; b=EE4Y1uqH+LWx8CrAGe9AFU5yuO
	awz8AGHfABh3xTeBiSO8uxzppnSIckrTycdXlivDNPxvwqiufnmvaUyZwUGJJVg411oZqp0INNtrI
	8BpetcJZdZV/5xGH6tK707NH3F9lcVD11mTFD+AG2b+uNASc2/mvrZwZB0fftQ5QLfQa/M1HcL/qo
	MfrRs2EuRuEFi87veXO0609jn7L3Vls9XOA0i5gCRmbK50Zng1H3vQsSxKsWgv44kt1AHTYtz9xlW
	L7Or2KP6XsCHzLy2mUwtX9weE4Rly9R5pXF3QFs8kyf4WSuXlW2McM6EJHe7jw9hbX7zmy4IJze51
	/hrz3Jfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XiN-00000007mOG-3zbZ;
	Wed, 09 Apr 2025 15:51:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xgb-00000007m5K-0xZL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 15:49:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3912387cf48so465824f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 08:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744213795; x=1744818595; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=32r104ragES+JBKWZpr/5fwyEiz2V+wgrRvKzXjgako=;
        b=JNg+Qbv5EQZcMDIhu9Tul4wNVTpsNMrg3a4t6pseqZ3O1KCqXftH6KhgfsB4YFoX/7
         XpWioBZR2332Z8jmj9Gnb00dEA9aLcuDLcXXDz2dr4cb7eOpbCYT48+2/AwViZ5JuuIv
         eaMwJDB1eUOayJV1TfjLTpfmcEFPlmgG3smakfRPpqzGl13ygnkOMRY0vvCdp/avHObs
         2Sas+89IuDxY952tdrLo77wQ7S/rpn1iYTe8Wan+awSaOkjQ+6KNSraOODiTuUTGeWJM
         KYnpzzqwmt4H2xA8LvpJhYKOnXmQl+rb2x9zCcymbLIGKjRrbO8PFRkZvjPVJX6CDmq5
         incg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213795; x=1744818595;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32r104ragES+JBKWZpr/5fwyEiz2V+wgrRvKzXjgako=;
        b=lCIbquJwf1ZNSbG4vkh8rCB14NILWFp4rdCt7QWYwPFb1mtRdgqqXL/XpLtAKSaQtQ
         Jl5/i3BoubIesfP+wjRdJbZ97jhK7EOScpq2Wo31e4nhGa7xrS6h2lAiol/qQe3MLYKH
         bFPg+tFwsYJPMvlRCcZHLtDkUq94ph1u2LrQZf9xE6Omy+sehkEfFKl2hsM4tfWMBsM2
         kfAnatQLm6NRnCKmx9zlgNDk4Fqkt+5kIjBshpmtLF1/RzB2XCyGy/A3TqzOUKIq6uj0
         PVfAjAkDICX6YB/maPRXul1cSmF+kGJBtwvFYzHTVoCSjEwOlP3ghDSRBboMrGNppbnM
         Cp+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXc3n2xmvQXclBHOK+pxhI/K1mz1kh2SsQP+8LFXb53POUYJFfi+3j8D3JUlPeE5xkc8YoDHzi312CJmobtIWnN@lists.infradead.org
X-Gm-Message-State: AOJu0YysHb6hjVy3BSJpyvq8eySLS6nMyiUJJooCFs3vzRBF5qKcYI66
	b1RNxaP2uzuQ5Y/urDQuZ9GhxQGqMSPTx9fL4m9EDezkDYJsnFSZABNf6Z6XsvM=
X-Gm-Gg: ASbGnctQ7nZey9MaRtgzvB/6zuIXMP+ETGDGQL7qMpfAreXghLDcADhyxVAjTyP33hU
	sMX5/CV/ozb4wJfQXCKNRYlxSCLF3vsUvahoWtiUZeDR3zNJ7dEuh2Os8XrNxXZ9S5dJOmOgD7c
	uF8822JdSDLMC32VgUJ0frUyejVRw4p4HQFXqVjf89/IJLmkbluSt+45hN+gjQ1xmWPfDYat7Rw
	zzxPsDPlC6CCWf3nWrO9H4u/JgwNox9yCgupwx7JwLNx5jhpyftE0Tl7AH2aMue/lGOdey7d7MH
	e5T1gbz1+5hEOJSB7qv8S6wp6Xog0SZhtr1+ketQA7sj00hHcp0z2mOcQfk=
X-Google-Smtp-Source: AGHT+IHFa+fVHyswKOhtWqv4wKhHcTO4gf1B7gffW/HC7i18H9UIMgFVHBSmLtlQ+wSwbCCT8gAfVA==
X-Received: by 2002:a5d:5986:0:b0:391:29ab:c9df with SMTP id ffacd0b85a97d-39d87ab55ffmr1238324f8f.4.1744213795374;
        Wed, 09 Apr 2025 08:49:55 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938d527sm2009165f8f.59.2025.04.09.08.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:49:54 -0700 (PDT)
Message-ID: <8406618a-20a9-4f9c-9ad9-09943524a7c7@linaro.org>
Date: Wed, 9 Apr 2025 17:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] [v2] Input: stmpe-ts - use module alias instead of
 device table
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Yu Jiaoliang <yujiaoliang@vivo.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <20250409122314.2848028-3-arnd@kernel.org>
 <Z_aTOUUmyXpWnt57@smile.fi.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z_aTOUUmyXpWnt57@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_084957_285115_326E3CAD 
X-CRM114-Status: GOOD (  16.04  )
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

On 09/04/2025 17:33, Andy Shevchenko wrote:
> On Wed, Apr 09, 2025 at 02:22:55PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> When compile tested with W=1 on x86_64 with driver as built-in:
>>
>>   stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunused-const-variable]
>>
>> Ideally this would be referenced from the platform_driver, but since
>> the compatible string is already matched by the mfd driver for its
>> parent device, that would break probing.
>>
>> In this case, the of_device_id table just serves as a module alias
>> for loading the driver, while the device itself is probed using
>> the platform device name.
>>
>> Remove the table and instead use a module alias that reflects how
>> the driver is actually probed.
> 
> ...
> 
>> +MODULE_ALIAS("platform:stmpe-ts");
> 
> Isn't the preferable way to have platform device ID table instead?
> Krzysztof?

There is no ID table currently and I (usually) object for having both:
ID tables and aliases. In this case it is just simpler to have alias
than entire table and MODULE_DEVICE_TABLE(). Also it is unlikely it will
grow into many aliases. If it tries, then I will object.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

