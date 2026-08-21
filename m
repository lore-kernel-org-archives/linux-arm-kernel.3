Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A1CC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 07:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xlKCRyJmUt4oo7s6EMRczgy6MnR0ePY4jhsRQ6cVx4=; b=mRkUQNT+Ofxe2GNYvFF3fufnQl
	gJJsRHLUcTaIiU3njI9LqVWaVEEsqBzMpMhLCl5n+JrULEH8vfrpZfIc9e0kxLG/ZeVdFpm4MKeuj
	PFqcxO1ESrox+GZGSjdYZ56OT52VkhhjNl+3atvXi1lV0N9nlyZIKwoq7jzWGFPlCbLz1yVBFuYQw
	30tOVeC3CTm/n7lCcVmWj89og7ibJsDtzdcSRqc+87p4qW7chTjgtLwQf7hxlk3/hVaaLYK7m8XFo
	ALovQNJqgwguek+gqa5EaFnJDdSdLgltl/Jvb7tny2jc14t4perHds4hMxoC5auXUDWw3Y4mJXXCb
	72S3vD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJWT-0000000CgSF-2DpK;
	Fri, 21 Aug 2026 07:18:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJWR-0000000CgRU-0w0D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 07:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787296718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xlKCRyJmUt4oo7s6EMRczgy6MnR0ePY4jhsRQ6cVx4=;
	b=ZVjYQZzXFX1PGHsHJoItCFwAdnFShoEOKY84AvBJ6OwBe2rRWC/ajFmRWoPRgq7NOv11uO
	+iRy8UKJ4ujfAdHF2uVn2KAF/WXL7xLQKK2y55ncnaEwlBU0dDN+hOqAi4HWJh+Hg6VTNb
	SoLEvS/oPhe+LchwAwcGnG/YmMqsZAc=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-ze7NLlDdNgyrhHu1Tz-5IQ-1; Fri, 21 Aug 2026 03:18:26 -0400
X-MC-Unique: ze7NLlDdNgyrhHu1Tz-5IQ-1
X-Mimecast-MFC-AGG-ID: ze7NLlDdNgyrhHu1Tz-5IQ_1787296705
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84859a64079so1073065b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 00:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296705; x=1787901505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xlKCRyJmUt4oo7s6EMRczgy6MnR0ePY4jhsRQ6cVx4=;
        b=r4LB+mxx7C0dwMkg2FjJKFCPB4K4Z917VLXzurfNCO+s+5WOGLdHLzA34hJgutX7WC
         D/5HKQfZJOT1uV5lwkvIrnuzcj6/vQ5wdbgZz67EQjas37AZHlsmE5GOWyUAMN1FxMEJ
         YSTkGsaMcURrVezZv2HJIsU2n0KtRd+QMc2ugYyS58uOjLYtpOBIH3qEA+PP9uSrIi4C
         lO3oF443Ht0VhDPWRIjUK3+zTUTIjL5Zh1Rj5b583d3G33ComiNn9I9KOwTZs86cglvU
         hxfFdmg+3PI8QFVW9+2FCssUHqIVUoTrLGq2dBGCXaurNz8JXztCb6SbDxawnE5Way1y
         qLTw==
X-Forwarded-Encrypted: i=1; AHgh+RqneEuonJjRBk5bux49e9n6vLgyZKr4xtV7YLIT1b4zOby3ogwCgrXFipZ0pETYPOCeY8hGAoiwnNLjnEHW8c+S@lists.infradead.org
X-Gm-Message-State: AFuF++nrZRT0y9V7zRcNGSntvCq8yfJfkTAZDXVQ8mq8Tnd3vtkO6Niw
	tC9F2AN1N6aiz/aWUwOderM5xbEKOY5f5HV6m2LolqRLlVVvGdzZiAhjsb71mqINoeoT6NFJ00n
	P4dQ2kzXUq4LKQnP5a3+zvJwFD67tPF5QTVCPeT7UUTUqM7tIM5T+/Pez2bb7hSYhiVm8AjbACn
	FJ
X-Gm-Gg: AR+sD13Vz0Gvk3Tw8CUzoY/9ld1lhN1RaXipNAQ7kUJmVoCyvErJGp1wkO1/Date0hF
	mR3fdyfTlycpxXv5xahAhLQC8maXjVBk2+BZmQ/I8MJSF+V3jloa7WZ8oT05t4oW6fStOqa2qRy
	UIUIWNZkgOIIxOhgwD1OtUEd/JCFjZQYkzUHp7Tb3+miaxqQK8YYqfjLTtpTdnWeOBEhjBeP8xc
	DfRCiueO3J3tVhcdgFirM2aX6Cxz641u/vVBBOSnqRxPVlupcVFJuq3Pde4X2IhdyKz4s038+3r
	0ngBBFKycNCT8GgV144KrGfGxxSfYAD6TWTJYk192vhY5VnPeV4rryCHPKqYetskiS/hiDzGWDw
	hV+BQdHwU0PR19A4QeQ==
X-Received: by 2002:a05:6a00:179a:b0:847:8449:2ba6 with SMTP id d2e1a72fcca58-851f9f66789mr6258579b3a.8.1787296705123;
        Fri, 21 Aug 2026 00:18:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:179a:b0:847:8449:2ba6 with SMTP id d2e1a72fcca58-851f9f66789mr6258522b3a.8.1787296704696;
        Fri, 21 Aug 2026 00:18:24 -0700 (PDT)
Received: from [192.168.1.3] ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3361d24sm2509087b3a.5.2026.08.21.00.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 00:18:24 -0700 (PDT)
Message-ID: <713ab0a0-235d-47cf-a0c2-73249fbc8f74@redhat.com>
Date: Fri, 21 Aug 2026 12:48:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
To: Pratyush Yadav <pratyush@kernel.org>, Philipp Rudo <prudo@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Tao Liu <ltao@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
 <20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
 <20260820142114.0a36ac78@rotkaeppchen> <2vxzik54zmpp.fsf@kernel.org>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <2vxzik54zmpp.fsf@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g0xRQxrrgpb5KTTy_enP3XQ87na1Pi-WZkUoFCqSjfk_1787296705
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_001839_333493_5B03C663 
X-CRM114-Status: GOOD (  24.40  )
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

Hi Philipp,

On 20/08/26 11:41 pm, Pratyush Yadav wrote:
> On Thu, Aug 20 2026, Philipp Rudo wrote:
> 
>> Hi Mukesh,
>> Hi Pratyush,
>>
>> having this patch makes sense. Personally I'd go with having a
>> switch-case rather than individual if-blocks. E.g.
>>
>> 	switch (ret) {
>> 		case 0:
>> 			image->fops = *fops;
>> 			return 0;
>> 		case -ENOEXEC:
>> 			continue;
>> 		default:
>> 			return ret;
>> 	}
>>
>> IMHO that is better readable and easier to extend in case other error
>> codes need special handling as well. But that is only my personal
>> opinion.
> 
> Well, IMO both look roughly the same so I unless Mukesh prefers your
> version more, we can keep it as-is.
> 
Thanks for the review. I agree the switch-case reads nicely, but since
the current version is functionally equivalent and already
reviewed, I'll keep it as-is to avoid re-spinning for a style change.
Happy to switch if you or Pratyush feel strongly about it.

>>
>> Independent on which implementation you use.
>>
>> Reviewed-by: Philipp Rudo <prudo@redhat.com>
> 
> Thanks for reviewing!
> 
> One tiny suggestion. Can you please reply in-line the next time around?
> It is a bit easier reading this response below the code that it refers
> to.
> 
>>
>>
>> On Wed, 19 Aug 2026 23:17:23 +0530
>> Mukesh Pilaniya <mpilaniy@redhat.com> wrote:
>>
>>> kexec_image_probe_default() overwrites ret with each loader's probe
>>> return value and returns whatever the last loader returned when no
>>> probe matches.  The error code reaching userspace depends on whichever
>>> loader happens to be last in kexec_file_loaders[].
>>>
>>> Only continue to the next loader when a probe returns -ENOEXEC.
>>> Propagate any other error such as -ENOMEM immediately. Return -ENOEXEC
>>> only when all loaders have been tried and none matched.
>>>
>>> Suggested-by: Pratyush Yadav <pratyush@kernel.org>
>>> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
>>> ---
>>>  kernel/kexec_file.c | 12 +++++++-----
>>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
>>> index 59fb9d71e9d8..b3060e984ef3 100644
>>> --- a/kernel/kexec_file.c
>>> +++ b/kernel/kexec_file.c
>>> @@ -68,17 +68,19 @@ int kexec_image_probe_default(struct kimage *image, void *buf,
>>>  			      unsigned long buf_len)
>>>  {
>>>  	const struct kexec_file_ops * const *fops;
>>> -	int ret = -ENOEXEC;
>>>  
>>>  	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
>>> -		ret = (*fops)->probe(buf, buf_len);
>>> -		if (!ret) {
>>> +		int ret = (*fops)->probe(buf, buf_len);
>>> +
>>> +		if (ret == 0) {
>>>  			image->fops = *fops;
>>> -			return ret;
>>> +			return 0;
>>>  		}
>>> +		if (ret != -ENOEXEC)
>>> +			return ret;
>>>  	}
>>>  
>>> -	return ret;
>>> +	return -ENOEXEC;
>>>  }
>>>  
>>>  static void *kexec_image_load_default(struct kimage *image)
>>>
>>
> 


