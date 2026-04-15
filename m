Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14DAF433CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 23:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+QG3xhCQwRR1qC6hXy7NcWy7080+KY3YK+kXqaECJ0=; b=A+cKIFzoHlcZfF6eSwo6nN5ppd
	oA6o3Id8Btx0uSiKZnMhcHmIUhQIgrjZvfbpeGaP4dfmGytrA1EpiiR9O2lugE8ocURqe3ls4nklQ
	OI/mwTCBpYQ4KT2r0xjdmn/oTZ2NlewoFx8oBKHsMsVvLeY40LgO8dHujHD8GHs94kJnBJwnfbHvf
	94TJ2cH7gKsmzL7rU/3okqWq0xtWBLzRAenlTAUMSqL9cPn61mCPF49YG59HHekY6YXU9DdH461SR
	r/GAxri26kfAxxSP88JDZEbcvyUBjrgNrQHDknmYJpt6ZnG9YSJ0MTof6KfYOxq6+5RH4CvuuShDi
	WqXZ0eEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9dl-00000001kmH-46Z4;
	Wed, 15 Apr 2026 23:27:25 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9dj-00000001klu-3CTP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 23:27:25 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8a151012558so85943346d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 16:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776295641; cv=none;
        d=google.com; s=arc-20240605;
        b=GKlYz3CbRvyXxyhhuY+MHqIy7ZS78vKV4IlDScNFbza5AargCCxYoIUVTjp/SMeqNW
         qzaRBIEmv8YURqcjeHG9V/fQ4NcjJ3mvoEgucYMIwOsMkx8gYsB5yLsWiMiOKvaopigg
         OrGyER9lMvxE5X5iTn+G93ctcFhlFcLNUP6T2txD1MidgHJdrIgbdcBjJdAxAGuf8JxD
         kORLv2OBn85sn6lG7uaRGuOZtELnSD/C7oXCTRYLODNon2FbtS1cWUHs/rwZOM79gnRO
         apG8e1du0fKurDlrvMb+3WxyvSf66PP6PSM9kIUjksUVvp6TVn+L2D1alAZVbhw/ReYo
         wvCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x+QG3xhCQwRR1qC6hXy7NcWy7080+KY3YK+kXqaECJ0=;
        fh=YoIwXIag2dUYMMwxdx9rsFeMFym/WLOMaJxD+t1yDtY=;
        b=DD/pOV3RGA1sR3s1sUeQFKJhUMsadJsmFABqu/JrTBRtd83xOQAY5U5HGLcZfITQvF
         uHNiomhtRY9kp7/0xEykj13+NlmJhiYjJXn8AB0vCnWTnbfMbOaAkxovBUzEY9Yr7Zqc
         KmT1kEfgAx6PHw3Hz0BbGEP0rEqjBeM9VY2zTwZw/EbxXm5Ilgka01woKBZlCMIfx3t7
         bzj/8rRk98x3vEPqYVhNfZf7Mm6UIiK2/UHQeV26QZcaUOc8F4by4doK3w3cdKC2zSqr
         60XUQFfPhO5OZLUma9Orz+a6UEpKAy+caeNuCwFYqvRybfSuDqUTBVc4nmRsASnVpQp5
         3/hg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776295641; x=1776900441; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+QG3xhCQwRR1qC6hXy7NcWy7080+KY3YK+kXqaECJ0=;
        b=X2jRFVjw3ptBCGAKZsm6w0MjcmoeLj8AHCMIPSFDOn2K8W+9wQA2d8QPpDIeJ9gZyu
         bWzu8Ap+w13sJcOrt0S/9GZroDLe90unj2agYKZKsLf1DRA29MOTXGp5WYQStWKgA7qA
         HdYZiyBV4AnlBI1Khc0hMXoZ7DVX1OeZtlyh2aJd7Kwi39Le+B0jCOno4rQ3wKdsg8dJ
         bjdOcbbFnCciNkWLWnP0lc4sndPNduujez7QYH6uEFVpt9nsKYvBRUR19Xdhxd865o2O
         eANKxvPRjeIPFhFf0dG0Io7TEkIKNmjafgjY1ckISkGDBDZ48Gvf2nGCppO550s1y33p
         Ghig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295641; x=1776900441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x+QG3xhCQwRR1qC6hXy7NcWy7080+KY3YK+kXqaECJ0=;
        b=OKus0EYY/11GodEhuAxb/3c/BAfNBCarfP2dYXExUSDR2WXQBGEZkS/TNr14UZ+BKz
         +S71ggNyQ4rnJFp0ubK5vG1xSy3GyuWCMwGAzf18E4ccJpTZi/OdB5o+r9kHECg+2RSD
         xJvJMHdPDqTNrNZyEXo4SwAN2UboWu3E05c0IknwgfQR4StN/SQyzj63xIIWYoEOowxI
         pgBH6vaIfT41tqGTGIvPX4kUa0gqSXOXR/p3qlrDeOkt6vs3yCuVuhCVibanyJY3LICz
         uWcL5plyghe49RHKYUkczhkNRhJuaJOGDHJ9/jp6F9sbtXvrThMFX3RPpLuh5IW5q1GI
         Y+qg==
X-Forwarded-Encrypted: i=1; AFNElJ8C8gCzD+bnMXtRdXQIoC/uN01aZt5e3hPiZPJlbcrUyy1PHSsSGd0tsHJnKF+Md2Kbv/i1dpSiWIyfs4oaY+ny@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk94Uz7zK08Jsn9iqtwB5SkDcK5Gq+dG3gCNaHjYcAI9n6iR5g
	5eQXXFFEx55VxQROjl/Cl6HAsdTuAlAptf70pD48YQG5okHph95KXEa0+ltx/ZcOw4Iat5G/aag
	BaYe0CbXnWMm/ZsnmsNdDe6WpQn9QR8rPnad+jnbe
X-Gm-Gg: AeBDieutQmbu3gWxnuKVunAVGioWZLuSlYSWbfKYAwWJdHKCJajmc0wQU72JJEAP9lV
	TIpoY7M06MdE0Q9HH/0KJ/zCnzL+Q3T+cy+aPQeX1hGOnKmWARiA8iOH1LpLZbzGhRmotlUYcb2
	/LyMKqXMD+7KWclyvizlx7BuztFpHgQPx/l3FG+LRV5pYPG/+Mik3+swZFK92kYW8SFHTuzAvm3
	dq+C8DfEBHLhCQoIVlJcjkzv8PALWuLb2mQYT+dmRZLzA/+x3XzknCW3GJe39QmtYB9aVbNBlbk
	o4mZhxKmklZRzBA9POr4T62pHz8rG7Dc5O9WTqNUtgG0K8+J8bBn9c3P0RA=
X-Received: by 2002:ad4:5baf:0:b0:8ac:ab13:8f15 with SMTP id
 6a1803df08f44-8acab1391c9mr232004096d6.7.1776295640870; Wed, 15 Apr 2026
 16:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260318155413.793430-1-steven.price@arm.com> <CABpDEukEO4Y_fg8fv5Nr1_Pw_qOK=2UmioXk=WyPEzoEprPcGA@mail.gmail.com>
 <d661a24c-6619-4734-96bd-075d3416e809@arm.com>
In-Reply-To: <d661a24c-6619-4734-96bd-075d3416e809@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Wed, 15 Apr 2026 16:27:08 -0700
X-Gm-Features: AQROBzCS-xITaK7ztBjux37Usj-fD7VQebkqcRVamG9jxnrdFdKeF2d2D3KViso
Message-ID: <CABpDEumAVf02uOS5Bj07EDyuU=z9FV-iocQU1j7gFM5z0BeV_w@mail.gmail.com>
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_162723_831756_8F222B02 
X-CRM114-Status: GOOD (  55.75  )
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

On Wed, Apr 15, 2026 at 4:01=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> On 14/04/2026 22:40, Alper Gun wrote:
> > On Wed, Mar 18, 2026 at 8:54=E2=80=AFAM Steven Price <steven.price@arm.=
com> wrote:
> >>
> >> This series adds support for running protected VMs using KVM under the
> >> Arm Confidential Compute Architecture (CCA).
> >>
> >> New major version number! This now targets RMM v2.0-bet0[1]. And unlik=
e
> >> for Linux this represents a significant change.
> >>
> >> RMM v2.0 brings with it the ability to configure the RMM to have the
> >> same page size as the host (so no more RMM_PAGE_SIZE and dealing with
> >> granules being different from host pages). It also introduces range
> >> based APIs for many operations which should be more efficient and
> >> simplifies the code in places.
> >>
> >> The handling of the GIC has changed, so the system registers are used =
to
> >> pass the GIC state rather than memory. This means fewer changes to the
> >> KVM code as it looks much like a normal VM in this respect.
> >>
> >> And of course the new uAPI introduced in the previous v12 posting is
> >> retained so that also remains simplified compared to earlier postings.
> >>
> >> The RMM support for v2.0 is still early and so this series includes a
> >> few hacks to ease the integration. Of note are that there are some RMM
> >> v1.0 SMCs added to paper over areas where the RMM implementation isn't
> >> quite ready for v2.0, and "SROs" (see below) are deferred to the final
> >> patch in the series.
> >>
> >> The PMU in RMM v2.0 requires more handling on the RMM-side (and
> >> therefore simplifies the implementation on Linux), but this isn't quit=
e
> >> ready yet. The Linux side is implemented (but untested).
> >>
> >> PSCI still requires the VMM to provide the "target" REC for operations
> >> that affect another vCPU. This is likely to change in a future version
> >> of the specification. There's also a desire to force PSCI to be handle=
d
> >> in the VMM for realm guests - this isn't implemented yet as I'm waitin=
g
> >> for the dust to settle on the RMM interface first.
> >>
> >> Stateful RMI Operations
> >> -----------------------
> >>
> >> The RMM v2.0 spec brings a new concept of Stateful RMI Operations (SRO=
s)
> >> which allow the RMM to complete an operation over several SMC calls an=
d
> >> requesting/returning memory to the host. This has the benefit of
> >> allowing interrupts to be handled in the middle of an operation (by
> >> returning to the host to handle the interrupt without completing the
> >> operation) and enables the RMM to dynamically allocate memory for
> >> internal tracking purposes. One example of this is RMI_REC_CREATE no
> >> longer needs "auxiliary granules" provided upfront but can request the
> >> memory needed during the RMI_REC_CREATE operation.
> >>
> >> There are a fairly large number of operations that are defined as SROs
> >> in the specification, but current both Linux and RMM only have support
> >> for RMI_REC_CREATE and RMI_REC_DESTROY. There a number of TODOs/FIXMEs
> >> in the code where support is missing.
> >>
> >> Given the early stage support for this, the SRO handling is all confin=
ed
> >> to the final patch. This patch can be dropped to return to a pre-SRO
> >> state (albeit a mixture of RMM v1.0 and v2.0 APIs) for testing purpose=
s.
> >>
> >> A future posting will reorder the series to move the generic SRO suppo=
rt
> >> to an early patch and will implement the proper support for this in al=
l
> >> RMI SMCs.
> >>
> >> One aspect of SROs which is not yet well captured is that in some
> >> circumstances the Linux kernel will need to call an SRO call in a
> >> context where memory allocation is restricted (e.g. because a spinlock
> >> is held). In this case the intention is that the SRO will be cancelled=
,
> >> the spinlock dropped so the memory allocation can be completed, and th=
en
> >> the SRO restarted (obviously after rechecking the state that the
> >> spinlock was protecting). For this reason the code stores the memory
> >> allocations within a struct rmi_sro_state object - see the final patch
> >> for more details.
> >>
> >> This series is based on v7.0-rc1. It is also available as a git
> >> repository:
> >>
> >> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v13
> >>
> >>
> >
> > Hi Steven,
> >
> > I have a question regarding host kexec and kdump scenarios, and
> > whether there is any plan to make them work in this initial series.
> >
> > Intel TDX and AMD SEV-SNP both have a firmware shutdown command that
> > is invoked during the kexec or panic code paths to safely bypass
> > hardware memory protections and boot into the new kernel. As far as
> > I know, there is no similar global teardown command available for
> > the RMM.
>
> Correct, the RMM specification as it stands doesn't provide a mechanism
> for the host to do this. The host would have to identify all the realm
> guests in the system: specifically the address of the RDs (Realm
> Descriptors) and RECs (Realm Execution Contexts). It needs this to tear
> down the guests and be able to undelegate the memory.
>
> It's an interesting point and I'll raise the idea of a "firmware
> shutdown command" to make this more possible.
>
> > What is the roadmap for supporting both general kexec and
> > more specifically kdump (panic) scenarios with CCA?
>
> I don't have a roadmap I'm afraid for these. kexec in theory would be
> possible with KVM gracefully terminating all realms. For kdump/panic
> that sort of graceful shutdown isn't really appropriate (or likely to
> succeed).
>

Thanks Steven for the clarification.

For us, kdump is highly critical as it is our primary diagnostic tool
for host crashes. Without it, monitoring and debugging at fleet scale
would become unmanageable.

To confirm my understanding of the current architecture: if a host
panics while no Realms are actively running (and therefore no pages
are currently in the delegated state), the standard kdump extraction
should work perfectly fine without any modifications, correct?

Regarding the KVM tracking structures (RDs, RECs, RTTs, etc.) when VMs
are running, perhaps we could use `vmcoreinfo` to export the physical
addresses of these delegated pages. This would allow tools like
`makedumpfile` to explicitly filter them out. I assume these pages must
remain hardware-locked while the VMs are active.

Long-term, having an architectural shutdown command - similar to the
TDH.SYS.DISABLE command in Intel TDX - would be incredibly useful. It
would allow the kdump kernel to safely bypass these hardware security
checks, especially when extracting host-side KVM state.

As for the protected realm memory, I assume that is an easier problem.
We naturally want to exclude guest pages from a host dump regardless
of whether they are Realm pages or not. However, accidental touches
are still fatal.

> There is also some RMM configuration which cannot be repeated (see
> RMI_RMM_CONFIG_SET) - which implies that the kexec kernel must be
> similar to the first kernel (i.e. same page size).
>
> Thanks,
> Steve

