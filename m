Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE43CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47RwooVING59/ooQWdA7SNr7Zs32TKeNO1snt4GymBg=; b=cPaCKjqCnCpyUy
	7/HBkrPBjT9i4edVTZ2hd2P7hkm7+bKbDm+/10f76s3nISYnjBZnM6Q+wnpXNJjdfQqLKjGOebnzJ
	COfzrgcoO+5DsP++KPj5rQVw6A6mcQXpBYE11DyxZzQDKU+6Dm5C3+Mzu9mEhuT6nONSgPr7Q2ACl
	mMm2pGJt+k+A8HexwgDcvEhP0KyOQj/ccKJ+gjnpbiBmg00bLiJc/ih+2+A8clrmhawWwtB10imIH
	FLIR0lffH9IhmW3UPkL5wDaANovu9jCYp4FXRaRcvJ5QpDEq8SkrkaRG7w7PHoe9vJyzY7dGSOM5t
	vSjxql4eSzyLbRtTQ5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Gl-00000002bHl-3wXM;
	Wed, 13 May 2026 13:04:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Gj-00000002bH1-1AgI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778677495;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=47RwooVING59/ooQWdA7SNr7Zs32TKeNO1snt4GymBg=;
	b=Ao71FOjWBNFAdAV8eU4H8HOV/liwQgEWoMNFARWFMxj2yl2uzyO9MhRbuZSehybbTmAwZz
	fmL1S4pU/WOcZGH03Il2NvaAI4/hOXVB9AaHXK+0No3fW9BbzmBqEXeK8+RlmoAYws0Mz5
	EgJ2cjOIC291YrvL9P0/HkaBgb+ZN+U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-c717OVjhMFmfoI7pVV25wA-1; Wed, 13 May 2026 09:03:21 -0400
X-MC-Unique: c717OVjhMFmfoI7pVV25wA-1
X-Mimecast-MFC-AGG-ID: c717OVjhMFmfoI7pVV25wA_1778677401
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48fc9084562so12471165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677400; x=1779282200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47RwooVING59/ooQWdA7SNr7Zs32TKeNO1snt4GymBg=;
        b=tJe6B+hHRoiwiTazdG77V2aTbZGWvy0bMiOZS/LjmXvVnQIKlpbQPsX9iP5TVtGsY2
         FgBobtkV3kQiSB7hwHfYxP1uoRhK1N4Of/wDgD7Jh06rQ99nZaMb1BgO0E+q1BVxEhNb
         71xsPiLtZvdBGpOfCgin+BOUU4mTPkzqIXSAQcCpBY/9zWbfnwIhyEFxnO9fw9mD2U8k
         H7kRbIYP7AnjTjtxxHoasDDTqvXPMByg3tv4EVkTAhGtB36g0I2Hik70gyoxuwwhg7zH
         J7YsxzgnlgT/QMO/JoZcfe5FJlC7A+LFmyK2skAJrKbRcbZN/DykGlXhQi8wfNazf9Fy
         SRNA==
X-Forwarded-Encrypted: i=1; AFNElJ+L2vMNL61G9ON9kLbAYWDF2C1DvNpgCE9kFfNN/HM3P5zGbGjOtBxJQ/TowF6wWdEn4vCCToHvQd3Ou1i52Fcr@lists.infradead.org
X-Gm-Message-State: AOJu0YwfJyQhCjKwK2wGbtxj1EPdm+dK291oJRnRtO3kb5JtUFtl9SJG
	eDJZI9epW2qkGv+UPQZMeI16tZW8EsG7taqxTIJJv6y4WWmiL2UKF2MDBFDp3EDfhEXqGO8Dx8T
	EROxshfAwT5zFgMOkVHf4K/2OxfyDNngeLQ4xSDZ2/iZS86fFMRU5R4efmOZTDBYusRZSf9Kuim
	Za
X-Gm-Gg: Acq92OF0/DEujU231nVBjifSBHU97RMFWj9OmV96W4TAQ6PEBDImD3vzmvYHoj+CqPS
	rgt0XcxWrSO4VSV3HesqcBURJorGJDTGBeoyngMVMw5jst6T1W2EtyY24EldcNTRDbTepFvzk7K
	rgVHI0tVmIm4dxZqbfYyd0clvY31zWHWlkc7cjQZWCQ+WIAWP6Pj0m3PeR0GKOr4cWsXnN2i/T1
	SBndXwdl77C63FBoZibYq835zq6H40ayoe5VWQHAUl9EHn4dQiOGLyx2+izi9q1McP8G0ZnkcCB
	W1HJ3QnCTvmMzpvpptGZikDZJmp+/KhIrW9TlAS4p5c58FwxWuCE9MZsPdarq4Jqa+orYxeSy6H
	T6OUcSefk9mFGlGsLjXQPXj4AXc6Fhs6kV/kcgA+5CN6BENywZZFfWIuNUT6aoYCJp3l3Gw==
X-Received: by 2002:a05:600c:19cd:b0:48f:be94:d82c with SMTP id 5b1f17b1804b1-48fce9e1a34mr42450295e9.19.1778677400512;
        Wed, 13 May 2026 06:03:20 -0700 (PDT)
X-Received: by 2002:a05:600c:19cd:b0:48f:be94:d82c with SMTP id 5b1f17b1804b1-48fce9e1a34mr42449655e9.19.1778677399778;
        Wed, 13 May 2026 06:03:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120f1f9sm41638565f8f.24.2026.05.13.06.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:03:19 -0700 (PDT)
Message-ID: <c3848d24-f924-497b-b5e7-3ef3a07c3a6b@redhat.com>
Date: Wed, 13 May 2026 15:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: KVM: Document guest-visible compatibility
 expectations
To: Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Marc Zyngier <maz@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
 Jim Mattson <jmattson@google.com>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Raghavendra Rao Ananta <rananta@google.com>, Kees Cook <kees@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kselftest@vger.kernel.org
References: <6856b269d2af706eae397e0cf9c1231f89d9a932.camel@infradead.org>
 <6afc4b95-3c15-4d71-877d-19b84e91ce05@redhat.com>
 <57bc082f4824d6114d3156744c25986effc29aca.camel@infradead.org>
 <baff82ca-6321-4b16-aa61-b2d6d60b6535@redhat.com>
 <86h5obya2r.wl-maz@kernel.org>
 <48b06e5655d56ff6eda30e563b34894fa0eb2f07.camel@infradead.org>
 <ba08dfe9-932b-40c3-9fdf-fc891d52e1d8@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ba08dfe9-932b-40c3-9fdf-fc891d52e1d8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bif_kZBEnryJrZAPmLTmLglycifOYzg076LQKXe1YJc_1778677401
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_060457_396887_3C895924 
X-CRM114-Status: GOOD (  40.36  )
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
Reply-To: eric.auger@redhat.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 5/13/26 2:43 PM, Paolo Bonzini wrote:
> On 5/13/26 11:24, David Woodhouse wrote:
>> On Wed, 2026-05-13 at 09:42 +0100, Marc Zyngier wrote:
>>> If userspace is not a total joke, it will read all the ID registers,
>>> and configure what it wants to see, assuming it is a feature that can
>>> be configured (not everything can, because the architecture itself is
>>> not fully backward compatible).
>>>
>>> Yes, this is buggy at times, because the combinatorial explosion of
>>> CPU capabilities and supported features makes it pretty hard to test
>>> (and really nobody actually does). But overall, it works, and QEMU is
>>> growing an infrastructure to manage it in a "user friendly" way.
>>
>> Yes, that is precisely what I'm asking for. I'm prepared to deal with
>> the fact that KVM/Arm64 is not a stable and mature platform like x86
>> is, and that userspace has to find all the random changes from one
>> version to the next, and explicitly pin things down to be compatible.
>>
>> All I'm asking for is that KVM makes it *possible* to pin things down
>> to the behaviour of previously released Linux/KVM kernels.
>>
>>> But really, this isn't what David is asking. He's demanding "bug for
>>> bug" compatibility. For that, we have two possible cases:
>>
>> No, I am not asking you to meet that bar. I merely observed that x86
>> does and that it would be nice. But we are a *long* way from that.
>
> x86 doesn't do bug-for-bug compatibility, thankfully - we have quirks
> but only 11 of them, or about one per year since we started adding
> them.  We only add quirks, generally speaking, when 1) we change the
> way file descriptors are initialized, 2) guests in the wild were
> relying on it, or 3) it prevends restoring state saved from an old
> kernel.  Is there anything else?
>
> So you're asking something not really far from this:
>
>>> - this is a behaviour that is not allowed by the architecture: we fix
>>>    it for good. We do that on every release. Some minor, some much more
>>>    visible. And there is no way we will add this sort of "bring the
>>>    bugs back" type of behaviours. Specially when it is really obvious
>>>    that no SW can make any reasonable use of the defect. We allow
>>>    userspace to keep behaving as before, but the guest will not see a
>>>    non-compliant behaviour.
>
> ... where for example
> https://lore.kernel.org/kvm/e03f092dfbb7d391a6bf2797ba01e122ba080bcd.camel@infradead.org/
> is an example of a bug that "no SW can make any reasonable use of".
>
>> Marc, this is complete nonsense and you should know better.
>> Once a behaviour is present in a released version of Linux/KVM, we
>> can't just declare it "wrong" and unilaterally impose a change in
>> guest-visible behaviour on *running* guests as a side-effect of a
>> kernel upgrade.
>>
>> The criterion for *KVM* to remain compatible is "once it has been in a
>> released version of the kernel". Not "once it is in the architecture".
>
> That is *also* obviously nonsense though, isn't it (see example
> above)? The truth is in the middle, "once it is in the architecture"
> is likely too narrow but "once it is in a Linux release" is way too
> broad.  And besides, both miss the point of *configurability* which is
> the basis of it all.
>
> The main difference between x86 and Arm is the default state at
> creation; x86 defaults to a blank slate, mostly; and when we didn't do
> that, we regretted it later (cue the STUFF_FEATURE_MSRS quirk).  It's
> too late to change the behavior for Arm, but I think we can agree that
> patches such as
> https://lore.kernel.org/kvm/20260511113558.3325004-2-dwmw2@infradead.org/
> ("KVM: arm64: vgic: Allow userspace to set IIDR revision 1") are what
> the letter and spirit of this proposal is about.
>
> Marc did not mention having to deal with guests in the wild.  Let's
> ignore it for now because even defining "guests in the wild" is hard;
> and anyway it's not related to the patch that triggered the discussion.
>
> So we have the third case, "restoring state saved from an old kernel".
> If this case arises, I do believe that Arm will have to deal with it
> and introduce quirks or KVM_GET/SET_REG hacks.  Maybe it hasn't
> happened yet, lucky you. 

for info, this qemu series was merged laterly.

[PATCH v10 0/7] Mitigation of "failed to load
cpu:cpreg_vmstate_array_len" migration failures <https://lore.kernel.org/all/20260420140552.104369-1-eric.auger@redhat.com/#r>
https://lore.kernel.org/all/20260420140552.104369-1-eric.auger@redhat.com/#r

It brings an infrastructure to mitigate some migration failures accross different kernel versions.

Also there is [PATCH v4 00/17] kvm/arm: Introduce a customizable aarch64 KVM host model, under review
https://lore.kernel.org/all/20260503073541.790215-1-eric.auger@redhat.com/

This series aims at beeing able to offer the capacity to set writable ID regs on the host passthrough vcpu model.

Thanks

Eric


>
> Overall, even if we may disagree about the details, are we really on
> terribly distant grounds, or are we not?
>
> Paolo
>


