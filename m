Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01768D10DB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 08:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aN+6aXxjhPFYN+ILtJ8oROYNyiXPAUR4XJGNYkKrR8w=; b=phPqvCNvhM1WoTgmcXuHmO4fja
	MwDVj5kgmSBhrWob099zSMpJE/nyLYbEpT1JCIJBckRQ/y/n54D+wc7LPWi//ntfE6IUsvcYOhllu
	Ge7aY1lOGqiAyPuRV67AhdNsvwXY0AeD8SG5r0rBPN/gjWMmYEacUVlXOLa6Y6B12Rhg1UKREFi8E
	vRE843FotcQIL59IOJoy7WH4rz1nuK+CCv8Q9QemaFxtcvWWkOhD+1JiRfwNz55eqA15FZR5QrlRE
	ERusNwXPK6MGXNFAW6NLKbd4yj5NNNF67rjzcNdPovwHDXbLs9yVv4RJlZuKbPdHAEm+IexuuiVYw
	OP/bVgdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1Q2-00000005MoX-2lF6;
	Mon, 02 Dec 2024 08:04:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1P3-00000005Mj6-2DtQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 08:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733126611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aN+6aXxjhPFYN+ILtJ8oROYNyiXPAUR4XJGNYkKrR8w=;
	b=FgumfeWNdWjtX6ns2WTBlIQqdfY6VwRAjue6FvDOyO1HLTJNZN6GqTzw+Om8XpTS6Eojjy
	JnD9hDAcawQxhfyennJPGTUeqjRmbKTVIioa420DUBRBbnnEZy+VgcW6EbWViqI9ASuSXH
	CpTuVROVAk+Y9TJLpFqFD51i8G7Q5cQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-wVhYxNPkOOedhnTvVHt1Rg-1; Mon, 02 Dec 2024 03:03:30 -0500
X-MC-Unique: wVhYxNPkOOedhnTvVHt1Rg-1
X-Mimecast-MFC-AGG-ID: wVhYxNPkOOedhnTvVHt1Rg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-434a195814fso29422935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 00:03:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733126609; x=1733731409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aN+6aXxjhPFYN+ILtJ8oROYNyiXPAUR4XJGNYkKrR8w=;
        b=Ch+NBGjanwAm7m1Zdn3CxQbWPVgIeU5KJDvsRmnWPaw7jacKWpH9PPFWi1eZNJ6mDW
         upS/i+qpYLhfciFO/0gcDD12UXYXJsnkJHavY48zUTrpr3gECpUPA66K3pVkl/FNAdzZ
         Nhqz7KhQtSXPoCOK9EO6nYZ90lYHNxTwXG84bjjJYKSmX7Q7x0mCeoXFWUQcw16+T7+o
         s8xrNtbjhCKYuMPkRjJMUqw18r4bDmxKyEOmtAquPBMMTM/0OksvviP0XRip8q7C7gtS
         x4DqDwloY6aI0IR3BFL0IyMqAfFQPzYydfAK7fJ/22+umooMXooNAqHyX1p0yUgA9WR/
         H/og==
X-Forwarded-Encrypted: i=1; AJvYcCU5eXsjLVIVJBBqDuwenwv4T1DnXMYy8Klvl7t7WLRVk1brxd+SKH/gN6Vqv1eVkk5OlY5HdtvuW9cLhju1U/u0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+TUxsO/RnAIzViS7bXu2ypymRim+PFHrc4ykIClGkJWC6PTEf
	gm4kIyuWDcMp0QiV2abdAD7OI5qEP5uAXbdyxdWsadKrXbQ36s62M+rJEVq3XscTHs5WkRW+aop
	wtUhfjdZpc2eaO6ayvZU+phcu2mAy+Gg5JBLs5lDY8wIYKWEnNJvhyFGFL5wiMMpJ5AiFODXG
X-Gm-Gg: ASbGncsT6z56n4tMQEGhoomk0lw8GZMpNnpaLKhBYtvnzA+EttC1rx+SkZGUcUzUIYd
	BSOcZqIL6DqLirTJVb7A6rTyo45yMRLR7GHHeu5y7M7piTrtZp+/ovR3tGF2JYawjKHYMHljpyn
	CAzyFI19ix6qQ0tmuWkBooP+UHJyCGaFzzincThGgpVrqOaMMYVWsgXmXzVkRYTMMih6VanbfXY
	Du/So4k/fbFy7qt9314aFCrrcz7v+xCCriQiGAh0DdNwgTu/ocOlXlDb0+hHhu2Ut97mUTCzm2T
	Y+uk/p4gZ7queaR9
X-Received: by 2002:a05:600c:588c:b0:434:a7e3:db50 with SMTP id 5b1f17b1804b1-434a9df26cbmr158067965e9.21.1733126609336;
        Mon, 02 Dec 2024 00:03:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOoKcy4ZLxYfJuHVBmETBdh3cXi5dFZ/+hCy9umKs5/0947WIDG+W1ZeqLNq9Ru+txGZNWXg==
X-Received: by 2002:a05:600c:588c:b0:434:a7e3:db50 with SMTP id 5b1f17b1804b1-434a9df26cbmr158067725e9.21.1733126608984;
        Mon, 02 Dec 2024 00:03:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f32837sm145415305e9.33.2024.12.02.00.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 00:03:28 -0800 (PST)
Message-ID: <e35612b4-e25b-4846-8fd2-56c2473c140d@redhat.com>
Date: Mon, 2 Dec 2024 09:03:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Make the exposed feature bits in AA64DFR0_EL1
 writable from userspace
To: Marc Zyngier <maz@kernel.org>
Cc: Sebastian Ott <sebott@redhat.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
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
 <c879fda9-db5a-4743-805d-03c0acba8060@redhat.com>
 <865xo3vbjq.wl-maz@kernel.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <865xo3vbjq.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YTyOhxAjdKeZ5I91hiBqCiCjp0JnEXl3WB9ETVbvhig_1733126609
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_000333_648932_77118505 
X-CRM114-Status: GOOD (  28.03  )
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

On 12/1/24 13:21, Marc Zyngier wrote:
> Hey Eric,
> 
> On Thu, 28 Nov 2024 09:31:08 +0000,
> Eric Auger <eauger@redhat.com> wrote:
>>
>> Hi Marc,
>>
>> On 11/26/24 20:29, Marc Zyngier wrote:
>>> Finally, who is going to ensure this keeps working in the foreseeable
>>> future? Because while this is nice, that's not what gets deployed in
>>> production, as it leads to unpredictable performances. My take is that
>>> this thing will eventually bitrot and die.
>> In the context of our works to define qemu vcpu models for ARM
>> (https://lore.kernel.org/all/20241025101959.601048-1-eric.auger@redhat.com/)
>> , our current approach is to try migrating between modern HW we have
>> access to. The case above is migration between AmpereOne and Grace which
>> both should be prevalent systems. Do you think this does not make sense
>> at all to try migrating between those, alhough this may be challenging?
> 
> I don't mind the challenge. But I'm worried this is something that
> looks like a reasonable idea that doesn't get any traction in
> practice.
> 
> And the example you mention is pretty striking: who in their right
> mind would migrate between these two systems? If you deploy a Grace
> system, that's because you are making use of the GPU, and your VM is
> likely to require it. Conversely, if you run on an Ampere system, you
> don't want to use a valuable (read: bloody expensive) slot on a Grace
> machine.

Yes I acknowledge it is a total valid point from a use case and cost
point of view. I was expecting maybe some interest migrating between
AmpereOne and Grace-Grace for farm enhancement but most probably it is
marginal.

Definition of [qemu] named vcpu models looks pretty uneasy then because
we don't have much relevant and accessible HW to test with, taking into
account such non technical considerations. Besides migration within a
CPU family I don't see much.
> 
>> Other cases we have looked at are migration within Ampere Altra Max
>> system family (which should be hopefully fine now with have CTR_EL0
>> works from Sebastian upstream), mig between Graviton hosts. Wrt Ampere
>> Altra Max to AmpereOne, Oliver pointed out the cntfrq issue which is
>> blocking.
>>
>> Do you think we should restrict our studies to systems which are
>> "closer" to each other in terms of ARM spec rev. We throught that
>> migration bewteen AmpereOne And Grace would be an interesting POC and
>> not totally irrelevant in terms of industry.
> 
> These two implementations may be close in terms of CPU features. But
> as systems, they are massively different, and I very much doubt they
> have the same deployment story. If they have one at all.
OK thank you for sharing your point of view.
> 
> The Graviton story may have more traction, but these folks have their
> own way of doing things, and in my experience do not give upstream
> much consideration.
OK thanks
> 
> To sum it up, I'm not opposed to this work. But if we are going to
> carry this sort of complex emulation, I want someone to step up and
> promise that they will test it for the next 10 years, at the very
> least. Because I'm very unlikely to ever have access to any of these
> machines, let alone both, and I don't see people using it in practice.
understood!

Thanks

Eric
> 
> Thanks,
> 
> 	M.
> 


