Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5117CDDE5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUsyYzcBLI65EkyMKt9ic0GWqH2UepiiFrnn5rm1t2E=; b=I38ALYjXYs9HRf+56xbITXEap8
	GgaSHHhh7VwZN8qhdQvchI1yueZRcTumoxYVkaApBMchZAx4p+XYf745hYY0A0Ks1NsscOik+iCNi
	xc7xlW1HaP53d/nKx3B08OObjF0qw85/9sJm6BOh8/pvzbqimuq46bNOHHI/fZ47Hq09phFJoRKTF
	UtgN/sOqOSdT8ufG35tHC4qntoM9Q0HLpSrhx5lViHCIr6kpFS5bFtO1bzYI7BQwJVPmTnV0qY5pq
	AA0r8oij74YCVjGU0GJBgqwF1QGCSOLX2EWrgfO3E0NebUYEn0qoF0NqXFleONOGJliqBNVmLgQgw
	6YQkpiQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YjD-0000000E0cV-0bi6;
	Wed, 23 Oct 2024 10:36:35 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YBu-0000000DumN-34Vq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:02:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a99f629a7aaso129471266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 03:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729677729; x=1730282529; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KUsyYzcBLI65EkyMKt9ic0GWqH2UepiiFrnn5rm1t2E=;
        b=xUvZc+GlYXB8zCKLByW1YLMR1UiuhLBQTDuo4RmGPZDy0n0DhYkFpaGLTyMXBYxqj3
         Kpvpu15jMF1D1uVEOTlxlEsFuGr77xStDLCeOlp1fdxEwuE5v51K2Xvi7rvb1nxVv40D
         6lvE1HdVGMUvWNmTfSESNDeplx143l+75n/wwBVmSmZmX6EOIz4I1pQSfhN3xdtxC+To
         Q1kvRWI6XhOdys1/1mRUSQZ071psDoAo59NKXzzWq9LnevwrO3FXLqT7nmYPREuWIkAt
         CPgYFVjTXMFAJXxcuQF50/lwKztBI5NbStDp1GcGHSNX4PQDvG5mgp26bm4EWhuL57v5
         tGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729677729; x=1730282529;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUsyYzcBLI65EkyMKt9ic0GWqH2UepiiFrnn5rm1t2E=;
        b=axfqSdXviTvolKYrQ7a1qwwqVgogwvZ++QliiS/yG9gkjAfVCDU++WWmAdBVQDLqpY
         +v5djsVa/5Qg0RJ2OIlAYkwT00Q0i1xCTwV51UVYQUY709KjcNaLey6UM0/6i3PoEisH
         ooQVcrCYsTSg4JRnyHO/5I0fnjrb3u+4KK9I04J9qI7mPkg/hMvB9Ji0tI5EvJlnbV+N
         8WmUVb9k15Z+FgzO7addskKwJQD+Wf29OUAOQP340MbQXwSxAi86MbAba9D3SaNxZOTQ
         Vl09KrbpqV77VfXi10JPwxeB/lQ1rAWFGspdACbnO2w4TOvBohSErzx11ywEgB2h1Xtz
         z18w==
X-Forwarded-Encrypted: i=1; AJvYcCXViDu22g+dLZi5D6chO214za16+U/L5CQrMCdSY2fmDFhSFLPEnjlLZGhkVhWqLiTdxWi9CjJJWFx/bfqteBXX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5l5NGyl2vii4wrf4Sky8SjDCEoYn9pF9l6v+eDqrwtKgXIrKh
	9uWnvrReMhKmkl/2b60X0L1IV+/VSrgv6ZhuY3ox/QtQiXY/G4AcIHMAr0Gicyw=
X-Google-Smtp-Source: AGHT+IHC7zvwcyw194w8/6HD0iv1EPVzoje3wxQbXrndfVcLbOpXDwLNKGHuDv5F5S+9VIQBGvRm4Q==
X-Received: by 2002:a17:907:a09:b0:a99:fcbe:c96b with SMTP id a640c23a62f3a-a9aaa62250amr622623466b.25.1729677728513;
        Wed, 23 Oct 2024 03:02:08 -0700 (PDT)
Received: from [192.168.0.157] ([82.76.204.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91559951sm450387266b.106.2024.10.23.03.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 03:02:08 -0700 (PDT)
Message-ID: <9f15fa0d-9445-49f0-8ea4-889e5f51f3ab@linaro.org>
Date: Wed, 23 Oct 2024 11:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: add exynos acpm driver
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, jassisinghbrar@gmail.com
Cc: alim.akhtar@samsung.com, mst@redhat.com, javierm@redhat.com,
 tzimmermann@suse.de, bartosz.golaszewski@linaro.org,
 luzmaximilian@gmail.com, sudeep.holla@arm.com, conor.dooley@microchip.com,
 bjorn@rivosinc.com, ulf.hansson@linaro.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, marcan@marcan.st, neal@gompa.dev,
 alyssa@rosenzweig.io, broonie@kernel.org, andre.draszik@linaro.org,
 willmcvicker@google.com, peter.griffin@linaro.org, kernel-team@android.com,
 vincent.guittot@linaro.org, daniel.lezcano@linaro.org
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-3-tudor.ambarus@linaro.org>
 <955530a5-ef88-4ed1-94cf-fcd48fd248b2@kernel.org>
 <d41ee8f6-9a2c-4e33-844a-e71224692133@linaro.org>
 <1ece02e6-bf78-443a-8143-a54e94dd744c@kernel.org>
 <d91109a1-532a-4b95-ad4c-3b9cf8e3dbbb@linaro.org>
 <1e76bc70-21a6-4ac7-99ea-30a7ccf387bb@kernel.org>
 <2941d65e-8fb4-4d5a-be4b-283de2cb3274@linaro.org>
Content-Language: en-US
In-Reply-To: <2941d65e-8fb4-4d5a-be4b-283de2cb3274@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_030210_904485_9D5426DC 
X-CRM114-Status: GOOD (  15.51  )
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



On 10/23/24 10:53 AM, Tudor Ambarus wrote:
> 
> 
> On 10/23/24 10:00 AM, Krzysztof Kozlowski wrote:
>>>>>> I also cannot find any piece of code setting several of above, e.g. tx_base
>>>>> I'm not writing any SRAM configuration fields, these fields are used to
>>>>> read/retrive the channel parameters from SRAM.
>>>> I meany tx_base is always 0. Where is this property set? Ever?
>>> It's not zero. My assumption is it is set in the acpm firmware, but I
>> Where is any assignment to this member?
> 
> In probe() you'll see that exynos_acpm->shmem is a pointer in SRAM to a
> struct exynos_acpm_shmem __iomem *shmem;
> 
> Then in:
> 
> static int exynos_acpm_chans_init()
> {
> 	struct exynos_acpm_shmem_chan __iomem *shmem_chans, *shmem_chan;
> 	struct exynos_acpm_shmem __iomem *shmem = exynos_acpm->shmem;
> 	...
> 
> 	shmem_chans = exynos_acpm_get_iomem_addr(exynos_acpm->sram_base,
> 						 &shmem->chans);
> 	...
> }
> 
> shmem->chans is not initialized (or tx_base). I'm using its address in
> SRAM (&shmem->chans) which I then read it with readl_relaxed().
> 
> I guess one can do the same using offsetof:
> shmem_chans = readl_realaxed(shmem + offsetof(struct exynos_acpm_shmem,
> 					      chans));
> 

I forgot to add the sram_base, the counter example should have been:

shmem_chans = exynos_acpm->sram_base +
	      readl_realaxed(shmem + offsetof(struct exynos_acpm_shmem,
					      chans));

