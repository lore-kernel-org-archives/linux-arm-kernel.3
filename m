Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C6DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 01:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShQQKj8s/Lgk+6VwLi37Fynh9m2UvesLoaAxNarS/n0=; b=LYcjUTtkLcHuQu+EaznqtgAxmY
	nalFAQ2I39jhr5d22rQncn0xeYHUr0sIxt1INEsGFMHEQHhutP6vWbxAS7gw5zmDSbonbGcuEo59v
	xMkWaOtA7wYqHjgFEnY+mMcHKHOl5b33KoxVZEy0NAqjkSEOD2MTq6cBRUI027exGmgyS+CyvOBfR
	JYgciWQZHNvhdFGkok40mh18AzZym3Bqn6ghrK6bYdlZ/g1aInOtGsTpCZBUcumWHNkW8sVkq6I22
	WzyB3ijGVLDfebtT7q/Jlj1idUHGp89dv2HiTHqTDRCZqqkOv7Sp/H2I7coy6ylWKKSsA0eGBI+am
	AyW1Mc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf6Qa-00000003N2u-0MmS;
	Thu, 02 Jul 2026 01:41:20 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf6QX-00000003N2W-3FLw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 01:41:18 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-847968ca62fso1152070b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 18:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782956476; x=1783561276; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ShQQKj8s/Lgk+6VwLi37Fynh9m2UvesLoaAxNarS/n0=;
        b=hqQsKQ6ENHIGXeLL3Hb4MpbcXrY7zCGmDRv0eNNVqO+bQdYTXFBezLa2RF0vkPrBMv
         gPVn/6SfE0p/FerWUNv+WrhnRgs/LFufjzG6slQ4OIiCKvW9aTRvebe8wp2uGTCFKmGO
         2DpOTFfPOHhP+BrIrHegr8Q38aavFEodIO43x0rewG+Zaz6M2d0/LISFxlWunTlrMOlI
         qaATa/eq8NzQ5yNN35X5wPninCH4XqoamucAeh9Tzj0/GVSDkBsQjhswif9+ka2+hCzl
         B5NE74uPiG0DKefUFpY4QBiqwpDMO+fQVrgOZ6Ad0Fhb8SPPjK7I8sc9xFkA9/8EsdyG
         mWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782956476; x=1783561276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShQQKj8s/Lgk+6VwLi37Fynh9m2UvesLoaAxNarS/n0=;
        b=YxWN9DdnbBE+H07VqiD70PPqqa60T/m3nDSHcHF0RUdbYTv1j5GNsdozzm61Y6vfWd
         bKY1DMbnu0i3pi9nM0OSKKbRUCZhhX7Y17UUe8MGrwbrp+Z/mraf927q6ww4DJAkCZyF
         3y5tWeCCoqUbwiDtDqNDeVSu0n2afBtsRRKpV0cfRaUtcNkxFCeup2HZqWgX9c6NlUbi
         RDFF2NzMeBvreFSR5mkJQTl2bGX43Mipib3OP0RkAFy3m6wDC9OG6lV43XpKErdBzmEN
         Zti9Ey0y67jfPbnuafgf1JzTjRVY/zXjD/8SZdPtoHRdEEzL/gL8mXl0/AsZyEHbp5wM
         uq5A==
X-Forwarded-Encrypted: i=1; AFNElJ/oTgUcB9uq7pwdcEDyI4vF+e9rEQ0ES9vwfdodWDsg/BCxIOcor1HByvr2jLMDH46nLRF+znEv2Lt/NWsyYoB4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn2cknqgETeeLrHroDgum3kuwC7IzTod6D5WbN/CWeIjnyPb2+
	RvUT0prjEKvbMbgW3PHJ/aaOKG5IWdY0dij+z5MYzid+ALucfHRWiWBc
X-Gm-Gg: AfdE7cmg53ABDJalJmnd/RfOgHAP7HCHnZuFRpquoO9S9x04XmXu1EzX3geMniErlxa
	OZ6MuYVzaz26iOV82RqmDZd5qKEQrURG4KEkBemxJE/EpTJqudYMf/dvtPLEBFn4Xus92EYPcGe
	ELQaOadrxk8HZ3pYKPlZqIYYypTizo1lqOBsmJhfZsegTpnyGOyIjDmeZMLwDLylYv8ZupAgtFB
	R0yXOAAKaoeEyIaOCYsGp+Q51dlT7uAvLG1A5VH2jsfbCBDQK4wQlOxdgjEZ4eC85gTHXXYCEx7
	EOrN6Iv/wWgNikFi2a+2Kv2wts3X/xt6TT3o9m0thz3Ftqz+gXDDQV5FFPizfVP2aObb5yKBj1P
	JYKepAbcXX2TkzbxXZONK05fUjrzM2Sse+hBZzZ/d1tYh4+EpGtoruN8YOZGifiORA/ozYC5w1N
	0sP9cMoCDgHLwwHwGsLujkA5MM6Coe1UcYXjuhJoMDjL9RRFFBUZUAM7weZbkUwIPm
X-Received: by 2002:a05:6a00:cc9:b0:847:8449:2ba6 with SMTP id d2e1a72fcca58-847c06739bemr3641015b3a.8.1782956475767;
        Wed, 01 Jul 2026 18:41:15 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb99f546sm546592b3a.46.2026.07.01.18.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 18:41:15 -0700 (PDT)
Message-ID: <ead0aab4-4bb1-4979-8451-9b5bf1183bc2@gmail.com>
Date: Thu, 2 Jul 2026 09:41:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
 <20260625110638.38438-3-cwweng.linux@gmail.com>
 <20260701221115.544e33fd@jic23-huawei>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260701221115.544e33fd@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_184117_837350_47D9199D 
X-CRM114-Status: GOOD (  17.03  )
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

Hi Jonathan,

Thanks for the review.

 > Look at the ACQUIRE() macros for claim direct stuff (in iio.h)
 > and then use guard() for this.  Be careful to add {} to define scope
 > to being this case block.  May not save much code but it will be easeir
 > to read than this currently is.

Understood. I will switch the direct read path to
IIO_DEV_ACQUIRE_DIRECT_MODE() / IIO_DEV_ACQUIRE_FAILED() and use
guard(mutex) for the driver lock. I will also add a scope around the
IIO_CHAN_INFO_RAW case block.

 > Move assignment down to just above the loop.  Makes it easier for
 > reviewers to associate the initial value with what is going on.

Will do.

 > For new code
 >     ret = devm_mutex_init(&adc->lock);
 >     if (ret)
 >         return ret;

Will fix this in v2.

 > Second part of this is set by the triggered_buffer call later. So 
don't set it
 > here.

Understood. I will keep only INDIO_DIRECT_MODE here and let
devm_iio_triggered_buffer_setup() set the triggered-buffer mode.

 > Failing suspend because a buffer is enabled is unlikely to be popular.
 > Can you not save necessary state and restore so buffered capture 
continues
 > on resume?

Yes, I will rework the PM callbacks so suspend does not fail just because
the buffer is enabled.

For v2, I plan to suspend the IIO triggering path, stop the EADC
conversion/interrupt path, save the state needed for buffered capture,
and then disable the ADC and its clock. On resume, I will re-enable the
clock, reinitialize the ADC, restore the scan configuration, and restart
the buffered conversion path if it was active before suspend.

Thanks,
Chi-Wen


