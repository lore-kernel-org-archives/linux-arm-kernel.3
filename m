Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B823C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 19:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihwIKJtv6TLBR/OI0Dx++tOWSWHwkJU0gov7VsGhIAg=; b=aCvHnjp1aWSCw/woIYUwa3Zwk2
	lRobajMo9OB5PEti8d5wS5bft4ufBbOYTHgzjq1pj3kUryKl2p4tltZiLd/yRFbL09TxhAWCErFFt
	gIhQB3k5EzztbACW2xu+GzsE3Hch/nr5E5Lea6QB7JXZXN+uL9R9NISaLxVw2KrWTJ+PW10mmH6ug
	Q4xu7pTun+pVRnf2v1zFD9j4p9IAz5udnP1qNHLRMFwLLEhZ5FYFmk9fK8mlBXHaMYo9jWIBg7lXJ
	E5pfbyHzv3nxea1dM6YZrxFKWooXTMvogrVyRAa/455aahyvRWLMWJ26QrkFIPVnFnx+UrPwZyEK+
	zwvcC39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNcC-0000000DBty-1vvf;
	Tue, 06 May 2025 19:06:04 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCK4O-0000000CTAg-1ssi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:18:57 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7373aa99e2cso850015b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 08:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746544736; x=1747149536; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihwIKJtv6TLBR/OI0Dx++tOWSWHwkJU0gov7VsGhIAg=;
        b=P7z7vuoQwvWQ8zOlUnNrtSGb3KA/udWzaylPpLuKQsEurT/Q2wrwuh2lUjJg20W6bk
         wDEJR+oDHgkZOayhGNCGlcXPw+oo3k1N/7v87MlViRN5qc0749txIxGZS3n5/Vpse62z
         kLhPctEGBGam8gKV6Fu/hCdGG9b+smUjCMmSvtKX+OgJiyLxZe0WBRXPzOjXKQhF2ecV
         1S3/D+wbyO+zXuYEVIqt0/iDdaJqXmdJIE38VQPYFg78xAWWGyX2PEDeVVBlehrYvXr1
         nWKw37Ep0hKYktYMPUn31PnxoZK9R8L1RD7yV+LeFTDaD0bDTuxzOP/PLtNSQIr+Wsdl
         KvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544736; x=1747149536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihwIKJtv6TLBR/OI0Dx++tOWSWHwkJU0gov7VsGhIAg=;
        b=V1PS2yRJ+ERKVNP5t5icUwh33sox3y4aDIajt7NWxrMd9KazkaQT5FEtTk6dlFO20V
         HFceCFEVpFzGfYyAPvPd2xdtkJh8cNPmHWPaDsomRIEw0LA61lrrblNu+ACih0UQyFwi
         r7icgEw+jRiAdIg93BSBTsKafDHTj2Z3e1/2E5Zrp1Wfnt81B/12q092zgzgMzwTSNz7
         F6zhLbOU0fxMn4M8ZAvMx73Vj7eljkW1uieB2aZ4hDKHW8eVUCEAxwzUnCPWopcWxJXb
         g95mbrEQaNwiWhPUJUa0R/62iG4rI/iOrERFUPGgAyAX2hwXaF6+cGBc6UfREP+AeZwq
         JI5w==
X-Forwarded-Encrypted: i=1; AJvYcCXdC7t3X7Pyj7I3+1TFLC4I+4ISQSGjSji6+ucrnCIY1habxJxImycJ3owt/PhlPSFM47TB/EDQKiKmVqH39bc3@lists.infradead.org
X-Gm-Message-State: AOJu0YzU66/axfS+/hRbYvENQfOvxBaVA5isDMwPzgUmWmijzBAEAc6l
	gON2dL2k14IhtwyZSzJqkr1PWQHG/Sr8rN9GoSJOuG2PHAbZNgHLSSRqmlXygkoDmMBEnzazh++
	yfbEaYAxHNavd8mtiBj2Qn2fruSg=
X-Gm-Gg: ASbGncuCFcmMqbnavJEWcFv6YkjlnI0YYCjAHUPPHYZBWMhqG3esbfh5hdMZdHwP0sh
	cD9R2nzGCxIwfNdGtSDB6K73Dk0iaulmIKJWuTsu99sk4LvAc+mhepzw7mg4M4glo5gHAenVVEC
	60Yx6z8lYsU8KZ77/va/s/Pg==
X-Google-Smtp-Source: AGHT+IGL6zvGfKRHCeOyJw86qk5Rtichxh0QI1NF1NjzDjI2bE5Xp0U89TjTculYg2ARVj82+Jn/HSEeNbzQmRWcjwY=
X-Received: by 2002:a05:6a00:3394:b0:736:89bd:ffb9 with SMTP id
 d2e1a72fcca58-7409b78f76bmr67926b3a.0.1746544735683; Tue, 06 May 2025
 08:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
 <20250506122449.GB723@willie-the-truck> <CACu1E7FA0M_0Un3qPRNtqy4R_NbaMks6FSkpQZBuyqJpuT-p7w@mail.gmail.com>
 <20250506145324.GA1246@willie-the-truck>
In-Reply-To: <20250506145324.GA1246@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 6 May 2025 11:18:44 -0400
X-Gm-Features: ATxdqUHApCvIBLWVxzAKGWehj2Jn9c8bDSVhoYqNoYQYukt99xBU21U5GE3iI-8
Message-ID: <CACu1E7FcQU3NXro8uYxzEJ1pvfYG5WLvY8BscbF9Sj+P3Wh_2A@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_081856_492879_EFCC22A0 
X-CRM114-Status: GOOD (  38.97  )
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

On Tue, May 6, 2025 at 10:53=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, May 06, 2025 at 10:08:05AM -0400, Connor Abbott wrote:
> > On Tue, May 6, 2025 at 8:24=E2=80=AFAM Will Deacon <will@kernel.org> wr=
ote:
> > > On Wed, Mar 19, 2025 at 10:44:02AM -0400, Connor Abbott wrote:
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/=
arm/arm-smmu/arm-smmu.c
> > > > index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab91375=
0e6079edc6393d1938c98 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > @@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault(int=
 irq, void *dev)
> > > >       if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
> > > >               return IRQ_NONE;
> > > >
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
> > >
> > > s/translation/transaction/
> > >
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
> > > > +      * re-enable them in the resume handler, leaving interrupts e=
nabled.
> > > > +      * Lock the write to serialize it with the resume handler.
> > > > +      */
> > >
> > > I'm struggling to understand this last part. If the resume handler ru=
ns
> > > synchronously from report_iommu_fault(), then there's no need for
> > > locking because we're in interrupt context. If the resume handler can
> > > run asynchronously from report_iommu_fault(), then the locking doesn'=
t
> > > help because the code below could clear CFIE right after the resume
> > > handler has set it.
> >
> > The problem is indeed when the resume handler runs asynchronously.
> > Clearing CFIE right after the resume handler has set it is normal and
> > expected. The issue is the opposite, i.e. something like:
> >
> > - Resume handler writes RESUME and stalls for some reason
> > - The interrupt handler runs through and clears CFIE while it's already=
 cleared
> > - Resume handler sets CFIE, assuming that the handler hasn't run yet
> > but it actually has
> >
> > This wouldn't happen with only one context bank, because we wouldn't
> > get an interrupt until the resume handler sets CFIE, but with multiple
> > context banks and a shared interrupt line we could get a "spurious"
> > interrupt due to a fault in an earlier context bank that becomes not
> > spurious if the resume handler writes RESUME before the context fault
> > handler for this bank reads FSR above.
>
> Ah, gotcha. Thanks for the explanation.
>
> If we moved the RESUME+CFIE into the interrupt handler after the call
> to report_iommu_fault(), would it be possible to run the handler as a
> threaded irq (see 'context_fault_needs_threaded_irq') and handle the
> callback synchronously? In that case, I think we could avoid taking the
> lock if we wrote CFIE _before_ RESUME.
>
> Will

We need the lock anyway due to the parallel manipulation of CFCFG in
the same register introduced in the next patch. Expanding it to also
cover the write to RESUME is not a huge deal. Also, doing it
synchronously would require rewriting the fault handling in drm/msm
and again I'm trying to fix this serious stability problem now as soon
as possible without getting dragged into rewriting the whole thing.

Connor

