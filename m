Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F071810F2848
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owpdxFF3v/KlPV1csbkJ90RTaf+LQvkCMaflebyBvGw=; b=4MP8xQGO5AbJBR1xw20EXxG/n6
	/hmEEnI/tEs1N73JWCK9K41Qt5FYP7jxN5uq0lX5YPw1Tq8uqA/OU0smDD4Ov7RvJ1tnLQBx0B5j+
	nZ1pXPPlyoTuFeJu9rZ1UQru5SMuiUNO4PAZ6nZUAkM4B8TyimZ5T0QdtzmFjQO3V3OxDrYD06VEn
	tL/uy5xbbidqSt7Ig/eTa9o3yYFAX2zk0NrVe72K1WaGqu/7dDyd7KO44gcaHhqaumh/KzJQ7SAZ1
	op9/ApdPbVtg3+Wz+DdXuDx3D2LTQ8H16GRVqgqQHJzGLtCRNl0NOyKVLoyvY1Q9u3RT5Dof4zhQ6
	2AaS7UPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69OH-00000007iQZ-3yER;
	Fri, 27 Mar 2026 15:46:29 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69OF-00000007iQ1-3i9H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 15:46:29 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-5091ed02c54so498591cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 08:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774626385; cv=none;
        d=google.com; s=arc-20240605;
        b=Z4eLXv0dkTvucIJlWgkSCgvUUOHy8WARtteUnyOLW6++FW52sr7KiBF250h0xVMstW
         rPP0UZSUNxNHFct6bGlkBdg5fWaMR8p3xporb5PNEyzrk8qn2bZElUMl3r+pceh0Qq2x
         br/AiwsTdH4hyQ3ECPym7Jf9Fu2QYHTGTUmVVGCH5PkQQNh4picB/KvZg3jx+IzwC9gl
         YuA5qhzDyUqAVYSb2sPjkg92CDVoFAGIgipacF/29+MyY8Vvr6hpargDeDmJhvNLumrV
         DEYIILz+jdBxFkH+SDwS+y5r7C8nNHavwXnOwS10MGPNECgsxxz30w9/ia6SR+8+D3M4
         KgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=owpdxFF3v/KlPV1csbkJ90RTaf+LQvkCMaflebyBvGw=;
        fh=JeDXBbFAg5+9NM+JZLc5JNrG335Ho8xtRW1zZTQ0PGA=;
        b=i/0zm4jDRSFFJXPcpPJxSJOwTF+hfH+zZFERI2NG0x5r2oIaSGZHkkgWjuBSobraHU
         9TXGkSGdvmNndQEvm4lEHRCJusgAI/IW12t20+pkeqzU9il4W3B9Eoyb2NwjAqAgQGNU
         GCvT0IjocrITKrMUY0S8bum58sHy5NaZm1SwqMOZPFZldpPUxnQilncs72ikQ0q90kSU
         QH+TtyQvszCNJsimk5xEGf1xIAtlzZMrTGq1pMgPExWWirokWm+kvp12g98QItnfMfOc
         xtZ4kxQP2IGeQ33GIaPyj+oPqBY6TmZbTh8ImfqPZ+3TVOtSKackwIsjlL3Ov7JEGTTn
         RyRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774626385; x=1775231185; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owpdxFF3v/KlPV1csbkJ90RTaf+LQvkCMaflebyBvGw=;
        b=aUVIxFSfadeWkT4q/Oz6zc+gz4CchtXQoscoa0HS3vsn6WoIrRoZIIt26vXkVltVAl
         zlVImPUUIxWks22o+uvo/2vVCZ+xcq+w1O3MEsQnrcmCBzfUD6C94n8IkU+Q0r68pgj9
         gD5CkIkOmG/A2jDrpNDiWGQoO4CpyX1KZQ9fsUX8aAB/OlcDQYlnKSDa8KuDM7M07gLT
         DiCne5YoUa93HorrJ7rtw+LKt8r7/9y4avJrHsqCvDBKyMZl1xIsay9rbgwLgPOhPms2
         Dy4zU+Ivc6cPOcZ+jzFKFyQozPRsZ7jb1LY5U+RWu1bT7O3kphLuGYYXbRA5Dn9JBMdH
         pVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774626385; x=1775231185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=owpdxFF3v/KlPV1csbkJ90RTaf+LQvkCMaflebyBvGw=;
        b=GOwPynpVHIy1xoAgxXhmo6wqmeQfMo3c+Qr9tkoj2gSwIPQTVcxpO6akZWBMlilbIL
         409ayhaYxEZfPb1DoMEU5Cy8X9bldt8+t5Qa+AeuxgftZ0YqwYz9fC3Wx4Z/w9Af4GXu
         e4MSY6Ym6LyVDi0naA2vaJjFm3iqVji9Z1uRJnFWfJ4xIKef0VxDVTlkpzI2cyptzooX
         CeJD7K/+kez7WtXzeSejogfRiMos0ZGipLMb9JQNCYcvJAQs0eSha8Bo3u8ECcPyfRVH
         hie8LawokrmOC96rd/3cHmvHYAS8PvJgJO5rNNkS43rFZORwqe7Dm52Qdx+0nBBwj37Y
         7KFg==
X-Forwarded-Encrypted: i=1; AJvYcCWWiIMrWPKxpWwVNTFCH2wrM4we35+5rfw+s5PJN7yrWKdZMIEtISM/KvqhGi3ejPxaiEjtERxwuwpCLurv5o2N@lists.infradead.org
X-Gm-Message-State: AOJu0YyPIMwoKCPYDpBNU+6/kqHG6u0XgieU3u39j2yLKZ7Ep6zM5MSP
	CTJm5lK27htjYfF47mVwe3dzFBERazPlhtbryMeIfEI8z7gQcPD4sldCNzd/OKPwO9fQPdTBXD2
	l0mFJ4Q+fS1ixXJNlBzIiVBdOmMWOk+fCwZXAg/7y
X-Gm-Gg: ATEYQzyw7vsKjjr41xJyVtzNIHWuypVLE82A5XLtdk5xaf7h27HghTxuoMZ7MU0+xgf
	sBlpaH+XD3VvMx8XU7Jsn7qYGpGSS9t3HfyPlHRDOCRiGKKhYmy/ltwOPsrAFkm01b5VL31K+dK
	Zcax9IU0QF9CBA3NGspmdRPZOGzsAF5MOnI+DtJv9q9pYfU945pN5CtmavS/Xbd8e5KmrOKqZ2e
	csE7PBUsn/3BzXmpWzYhDwN7ZwqhDa4u84ugs0o7USJcsSoAFffB2pbUjl3X91HERz6+RIgrgS3
	bUpdNkc=
X-Received: by 2002:a05:622a:4c86:b0:509:72a:ae59 with SMTP id
 d75a77b69052e-50ba1cbeb9amr15605551cf.10.1774626384838; Fri, 27 Mar 2026
 08:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260323175340.3361311-1-avagin@google.com> <20260323175340.3361311-2-avagin@google.com>
 <acGEonF9I6sPA42B@J2N7QTR9R3.cambridge.arm.com> <acJnOB-rlyt-3jU4@willie-the-truck>
 <CAEWA0a7iR8YHooqXJfhersV6YhAXGMZDUhib3QQH5XGn=KNowA@mail.gmail.com>
In-Reply-To: <CAEWA0a7iR8YHooqXJfhersV6YhAXGMZDUhib3QQH5XGn=KNowA@mail.gmail.com>
From: Andrei Vagin <avagin@google.com>
Date: Fri, 27 Mar 2026 08:46:13 -0700
X-Gm-Features: AQROBzCbFCKKF5EGKvRVWmaQmxOKGk-clLCYQmcai8kbKMF-pnr8L4F1E1mL0vY
Message-ID: <CAEWA0a629qGEHvHpczGrZ+UBnzO75KgLsU7RoeR0cekmvaxLQQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] exec: inherit HWCAPs from the parent process
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Cyrill Gorcunov <gorcunov@gmail.com>, 
	Mike Rapoport <rppt@kernel.org>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, criu@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Chen Ridong <chenridong@huawei.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Eric Biederman <ebiederm@xmission.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Michal Koutny <mkoutny@suse.com>, 
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084627_962821_3CEDA140 
X-CRM114-Status: GOOD (  46.96  )
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

On Tue, Mar 24, 2026 at 3:19=E2=80=AFPM Andrei Vagin <avagin@google.com> wr=
ote:
>
> Hi Mark and Will,
>
> Thanks for the feedback. Please read the inline comments.

Mark, Will, just checking in to see if my explanation makes sense to you.
Let me know if you have any further feedback or questions.

Thanks,
Andrei

>
> On Tue, Mar 24, 2026 at 3:28=E2=80=AFAM Will Deacon <will@kernel.org> wro=
te:
> >
> > On Mon, Mar 23, 2026 at 06:21:22PM +0000, Mark Rutland wrote:
> > > On Mon, Mar 23, 2026 at 05:53:37PM +0000, Andrei Vagin wrote:
> > > > Introduces a mechanism to inherit hardware capabilities (AT_HWCAP,
> > > > AT_HWCAP2, etc.) from a parent process when they have been modified=
 via
> > > > prctl.
> > > >
> > > > To support C/R operations (snapshots, live migration) in heterogene=
ous
> > > > clusters, we must ensure that processes utilize CPU features availa=
ble
> > > > on all potential target nodes. To solve this, we need to advertise =
a
> > > > common feature set across the cluster.
> > > >
> > > > This patch adds a new mm flag MMF_USER_HWCAP, which is set when the
> > > > auxiliary vector is modified via prctl(PR_SET_MM, PR_SET_MM_AUXV). =
 When
> > > > execve() is called, if the current process has MMF_USER_HWCAP set, =
the
> > > > HWCAP values are extracted from the current auxiliary vector and st=
ored
> > > > in the linux_binprm structure. These values are then used to popula=
te
> > > > the auxiliary vector of the new process, effectively inheriting the
> > > > hardware capabilities.
> > > >
> > > > The inherited HWCAPs are masked with the hardware capabilities supp=
orted
> > > > by the current kernel to ensure that we don't report more features =
than
> > > > actually supported. This is important to avoid unexpected behavior,
> > > > especially for processes with additional privileges.
> > >
> > > At a high level, I don't think that's going to be sufficient:
> > >
> > > * On an architecture with other userspace accessible feature
> > >   identification mechanism registers (e.g. ID registers), userspace
> > >   might read those. So you might need to hide stuff there too, and
> > >   that's going to require architecture-specific interfaces to manage.
> > >
> > >   It's possible that some code checks HWCAPs and others check ID
> > >   registers, and mismatch between the two could be problematic.
> > >
> > > * If the HWCAPs can be inherited by a more privileged task, then a
> > >   malicious user could use this to hide security features (e.g. shado=
w
> > >   stack or pointer authentication on arm64), and make it easier to
> > >   attack that task. While not a direct attack, it would undermine tho=
se
> > >   features.
>
> I agree with Mark that only a privileged process have to be able to mask
> certain hardware features. Currently, PR_SET_MM_AUXV is guarded by
> CAP_SYS_RESOURCE, but PR_SET_MM_MAP allows changing the auxiliary vector
> without specific capabilities. This is definitely the issue. To address
> this, I think we can consider to introduce a new prctl command to enable
> HWCAP inheritance explicitly.
>
> >
> > Yeah, this looks like a non-starter to me on arm64. Even if it was
> > extended to apply the same treatment to the idregs, many of the hwcap
> > features can't actually be disabled by the kernel and so you still run
> > the risk of a task that probes for the presence of a feature using
> > something like a SIGILL handler or, perhaps more likely, assumes that
> > the presence of one hwcap implies the presence of another. And then
> > there are the applications that just base everything off the MIDR...
>
> The goal of this mechanism is not to provide strict architectural
> enforcement or to trap the use of hardware features; rather, it is to
> provide a consistent discovery interface for applications. I chose the
> HWCAP vector because it mirrors the existing behavior of running an
> older kernel on newer hardware: while ID registers might report a
> feature as physically present, the HWCAPs will omit it if the kernel
> lacks support. Applications are generally expected to treat HWCAPs as
> the source of truth for which features are safe to use, even if the
> underlying hardware is technically capable of more.
>
> Another significant advantage of using HWCAPs is that many
> applications already rely on them for feature detection. This interface
> allows these applications to work correctly "out-of-the-box" in a
> migrated environment without requiring any userspace modifications.  I
> understand that some apps may use other detection methods; however, there
> it no gurantee that these applications will work correctly after
> migration to another machine.
>
> >
> > There's also kvm, which provides a roundabout way to query some feature=
s
> > of the underlying hardware.
> >
> > You're probably better off using/extending the idreg overrides we have
> > in arch/arm64/kernel/pi/idreg-override.c so that you can make your
> > cluster of heterogeneous machines look alike.
>
> IIRC, idreg-override/cpuid-masking usually works for an entire machine.
> We actually need to have a mechanism that will work on a per-container
> basis. Workloads inside one cluster can have different
> migration/snapshot requirements. Some are pinned to a specific node,
> others are never migrated, while others need to be migratable across a
> cluster or even between clusters. We need a mechanism that can be
> tunable on a per-container/per-process basis.
>
> >
> > On the other hand, if munging the hwcaps happens to be sufficient for
> > this particular use-case, can't it be handled entirely in userspace (e.=
g.
> > by hacking libc?)
>
> CRIU often handles workloads with a mix of runtimes: some linked against
> glibc, some against musl, and others like Go that bypass libc entirely.
> CRIU is mostly used to handle containers that can run multiple processes
> possible based on different runtimes. It means available cpu features
> should not be only specified for one runtime, they have to be passed
> across different runtimes. I think the pure userspace solution is near
> infeasible in this case.
>
> Thanks,
> Andrei

