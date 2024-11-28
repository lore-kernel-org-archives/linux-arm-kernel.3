Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4356ED690EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 09:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qflCQcWqRW8CB1fCDGhgJW1k72thggqLlIsWz11JA6A=; b=wnnm4Uh7yPYxM3NvmfR78CrM0Y
	CMhKFoyY90Vy5uKtTgqatfqjRPVJb1WvMKAPGAd7CCG21G8F06fI/lSc+fC177HT0MdN4HvdzctHn
	Fk6b4YodMQNqtreg37/DpibZUcPGKakqOawXuLc6xSXj5imXvdV3GYG8Kk0I6s30Y8JBXUTV2v6XF
	eQqO2SIEHOFaO+yBLKQeniHqEePB9UWRUhUMP7gQjLuogc4uG+3LgIGKnit8LF+TwepJdm/nGt/qF
	Gg+5qHdTJjtV+bjg7HeZwMftzc4UB5HRR6IQgzB0H86jNvmYqr8ZuuU7qYHhrLxN26lWILKhAiVQS
	W4KjT3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGasn-0000000F9Uf-2X8A;
	Thu, 28 Nov 2024 09:32:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGarm-0000000F9LL-26Qv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 09:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732786276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qflCQcWqRW8CB1fCDGhgJW1k72thggqLlIsWz11JA6A=;
	b=bHpcmqcLSZ0lP/q5zrtuNNTcLt0iKTDRSGvkbQO+oeuHbpxf4QERqEzHgVTCyAK720HV8a
	YwhhYlUp8UB7E0GC1fNBFSNxTraOaDFvkQuW7SPuNZcZBKpwvMzXu8Ql26lypd7IdUNquI
	60WTd+DiRe3n7U64vP3WFLB3PK/CVzI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-5vj_uWfYNqa2hzyCyu33-g-1; Thu, 28 Nov 2024 04:31:14 -0500
X-MC-Unique: 5vj_uWfYNqa2hzyCyu33-g-1
X-Mimecast-MFC-AGG-ID: 5vj_uWfYNqa2hzyCyu33-g
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d415acbbeaso10318506d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 01:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732786274; x=1733391074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qflCQcWqRW8CB1fCDGhgJW1k72thggqLlIsWz11JA6A=;
        b=jRJPAecMcIHQ24FoEEZpVpYucjNFjOnyVwawBuER5ItijacoR7ewHlqUKd22matZv2
         hXOi7CefEBA6aY5sMuLXm2Z1LN8KHhvIp5iQH42skUVtUuZ+U7vLutI8ZbuCzX/2N7Zc
         YSuV5CRWohk/LMztbWXwalACkhXS+rmafJa3xpD3JTtoX0JqGMmOBCUHQAwCKDohVHl4
         SjBPZb9xu0PHHgVtjiNTiocn/ZTZz8aK4mTMPJMeX71nCY3Z2he+F//PuhPLuj/kSODS
         NZLdepyhyyIBexYFwnBG8DFmLA2RVPzK3phj5aZ+HfnzE4Ag0zMHpj5a1JNgHbpfM5ns
         8nBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhWMzHyvCDIHynxBo3JVRp6Zjr9F8NUtq/S6N/DmuwjRZQIt3dHfCAckHl/jn11e8zwjH+5fqkUZGdqQxLcFpx@lists.infradead.org
X-Gm-Message-State: AOJu0YyW570/1bPyczH/QtvXPgYWWXQk19LRssYqTG0/czo9cOPs2lyg
	EuUMJcFaF4QFKKnoYpfSQSB0Rm53EW5Uy79K9rrngujcrkDIzxEj3hd0kyNTSFV1Zxr7DqBKuxf
	P8LFUda0niiT/EtBfJ4j/HqbfwoUlDv4JQTU/M6WRcy7t7sNNCUHDdHtZmHjyOhS2Mbo6uJvF
X-Gm-Gg: ASbGncsFCHohZtvuA8iaIb7KvwP5nd6pX4NGG9uASiAwjU1KkIq4W/nqGzZalHUh9fa
	r4Gz7mEIKG87njDquszmDLEXMk+ryQuhO+oIJ5E4wV2yD9HgW6Evlr/9kdDhlF7wdvDqJYMsLNq
	+bzzwpCIiz/dbkSUiQ7Un04gsOIqnfGO35Y89F2rKiv9rHKckgFAcdrPdiwbtsJDzn3QyuWo/mX
	MO/Jj3sNXU4+T7y7zGIZ6+ecc8l0FBZAUWgH+wtJow5pZXpZwRDhLalnRZREjB3vBASTfAyh7GR
	YjvgcNHrgTKaQS4f
X-Received: by 2002:a05:6214:b61:b0:6d4:1d6f:8fb9 with SMTP id 6a1803df08f44-6d864e009fcmr83159726d6.47.1732786273946;
        Thu, 28 Nov 2024 01:31:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhJ3V/hfVYirr7KuSaMapUfFbH73MzX/j1DHcPc2Xttffsv/HePJDU9+KtkhJ1+BCu2pSQEg==
X-Received: by 2002:a05:6214:b61:b0:6d4:1d6f:8fb9 with SMTP id 6a1803df08f44-6d864e009fcmr83159346d6.47.1732786273649;
        Thu, 28 Nov 2024 01:31:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d87517e457sm4697116d6.31.2024.11.28.01.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 01:31:12 -0800 (PST)
Message-ID: <c879fda9-db5a-4743-805d-03c0acba8060@redhat.com>
Date: Thu, 28 Nov 2024 10:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Make the exposed feature bits in AA64DFR0_EL1
 writable from userspace
To: Marc Zyngier <maz@kernel.org>, Sebastian Ott <sebott@redhat.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "will@kernel.org" <will@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 yuzenghui <yuzenghui@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 Linuxarm <linuxarm@huawei.com>, "reijiw@google.com" <reijiw@google.com>
References: <20240813142835.77180-1-shameerali.kolothum.thodi@huawei.com>
 <86v804z3lk.wl-maz@kernel.org> <b2dad37ac5464384abe4edf76cb6b546@huawei.com>
 <4d3a7dde-e085-fa70-8859-ba153c93b615@redhat.com>
 <87zfllssji.wl-maz@kernel.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <87zfllssji.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Anrdn0JUzsrWIuD8OmevNEq7IKnkZsaqwnsGXarpPhw_1732786274
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_013118_617613_2340B4F4 
X-CRM114-Status: GOOD (  33.17  )
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

Hi Marc,

On 11/26/24 20:29, Marc Zyngier wrote:
> On Tue, 26 Nov 2024 17:00:35 +0000,
> Sebastian Ott <sebott@redhat.com> wrote:
>>
>> Hi,
>>
>> On Wed, 14 Aug 2024, Shameerali Kolothum Thodi wrote:
>>>>
>>>> On Tue, 13 Aug 2024 15:28:35 +0100,
>>>> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>>>>>
>>>>> KVM exposes the OS double lock feature bit to Guests but returns
>>>>> RAZ/WI on Guest OSDLR_EL1 access. This breaks Guest migration between
>>>>> systems where this feature support differ. Add support to make this
>>>>> feature writable from userspace by setting the mask bit. While at it,
>>>>> set the mask bits for other exposed features in the AA64DFR0_EL1
>>>>> register as well.
>>>>>
>>>>> Also update the selftest to cover these fields.
>>>>>
>>>>> Signed-off-by: Shameer Kolothum
>>>> <shameerali.kolothum.thodi@huawei.com>
>>>>> ---
>>>>>    This is based on the discussion here(Thanks to Oliver),
>>>>>    https://lore.kernel.org/all/ZrVSlbVwnaMDShah@linux.dev/
>>>>> ---
>>>>>  arch/arm64/kvm/sys_regs.c                         | 6 +++++-
>>>>>  tools/testing/selftests/kvm/aarch64/set_id_regs.c | 4 ++++
>>>>>  2 files changed, 9 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>>>>> index c90324060436..adb49d681052 100644
>>>>> --- a/arch/arm64/kvm/sys_regs.c
>>>>> +++ b/arch/arm64/kvm/sys_regs.c
>>>>> @@ -2376,7 +2376,11 @@ static const struct sys_reg_desc sys_reg_descs[]
>>>> = {
>>>>>  	  .get_user = get_id_reg,
>>>>>  	  .set_user = set_id_aa64dfr0_el1,
>>>>>  	  .reset = read_sanitised_id_aa64dfr0_el1,
>>>>> -	  .val = ID_AA64DFR0_EL1_PMUVer_MASK |
>>>>> +	  .val = ID_AA64DFR0_EL1_DoubleLock_MASK |
>>>>> +		 ID_AA64DFR0_EL1_CTX_CMPs_MASK |
>>>>> +		 ID_AA64DFR0_EL1_WRPs_MASK |
>>>>> +		 ID_AA64DFR0_EL1_BRPs_MASK |
>>>>
>>>>
>>>> I think this is going to cause some troubles.
>>>>
>>>> The issue is that context-aware breakpoints are the highest-numbered
>>>> breakpoints, right after the normal breakpoints (D2.8.3 "Breakpoint
>>>> types and linking of breakpoints"). So if you reduce the number of
>>>> normal breakpoints, you shift the context-aware ones down, and
>>>> everything breaks.
>>>
>>> Thanks Marc for explaining this. I was not aware of this one.
>>>
>>>> I really don't see how you can safely do that without completely
>>>> changing the way we handle the debug registers.
>>>
>>> Looks like Reji has attempted to do this a while back,
>>> https://lore.kernel.org/kvm/20220419065544.3616948-13-reijiw@google.com/
>>>
>>
>> I've got two machines that differ in the number of breakpoints and
>> it would be nice to be able to migrate between these. Is anything
> 
> Is that the *only* thing that differ? Do the have the same number of
> context-aware breakpoints?
> 
>> preventing us from trapping the access and make sure the correct
>> breakpoint is used? Is anyone working on this? If not I'd like to
>> give it a shot.
> 
> Not only trapping. You also need to handle some interesting parts of
> the architecture, such as the breakpoint linking fun.
> 
> But if we are to go down that road, I really want to restrict that to
> implementations that have FEAT_FGT. Because otherwise we need to trap
> and emulate *everything*, instead of just the breakpoint registers.
> And that would be pretty bad from a performance perspective.
> 
> Another thing is that this only works because there is no report of
> the breakpoint number in ESR_ELx. The moment we offering this
> migration "feature", we are painting ourselves in a corner, should the
> architecture ever evolve to something less... bizarre.
> 
> Finally, who is going to ensure this keeps working in the foreseeable
> future? Because while this is nice, that's not what gets deployed in
> production, as it leads to unpredictable performances. My take is that
> this thing will eventually bitrot and die.
In the context of our works to define qemu vcpu models for ARM
(https://lore.kernel.org/all/20241025101959.601048-1-eric.auger@redhat.com/)
, our current approach is to try migrating between modern HW we have
access to. The case above is migration between AmpereOne and Grace which
both should be prevalent systems. Do you think this does not make sense
at all to try migrating between those, alhough this may be challenging?

Other cases we have looked at are migration within Ampere Altra Max
system family (which should be hopefully fine now with have CTR_EL0
works from Sebastian upstream), mig between Graviton hosts. Wrt Ampere
Altra Max to AmpereOne, Oliver pointed out the cntfrq issue which is
blocking.

Do you think we should restrict our studies to systems which are
"closer" to each other in terms of ARM spec rev. We throught that
migration bewteen AmpereOne And Grace would be an interesting POC and
not totally irrelevant in terms of industry.

Thanks

Eric
> 
> So, do we *really* want to go down that road?
> 
> 	M.
> 


