Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F11CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0R5kWxn+gUs/vySBKBtt/O5HTdoMcXRICPcxZtyyoZM=; b=siEnoWc6/87L+dOiHuCLa+2UaX
	0t6aDgH+WuIA79vcMzo9ncgGvnVsmCjVGekHgRZ00GjTnT7M6fy5R1ls23QqD2dOcD/hbHeq3fV4a
	JKqbrIc+TtYJzNBSg59ldTosYK7VPNG/u2C4cjYQuBEYDTPnN2WwQ6VyAojAHOjOLhQeXbxRKXHfS
	BVsKPumb66XPcxsUGiOg8slzhQ6UtNo0hbVsRJsqmczgXaBE5HiWRpDm+q294lJH/GJQbHwAN98mi
	P5wdkqkuIAqR49Rn6Q24fIRmqUAWBL9sfcE1hQe7e4JtwJvc4c9Aif376hUjYegr4nfRrexlRPwa5
	kHHPcorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eU-00000006EkO-2Khu;
	Tue, 09 Jun 2026 18:58:18 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eP-00000006EdN-0lXs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:58:14 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bf22c18ad3so566785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781031492; x=1781636292; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0R5kWxn+gUs/vySBKBtt/O5HTdoMcXRICPcxZtyyoZM=;
        b=YTfneVW/Lu+FIjt5VT88EYwbTYLFHqM7+9TagAwNKx6jGxUtNSK6aAxkipOCT07YRR
         wsRkKaquLUjP+ghiwMq0MZsnscjjR/CtBtcLLDTXBAORc+eRhUkNNZeBBm91c1UwbEta
         /Pzigba3zljD8BAY/ETqnxFGFIEhZ+f5VHMtC4C8fvJjt+MeyKYni2fbHFmUu/WctMXU
         FJTUBSMKmSUNndFEaVOleXHZx3rlJTwESYCHvtaRYCh94WBh7qa/YjcvoCYCzJ3mT0S6
         TBlqYCR/nnYmTwQGQ13PIJpk6lN5CwSIII/92lxBwEVEZIAXpBEGq9QQCnzEAyoQINZT
         YpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031492; x=1781636292;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0R5kWxn+gUs/vySBKBtt/O5HTdoMcXRICPcxZtyyoZM=;
        b=ogkxla9cH6godBKzKGXg5ph07wzvpZyBaJGa3MGWzaaV0GiWvoIYOU1XInm5KLVgbV
         KEuQQg/Xma3eFEN1gUPq3dlpmCcvhphxWUBgpMyboDQD2MvTYgnO39qKeyBZyUnx56Qm
         HDVAOrKcQvlCgQzPHxUYZjsuIOTFzSswrkVQHCU2c8t3ocg6RkPOqidnWbVwhY9Dgsm9
         oKM09TBbg51XDSN82ouHBqhq9Zyi3gYauItP+Qf1v3zR61EtKArn2AZizzf2yaCZuUvS
         QDmgcpGOQtpVeNHtF59tWrIuto0Wt+zm/Bq7GNvEijcW+7pziXc3bnpUwWW2k+cHFlX3
         BKMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9getZVvtKREZt5b6RwRKPc04uPoGLq+2nv7uINOkgLvh+neHV0sc+ej+QYHyu5K7GxFCQh+Tq8XRLapuSiqVnK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3fCx0voQB0EbZU4kp2M/KsO93LmJR6OYWjkIm0RIU4ugW8HbD
	f+LyrusvwLUs9NFlUlhoT3RlzKo170wYewRKdl5UThUcS+qNqHkd+4CUO7Y0Kmis4w==
X-Gm-Gg: Acq92OEwct4pXHyAaK9BCmfI1SSK4F4iLFCjyVpiBwtZcj4pSF9lBn077aTVzYvw90u
	ZoloAKERHJYVn57/GQrXc6Xi8DAmxc3m3mEbdpiE0yALzv8cB32Hoq7HCkRJOyUjCmld6rJC0Ap
	SMyDFvS5CypIJwwnKihQqyNcOMipV2eMIvjIMP9BkhAVhyDW9s3dL5ZoHi9MaDl+wMf1008Ah5+
	T+Cry6rquL6stm3QVu2JV1Jk5AcJulAq41OA1R2pa7eOnJWezd60iziYrh5m0IDYhQXIrBU2L+r
	16d+TKi093kLcT5nKakcay4u+d84t33HVUZnK2KMzl6l5rrtCC6J3fvaAttCJw2laG6syXNOwyZ
	fdFo+eXE63zj3bNoS38PBeif8jkAm8nVZ+ksGpCDze3UG7iZ3HtLcp1g5CszHnRmoAWXxQmr7hB
	03/e9Z0P6qTmCzWElqLtx214KyPT+xQ4nsQzgL/e99DDx0LnTU78dFxx7ZrUcbamlINo1Gwq0=
X-Received: by 2002:a17:902:e885:b0:2bd:7e8e:ad56 with SMTP id d9443c01a7336-2c1eafba702mr8158095ad.6.1781031491636;
        Tue, 09 Jun 2026 11:58:11 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221a7e9sm28612027b3a.11.2026.06.09.11.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:58:11 -0700 (PDT)
Date: Tue, 9 Jun 2026 18:58:05 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 07/12] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <aihiPQ2mdqMm13Cd@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-8-praan@google.com>
 <CAE2F3rDF5dVJip2gc+vaxtM-FRttnUEnAetUYz6qDCXRM=fNYg@mail.gmail.com>
 <aiZe97OkmvcUwCzS@google.com>
 <CAE2F3rDZupDgq5tQrvpuixGi-kVs+oi-Tacqa=Rxtri03LBPHQ@mail.gmail.com>
 <aiflaI4svEJvZbsC@google.com>
 <CAE2F3rDgXxAhJFUX6=xars9H92t8NBDqcFRxU7d5wJQ7buUbNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rDgXxAhJFUX6=xars9H92t8NBDqcFRxU7d5wJQ7buUbNA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_115813_278575_E52FE85B 
X-CRM114-Status: GOOD (  55.69  )
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

On Tue, Jun 09, 2026 at 11:20:52AM -0700, Daniel Mentz wrote:
> On Tue, Jun 9, 2026 at 3:05 AM Pranjal Shrivastava <praan@google.com> wrote:
> > >
> > > > Even if the worker CPU reorders the PTE write after the STOP_FLAG check,
> > > > it is benign because the SMMU is incapable of fetching that (or any) PTE
> > > > while the gate is closed. Because GATE_CLOSED == SMMUEN = 0, implying no
> > > > access to any HW structures whatsoever.
> > > >
> > > > The real synchronization happens in the Resume Path:
> > > >
> > > > 1. arm_smmu_device_reset() clears all caches / TLBs.
> > > >    (None of these can have entries before SMMUEN=1)
> > > >
> > > > 2. We execute a full smp_mb() before setting SMMUEN=1. (that's why we
> > > >    need smp_mb before SMMUEN=1). This barrier ensures that any PTE
> > > >    writes made by any thread—including those that were elided while the
> > > >    gate was closed, are globally visible before the SMMU hardware starts
> > > >    fetching into TLBs again. (This is why Jason suggested this in v6 [1])
> > >
> > > A barrier on one CPU has no bearing on whether writes by any other CPU
> > > can be observed by any particular agent in the system.
> > >
> > > Let's compare this with the long comment in
> > > arm_smmu_domain_inv_range() which is what I believe Jason was
> > > referring to. In that example, you see smp_mb() in the code path on
> > > CPU0 and dma_wmb() in the code path on CPU1. Hence, barriers exist on
> > > both sides. If you compare the runtime PM design with
> > > arm_smmu_domain_inv_range(), then smp_mb() belongs in the CPU thread
> > > that performs the translation table updates not the one that performs
> > > the suspend/resume operation.
> > >
> >
> > I might be missing something here, so please bear with me. My
> > understanding it that's needed because the IOMMU is live & actively
> > caching, which is not true for our case.
> 
> I think the "invs" design (Per-domain invalidation array) is more
> similar than you think! An SMMU being absent from invs is equivalent
> to the STOP flag, and the STE pointing to TTB0 is roughly the
> equivalent of SMMEN=1 i.e. the IOMMU is not actively caching a
> particular translation domain until an STE (or CD) points to it.
> 
> > [Assuming we use non-relaxed semantics & ordering for the STOP flag,
> > i.e. set STOP_FLAG + barrier & clear STOP_FLAG (implicit dma_wmb())]
> >
> > In our case, during the resume op, we first clear the STOP_FLAG before
> > setting SMMUEN=1 in program order. Thus, any PTE invalidations occurring
> > before SMMUEN=1 are executed, i.e. EVEN when the SMMU is guaranteed not
> > to access any structures, we've resumed invalidations.
> 
> "[...] we first clear the STOP_FLAG before setting SMMUEN=1 in program
> order." I think this should be modified to "we first clear the
> STOP_FLAG and ensure that the cleared STOP_FLAG is observable by all
> other CPUs before setting SMMUEN=1"
> 

Ack. The goal was to explain the algorithm for this thread, I won't be
commenting it in code. Are you suggesting I should convert my 
explaination of the algorithm above into in-line comments and make sure
to include the STOP_FLAG observability part?

> Re "Thus, any PTE invalidations occurring before SMMUEN=1 are
> executed,": I think that "a PTE invalidation occurring" is not clearly
> defined. Also, it's not clear to me what this statement implies. It's
> paramount that invalidations are performed when SMMUEN=1. The fact
> that we perform invalidations before SMMUEN=1 is more of a side effect
> of our methodology.

By "invalidations occurring before SMMUEN=1", I mean that once the STOP_FLAG
is cleared, any concurrent unmaps (PTE updates) will successfully submit 
invalidation cmds to the cmdq. Since SMMU translation (SMMUEN) is still 
disabled at this point, these invalidations execute safely without racing
against SMMU caching (which was the concern in the previous email).

> 
> I would define a set of invariants:
> 
>  * If an agent observes the STOP flag, it is guaranteed that SMMUEN=0
> (with ABORT set) at the time of observation.
>  * Any transition from a set STOP flag to SMMUEN=1 involves an
> invalidate-all operation prior to setting SMMUEN=1
> 
> Hence, if a CPU observes the STOP flag, it is assured that (a)
> transactions are blocked and (b) if the SMMU is ever re-enabled, an
> invalidate-all is performed prior to it being enabled.
> 
> I would then argue that all operations support these invariants. For
> example, we need proper barriers in the iommu_unmap path to ensure
> that the STOP flag is only checked *after* the translation table
> update is made. Hence, we need a memory barrier.
> 
> I look at it this way: Every elided invalidation creates an
> "invalidation deficit", and this deficit is tolerable for two reasons:
> (a) SMMU blocks all transactions while there is a deficit. (b) An
> invalidate-all eliminates any deficit accrued while the STOP flag was
> set.

Ack, which means you agree with the design proposed in my last reply.
I'll document these invariants in line if that's what you're suggesting
here?

> 
> > Let's consider a few examples:
> >
> > 1. SUSPEND (say CPU0 is suspending)
> >
> > [CPU0] SMMUEN = 0 ==> SMMU stops accessing HW structures (ABORT NOT set)
> 
> I thought we never disable the SMMU unless ABORT is set.

Yes, that is evident from the code [1]. I made a mistake in ordering
while trying to explain why & how this works.

> 
> 
> >                       HW structures not accessed means no TLB / CFG
> >                       cache accesses as well according to the spec.
> >
> > [CPU1] ==> PTE update => Invalidate => Succeeds (although SMMUEN = 0)
> >
> > [CPU0] GBPA.Abort set ==> Txns are blocked
> >
> > [CPU2] => PTE update => Invalidate => Succeeds [Txns blocked + SMMUEN=0]
> >
> > [CPU0] ==> SET STOP_FLAG ==> Elision begins
> >
> > [CPU3] ==> PTE update ==> Invalidation ==> Elided [Txns blocked + SMMUEN=0]
> >
> > Hence, the races in the suspend sequence are handled correctly.
> 
> I'm not sure if this description demonstrates that every possible race
> is handled correctly. If I compare this with Nicolin's presentation in
> arm_smmu_domain_inv_range, I like that presentation, as it explicitly
> mentions loads and barriers. For example, it has an smp_mb() followed
> by "// load the updated invs". I think you should make have something
> like "smp_mb() ; CHECK STOP_FLAG" in your presentation. Currently, the
> STOP_FLAG checking is somehow implicit in "Invalidation".

Ack. The goal of this diagram was to explain the working of the design,
this is NOT the comment/document I plan to include in code. 

I'll add this as an in-line comment if that's what you're suggesting? OR
are you also suggesting I should have this in my cover letter?

> 
> >
> > 2. RESUME (say CPU0 is resuming)
> >
> > [CPU1] ==> Update PTE ==> Invalidate ==> Elided [Txns blocked + SMMUEN=0]
> >
> > [CPU0] ==> Clear STOP_FLAGs [Txns still blocked + SMMUEN=0]
> >
> > [CPU2] ==> Update PTE ==> Invalidate ==> Succeeds [Txns blocked + SMMUEN=0]
> >
> > [CPU0] ==> Invalidate all TLB ==> Succeeds [Txns still blocked + SMMUEN=0]
> > [CPU0] ==> Invalidate all CFG ==> Succeeds [Txns still blocked + SMMUEN=0]
> >
> > [CPU2] ==> Update PTE ==> Invalidate ==> Succeeds [Txns still blocked + SMMUEN=0]
> >
> > [CPU0] ==> Set SMMUEN = 1 [SMMU can now access in memory structures]
> >            However, the TLBs and CFG caches are clean because everything
> >            until this point couldn't have cached anything anyway.
> 
> My concern with this diagram is that it appears sequential, suggesting
> operations happen in a specific order across CPUs when they, in fact,
> occur in parallel. I find these diagrams more useful for describing
> failure cases than for proving that every race is handled correctly.
> 

Ack. Again, the goal was to explain it to you and not propose how the
comments are gonna look like. I'll use your preferred way to explain in
the future.

> >
> > Hence, right after clearing the STOP_FLAG, we're taking in invalidations
> > as normal in the resume, much before the real caching can begin.
> >
> > Thus, by resuming invalidations before SMMUEN=1, we guarantee a
> > consistent state before the very first translation is performed.
> >
> > Apart from this, I guess I'll drop the can_elide check from all
> > invalidation paths.
> >
> > Does that sound fine?
> 
> Dropping can_elide sounds fine. However, if you still use this
> function, for example in the gerror handler, then you might consider
> renaming it.

Ack, I'll name it back to arm_smmu_is_suspended().

Thanks,
Praan

