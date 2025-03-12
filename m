Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B616DC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zktz/GYgVWun1Ewzx/sXuROR8SmMOdhaUKAkjae5bAI=; b=n4Z3Iy2pl47WM9PTHvXlAD76dQ
	lM2B+kPTb/pW0Er0JZDlzBONe9VeIeBWj/xkzch3UUD2CQf6elp2yFKaKAZVGZqG4Vd3niYhhOmUg
	fkSDQtiRYxVkGgHG7vq4GrpdtAW2LyNVMPSUm5lfRR5XNX+sW7Up8UI9kNQqvAVdf1ElopNFThJAP
	bjmPfc/ITI42fQDMSEHOv5No9cFfVafV4KRYsTRMsaUOpUbBNiyflk2knx9i4hpBBpHpIZEmdOo0A
	BctJhjYgEpzBk6MrMQ2KYU81lSh5qEffcTpTUe76eo+1wUuO1R6mQAQG1gCZH5jZupjhi60VH0CCM
	x/hX9JXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMFc-00000008aK4-1Iak;
	Wed, 12 Mar 2025 13:36:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLnT-00000008Vei-494u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 13:06:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A969B5C5942;
	Wed, 12 Mar 2025 13:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19DFC4CEED;
	Wed, 12 Mar 2025 13:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741784815;
	bh=O2MbGUz1AiD8KCTQch6ceIF+lKjOkrpw4sDNGkA2Mb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hM0qdPu3eaLS2K7B4XV8fay0UQdyPaaGyRjP+oWJlTLQfHtiBn14aq5of2bC/9kMt
	 ospDD7xqIHWdpRwMf3Txu72OGonBFTUtmrfCTypPf968pqTuKNDhidN4TEnbuYMzfm
	 lKW2z/g118BHuwC5sd/bnLKQR7+9RTNM39s2OEjdybhGeEhhImXOrBea9kS0nnQqJa
	 0fA/cwgrXi+dz0IN0qeJ8BaUFiqKv0jMYlAuJsKBbLLxK4AA+8aNa3W7qz67Lo0b/w
	 y6afGtTuYC+PgSN0BlV4ctcv5Jr5yQ553mjrKVr05NyYPKfMlIyLCo0oA9qxrul0g/
	 Zmo/iISH73Hvw==
Date: Wed, 12 Mar 2025 13:06:49 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Connor Abbott <cwabbott0@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 2/5] iommu/arm-smmu-qcom: Don't read fault registers
 directly
Message-ID: <20250312130648.GD6181@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
 <20250311180807.GC5216@willie-the-truck>
 <CACu1E7Hw6vGbTQ7t-Hj3ziycZhPxtOGSDkt7o4fNUx91KDcXfg@mail.gmail.com>
 <CAF6AEGs8PoZBpFesQ_DGcngn4X24wzFy=zn2mAUJepdibxoKog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGs8PoZBpFesQ_DGcngn4X24wzFy=zn2mAUJepdibxoKog@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_060656_115205_9B19FA6A 
X-CRM114-Status: GOOD (  31.45  )
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

On Tue, Mar 11, 2025 at 01:00:34PM -0700, Rob Clark wrote:
> On Tue, Mar 11, 2025 at 12:42 PM Connor Abbott <cwabbott0@gmail.com> wrote:
> >
> > On Tue, Mar 11, 2025 at 2:08 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Tue, Mar 04, 2025 at 11:56:48AM -0500, Connor Abbott wrote:
> > > > In some cases drm/msm has to resume a stalled transaction directly in
> > > > its fault handler. Experimentally this doesn't work on SMMU500 if the
> > > > fault hasn't already been acknowledged by clearing FSR. Rather than
> > > > trying to clear FSR in msm's fault handler and implementing a
> > > > tricky handshake to avoid accidentally clearing FSR twice, we want to
> > > > clear FSR before calling the fault handlers, but this means that the
> > > > contents of registers can change underneath us in the fault handler and
> > > > msm currently uses a private function to read the register contents for
> > > > its own purposes in its fault handler, such as using the
> > > > implementation-defined FSYNR1 to determine which block caused the fault.
> > > > Fix this by making msm use the register values already read by arm-smmu
> > > > itself before clearing FSR rather than messing around with reading
> > > > registers directly.
> > > >
> > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > ---
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++----------
> > > >  3 files changed, 27 insertions(+), 27 deletions(-)
> > >
> > > [...]
> > >
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > > index d3bc77dcd4d40f25bc70f3289616fb866649b022..411d807e0a7033833716635efb3968a0bd3ff237 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > > @@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
> > > >       ARM_SMMU_DOMAIN_NESTED,
> > > >  };
> > > >
> > > > +struct arm_smmu_context_fault_info {
> > > > +     unsigned long iova;
> > > > +     u64 ttbr0;
> > > > +     u32 fsr;
> > > > +     u32 fsynr0;
> > > > +     u32 fsynr1;
> > > > +     u32 cbfrsynra;
> > > > +     u32 contextidr;
> > > > +};
> > > > +
> > > >  struct arm_smmu_domain {
> > > >       struct arm_smmu_device          *smmu;
> > > >       struct io_pgtable_ops           *pgtbl_ops;
> > > > @@ -380,6 +390,7 @@ struct arm_smmu_domain {
> > > >       const struct iommu_flush_ops    *flush_ops;
> > > >       struct arm_smmu_cfg             cfg;
> > > >       enum arm_smmu_domain_stage      stage;
> > > > +     struct arm_smmu_context_fault_info cfi;
> > >
> > > Does this mean we have to serialise all faults for a given domain? That
> > > can't be right...
> > >
> >
> > They are already serialized? There's only one of each register per
> > context bank, so you can only have one context fault at a time per
> > context bank, and AFAIK a context bank is 1:1 with a domain. Also this
> > struct is only written and then read inside the context bank's
> > interrupt handler, and you can only have one interrupt at a time, no?
> >
> > Connor
> 
> And if it was a race condition with cfi getting overridden, it would
> have already been an equivalent race condition currently when reading
> the values from registers (ie. the register values could have changed
> in the elapsed time)
> 
> So no additional serialization needed here.

Oops, yes, sorry. I've been spending too long on SMMUv3 and forgot how
the context banks worked.

Will

