Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD2FFEC11C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 22:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iA0qEOtZ8sY0A4PQMCyKkXrxyPKJc9xjSndOAsg0m2c=; b=cWDqd+D5XOZKzdGVm8om9Bvzd2
	vmBXLzU7KbnZPb+VvHBJx8VdkFjsppIcdNlnRPOgF8w8jv8lpKwBkb4H+SZQdD0LxUD69OBgqVNaK
	f5rEqMeI9Ycri1WTiFTmpWnWpkvYM2cFfb5uk+pg+VrWRI0ESPL7EYy9Eu9PucgtnYYc+bbLtEpQX
	GotAoWK9h2X1D8ndnTKIXLc370CMYwwkmrkom/6z1gSklb0vTAMOkDxGOhVmdD8VdKyaq0Xad71Ji
	ubAymJ3KP8gflQZuI6Hq/NRtNL7fEj7olqQFUhOpXkL/5MxumIlhs6OKVjDa7XNyynMot1DQUW/g8
	DuubDN1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5A6X-00000002J3U-1PbX;
	Tue, 24 Mar 2026 22:20:05 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5A6V-00000002J39-2G6H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 22:20:04 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-509062d829dso105001cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 15:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774390801; cv=none;
        d=google.com; s=arc-20240605;
        b=cvfSA7/MMc+wNuebCueXG/XIKs9P32m49tU9K5ITpb3nII5KIY/cnRpwGkevh11Z6S
         lC3Dq+9WLUGgC/EFUa6KuC96VdQ4w5Obub7HnwxS7+kqkUAYNbG0LeUJkMV1cfY++878
         5IjZHXRnRTCmmYKO3+9BgnHoufY5qqSz2umsgRn3R5E5Yci14m5SSK479e+ft7XBN2qH
         ZaBRldqaJA/zuKTOBNVsK5Ifr6ZXrMJ9p8W2PdDN47x7DXghrp4582JS2xxtSZOK+iJU
         77jUivKm8iauhvBmt9k8ypm68sdMMPf0iAFMizKOa8zw5HwIWyE5/5YDfsNIywsEerno
         eOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iA0qEOtZ8sY0A4PQMCyKkXrxyPKJc9xjSndOAsg0m2c=;
        fh=6FTs/k3RC2wtVnuqBocwZvRtTsG+vklDu4C7BheRV8E=;
        b=BlcXZdNu+X7tBr29TsuCpTrh7u93StCvjknqWC/Iudxf4ESXEGNFLEKBaQE+UtnWhn
         Rp3S5S3vFbC4Q5Tw6oU/DHmd4Jgwr9E0ZcNGl5pn0ShAObDavx8oeDuOg4Xg0QkDeG8z
         YVTP3RMXvmljJQNL6PhQ38Uv+AIYJ93XW4VTS/FAJIEE60zKWiCkKSephuD+v20do87E
         SPAQAOdIvM6A61kFdZG4E05W4HF/uGiYWinN0ZEaM4UbTg0l5yODrC4fvEWieob+ppX8
         XnVntuJ0BQWO6QAJGcIkn7Qp3EgDvCFDOJk79sTE/YiS6HHgKelQXNoMqzWQGcNVFCUr
         v1Zw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774390801; x=1774995601; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iA0qEOtZ8sY0A4PQMCyKkXrxyPKJc9xjSndOAsg0m2c=;
        b=fjlTlV9A71U4Qxru4f8mzGK3XaULtxyn2sBUgfddSLW7PH+HeR4YvUqdlzfaf5bw3X
         tYG4JRASGle6J/2YyGDTYMeqzoJcJz298yTwcdfpxVaVq4hw/O4v24ScMZe6J3hPh039
         XVUIjxHnk6X4zPuwFBPu08SEvVRWMJA89bqL2OhY+mM+pr4cZpbKcsJwGWWu4ofqz5as
         ZxTeDxHpzpR67SPQi+E2IHlyea1l4M2nKkBBGDggImIe/RP45ceuI/D10wD0LHLThKZw
         0Ts91O+v++qFqEd3MiuKz0zP9ybG7aXvPeAflhIUpFSRwVCnyUxItQaZR0w/7Xcuem+V
         uidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774390801; x=1774995601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iA0qEOtZ8sY0A4PQMCyKkXrxyPKJc9xjSndOAsg0m2c=;
        b=spDFInOy5PscflMfX47XFVUpimIMbwYXjrbGYyEMiGdsJEx8Mf1VHkhMbZHo5nenNs
         WJQU2uK6PPSVOXX7+jAI8vwv+qbCSa/tFyXG+dvohOIChftWgLww12jRjph7MqBaTsKw
         WoLMTkbnORtauHPaG9O6i/t4p606yYP7WccRxty4GnVB883H92tl88mKO4CInhU7REbR
         BlhpdpmZLSAHtFu4E+ZnqeXN9aBYbr7VjFbTWpBPxtpNptxBN4pp49zf+mORXJtZOtDt
         XC3+YRoTN0vG4Rp5tzVHoxDRVmD2gSXfPIJ25vOlbdWTaXoOZlITt9bqd/vKYSF2KGsh
         fI2w==
X-Forwarded-Encrypted: i=1; AJvYcCVmpDQAk3FobJDIB2s9/68O/543zUItz7a51Ifg5MA1OvZk4kQWLZ8ehtSqYMIn25pXqY0SzKQh1drSq2vbgrj8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0sIsGfd/gJEHu6Ot9gnuYz0MbT4CS7TxsKtdo9IvJsPJKVSCb
	CPde2FcERvJycG+cDBOX75WcRqYNwycfC2Qovioo51rTjLg+s26dgl8icobfsTJrr/kR9mzh5Qs
	D8lYCjX2/MuuDzONJjwIWV9cnxz8OW0/1ZdfuFOlK
X-Gm-Gg: ATEYQzx16OcfDD2M9A09LJnlTfmwEouz4YXe8O9zBlOKKHPd6eAFMlJX0A23emg+68f
	pPs/7W99OjVCu/K+E0BvLPw6l/qjf5Q5oQH5YN4l+mbmc6uEknCemcJFJ7SM1lZLA8a6AK1CcO0
	VBggIYzuEkFSS/OciCYpj3aiYH5zEgZgyglCLD3JJXJzW7zc+zgF1L73ld4ctc5b1lOD2lVvvvL
	LtEZdDIoxp0jEs+RkE0DjKVnlsn15vqH/CqPUYMxRamCDiwhWkQ89r0hWwOQCtSedH/VupF+hnS
	Ul3fe1E=
X-Received: by 2002:a05:622a:a0b:b0:50b:4e90:44ae with SMTP id
 d75a77b69052e-50b83d9432fmr2305211cf.17.1774390800883; Tue, 24 Mar 2026
 15:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260323175340.3361311-1-avagin@google.com> <20260323175340.3361311-2-avagin@google.com>
 <acGEonF9I6sPA42B@J2N7QTR9R3.cambridge.arm.com> <acJnOB-rlyt-3jU4@willie-the-truck>
In-Reply-To: <acJnOB-rlyt-3jU4@willie-the-truck>
From: Andrei Vagin <avagin@google.com>
Date: Tue, 24 Mar 2026 15:19:49 -0700
X-Gm-Features: AaiRm52g4xzDr5_5nSdTi4eazdyhs8piBH0WKAbvFvJLqkZfV7WhTKZGEWCKiO0
Message-ID: <CAEWA0a7iR8YHooqXJfhersV6YhAXGMZDUhib3QQH5XGn=KNowA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260324_152003_627572_BEB11598 
X-CRM114-Status: GOOD (  41.28  )
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

Hi Mark and Will,

Thanks for the feedback. Please read the inline comments.

On Tue, Mar 24, 2026 at 3:28=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Mon, Mar 23, 2026 at 06:21:22PM +0000, Mark Rutland wrote:
> > On Mon, Mar 23, 2026 at 05:53:37PM +0000, Andrei Vagin wrote:
> > > Introduces a mechanism to inherit hardware capabilities (AT_HWCAP,
> > > AT_HWCAP2, etc.) from a parent process when they have been modified v=
ia
> > > prctl.
> > >
> > > To support C/R operations (snapshots, live migration) in heterogeneou=
s
> > > clusters, we must ensure that processes utilize CPU features availabl=
e
> > > on all potential target nodes. To solve this, we need to advertise a
> > > common feature set across the cluster.
> > >
> > > This patch adds a new mm flag MMF_USER_HWCAP, which is set when the
> > > auxiliary vector is modified via prctl(PR_SET_MM, PR_SET_MM_AUXV).  W=
hen
> > > execve() is called, if the current process has MMF_USER_HWCAP set, th=
e
> > > HWCAP values are extracted from the current auxiliary vector and stor=
ed
> > > in the linux_binprm structure. These values are then used to populate
> > > the auxiliary vector of the new process, effectively inheriting the
> > > hardware capabilities.
> > >
> > > The inherited HWCAPs are masked with the hardware capabilities suppor=
ted
> > > by the current kernel to ensure that we don't report more features th=
an
> > > actually supported. This is important to avoid unexpected behavior,
> > > especially for processes with additional privileges.
> >
> > At a high level, I don't think that's going to be sufficient:
> >
> > * On an architecture with other userspace accessible feature
> >   identification mechanism registers (e.g. ID registers), userspace
> >   might read those. So you might need to hide stuff there too, and
> >   that's going to require architecture-specific interfaces to manage.
> >
> >   It's possible that some code checks HWCAPs and others check ID
> >   registers, and mismatch between the two could be problematic.
> >
> > * If the HWCAPs can be inherited by a more privileged task, then a
> >   malicious user could use this to hide security features (e.g. shadow
> >   stack or pointer authentication on arm64), and make it easier to
> >   attack that task. While not a direct attack, it would undermine those
> >   features.

I agree with Mark that only a privileged process have to be able to mask
certain hardware features. Currently, PR_SET_MM_AUXV is guarded by
CAP_SYS_RESOURCE, but PR_SET_MM_MAP allows changing the auxiliary vector
without specific capabilities. This is definitely the issue. To address
this, I think we can consider to introduce a new prctl command to enable
HWCAP inheritance explicitly.

>
> Yeah, this looks like a non-starter to me on arm64. Even if it was
> extended to apply the same treatment to the idregs, many of the hwcap
> features can't actually be disabled by the kernel and so you still run
> the risk of a task that probes for the presence of a feature using
> something like a SIGILL handler or, perhaps more likely, assumes that
> the presence of one hwcap implies the presence of another. And then
> there are the applications that just base everything off the MIDR...

The goal of this mechanism is not to provide strict architectural
enforcement or to trap the use of hardware features; rather, it is to
provide a consistent discovery interface for applications. I chose the
HWCAP vector because it mirrors the existing behavior of running an
older kernel on newer hardware: while ID registers might report a
feature as physically present, the HWCAPs will omit it if the kernel
lacks support. Applications are generally expected to treat HWCAPs as
the source of truth for which features are safe to use, even if the
underlying hardware is technically capable of more.

Another significant advantage of using HWCAPs is that many
applications already rely on them for feature detection. This interface
allows these applications to work correctly "out-of-the-box" in a
migrated environment without requiring any userspace modifications.  I
understand that some apps may use other detection methods; however, there
it no gurantee that these applications will work correctly after
migration to another machine.

>
> There's also kvm, which provides a roundabout way to query some features
> of the underlying hardware.
>
> You're probably better off using/extending the idreg overrides we have
> in arch/arm64/kernel/pi/idreg-override.c so that you can make your
> cluster of heterogeneous machines look alike.

IIRC, idreg-override/cpuid-masking usually works for an entire machine.
We actually need to have a mechanism that will work on a per-container
basis. Workloads inside one cluster can have different
migration/snapshot requirements. Some are pinned to a specific node,
others are never migrated, while others need to be migratable across a
cluster or even between clusters. We need a mechanism that can be
tunable on a per-container/per-process basis.

>
> On the other hand, if munging the hwcaps happens to be sufficient for
> this particular use-case, can't it be handled entirely in userspace (e.g.
> by hacking libc?)

CRIU often handles workloads with a mix of runtimes: some linked against
glibc, some against musl, and others like Go that bypass libc entirely.
CRIU is mostly used to handle containers that can run multiple processes
possible based on different runtimes. It means available cpu features
should not be only specified for one runtime, they have to be passed
across different runtimes. I think the pure userspace solution is near
infeasible in this case.

Thanks,
Andrei

