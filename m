Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF538C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 20:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2QDlQ7ciLXyACEdbXlxDxDDAFIjM/sxdbl1ogTU8Rc=; b=BG13AWHre+78acLqVhOZVW32T2
	hA9jsiQJqAMy0ErLPkyw+bBAQHakJWCvsf/jgE/v7u/omeplQA7u3RIA/5RRHkNfAykptXdGTYS89
	0iH3kRPVdYmgSuVblQcf2p22B8bUpWGMVlJgSZiE4sCrkwVLe9U9TqhLokg0AairrhNR+1rS5Zrv5
	ysM+GGbbZicQQrWUdPCD9dsuctFmP9JmhI51CXSRTd+s3TFz9e0X/r8If8aDnmm1jYiBga0jA7qDS
	/8rS8Uq29aryHUUr18l463ekxiyFSY/1P2WIQVNwK9DXlkPRrB5QJfs0Sn77fSTbawgzQgbw2Waa3
	A+N9tf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3cC-0000000DDQo-3eNk;
	Thu, 23 Jan 2025 20:15:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3au-0000000DDNK-1b7X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 20:14:29 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-216325f516fso2687075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 12:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737663268; x=1738268068; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2QDlQ7ciLXyACEdbXlxDxDDAFIjM/sxdbl1ogTU8Rc=;
        b=W4D6qa2bCprbEv8sNpqlhBk234DJJVXOgePbN/JgyMg8lwSjPZNgvH1GpK2Jht7sBy
         LSoNipyomLzK/CyP+RTrIbSm0ve9o0Cb4tvlNL/6GMQRrMB434M0Vi+KnNRGPv0iYvVl
         1mt6TY453SxiykPoOZ00+IbD2mBPt7VeD4erTpGH1MKgRsEt0uFSr533B2XBJwHZYCDn
         CC7fByVlqmRMudyrrZrRaCxdLOh4+1iOV1/1YkhVm629AMfeyVCOSj4MSkN/ztyA3l56
         e2xCUfuzECAUI0hHwTRaVw2S5ptvU9C9LbJbA+M0nHECUrju8yT2nzhxEANLRt13OcqJ
         Vdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737663268; x=1738268068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2QDlQ7ciLXyACEdbXlxDxDDAFIjM/sxdbl1ogTU8Rc=;
        b=mBEw2uzGyWxVBVzuCYkUZV17pKSAfvWB/TvOq8VCPGvmeYMJWh4Emv8yJDULKyfgCz
         h8rEsq8jODWC7R6qJKU/wez4xr2USjG9TY0kVq3zqayXDN0oXmJm2/P9PBf8pdMtnBf1
         KBdOqWQdriNVzngiROT0s7smoz/ETCb8WaGYhggMIMYMM7H4uxGfilSMdas7hJbKg46c
         qfdDyavAsHWxAsu7ArAmtRn3Nzba2KYyC3EtTlfpzCCfjwTGZsmiUAKjoKu083Zr9g9H
         aH8WO2lSExRDYdkCqZdy2u7jyoZDGzk+M98uDYxlP2SUIji4qOsOTMHFkpmM3CtCQCEF
         6rxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzTrTaOd/MfGRlbst/bfXp7+W+i4vB5sEPaommkI2CDmtC2R38h4D+Esb1Z9J57xsneEAfTon8ntOQs7ChPsGy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9IkGKyBWcIeq1GZZo7657BpXbB8GYGKOQqKgZr4RWR0gK8Sp2
	WkJnBMmby0KkKegRYsY8fsfNQmfx9Qoq8loEsoXx3b/abS/PJVuu41rnjYa8L3D8mNGL+pvISpO
	ZkvrdpWp8k7EA5o4Nuj3HjDDB6Gk=
X-Gm-Gg: ASbGncvdQ3le+e54uPWnHzAjDidu15ZF9P6K2N5VA0IBVH3aSEH/EoNZ5AJ2jq9WrJT
	IgX0IzIXmyujRUHINxY6D/S4wrhBOlbcPowL3g+OGau8ii+97RkbxuZMDfcEDkgnf8FjgmW8m
X-Google-Smtp-Source: AGHT+IF9WRUJHlC8pSwIAj8cVYowT1BAbQRT46w/zBvudQ5hCUtVjX57p1AYxilwi3P5ZVSk1dKDYES+SrAcrckfCwM=
X-Received: by 2002:a05:6a21:9215:b0:1e1:c26d:d81a with SMTP id
 adf61e73a8af0-1eb5d21c42cmr6183007637.8.1737663267550; Thu, 23 Jan 2025
 12:14:27 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com> <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com>
In-Reply-To: <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 23 Jan 2025 15:14:16 -0500
X-Gm-Features: AWEUYZm4s0a1_xJx4E19lGpX9b_gFH6RT3FcZVLxCaBZ0uPB-4Bak4CDyfFUWL4
Message-ID: <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250123_121428_424495_1CE9C36C 
X-CRM114-Status: GOOD (  41.25  )
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

Let's say CB1 enables stall-on-fault. The sequence is something like this:

- CB0 faults, context fault handler for CB0 runs first
- resume handler writes RESUME for CB1
- CB1 faults on some other pending transaction
- context fault handler for CB1 runs due to the fault from CB0 on
shared interrupt line, discovers there is an additional fault because
we just wrote RESUME
- context fault handler for CB1 writes SCTLR disabling CFIE
- resume handler writes SCTLR enabling CFIE

At the end CFIE is incorrectly enabled while the second CB1 fault is
pending and we get an interrupt storm.

Realistically this is only going to happen if the resume handler gets
interrupted in between the two register writes, otherwise it will
probably win the race and write SCTLR before CB1 can run its context
fault handler. But technically we need the spinlock.

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
> cleared and interrupt storm is observed.

With #2->#3->#4 FSR.SS is *not* cleared and there is a subsequent
interrupt storm with only FSR.SS asserted. With #4->#2->#3 there is no
interrupt storm. From this we conclude that MMU-500 does not clear
FSR.SS unless #4 happens before #3.

> The way CFIE disable is helping
> with current patch indicates write FSR is unstalling context and subseque=
nt
> transactions are faulted.

No, it does not indicate that. The interrupt storm happens even when
there is exactly one context fault, and when the interrupt storm
happens *only* FSR.SS is asserted. I've verified this with debug
prints. Once more, MMU-500 will assert an interrupt when only FSR.SS
is asserted. This has nothing to do with subsequent transactions.

> Do you stop getting interrupt storm after write
> RESUME.

Yes, as long as the write to RESUME happens after all other bits in
FSR are cleared.

> If you can mention your SCTLR configuration and FSR state in test
> sequence, it would be clearer.

SCTLR has both HUPCF and CFCFG enabled.

>
> An aside, If reducing delay between FSR and RESUME write helps then both
> can be done as part of qcom_adreno_smmu_resume_translation(). This will
> follow spec recommendation and also make sure fault registers are not
> cleared before reporting fault to client.
>
> Thanks,
> Prakash

