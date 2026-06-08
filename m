Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFA2CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 06:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2DbnJgN+cgPuXB8Z3VAJmWcXw3RxQl5FP2vBSOycvE=; b=2MvB7uqQJjcPAAxLNuNpMzXObr
	P6x7F4MoHEHU16apUn2tvOogJJtAxYZqPyi9yNkYW56ISZOYJx78/Xm88TXGeFbHahWfozT4MHYZw
	N2uB8C0s+aO5kIFPNBKBIQ1kQU/e6DCJCxLtUv5R3CnOmfkVxk8YhN8iFYHli0S0ZB0ZfVRRpGuAa
	c28K/dTag+ftfcnX+VCv1+fbOOlafhz54O3taAQXgFoRFQuoTJUWiByVJ9IzmCICgAjJHBe8E91BV
	/XjDawSlPUTA3Q0/6fegHyyVhqHYNVrKJJNGehNwVgFGeCuwrsbnZZt56Hr2us60chaWA6HWyBpp6
	FEkWKJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTKs-00000002tGM-15rM;
	Mon, 08 Jun 2026 06:19:46 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTKp-00000002tFv-2rZl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 06:19:45 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-137ff9a7d5eso22843c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 23:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780899583; x=1781504383; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h2DbnJgN+cgPuXB8Z3VAJmWcXw3RxQl5FP2vBSOycvE=;
        b=P7mxCmGcITWuCvR28bWxhLOin5TGvySGCoHT0XpiEMgkga0udUNQVLT29C2flTnokq
         FF2AlvZbWbI7Ri/kK88XT9fsIFbiRfglGRSFLonfJV0MM+icrf5Pbm9TMHYAlIRdg/I6
         nThkL5eWrhyRFX2Kok30pXAtKXNhWYOwK0cve941AT6G9dOvfLvY5TsCSTGDwxI9k0lF
         QHw8gxtcv7Ncv5PcWUSXoajnKb0GwQfkS3PIsXcQ9jkmeCwncGvXxJ7lROKdlLOHkNCT
         mlzRWYvmQ+GAYTdGmUg8sing4jYiXWBe7Bet3dptUx5SBVuCg8xTLwez4zqkAPF+ebA3
         mkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899583; x=1781504383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2DbnJgN+cgPuXB8Z3VAJmWcXw3RxQl5FP2vBSOycvE=;
        b=bkyLzXAj/0DK+SmwglLNDA/CB9ZzFVp5vXRa2bc1uGA8+sZmMJqt3+mu5J3tgaVYzM
         4M9K62KAIhdY7OWBKBtw9Qb4f1YuG6dfnaZjb3XT14+hj3MF0evYiw34iAja8SEr7wzs
         /pMVPE+Mi3Gwi6yDClHJ/d1lc9o/MteJH+0ZClfNSe/yFi6CrcQ47Fa3JLloHD6Hhqxm
         hiMm3Fs0KnduIEPMfoq2z1im6gy9k/xpb5BSqZYwBmeB2/lyUl7dto0NIdlkbgUCbf03
         9o6dve+jviYrcf/K18gtXr6Lo64kFV7a62Qlumde1NYZV6zl2rjyAxCrY7rUeEybO11P
         Ag9w==
X-Forwarded-Encrypted: i=1; AFNElJ/rk060TCCG9F2bNjiJ1Uw6DTj73M83W/xEppBVwRMUuxL5D2g4Dq1hHxpX3jqksBo0BIbkKfVFo/IbSwEH+hwI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz33ofMHI61A5wIAPk0ubKdvzHxTpZtFgbVPEo2AdRloiAZ3E0k
	fIXVEk/fzFYaBM1kKay1YsUXftznQ+y+WuymGchWFExMtC7eouCOWnqRFR/ARX1oPA==
X-Gm-Gg: Acq92OGIR5HK3qFtPFPnUsmZdOIQgiJ92HDQs7iHRB5kQfdOn97LC7B6g1L4yOjs41Z
	zwIBaCKsuhqNkFAn5eQCfkcLX5E07JIMhd5RhVZWX/f3dAliWtKrK/06eaqb3z1x4do7A5RmyUQ
	xaPAiLzhkQ2G3lDFFm7n/9ZmWa6sCMp9qXH4HQiBboFK5XqnkKtH5rZH6yH7a7vZsurSxWqxk64
	QdUP1Cb25PIk7IRKtQn3ZykXNkTxaBcPBHFlkNYk3+5sgCrGdie3VkB+xolTe0mfCnTZE7ha4Mp
	yTDFM6JOwO2g1fyhmi35goDPijosMvcmbOpJXMkFg8+YW5gulZdcAZ3zAe0QEb/IghAP7Q99D4q
	4cmnCRiJhyLGLzURcdFQMIl42kf+I4xIx0FEu7CPXfz7/8Zok0Fkqnljb0uO9Ly45zHQUUfdE3I
	QID2eDA0YKEyH0TKVUpOOSo56lM5mfp4sgia1p7tCrB82a4Z1cnuofwXLwxSS8TugfhR3iFpA=
X-Received: by 2002:a05:7022:2585:b0:138:888:e997 with SMTP id a92af1059eb24-1380888eab7mr159227c88.26.1780899581855;
        Sun, 07 Jun 2026 23:19:41 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30777ecf9e9sm10729408eec.28.2026.06.07.23.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:19:41 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:19:35 +0000
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
Message-ID: <aiZe97OkmvcUwCzS@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-8-praan@google.com>
 <CAE2F3rDF5dVJip2gc+vaxtM-FRttnUEnAetUYz6qDCXRM=fNYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rDF5dVJip2gc+vaxtM-FRttnUEnAetUYz6qDCXRM=fNYg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_231943_752046_ADC5FC98 
X-CRM114-Status: GOOD (  34.23  )
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

On Sun, Jun 07, 2026 at 02:42:37PM -0700, Daniel Mentz wrote:
> On Mon, Jun 1, 2026 at 2:59 PM Pranjal Shrivastava <praan@google.com> wrote:
> >
> > Introduce a new bit flag, CMDQ_PROD_STOP_FLAG (bit 30), in the command
> > queue's producer index to safely gate command submissions during device
> > suspension.
> >
> > The flag embeds the suspend state directly into the existing global state
> > The flag checked in the cmpxchg loop in arm_smmu_cmdq_issue_cmdlist(),
> > which acts as a Point of Commitment, ensuring that no indices are
> > reserved or committed once the SMMU begins suspending.
> >
> > This prevents a situation of "abandoned batches" where indices are
> > incremented but commands are never written, which would otherwise
> > lead to timeout during the drain poll.
> >
> > Update queue_inc_prod_n() to preserve this flag during index
> > calculations, ensuring that any in-flight commands that successfully
> > passed the point of commitment can proceed to completion while the
> > flag remains set.

[...]

> >
> >  static void queue_poll_init(struct arm_smmu_device *smmu,
> > @@ -718,8 +719,25 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> >         do {
> >                 u64 old;
> >
> > +               /*
> > +                * If the SMMU is suspended/suspending, any new CMDs are elided.
> > +                * This loop is the Point of Commitment. If we haven't cmpxchg'd
> > +                * our new indices yet, we can safely bail. Once the indices are
> > +                * committed, we MUST write valid commands to those slots to
> > +                * avoid indefinite polling in the drain function.
> > +                */
> > +               if (Q_STOP(llq.prod)) {
> > +                       local_irq_restore(flags);
> > +                       return 0;
> 
> On second thought, I no longer believe that this is safe. I understand
> that READ_ONCE(cmdq->q.llq.val) implies no ordering guarantees with
> respect to any writes to translation tables. In the non-stopped case,
> we can rely on the call to dma_wmb() further down in this function.
> However, for the stopped case, I can't identify any barriers that
> would ensure that the STOP flag is checked only after the writes are
> visible to SMMU. Here is an example: Let's assume the following
> program order:
> 
>  * Write to invalidate PTE
>  * Read from cmdq->q.llq.val, determine STOP flag is set, elide TLBI
> 
> What prevents the CPU from reordering these operations as follows?
> 
>  * Read from cmdq->q.llq.val, determine STOP flag is set, elide TLBI
>  * Write to invalidate PTE
> 
> Can the following situation occur?

Not really because:

> 
>  * Read from cmdq->q.llq.val, determine STOP flag is set, elide TLBI
>  * (Different CPU resumes SMMU)

We do a full smp_mb() here to ensure all writes are seen before SMMUEN=1
(note that the STOP_FLAG is already unset at that point, so we stop
eliding commands much before the SMMU is physically able to access any
config/xlation structures, I've explained everything below).

>  * SMMU loads old PTE value into TLB
>  * Write to invalidate PTE
>  * (stale PTE remains in TLB)
> 
> I propose the following: If you find the STOP flag set, run dma_mb()
> and check again. I'm afraid that running dma_mb() unconditionally
> might incur too much of a performance penalty.

IMHO, I think this might be overcomplicating things here.. 
Here's why the current version works according to me:

Till SMMUEN=0, the SMMU is spec-guaranteed to never access translation
or configuration structures (Section 6.3.9.6). 

Our runtime_suspend callback sets SMMUEN=0 before setting the STOP_FLAG.

Even if the worker CPU reorders the PTE write after the STOP_FLAG check,
it is benign because the SMMU is incapable of fetching that (or any) PTE
while the gate is closed. Because GATE_CLOSED == SMMUEN = 0, implying no
access to any HW structures whatsoever.

The real synchronization happens in the Resume Path:

1. arm_smmu_device_reset() clears all caches / TLBs.
   (None of these can have entries before SMMUEN=1)

2. We execute a full smp_mb() before setting SMMUEN=1. (that's why we
   need smp_mb before SMMUEN=1). This barrier ensures that any PTE 
   writes made by any thread—including those that were elided while the
   gate was closed, are globally visible before the SMMU hardware starts 
   fetching into TLBs again. (This is why Jason suggested this in v6 [1])

Adding a dma_mb() to the elision path would be redundant given the
SMMU can't access any structures and the resume barrier. We'd be
needlessly injecting dma_mbs when no entity is actually accessing those
structures while the STOP_FLAG is set. 
> 
> I have the same concerns with arm_smmu_cmdq_can_elide(): That
> READ_ONCE in arm_smmu_cmdq_can_elide() provides no guarantees in
> regards to ordering relative to PTE writes.
> 

The same as above, No structures are accessed during SMMUEN=0 (spec) and
during resume before setting SMMUEN=1, we do a full smp_mb() to ensure
all concurrent PTE writes are acquired in our resume thread before we
enable SMMUEN=1

Thanks,
Praan

[1] https://lore.kernel.org/all/20260424151639.GE3611611@ziepe.ca/

