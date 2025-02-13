Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC01C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 23:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYcL6vwdDsdJM+/vcTJaZ7nkqcNt6ZB8INo7OFtn+Tc=; b=mTPWWXowYIKNgG1p8bUu0IhQHT
	9tVn0khkGKcPT2UlGdNCaY4T3uwfwbDw+usQbXT/XCr3GE8I0L9Kn8HWLvIZQOZIZPhgvqPidl+wP
	pFu2KyLdmBASivc+q9+Gl0JySoPtEJWilU4ghUUQQ6sid6HtwACDO1rjANuS4mjCSp2DrydQtgaYF
	D4os5slS6hfSPlULetByehVr6NzcXfwtQEUOvBpRI6D44I9G/WHR6SdP2BIdpAkUwcw3TD3EOkUhj
	Hm5Sw44BBlM0SUw6LTIp09mH1IQLt9gD3yvVSycSdTOuq1cYiwo5v8mPF4ZytEuW6AfDb9PctW+2k
	qg0S2bpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiixS-0000000CzIh-16c7;
	Thu, 13 Feb 2025 23:49:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiiw0-0000000Cz8g-25RN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 23:47:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A23C5C5A52
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 23:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A19C4CEE5
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 23:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739490475;
	bh=5SJx2c5idPtQ+TpjdTaSRIBI12bZOmVEX8rAfHtVvW0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q9L6Hg/joNGQ78nyawUZS4SzDmRVUbDP6L/zPjOCw1lVUme+kFNL7taPsENVLJW3i
	 ceUQCWD5SM2v1OMt4UJXXrDfOW9U9jxXezJcjR0Cvm6b26i8nb2E+IiOKW1j9aKML2
	 mMYo2du3kTqJfUxnDtM/zmYg8H1/r4el9DEK48eURvvatDPzEghaBtVr7HG6vaUToW
	 Szk/GEMaVbWcBX2Kt4r447kCQUn6YjIpOaRySFQ6VERIbgF+cL+/N+bjnym2dxsgF+
	 ZHI+/wYJwZfk3OfgZyaBLYXweQCZSraBYhYaIlp+44qpugJAAyW/wanLVk0ZMVEq8M
	 nzlix4OlWjtPg==
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d19d214f0aso1132035ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 15:47:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVHMPCgx3qb5/bUJijMOz6r7dxVaaI2MRltj4srI/Y2KOsdElSRJG+3+xIrIWOKRnOovwtJEboWoXs5RGx3RiDB@lists.infradead.org
X-Gm-Message-State: AOJu0YyuMTI7DmvdGdaOF78MDkaysG3ZVNzAec7t6UkAv3oA7bN6+aEA
	qSRWN7JEVaMmF96CMbN0UijH6P8RwxPdM8SP13uq7gcOJm2hOavUXMV+D8p8CPSS4gG79OO9+HP
	yinS7QOJotD6eWjBg5N4Bhwz8qV8=
X-Google-Smtp-Source: AGHT+IERb3JVMz6pWb90bweOcAh9ut0V3OsQ1ifWR3S6vi2/jG0zXD+AnKlKMrWBqIaF3CVMTic6GM8MIf5ykYA2sq8=
X-Received: by 2002:a05:6e02:1fe8:b0:3cf:bb3e:884c with SMTP id
 e9e14a558f8ab-3d17bfddbd5mr82410445ab.16.1739490475076; Thu, 13 Feb 2025
 15:47:55 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com> <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <20250212234946.yuskayyu4gx3ul7m@jpoimboe> <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
 <20250213024507.mvjkalvyqsxihp54@jpoimboe> <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
 <3069bb9c-6245-4754-a187-ac8253103d32@oracle.com>
In-Reply-To: <3069bb9c-6245-4754-a187-ac8253103d32@oracle.com>
From: Song Liu <song@kernel.org>
Date: Thu, 13 Feb 2025 15:47:44 -0800
X-Gmail-Original-Message-ID: <CAPhsuW40ibipv5XbSnf27tEHDgNF7zQ8_o92qH7dGcH_1Rj9zA@mail.gmail.com>
X-Gm-Features: AWEUYZnQ6VFx06Li1Cy7ZO825UOUqK0v69jwOyZGyN4BN3juNeJy7TWbn4ScxCU
Message-ID: <CAPhsuW40ibipv5XbSnf27tEHDgNF7zQ8_o92qH7dGcH_1Rj9zA@mail.gmail.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
To: Indu Bhagat <indu.bhagat@oracle.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Weinan Liu <wnliu@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org, 
	Puranjay Mohan <puranjay@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_154756_626293_68D85874 
X-CRM114-Status: GOOD (  27.64  )
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

On Thu, Feb 13, 2025 at 3:23=E2=80=AFPM Indu Bhagat <indu.bhagat@oracle.com=
> wrote:
>
> On 2/12/25 11:25 PM, Song Liu wrote:
> > On Wed, Feb 12, 2025 at 6:45=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel=
.org> wrote:
> >>
> >> On Wed, Feb 12, 2025 at 06:36:04PM -0800, Song Liu wrote:
> >>>>> [   81.261748]  copy_process+0xfdc/0xfd58 [livepatch_special_static=
]
> >>>>
> >>>> Does that copy_process+0xfdc/0xfd58 resolve to this line in
> >>>> copy_process()?
> >>>>
> >>>>                          refcount_inc(&current->signal->sigcnt);
> >>>>
> >>>> Maybe the klp rela reference to 'current' is bogus, or resolving to =
the
> >>>> wrong address somehow?
> >>>
> >>> It resolves the following line.
> >>>
> >>> p->signal->tty =3D tty_kref_get(current->signal->tty);
> >>>
> >>> I am not quite sure how 'current' should be resolved.
> >>
> >> Hm, on arm64 it looks like the value of 'current' is stored in the
> >> SP_EL0 register.  So I guess that shouldn't need any relocations.
> >>
> >>> The size of copy_process (0xfd58) is wrong. It is only about
> >>> 5.5kB in size. Also, the copy_process function in the .ko file
> >>> looks very broken. I will try a few more things.
> >
> > When I try each step of kpatch-build, the copy_process function
> > looks reasonable (according to gdb-disassemble) in fork.o and
> > output.o. However, copy_process looks weird in livepatch-special-static=
.o,
> > which is generated by ld:
> >
> > ld -EL  -maarch64linux -z norelro -z noexecstack
> > --no-warn-rwx-segments -T ././kpatch.lds  -r -o
> > livepatch-special-static.o ./patch-hook.o ./output.o
> >
> > I have attached these files to the email. I am not sure whether
> > the email server will let them through.
> >
> > Indu, does this look like an issue with ld?
> >
>
> Sorry for the delay.
>
> Looks like there has been progress since and issue may be elsewhere, but:
>
> FWIW, I looked at the .sframe and .rela.sframe sections here, the data
> does look OK.  I noted that there is no .sframe for copy_process () in
> output.o... I will take a look into it.

That output.o was generated with a version of kpatch-build that blindly
removes all .sframe sections.

Thanks,
Song

