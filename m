Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F35FF8D762
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzm6W1Z6bNw1R7/BddIGRoaarTGeMoKKc61rcr/dEKQ=; b=ReIZrI9CDXYk63BYCHVwo1x1HF
	ruV3vbGx2C0m/YaoWgkiQNUGgQzZ/8ILPfTzTLVEVLnZksJ96KAweeD8X9AI/+esa7yRa3JT5boN0
	TVEDIDquqAMSCNJeXBbjyBFpErmvZZAFA8ouVd2xo2J3wRTxXryza9D+sTWrm9FkoI1zqiEfO2/As
	bG8TzlCYyoxCpFlhKf+vhyCGEogfXEyRjMUS8JfHH2D1w88Q5A9z/uGKb417CNekut+cqXxpbj4rF
	EYgxf82pmxWsJuh1+qfqz53/g3G1t2U7F1QkAt2lUAyPzr0Es6TtBkd6MAMYhKj6WIsgVRg1UYKVC
	4+7bWm+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQmC-00000002j5N-3Bb7;
	Thu, 16 Apr 2026 17:45:16 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQm9-00000002j50-2Ayj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 17:45:15 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-899a5db525cso64497936d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 10:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776361512; cv=none;
        d=google.com; s=arc-20240605;
        b=Ad9yF3uTol3ALUCtGlClJahEW6kWNBHbJgeqEpLr6gYRjOM+usS9uY5FArEB9vhLy2
         Vbz5s7wVmpAiPIXUPlo23ZYAr1VwYDz8qAKSuv1wemndwAZCgFO4CJXPeR82mPT5wG/w
         /bwu8GPMVl3Yg8GDShF2rNzzr0dB6DlJLudSR9qVv68poQO3QMvMBg3RKiPSKo99d9jj
         lc0o27aaY8hFXh7bSInhoo71SQ+6/Hddliv4ycNYfwvhQcGCb6yN3Cn+Nm2+nGzf5Zu+
         Iy9vusGS2VxvxbaSQ/uIFjfmFZMXTF36jBHVDbvnD0VHpN1dPDpW8ScMDqSzkP/B1MIr
         vmpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jzm6W1Z6bNw1R7/BddIGRoaarTGeMoKKc61rcr/dEKQ=;
        fh=h2SNP3YVr2EAuu8cGw5uelt9X1/qYBTnCCce2+BLBIY=;
        b=FvIXyghjmH+3jsaRTFyzSrCh7jzSqVEnCm7zE+KIIiBMA4Dc9a//2RvubYzuzSfofl
         qm6Q7KFFPSifssQix36/qmlmkFdMrAhg+/OsslyFxFlep47uJA8OXV8skcOhtiNBSfUN
         Zaf6xxAgO4TI2gE08noTVJkYybPzAw0zVPJMHHc+o5Hsp6WcACIhVHk+9azLaNLrfQ3T
         PoVcOYE6eGu0jdmsY+Sz0+1wLfvdoSZvoV5CnHV/28obNHtFoehW2/oY4kbqUmndKIU1
         CMBEJHVhaWjMLfpdGr2BaG0xen7m8WcE08t0iB8wm7GXLpLSe8eZR4fJDreJUXJMXcnG
         XKWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776361512; x=1776966312; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzm6W1Z6bNw1R7/BddIGRoaarTGeMoKKc61rcr/dEKQ=;
        b=DzRs5xifvQR8m+EHbOKqUc33vjIteqJEAL+2NgiIeM8lQAuFKkl4nhYucq9ImfLyVE
         ma/w8edwfAyREG2xcOYjd7IQHW6s1cWPQLrPMjLEI090D1TqXuCcZqnKixaH/q5wbDgH
         ke4en5NNfP8syt/kFywPeGj5hzpDf1YbbV4p4vh+tgjjNwvy98wDx17IzXKgyM2u5psE
         8gdYXEicxh6BFca8Z06pPPI1iT7g/2wpYpkqZqLW9Rws22tz9mumzTM3XNW2ku02VTi2
         sJjFGk5SzzcoAcdhoB96Fzd+5Gsq9IKYoeI9VqziyPE3WVXaNx02intd/9rLdVeC02YI
         5qSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776361512; x=1776966312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jzm6W1Z6bNw1R7/BddIGRoaarTGeMoKKc61rcr/dEKQ=;
        b=PVe/NROpcUODCyIThPtz01TJNuP3D2fLCU+sNXOz0aLyN32A0yganWLdXZfiqo6DJM
         MP9jq5qaCUyWxO+Qq8B7CEAmvlsj8mOS5d8i/KBZF3gTAlYbcUvJwt3Ye62sZX9i8eFs
         2rJ/zRb0ZkVQgQk+RrJ35GssxTBRZpV9REbh/vGTicpPDGpxxHgdro5gKBH9NPxobvGE
         GDLKfyWAsXlmENBOog4C8SwPczvFRpA+DiSNjRe8QUTRCxuyBwTEUoHemutxqwAkdTlu
         3iX3tC8bteY8yHpHsw+GCE8DgsxusYcfRZ4qNKuIh9pkfatBCOnPK5f9mZUW5idRJosE
         bdLA==
X-Forwarded-Encrypted: i=1; AFNElJ8Vsbm/GEnq1copAnDC3TSo/S+DN+9p1V4L33/FWAITshJaUNnx/FRrdg11ZV7r4oCGWgWkPZW6tfBCZGKTAyAn@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe0MB7yE0TbWZXQKWlOpEtrGwojkcNVqMI/gvMSq6c1kEaneXC
	j7UtEJcLI3EEOOoChaOrISfBxSjMdmFYV3dVcclMWO1hEXpBjPXKb0uyADrFh6Lx2YWQotDswAt
	7lvgVJZg+5v8PqZLfA4b4rxHP7AdyUMjE62FoQWp4
X-Gm-Gg: AeBDiesuY6uhLrFFItupd/2cRFgBprFDv+/Grjkf0SWjkbEjZoetfMVfGfOo3pLlRLj
	bXaEV/8JzT9vIYzLwRhPikVSetE5XPeRcq1YSbBgaC/verAaQw/LkDkdoqeZPVuLXCGcWrJ1R5t
	9yoLGRs6daeM3rzy7SxayLFg2QAyHqi2z/OnEQEoOIKnpUZSS7Chixg+z20HMYnj7QMsjcQ9qhw
	YNfD7KOuhoiVOciGWDjoDXjQPF4nJE4JylL5erR3Ohk6Noyhe1ubZ1UpV7E8ByhHdMD81Ve/1Jy
	UpQs74NdHY5wwi4MfxijB6Eyxlpvq8nK/9gx6/3AGOoPewmKRy932PAvKHY=
X-Received: by 2002:a05:6214:4b0c:b0:8ac:a0b0:64d5 with SMTP id
 6a1803df08f44-8b025ec904dmr2618146d6.37.1776361511320; Thu, 16 Apr 2026
 10:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260318155413.793430-1-steven.price@arm.com> <CABpDEukEO4Y_fg8fv5Nr1_Pw_qOK=2UmioXk=WyPEzoEprPcGA@mail.gmail.com>
 <d661a24c-6619-4734-96bd-075d3416e809@arm.com> <CABpDEumAVf02uOS5Bj07EDyuU=z9FV-iocQU1j7gFM5z0BeV_w@mail.gmail.com>
 <97d26e6e-b565-447f-95eb-2ece0755fe57@arm.com>
In-Reply-To: <97d26e6e-b565-447f-95eb-2ece0755fe57@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Thu, 16 Apr 2026 10:44:59 -0700
X-Gm-Features: AQROBzAsj7mxI_HflVua65l9TneHSVQXwlFi8oSRcQgYzKeZgfQilvBV9R8pGsg
Message-ID: <CABpDEu=vbo9cDL1PKh2h9JjWCHPP3M9-ueogkPc571c1OQPuhA@mail.gmail.com>
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_104513_639062_7304DF04 
X-CRM114-Status: GOOD (  58.01  )
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

On Thu, Apr 16, 2026 at 4:05=E2=80=AFAM Suzuki K Poulose <suzuki.poulose@ar=
m.com> wrote:
>
> On 16/04/2026 00:27, Alper Gun wrote:
> > On Wed, Apr 15, 2026 at 4:01=E2=80=AFAM Steven Price <steven.price@arm.=
com> wrote:
> >>
> >> On 14/04/2026 22:40, Alper Gun wrote:
> >>> On Wed, Mar 18, 2026 at 8:54=E2=80=AFAM Steven Price <steven.price@ar=
m.com> wrote:
> >>>>
> >>>> This series adds support for running protected VMs using KVM under t=
he
> >>>> Arm Confidential Compute Architecture (CCA).
> >>>>
> >>>> New major version number! This now targets RMM v2.0-bet0[1]. And unl=
ike
> >>>> for Linux this represents a significant change.
> >>>>
> >>>> RMM v2.0 brings with it the ability to configure the RMM to have the
> >>>> same page size as the host (so no more RMM_PAGE_SIZE and dealing wit=
h
> >>>> granules being different from host pages). It also introduces range
> >>>> based APIs for many operations which should be more efficient and
> >>>> simplifies the code in places.
> >>>>
> >>>> The handling of the GIC has changed, so the system registers are use=
d to
> >>>> pass the GIC state rather than memory. This means fewer changes to t=
he
> >>>> KVM code as it looks much like a normal VM in this respect.
> >>>>
> >>>> And of course the new uAPI introduced in the previous v12 posting is
> >>>> retained so that also remains simplified compared to earlier posting=
s.
> >>>>
> >>>> The RMM support for v2.0 is still early and so this series includes =
a
> >>>> few hacks to ease the integration. Of note are that there are some R=
MM
> >>>> v1.0 SMCs added to paper over areas where the RMM implementation isn=
't
> >>>> quite ready for v2.0, and "SROs" (see below) are deferred to the fin=
al
> >>>> patch in the series.
> >>>>
> >>>> The PMU in RMM v2.0 requires more handling on the RMM-side (and
> >>>> therefore simplifies the implementation on Linux), but this isn't qu=
ite
> >>>> ready yet. The Linux side is implemented (but untested).
> >>>>
> >>>> PSCI still requires the VMM to provide the "target" REC for operatio=
ns
> >>>> that affect another vCPU. This is likely to change in a future versi=
on
> >>>> of the specification. There's also a desire to force PSCI to be hand=
led
> >>>> in the VMM for realm guests - this isn't implemented yet as I'm wait=
ing
> >>>> for the dust to settle on the RMM interface first.
> >>>>
> >>>> Stateful RMI Operations
> >>>> -----------------------
> >>>>
> >>>> The RMM v2.0 spec brings a new concept of Stateful RMI Operations (S=
ROs)
> >>>> which allow the RMM to complete an operation over several SMC calls =
and
> >>>> requesting/returning memory to the host. This has the benefit of
> >>>> allowing interrupts to be handled in the middle of an operation (by
> >>>> returning to the host to handle the interrupt without completing the
> >>>> operation) and enables the RMM to dynamically allocate memory for
> >>>> internal tracking purposes. One example of this is RMI_REC_CREATE no
> >>>> longer needs "auxiliary granules" provided upfront but can request t=
he
> >>>> memory needed during the RMI_REC_CREATE operation.
> >>>>
> >>>> There are a fairly large number of operations that are defined as SR=
Os
> >>>> in the specification, but current both Linux and RMM only have suppo=
rt
> >>>> for RMI_REC_CREATE and RMI_REC_DESTROY. There a number of TODOs/FIXM=
Es
> >>>> in the code where support is missing.
> >>>>
> >>>> Given the early stage support for this, the SRO handling is all conf=
ined
> >>>> to the final patch. This patch can be dropped to return to a pre-SRO
> >>>> state (albeit a mixture of RMM v1.0 and v2.0 APIs) for testing purpo=
ses.
> >>>>
> >>>> A future posting will reorder the series to move the generic SRO sup=
port
> >>>> to an early patch and will implement the proper support for this in =
all
> >>>> RMI SMCs.
> >>>>
> >>>> One aspect of SROs which is not yet well captured is that in some
> >>>> circumstances the Linux kernel will need to call an SRO call in a
> >>>> context where memory allocation is restricted (e.g. because a spinlo=
ck
> >>>> is held). In this case the intention is that the SRO will be cancell=
ed,
> >>>> the spinlock dropped so the memory allocation can be completed, and =
then
> >>>> the SRO restarted (obviously after rechecking the state that the
> >>>> spinlock was protecting). For this reason the code stores the memory
> >>>> allocations within a struct rmi_sro_state object - see the final pat=
ch
> >>>> for more details.
> >>>>
> >>>> This series is based on v7.0-rc1. It is also available as a git
> >>>> repository:
> >>>>
> >>>> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v13
> >>>>
> >>>>
> >>>
> >>> Hi Steven,
> >>>
> >>> I have a question regarding host kexec and kdump scenarios, and
> >>> whether there is any plan to make them work in this initial series.
> >>>
> >>> Intel TDX and AMD SEV-SNP both have a firmware shutdown command that
> >>> is invoked during the kexec or panic code paths to safely bypass
> >>> hardware memory protections and boot into the new kernel. As far as
> >>> I know, there is no similar global teardown command available for
> >>> the RMM.
> >>
> >> Correct, the RMM specification as it stands doesn't provide a mechanis=
m
> >> for the host to do this. The host would have to identify all the realm
> >> guests in the system: specifically the address of the RDs (Realm
> >> Descriptors) and RECs (Realm Execution Contexts). It needs this to tea=
r
> >> down the guests and be able to undelegate the memory.
> >>
> >> It's an interesting point and I'll raise the idea of a "firmware
> >> shutdown command" to make this more possible.
> >>
> >>> What is the roadmap for supporting both general kexec and
> >>> more specifically kdump (panic) scenarios with CCA?
> >>
> >> I don't have a roadmap I'm afraid for these. kexec in theory would be
> >> possible with KVM gracefully terminating all realms. For kdump/panic
> >> that sort of graceful shutdown isn't really appropriate (or likely to
> >> succeed).
> >>
> >
> > Thanks Steven for the clarification.
> >
> > For us, kdump is highly critical as it is our primary diagnostic tool
> > for host crashes. Without it, monitoring and debugging at fleet scale
> > would become unmanageable.
> >
> > To confirm my understanding of the current architecture: if a host
> > panics while no Realms are actively running (and therefore no pages
> > are currently in the delegated state), the standard kdump extraction
> > should work perfectly fine without any modifications, correct?
>
> This may not be true. We could have pages donated to RMM for GPT,
> Tracking etc. So, unless Linux keeps track of them, it may be
> unsafe for a crash kernel to access them.
>
> >
> > Regarding the KVM tracking structures (RDs, RECs, RTTs, etc.) when VMs
> > are running, perhaps we could use `vmcoreinfo` to export the physical
> > addresses of these delegated pages. This would allow tools like
>
> Thinking of this, do we really need to ? We could access the pages from
> "vmcore" read and handle the GPFs for such accesses and give out 0s
> for the Granules. Anyways, we can't get access to the data on those
> pages that are still in Realm PAS.
>

I like the idea of handling the GPFs directly during vmcore reads for
kdump case. That's much simpler\cleaner solution.

> > `makedumpfile` to explicitly filter them out. I assume these pages must
> > remain hardware-locked while the VMs are active.
>
>
>
> >
> > Long-term, having an architectural shutdown command - similar to the
> > TDH.SYS.DISABLE command in Intel TDX - would be incredibly useful. It
> > would allow the kdump kernel to safely bypass these hardware security
> > checks, especially when extracting host-side KVM state.
>

> For kexec, may be we could do this. Alternatively we could try to
> reclaim everything back, (GPTs, Tracking) before kexec-reboot.
>

Agreed. Reclaiming all delegated memory prior to the kexec reboot
makes perfect sense.

> >
> > As for the protected realm memory, I assume that is an easier problem.
> > We naturally want to exclude guest pages from a host dump regardless
> > of whether they are Realm pages or not. However, accidental touches
> > are still fatal.
> >
> >> There is also some RMM configuration which cannot be repeated (see
> >> RMI_RMM_CONFIG_SET) - which implies that the kexec kernel must be
> >> similar to the first kernel (i.e. same page size).
>
> That is true, the page sizes must match. RMM spec is updated to probe
> the state of the RMM and detect if it can do the CONFIG_SET
>
> Suzuki
>
> >>
> >> Thanks,
> >> Steve
>

