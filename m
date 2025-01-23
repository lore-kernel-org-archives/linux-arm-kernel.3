Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460E4C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 18:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyKfEZgI2q04ubHRnQeM6mRxNH8f7N8tmMhgcpNLYwE=; b=ueDtlBLEEIuy7vE0ghrmJKZb31
	nbkFpRQOpML83vYaVDlpX4DcqqkC+zJ/qp9gXuc95w9nVLOXo4/9BAdHgA8ccbb+Z5F5xERksYs+E
	9RXIH93/4PttxtxvTqaVuoUYdBapTx23gFVfM+gWzo2ybn4MK0s9LK8RKpM4DLkEMwDYcqxjz2FdC
	P19yEByvaB9GIWez2QYVE1jGy3qdxYQJHGmodr9mHLm0UyIQo+t4BzTSpVWUs6HGT9IjkxGRALyAn
	s2lU1M78eBAYGbtk+/LPNKBGM0NKI2lsKw49hA6GIcAOYSV5y7oyJFRpVGuNwfSxcWlqUkWw0ogOk
	5uhA025A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb1fW-0000000D0hI-33XX;
	Thu, 23 Jan 2025 18:11:06 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb1eD-0000000D0e2-3uX0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 18:09:47 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ef7733a1dcso284271a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 10:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737655785; x=1738260585; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyKfEZgI2q04ubHRnQeM6mRxNH8f7N8tmMhgcpNLYwE=;
        b=Z6mw5O3xr2DiE6q3L++bKFIkQMV//eRJHlWWjKAThNv+U/RekQ7yHJoDe3/m97ppbS
         CGsfXOHdV7KZEp+i03EdR7r+BlmTOVtckeqQuUc4EI7oDAKzSbLgRPtToLqzJTIYBsfy
         YJ9D9hjvyDJ1cdZVE1Db1lDFQhK0a7ShJHYR2IFhMiE4dsQzjdKv4eE2i1zBPPF9G40Q
         mRbBqF5A2CAy1hnBogjbxRL3c4ast0kpklopwp9wLoWfcB9xJaH9WMVUn/FyoFRB6rQ4
         uAPZdcE8DYWeKDcDY1EzTqaXCqh2HK66rq1qXCW+ksDnXgEjGSS1xstrAACgFH8HqFX8
         M0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737655785; x=1738260585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyKfEZgI2q04ubHRnQeM6mRxNH8f7N8tmMhgcpNLYwE=;
        b=To3zpYi0J/ErugvX51rN1aCfWDb4YCFx37OZwrJXb4JHOB8qYgKBWVPDjGdaoQ86VY
         Vj/QEoFoDsP05Hoej7P6xsSI1lAt5ggU4adtXqKP2I7Da4Ov8s9GveHCnUA3aGzBTDpp
         xqjhCqw7M2iHNfj99m2MFLuujcoFoZH0OpMh1rDxn0swMyrkAdl2KhDtGF5nenPiBn9S
         /9NznMWtnkY1OYyvAwIfUUXn1hNoNtTuvdnu4O0V17CCOO9v7DFERBsZWXDOdDmFR1sD
         J5i97n3YPOOpEfuOIPV1JL3z39voBwPZfSp7mTrzUGVC/hU1wvFj9NxezpFgBrI4Wsx0
         8dqA==
X-Forwarded-Encrypted: i=1; AJvYcCXRK/JscNYYvkTjKePJGn7QfmLmzg+0osayVtE/l3TAB4yn/kWkrhq1A3Y+VrWC9KyzNSIArbztkxzCFpr6sBae@lists.infradead.org
X-Gm-Message-State: AOJu0YwHaFl9eitciQzNG2fRpVNjccbWz6HoQUJedvw/jjGGDX8t91ob
	5cOdxVZj0DYvBXEy9oOFZczSRXNb2H76Rj4oN6LjfwFUyrK8RhWuT4Y0fCIU+rukpCX42LuvOVe
	Cb2e3MYGZVd8YUQzk+y2J9xaNQ90=
X-Gm-Gg: ASbGncsj2nKKp1wpyjk6GqWI3Bhsz6xGmaglNGQbPMTZ+LXMyRl60pKazdLxBQOjqnY
	FYDZa+4JKYGWeHoKq9bgUraZWqfxESW5R70R4THQZP64swViIczMg0qmF2pn9oQ==
X-Google-Smtp-Source: AGHT+IEEH3PHsFVxMvB++p2z2cLrzhfGijMDaM+Tji/bw29FKBGdgLy//H/LRds0MsXyeSdRL2jN0EV6I288KPRLGZ0=
X-Received: by 2002:a05:6a00:850:b0:725:d9b6:3938 with SMTP id
 d2e1a72fcca58-72dafb71a44mr14883468b3a.3.1737655784773; Thu, 23 Jan 2025
 10:09:44 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com> <b593ac5e-cb29-473a-af1b-214168968679@arm.com>
 <Z5J9wpooIH5/Ccrt@hu-guptap-hyd.qualcomm.com>
In-Reply-To: <Z5J9wpooIH5/Ccrt@hu-guptap-hyd.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 23 Jan 2025 13:09:33 -0500
X-Gm-Features: AbW1kvYGAg-AyeJwPcNQQ2QOH2zEJ2YL7TOxF-zPnlJpiWV2i8GmCg2Npquk7J4
Message-ID: <CACu1E7EUQxWxGB_OY+CifUufYZzaomn8nMYrmRvfrr5Oqx5XSw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Prakash Gupta <quic_guptap@quicinc.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Rob Clark <robdclark@gmail.com>, 
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_100945_972047_8C673FE2 
X-CRM114-Status: GOOD (  42.78  )
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

On Thu, Jan 23, 2025 at 12:35=E2=80=AFPM Prakash Gupta <quic_guptap@quicinc=
.com> wrote:
>
> On Thu, Jan 23, 2025 at 11:51:27AM +0000, Robin Murphy wrote:
> > On 2025-01-23 11:10 am, Prakash Gupta wrote:
> > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
> > > > + /*
> > > > +  * The SMMUv2 architecture specification says that if stall-on-fa=
ult is
> > > > +  * enabled the correct sequence is to write to SMMU_CBn_FSR to cl=
ear
> > > > +  * the fault and then write to SMMU_CBn_RESUME. Clear the interru=
pt
> > > > +  * first before running the user's fault handler to make sure we =
follow
> > > > +  * this sequence. It should be ok if there is another fault in th=
e
> > > > +  * meantime because we have already read the fault info.
> > > > +  */
> > > The context would remain stalled till we write to CBn_RESUME. Which i=
s done
> > > in qcom_adreno_smmu_resume_translation(). For a stalled context furth=
er
> > > transactions are not processed and we shouldn't see further faults an=
d
> > > or fault inerrupts. Do you observe faults with stalled context?
> >
> > This aspect isn't exclusive to stalled contexts though - even for "norm=
al"
> > terminated faults, clearing the FSR as soon as we've sampled all the
> > associated fault registers is no bad thing, since if a second fault doe=
s
> > occur while we're still reporting the first, we're then more likely to =
get a
> > full syndrome rather than just the FSR.MULTI bit.
> >
> ARM SMMUv2 spec recommends, in case of reported fault sw should first
> correct the condition which casued the fault, I would interpret this as
> reporting fault to client using callback, and then write CBn_FSR and
> CBn_RESUME in this order. Even in case of reported fault where context is
> not stalled, the first step, IMO, I see no reason why should be any
> different.  I agree that delaying fault clearance can result in FSR.MULTI
> being set, but clearning fault before  prevent clients to use SCTLR.HUPCF
> on subsequent transactions while they take any debug action. The client
> should be reported fault in the same state it occured. Please refer
> qcom_smmu_context_fault() for this sequence.

It's not possible to implement it the way the spec describes because
correcting the condition which caused the fault cannot always be done
in the client's callback. Sometimes it has to be deferred to a handler
not in IRQ context. However we must clear FSR (except for the SS bit)
before leaving the fault handler because while the transaction is
pending we want to be able to distinguish between a subsequent fault
in another context bank (only FSR.SS will be set and we can ignore and
return IRQ_NONE) and this context bank if they share an interrupt
line. So, moving this up generally doesn't hurt and fixes the case
where the client does resume the transaction inside its handler. I
don't think there's really another way to implement this.

And I have no idea why you think this prevents clients from using
HUPCF, we already use HUPCF in drm/msm and it works fine with this
series.

>
> > > > + arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> > > > +
> > > >           ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cf=
i.iova,
> > > >                   cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_=
WRITE : IOMMU_FAULT_READ);
> > > >           if (ret =3D=3D -ENOSYS && __ratelimit(&rs))
> > > >                   arm_smmu_print_context_fault_info(smmu, idx, &cfi=
);
> > > > - arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> > > >           return IRQ_HANDLED;
> > > >   }
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/=
arm/arm-smmu/arm-smmu.h
> > > > index 2dbf3243b5ad2db01e17fb26c26c838942a491be..789c64ff3eb9944c8af=
37426e005241a8288da20 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > > @@ -216,7 +216,6 @@ enum arm_smmu_cbar_type {
> > > >                                            ARM_SMMU_CB_FSR_TLBLKF)
> > > >   #define ARM_SMMU_CB_FSR_FAULT           (ARM_SMMU_CB_FSR_MULTI | =
       \
> > > > -                                  ARM_SMMU_CB_FSR_SS |           \
> > > Given writing to FSR.SS doesn't clear this bit but write to CBn_RESUM=
E
> > > does, this seems right. This but can be taken as separate patch.
> >
> > This change on its own isn't really useful - all that would achieve is =
that
> > instead of constantly re-reporting the FSR.SS "fault", the interrupt go=
es
> > unhandled and the IRQ core ends up disabling it permanently. If anythin=
g
> > that's arguably worse, since the storm of context fault reports does at
> > least give a fairly clear indication of what's gone wrong, rather than
> > having to deduce the cause of an "irq n: nobody cared" message entirely=
 by
> > code inspection.
> >
> Does spec allow or do we see reported fault with just FSR.SS bit.

Yes, the spec allows it and we do see it in practice. After this patch
we may still see it in the case where multiple context banks share an
interrupt and the other bank faults, but the correct action is to
ignore it because we've disabled CFIE for this bank already. This is
why this hunk has to be in this patch.

> If answer
> is no then Keeping FSR_SS would be misleading. Here ARM_SMMU_CB_FSR_FAULT
> is used to clear fault bits or check valid faults. Also validity of this
> is not based on rest of the change.
>
> Thanks,
> Prakash
>
> > >
> > > >                                            ARM_SMMU_CB_FSR_UUT |   =
       \
> > > >                                            ARM_SMMU_CB_FSR_EF |    =
       \
> > > >                                            ARM_SMMU_CB_FSR_PF |    =
       \
> > > >
> > > > --
> > > > 2.47.1
> > > >
> >

