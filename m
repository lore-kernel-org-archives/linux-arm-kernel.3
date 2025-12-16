Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6903BD5E133
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krMeQQo0RYkVVveyUInYgEYC1GtxSzSLPYvL0R6jcGk=; b=Zyd4Y4klcdpXfNIzkD/JWWQ0Xd
	rpfqfrFz38JQg9YGqobW5vA7RblZSXVcVxeJ0q55Kvm37Pnx7wh5jLFCsQrDCSLju3UGcQswEULKi
	4unFAWkEarOUBO8JKs4x7pQlEyiWXsqhrqnWrgguWcyzIPpD0WbKY3lz+1/Xakyu10xEDcPcUwpsb
	x9gOuaouHGYfY9YUyFsZc1rrFzYuDOWeaCnRv4bu7JxiBDGtm+3f3kayt+gu3ihYLFV0ZAEJmi7Fj
	REkV8YpRz0yPdRXyDY5cj6zIxIJ3bcG9D30F4szWeFDG6GojbUfhnqixUN965VE9hoDOUot9zWRNu
	fg00B9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVTCM-000000057lv-1qlr;
	Tue, 16 Dec 2025 11:26:34 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVTCK-000000057kb-1Tgt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 11:26:33 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-42fb1c2c403so3579081f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 03:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765884390; x=1766489190; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krMeQQo0RYkVVveyUInYgEYC1GtxSzSLPYvL0R6jcGk=;
        b=kFeuc+yEdEvUBZBjT5M0c5oNFoymm/E9bLHM1ulSitJJv26GMIEmXa1jC2inhYiY97
         0r/pF1kJ5Nmnq0Ex6M1UWMhJFFhgYBywB4BCs2StZfi7hXyb/DM6qC3drmALh62y6PFk
         5aUMa13q62crgLbhCB0ixKl8BdrkzmupuKCj46mqnsPhK+R3pKHwsPQsB8KTlb+1Fevr
         093SsdNR/Bza+feN33s27tzzgrs9EMcM+NDi3i1d+smq20RDmOr3lPZBrU+/4WiCLFxw
         fDlYBjvq14BNOOsed+ZcKtTuw2jcECxziZad77SkOx1AiYODhyBW7HC3LbIbS/6otr15
         LP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765884390; x=1766489190;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=krMeQQo0RYkVVveyUInYgEYC1GtxSzSLPYvL0R6jcGk=;
        b=kEVLnrqDZYunq/dRhileHx/xo3hXjz8Y8dnbZ3YlArllj29ucKKpbgBfdUK0a+u+xA
         BJzwYnAYi5r1NSfH/qivj3q/aO/qqnIvSScvm5CjbY4FuPq3CLHTW0Q5Z+SlSGapNCSY
         swJS4CExQaJXbLPO6JfkzmoJfldOPtxySfWi/qqZQTCVTXGgzmX8c0VyYcgJMVqM3ZRr
         P/AM62z6nKcf2+/T6ckbjedznAW8OoEl4oy5JheaSA5bCJ/f4OxP7rTobwmeltI2SbKA
         5a9Nde7gkooRgCAIsZEF+s5NGq6NegnzFKIbTB6rL/ExeCai3yqkNUPpAyzCUT/+T0M5
         6iUA==
X-Forwarded-Encrypted: i=1; AJvYcCV4+VSLqE3eSHspc12FpxdtKbEDEyBrwk4PK+OpHB0fMTrsbqhQj96jupl/pSwW/+45Ty2Blxk2QjzRheu7no4P@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0FllZ+7LW119zzwJDvev0uTd32CQZuBBNOnAqWsmLLMQfi/j8
	ZF50kbGWUqXpn9UG+ewjjS4igut17iZDlC2teUssco16+g2kHT8hQ63VBAD3ElHsxD4ddPAtxtA
	GJSU86tp0rMdYkQ==
X-Google-Smtp-Source: AGHT+IHRBFMdNHijFHNhfpSjk2TQJ9kZwXaGz3RsF4bB/Qt7P2NzdaKmXMouO4czF1ta3V3ssZTXVLAPCUMyQQ==
X-Received: from wrrr18.prod.google.com ([2002:adf:a152:0:b0:427:87c:f46])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:310e:b0:430:fcda:4529 with SMTP id ffacd0b85a97d-430fcda47a1mr7553444f8f.61.1765884389671;
 Tue, 16 Dec 2025 03:26:29 -0800 (PST)
Date: Tue, 16 Dec 2025 11:26:29 +0000
In-Reply-To: <aUE8bwUVa6jSUft1@e129823.arm.com>
Mime-Version: 1.0
References: <20251212161832.2067134-1-yeoreum.yun@arm.com> <20251212161832.2067134-3-yeoreum.yun@arm.com>
 <CA+i-1C2e7QNTy5u=HF7tLsLXLq4xYbMTCbNjWGAxHz4uwgR05g@mail.gmail.com>
 <aT5/y3cSGIzi2K+m@e129823.arm.com> <DEYOI8H2OESD.1H56D3H8HKILB@google.com>
 <aT/WOAr4osoJWaMS@e129823.arm.com> <DEYP7JSVTB9D.3EFN2KEHH3O79@google.com>
 <aT/drjN1BkvyAGoi@e129823.arm.com> <DEZK5U2YP6I0.27VJHSVK14646@google.com> <aUE8bwUVa6jSUft1@e129823.arm.com>
X-Mailer: aerc 0.21.0
Message-ID: <DEZLRT59S25H.2YWTZ2G0TN3HV@google.com>
Subject: Re: [PATCH 2/2] arm64: mmu: use pagetable_alloc_nolock() while stop_machine()
From: Brendan Jackman <jackmanb@google.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, Brendan Jackman <jackmanb@google.com>
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, 
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <vbabka@suse.cz>, 
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>, <ast@kernel.org>, 
	<daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>, 
	<eddyz87@gmail.com>, <song@kernel.org>, <yonghong.song@linux.dev>, 
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@fomichev.me>, 
	<haoluo@google.com>, <jolsa@kernel.org>, <hannes@cmpxchg.org>, 
	<ziy@nvidia.com>, <bigeasy@linutronix.de>, <clrkwllms@kernel.org>, 
	<rostedt@goodmis.org>, <catalin.marinas@arm.com>, <will@kernel.org>, 
	<ryan.roberts@arm.com>, <kevin.brodsky@arm.com>, <dev.jain@arm.com>, 
	<yang@os.amperecomputing.com>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>, 
	<linux-rt-devel@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_032632_433624_493DE672 
X-CRM114-Status: GOOD (  26.92  )
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

On Tue Dec 16, 2025 at 11:03 AM UTC, Yeoreum Yun wrote:
> Hi Brendan,
>
>> On Mon Dec 15, 2025 at 10:06 AM UTC, Yeoreum Yun wrote:
>> [snip]
>> >> Overall I am feeling a bit uncomfortable about this use of _nolock, b=
ut
>> >> I am also feeling pretty ignorant about PREEMPT_RT and also about thi=
s
>> >> arm64 code, so I am hesitant to suggest alternatives, I hope someone
>> >> else can offer some input here...
>> >
>> > I understand. However, as I mentioned earlier,
>> > my main intention was to hear opinions specifically about memory conte=
ntion.
>> >
>> > That said, if there is no memory contention,
>> > I don=E2=80=99t think using the _nolock API is necessarily a bad appro=
ach.
>>
>>
>> > In fact, I believe a bigger issue is that, under PREEMPT_RT,
>> > code that uses the regular memory allocation APIs may give users the f=
alse impression
>> > that those APIs are =E2=80=9Csafe to use,=E2=80=9D even though they ar=
e not.
>>
>> Yeah, I share this concern. I would bet I have written code that's
>> broken under PREEMPT_RT (luckily only in Google's kernel fork). The
>> comment for GFP_ATOMIC says:
>>
>>  * %GFP_ATOMIC users can not sleep and need the allocation to succeed. A=
 lower
>>  * watermark is applied to allow access to "atomic reserves".
>>  * The current implementation doesn't support NMI and few other strict
>>  * non-preemptive contexts (e.g. raw_spin_lock). The same applies to %GF=
P_NOWAIT.
>>
>> It kinda sounds like it's supposed to be OK to use GFP_ATOMIC in a
>> normal preempt_disable() context. So do you know exactly why it's
>> invalid to use it in this stop_machine() context here? Maybe we need to
>> update this comment.
>
> In non-PREEMPT_RT configurations, this is fine to use.
> However, in PREEMPT_RT, it should not be used because
> spin_lock becomes a sleepable lock backed by an rt-mutex.
>
> From Documentation/locking/locktypes.rst:
>
>   The fact that PREEMPT_RT changes the lock category of spinlock_t and
>   rwlock_t from spinning to sleeping.
>
> As you know, all locks related to memory allocation
> (e.g., zone_lock, PCP locks, etc.) use spin_lock,
> which becomes sleepable under PREEMPT_RT.
>
> The callback of stop_machine() is executed in a preemption-disabled conte=
xt
> (see cpu_stopper_thread()). In this context, if it fails to acquire a spi=
nlock
> during memory allocation,
> the task would be able to go to sleep while preemption is disabled,
> which is an obviously problematic situation.

But this is what I mean, doesn't this sound like the GFP_ATOMIC comment
I quoted is wrong (or at least, it implies things which are wrong)? The
comment refers specifically to raw_spin_lock() and "strict
non-preemptive contexts". Which sounds like it is being written with
PREEMPT_RT in mind. But that doesn't really match what you've said.

