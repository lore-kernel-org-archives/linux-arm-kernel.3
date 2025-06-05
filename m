Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F72C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 09:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbrnvilrHpFZS1qhJ78rP2qQ0TmcS+O/vmfSmwxj9AA=; b=nUCDcCY7cNZPrsZm0VjWuFQJD2
	S4M9PLcQCt+ROSQ4vEJTK/qFZ7qvLSpUCgMH40PdZnCQtCtYLc7zS7O4Q0DYHKSDVGQgtE13ghLEL
	x3rPVbtCXez9rcf58mAsulNq5NBrlvb9sO5b1aJ7tnfZklEJIA90QG1e8zvCDY3F5GWWNASV3ubba
	rR4ng/hMKEaLwD2cfl37MHa1PofaUOkYNeZDw6IH3su/uMsyp8pSmajJGn7D1vYBFCp5FdsctJl33
	B8dK8dHwCQD2RvM4WwjpaGdQkBiflbkn2YeMSOvT4oC8nKi6LivYOtNYJLrkL0BytTW25EmivMbZB
	tvIbTudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7I9-0000000FCQH-0g0u;
	Thu, 05 Jun 2025 09:53:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7EC-0000000FCBE-2K7v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 09:49:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a5257748e1so555787f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 02:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749116979; x=1749721779; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IbrnvilrHpFZS1qhJ78rP2qQ0TmcS+O/vmfSmwxj9AA=;
        b=eBPZ4pgLqwDx1l3gv1nz2RgXBeGWd7ppi5KCrAqynq1BFSjNeegeBl1NYlTh+Ucknk
         MTchCa1pH1ZEXOGZAilaWhsK3cE5X9UwgD7eKmSAOU5YjZq9hO8aM+bO7ijDjdX2e7zl
         ACqj23P8Azua2O/18Sexjf4Q5jf3XCzf8a0QlZxXTwKTtOHpPJ1xnCIUraMN2tlBH9r2
         k4Go+puYBS81NfefFbrEo4qvMS/3LVinyLVOLviYoi99jNa5s3VEuwMmOikmwZuZd0Vp
         lmVLMLP0PZIfvJQKLjhBKs6g4WThen0pZBbe7HDDuJJhMUJaikAgqb3uORUwmBFXmZgx
         po0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749116979; x=1749721779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbrnvilrHpFZS1qhJ78rP2qQ0TmcS+O/vmfSmwxj9AA=;
        b=sliwDkx2ZSTIMD9iZ6QOrjRKly6lvy47ddOCBHMpEYbLoTOypIUvbb3CbjdypB31dn
         m7NZJFsqmBVjSS44Wqt6akLjMmo/nVfN9eKRsIlRDPnkHpI+VsIqSw72hQJ5FK0ozWfP
         /eC57b9P9vjuMrAZ5qjM70whXRLSnoErLvbyhffiP39cxd22LnX5qjH/tzihxOhOaS3J
         K21plvgkbQybBEr4eCu/FxsTqK05kSepJGEwUXxEgJmq2RdUQX8f1O3vOLuV4rQ79ZsZ
         gSVLAnEySErOfMATGUZoOLX7eCyRYNyw7/QrGDBVZsmd3CqyAiQrwBBiQVsaQuoa/NJ4
         9/uA==
X-Forwarded-Encrypted: i=1; AJvYcCU1vDs8Mz4AOXg4Lj9ZugiCswf8BKODMCiI7EJB6VMyG+EoWUHcGCtfP1uomtMfHJslKci2pITGaq4O+mpAPzJ9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4g9S0kJ4IU/A+IkIKRlAfj+AV3gjJe20rT19PnmVRVyl5tukY
	l1HUKQclViJWBRyYb9VU125JphCya5IrAUdFJUB75kt6+WvYfTK/69vCPBgv4BV7jY1u7hOZbjg
	zcsHaybE=
X-Gm-Gg: ASbGncsAFrpwh8mZpv/v7epjN7dnaJrtMNTNoypj49IkGx+98ZVK71Fr7QkpYoP/VVX
	XVog+YrnZrr2VrlRDBJsJWpaDaFMBHi3c838vYUZlJoAkBnSgcAB+VQm0vqmNb0gOANIHYbvBLV
	bimNznmBabOhF8e3GD4N6H/qjtftN5pxwKLWasolBHOHyBRTy5Ixm6xBC52BLRV9/NgxQTLl2D0
	0SxBgAjGy50ZP+gLI1+uYlLqNxCHHdDifmo8IZQPTkq1CB6h/F0aOSVjZhiWXIAaGwEOKBAUc/7
	vDiuJ0qJUY/PA3K4wtOHoCF0kyTwDlmuSjvgPRCbFwa4kotB+kPF4J4e0h50l+dUT8U=
X-Google-Smtp-Source: AGHT+IFP0yNyvVcEUJoo+rw4+b0u5ono0p20Hn7Y+AXHwH+9boHjkpkWwf/nzpRj4ZlAi+Ib1Nv+Eg==
X-Received: by 2002:a05:6000:4009:b0:3a4:febd:39f2 with SMTP id ffacd0b85a97d-3a51d9661b7mr4593999f8f.37.1749116978897;
        Thu, 05 Jun 2025 02:49:38 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f0097205sm24208656f8f.79.2025.06.05.02.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 02:49:38 -0700 (PDT)
Message-ID: <246b4372-b86a-4a42-9298-d51aab81fc65@linaro.org>
Date: Thu, 5 Jun 2025 10:49:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-wrapper] aarch64: Enable access into FEAT_SPE_FDS register
 from EL2 and below
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>
References: <20250604114604.629782-1-anshuman.khandual@arm.com>
 <189edea6-49d8-4829-88ce-fa75d83401d6@linaro.org>
 <18ecc087-d5bd-4e98-9543-a6dcbf3e8c11@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <18ecc087-d5bd-4e98-9543-a6dcbf3e8c11@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_024940_603168_A0BEB307 
X-CRM114-Status: GOOD (  31.07  )
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



On 05/06/2025 4:15 am, Anshuman Khandual wrote:
> 
> 
> On 6/4/25 17:27, James Clark wrote:
>>
>>
>> On 04/06/2025 12:46 pm, Anshuman Khandual wrote:
>>> FEAT_SPE_FDS adds system register PMSDSFR_EL1. But accessing that system
>>> register from EL2 and below exception levels, will trap into EL3 unless
>>> MDCR_EL3.EnPMS3 is set.
>>>
>>> Enable access to FEAT_SPE_FDS registers when they are implemented.
>>>
>>> Cc: James Clark <james.clark@linaro.org>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> Cc: Mark Brown <broonie@kernel.org>
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>>    arch/aarch64/include/asm/cpu.h | 4 ++++
>>>    arch/aarch64/init.c            | 3 +++
>>>    2 files changed, 7 insertions(+)
>>>
>>> diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
>>> index 2b3a659..ac50474 100644
>>> --- a/arch/aarch64/include/asm/cpu.h
>>> +++ b/arch/aarch64/include/asm/cpu.h
>>> @@ -55,6 +55,7 @@
>>>    #define MDCR_EL3_NSTB_NS_NOTRAP            (UL(3) << 24)
>>>    #define MDCR_EL3_SBRBE_NOTRAP_NOPROHIBIT    (UL(3) << 32)
>>>    #define MDCR_EL3_ENPMSN                BIT(36)
>>> +#define MDCR_EL3_ENPMS3                BIT(42)
>>>    #define MDCR_EL3_EBWE                BIT(43)
>>>    #define MDCR_EL3_EnPM2                BIT(7)
>>>    @@ -185,6 +186,9 @@
>>>      #define SCTLR_EL1_CP15BEN    (1 << 5)
>>>    +#define PMSIDR_EL1        s3_0_c9_c9_7
>>> +#define PMSIDR_EL1_FDS        BIT(7)
>>> +
>>>    #ifdef KERNEL_32
>>>    /*
>>>     * When booting a 32-bit kernel, EL1 uses AArch32 and registers which are
>>> diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
>>> index e1640a9..b6f740c 100644
>>> --- a/arch/aarch64/init.c
>>> +++ b/arch/aarch64/init.c
>>> @@ -146,6 +146,9 @@ static void cpu_init_el3(void)
>>>        if (mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 3)
>>>            mdcr |= MDCR_EL3_ENPMSN;
>>>    +    if (mrs_field(PMSIDR_EL1, FDS))
>>> +        mdcr |= MDCR_EL3_ENPMS3;
>>> +
>>
>> You are only allowed to read PMSIDR if SPE is implemented otherwise it's undef so it needs another check.
> 
> The same is true for the earlier bit MDCR_EL3_ENPMSN as well. FEAT_SPE_FnE should
> have been checked from PMSIDR_EL1.FnE but the feature is guaranteed to be present
> when FEAT_SPEv1p2 is present. Hence PMSVER >= 3 check alone is sufficient here.
> 

Exactly, ENPMSN availability can be determined only on the SPE version, 
avoiding the read of PMSIDR. So it's not really the same, as you mention.

> But for for FEAT_SPE_FDS feature, ARM DDI 0487 L.A is not very much clear on its
> dependency for FEAT_SPE and its versions. It says the following but not the other
> way around.
> 
> "If FEAT_SPE_FDS is implemented, then FEAT_SPEv1p4 is implemented"
> 
> Even PMSIDR_EL1.FDS field is valid only when FEAT_SPEv1p4 is implemented. Hence

That's not strictly true. For any implemented version of SPE it's valid 
and res0, so it behaves the same way in the end. The only thing that's 
not valid is reading it when SPE isn't implemented at all which would 
give you an undef.

> you are right - we need to check both before enabling MDCR_EL3_ENPMS3.
> 
>          if ((mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 5) &&
>              (mrs_field(PMSIDR_EL1, FDS)))
>                          mdcr |= MDCR_EL3_ENPMS3;
> 

Yes, either that or PMSVER >= 1. Personally I would do >= 1 because it's 
allowed and then you don't need to change it again if FEAT_SPE_FDS is 
relaxed to previous versions.

>>
>> It would be much easier to unconditionally set all the known MDCR bits. If the feature is implemented then setting them to 1 disables the traps, which we want, and if it's not implemented it does nothing which we also want.
>>
>> Doing them all conditionally is quite error prone and extra work for nothing. In TFA it's already done unconditionally:
> 
> But leaving all MDCR_EL3 fields set when corresponding features are not implemented
> goes against "don't set register fields when not required even when ignored in HW"
> principle and hence might not be ideal.
> 

But having to do 3 versions of something just to set 1 bit correctly 
that could have been set unconditionally with the same end result 
probably means that a blanket application of that principle isn't ideal 
either.

> But will leave it upto Mark and others. Dropping all these conditionality while
> setting MDCR_EL3 fields will be a subsequent patch later as if changes existing
> fields.
> 

It's probably not worth the subsequent patch because it was only 
supposed to save time for this patch, but it might be interesting to 
discuss anyway.

>>
>> *
>> * MDCR_EL3.EnPMSN (ARM v8.7) and MDCR_EL3.EnPMS3: Do not trap access to
>> * PMSNEVFR_EL1 or PMSDSFR_EL1 register at NS-EL1 or NS-EL2 to EL3 if FEAT_SPEv1p2
>> * or FEAT_SPE_FDS are implemented. Setting these bits to 1 doesn't have any
>> * effect on it when the features aren't implemented.
>> */
>> mdcr_el3_val |= MDCR_NSPB(MDCR_NSPB_EL1) | MDCR_EnPMSN_BIT | MDCR_EnPMS3_BIT;
>>
>>>        if (mrs_field(ID_AA64DFR0_EL1, TRACEBUFFER))
>>>            mdcr |= MDCR_EL3_NSTB_NS_NOTRAP;
>>>    
>>


