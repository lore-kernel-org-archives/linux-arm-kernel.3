Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0B8C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 11:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8Sf8JF/JRHMkMghb8r8bp2QRgmK4Dkiuo4Cc+JcYWU=; b=wnvqqCPJ5rh0C/WXsJo9UMvjHX
	P5bpg3XSbguSQaP7GGkvpj0wXcvtzFPD8tCrVvFR6XiAnoDe9gBBu+jEsupp+bwlXmtk+qIbRuBcf
	u1zKpOi4QoSD3E3id2WocftMtzdmDtS0Dt0/IlOFiuBCnlOc2kZ7m2Ife001srEkIGy3n+E6ggWOv
	1p6SCLrZVMRu52DFyhy8H+PY4w5zs52EKb1VjsymQy0k8DQgh+JrHGMexTzywmrM7yO3389NVz8i9
	dP6gaMhqbu1bNh6IrLFxwth2LaViygtYKQx72c/Un5bJToFUE7GoxsI8B0IVhCwQ0+QUr5OIF2JHc
	efjdFv6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKyDY-00000000T4q-0Ipo;
	Fri, 30 May 2025 11:48:08 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKyBN-00000000SbW-1fbw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 11:45:55 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3dc6f653152so6898425ab.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 04:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1748605552; x=1749210352; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8Sf8JF/JRHMkMghb8r8bp2QRgmK4Dkiuo4Cc+JcYWU=;
        b=P4BDIXya2RJfPk96+zDT+0YoBKFy6gS7/LxAztKK9nXnqm+27EsEd0/Qf18NZw8afa
         BUotW2psXBMcfVXwPjUxin0KpIf1cNg52Nx8LnwORqJcMw1sffCOOX42GHHC2b8MQEWP
         iVkxUq6gPVUcijhxpDkbFHosaoqtvVRn5InPQI8GZZwV+t418FtAQP8dk5lZV0DxfMxF
         Cb3An2hBJ0L8OmWxZ0VyNwQGOuipQVDAF/KoCaVk5XS1/0Xm3OXGeWxEoM8oqUEBWWJp
         TLBL+GKZqfi+avXXEDy6KDlJH+TIwovt28CMKaP8eOhTEzWrgElmTG10Lfg9MOiF9jm7
         0Bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748605552; x=1749210352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8Sf8JF/JRHMkMghb8r8bp2QRgmK4Dkiuo4Cc+JcYWU=;
        b=XGrMWAM26c7+ZrsDFhuekVbIl7IW0vGGvj+c2SkGCZL6AjbXNgZ/Sd5CIqn7FqLJAd
         NVnhTLnrEhjjw3g7zZsEnWwGDS9qptf3UY057rAgS9qJaEQFyHya4sZJS2IkkDIhgkuy
         E8SGFylbWBAQmjaRLmv0x9wlNAyCMEEsmE/srRAfeUyNUl0eUvtf+CI2GUX+FRbV/Hul
         qeJXEWCksLw/qgZFQUvlKOFm4xrtJExMQayXmjFGObuRhaGUA4RviH2jpHMR5VVnmJgj
         EpUqvt5vFaE7rCQC3C8ZXDHdMH3jHV4PymldCle1IFrVu/IG5XY6iqcDlMmo1L+M09Et
         rdVg==
X-Forwarded-Encrypted: i=1; AJvYcCU9efEK+LMzA+bWL45V7JrAVhnJ2sauLVr3TeE9Wbt7sdbTqITC50hUA42uWX92Q/4Tm/AtCI4Oh4QdWNivOQwC@lists.infradead.org
X-Gm-Message-State: AOJu0YzEpD+MA6rEDoDGjzWz38J2Nm2S619jON5zOf2yxRUZ/cLY7MJb
	5nSTSI5NHjV7k95zhD6sBrAV2WA1IV4GcgJfLSd4t7+XErxf14Eq55Yvk8aRabhjQIGvlCTYEjB
	vbVht29miuAmfKF5Yg50SmaAIO6CxDAooot0LkbaFeQ==
X-Gm-Gg: ASbGncvICpZ1smBezn9KaINSfxsc0rSFqlMuf/g/9mckMxp1mNbcx/9XnkTmpXaa+KU
	CH3lb+foPK17w8FyXrB63PqkJqg9C4IWaV+2hMeq1Av9Mz6vqDlM6fp0ViPzDjlWF3SHLvmTHym
	2mSTb7vh5o6ptg/MOowwMMlvc87btZydWjSMlsso0sgyNY
X-Google-Smtp-Source: AGHT+IEZspkmXl6apmdK800eHc5l4NQ5iwqsGwzYU97FvRCNbOAgU9eoVynwSTVXbJb+FR7uIpENRquO/2Gk7ASVktU=
X-Received: by 2002:a05:6e02:2789:b0:3dd:89c4:bc66 with SMTP id
 e9e14a558f8ab-3dd99bf38bbmr36342945ab.9.1748605551821; Fri, 30 May 2025
 04:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com> <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com> <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev> <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev> <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
 <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev> <20250529-badd99c8168a8f607c84338a@orel>
In-Reply-To: <20250529-badd99c8168a8f607c84338a@orel>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 30 May 2025 17:15:40 +0530
X-Gm-Features: AX0GCFuJc9ZDD3E-EJq-QPTWtrq0YP1bknsGKJtpiBXz7TDFtXgGx4YOXA3X71U
Message-ID: <CAAhSdy0MBcD29fNSRgfckXuNmptW_borO7gtVqWvXRSnPBpmJg@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to 3.0
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_044553_701313_4851F69B 
X-CRM114-Status: GOOD (  77.24  )
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

On Fri, May 30, 2025 at 12:44=E2=80=AFAM Andrew Jones <ajones@ventanamicro.=
com> wrote:
>
> On Thu, May 29, 2025 at 11:44:38AM -0700, Atish Patra wrote:
> >
> > On 5/29/25 3:24 AM, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
> > > I originally gave up on the idea, but I feel kinda bad for Drew now, =
so
> > > trying again:
> >
> > I am sorry if some of my replies came across in the wrong way. That was
> > never
> > the intention.
>
> Not at all. Radim only meant that I was defending his patches, even thoug=
h
> he wasn't :-)
>
> >
> >
> > > 2025-05-28T12:21:59-07:00, Atish Patra <atish.patra@linux.dev>:
> > > > On 5/28/25 8:09 AM, Andrew Jones wrote:
> > > > > On Wed, May 28, 2025 at 07:16:11AM -0700, Atish Patra wrote:
> > > > > > On 5/26/25 4:13 AM, Andrew Jones wrote:
> > > > > > > On Mon, May 26, 2025 at 11:00:30AM +0200, Radim Kr=C4=8Dm=C3=
=A1=C5=99 wrote:
> > > > > > > > 2025-05-23T10:16:11-07:00, Atish Patra <atish.patra@linux.d=
ev>:
> > > > > > > > > On 5/23/25 6:31 AM, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
> > > > > > > > > > 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc=
.com>:
> > > > > > > > > > > Upgrade the SBI version to v3.0 so that corresponding=
 features
> > > > > > > > > > > can be enabled in the guest.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > > > > > > > > ---
> > > > > > > > > > > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/=
arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > > > > > > > > > -#define KVM_SBI_VERSION_MAJOR 2
> > > > > > > > > > > +#define KVM_SBI_VERSION_MAJOR 3
> > > > > > > > > > I think it's time to add versioning to KVM SBI implemen=
tation.
> > > > > > > > > > Userspace should be able to select the desired SBI vers=
ion and KVM would
> > > > > > > > > > tell the guest that newer features are not supported.
> > > > > > > We need new code for this, but it's a good idea.
> > > > > > >
> > > > > > > > > We can achieve that through onereg interface by disabling=
 individual SBI
> > > > > > > > > extensions.
> > > > > > > > > We can extend the existing onereg interface to disable a =
specific SBI
> > > > > > > > > version directly
> > > > > > > > > instead of individual ones to save those IOCTL as well.
> > > > > > > > Yes, I am all in favor of letting userspace provide all val=
ues in the
> > > > > > > > BASE extension.
> > > > > > We already support vendorid/archid/impid through one reg. I thi=
nk we just
> > > > > > need to add the SBI version support to that so that user space =
can set it.
> > > > > >
> > > > > > > This is covered by your recent patch that provides userspace_=
sbi.
> > > > > > Why do we need to invent new IOCTL for this ? Once the user spa=
ce sets the
> > > > > > SBI version, KVM can enforce it.
> > > > > If an SBI spec version provides an extension that can be emulated=
 by
> > > > > userspace, then userspace could choose to advertise that spec ver=
sion,
> > > > > implement a BASE probe function that advertises the extension, an=
d
> > > > > implement the extension, even if the KVM version running is older
> > > > > and unaware of it. But, in order to do that, we need KVM to exit =
to
> > > > > userspace for all unknown SBI calls and to allow BASE to be overr=
idden
> > > > You mean only the version field in BASE - Correct ?
> > > No, "BASE probe function" is the sbi_probe_extension() ecall.
> > >
> > > > > by userspace. The new KVM CAP ioctl allows opting into that new b=
ehavior.
> > > > But why we need a new IOCTL for that ? We can achieve that with exi=
sting
> > > > one reg interface with improvements.
> > > It's an existing IOCTL with a new data payload, but I can easily use
> > > ONE_REG if you want to do everything through that.
> > >
> > > KVM doesn't really need any other IOCTL than ONE_REGs, it's just
> > > sometimes more reasonable to use a different IOCTL, like ENABLE_CAP.
> > >
> > > > > The old KVM with new VMM configuration isn't totally far-fetched.=
 While
> > > > > host kernels tend to get updated regularly to include security fi=
xes,
> > > > > enterprise kernels tend to stop adding features at some point in =
order
> > > > > to maximize stability. While enterprise VMMs would also eventuall=
y stop
> > > > > adding features, enterprise consumers are always free to use thei=
r own
> > > > > VMMs (at their own risk). So, there's a real chance we could have
> > > > I think we are years away from that happening (if it happens). My
> > > > suggestion was not to
> > > > try to build a world where no body lives ;). When we get to that
> > > > scenario, the default KVM
> > > > shipped will have many extension implemented. So there won't be muc=
h
> > > > advantage to
> > > > reimplement them in the user space. We can also take an informed
> > > > decision at that time
> > > > if the current selective forwarding approach is better
> > > Please don't repeat the design of SUSP/SRST/DBCN.
> > > Seeing them is one of the reasons why I proposed the new interface.
> > >
> > > "Blindly" forwarding DBCN to userspace is even a minor optimization. =
:)
> > >
> > > >                                                         or we need =
to
> > > > blindly forward any
> > > > unknown SBI calls to the user space.
> > > Yes, KVM has to do what userpace configures it to do.
> > >
> > > I don't think that implementing unsupported SBI extensions in KVM is
> > > important -- they should not be a hot path.
> > >
> > > > > deployments with older, stable KVM where users want to enable lat=
er SBI
> > > > > extensions, and, in some cases, that should be possible by just u=
pdating
> > > > > the VMM -- but only if KVM is only acting as an SBI implementatio=
n
> > > > > accelerator and not as a userspace SBI implementation gatekeeper.
> > > > But some of the SBI extensions are so fundamental that it must be
> > > > implemented in KVM
> > > > for various reasons pointed by Anup on other thread.
> > > No, SBI does not have to be implemented in KVM at all.
> > >
> > > We do have a deep disagreement on what is virtualization and the role=
 of
> > > KVM in it.  I think that userspace wants a generic ISA accelerator.
> >
> > I think the disagreement is the role of SBI in KVM virtualization rathe=
r
> > than
> > a generic virtualization and the role of KVM in it. I completely agree =
that
> > KVM should act as an accelerator and defer the control to the user spac=
e in
> > most of the cases
> > such e.g I/O operations or system related functionalities. However, SBI
> > specification solves
> > much wider problems than those. Broadly we can categorize SBI
> > functionalities into the following
> > areas
> >
> > 1. Bridging ISA GAP
> > 2. Higher Privilege Assistance
> > 3. Virtualization
> > 4. Platform abstraction
> > 5. Confidential computing
> >
> > For #1, #3 and #5, I believe user space shouldn't be involved in
> > implementation
> > some of them are in hot path as well.
>
> IMO, userspace should still be in control of whether or not it's involved
> in #1, #3, and #5. It may make little sense for it to be involved, but th=
e
> choice should still be its.
>
> > For #4 and #2, there are some
> > opportunities which
> > can be implemented in user space depending on the exact need. I am stil=
l not
> > clear what is the exact
> > motivation /right now/ to pursue such a path. May be I missed something=
.
> > As per my understanding from our discussion threads, there are two use =
cases
> > possible
> >
> > 1. userspace wants to update more states in HSM. What are the states us=
er
> > space should care about scounteren (fixed already in usptream) ?
> > 2. VMM vs KVM version difference - this may be true in the future depen=
ding
> > on the speed of RISC-V virtualization adoption in the industry.
> > But we are definitely not there yet. Please let me know if I misunderst=
ood
> > any use cases.
>
> That's what I'm aware of as well, but I see giving userspace back full
> control of what gets accelerated by KVM, and what doesn't, as a fix, whic=
h
> is why I wouldn't want to delay it any longer.
>
> >
> > > Even if userspace wants SBI for the M-mode interface, security minded
> > This is probably a 3rd one ? Why we want M-mode interface in the user s=
pace
> > ?
> > > userspace aims for as little kernel code as possible.
> >
> > We trust VMM code more than KVM code ?
>
> We should be skeptical of both, which is why we'd rather put as much code
> in userspace as possible. Insecure/faulty userspace will hopefully have
> exploits/bugs contained to the single process. An insecure/faulty KVM
> means the host is compromised/crashed. On x86, Google put a lot of effort
> into moving instruction emulation out of KVM for security concerns[1]. In
> general, if it's not a hot path and there's a way to do it in userspace,
> then it should be done in userspace (or at least there should be an
> option to use userspace -- each use case can choose what's best for
> itself).
>
> [1] https://www.linux-kvm.org/images/3/3d/01x02-Steve_Rutherford-Performa=
nt_Security_Hardening_of_KVM.pdf
>

We are already forwarding a few of the category #2 and all
of category #4 SBI extensions to KVM user space which are
not in critical or hot-path.

Majority of SBI extensions in categories #1, #2, #3, and #5
provide critical per-VCPU functionality and many of these
are also in hotpath (such as #1, #3, and #5) hence
implemented in kernel space.

Further, KVM user space lacks required functionality (CSRs,
instructions, or ioctls) to implement many critical SBI extensions
in user space so blanket forwarding of all SBI extensions to
KVM user space is not going to fly.
(Note: Previously, I have already provided many examples)

In short, a hybrid approach (current implementation) is the
best thing where only non-critical and non-hotpath SBI
extensions (few of them) are forwarded to KVM user space
while critical / hot-path SBI extensions (majority of them)
are in kernel space.

Regards,
Anup

