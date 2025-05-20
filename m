Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5456CC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NL9VnS5cf/6NW/p94tIKHT/4gGzvfJ3RyyiZ0fUNEek=; b=jKgvzK5wcgIEEzlD3sFm3ZqlS0
	3rfKSm+bmUiL/yCDReP6sSO9lEh2bPTx+4Bxdlvyui/RdcpbCZjb3IsLzCeme2p2pSLpIiQP6S/Wq
	WMnQda+HAQBugA4rs4DIeQg+VbSOe1CZBLdLzYsx6aH8fOZmx10TIIAoEInMS1MKGpFokTT3yXw99
	8hhOE4khp5xhkzO6e/AF7I99F1CeUePXrdOtp82ww2UEvrTIgvB7AfXCowfrIz7Wa7OSKkK9DZnz2
	BhZfUbE9qE7qir/FR1L5WTHll5w1SrxNczrd9jMAHpdVzjr8E8znAIoKvHLNjT4nGNRImX7D2gp1a
	9YFelUvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOE4-0000000DDNn-3us2;
	Tue, 20 May 2025 14:45:52 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOBK-0000000DCjd-1fpM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 14:43:03 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-30eccc61eacso369617a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 07:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747752181; x=1748356981; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NL9VnS5cf/6NW/p94tIKHT/4gGzvfJ3RyyiZ0fUNEek=;
        b=UQS+6PgIxHqiJISw3W3+BngNDrDr9Qyr2/P/MHr/YuQbPVLCs6EhDHJxpDjWWIjB9v
         gpMHjX0zOrLqFt04HHjGGNM7TIFsYcjAOqP+V0hd55o4NHr2h8/v1AlMiMakVL0IUx/N
         qHB9AYP/uI0US/RdV26GMuei5o6feAjStZfWU7jwkRPMHuMiSyjjag//HMwFmT557HPa
         EkqdknmiHX2gB+iKziNC/2RLOX7fU+77jX1sPzhLrLyo5TeyN9Fp7RMsx7pLG52rXfNW
         b+JracxIo6OITCK8NWJJCabKdjKRxzCI6F0My7zVtomZwBO12KqO22ryZdy5I4LAuFQq
         MeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752181; x=1748356981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NL9VnS5cf/6NW/p94tIKHT/4gGzvfJ3RyyiZ0fUNEek=;
        b=rP/4Ky8EvO+BM8E3JzENJuh1rZDd6fkv93GMFXvC+CvC/G3+f/j+BKuibpuh5yR6cd
         Ys8EoXv4G+4jC61PSEEj2klVzQJ3kn0emo7qVLfq282qUvDGVb1dKduptsEx8IsR28qu
         By1sOyEBM9m23mX6wQeaibr2DOtYxCfDq3/DMulyVHl+hQWEWhNQf5BDJVp2fSx7yFMN
         fBpMW8w/tHR5nr9h6VsQGLoN7Qbo8olu2g7eqkOdJnrF6uGlGG7lwaignihRoasq3iHn
         kd1JGKvZkWNGNjjDCH8I8pNR/pqN17fjh1297askPF7FivNSpY7oc2lVq0fHtccpIkm6
         yrkw==
X-Forwarded-Encrypted: i=1; AJvYcCUsTaGevWVfGXJc832x04NpEkDK1VOjVaMFAYeFXbdQASvhAeS8097UjYnYWFqdkFMOELKeVHJzTcvvRsW66/ss@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9AnFpx4x+wGET2tuJ0CYtj3ERNp2kH+K3xmOhj+qflq0bQtzQ
	OLFmmXRxVgcKoxYX48kP3BOFBMERKjkeI0kgMjZJ2BogW4auCPrex4OJZCsdxkd9vFqw0n02Ugx
	kS2iCdiIT+KmEJUbYOP+f1Ha8BQJ2+VM=
X-Gm-Gg: ASbGnctBDp67WTXkemea31pqNgjTqa30dYW62KiHBxW+RuHVmWLTBHNoYNiMZoE8rJm
	2oDv6MtM9WuIMTMM8tLNK6Qio+VSQqy5DFWehWdRmWlZozSjSw/XKeJxB21jjXM1dn+DGdrGCwQ
	awWyFSjzAtU0SLRZtR76Lm3WHgcd0o9u/7
X-Google-Smtp-Source: AGHT+IF/aCn3KuIR/kknx0aBZr7IzoK3GvwOK/L+4l4anpA0Ks1VE8JmQjWR6x3bz5ayRXEdRHZ1M4ocBueOSYEkMnU=
X-Received: by 2002:a17:90b:3b48:b0:30c:4b09:5f3d with SMTP id
 98e67ed59e1d1-30e7d61316bmr10052600a91.8.1747752181324; Tue, 20 May 2025
 07:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com> <20250520141857.GC18711@willie-the-truck>
In-Reply-To: <20250520141857.GC18711@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 10:42:49 -0400
X-Gm-Features: AX0GCFsH2VOZ8YMhHMV3BqM8wqyCOVzoUFywTVBwakEJMPVYAMwwsNIEoTGSpRU
Message-ID: <CACu1E7HdJvbx_6L9KvX3n78_cbkrey8npo=O=AkEzg335wJC=g@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
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
X-CRM114-CacheID: sfid-20250520_074302_436735_8ADC6B40 
X-CRM114-Status: GOOD (  29.38  )
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

On Tue, May 20, 2025 at 10:19=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> Hi Connor,
>
> On Thu, May 15, 2025 at 03:58:42PM -0400, Connor Abbott wrote:
> > drm/msm uses the stall-on-fault model to record the GPU state on the
> > first GPU page fault to help debugging. On systems where the GPU is
> > paired with a MMU-500, there were two problems:
> >
> > 1. The MMU-500 doesn't de-assert its interrupt line until the fault is
> >    resumed, which led to a storm of interrupts until the fault handler
> >    was called. If we got unlucky and the fault handler was on the same
> >    CPU as the interrupt, there was a deadlock.
> > 2. The GPU is capable of generating page faults much faster than we can
> >    resume them. GMU (GPU Management Unit) shares the same context bank
> >    as the GPU, so if there was a sudden spurt of page faults it would b=
e
> >    effectively starved and would trigger a watchdog reset, made even
> >    worse because the GPU cannot be reset while there's a pending
> >    transaction leaving the GPU permanently wedged.
> >
> > Patches 1-2 and 4 fix the first problem by switching the IRQ to be a
> > threaded IRQ and then making drm/msm do its devcoredump work
> > synchronously in the threaded IRQ. Patch 4 is dependent on patches 1-2.
> > Patch 6 fixes the second problem and is dependent on patch 3. Patch 5 i=
s
> > a cleanup for patch 4 and patch 7 is a subsequent further cleanup to ge=
t
> > rid of the resume_fault() callback once we switch resuming to being don=
e
> > by the SMMU's fault handler.
>
> Thanks for reworking this; I think it looks much better now from the
> SMMU standpoint.
>
> > I've organized the series in the order that it should be picked up:
> >
> > - Patches 1-3 need to be applied to the iommu tree first.
>
> Which kernel version did you base these on? I can't see to apply the
> second patch, as you seem to have a stale copy of arm-smmu-qcom.c?
>
> Will

Sorry about that, for the next version I'll rebase on linux-next. I
was using an older version of msm-next for a while now.

Connor

