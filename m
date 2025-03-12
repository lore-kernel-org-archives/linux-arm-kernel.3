Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E21C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 16:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/13/lxe5SGNLMkQZkS0tixVogOSoXmx7ReH6gtzwzgc=; b=NO+yY/M8B9ZhSI5taOL1kOnFZ2
	Aoa1nPIjoyESd4cVxf/y2r1/oR/1mmI62hi7m38pgTntvjmo8ctl/VzYnie1IQvKh9yrY4gVb0o29
	PMCDmrsqDNWW7u68OM3d6Y8Af/S2IG/3/1Jymc385rmD3j4qcAYK4Cz6HH4Lk9hY0oBmO160Qcdk4
	Ipgm7M8f6d0lXhdliIADw5EbalbNRfMtBCtjEnwWGiFGpAm/JIkG7RA8gF6s3UARoeCdDo4rejwTq
	M3vl+z7UhwK0TB2eTO+DK56qLPgShJZHzGr7tUjALW2mZCuDnyJSyTes/AIpsL6aLA8Nn4Gx/IKyR
	IEgYKD5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPGo-000000094BX-3ZWc;
	Wed, 12 Mar 2025 16:49:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPFA-000000093vX-0sDu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 16:47:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 72A39A45DD5;
	Wed, 12 Mar 2025 16:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94A1C4CEDD;
	Wed, 12 Mar 2025 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741798063;
	bh=ELSEo0D7KcKhySYOIqk4yKTpqKUpc0DRoOc04z68Nyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJ3wvFgRU+05Re8+zMFHdJQyGysGsqfW9WFRtbywXLUgpmxuH26PtWMJIOQ3AagEX
	 jHaMqDtG8Phx4NJ1N2ujNKN3rxoAEJZ8oiaP2MdnGKQhFHgdO3908ga5pUtftOqiKh
	 mY+KgrgaNokT9UYHN6EWHpcfZQVYqhdc7ue+fbwaMehUSPkiFvgXozJcdiPOXWpdxN
	 yiix2EyQfDaA2j9Jt2KP2bObjrrzX4O14ZCk1paF7R4qAHOSULtXEbQ/O5NqeXjTQM
	 VzJxD/annxVwCotkTPXFThqgYDNqNI7crJlrK9Kh95zzZ8UWSVFa9rvjLcWU4PbVZY
	 y4/cCZmfNf0Lg==
Date: Wed, 12 Mar 2025 16:47:36 +0000
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
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
Message-ID: <20250312164735.GA6561@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck>
 <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
 <20250312130525.GC6181@willie-the-truck>
 <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_094744_372994_D3AA6E4B 
X-CRM114-Status: GOOD (  31.53  )
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

On Wed, Mar 12, 2025 at 07:59:52AM -0700, Rob Clark wrote:
> On Wed, Mar 12, 2025 at 6:05 AM Will Deacon <will@kernel.org> wrote:
> > On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> > > On Tue, Mar 11, 2025 at 2:06 PM Will Deacon <will@kernel.org> wrote:
> > > > On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75eea1d5de23117de 100644
> > > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
> > > > >                                     struct arm_smmu_context_fault_info *cfi)
> > > > >  {
> > > > >       cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > > > > +     cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
> > > > >       cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > > > > -     cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > > > > +     cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > > > > +     cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
> > > >
> > > > We already have an implementation hook (->get_fault_info()) which the
> > > > qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
> > > > That thing dumps these registers already so if we're moving that into
> > > > the core SMMU driver, let's get rid of the hook and move everybody over
> > > > rather than having it done in both places.
> > >
> > > As you probably saw, the next commit moves over
> > > qcom_adreno_smmu_get_fault_info() to use this. The current back door
> > > used by drm/msm to access these functions is specific to adreno_smmu
> > > and there isn't an equivalent interface to allow it to call a generic
> > > SMMU function so it isn't possible to move it entirely to the core. At
> > > least not without a bigger refactoring that isn't justified for this
> > > series that is just trying to fix things.
> >
> > Ok :(
> >
> > > > >       cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> > > > > +     cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);
> > > >
> > > > I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
> > > > it for stage-2 domains.
> > > >
> > > Does it matter if we read the register though, as long as users are
> > > aware of this and don't use its value for anything?
> >
> > I think the contents are "UNKNOWN", so it could be hugely confusing even
> > if they just got logged someplace. Why is it difficult to avoid touching
> > it for stage-2?
> >
> Fwiw, we are only ever using stage-1

Sure, but this is in arm-smmu.c which is used by other people and supports
both stages.

Will

