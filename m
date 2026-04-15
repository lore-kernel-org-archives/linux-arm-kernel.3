Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFB4F428CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 19:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQ7kho8nNPiCZN6dDdK/LtHsVWQC24olPeq9GPw1YEU=; b=ySwkLvUTfUxEVB8FzZWgazGO7g
	2kJUyCOZHGtiUBneLIkutFwTxRv+4DyhzvdBI1/RgHDT2VQ+aACY8xjoym0dMEm3C1w0tg3nxOwdY
	rFHgb+OnVrycfSmwm02vr7uRajRT+Ua1//jLw7DTw83PHPBdw2tyVdJGVn8bARxVz5p7bn06ou3am
	srKN9J0s5Is+e4URUU49g+9KOp3edtnogmvX/PgtybC3vkiwQg0VzWsoNCEus4tTgD7ilLhTQdWlM
	O+z+DDbdF9bX/0MtA2eKbOVMczfKy6vFVXQu2VH0A1PndND/wIBfd4Cc1j+ZV87D2V4/k3szv4lYV
	CiLhjIIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD5tP-00000001Xpm-0oMD;
	Wed, 15 Apr 2026 19:27:19 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD5tM-00000001XpS-3AAi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 19:27:17 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7dbca22dbfeso3878774a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 12:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776281235; cv=none;
        d=google.com; s=arc-20240605;
        b=echus7Orr/tIe/erF9EXtBf5Ni8r7FfH3MyqGPc48R1djKtXiU2TBLxkwEVFm9HXVM
         3RALd9fkIowKR3nyYnN9YwUYoJMSUBGJV50daFKhniG6+tuNlQW8tqeMJ7alzFWog9L0
         TYKQ+qHcOgomTIulmjTStQzB8e2zJ3tnUKx9o0ly2894wG/p8Lcjwm5sG3DBNPtirQ1X
         WeA1f40gGrjSKpa46sLP1NOjOK5CmDWC2W2oMvva3BgI+8cNQqOmD3RNdZ2CyWkWQ6Ho
         6UQEtVyDM3PNqRU5pklEHyE4YTYMUJvmHMiyrTruaNxS9Yb2VCstd+I67Xpe3dkmIITa
         +k9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WQ7kho8nNPiCZN6dDdK/LtHsVWQC24olPeq9GPw1YEU=;
        fh=KsBo9sNC8YrDTm9W2pGSCAl41y/yW73kOIvOcFHYTNk=;
        b=HuvlBXn8tFRk3H6Q93eZ7UpQRZCy4g/o+XVkTOdHIslyenBkt2vOc01Il14D3fQToy
         +ytosJ5Vg2TqJ3+Aur9IgXr84LLIdFntSUBEbxIVCbjKTw3/ZGYCraG9ULSTU4n7r3hx
         acVjqF8qvHReSylXBNCUhnWvMmgWsmMohAyOysmlN4eOzWxMSq3krMDmcwIRRJPd5kI3
         UFgWg5SbQ1x4G5ki15nnNlWQ4LQ3DCKP46ywK03oJOL1wVngfcfpYYpww3hgSqwVTWne
         ZXO2AQ1lMRt0fXv94W6mqdTHYfOqwbgyOcZI7MjqxCD/n16qxiUtq7qCIS019viefHb0
         w8VA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776281235; x=1776886035; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQ7kho8nNPiCZN6dDdK/LtHsVWQC24olPeq9GPw1YEU=;
        b=QEV43/uDj3xKWdRpgXOq+0feVFW0afbDJ+27rCFsI2ATq7sHpLRRsjjHSDmlHqlfxh
         JUHzy3bd/yobk+RZyA5Z8G5vQx/r2GEOJmrkDoyHixe4ly07DD78SEkOW2z1I0VBCQGf
         ZG1+4PRpX8Z7Sbp20cgymQE/7kjjuGcr8LOIuqBxSAuWCUxv/Wz+iGo3OKtea0cQiUGK
         CBhTHE7J2UPnjTdywt5jG/DoUCTG2Z/JNNFmXgPGf1CSVUdXLLnN7gOpie+LicvNlZv0
         gZ1Zat670G8tXNlwtOREasZCwBSScYj5NnjxsrDf94gxI0Uv977EayfQuHkiIe9IiEJM
         SWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776281235; x=1776886035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WQ7kho8nNPiCZN6dDdK/LtHsVWQC24olPeq9GPw1YEU=;
        b=aTGbz59GLHg0qZwU7LpKch8YGcDL4Xn8KirYZ2p7svWTP83QrXf8VfUtndcsFExDZx
         SGdMFY71TzTU//seoql635U8StEaLkRkoEIR+sIeZyWV4MYbj4TTiXMejfUSsMCH0M5C
         E85Lu+8ZFfMfwG0EZXoTpKrczhlQ2zbwhMAbDV0F+8aaC0NpZmy8aPA5r9BxoxgZVcB+
         5DyFTl5cO1RB8mlpHfIIBlL2d+lCd/Lbw3/c0L5I08ZjiFJnEoWarm1oAO+emeZA1GPt
         owBzCgmDmT95wkDWZaq6+N9WSiXFJ4gynxOVHQ2j4BLql4+3TDQUy8++zNaWoNIt6iGj
         Oivg==
X-Forwarded-Encrypted: i=1; AFNElJ8miNKU64x25VYuQYG9VglCI20lPsL10zqXuJ0EsjndCVPLL/X+c4E9WrD7NU3gByda5DuWnVAHltGmf6T4Kgtu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+EwF30ht0E8h6OdFGbRja3kWMqTrWv/XbAsBR4xvUoRGkMV/n
	dW5BEk6jChtTWqyR9WczaEs2QkLuraqe9m64Oh8fCq4fDLSFWr9gKfqtGLP5U24FiZ15Tnz06kK
	TkrONNbFuZqi+kBF+Kshap0l4HPR9jiM=
X-Gm-Gg: AeBDievOctUQEBodCppDG90o/asILspPzsXVUBspANA7xI8Uv64fxVCIKOE1f2GyNgV
	6rfhHeXRXs9zJh670Uhb7OP9rb5ufSIx7z4oMX6e7qgRW5ujMGvw2hwCX0Bz1BUsHpFzcAfisB/
	O8n/PezPeqyEbN4oW20WOU9Bn1xZeoUHrs+RiLdKDg2wUoVuVQ9qXlwUtxzfn72Ng6No3cHpFma
	9jDKdNGhouTRKZFim1F0dwrAJ+legQscgE1Kl0smkMdip8KGFRTpURsujxunsdKP3+Iciftbm9X
	FheghNyi0o0cjuSr8A==
X-Received: by 2002:a05:6830:25c5:b0:7d9:f50f:968a with SMTP id
 46e09a7af769-7dc27c66377mr13072583a34.5.1776281234901; Wed, 15 Apr 2026
 12:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260323175340.3361311-1-avagin@google.com> <20260323175340.3361311-2-avagin@google.com>
 <acGEonF9I6sPA42B@J2N7QTR9R3.cambridge.arm.com> <acJnOB-rlyt-3jU4@willie-the-truck>
 <CAEWA0a7iR8YHooqXJfhersV6YhAXGMZDUhib3QQH5XGn=KNowA@mail.gmail.com>
 <acarA3sGKY4Acozw@J2N7QTR9R3.cambridge.arm.com> <CAEWA0a7AZiuy1F+0LDxtEtJpdu=zA-RKhPb1wcDMpy2tSMFO5g@mail.gmail.com>
 <adUhbk0sKT0ucWhJ@J2N7QTR9R3>
In-Reply-To: <adUhbk0sKT0ucWhJ@J2N7QTR9R3>
From: Andrei Vagin <avagin@gmail.com>
Date: Wed, 15 Apr 2026 12:27:03 -0700
X-Gm-Features: AQROBzBNtO31xd0yW9r81lEqB1GfFyuOQPPb5LE8m1aTt5Q8NnQOvyvucUSdcQk
Message-ID: <CANaxB-xitpwsU9SmQ1D7q0Jn0Ng1b4WYxzAWF3L-pE+EYzbObg@mail.gmail.com>
Subject: Re: [PATCH 1/4] exec: inherit HWCAPs from the parent process
To: Mark Rutland <mark.rutland@arm.com>
Cc: Andrei Vagin <avagin@google.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
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
X-CRM114-CacheID: sfid-20260415_122716_814370_0CB3EA77 
X-CRM114-Status: GOOD (  56.05  )
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

Hi Mark,

Thanks for the feedback and sorry for the delay, was on vacation.
Please see my comments inline.

On Tue, Apr 7, 2026 at 8:29=E2=80=AFAM Mark Rutland <mark.rutland@arm.com> =
wrote:
>
> On Fri, Mar 27, 2026 at 05:21:26PM -0700, Andrei Vagin wrote:
> > Hi Mark,
> >
> > I understand all these points and they are valid. However, as I
> > mentioned, we are not trying to introduce a mechanism that will strictl=
y
> > enforce feature sets for every container. While we would like to have
> > that functionality, as you and will mentioned, it would require
> > substantially more complexity to address, and maintainers would unlikel=
y
> > to pick up that complexity.
>
> The crux of my complaint here is that unless you do that (to some
> degree), this is not going to work reliably, even with the constraints
> you outline.
>
> Further, I disagree with your proposed solution of pushing more
> constraints onto userspace (to also consider HWCAPs as overriding other
> mechainsms, etc).
>
> I think that as-is, the approach is flawed.

I would really appreciate it if we could move this conversation toward
how we can make it work.

>
> > Even masking ID registers on a per-container basis would introduce
> > extra complexity that could make architecture maintainers unhappy.
> > There were a few attempts to introduce container CPUID masking on
> > x86_64 in the past.
>
> > In CRIU, we are not aiming to handle every possible workload. Our goal
> > is to target workloads where developers are ready to cooperate and
> > willing to make adjustments to be C/R compatible. The goal here is to
> > provide developers with clear instructions on what they can do to ensur=
e
> > their applications are C/R compatible. When I say "workloads", I mean
> > this in a broad sense. A container might pack a set of tools with
> > different runtimes (Go, Java, libc-based). All these runtimes should
> > detect only allowed features.
>
> I do not think that arbitrary applications (and libraries!) should have
> to pick up additional constraints that are unnecessary without CRIU,
> especially where that goes against deliberate design decisions (e.g.
> features in arm64's HINT instruction space, which are designed to be
> usable in fast paths WITHOUT needing explicit checks of things like
> HWCAPs). Note that those typically *do* have kernel controls.
>
> I think there's a much larger problem space than you anticipate, and
> adding an incomplete solution now is just going to introduce a
> maintenance burden.

I am not adding arbitrary constraints for standard non-CRIU use cases.
Previously, I suggested that standard libraries would need to call prctl
to determine if hwcaps should be used for feature detection.  However,
we can avoid this extra syscall by adding the new HWCAP2_CR bit. Then
libraries will simply check this bit in auxv[AT_HWCAP2], meaning the
overhead for "non-criu" cases is just a single bit check.

As for HINT instructions, there are two class of instructions.

The first one doesn't change a process state and they are not required
any special handling in term of checkpoint/restore. If a process is
checkpointed on a newer cpu, and restore it on an older cpu, the older
hardware will simply skip over that instructions.  The architectural
state (registers, memory) should remain consistent.

The second class such as PAC are instructions that actually change a
process state. These instructions require kernel/userspace coordination.
For example, usage of PAC keys can be controlled from userspace via prctl.
I mean when support for new instructions is implemented in the kernel,
we will need to consider that userspace should be able to control them.

>
> > Returning to the subject of this patchset: this series extends the role
> > of hwcaps. With this change, we would establish that hwcaps is the
> > "source of truth" for which features an application can safely use. Any
> > other features available on the current CPU would not be guaranteed to
> > remain available after migration to another machine.
> >
> > After this discussion, I found that the current version missed one majo=
r
> > thing: there should be a signal indicating that hwcaps must be used for
> > feature detection. Since we will need to integrate this interface into
> > libc, Go, and other runtimes, they definitely should not rely just on
> > hwcaps by default, especially in the early stages. This can be solved
> > via the prctl command.  Libraries like libc would call
> > prctl(PR_USER_HWCAP_ENABLED). If this returns true, the runtime knows
> > that only the features explicitly listed in hwcaps should be used.
>
> I do not think we should be pushing that shape of constraint onto
> userspace.

Look at the previous command.

>
> > You are right, the controlled feature set will be limited to features
> > the kernel knows about. And yes, we would need to report CPU features i=
n
> > hwcaps even if the kernel isn't directly involved in handling them.
>
> To be clear, that is not what I am arguing.
>
> As I mentioned before, the way this works on arm64 is that the kernel
> only exposes what it is aware of, even in the ID regs accessible to
> userspace. We usually *can* hide features, and do that for cases of
> mismatched big.LITTLE, virtual machines, etc.

I understand that. My point was that the kernel would need to report
features in hwcaps even if they don't require specific kernel-side
handling.

>
> > Honestly, I am not certain if this is the "right" interface for that,
> > and I would be happy to consider other ideas. I understand that these
> > hwcaps will not work right out of the box, but we need a way to solve
> > this problem. Having a centralized API for CPU/kernel feature detection
> > seems like the right direction.
>
> I think that for better or worse the approach you are tkaing here simply
> does not solve enough of the problem to actually be worthwhile.

This approach mimics solutions that some CRIU users are already
implementing in userspace, but those only work when the user controls/
recompiles all their libraries. I am open to other ideas, but we need a
path forward.

>
> > As for signal frame size and extended states like SVE/SME, we aware
> > about this problem.  However, it is partly mitigated by the fact that i=
f
> > an application does not use some features, those states are not placed
> > in the signal frame.
>
> That is not true. The kernel can and will create signal frames for
> architectural state that a task might never have touched.
>
> Generally arm64 creates signal frames for features when the feature
> *exists*, regardless of whether the task has actively manipulated the
> relevant state. For example, on systems with SVE a trivial SVE signal
> frame gets created even if a task only uses the FPSIMD registers, and on
> systms with SME a TPIDR2 signal frame gets created even if the task has
> never read/written TPIDR2.
>
> When restoring, an unrecognised signal frame is treated as invalid, and
> we can require that certain signal frames are present.

You are right; that was my mistake. My only explanation for why we don't
see this failure often is that C/R is rarely triggered while a process
is actually
inside a signal handler. This is definitely a problem that still needs
to be solved.

>
> > In the future, when we construct/reload a signal frame, we could look
> > at a process feature set for a process and generate a frame according
> > to those features...
>
> When you say 'we' here, are you talking about within the kernel, or
> within the userspace C/R mechanism?

... within the kernel.

Thanks,
Andrei

