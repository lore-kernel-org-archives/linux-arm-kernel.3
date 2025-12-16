Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495EAD5E144
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zl5vYkOfCeh8vzJ1i3gRdGX7RBaO+Y5siaEC/TfzJu8=; b=GaZoSladLcc2g5jYQfxACof+Tb
	5kUW1iPEol0nWFS/74nkQBykK5ZYc49UmMaVG+IYZukO8WYXxE5UKVlvCxhRagco5cNjtZO9D1diz
	i3AFqGch0AcCe68EJy8OQOW2hGvkNnPhIWp78eDoF5NNVWJj4E1K1mTU6strdUFiM3VM7xDAwFOrS
	iz91hJB0pQpJJ+Nhe0g1EODut+P21JEPs7Y41nuBL7pjm7rYdYpeSvHSydq0hNeGvEnk8evcgm2Li
	IkySlXiypmLb3de1OC0atwD6cKn9E2lL8xMGHCMMu9nNJhVu/a0BvkK5/WzXIhQA7TSgXdE9C1WbL
	TEzA8L3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUKv-00000005CS4-3Dsv;
	Tue, 16 Dec 2025 12:39:29 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUKs-00000005CRg-2sBx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 12:39:27 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-64981e93806so5104240a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 04:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765888764; x=1766493564; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zl5vYkOfCeh8vzJ1i3gRdGX7RBaO+Y5siaEC/TfzJu8=;
        b=uhZCpWl6zTwhMB2VyKl0DpnLuBouHsuZUTeNIkD/kVT+2sU4+B4/TjZzo6Tly2LXAM
         8EO4pJ070QQlj7Qm3feoqz3omdZTz2EatMD3r4fijhz3ISx0zVXH/YKRk37GuyF6JfM/
         KONHPFiCJO11310z3Et6mOtWMtCmzc2MsDIvlVhJyqE3rjM0g4ntRNoKXiD1+SfcneWz
         SI4V7Ewz84iBhRUGaRkte9j9CWYVvWB4UlTlYUtrJ5EKAsKhtT4dvjDLIVpb2t4wD9Tx
         +Magtbtv+EXZDEN0ma8EX8UCzNDaudKEiXN0D2Qqg6MtAClb3KqugIE8brrtmLxT4O5A
         ChNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765888764; x=1766493564;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zl5vYkOfCeh8vzJ1i3gRdGX7RBaO+Y5siaEC/TfzJu8=;
        b=sA9RihnKQAmnORI1yQjDIILPUSMrDfCoSuY4qcrVyWBKoLvruU1MIGHLQbpTTvMHFj
         uBfMMjEiGCu+t9b8SnHmVbhnXbxYo/gyy4hrvqPv+OWLXjCfu9r4cgyDRzBhChVlTp8h
         GDPWPri9DawKuNUsqcUz/SFzRr1f8qVIhEX4C1KVpY3dALAanUvJAmW0trkRz2sbwPHr
         1Oqnx6i9HCR1o6RxiZG+Va/i3JFPW9f5hu0PRZwtl8+aFzk06aS6r7P1pyn3u9B9p+Lp
         Wr/ggZynu+5oeQMsdQIKZJ3t8GpZElX+/Nz+tFBPCxZZPc0X7AzJ++GBVRSWjag1K2cX
         4DMg==
X-Forwarded-Encrypted: i=1; AJvYcCUjan/jNi5T6v7/H9q3yWrAixbIFF2WrUJteAEVwB690W0i4TTknxIR7Lx2Hr+TLrYJ//vQ5Os7uFBoOY9Lg+J0@lists.infradead.org
X-Gm-Message-State: AOJu0YwfxHS5DLGRzYCDhEKgTTh9ZecyKpy2jUwsVSfeoFic6J/MJY6h
	B1oTgjMvAohVGOvAs0uB7rwHYeiC6wDIeCKj67Cs475ecZLwX3p66UUUWWUCQfau3IEJOTYTukH
	HfR1KotsD+qS+Og==
X-Google-Smtp-Source: AGHT+IHodb6E0igt70QWnGwF16M0BauoX0vq/LCQAwB66mdazNxScaNnSE8J8M2KteYx3re6oS8FbB6Lsn9MBw==
X-Received: from edsk11.prod.google.com ([2002:aa7:d8cb:0:b0:643:12a9:41be])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:50c8:b0:64b:3a87:44ff with SMTP id 4fb4d7f45d1cf-64b3a874559mr607042a12.34.1765888763584;
 Tue, 16 Dec 2025 04:39:23 -0800 (PST)
Date: Tue, 16 Dec 2025 12:39:22 +0000
In-Reply-To: <aUFKAdPY3zTlPmnr@e129823.arm.com>
Mime-Version: 1.0
References: <20251212161832.2067134-3-yeoreum.yun@arm.com> <CA+i-1C2e7QNTy5u=HF7tLsLXLq4xYbMTCbNjWGAxHz4uwgR05g@mail.gmail.com>
 <aT5/y3cSGIzi2K+m@e129823.arm.com> <DEYOI8H2OESD.1H56D3H8HKILB@google.com>
 <aT/WOAr4osoJWaMS@e129823.arm.com> <DEYP7JSVTB9D.3EFN2KEHH3O79@google.com>
 <aT/drjN1BkvyAGoi@e129823.arm.com> <DEZK5U2YP6I0.27VJHSVK14646@google.com>
 <aUE8bwUVa6jSUft1@e129823.arm.com> <DEZLRT59S25H.2YWTZ2G0TN3HV@google.com> <aUFKAdPY3zTlPmnr@e129823.arm.com>
X-Mailer: aerc 0.21.0
Message-ID: <DEZNBMBRM5M2.1974FFAQ13G5E@google.com>
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
X-CRM114-CacheID: sfid-20251216_043926_768136_4D7BEAF8 
X-CRM114-Status: GOOD (  28.46  )
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

On Tue Dec 16, 2025 at 12:01 PM UTC, Yeoreum Yun wrote:
>> On Tue Dec 16, 2025 at 11:03 AM UTC, Yeoreum Yun wrote:
>> > Hi Brendan,
>> >
>> >> On Mon Dec 15, 2025 at 10:06 AM UTC, Yeoreum Yun wrote:
>> >> [snip]
>> >> >> Overall I am feeling a bit uncomfortable about this use of _nolock=
, but
>> >> >> I am also feeling pretty ignorant about PREEMPT_RT and also about =
this
>> >> >> arm64 code, so I am hesitant to suggest alternatives, I hope someo=
ne
>> >> >> else can offer some input here...
>> >> >
>> >> > I understand. However, as I mentioned earlier,
>> >> > my main intention was to hear opinions specifically about memory co=
ntention.
>> >> >
>> >> > That said, if there is no memory contention,
>> >> > I don=E2=80=99t think using the _nolock API is necessarily a bad ap=
proach.
>> >>
>> >>
>> >> > In fact, I believe a bigger issue is that, under PREEMPT_RT,
>> >> > code that uses the regular memory allocation APIs may give users th=
e false impression
>> >> > that those APIs are =E2=80=9Csafe to use,=E2=80=9D even though they=
 are not.
>> >>
>> >> Yeah, I share this concern. I would bet I have written code that's
>> >> broken under PREEMPT_RT (luckily only in Google's kernel fork). The
>> >> comment for GFP_ATOMIC says:
>> >>
>> >>  * %GFP_ATOMIC users can not sleep and need the allocation to succeed=
. A lower
>> >>  * watermark is applied to allow access to "atomic reserves".
>> >>  * The current implementation doesn't support NMI and few other stric=
t
>> >>  * non-preemptive contexts (e.g. raw_spin_lock). The same applies to =
%GFP_NOWAIT.
>> >>
>> >> It kinda sounds like it's supposed to be OK to use GFP_ATOMIC in a
>> >> normal preempt_disable() context. So do you know exactly why it's
>> >> invalid to use it in this stop_machine() context here? Maybe we need =
to
>> >> update this comment.
>> >
>> > In non-PREEMPT_RT configurations, this is fine to use.
>> > However, in PREEMPT_RT, it should not be used because
>> > spin_lock becomes a sleepable lock backed by an rt-mutex.
>> >
>> > From Documentation/locking/locktypes.rst:
>> >
>> >   The fact that PREEMPT_RT changes the lock category of spinlock_t and
>> >   rwlock_t from spinning to sleeping.
>> >
>> > As you know, all locks related to memory allocation
>> > (e.g., zone_lock, PCP locks, etc.) use spin_lock,
>> > which becomes sleepable under PREEMPT_RT.
>> >
>> > The callback of stop_machine() is executed in a preemption-disabled co=
ntext
>> > (see cpu_stopper_thread()). In this context, if it fails to acquire a =
spinlock
>> > during memory allocation,
>> > the task would be able to go to sleep while preemption is disabled,
>> > which is an obviously problematic situation.
>>
>> But this is what I mean, doesn't this sound like the GFP_ATOMIC comment
>> I quoted is wrong (or at least, it implies things which are wrong)? The
>> comment refers specifically to raw_spin_lock() and "strict
>> non-preemptive contexts". Which sounds like it is being written with
>> PREEMPT_RT in mind. But that doesn't really match what you've said.
>
> No. I think the comment of GFP_ATOMIC is right.
> It definitely said:
>   The current implementation *doesn't support* NMI and few other strict
>   *non-preemptive contexts (e.g. raw_spin_lock)*.

But this phrasing sounds like there are other non-preemptive contexts
that it _does_ support. I would definitely read this as implying that
plain old preempt_disable() is OK. I don't understand what those "few
other strict contexts" are, nor why the stop_machine() context is
included in them.


