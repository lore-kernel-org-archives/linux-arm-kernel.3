Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A278ED6ACF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 17:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXebUtxKx7Yue8TaCMkSObpvA/kHo5Badeg+J8Y9otg=; b=gemuFJdLpbwzCQHx2es3TqNkD9
	+Egho7bY6ZZBAHKx7SWvlvsESd9LeXGpw/profudmBqaBL4fHfn0pyFj57wzhJjgpAv/5AsGPvn8e
	49sblf5M7oNQCmWJJGeLxlwoOFXrvoR3nIMdrWD6/mnVviANRyLwoQD51r37hWB7yRom+DKb/6zO1
	u/WcuEonGuWnif6U/jwHKEoRLTpRuaa+YvU308A0W169+dEqfPqAPmUz7tu3JBSrcaQ4OdxvxBJyu
	6D9wldeK9HcedvNK+5ubVYLY5Abl+Ia/1xfJTM0HNsoI/ZxZIkZJ4TGlFen0JP6VVZg1SGTmszRn/
	w8ay2V/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGMF8-0000000DmcX-0GDc;
	Wed, 27 Nov 2024 17:54:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGME8-0000000DmYY-3Ufl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 17:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732730002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oXebUtxKx7Yue8TaCMkSObpvA/kHo5Badeg+J8Y9otg=;
	b=LkhTdqGbuzERLtdGfEsZFuYM/yg7iYJXFvuE4DJdK+eKlME3yuH0gxyfd8VKp8hPvNbH3s
	4AhubvG2hGK96pQ7CDT9r44WVu6xXwFRi1ThysBnX3qVWgNfezYeCvJY1irOVBW9KjMT4T
	0CiaCB/OewEixi0haYoslZSV2bFxqms=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-4RqiBtWANd-g--nkfrFkYg-1; Wed, 27 Nov 2024 12:53:20 -0500
X-MC-Unique: 4RqiBtWANd-g--nkfrFkYg-1
X-Mimecast-MFC-AGG-ID: 4RqiBtWANd-g--nkfrFkYg
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-434a72b08d9so14056575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 09:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732730000; x=1733334800;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXebUtxKx7Yue8TaCMkSObpvA/kHo5Badeg+J8Y9otg=;
        b=L7i0dH0tyeXNq3RknkpPdXeePi/EiwKRq8mpq2fEJPj/5JLlFe75ePER+TYKH35x5p
         XDQUtTvXRZoiG7zChuzrJPlk+PnuHGPjOaF3F1awq6CGQCjgrOytb41fwQE1AoSEjXXF
         TrYxatkML4cDzDMRHdQ3hYYdjHHHTvTkEwY3gEvqfi//qs4kLl1ibGRhNbIh/c8WRQf6
         yyKP+pc3OzMnSMmgRWq3xWINFJChVq3Y/ogp1V3E/Rkn2GUh6vIZolm03m7MSEluZzod
         16DIfCJMsKTJhyGFAPmvnqLQkYl+YZQZER10uEJGNz8sKtf0bOjkNlmOXMGTOFpJobp0
         HFaw==
X-Forwarded-Encrypted: i=1; AJvYcCX9qO+16c1MtBcZ1HnlnUtyrlNB3g+eCnyhZWmgdFkmCFT2CGkXj98VzsISBl23nRVkH+/sbHd4RV1rhcC/lG6b@lists.infradead.org
X-Gm-Message-State: AOJu0YzgToiC0TpfGXIdVMX2aJJ/7avxz8vu9Iu+Ob9bMQV/4HDIqGXh
	aFdP1P4JZWY/BHckFVy6tvtPMqtk8GfuM1REBYyhOq54yAZ8fmQgb4/W//06k3L5gMtTS/UpzjZ
	zXlP1giMqbAAxhwW4kK93WZimVVSATGJF/rbfqwV6/uZVDwVzz0xvqky18cu1t6XuiBuNyc4t
X-Gm-Gg: ASbGncuCEWDPPnnymigiG0UMfOylunJA+U5BNZJfY9E+lvxbvEDWSVZMWGVUtKzj54K
	vhkmNyO/rqLISd481A4tDRLizEyh1J+piQk/w8Hbi4tdsF+28iGuAKpIfcWaSGpgakhSTM98zuE
	+8qkv/eKkEZMMKww6b5xs9Pa06xR2JF3MCzTB148ZFSRKBrKC8Tfm43kvqeO0rlvpsw/23wMdFW
	gJNCc3Io54H3QafLM2LMQPBWkXUqUXBLBMt5ZJMJt8Nl76Fk6c7p8jag7Pbnd64FeJQHvYFX3jX
	QBeGhiNsMqdByFo6RSEpcg==
X-Received: by 2002:a05:600c:3546:b0:434:9fb5:fddd with SMTP id 5b1f17b1804b1-434a9dec6c1mr31792595e9.23.1732729999674;
        Wed, 27 Nov 2024 09:53:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6anDJQjt8ptWxGgz7dhwaMeTQsYcl8C3n27l3PnWHFhWZjEJlpfVjhPH6uqi9gMk12+ahIA==
X-Received: by 2002:a05:600c:3546:b0:434:9fb5:fddd with SMTP id 5b1f17b1804b1-434a9dec6c1mr31792415e9.23.1732729999273;
        Wed, 27 Nov 2024 09:53:19 -0800 (PST)
Received: from rh (p200300f6af0bca008282df582fad0b68.dip0.t-ipconnect.de. [2003:f6:af0b:ca00:8282:df58:2fad:b68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe504sm16773349f8f.25.2024.11.27.09.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 09:53:18 -0800 (PST)
Date: Wed, 27 Nov 2024 18:53:18 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>
cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, 
    "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
    "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
    "will@kernel.org" <will@kernel.org>, 
    "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
    "oliver.upton@linux.dev" <oliver.upton@linux.dev>, 
    "james.morse@arm.com" <james.morse@arm.com>, 
    "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
    yuzenghui <yuzenghui@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, 
    Linuxarm <linuxarm@huawei.com>, "reijiw@google.com" <reijiw@google.com>
Subject: Re: [PATCH] KVM: arm64: Make the exposed feature bits in AA64DFR0_EL1
 writable from userspace
In-Reply-To: <87zfllssji.wl-maz@kernel.org>
Message-ID: <9d8e1bb6-797b-d0c9-6456-eb001271ba0e@redhat.com>
References: <20240813142835.77180-1-shameerali.kolothum.thodi@huawei.com> <86v804z3lk.wl-maz@kernel.org> <b2dad37ac5464384abe4edf76cb6b546@huawei.com> <4d3a7dde-e085-fa70-8859-ba153c93b615@redhat.com> <87zfllssji.wl-maz@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9DwJDpzdaI-6JkwihM05oUjreAH23YmIHAF5_9UdU-c_1732730000
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_095324_951728_9D6DBAA8 
X-CRM114-Status: GOOD (  33.70  )
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

On Tue, 26 Nov 2024, Marc Zyngier wrote:
> On Tue, 26 Nov 2024 17:00:35 +0000,
> Sebastian Ott <sebott@redhat.com> wrote:
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

It's the only diff in DFR0 - CTX_CMPs is the same. There are diffs in
other ID regs as well but these are already writable.

>> preventing us from trapping the access and make sure the correct
>> breakpoint is used? Is anyone working on this? If not I'd like to
>> give it a shot.
>
> Not only trapping. You also need to handle some interesting parts of
> the architecture, such as the breakpoint linking fun.

Ugh, and I was thinking this might be straightforward ;-(

> But if we are to go down that road, I really want to restrict that to
> implementations that have FEAT_FGT. Because otherwise we need to trap
> and emulate *everything*, instead of just the breakpoint registers.
> And that would be pretty bad from a performance perspective.

OK, understood.

> Another thing is that this only works because there is no report of
> the breakpoint number in ESR_ELx. The moment we offering this
> migration "feature", we are painting ourselves in a corner, should the
> architecture ever evolve to something less... bizarre.
>
> Finally, who is going to ensure this keeps working in the foreseeable
> future? Because while this is nice, that's not what gets deployed in
> production, as it leads to unpredictable performances. My take is that
> this thing will eventually bitrot and die.
>
> So, do we *really* want to go down that road?

Thanks a lot for the pointers! I'll do some more digging to figure out
what needs to be done and if that's actually worth it..

Sebastian


