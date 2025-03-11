Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03661C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 20:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gpeic0WcwHZpDjI5JkWgQuSUr4e/vgwMJ9BK0UvjAlo=; b=rQPK5nv08PzVs0QeATnewRDU2L
	CjecpstrQ5bAR8O9hepdKgbReBVa0kubp3s8OTaPOTNu9C0WkXnUtW370rVy0KTQMVUjW9+oFJ1gl
	z2KO8qmNnh4zD+1KDqrxmeRwdT/fymBYp9V7d/8t173MAA6UImuiaeiikEjxPRINi+yivr7fZh5nh
	RKZtvx9XkcpIIjjLgIHCR7vgwVS+WH/OxNg/sBRqy4OnRaKXpXXh4+vgrXZchdWrl06VA/FE3W8ru
	94OdRvRqkRXVwktq5JZaiWDsnHhFm1HCAd3YOEUL6fAVXlX/a3G0S5OmLCYNukue8To1VfYXtfZuP
	M+tbHeNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6Ip-00000006vjj-0sQE;
	Tue, 11 Mar 2025 20:34:15 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5mR-00000006rj7-3wmj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 20:00:49 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3cfeff44d94so13915675ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 13:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741723247; x=1742328047; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gpeic0WcwHZpDjI5JkWgQuSUr4e/vgwMJ9BK0UvjAlo=;
        b=kEUOcmm+tzWmKb/xSCXkE5eODhgsPNOiMZqSnb2BaNS5bMaiPM6ngYYAB6fw7rNgR6
         crfeTAx6Zdtdq+k+8fWc7lwRdQVEkW6dBRRHV2C/XpL2ao5ToV/jTk0bU3gwPwNpzkUN
         bqOgJVMwrSrdQCfr5HEksofL07gSZtaeeTDskuk/PHupzBWCWBOfT/rOKOtKLZXMhg9S
         cbrV2y8G6o9gREpL8PCuMFTuy+UfC3NcKjdvmqtIkMXlcwfFxP+vyvJek4i9FkBvaqKP
         a5JNoe9h3bJYn8Us9e7rU5Cwx6K4Z2KOnWnaZkzZv59yUqZyVDDuUnPno1vG+g3UdHo/
         msHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723247; x=1742328047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gpeic0WcwHZpDjI5JkWgQuSUr4e/vgwMJ9BK0UvjAlo=;
        b=F7dqL15Bgtd2jGMwSRiRYu0FXheAZMkHPiFBzXbndsvfwrihnnm3OURMbOvYXMu9tQ
         8lp5tzsjzDX57iiLl42D/lQUNPsdcjrQ0iy96qFlgtoFLuVUbPO/cyy3kEbFIoqnqd5Y
         nLSzVClHS9sSEoIvn5d/p6IQqkBQ0VihWle7o31lQl1w3jolRwRMRdepE4NsQRtkT9o3
         mm65IoBs0VyAA6zVUy0JxSUep3WG/Nq7XEQ13NSXooDYr9jF4ifA0txI4mz/p34eDfBz
         zFC0yfC6GwvCtoCx2Gmvg2KfMOZfez6bdim84novxydJsOLcSQZfUUrtwg4eyhzk1ffv
         iLKg==
X-Forwarded-Encrypted: i=1; AJvYcCX89qOk04tUyQtMNeERX9VH0QmSGe/UQfxPitPW4cIT8rBlNsJ9FirRArnlMH+yiTFyIknRJJX5LsAt/urqBDRG@lists.infradead.org
X-Gm-Message-State: AOJu0YwTmgTo9pID7giewcm1Cy/9fW5QgzqmOtr4vcqCFhC8XcXplRV/
	Rkoif3Usjw0DTRqLNh1PLoT63ltip6g5U8Ufn74AyRx4Dwcu2S9Wezku5J1yyYXuHU+VIb0tKF2
	00YmEzst2RylBCtpZ5C0TUC6QUY4=
X-Gm-Gg: ASbGnctE3bdDNvuiTi81jN1jQ7OIsqS4BaDpYszhVNwOC/swXELOWCO9k7Y2eM8rB6/
	NldtmASFGKiXiWf71HL184uhDZXrJpbE6yorcX/0GYi7k5yrlk5H/+FlK9zUz+BcaLHf04Ap98n
	OmGmeaCp97B3cL5h/hBtpTMqZGhVq11Vf3EYsm90BoRvwQTfefalOk5HHu
X-Google-Smtp-Source: AGHT+IHnEnfmBrcYN5CgiJSCUEKuYdpRvskKfowRAYORIl7YVlWFJTR/3hVXxyuW1gKd0NsDNWQe7lPtHwZEAYj9Mqw=
X-Received: by 2002:a05:6e02:164a:b0:3d0:235b:4810 with SMTP id
 e9e14a558f8ab-3d4418d50e2mr212944605ab.2.1741723246490; Tue, 11 Mar 2025
 13:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
 <20250311180807.GC5216@willie-the-truck> <CACu1E7Hw6vGbTQ7t-Hj3ziycZhPxtOGSDkt7o4fNUx91KDcXfg@mail.gmail.com>
In-Reply-To: <CACu1E7Hw6vGbTQ7t-Hj3ziycZhPxtOGSDkt7o4fNUx91KDcXfg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Mar 2025 13:00:34 -0700
X-Gm-Features: AQ5f1JqJJW0DJckWYNGGABDX1xOTUcg1Jhe5MZo7XOUNOKHatuENCACaKvteaIA
Message-ID: <CAF6AEGs8PoZBpFesQ_DGcngn4X24wzFy=zn2mAUJepdibxoKog@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] iommu/arm-smmu-qcom: Don't read fault registers directly
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_130047_978685_FEE6D7BA 
X-CRM114-Status: GOOD (  28.42  )
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

On Tue, Mar 11, 2025 at 12:42=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com=
> wrote:
>
> On Tue, Mar 11, 2025 at 2:08=E2=80=AFPM Will Deacon <will@kernel.org> wro=
te:
> >
> > On Tue, Mar 04, 2025 at 11:56:48AM -0500, Connor Abbott wrote:
> > > In some cases drm/msm has to resume a stalled transaction directly in
> > > its fault handler. Experimentally this doesn't work on SMMU500 if the
> > > fault hasn't already been acknowledged by clearing FSR. Rather than
> > > trying to clear FSR in msm's fault handler and implementing a
> > > tricky handshake to avoid accidentally clearing FSR twice, we want to
> > > clear FSR before calling the fault handlers, but this means that the
> > > contents of registers can change underneath us in the fault handler a=
nd
> > > msm currently uses a private function to read the register contents f=
or
> > > its own purposes in its fault handler, such as using the
> > > implementation-defined FSYNR1 to determine which block caused the fau=
lt.
> > > Fix this by making msm use the register values already read by arm-sm=
mu
> > > itself before clearing FSR rather than messing around with reading
> > > registers directly.
> > >
> > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++---------=
-
> > >  3 files changed, 27 insertions(+), 27 deletions(-)
> >
> > [...]
> >
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/ar=
m/arm-smmu/arm-smmu.h
> > > index d3bc77dcd4d40f25bc70f3289616fb866649b022..411d807e0a70338337166=
35efb3968a0bd3ff237 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > @@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
> > >       ARM_SMMU_DOMAIN_NESTED,
> > >  };
> > >
> > > +struct arm_smmu_context_fault_info {
> > > +     unsigned long iova;
> > > +     u64 ttbr0;
> > > +     u32 fsr;
> > > +     u32 fsynr0;
> > > +     u32 fsynr1;
> > > +     u32 cbfrsynra;
> > > +     u32 contextidr;
> > > +};
> > > +
> > >  struct arm_smmu_domain {
> > >       struct arm_smmu_device          *smmu;
> > >       struct io_pgtable_ops           *pgtbl_ops;
> > > @@ -380,6 +390,7 @@ struct arm_smmu_domain {
> > >       const struct iommu_flush_ops    *flush_ops;
> > >       struct arm_smmu_cfg             cfg;
> > >       enum arm_smmu_domain_stage      stage;
> > > +     struct arm_smmu_context_fault_info cfi;
> >
> > Does this mean we have to serialise all faults for a given domain? That
> > can't be right...
> >
> > Will
>
> They are already serialized? There's only one of each register per
> context bank, so you can only have one context fault at a time per
> context bank, and AFAIK a context bank is 1:1 with a domain. Also this
> struct is only written and then read inside the context bank's
> interrupt handler, and you can only have one interrupt at a time, no?
>
> Connor

And if it was a race condition with cfi getting overridden, it would
have already been an equivalent race condition currently when reading
the values from registers (ie. the register values could have changed
in the elapsed time)

So no additional serialization needed here.

BR,
-R

