Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423AEE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZSQaMswdb9C1vMZWBKr4qtwXrK6yb8GLXI20JFrh0k=; b=DudIEDqXeytgi5Q8h2wdrmVpuw
	43/SiUs/q1mRPfQq/PVFhDZzMfbXEbpIvZcdPf7nI69cORueUIlfh3L6uO3d6xz55mxd0y7Ssf3i/
	+EhMwtHB8ceji9woQlw66lY61IpFkfDFxHC/1XagWNM3V/t7ZdWtRD7K0834BnrtOvD3hJX21yaOw
	NyCUXxHJ6hgZVAl3lGk3+J9+AwMPbompCZauao3pJNh9TtesuUB7VMcZQR0cwWdykqIJkowetitat
	iNrseIgaOcbAcZFuU/EWYWiwimNz0slnypBsqaogvliT9GQbJMSIRKskJH7mC0ope2OCclhxKvF8x
	ABXJ8fHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8DI-00000004esf-1MWW;
	Tue, 07 Jan 2025 11:57:36 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7th-00000004abz-15PM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:37:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso8196379f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 03:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736249840; x=1736854640; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZSQaMswdb9C1vMZWBKr4qtwXrK6yb8GLXI20JFrh0k=;
        b=J7fhKgRNYDOy42CVVSbfBf8flbSVGs2bcDVmm+kb+q52ihaDY6hzdI2SqlE7eYRq3I
         OyOOk5JsXrtmt8szfkqV1nt2fTOGpBypJdHX/BXUEyMY5AtWXRXJr63/HgzVSg7vRX4E
         bdoJs4rV7U5bFOar+mKtzXo9az/EoXjaCfqsDXYgMevS5nWax4eUpYeeR1e3spLhvelg
         Lcn//aNHNp9MmmEqUc7IX82eK1vPAbFCvARqMJP6ypFWMPn7bamBp+iYst03HpjNE2ak
         Y40FZ1hlmiT8dGql4K2Eu+aRJsXsS3Ierjzyv/SInymF2VOYyEya5IVhJ5DCHwxsnJ/m
         GfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249840; x=1736854640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZSQaMswdb9C1vMZWBKr4qtwXrK6yb8GLXI20JFrh0k=;
        b=pNHf0oHNr66u2kJFnwMEa2gSzeaCwc0XZfCwyMrXEpH1raizthhmP8TkNs4NqbhBTI
         YWGfQ4ohdSr0NZMGgiC9tBcYTmnfoAgw+VOmAbYAtzSTR9aZ6/xZms2aFv6TEyDnWEI6
         90j8dYSJrBxRmYOzeryBRGhRugoJVqd2PVGwHlFA5HZLk+MkPqTxRJG+j4N1SdpRXz5w
         PZeXH3CnjT6AGdNlF39XEviQR9XPa2oJ98u4zDx4gWEKLn99xPNaoEN8zu7wNUFm2Xe7
         KsR9MgyP4lF4dJ+lZtF5bmMQLtlQteGnFaJWAADaFNJdjESUJc0jeRnZki3SbkF6m1Kp
         cc9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEmkZXtdJS9a8Z02REEeXib8Vv8B9rflByjDEiGO/oiU3Evhv8Xd58EKRvHS2beFzLW01H7hgqzN22WVGPCHg6@lists.infradead.org
X-Gm-Message-State: AOJu0YzZSoY6vPGJyP8i5AUie+utkZrNi38oVnV1oZjwxwjYYgjg0mA/
	n+U5ooe9L3DjHpFT0p5K1Cj2BI8gu30eIQ98AiZPR1uUn91Nt+Rln0y5PqYaU0E=
X-Gm-Gg: ASbGncvDD2JjrKUfc93N+jWwK7/pcVrWJVWwHqsncV4vv8tTTKnaH5M2ThA7mbMAnNF
	CBLOH7qIrNBc9T0mU2kQvyJaTk9AzfUSBT33Itf/N0Yd3H5VOpbrlupH5j/IHcDHM8SUl1fujub
	VGU3+4DEK4XUYZKJJiAW8WW7UlWQhQ4+WoBptaDA5lx5tt1IyHMY62DS92uqTAHcUH01f48WFzi
	D7k5pb1WDTz/Oqci/gaWtGOSJ1ILYvWM+V7zecVjhn4p7l+qHKH68bmfVAnMIcnTbc=
X-Google-Smtp-Source: AGHT+IECQSms/EowoHXjQsCpkWNAzVFNllMRnf9lJ0ZzSVaV7Tpg5l1Xcq7G+0uJGbW59ugW9EO2jA==
X-Received: by 2002:a5d:64c2:0:b0:385:e968:f189 with SMTP id ffacd0b85a97d-38a22408262mr52863642f8f.51.1736249839872;
        Tue, 07 Jan 2025 03:37:19 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8289a0sm51585022f8f.7.2025.01.07.03.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 03:37:19 -0800 (PST)
Message-ID: <b4801774-d279-44c3-9700-40de5c21270d@linaro.org>
Date: Tue, 7 Jan 2025 11:37:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/7] kvm/coresight: Support exclude guest and exclude
 host
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, oliver.upton@linux.dev, suzuki.poulose@arm.com,
 coresight@lists.linaro.org, Joey Gouly <joey.gouly@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Shiqi Liu <shiqiliu@hust.edu.cn>, James Morse <james.morse@arm.com>,
 Mark Brown <broonie@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>,
 Raghavendra Rao Ananta <rananta@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250106142446.628923-1-james.clark@linaro.org>
 <865xmsov53.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <865xmsov53.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_033721_317619_9812CBBB 
X-CRM114-Status: GOOD (  23.89  )
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



On 06/01/2025 2:48 pm, Marc Zyngier wrote:
> On Mon, 06 Jan 2025 14:24:35 +0000,
> James Clark <james.clark@linaro.org> wrote:
>>
>> FEAT_TRF is a Coresight feature that allows trace capture to be
>> completely filtered at different exception levels, unlike the existing
>> TRCVICTLR controls which may still emit target addresses of branches,
>> even if the following trace is filtered.
>>
>> Without FEAT_TRF, it was possible to start a trace session on a host and
>> also collect trace from the guest as TRCVICTLR was never programmed to
>> exclude guests (and it could still emit target addresses even if it
>> was).
>>
>> With FEAT_TRF, the current behavior of trace in guests exists depends on
>> whether nVHE or VHE are being used. Both of the examples below are from
>> the host's point of view, as Coresight isn't accessible from guests.
>> This patchset is only relevant to when FEAT_TRF exists, otherwise there
>> is no change.
>>
>> Current behavior:
>>
>>    nVHE/pKVM:
>>
>>    Because the host and the guest are both using TRFCR_EL1, trace will be
>>    generated in guests depending on the same filter rules the host is
>>    using. For example if the host is tracing userspace only, then guest
>>    userspace trace will also be collected.
>>
>>    (This is further limited by whether TRBE is used because an issue
>>    with TRBE means that it's completely disabled in nVHE guests, but it's
>>    possible to have other tracing components.)
>>
>>    VHE:
>>
>>    With VHE, the host filters will be in TRFCR_EL2, but the filters in
>>    TRFCR_EL1 will be active when the guest is running. Because we don't
>>    write to TRFCR_EL1, guest trace will be completely disabled.
>>
>> New behavior:
>>
>> The guest filtering rules from the Perf session are now honored for both
>> nVHE and VHE modes. This is done by either writing to TRFCR_EL12 at the
>> start of the Perf session and doing nothing else further, or caching the
>> guest value and writing it at guest switch for nVHE. In pKVM, trace is
>> now be disabled for both protected and unprotected guests.
>>
>> There is also an optimization where the Coresight drivers pass their
>> enabled state to KVM. This means in the common case KVM doesn't have to
>> touch any sysregs when the feature isn't in use.
>>
>> Applies to kvmarm/next (00163be8bb59).
> 
> Can you *PLEASE* stop this absolutely nonsense of posting patches
> based on top of random commits? Please look at how we integrate new
> developments: they are *always* based on an early -rc tag (usually
> -rc3).
> 
> If you depend on other patches, add them to your series and post the
> whole thing.
> 
> Thanks,
> 
> 	M.
> 

Sure, I re-posted it on the latest -rc with a few commits picked up.

Thanks
James



