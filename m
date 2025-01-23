Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00118C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 20:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhXUcAh2hlUnon67PlT/agcOsGJGx82H3mKA5T5zmFk=; b=xKJ9JIRHaBcQsDsgSKU8BBGlKz
	pZ9h8ZKZrPj4LyuRSr81MvSNUF86KdW/YkcWNe3OJ/YglQysmdrwSV5f8TUw42W7aWnUi6k7E3ir7
	Czday5pLMajNFlPv6M5pSY961ms/UsK7zLUQwhkF37KF7+U7+SNYW2T3hOfOsHkavixH/0vSa2uUg
	ylptf2ETP+DJfBzk4+o2qSUKx59OIlCmKY425EWZotcmEwwK5xivCzW5+TVSt59w/o9w7balY/zfw
	3moTnz9UPkhoZ2XgPL/ESRXFAvv0cpB6GFE2DVL3VJbXIDsIeuvRZ3Q/xfomsZWprKRY6Nddi9ku3
	OpXbxdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3r5-0000000DFWQ-2iet;
	Thu, 23 Jan 2025 20:31:11 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3pm-0000000DFDH-2r82
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 20:29:51 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ee9b1a2116so307395a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 12:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737664190; x=1738268990; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhXUcAh2hlUnon67PlT/agcOsGJGx82H3mKA5T5zmFk=;
        b=CMhTp07QUnRWRnX2GhckrQ0VmlT/Eh2gybxFVpurP3t2VO603jfRDUUTRi6/GrWQOf
         zu2CbJcB+gFpM0CYqpZqGplE7T+dIxA+dKVzm5SFpaApkX6e9XvN0E/u/Hgvh+KQ+cGC
         6ImurvAN7i8UgEGjgH4vihBVAfaa6rqSV5jiwZWZp6cnQXPZvKko7170XOltR9nF9/hc
         Z5yW2hOnmXS1Y1N6T6DfsuP2mbaaGA2Vl4s2MxhZU4cCvvc8AIreo4Lde7+R/SGNZAna
         gJprrGTzvBemopp8O0w+ywV3KrxHvqYDBgLddpeOwhPgLiKIOC5i9qQ7QmFoOxNwr6sS
         Ucdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737664190; x=1738268990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhXUcAh2hlUnon67PlT/agcOsGJGx82H3mKA5T5zmFk=;
        b=uYJkHOyUtOQ3XQgzH8v+Q6wKOd3JRV7JHbnRJAFj3NzVie07OAbfpJqcs6X/BgMN+h
         2EkeRNcoYRRX/F1Uuk44y/GYuqWxBkWDufkazTEtS1A6Xxz2pxhWBvFWg3tVM7jqi2hE
         +qoAJT8p5sXjbAF7r4TwCfgriJwTNH1RXQiLXzYnl+5jWPabsvQEdCrBZeOmHOIjbLbw
         CYo9UybDJkv9Vp5euIxDvwAsoiu8jmVyJ6yXTkBclozS27Pz/Qe9Fqh+aUnBge9rv6lj
         lNrfo0JRR9SfKvPY0UDNuxWRR8s+fzMgCRTX5m756JiUUVK2CZBS1R7rDJ+mItg4IvdC
         RkMA==
X-Forwarded-Encrypted: i=1; AJvYcCX7+gclcEAywjB2BBISnLGNYs8eIS5f8hBYFoaUwoEcAU9ZrTYeYPRsfcLMm/5O7bK3p0w3wCEUt/K3OVWvwo0I@lists.infradead.org
X-Gm-Message-State: AOJu0YwWCEBb1S2MTn5a+hHi11M4MnphhDstKoUQ/Ewza5fo8r3aGOLy
	l1ux+oiX4gCZlXQ31M0uCwdhltGds5/UgwayFjq5b40YjHk9Str0zn6Im9Goto6oal3m1DPrmry
	h6GxCYBfkgUPQF/VdBqJXaoq2oU8=
X-Gm-Gg: ASbGnctLb5H3iXKKo4UYqUkKJUiCMs9KVe4BSzjpcNnkOgD1rjWmfkwLhtesaZws0xj
	2GYUXh3f/3zCGvwIgZsUzXkGmiR/5YGUZyJydyz0V751dN0XQzDpORzvT/IM/gw==
X-Google-Smtp-Source: AGHT+IEl/Vyc8QmUbX/0GWfiscTSIPf6SvYZLBKkQKTl7lLUFAx/A3wbK7xRIXAG5nlkFHCAISdwVSqrdyt6dZww7dM=
X-Received: by 2002:a05:6a00:3a1d:b0:72d:8a01:bb6c with SMTP id
 d2e1a72fcca58-72daf7a1db7mr13737192b3a.0.1737664189916; Thu, 23 Jan 2025
 12:29:49 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com> <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com>
In-Reply-To: <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 23 Jan 2025 15:29:38 -0500
X-Gm-Features: AWEUYZlzwCzK_Ns_Li_73IXsL90hsOwVuugbU7LWSAnvDp0ILCSA2EsoYowsZGM
Message-ID: <CACu1E7Hw3WxNzwdA2A8hG2yWNVMLy=r=68_X0C3tkVttgRzXVQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Prakash Gupta <quic_guptap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_122950_720560_1B9481C6 
X-CRM114-Status: GOOD (  36.93  )
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

On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_guptap@quicinc.=
com> wrote:
>
> On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_guptap@quic=
inc.com> wrote:
> > >
> > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
> > >
> > > > +     /*
> > > > +      * On some implementations FSR.SS asserts a context fault
> > > > +      * interrupt. We do not want this behavior, because resolving=
 the
> > > > +      * original context fault typically requires operations that =
cannot be
> > > > +      * performed in IRQ context but leaving the stall unacknowled=
ged will
> > > > +      * immediately lead to another spurious interrupt as FSR.SS i=
s still
> > > > +      * set. Work around this by disabling interrupts for this con=
text bank.
> > > > +      * It's expected that interrupts are re-enabled after resumin=
g the
> > > > +      * translation.
> > > > +      *
> > > > +      * We have to do this before report_iommu_fault() so that we =
don't
> > > > +      * leave interrupts disabled in case the downstream user deci=
des the
> > > > +      * fault can be resolved inside its fault handler.
> > > > +      *
> > > > +      * There is a possible race if there are multiple context ban=
ks sharing
> > > > +      * the same interrupt and both signal an interrupt in between=
 writing
> > > > +      * RESUME and SCTLR. We could disable interrupts here before =
we
> Not sure if multiple context bank with shared interrupt supported for
> arm-smmu driver, but even if does than context fault handler they would
> operate on their respective context register space, so I don't see the ra=
ce
> at context register update.
>
> > > > +      * re-enable them in the resume handler, leaving interrupts e=
nabled.
> > > > +      * Lock the write to serialize it with the resume handler.
> > > > +      */
> > > > +     if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
> > > > +             u32 val;
> > > > +
> > > > +             spin_lock(&smmu_domain->cb_lock);
> > > > +             val =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR=
);
> > > > +             val &=3D ~ARM_SMMU_SCTLR_CFIE;
> > > > +             arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
> > > > +             spin_unlock(&smmu_domain->cb_lock);
> > > > +     }
> > > > +
> > > > +     /*
> > > > +      * The SMMUv2 architecture specification says that if stall-o=
n-fault is
> > > > +      * enabled the correct sequence is to write to SMMU_CBn_FSR t=
o clear
> > > > +      * the fault and then write to SMMU_CBn_RESUME. Clear the int=
errupt
> > > > +      * first before running the user's fault handler to make sure=
 we follow
> > > > +      * this sequence. It should be ok if there is another fault i=
n the
> > > > +      * meantime because we have already read the fault info.
> > > > +      */
> qcom_adreno_smmu_get_fault_info() reads the fault info as part of client
> fault hanlder. So it would not be ok to clear FSR before reporting the
> fault to client.

That's a good point, but as long as stall-on-fault is enabled it
doesn't matter because subsequent transactions that fault will be
stalled. Patch 3 of this series disables stall-on-fault after the
first fault in drm/msm, but we don't care as much about the accuracy
of those subsequent faults.

>
> > > The context would remain stalled till we write to CBn_RESUME. Which i=
s done
> > > in qcom_adreno_smmu_resume_translation(). For a stalled context furth=
er
> > > transactions are not processed and we shouldn't see further faults an=
d
> > > or fault inerrupts. Do you observe faults with stalled context?
> >
> > Yes. I've observed that on MMU-500 writing RESUME before the interrupt
> > has been cleared doesn't clear SS. This happened with v2 in the case
> > where there was already a devcoredump and drm/msm called
> > qcom_adreno_smmu_resume_translation() immediately from its fault
> > handler, and we'd get a storm of unhandled interrupts until it was
> > disabled. Given that the architecture spec says we're supposed to
> > clear the interrupt first this may have been an attempt to "help"
> > developers.
> >
>
> Just to clarify, present sequence is:
> 1. context fault with stall enable. FSR.SS set.
> 2. Report fault to client
> 3. resume/terminate stalled transaction
> 4. clear FSR
>
> At what point when you try #2->#3->#4 or #4->#2->#3 sequence, is FSR.SS
> cleared and interrupt storm is observed.  The way CFIE disable is helping
> with current patch indicates write FSR is unstalling context and subseque=
nt
> transactions are faulted.  Do you stop getting interrupt storm after writ=
e
> RESUME. If you can mention your SCTLR configuration and FSR state in test
> sequence, it would be clearer.
>
> An aside, If reducing delay between FSR and RESUME write helps then both
> can be done as part of qcom_adreno_smmu_resume_translation(). This will
> follow spec recommendation and also make sure fault registers are not
> cleared before reporting fault to client.
>
> Thanks,
> Prakash

