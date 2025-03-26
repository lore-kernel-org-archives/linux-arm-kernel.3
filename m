Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A982C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 08:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gqMtStm44sDN1iRrEG5qA3sdLqKE4ejLrbFQPQv/y0=; b=0wVGWG7P0B3LhJylpktR6mqBQK
	rySDycKJUUtx/xUparPzHrmC4sndmHrItrt2ZBprvstmiC1tqgQHH+mtmdXjstqc7d0lCSerR2nMe
	xCS10ZSQIS5MJwNbYDFfSp35BVOznlZSRmD5wJpwhpz8MFt2O44mZivx7tQt/eT9uH8JPx+oYryDl
	UgDgrfykEKgXF71hlm3ZXGt3a9eJfb6+rE0qt05F6ku2NDiT6CJjP9PzyyDxqubskXdzz27S67pe+
	z8C4n0M/OsppB+C9hAqErUVJRhB4pp0zbJZ9F2nO2+m87uwA+mfJtr0U3HxxPg2XNjAvnlkiuUkv8
	YhDLSmIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLxj-00000007u6I-1Io0;
	Wed, 26 Mar 2025 08:18:11 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLmX-00000007sIr-1DvX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 08:06:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso49046765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 01:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742976395; x=1743581195; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7gqMtStm44sDN1iRrEG5qA3sdLqKE4ejLrbFQPQv/y0=;
        b=G0A3IiCR2aDXMW7cYrEz7xD0/E9A2yl6Ptrht0a4Q8Rj0z/M+4EHBiDctrs7EYPjcl
         3+v/yFe3RLcSqJ56Zu7EqUvHEjtc7aECJegyBROzAtDLsuD9jYjS+YIy0QOm3oAxozt+
         I24uZ3oi/Yp+bWtPXMLqRVsbMHB3QRYu9QvlS9i0rSnwsqtkWy59IkoHG/8P8exnm+cb
         Ly1YVLv9IKGyf0s3V5Ny8R0pfUkpkf0jN7LRvdaP/FVo+C6qgOAgAFbmjDFYYPIFWOEl
         ESCgQMBSzV7rR5Q01C2bR/tT5V4+CdUy1eVTED7Yqc4w7qqsvVHzrv76bupVDFaU8uqf
         GKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742976395; x=1743581195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gqMtStm44sDN1iRrEG5qA3sdLqKE4ejLrbFQPQv/y0=;
        b=iTlA/LOcIyc1RD9zfg7LD3QAvTNgvY/TBHbu/mDCd8svxSHz7ejIFkZnZPp/uGObKd
         UAEjhlP7Vd0eEweAwOfOIgzGKVDljfp1vY3VWF41gAhdcZvAOo3eMBAesYnpf9UbUETx
         0BA6y+oN0UVHLw9Mwx4Ie9OJO+m3Cu6W5eJQhFsxO899eIoc0P8F8cQV/tBPGUtbJ7t8
         h5JLSLND/VSoq/izw9vE6t7mwrnJksngvrWLZPZXk8QuBX98HD3Tc1/ikctdOdYqQzpG
         uB48G5d8sbUIMnJjhk6SYLF8IIItXfGixXIXz3BxTISebwxE90D+BcBwGCNgeE0S+JGr
         ij7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV122seg7ksustcVSoCAO3BqJ93TV6dHsWg+x9+RQ2JZHt3/0UyFd05wRCX/YBW4MAzAvuXjOhO3hcZRvHGFStd@lists.infradead.org
X-Gm-Message-State: AOJu0YwkoXyMHj4OfKJEy4hTThO0M5IzZs/MnblQyMComyU47Nk9w2TC
	lBaQtRlVvZdaC5l0/gZrZLl0uLJBWAGvZYeRX0hE2TbzpXh9RzF141pI1o0fOf8=
X-Gm-Gg: ASbGnctP8PPIKQ8f5sNZXadFV9+DmE+XZAmp+FU6iK8/IU017zFsXsJZR7RYsvLiPRU
	Fokp/Pd32ma5n+gvKPYtmEB3T7N/QmmtZPlhWUNX4BTEkbrMR5ia7kb8iKLxiXOEQDQ7g8YTwPQ
	V3CKffB39qMFC0WfIQ6zwOB64zqYatDSeP0k484QtQyFgEK+D/Kh5yLI/q0O9w0PfzZpA+0oYHA
	dfGGraliZyCJkvDtOR61unOmWKlEuAk1bNMiZ9JDhryzhyjdHLUg5j9oFvUWvOXiv6NS7VqDzlx
	TnXpnWwmedlebU12OQvYZTu6rWELeI/2rKf25fFojxASBJNdZ+aeAjSsA0sSjO2nD925/pgvSDl
	txrPJRjiF
X-Google-Smtp-Source: AGHT+IGLoLRqgi6MSpyHe+/8p9iRPVFA3lPXpq3HIaDfSybdmPunM7GvMPFLrX3oQG6d+ZPluBW1Uw==
X-Received: by 2002:a05:600c:4e12:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-43d509e654fmr199464555e9.5.1742976395544;
        Wed, 26 Mar 2025 01:06:35 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d43fdeb79sm225846615e9.25.2025.03.26.01.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 01:06:35 -0700 (PDT)
Message-ID: <84ed89d5-91af-445b-96e6-2c1e41d65294@linaro.org>
Date: Wed, 26 Mar 2025 09:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clocksource/drivers/nxp-timer: Add the System Timer
 Module for the s32g platform
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Thomas Fossati <thomas.fossati@linaro.org>,
 Larisa Grigore <Larisa.Grigore@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, NXP S32 Linux Team <s32@nxp.com>
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
 <20250324100008.346009-2-daniel.lezcano@linaro.org>
 <d60fca36-0beb-2574-cb82-3969bbfb58a9@oss.nxp.com>
 <8c208e8c-2e1e-430c-916a-dbc6732881b0@linaro.org>
 <065d6f32-3161-8316-bbbd-4da18eef839b@oss.nxp.com>
 <098c5de8-9291-4f3e-a276-500825cac7c5@linaro.org>
 <068713cb-47ca-ae26-e113-9f5026be9196@oss.nxp.com>
 <cc2dd75c-e279-4e55-ab88-75498e93146a@linaro.org>
 <50d2c651-746e-4ddd-4036-f72742a622f8@oss.nxp.com>
 <e8054f85-2a23-4ceb-8e1c-7cdfe7c87628@linaro.org>
 <a31a575b-8f6d-6317-f172-b4f8b1a5cda7@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <a31a575b-8f6d-6317-f172-b4f8b1a5cda7@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_010637_342106_1F3CA75E 
X-CRM114-Status: GOOD (  19.16  )
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

On 26/03/2025 08:44, Ghennadi Procopciuc wrote:
> On 3/25/2025 3:54 PM, Daniel Lezcano wrote:
>> On 25/03/2025 14:21, Ghennadi Procopciuc wrote:
>>> On 3/25/2025 2:51 PM, Daniel Lezcano wrote:

[ ... ]

>>>>>
>>>>> This wouldn't be the case if the STM is kept running/counting during
>>>>> the
>>>>> clock event setup, with only the clock event interrupt being disabled
>>>>> (CCR.CEN).
>>>>
>>>> Are you asking to use two different channels for the same STM instance,
>>>> one for the clocksource and one for the clockevent ?
>>>>
>>>
>>> I suggested using the CNT register to obtain the count for the clock
>>> source, while using one of the STM channels for the clock event.
>>
>> Ah, ok.
>>
>> I think it is preferable to keep them separated to keep the code
>> modular. Given the number of STM on the platform, it does not hurt
>>
> 
> The S32G2 and S32G3 are SoCs featuring a diverse set of cores. Linux is
> expected to run on Cortex-A53 cores, while other software stacks will
> operate on Cortex-M cores. The number of STM instances has been sized to
> include at most one instance per core. Allocating six instances (1 clock
> source, 1 broadcast clock event, and 4 clock events for all A53 cores)
> to Linux on the S32G2 leaves the M7 software stacks without adequate STM
> coverage.

Mmh, right. From this perspective it makes sense.

> Additionally, the proposed implementation uses only one STM channel out
> of four, which is not optimal hardware usage. I suggest using all STM
> channels instead of limiting it to a single channel per instance, given
> that the driver already uses a global structure to pair STM instances
> with cores. This approach will optimize the number of instances required
> by Linux and leverage the capabilities of each STM.




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

