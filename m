Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70551C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5j450JbBuDuPITFLX1s0bToU1NZ6nNq4K12lhBnqTiI=; b=EMLA4ccoaIjQvRTHqTFAR4DJGc
	stUUqqVKCOF1M6kXavsH5a3jxXNndjWM9fW76x3XDlgAlaHAkofnIwkJAn9KN77vA4DnGCYossNY3
	3h6oh/AKvMUhYjnMzRUYA3P9EBz0A3OxO7GcZhAwz/UpBzWe0iJiy2MzpxbYbuj77NI6dIl5rLSW5
	1mY6RuUoZ/fLaVou3EeIEr5V3zluGK/S8Gh5ObOwGuVAPRI1gruKTgyUntNnDDu9yjFoMDMFAo8UC
	6VyzVoggYREWAxACOfFaomSrLaGw59ox05CGKQBbnWHUMrZpkhfLuXwhvJXe0PurT01jCDBEb4mjE
	4fwEWOUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPox-0000000DXYU-0VSa;
	Tue, 20 May 2025 16:28:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHP3W-0000000DNVb-2dih
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:39:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C5CEBA4EC32;
	Tue, 20 May 2025 15:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7D9C4CEE9;
	Tue, 20 May 2025 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747755541;
	bh=sKOxL3UnucR2I5+tf+DEeVyHpzBBe8EpNpF/XVuowao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pa3eJuRkABExyc48wkNOyqxvROSQjsTHTAdMuwIk+15FOgq/3pRi4Soy7iI5Vtmay
	 ZxWcl+S50aSiv4CGGtltlQ585kbP+caRFc18ASkIRVC/83q6EyzkrO8iOIEo7l0oPU
	 /3xzCGc6ohaNcj9ibX7QR5DOX2/7H6dOVoeySpjjt8dknoCgeIdRhPz8CTYVjvBVUv
	 A7S3X/VK8JdkY9FEbULEsrI7yWSIgyxvMa0FMcK0zdCj5yf+HmsPsih8S8o5z+QlAW
	 sPY2ID2lOVhLlhbkcNfvEJ+0HpuVW8AoEJ5RAdMtXFXJGEky4E7d6w2fMmQAZ5466Q
	 nnMTyVrtMIA4Q==
Date: Tue, 20 May 2025 16:38:56 +0100
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v6 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Message-ID: <20250520153855.GG18901@willie-the-truck>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
 <20250520141857.GC18711@willie-the-truck>
 <CACu1E7HdJvbx_6L9KvX3n78_cbkrey8npo=O=AkEzg335wJC=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7HdJvbx_6L9KvX3n78_cbkrey8npo=O=AkEzg335wJC=g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_083902_806546_98F2373E 
X-CRM114-Status: GOOD (  31.62  )
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

On Tue, May 20, 2025 at 10:42:49AM -0400, Connor Abbott wrote:
> On Tue, May 20, 2025 at 10:19 AM Will Deacon <will@kernel.org> wrote:
> > On Thu, May 15, 2025 at 03:58:42PM -0400, Connor Abbott wrote:
> > > drm/msm uses the stall-on-fault model to record the GPU state on the
> > > first GPU page fault to help debugging. On systems where the GPU is
> > > paired with a MMU-500, there were two problems:
> > >
> > > 1. The MMU-500 doesn't de-assert its interrupt line until the fault is
> > >    resumed, which led to a storm of interrupts until the fault handler
> > >    was called. If we got unlucky and the fault handler was on the same
> > >    CPU as the interrupt, there was a deadlock.
> > > 2. The GPU is capable of generating page faults much faster than we can
> > >    resume them. GMU (GPU Management Unit) shares the same context bank
> > >    as the GPU, so if there was a sudden spurt of page faults it would be
> > >    effectively starved and would trigger a watchdog reset, made even
> > >    worse because the GPU cannot be reset while there's a pending
> > >    transaction leaving the GPU permanently wedged.
> > >
> > > Patches 1-2 and 4 fix the first problem by switching the IRQ to be a
> > > threaded IRQ and then making drm/msm do its devcoredump work
> > > synchronously in the threaded IRQ. Patch 4 is dependent on patches 1-2.
> > > Patch 6 fixes the second problem and is dependent on patch 3. Patch 5 is
> > > a cleanup for patch 4 and patch 7 is a subsequent further cleanup to get
> > > rid of the resume_fault() callback once we switch resuming to being done
> > > by the SMMU's fault handler.
> >
> > Thanks for reworking this; I think it looks much better now from the
> > SMMU standpoint.
> >
> > > I've organized the series in the order that it should be picked up:
> > >
> > > - Patches 1-3 need to be applied to the iommu tree first.
> >
> > Which kernel version did you base these on? I can't see to apply the
> > second patch, as you seem to have a stale copy of arm-smmu-qcom.c?
> >
> Sorry about that, for the next version I'll rebase on linux-next. I
> was using an older version of msm-next for a while now.

Can you base on v6.15-rc2 instead, please? linux-next is a moving
target so it's not massively helpful to use that.

Cheers,

Will

