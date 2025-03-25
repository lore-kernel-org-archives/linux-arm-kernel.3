Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF1AC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKMJVcSSYFhFkaF9OI9BOHOle5JxWrFZ54yuemRi3B0=; b=QXm2kdTmkTnk3q35c6T3BQokWs
	FbURM/mz7xSzLlwNZ8kGJLmvxQm5l1NvlaazXbZ2WelC3jIsLdhWL0u4nOx7zrd4wMGe6NoHLNF/5
	EgtX/jvyA3AhX3CpN7R9am763qldz4Q7HfHVbClUQVgoL4QMgVwJ8fxJwvCbII0Zri9fdDDVIHGlg
	VzrjD7lfw3FZvAJ5dJOqMH9mRzU6yNthy2jVxKCrN2NckYckZNdPf6Is+27WInY1ZrQ6f3834k9i8
	Y932sdyR+pC/fP0LK65wd1VG77+dNqcRICpfJnoKliqzA21sJJ4ro3NmoAmzOGiUYZaV5/jrdketj
	NetYKpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5tQ-00000006Hw2-1rZU;
	Tue, 25 Mar 2025 15:08:40 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4to-000000069JV-38nQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 14:05:03 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-476a304a8edso49670431cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1742911500; x=1743516300; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKMJVcSSYFhFkaF9OI9BOHOle5JxWrFZ54yuemRi3B0=;
        b=AROCbu2ANCTZKO/AYOds/JGwIxoOJ+ropXG02/nK/tawFCLaIv3WaTRaAdTmsJqv1/
         TYAVK0sFN/SMIrSBfH3J3Lo7PGYnGXwN/2DgD8mArjllHhIYglx8j7yNTv/voz+BM9sy
         Heql1rvI1XcPyT2Af2SqPszzRtBpT46fW/761lsAAq2OtihL+zEeFaG8VQuozExX7K8W
         I1nHpmbMRhXx9qSnrr6qV4Qfga7tmuWsYF7f/GjguzSXm874gmniR6q+tu6A0xfcTkjj
         6jCFSiakxYIDbxbsOIK/4nIckGHdgrpNlYzptcxYZIieAFyg/NRJUfWka6hBlEph4WBe
         qQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911500; x=1743516300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKMJVcSSYFhFkaF9OI9BOHOle5JxWrFZ54yuemRi3B0=;
        b=S67R2jo7OrYx6p2Lr45ThcoxDd89Z4nL0EInE1RB5Z2zXhozjNKoFv3rRJOAT+Z9lt
         WK6ct7iRaOovKGzmMRkxNlleBjymF82ft/aH4PcGtRStHM+RH5VQBD/vF+1rP/TKXc3N
         b6UvfXpNxD0LFV/FKTaw+ItgeRdUTPYk3YCuzxyrYlq90YfQD+KPg47FlzJcElkt3ygJ
         of1aF8ddC5i7xLSCo2IDzjc4y5MyVPEg7Z53zvoB28V8ZVpTON+wl7J30KdpSQsibKwm
         0HAERjjZ2Dl3n1t3bj3rYEqKxvnYW0dSjhUr8MmwWHe1bdPXpCTrMuxeZwftpU/HUrAC
         /xwg==
X-Forwarded-Encrypted: i=1; AJvYcCVyjixKY5+Ip90qBK+ndXJDyyHMa6JbxWGYKAIiLsDDhvTArwYY0H74gDtTeK8c4QtwZSD6ozaJlNxBZazI+Re6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/ml851mDj2YeHj/AP48WO9SpNU7doChJh3gtCovKTw/R1E0QC
	qALb2CdFq1os+qetgdrq5aS17caCiDxlwjX8d9x/Fd/9SCCtXBAWXpSu4XZruZ/VAwTVU1rLuan
	mMgBPW9QllKpHawi3MrtMXdg1RQKPJiVZQhuV6A==
X-Gm-Gg: ASbGnct43yA8D634tvD0Iq659pTyyo8A8PpTCYrBpavPNf6Ysa92ugGF9s2/WDC7X9I
	6it3gvHY8SCP4KPKKURJQmZvL9HG41ixTbzZACZB67SHCaquyShV2YVcbgrOj6PT250hTzqBPRC
	1udc0LGjVvsWP1YtSe5mz92EDF
X-Google-Smtp-Source: AGHT+IGMYVQtiX/h+EVJlPHZz5Rq/az3V8wIPVjd4SZUiiPGocRCmY6VSmvm0irS2U8qQcxFKzIzc2oRCd6fuO2LGmc=
X-Received: by 2002:a05:622a:248e:b0:476:b56d:eb46 with SMTP id
 d75a77b69052e-4771dd77d25mr264001271cf.15.1742911499617; Tue, 25 Mar 2025
 07:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-12-changyuanl@google.com> <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
 <Z+JT7kx+sfPqfWFA@MiWiFi-R3L-srv>
In-Reply-To: <Z+JT7kx+sfPqfWFA@MiWiFi-R3L-srv>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 25 Mar 2025 10:04:21 -0400
X-Gm-Features: AQ5f1Jrjo6HkojvC1uIVMuAy34VVl7CYnqSMt1jjfTIiYkTHpp9oYG_kKxOqyPA
Message-ID: <CA+CK2bB-qPV-QnqUwAv+OGujZwWLAAgBT0xH6fyKY8-cP1bNSQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/16] kexec: add config option for KHO
To: Baoquan He <bhe@redhat.com>
Cc: Dave Young <dyoung@redhat.com>, Changyuan Lyu <changyuanl@google.com>, 
	linux-kernel@vger.kernel.org, graf@amazon.com, akpm@linux-foundation.org, 
	luto@kernel.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	hpa@zytor.com, peterz@infradead.org, ptyadav@amazon.de, robh+dt@kernel.org, 
	robh@kernel.org, saravanak@google.com, skinsburskii@linux.microsoft.com, 
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com, 
	usama.arif@bytedance.com, will@kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_070501_060850_F4564C1E 
X-CRM114-Status: GOOD (  30.18  )
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

On Tue, Mar 25, 2025 at 2:58=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote:
>
> On 03/24/25 at 12:18pm, Dave Young wrote:
> > On Thu, 20 Mar 2025 at 23:05, Changyuan Lyu <changyuanl@google.com> wro=
te:
> > >
> > > From: Alexander Graf <graf@amazon.com>
> > >
> > > We have all generic code in place now to support Kexec with KHO. This
> > > patch adds a config option that depends on architecture support to
> > > enable KHO support.
> > >
> > > Signed-off-by: Alexander Graf <graf@amazon.com>
> > > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > Co-developed-by: Changyuan Lyu <changyuanl@google.com>
> > > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> > > ---
> > >  kernel/Kconfig.kexec | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> > > index 4d111f871951..57db99e758a8 100644
> > > --- a/kernel/Kconfig.kexec
> > > +++ b/kernel/Kconfig.kexec
> > > @@ -95,6 +95,21 @@ config KEXEC_JUMP
> > >           Jump between original kernel and kexeced kernel and invoke
> > >           code in physical address mode via KEXEC
> > >
> > > +config KEXEC_HANDOVER
> > > +       bool "kexec handover"
> > > +       depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXE=
C_FILE
> > > +       select MEMBLOCK_KHO_SCRATCH
> > > +       select KEXEC_FILE
> > > +       select DEBUG_FS
> > > +       select LIBFDT
> > > +       select CMA
> > > +       select XXHASH
> > > +       help
> > > +         Allow kexec to hand over state across kernels by generating=
 and
> > > +         passing additional metadata to the target kernel. This is u=
seful
> > > +         to keep data or state alive across the kexec. For this to w=
ork,
> > > +         both source and target kernels need to have this option ena=
bled.
> > > +
> >
> > Have you tested kdump?  In my mind there are two issues,  one is with
> > CMA enabled, it could cause kdump crashkernel memory reservation
> > failures more often due to the fragmented low memory.  Secondly,  in
>
> kho scracth memorys are reserved much later than crashkernel, we may not
> need to worry about it.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> start_kernel()
>   ......
>   -->setup_arch(&command_line);
>      -->arch_reserve_crashkernel();
>   ......
>   -->mm_core_init();
>      -->kho_memory_init();
>
> > kdump kernel dump the crazy scratch memory in vmcore is not very
> > meaningful.  Otherwise I suspect this is not tested under kdump.  If
> > so please disable this option for kdump.
>
> Yeah, it's not meaningful to dump out scratch memorys into vmcore. We
> may need to dig them out from eflcorehdr. While it's an optimization,
> kho scratch is not big relative to the entire system memory. It can be
> done in later stage. My personal opinion.

But, we don't; we only dump out the regular CMA memory that absolutely
should be part of vmcore. When scratch is used during boot, it is used
for regular early boot kernel allocations, such as to allocate memmap,
which is an essential part of the crash dump.

Pasha

