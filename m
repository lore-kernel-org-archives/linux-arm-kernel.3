Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D9F10F287C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 00:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9bPtEBHXKpRO9CjXfaCqUQKt7R+Gz6rl79/OVT+YNo=; b=fIABta4hpFroU1fDkZUZ0omHck
	33xTgQr62MPjCOdGlx4o4FrMfksPPJDX+IONHfOUNNsACmqOahO5VJLg4JXyynVjhZIucL0xu2y8d
	kKLN1/yzJg3ZSmhIzFEvBMCD7ChpZDMRG3q6cQUKOfQ9/KYVcDwCZ989DTIhCjtnNoCUUni7kZTS3
	6iBBxHg11VGmrYIQrRu8id5N7+xctXP0iX3CUiV2Yju6NjIZ3N92FhR0GOvC337ncEyds+w2lfY+Y
	7IDL9HSgWXSTF1CDZmya1sBeXcPhZxilr65B51DPqUWYwJPlAwt6HtBJTKgcnPqUrdsXxQivBRxFg
	adfH6sgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6HQs-00000008N08-0qNv;
	Sat, 28 Mar 2026 00:21:42 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6HQp-00000008Mzn-2eBo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 00:21:41 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50b6c45781aso239211cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 17:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774657298; cv=none;
        d=google.com; s=arc-20240605;
        b=EewyHeq4LAboH0Ldi+V0b5gML413RSvQBmdWdLKl466p/TSwXH4nj6DAP8sG5SZXBY
         PmYL+bZRfzt9kq2y92UfNIYZp52ZGti6lY4yKvJKzLdrGN4544kLoJhMCBkFvFwJlgDQ
         JepkCYtkWReJEi1nQUb3b4hzzuhHpzuvjkfTQO+mTnPl6jqb8152HOPVksojBxbZVVjU
         fgQLBt2wxxg9Ros7nUFFuSxkRDH1tH8RnLNY+fWSbxD1TmcexzrMMXkw2l6SCMz5NZAa
         azQXZIuNm9Hzm5eePWRI6jTkojM+tQL7BAAyUqcNolKwsOHvzm1H6AlpTre7M6MKj6Sv
         Bbqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K9bPtEBHXKpRO9CjXfaCqUQKt7R+Gz6rl79/OVT+YNo=;
        fh=tkTRAi8LW+QdPSJte02pbWMYJ9uhuibc8SPC1l+OPGU=;
        b=K0honfjzasZFvNAsl920niNIWuYaI4tzsFjwT6whDCNi/j5BQ4fH6b5erwsisMjkLu
         a6KCj/5S4TwbIQLtLCiw8h2tpgAYeQRCywin//8nBFzGW+pjVrv7ZalobB37Mr4LQPpi
         JNloGpHDZofDrzlxv16GePgl4TJhdsy51KwVC4npbPYYpNRvutcCvWLdU6bpZ+D6I7Tq
         agsm4DqB0v1g/Rc7B2Cz+nbTtotu5cZLi3H47J9kmboJBwEtxRpJrdXICeTDmr/8QeeQ
         ZDPXbb2kmmhJ6nG7D2cJ3zPyOs5HI8bH9Z7n8kD+pIsKE73Zs1/X3oTt3KF3pGDz1cpl
         8bgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774657298; x=1775262098; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9bPtEBHXKpRO9CjXfaCqUQKt7R+Gz6rl79/OVT+YNo=;
        b=jzJJ2MqCB9TqaQRV1XT8N6ka5KhlzaI/gR6did8DsmcZlbuyF8Y+p6gjUEjJj/arIP
         +9+4GBAGBgf15ApS1BjSyKDEFr6C2MeAXttk52xovj0G6MzckX81Z7l7ktNsXcgHBdBh
         jCPFvI17m90HAiT3zFZZ5kYARrhuATYRjgWSfq2Nm1oM6Uo8yyghOEWFBMgeuovw7StX
         fgz4kjj0zMEE7zuPu3hboiHnq+pNUcatMEcASiXkC9e3TYRXnMbcM4jmLH86ZOjAy6iB
         I/3/i2mgt3o6lUTZLoN6Mw5k7EpzWqlq/HOEMrZiHBbtxzA0GaZKZC17Q1CJVOMhDeAI
         BZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774657298; x=1775262098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K9bPtEBHXKpRO9CjXfaCqUQKt7R+Gz6rl79/OVT+YNo=;
        b=Ce7fW7KIP8Gb6drkoGazdQ5IcU8OoER5YjIfF/cE4k0M82CJCJMOV1l9AX2iBh/VOX
         8gJOLybv+MgE9eyB332p7I36oGJCKQmFJWV11lgJSbzbnRQ6zjrIwpdz01b5MMiGpm5T
         CzehpS64J42SXPdxyROdavBiygVn9LwwGTCzPtKxQWKwHK3GeExFguxfGza21o14fsZM
         Z4nYRwQ41tYpY+ZP+3PtFqrvUnPyced021YXDuSbstcMRSp3rs1EPxCejl79VMOWaF4l
         WprVj263ilWLIsnJGu0bt3tNP9u+7c9guSqIs0WlgzTzVhHzce/Sam7YEq7biKbqyNEx
         qN5A==
X-Forwarded-Encrypted: i=1; AJvYcCXeLoaEHhj2rmeSRENWemTvQAxc9MXkw5g4ly2aGwhceQkegRVVxro3AFZklxeEBCam94STk2ND9utOzr1NgawU@lists.infradead.org
X-Gm-Message-State: AOJu0YwjRFLYMJuRAGjanm6hpiXR+EFaanxODiKx8iNO5OQiuynIhkhT
	EHCnWzbC0B9XoyW2rIOreZcR3J5oX5Pq4FfvO+2rwaF0AcLPUD8A7/W1l8CjRuDp4XdDs93VL90
	0xGPGsL+jO0t3oDif63d/lMOTpD9BPSqRf2OJOLcS
X-Gm-Gg: ATEYQzwlw8qcz+qvnw9dTw807p+aO7jZomJsbYLPnKsfac0BrZAIC191hxYTSifxoJ3
	bUZI/p7rmQpDD17X5FQia1/tUdph10DmT7kNZ49JaBE0dDvURtd3sUFieNLLXt+BcVnYBLtJBAu
	1Q2i73yKzPX2oEXW/YRptbGlgufNYco5a3sTDImRNbZPs4S4OuYkVt141olw+MTLMpCTrp8p43E
	0zGdsUly99oqdrL2rqrbNE0p/AwMHuT32h30GCfKCNIxAY6PgGaiLetkeuqSDTEkJIewO9wAQNG
	R+RjM+2li1kNyPc4mg==
X-Received: by 2002:a05:622a:4c8e:b0:509:14f0:bff2 with SMTP id
 d75a77b69052e-50bb27f62edmr6416861cf.12.1774657297623; Fri, 27 Mar 2026
 17:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260323175340.3361311-1-avagin@google.com> <20260323175340.3361311-2-avagin@google.com>
 <acGEonF9I6sPA42B@J2N7QTR9R3.cambridge.arm.com> <acJnOB-rlyt-3jU4@willie-the-truck>
 <CAEWA0a7iR8YHooqXJfhersV6YhAXGMZDUhib3QQH5XGn=KNowA@mail.gmail.com> <acarA3sGKY4Acozw@J2N7QTR9R3.cambridge.arm.com>
In-Reply-To: <acarA3sGKY4Acozw@J2N7QTR9R3.cambridge.arm.com>
From: Andrei Vagin <avagin@google.com>
Date: Fri, 27 Mar 2026 17:21:26 -0700
X-Gm-Features: AQROBzAZx6vusK91xtphbHO0OyQ8WklBK8fprRQAhCkwYE-GzsBGKaet5s4vnp4
Message-ID: <CAEWA0a7AZiuy1F+0LDxtEtJpdu=zA-RKhPb1wcDMpy2tSMFO5g@mail.gmail.com>
Subject: Re: [PATCH 1/4] exec: inherit HWCAPs from the parent process
To: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Cyrill Gorcunov <gorcunov@gmail.com>, Mike Rapoport <rppt@kernel.org>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, criu@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Chen Ridong <chenridong@huawei.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Eric Biederman <ebiederm@xmission.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Michal Koutny <mkoutny@suse.com>, 
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>, 
	Linux API <linux-api@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_172139_704063_3D2D6E0D 
X-CRM114-Status: GOOD (  66.90  )
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

On Fri, Mar 27, 2026 at 9:06=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Tue, Mar 24, 2026 at 03:19:49PM -0700, Andrei Vagin wrote:
> > Hi Mark and Will,
> >
> > Thanks for the feedback. Please read the inline comments.
> >
> > On Tue, Mar 24, 2026 at 3:28=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Mon, Mar 23, 2026 at 06:21:22PM +0000, Mark Rutland wrote:
> > > > On Mon, Mar 23, 2026 at 05:53:37PM +0000, Andrei Vagin wrote:
> > > > > Introduces a mechanism to inherit hardware capabilities (AT_HWCAP=
,
> > > > > AT_HWCAP2, etc.) from a parent process when they have been modifi=
ed via
> > > > > prctl.
> > > > >
> > > > > To support C/R operations (snapshots, live migration) in heteroge=
neous
> > > > > clusters, we must ensure that processes utilize CPU features avai=
lable
> > > > > on all potential target nodes. To solve this, we need to advertis=
e a
> > > > > common feature set across the cluster.
> > > > >
> > > > > This patch adds a new mm flag MMF_USER_HWCAP, which is set when t=
he
> > > > > auxiliary vector is modified via prctl(PR_SET_MM, PR_SET_MM_AUXV)=
.  When
> > > > > execve() is called, if the current process has MMF_USER_HWCAP set=
, the
> > > > > HWCAP values are extracted from the current auxiliary vector and =
stored
> > > > > in the linux_binprm structure. These values are then used to popu=
late
> > > > > the auxiliary vector of the new process, effectively inheriting t=
he
> > > > > hardware capabilities.
> > > > >
> > > > > The inherited HWCAPs are masked with the hardware capabilities su=
pported
> > > > > by the current kernel to ensure that we don't report more feature=
s than
> > > > > actually supported. This is important to avoid unexpected behavio=
r,
> > > > > especially for processes with additional privileges.
> > > >
> > > > At a high level, I don't think that's going to be sufficient:
> > > >
> > > > * On an architecture with other userspace accessible feature
> > > >   identification mechanism registers (e.g. ID registers), userspace
> > > >   might read those. So you might need to hide stuff there too, and
> > > >   that's going to require architecture-specific interfaces to manag=
e.
> > > >
> > > >   It's possible that some code checks HWCAPs and others check ID
> > > >   registers, and mismatch between the two could be problematic.
> > > >
> > > > * If the HWCAPs can be inherited by a more privileged task, then a
> > > >   malicious user could use this to hide security features (e.g. sha=
dow
> > > >   stack or pointer authentication on arm64), and make it easier to
> > > >   attack that task. While not a direct attack, it would undermine t=
hose
> > > >   features.
> >
> > I agree with Mark that only a privileged process have to be able to mas=
k
> > certain hardware features. Currently, PR_SET_MM_AUXV is guarded by
> > CAP_SYS_RESOURCE, but PR_SET_MM_MAP allows changing the auxiliary vecto=
r
> > without specific capabilities. This is definitely the issue. To address
> > this, I think we can consider to introduce a new prctl command to enabl=
e
> > HWCAP inheritance explicitly.
> >
> > > Yeah, this looks like a non-starter to me on arm64. Even if it was
> > > extended to apply the same treatment to the idregs, many of the hwcap
> > > features can't actually be disabled by the kernel and so you still ru=
n
> > > the risk of a task that probes for the presence of a feature using
> > > something like a SIGILL handler or, perhaps more likely, assumes that
> > > the presence of one hwcap implies the presence of another. And then
> > > there are the applications that just base everything off the MIDR...
> >
> > The goal of this mechanism is not to provide strict architectural
> > enforcement or to trap the use of hardware features; rather, it is to
> > provide a consistent discovery interface for applications. I chose the
> > HWCAP vector because it mirrors the existing behavior of running an
> > older kernel on newer hardware: while ID registers might report a
> > feature as physically present, the HWCAPs will omit it if the kernel
> > lacks support.
>
> On arm64, the view of the ID registers that userspace gets *only*
> exposes features that the kernel knows about, as userspace reads of
> those registers are trapped+emulated by the kernel. On arm64 it's
> not true to say that something appears in those but not the HWCAPs.
>
> I understand that might be different on other architectures, and so
> maybe this approach is sufficient on other architectures, but it is not
> sufficient on arm64.
>
> > Applications are generally expected to treat HWCAPs as
> > the source of truth for which features are safe to use, even if the
> > underlying hardware is technically capable of more.
>
> I'm fairly certain that there are arm64 applications (and libraries)
> which check only the ID register values, and not the HWCAPs.
>
> Architecturally, there are features which are detected via other
> mechanisms (e.g. CHKFEAT), for which HWCAPs are also irrelevant. Even if
> that happens to be ok today, there are almost certainly future uses that
> will not be compatible with the scheme you propose.
>
> I don't think we can say "applications must check the HWCAPs", when we
> know that applications and libraries legitimately don't always do that.
>
> > Another significant advantage of using HWCAPs is that many
> > applications already rely on them for feature detection. This interface
> > allows these applications to work correctly "out-of-the-box" in a
> > migrated environment without requiring any userspace modifications.  I
> > understand that some apps may use other detection methods; however, the=
re
> > it no gurantee that these applications will work correctly after
> > migration to another machine.
>
> I think the existince of applications that detect features by other
> (legitimate!) means implies that there's no guarantee that this feature
> is useful and will remain useful going forwards.
>
> For example, what do you plan to do if an application or library starts
> doing something legitimate that causes it to become incompatible with
> this scheme?
>
> I don't want to be in a position where userspace is asked to steer clear
> of legitimate mechanisms, or where architecture code suddently has to
> pick up a lot of complexity to make this work.
>
> > > There's also kvm, which provides a roundabout way to query some featu=
res
> > > of the underlying hardware.
> > >
> > > You're probably better off using/extending the idreg overrides we hav=
e
> > > in arch/arm64/kernel/pi/idreg-override.c so that you can make your
> > > cluster of heterogeneous machines look alike.
> >
> > IIRC, idreg-override/cpuid-masking usually works for an entire machine.
> > We actually need to have a mechanism that will work on a per-container
> > basis. Workloads inside one cluster can have different
> > migration/snapshot requirements. Some are pinned to a specific node,
> > others are never migrated, while others need to be migratable across a
> > cluster or even between clusters. We need a mechanism that can be
> > tunable on a per-container/per-process basis.
>
> I think that's theoretically possible, BUT it will require substantially
> more complexity, to address the issues that Will and I have mentioned. I
> don't think people are very happy to pick up that complexity.
>
> There are many other aspects that are going to be problematic for
> heterogeneous migration. Even if you hide the HWCAP for a stateful
> feature (e.g. SME), it might appear in one machine's signal frames (and
> be mandatory there), but might not appear in anothers, and so migration
> might not work either way. Likewise, that state can appear via ptrace.

Hi Mark,

I understand all these points and they are valid. However, as I
mentioned, we are not trying to introduce a mechanism that will strictly
enforce feature sets for every container. While we would like to have
that functionality, as you and will mentioned, it would require
substantially more complexity to address, and maintainers would unlikely
to pick up that complexity. Even masking ID registers on a per-container
basis would introduce extra complexity that could make architecture
maintainers unhappy. There were a few attempts to introduce container
CPUID masking on x86_64 in the past.

In CRIU, we are not aiming to handle every possible workload. Our goal
is to target workloads where developers are ready to cooperate and
willing to make adjustments to be C/R compatible. The goal here is to
provide developers with clear instructions on what they can do to ensure
their applications are C/R compatible. When I say "workloads", I mean
this in a broad sense. A container might pack a set of tools with
different runtimes (Go, Java, libc-based). All these runtimes should
detect only allowed features.

Returning to the subject of this patchset: this series extends the role
of hwcaps. With this change, we would establish that hwcaps is the
"source of truth" for which features an application can safely use. Any
other features available on the current CPU would not be guaranteed to
remain available after migration to another machine.

After this discussion, I found that the current version missed one major
thing: there should be a signal indicating that hwcaps must be used for
feature detection. Since we will need to integrate this interface into
libc, Go, and other runtimes, they definitely should not rely just on
hwcaps by default, especially in the early stages. This can be solved
via the prctl command.  Libraries like libc would call
prctl(PR_USER_HWCAP_ENABLED). If this returns true, the runtime knows
that only the features explicitly listed in hwcaps should be used.

You are right, the controlled feature set will be limited to features
the kernel knows about. And yes, we would need to report CPU features in
hwcaps even if the kernel isn't directly involved in handling them.
Honestly, I am not certain if this is the "right" interface for that,
and I would be happy to consider other ideas. I understand that these
hwcaps will not work right out of the box, but we need a way to solve
this problem. Having a centralized API for CPU/kernel feature detection
seems like the right direction.

As for signal frame size and extended states like SVE/SME, we aware
about this problem.  However, it is partly mitigated by the fact that if
an application does not use some features, those states are not placed
in the signal frame. In the future, when we construct/reload a signal
frame, we could look at a process feature set for a process and generate
a frame according to those features...

Thanks,
Andrei

