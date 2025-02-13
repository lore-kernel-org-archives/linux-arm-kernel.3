Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E3DC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mM38hiROvBeexK9bqD1n3qJWGB2ubMweuysoBKoddSQ=; b=UM1E9dC7tS5zOF7R1jN9SsOCtl
	krpcKbWkZjc/lKlcNMSaZEf9Hv5ZygXM3kzYtTE/zd8nD+vztfAHfszMkOhKlshFeRJK/jTMtV/eE
	1SONCTHmGxfFjDPaihvEWk96Sz8LJjtoEH2TvFTLuhO/E50vGAu+rV7lmh9+XIX+QBr91Ns9g79DB
	Q0G4wjUwwh0iLFffE/N5uBpeLkRYbRDH2XKNTfg+PQ8c0GFhnBoOelz6+bRQ6DESRdrS5Xd3yyQ1A
	9zzi+GhdlBr7NXLET7yz/pIyyouWsKb0JiEKHs5d8wg223HjNjK6tde/kqg6cjqG1h2AZfTTvkV2Y
	CKWkVwUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigFv-0000000CcaM-0rez;
	Thu, 13 Feb 2025 20:56:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tif4y-0000000CRHB-2GpZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 19:40:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3255B5C5852
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 19:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562B4C4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 19:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739475655;
	bh=2fD/8NcdfM1XFbfMLJwPpFgwUB/k7cAYGRhasfPcpQc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H8uFnfROeMJpAeSDmyUkDIVWosH2ICc28ajPKK3oO2cVTP4saSj/Jxpk1Il/cz+/R
	 DG8UBXzjBNXDGb07I+nxpw5t4+Az5MXk9bFeZHXyIcDO9oA5CWf+FwLneFU0Ze5QmI
	 KNR/Gyv04bJfehFfRA9/GNJDToYqZSZ1QNEO3lQS7k1MdjEcjqtnvkZ/TnjDiXVp22
	 /YP+WpUNHYvOcjjHxQZjKGcIiKgDhXt6iQkj+LZ41LPCDLtlbPW4WBz66iDXu6zCQq
	 X9xuH6VO5fLgtZL1Ut0K98Q+pKj0RGOtg6nozKkEmm9PA/eqbOkdaP+KH1s4dDcOdE
	 jLRel+GaosQuw==
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d14811cabfso4110605ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 11:40:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYc4/opV+nYWrSCHdZZ6fgKN0Fc0mXHVe8z8wsz1mlT0BXOapfmPQghC0096N1ODsfCLYmYrveL8cyz2cXeOLD@lists.infradead.org
X-Gm-Message-State: AOJu0YyPBdb3f491+gLJOTDoKT7I3ze8GNVumOzwbaBOWAxrEjWQ7Mmd
	PKjNDXFv1hPv8K60Jl5iUaxGMSM+jI39yN0MfU9tYBGkoB2ZbAKRA59DKtQsz12TQYD3h0vBFH6
	E9ltw3Zgbhijic3sMyToA+wtt9Lk=
X-Google-Smtp-Source: AGHT+IF+5ylYJUZMlWYWg/QDJ6Iijw0EymWMIzglKMEAh/hwvS5o8pbwP7TnThM1fM/rhQGM0ldnxer/uBQ+WAhXQyY=
X-Received: by 2002:a05:6e02:17ce:b0:3d0:24c0:bd3e with SMTP id
 e9e14a558f8ab-3d17be19829mr79268695ab.7.1739475654602; Thu, 13 Feb 2025
 11:40:54 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com> <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <20250212234946.yuskayyu4gx3ul7m@jpoimboe> <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
 <20250213024507.mvjkalvyqsxihp54@jpoimboe> <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
 <mb61py0yaz3qq.fsf@kernel.org>
In-Reply-To: <mb61py0yaz3qq.fsf@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 13 Feb 2025 11:40:43 -0800
X-Gmail-Original-Message-ID: <CAPhsuW7dV7UR3PsGVx_DLBH5-95DAmLMGTPuY0NfUwWLZMSTrQ@mail.gmail.com>
X-Gm-Features: AWEUYZleA2B0b6poFrS6Aosm-qV1fwd6duC3JQfY8JcX-3-CY1Sgbtn8ypNzvx0
Message-ID: <CAPhsuW7dV7UR3PsGVx_DLBH5-95DAmLMGTPuY0NfUwWLZMSTrQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Weinan Liu <wnliu@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Indu Bhagat <indu.bhagat@oracle.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_114056_696510_FC959CB2 
X-CRM114-Status: GOOD (  25.44  )
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

On Wed, Feb 12, 2025 at 11:46=E2=80=AFPM Puranjay Mohan <puranjay@kernel.or=
g> wrote:
>
> Song Liu <song@kernel.org> writes:
>
> > On Wed, Feb 12, 2025 at 6:45=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel=
.org> wrote:
> >>
> >> On Wed, Feb 12, 2025 at 06:36:04PM -0800, Song Liu wrote:
> >> > > > [   81.261748]  copy_process+0xfdc/0xfd58 [livepatch_special_sta=
tic]
> >> > >
> >> > > Does that copy_process+0xfdc/0xfd58 resolve to this line in
> >> > > copy_process()?
> >> > >
> >> > >                         refcount_inc(&current->signal->sigcnt);
> >> > >
> >> > > Maybe the klp rela reference to 'current' is bogus, or resolving t=
o the
> >> > > wrong address somehow?
> >> >
> >> > It resolves the following line.
> >> >
> >> > p->signal->tty =3D tty_kref_get(current->signal->tty);
> >> >
> >> > I am not quite sure how 'current' should be resolved.
> >>
> >> Hm, on arm64 it looks like the value of 'current' is stored in the
> >> SP_EL0 register.  So I guess that shouldn't need any relocations.
> >>
> >> > The size of copy_process (0xfd58) is wrong. It is only about
> >> > 5.5kB in size. Also, the copy_process function in the .ko file
> >> > looks very broken. I will try a few more things.
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
>
> I think, I am missing something here,
>
> I did :
>
> objdump -Dr livepatch-special-static.o | less
>
> and
>
> objdump -Dr output.o | less
>
> and the disassembly of copy_process() looks exactly same.

Yeah, objdump does show the same disassembly. However, if
I open the file with gdb, and do "disassemble copy_process",
the one in livepatch-special-static.o looks very weird.

Thanks,
Song

