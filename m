Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCAEC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 17:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsfBOdqnpEgpdpgAJrzH2XaH6ygppwa1vT1EnnHCi70=; b=Zp0GVBmT9rHnIlO460C10Wls68
	kO84/NthW2RYTqHhgOY3tGEQSTV9VK0v2YPP2ix9bI8EFLIbp+zxAbk+yr1VUshKHJ5ZBxSOSkgXz
	FewFUhGhjAxVjSw0fAbbECBEUjloRLHIfajXF4cFudMt57sg4awhzukVYXQzKT7VmeLzJzz+fJyLp
	GOLtK4NQZduWpXljLlZINdhOt0wITXjdQ7rN9ChqwlG8fwGf9m8tNayaosdVa3ACf+PQucy4Wmzgg
	tvE0Gu88mczhtkUGcVBa6RqHi2gz8T5MmB18CKireLog38FwDK4WW4uuS7RLOiwvttvVUTmT07rJq
	sqgA9obg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFcBe-00000001OGV-18g1;
	Thu, 15 May 2025 17:16:02 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFc9a-00000001NtD-37jf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 17:13:55 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3087a70557bso215717a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 10:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747329233; x=1747934033; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsfBOdqnpEgpdpgAJrzH2XaH6ygppwa1vT1EnnHCi70=;
        b=fnuy4lXdVoBZF5iOYhgsOMo8jQl+d67heI1Y2HWKvbMHSc/Nw6oWx6lSKvS+PC7/37
         R9MFB9um6jk6xgewwFMeDsyuImJLnQjKRZ3jMd4lpYvsAvlddZUg/LTULi84kk/2ak4E
         FH1ylMngc+CJ4tN59R8+DIK9oWBI240Pss/KHA9wMMuZQIcAvauP4/N0aPWHRSXciQrq
         L/H15ZjVSeMaYPt77O5HjeSuHdX1vbOC9esLuerGhAjKUApyk1WtpIvosQfODEw6hSXl
         amz9A/Wb8VVtbdl5HIlNGEXTs5RS1VYEzz0ec7gflUJLjgjNyHbjOog58NRwHj2Tk2pb
         iD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747329233; x=1747934033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsfBOdqnpEgpdpgAJrzH2XaH6ygppwa1vT1EnnHCi70=;
        b=UAgIDZfW86ajMLEczoOkFi5zHO9XoNMo7F9NtnD21934jTUlmgHKCG9b5a0P1Ro8+0
         +vG0k9Uv2vA5HXV1h7713C32V2riA35sT/uD4EYFJAaky2iEtvVtF1h+KoQ736Lx//aG
         iLhJMZM1p3kOn1v4NWOCit1QxD6JzxIHseuKMAiYoZCOfJugcGfWZPBPWe0UGv5HFVkO
         yKARY4KAC+vzs3nedezZpn/fRK0bbryGtFC05AZywGoaTYktRl0E1KAWwkcEoRbArafw
         ec5kkm1WVGA7VwkThQI5UBpynC30gesuL/UrXAc6p6jdgVC86q+NIbmLxTsntx3EIV70
         qe6A==
X-Forwarded-Encrypted: i=1; AJvYcCUCZn1EbMUq00yOiq3LktwtMQZyj9BB4GZL8rDxDtSclGSb4XH707t7Yh8njeAsBVXdUtgL/l+ByvE7WKInko+q@lists.infradead.org
X-Gm-Message-State: AOJu0YyyprB2cAckMGLfvRLFX8b/zNT31Kjnvix8DDpOKqKd3XhxjS1M
	e+ea2wpU8cNJEM8APjmupBfyr2//Lepxa2s7YfwoIoFN6xah1iVpR00KxuTA8R3/NyEFYxo/RMF
	aEMQonaEh/0R7WkkgMll99owXDRYv79A=
X-Gm-Gg: ASbGncteJOOk9ahY+PSA1hqQNNeHbLJslJsP4vPnMWo2s5cXwCXTffzB8LwbE5gylTM
	TQPCCql7gEXxb1njUH4uq+KxCIrVCpO9GtUjUE7m6x9w/K6mtaW7tmVrUvuocxaNEXyXlL4Ovhg
	n3eGOwjLeRn88eDpqXkfS0INFdVJCeL7+2
X-Google-Smtp-Source: AGHT+IGCIUW0dsKa/ihtbOAHQVJV2lxTI8vBLZn5qcHLkXGbGsiY14r4IvJ+r7XjrnLMar2wvcpVQz33dDkzERkk2C4=
X-Received: by 2002:a17:90b:3142:b0:30e:6ac1:372a with SMTP id
 98e67ed59e1d1-30e7d691099mr71651a91.7.1747329233394; Thu, 15 May 2025
 10:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
 <20250506122449.GB723@willie-the-truck> <CACu1E7FA0M_0Un3qPRNtqy4R_NbaMks6FSkpQZBuyqJpuT-p7w@mail.gmail.com>
 <20250506145324.GA1246@willie-the-truck> <CACu1E7FcQU3NXro8uYxzEJ1pvfYG5WLvY8BscbF9Sj+P3Wh_2A@mail.gmail.com>
 <20250515144653.GC12165@willie-the-truck>
In-Reply-To: <20250515144653.GC12165@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 13:13:42 -0400
X-Gm-Features: AX0GCFvD2R3Bj1I8omfFJkgKEUlYMIBkFZDKNasEPm1_T3W9qymeV4VLYjJsORg
Message-ID: <CACu1E7Ha5=q4mnnr5wZLk4407LJ6TBnjpxtAm4ve9i-ARgQqJA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org, quic_c_gdjako@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_101354_786672_A2E93840 
X-CRM114-Status: GOOD (  52.03  )
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

On Thu, May 15, 2025 at 10:47=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> On Tue, May 06, 2025 at 11:18:44AM -0400, Connor Abbott wrote:
> > On Tue, May 6, 2025 at 10:53=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Tue, May 06, 2025 at 10:08:05AM -0400, Connor Abbott wrote:
> > > > On Tue, May 6, 2025 at 8:24=E2=80=AFAM Will Deacon <will@kernel.org=
> wrote:
> > > > > On Wed, Mar 19, 2025 at 10:44:02AM -0400, Connor Abbott wrote:
> > > > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/io=
mmu/arm/arm-smmu/arm-smmu.c
> > > > > > index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab9=
13750e6079edc6393d1938c98 100644
> > > > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > > @@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault=
(int irq, void *dev)
> > > > > >       if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
> > > > > >               return IRQ_NONE;
> > > > > >
> > > > > > +     /*
> > > > > > +      * On some implementations FSR.SS asserts a context fault
> > > > > > +      * interrupt. We do not want this behavior, because resol=
ving the
> > > > > > +      * original context fault typically requires operations t=
hat cannot be
> > > > > > +      * performed in IRQ context but leaving the stall unackno=
wledged will
> > > > > > +      * immediately lead to another spurious interrupt as FSR.=
SS is still
> > > > > > +      * set. Work around this by disabling interrupts for this=
 context bank.
> > > > > > +      * It's expected that interrupts are re-enabled after res=
uming the
> > > > > > +      * translation.
> > > > >
> > > > > s/translation/transaction/
> > > > >
> > > > > > +      *
> > > > > > +      * We have to do this before report_iommu_fault() so that=
 we don't
> > > > > > +      * leave interrupts disabled in case the downstream user =
decides the
> > > > > > +      * fault can be resolved inside its fault handler.
> > > > > > +      *
> > > > > > +      * There is a possible race if there are multiple context=
 banks sharing
> > > > > > +      * the same interrupt and both signal an interrupt in bet=
ween writing
> > > > > > +      * RESUME and SCTLR. We could disable interrupts here bef=
ore we
> > > > > > +      * re-enable them in the resume handler, leaving interrup=
ts enabled.
> > > > > > +      * Lock the write to serialize it with the resume handler=
.
> > > > > > +      */
> > > > >
> > > > > I'm struggling to understand this last part. If the resume handle=
r runs
> > > > > synchronously from report_iommu_fault(), then there's no need for
> > > > > locking because we're in interrupt context. If the resume handler=
 can
> > > > > run asynchronously from report_iommu_fault(), then the locking do=
esn't
> > > > > help because the code below could clear CFIE right after the resu=
me
> > > > > handler has set it.
> > > >
> > > > The problem is indeed when the resume handler runs asynchronously.
> > > > Clearing CFIE right after the resume handler has set it is normal a=
nd
> > > > expected. The issue is the opposite, i.e. something like:
> > > >
> > > > - Resume handler writes RESUME and stalls for some reason
> > > > - The interrupt handler runs through and clears CFIE while it's alr=
eady cleared
> > > > - Resume handler sets CFIE, assuming that the handler hasn't run ye=
t
> > > > but it actually has
> > > >
> > > > This wouldn't happen with only one context bank, because we wouldn'=
t
> > > > get an interrupt until the resume handler sets CFIE, but with multi=
ple
> > > > context banks and a shared interrupt line we could get a "spurious"
> > > > interrupt due to a fault in an earlier context bank that becomes no=
t
> > > > spurious if the resume handler writes RESUME before the context fau=
lt
> > > > handler for this bank reads FSR above.
> > >
> > > Ah, gotcha. Thanks for the explanation.
> > >
> > > If we moved the RESUME+CFIE into the interrupt handler after the call
> > > to report_iommu_fault(), would it be possible to run the handler as a
> > > threaded irq (see 'context_fault_needs_threaded_irq') and handle the
> > > callback synchronously? In that case, I think we could avoid taking t=
he
> > > lock if we wrote CFIE _before_ RESUME.
> > >
> >
> > We need the lock anyway due to the parallel manipulation of CFCFG in
> > the same register introduced in the next patch. Expanding it to also
> > cover the write to RESUME is not a huge deal. Also, doing it
> > synchronously would require rewriting the fault handling in drm/msm
> > and again I'm trying to fix this serious stability problem now as soon
> > as possible without getting dragged into rewriting the whole thing.
>
> This has never worked though, right? In which case, we should fix it
> properly rather than papering over the mess.

It has never worked upstream. Which means that everyone is either
carrying this series downstream, or blowing up sometimes. The number
of places carrying this series is quickly multiplying, so it's
becoming more and more painful that this isn't upstream. Not to
mention the downstreams that still aren't aware of this and hang the
whole system sometimes.

>
> Georgi (CC'd) added support for threaded interrupts specifically to
> permit sleeping operations in the fault handler. You should be able to
> use that and I don't understand why that would require "rewriting the
> whole thing". You can kick the async work and then wait for it to
> complete, no?

It would certainly require rewriting the iommu side of it, although it
does get simpler.

Properly handling the drm/msm side of it would also require getting
rid of the fault worker, although I suppose we could just wait on it
as a hack.

I've started trying to see how it would look, but the biggest problem
is that it's going to introduce a lot of complicated cross-tree
dependencies. To fully follow the recommended sequence, we'd have to
do something like:

1. Enable threaded IRQ on Adreno SMMU.
2. Make drm/msm do its devcoredump business immediately.
3. Make iommu in charge of writing RESUME and do it after writing FSR.

The problem is that if we only do 1 and 2, things will be way worse
than before. Instead of some duplicate faults while the devcoredump is
pending (that sometimes, but not always, results in a full system hang
if devcoredump is scheduled on the same core) the interrupt will never
be cleared, due to the MMU-500 behavior of ignoring writes to RESUME
if FSR isn't cleared, and the entire system will hang every time
there's a context fault.

I suppose I could put 3 before 2, and temporarily break devcoredumps?

>
> That would then open the door to handling the RESUME in the core driver
> in future based on the return value from report_iommu_fault().
>
> You also need to fix qcom_tbu_halt() as I mentioned before.
>
> Will

