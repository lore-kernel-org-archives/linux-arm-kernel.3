Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67646D6552E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydmtTAzJ7xFTdnZQzRxd9lW2geyaRjzb3DBbsGuXzYg=; b=vsPV70eKHx7V8PChcODC/U/oGj
	Fmiw5ZqJHjwTY3zHRHNVqKnX4Kd4k0+yZCUDTjFgILRSCeaWuoDyVP0Z/oa7Zw87+znNMqq9eJbjZ
	6YjK3uyQ/yaGVoax9zMV7mClOlt7wgBGv3gVAlqAofI8KyqNa+zYvHtr1w/qIsHb199YlI7Efv/4A
	sNOTwfUJFp4/OfW8cPotvrBBDmuO8Ev6sHrzY/o6Xa8j55A5dgGW9KSiZZOSWrQ9gGOlYt+FKrft+
	wY082RRFIu2yCIboQyzqILUOPKXRK3Mfx5zmeZLQ09IWfaZ60ptf+2eTRSjhyaU6Mi3EBe3SqyBhs
	t16xZedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyyE-0000000BFCi-1a9J;
	Tue, 26 Nov 2024 17:03:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyxG-0000000BF3U-1LQK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 17:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732640544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ydmtTAzJ7xFTdnZQzRxd9lW2geyaRjzb3DBbsGuXzYg=;
	b=bKXj4pCBlrZmvnO4jxh5bxPdAXBIaTdz4Fuc0wVuZLWG5gCFg7iKqabUUl5RdulrIeXzQA
	pd8jU4Q7vRvNX4qD7G2nwJQ5o7ZYpKr2zAShordvIrIvESbCpZuQQ/sVX0yoQ0GBjt2c6B
	Y/u8vn5ieFoVFS6v4ZATGczgSnUk7fA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-uUZv9FRuNgWpPTF52CI25A-1; Tue, 26 Nov 2024 12:00:43 -0500
X-MC-Unique: uUZv9FRuNgWpPTF52CI25A-1
X-Mimecast-MFC-AGG-ID: uUZv9FRuNgWpPTF52CI25A
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b67201e64eso181140085a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 09:00:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732640443; x=1733245243;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydmtTAzJ7xFTdnZQzRxd9lW2geyaRjzb3DBbsGuXzYg=;
        b=u98l7NeY4a/Sv86tMaX9YOFa9jkhKUmBDiUZ948ffSQPZNPIFGY232yCE7I+zD0Q2y
         DvSSr07a7pun1V5zHB3/5ReslI+P3+J+xblFklv7tb/wFr7Ha9ci/7tfLnCmupPuKbfu
         TTqtAUHLMOhon9DlNNM4BJW/5kDfpI+pZhwdhSPL0hH5QmM9LLWavN6j/+19CNDUnquh
         B0L+SZSBdeFC0UlanqsOC+3VXCHFSsnwAP6v6b7hbL/IF881DmwOjCPsY/Xcnay6y8EP
         IofXGq14cjiBbs5SWN7O/fRQuPCrto7xKrFlVz6Tr7JIq6Jk54qf0znrgrFoe1g1Ti7i
         y3+w==
X-Forwarded-Encrypted: i=1; AJvYcCXhAN8mL7+j8fNRWpZ98mlcwFjBPQr6oWrx+3zeagXs0Qk5/6xWwVaPpguQV7/X8/jdFRbaJspXkKpiuejrcZR1@lists.infradead.org
X-Gm-Message-State: AOJu0YyBqAsqTJ48m6LNaFPvibNIxUu9Dy0T32Ki2eSsty9xlQ4i2i+d
	kOYBRjAai0IPlqLBIa20Zusj33yqRuivqNBhs2VAFexwKvAwdl9VLEjRs/7hpVTAiDMraHcumMz
	mgu+2bCI8hJYf+bIfDwsE9cEac7OmWFO1NKAGExQM0JWB6MYE3jG80Le14MQiiQNipY+fNiSt
X-Gm-Gg: ASbGncvop0wMZ+6O5Tqg2pe3wgldYRdpu2RUQoQwX1GOSfv7pL7DQebTMyQftqd6aTh
	agrl8GGd3dww+0OXuVJZnH6MRUcDjJ0S30AMpcj3P0nAqzm9eMw7Kpq6m6wZeDnDJc5Ik4NmNpj
	AVJI4UaexXNYdFct8La0Y06RD+MKuI+opWtqnkHCMmHkQ6NlsaqbUMbGAw5+qVeTyaqaR4DYxpH
	e9QdAAALw1JkfRKOureCruKEICJz7UytjtarYekHQ2xxYdVjZKvKrLL9H2bimtaeeGeNel/qoUV
	XeGZ7fq1tg9LnXG/RHWmJQ==
X-Received: by 2002:a05:620a:4393:b0:7b6:66d0:5ab6 with SMTP id af79cd13be357-7b666d05b7fmr1177815585a.51.1732640442846;
        Tue, 26 Nov 2024 09:00:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEk2ACspI3Vw+bJ1uihy2FVtGnZP2FHNgWeUwBtUpzJHCjn+X46VDNrXbQ0bQSxFF1w9gPpfQ==
X-Received: by 2002:a05:620a:4393:b0:7b6:66d0:5ab6 with SMTP id af79cd13be357-7b666d05b7fmr1177812085a.51.1732640442528;
        Tue, 26 Nov 2024 09:00:42 -0800 (PST)
Received: from rh (p200300f6af0bca008282df582fad0b68.dip0.t-ipconnect.de. [2003:f6:af0b:ca00:8282:df58:2fad:b68])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b51416a3a9sm481154685a.113.2024.11.26.09.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 09:00:42 -0800 (PST)
Date: Tue, 26 Nov 2024 18:00:35 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
cc: Marc Zyngier <maz@kernel.org>, 
    "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
    "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
    "will@kernel.org" <will@kernel.org>, 
    "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
    "oliver.upton@linux.dev" <oliver.upton@linux.dev>, 
    "james.morse@arm.com" <james.morse@arm.com>, 
    "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
    yuzenghui <yuzenghui@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, 
    Linuxarm <linuxarm@huawei.com>, "reijiw@google.com" <reijiw@google.com>
Subject: RE: [PATCH] KVM: arm64: Make the exposed feature bits in AA64DFR0_EL1
 writable from userspace
In-Reply-To: <b2dad37ac5464384abe4edf76cb6b546@huawei.com>
Message-ID: <4d3a7dde-e085-fa70-8859-ba153c93b615@redhat.com>
References: <20240813142835.77180-1-shameerali.kolothum.thodi@huawei.com> <86v804z3lk.wl-maz@kernel.org> <b2dad37ac5464384abe4edf76cb6b546@huawei.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PYZic9UgmIoEP_vYhaYc7XhE9JQ2YrWuNtlHwlC5r9A_1732640443
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_090226_428017_D95DE943 
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

Hi,

On Wed, 14 Aug 2024, Shameerali Kolothum Thodi wrote:
>>
>> On Tue, 13 Aug 2024 15:28:35 +0100,
>> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>>>
>>> KVM exposes the OS double lock feature bit to Guests but returns
>>> RAZ/WI on Guest OSDLR_EL1 access. This breaks Guest migration between
>>> systems where this feature support differ. Add support to make this
>>> feature writable from userspace by setting the mask bit. While at it,
>>> set the mask bits for other exposed features in the AA64DFR0_EL1
>>> register as well.
>>>
>>> Also update the selftest to cover these fields.
>>>
>>> Signed-off-by: Shameer Kolothum
>> <shameerali.kolothum.thodi@huawei.com>
>>> ---
>>>    This is based on the discussion here(Thanks to Oliver),
>>>    https://lore.kernel.org/all/ZrVSlbVwnaMDShah@linux.dev/
>>> ---
>>>  arch/arm64/kvm/sys_regs.c                         | 6 +++++-
>>>  tools/testing/selftests/kvm/aarch64/set_id_regs.c | 4 ++++
>>>  2 files changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>>> index c90324060436..adb49d681052 100644
>>> --- a/arch/arm64/kvm/sys_regs.c
>>> +++ b/arch/arm64/kvm/sys_regs.c
>>> @@ -2376,7 +2376,11 @@ static const struct sys_reg_desc sys_reg_descs[]
>> = {
>>>  	  .get_user = get_id_reg,
>>>  	  .set_user = set_id_aa64dfr0_el1,
>>>  	  .reset = read_sanitised_id_aa64dfr0_el1,
>>> -	  .val = ID_AA64DFR0_EL1_PMUVer_MASK |
>>> +	  .val = ID_AA64DFR0_EL1_DoubleLock_MASK |
>>> +		 ID_AA64DFR0_EL1_CTX_CMPs_MASK |
>>> +		 ID_AA64DFR0_EL1_WRPs_MASK |
>>> +		 ID_AA64DFR0_EL1_BRPs_MASK |
>>
>>
>> I think this is going to cause some troubles.
>>
>> The issue is that context-aware breakpoints are the highest-numbered
>> breakpoints, right after the normal breakpoints (D2.8.3 "Breakpoint
>> types and linking of breakpoints"). So if you reduce the number of
>> normal breakpoints, you shift the context-aware ones down, and
>> everything breaks.
>
> Thanks Marc for explaining this. I was not aware of this one.
>
>> I really don't see how you can safely do that without completely
>> changing the way we handle the debug registers.
>
> Looks like Reji has attempted to do this a while back,
> https://lore.kernel.org/kvm/20220419065544.3616948-13-reijiw@google.com/
>

I've got two machines that differ in the number of breakpoints and
it would be nice to be able to migrate between these. Is anything
preventing us from trapping the access and make sure the correct
breakpoint is used? Is anyone working on this? If not I'd like to
give it a shot.

Thanks,
Sebastian


