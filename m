Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C71E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 11:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xelBfWSODcxsrEcjEs1BiG8WTAMva9NkWAeUvbujNUA=; b=pg4EvX0XZ1AtG7eyXafekNQGEN
	cZQIpo7nxsXzgmhFP/2IAsvBNyimCaH1CKGpPKVmtFsQHpCnJN7cJxNoOwYvbUZLAc+nYpiJ+Wkwp
	+m/7QjQcgcN9l8GXZihUs6fa8zR/GXatguXlwVSrU0W3yL0SxzmosKtcXu/73gcijRCCw/7DiYTR/
	1qp5qkAhVFflbGvbmL52ONOUZMw9kZJBw9ylypkxsm58oQvTXh1gJNGhvL5tbIDEcYxqeR0/uTdeV
	rM2Am6qvUK9vKGCxfkU8D3oDFXx78YZe4HYosECSx/dB8wVhDHaOBnTKDEc2rt47Dwz6idVIKBZPu
	qJ1cV8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkpt-00000000xFi-4Bfj;
	Mon, 06 Jan 2025 10:59:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUknv-00000000wb8-23pb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 10:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736161069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xelBfWSODcxsrEcjEs1BiG8WTAMva9NkWAeUvbujNUA=;
	b=hEqyiuS+LtiXo79xp00XSIMx+6/ASjB2a9SIyHr2ay657WZNIgKbx9LPqS8nOtTfR+1YYB
	46J8CrvzRaUVGJOOi0wkMMRLHrEvLrrSmcW/4fmnbPJF0/VJJeiQ48r57BKZOnm1ajjfKm
	UtTb+h6lnC3u01ZsUWzv7+OIhj2J3nc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-d2WgmJcfNdqrHWItZoXCUw-1; Mon, 06 Jan 2025 05:57:48 -0500
X-MC-Unique: d2WgmJcfNdqrHWItZoXCUw-1
X-Mimecast-MFC-AGG-ID: d2WgmJcfNdqrHWItZoXCUw
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8f94518c9so307523596d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 02:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736161067; x=1736765867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xelBfWSODcxsrEcjEs1BiG8WTAMva9NkWAeUvbujNUA=;
        b=wrw5BKpTxBvvKnJDX3HGxFp43I65Wm3v8jLhtvV6lMSK8w3MZPOD3JHTF/1sECfG0+
         lpukEINilqz+u+TII6yc8A3krhp1GxG94gd6EH4ofTWxdjOk8MzNL2h0uJdTY0Tdihuj
         EOlKQIrgghG9/8xmrnLhHbdu4byqVkWdJpJJ2Ex3488qadm367IthNtiXiV5yVNj+IRG
         GHjFinrw1B/6FgW54G8USccLeghNaO8kzSVCSZr5b9hoZnzISE0ScnQonybfpBPAEg0s
         7Bwk94EWM6vM1B9QEUOVlBTuPqhpuIKrO6/cT5u0e1+nRF1fVafe9ai3fW+P4h54EfB/
         LQ+A==
X-Forwarded-Encrypted: i=1; AJvYcCVrPuFygSK3CohQC0edXOJChGC+fJUdXDCDF5I/6eg7kOuxvb7j1Ws2z6nB/8KkwrZXN6rOjbKOAKFCIw2twdXB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7FlZmOtw8Cnm3FyuEvO8iGyMfDN+PUslLh8dGrRXHPMAxpO+O
	1wOufzGRCvpC7jyjEFyExUkZRH2mc9XnXFKMhd0JvfArstTX277UzJnK7VB3aPrz5JRGZp18Psf
	HqscCP+9tc9JPBMNZxnIQKcqaWYJaL1oTzYOxUMNQwo3VFdJ8IpmTyRbqqFQiSy3V41giLU4Ruq
	L1+YhB
X-Gm-Gg: ASbGncvFV51hdGM4PHCak4FTPvGb8CFRjX67ZC+czy+P4XDod9eN6FbAM0aBEi9UQJr
	qOW4L/fwqlGfktff9unIe9iR4tBqLRelNn9r1plW6dn7MqbgVkuuJSjPRZMnehB7vZ/fxiWtTP2
	+Dk2Kl4yJTrP3E08ovMUD50Er3CK1mo8Kr3L05ARwUSWnnXnI1jLJGHBSMettCNCywYRO8Dgyze
	If/BHIQytw+9Pov0jfskLB09eKJLXSwgN5aYGf5iU2B+iB3hMs7vSnMjn5C9PmF7d8tnfhzwbxO
	I5V6uJB8dQdD9stYfDuaVEY=
X-Received: by 2002:a05:6214:20aa:b0:6da:dbf0:9640 with SMTP id 6a1803df08f44-6dd2332ed7cmr917796816d6.7.1736161066976;
        Mon, 06 Jan 2025 02:57:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLwbrQGbMn9NL9Ah4F4vcDj6k2WKY2Yw/cnHzXjmWPCRq8m97NVu8ZZRP56C6MfG+D7akdOA==
X-Received: by 2002:a05:6214:20aa:b0:6da:dbf0:9640 with SMTP id 6a1803df08f44-6dd2332ed7cmr917796606d6.7.1736161066729;
        Mon, 06 Jan 2025 02:57:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb178a7sm174272571cf.62.2025.01.06.02.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 02:57:45 -0800 (PST)
Message-ID: <690b7702-42be-4c23-a9bd-c1e8f09b0623@redhat.com>
Date: Mon, 6 Jan 2025 11:57:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 15/46] arm64/sysreg: Add register fields for PFAR_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-16-anshuman.khandual@arm.com>
 <5203176c-2646-425b-b375-edb7931ef54f@redhat.com>
 <c707ecfd-6f1f-47d2-93ec-116f5dfd419e@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <c707ecfd-6f1f-47d2-93ec-116f5dfd419e@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gtNZoMNn_0FN53ndS1AIMfLyGxe66QV2kZlHKXLEUfQ_1736161068
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_025751_604569_3001FBC1 
X-CRM114-Status: GOOD (  14.52  )
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

Hi Anshuman,

On 12/19/24 4:13 AM, Anshuman Khandual wrote:
> 
> 
> On 12/18/24 21:12, Eric Auger wrote:
>> Hi Anshuman,
>>
>> On 12/10/24 06:52, Anshuman Khandual wrote:
>>> This adds register fields for PFAR_EL1 as per the definitions based on
>>> DDI0601 2024-09.
>>>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Mark Brown <broonie@kernel.org>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>>  arch/arm64/tools/sysreg | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
>>> index 18b814ff2c41..e33edb41721a 100644
>>> --- a/arch/arm64/tools/sysreg
>>> +++ b/arch/arm64/tools/sysreg
>>> @@ -3533,3 +3533,10 @@ Field	5	F
>>>  Field	4	P
>>>  Field	3:0	Align
>>>  EndSysreg
>>> +
>>> +Sysreg	PFAR_EL1	3	0	6	0	5
>>> +Field	63	NS
>>> +Field	62	NSE
>>> +Res0	61:56
>>> +Field	55:0	PA
>> Just wondering: part of the PA definition depends on FEAT_D128 or
>> FEAT_LPA and the reset field value is UNKNOWN if the feature is not
>> available. Shouldn't introduce separate fields directly?
> Generated PFAR_EL1_PA_MASK aka GENMASK_ULL(55, 0) should cover all the
> cases for PA i.e 48 bits, LPA, D128 etc. Although individual use cases
> will have to trim the mask subsequently as required.
> 
> Are you suggesting something like the following instead where the user
> will have to concatenate these fields selectively to find the required
> PA mask ?
> 
> Field	55:52	PA_D128
> Field	51:48	PA_LPA
> Field	47:0	PA
Yes that was my suggestion.

Thanks

Eric


