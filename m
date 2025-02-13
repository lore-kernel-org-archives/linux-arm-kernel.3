Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D55C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 02:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wo0OK5LTMnsjMDqlKAoENLpROI8KX8oY57z5Psg2ZLI=; b=eo3kypOqxCEpJonbF6mA2yScJv
	cJVw+N5T9LgtBVpeVpDAVlko3i+5ndfogN/MRWltnItQntkvZy8qqwXOdx5CUMIfBI+QZkWyCQ6E3
	oAyNSOlDDkollTU1kxU8UIPvFdw0jBb+LGgeILucjcu+p7wXqtogGBPgheX5E6IYw32+ggXpDghAx
	3dyKPx8xY2GpA0srvLFWW1JEih5H1odusXk09sXIIkV+aK49MByD5c0vA9j8KN9VgxZO5xd9Ahyid
	zMKXKaEW+TZQqMOlrOq3go/0cAZKBuqSYPpihIKefgYE89s5NO12lYMKOaodzkYOAvC+AUk6Nax15
	GpYZ2sYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiP6o-00000009WXm-2W5U;
	Thu, 13 Feb 2025 02:37:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiP5N-00000009WQK-2R96
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 02:36:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 683F6A40B5C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 02:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA4CC4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 02:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739414176;
	bh=0LZA3Dk55GU/mf3dBAZucD5FmCQnUrHzHQPxy4DxLvM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fU/py2/5/h+YyeBZn5j1I1ZBMYdx/6oLJF2ObEFygqJQh8iQMr+Vgg+BCDFwnOOgN
	 j2SkOOTAr2/83vJHgknyrHpTYCUO7U2iRh+kYgGI5MzV2A2S+YNaolIktx2tB4Fyga
	 RkGbAmvbgeZ81HcwDWfAC7TCmAcWIoNCysXxk19Td0tTEiOc81OOwQ+8uGeCBIq8UQ
	 cvBs0uEhvvhX2ZkL9rbmY4vk9nUvuPS+ApGZehNtEztmwfS5Mp2Kf+vsrO2MbsYV72
	 GYc8roUFK8po3YRKD2YfLDw0NOHPPzUiWUKL/a/aPBsJPvM3PKJ9fuPRvqxPhA5C5J
	 iUJNvJndHicmw==
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85521efa9b5so8318239f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 18:36:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZ4BfCVt9ALcg4PDmZi00SIeje7pJhnhJqvbOWC0RuHemDvE8ZFDTWoJdoKreqX8GjHIRcSMtw2KkMKPOzp22x@lists.infradead.org
X-Gm-Message-State: AOJu0YyD4kJQl6Lvc0gQygKTdEJKXrVDG4XgOin5FqStH/HKbD6dgb32
	cIIDdgMXQjZyAUOrUu0rjQRsMixhb/kVrIFFuQ/cwprLg5fWr6H6yp5FuNb6gq+ESJYr8L1NFSY
	tBEaRY/+1X1FBpzoQ+wHUq6TXkn8=
X-Google-Smtp-Source: AGHT+IGDj2J0OHevO8QEQS0jvMevG6UrVBK1iAId7Z2DfMKsGXl46gboSFwpFlNNcT0VV1oo2M+dSTTrNrkg2Qwl3Gc=
X-Received: by 2002:a05:6e02:2145:b0:3d0:235b:4810 with SMTP id
 e9e14a558f8ab-3d17bdfa664mr53584585ab.2.1739414175488; Wed, 12 Feb 2025
 18:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com> <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <20250212234946.yuskayyu4gx3ul7m@jpoimboe>
In-Reply-To: <20250212234946.yuskayyu4gx3ul7m@jpoimboe>
From: Song Liu <song@kernel.org>
Date: Wed, 12 Feb 2025 18:36:04 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
X-Gm-Features: AWEUYZndb8uVj1ZCPeY1y41WIbcZA7aFbamgt0wsHnDo-n41aP3_D4efD7B1YYo
Message-ID: <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Weinan Liu <wnliu@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org, 
	Puranjay Mohan <puranjay@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_183617_781437_EB97A65C 
X-CRM114-Status: GOOD (  13.35  )
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

On Wed, Feb 12, 2025 at 3:49=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Wed, Feb 12, 2025 at 03:32:40PM -0800, Song Liu wrote:
> > [   81.250437] ------------[ cut here ]------------
> > [   81.250818] refcount_t: saturated; leaking memory.
> > [   81.251201] WARNING: CPU: 0 PID: 95 at lib/refcount.c:22
> > refcount_warn_saturate+0x6c/0x140
> > [   81.251841] Modules linked in: livepatch_special_static(OEK)
> > [   81.252277] CPU: 0 UID: 0 PID: 95 Comm: bash Tainted: G
> > OE K    6.13.2-00321-g52d2813b4b07 #49
> > [   81.253003] Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE, [K]=3D=
LIVEPATCH
> > [   81.253503] Hardware name: linux,dummy-virt (DT)
> > [   81.253856] pstate: 634000c5 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BT=
YPE=3D--)
> > [   81.254383] pc : refcount_warn_saturate+0x6c/0x140
> > [   81.254748] lr : refcount_warn_saturate+0x6c/0x140
> > [   81.255114] sp : ffff800085a6fc00
> > [   81.255371] x29: ffff800085a6fc00 x28: 0000000001200000 x27: ffff000=
0c2966180
> > [   81.255918] x26: 0000000000000000 x25: ffff8000829c0000 x24: ffff000=
0c2e9b608
> > [   81.256462] x23: ffff800083351000 x22: ffff0000c2e9af80 x21: ffff000=
0c062e140
> > [   81.257006] x20: ffff0000c1c10c00 x19: ffff800085a6fd80 x18: fffffff=
fffffffff
> > [   81.257544] x17: 0000000000000001 x16: ffffffffffffffff x15: 0000000=
000000006
> > [   81.258083] x14: 0000000000000000 x13: 2e79726f6d656d20 x12: 676e696=
b61656c20
> > [   81.258625] x11: ffff8000829f7d70 x10: 0000000000000147 x9 : ffff800=
0801546b4
> > [   81.259165] x8 : 00000000fffeffff x7 : 00000000ffff0000 x6 : ffff800=
082f77d70
> > [   81.259709] x5 : 80000000ffff0000 x4 : 0000000000000000 x3 : 0000000=
000000001
> > [   81.260257] x2 : ffff8000829f7a88 x1 : ffff8000829f7a88 x0 : 0000000=
000000026
> > [   81.260824] Call trace:
> > [   81.261015]  refcount_warn_saturate+0x6c/0x140 (P)
> > [   81.261387]  __refcount_add.constprop.0+0x60/0x70
> > [   81.261748]  copy_process+0xfdc/0xfd58 [livepatch_special_static]
>
> Does that copy_process+0xfdc/0xfd58 resolve to this line in
> copy_process()?
>
>                         refcount_inc(&current->signal->sigcnt);
>
> Maybe the klp rela reference to 'current' is bogus, or resolving to the
> wrong address somehow?

It resolves the following line.

p->signal->tty =3D tty_kref_get(current->signal->tty);

I am not quite sure how 'current' should be resolved.

The size of copy_process (0xfd58) is wrong. It is only about
5.5kB in size. Also, the copy_process function in the .ko file
looks very broken. I will try a few more things.

Thanks,
Song

