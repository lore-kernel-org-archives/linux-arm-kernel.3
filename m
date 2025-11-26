Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2F5D10F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqXXBAAUKdwSAUjfq+x6n5cNsQrS4X3kIhKEGzMVOJw=; b=H70iYRPr+BYM1Pq5A5lF6QAm2s
	i0btUnPIkkO8qHFtg5/vvawPQSauC8BjvEPpR4vxse3is+4KB3yGdEdhnDfAkOLvNJmwu+EYy88eO
	IgwYdFOlCJMIRTW7Bv4uYimOGnVPqMz967kyQXDvG2Bu7utxcbHPEFve/t1I0TAeXPYM1m71b1Tr9
	L/SVPY6qbtpJYACg4NZsspUl98xSqb6SfQcUJzSObqasCzeslkSmwH6nCe7QYcJOhF7n2NhQn/mHb
	vUD23QULGZpHq3sw0WDJuwr7o25liGu3jRL4AR8/8MnGv3PD7rXzrLpW9WZRnC9CFWv6afKlXwkeP
	mKLv488A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCma-0000000EnSs-2ULC;
	Wed, 26 Nov 2025 10:29:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCmY-0000000EnSO-0MFq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:29:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-477563e28a3so4956825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764152992; x=1764757792; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nqXXBAAUKdwSAUjfq+x6n5cNsQrS4X3kIhKEGzMVOJw=;
        b=eVW/S1+WIDZYmRn1eCHJRgpoElh+PDn1n4nGizjD95jb18WIhQN8wF3iBmCadfc4DO
         Oz6HFJNXKkSF6/iYMALq2pyWld4SnFgKHjavOexwzHK/xFAUh5TEOeEADXs7/gxJSvFK
         DsjTAQBOnoMOb18DmCvox/1oDLvSbxG8YfHirgm4wJOWc/d5QydOhgNQTku1rxXTBpE0
         X47dbVM73BRJ+gCYnGxGTYvMHEBPzZTbi+AsWWENSOGw+MXklShtkgLIvCOoJG11hXo5
         up5qzp13FoIXrit8olPMCfPaxqgQYETUgGKKkbmfq18L/9HPNg/kmFZL32LaFh6btMOa
         AF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764152992; x=1764757792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqXXBAAUKdwSAUjfq+x6n5cNsQrS4X3kIhKEGzMVOJw=;
        b=NKmq5q6hlGHEIcPeuWmA5z0JuUJts/oPTp/Ax6lX+Nh/zzeIDYQmS9BrlwRX5BXlCf
         6J2TmIf7hv2WAqXO/1QuocAClMkmEqrhWxcq/JTSYhx6j2beElKlfqW4aO4i6nAJchDA
         nWIY/iI4FhekK9GvEv5RYIR2iFKK8m/yPB9gDrxBK/adAZLOQH/WyCWjTteA/llkqJDp
         7A9YR2uZH590G8TNV7tuM0poaOQJtYBI1z3ZR5UkPXjY/1McmM3B6s2AM38zXkoq4C4Z
         jyxn9rUjJhgW380d/qWhZxM+adDJF9eallXeFHXwmluquXhODRlQvOZ/lw0W4PH648cL
         y+IQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5D0gGJoyzXJNL56oQGGn5vULsDJ10AiN6qnFp8NmvXkUTnbMjXuxcyUIOsWm+qCtu7p+tn4qh5ivP2OKmflEK@lists.infradead.org
X-Gm-Message-State: AOJu0YzP7czrHov0Pw/C9XliMQB79vMsPOSvoe6wPEIhaseuxCr2j0Ev
	5NS6DWuQu06j1YLavPkNbctMoIJ8z+1bs+/v12kNcW41w8mT5rpl0/LubgxUPWFY9R0=
X-Gm-Gg: ASbGnctiK+uT+N09XwpTeEeTOcGdRKo5dAtdyNbSzVnetxbq9hKw5fklt2phJSKLi8q
	BsRUQR9d/yyodQfymPNWzBpd2dPxw4BCQFbtjmY8A+FyKmU/lqR9A7Elx1MprzkKV7lYhAekZ3h
	VVyDK5asuVuo2eadTJZJ07UTu8gFzaAEM92OEPTb9TJKnv9w7WkHrjJLkd49fdM1QBXaUya1bAk
	SRPKqeLMZq1GmEn2buhXANngS5Hh77OU+tCcHZe/5X9kb9SSIXxsD9ET/hGxslI/MhLk1GIdBbz
	pMHY7v0TBiVQjrff0B2INy3KWwGhTOYnjoNen3H2ZlEB0vkoe1WJIS9oGH0cheanbyMkVYJNUJ0
	g4L5iEVuPZIy6xh9+mkAZxnVLUsKIrT5sJv9rAFQrLQTzKbYJccuisYKAa6RA5LTFx4W+V4utVI
	IKP52d85K0nHFVAA8RHzEV+wdHdOE=
X-Google-Smtp-Source: AGHT+IG2IZKv123EVs8kI5aI78wn3FAXbfwHqvjiNrCaHccsQTuoIt0ndnqH5ZptLtGnsp5kH6xE1Q==
X-Received: by 2002:a05:600c:4746:b0:477:a289:d854 with SMTP id 5b1f17b1804b1-477c04cfa31mr194777345e9.5.1764152991840;
        Wed, 26 Nov 2025 02:29:51 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add5b80sm37746505e9.6.2025.11.26.02.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 02:29:51 -0800 (PST)
Message-ID: <d94e17d3-41db-42f8-8039-e1d6a694788c@linaro.org>
Date: Wed, 26 Nov 2025 10:29:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
To: Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 vladimir.murzin@arm.com
References: <20251118103807.707500-1-tabba@google.com>
 <20251118103807.707500-3-tabba@google.com> <868qftqehe.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <868qftqehe.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_022954_152794_AE45ED65 
X-CRM114-Status: GOOD (  17.51  )
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



On 26/11/2025 10:23 am, Marc Zyngier wrote:
> On Tue, 18 Nov 2025 10:37:59 +0000,
> Fuad Tabba <tabba@google.com> wrote:
>>
>> The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
>> register accesses. These accesses are trapped to EL2 when the bits are
>> clear.
>>
>> The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
>> had the polarity inverted. When a guest did not support the Trace Buffer
>> feature, the code was setting E2TB. This incorrectly disabled the trap,
>> potentially allowing a protected guest to access registers for a feature
>> it was not given.
>>
>> Fix this by inverting the operation.
>>
>> Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
>> Signed-off-by: Fuad Tabba <tabba@google.com>
>> ---
>>   arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
>> index 8d06a246dfd1..f6f8996c4f97 100644
>> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
>> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
>> @@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
>>   		val |= MDCR_EL2_TTRF;
>>   
>>   	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
>> -		val |= MDCR_EL2_E2TB_MASK;
>> +		val &= ~MDCR_EL2_E2TB_MASK;
> 
> This does not only change the trapping logic (bit 24). It also change
> the ownership of the buffer (bit 25). I wonder whether you should do
> something for that, maybe by clearing TRBLIMITR_EL1.E, because
> otherwise, you keep tracing, but using an EL2 VA. What could possibly
> go wrong?
> 
> Overall, I'm very uneasy about TRBE in the context of pKVM.
> 
> Thanks,
> 
> 	M.
> 

Don't we already clear TRBLIMITR_EL1.E in __trace_needs_drain() for pKVM 
when switching to the guest?

James


