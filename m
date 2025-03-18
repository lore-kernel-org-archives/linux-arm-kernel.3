Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C9AC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6sb7WWpK/eIZmNqYlPEkwi7g9bmdjRdBS2xGKsLKs8=; b=WkqE912tlURyMQMdrgSUPzYjva
	fx+dpbhZ/BMXcMeeYUlcVurH3cdDY5eLm+0Yp6ek2Ag91nb7oUtvOH0Kw2fXjiZHVW2xtBzS9sWhH
	2hqcx4502oFZYQ6mm9k6Wj50zj+MaRvhThvkFoKh8iyiZxbnx4W4BZBvOJfKj3APXI2dOlrLxzPDn
	KGwJzDF+cD+Wou6AoYwUoNz2lOny1AF1jSgqYwdaJCK22uY3YEJfTGCYhpP7n0zmv06nmn6BJ75LH
	+0HkQfHDcQLtQuEYP7aDXgKNsLN/rHkSPRXaky/HsgaNf1ozrOcNuRUp2+v/PO9eumc2nK9iAntOY
	QgNCYm5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZEH-00000006Pse-0zqT;
	Tue, 18 Mar 2025 15:51:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZAY-00000006P8S-0Db6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 15:47:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 744945C424B;
	Tue, 18 Mar 2025 15:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08C7C4CEDD;
	Tue, 18 Mar 2025 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742312873;
	bh=sD58zLcw1T6P8NiMUNq1sVXKAK5W9zvgQDpdOg2n0YE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGA4YBl+hzKVuvM/XqteBDWWK3b6pIavAqDW2+cK9UD9m1xGSZsXCjxkcKNxZo3w+
	 Tk/Ufcoc4skZ/mDTLKBug0+5qNsXtv0YB9t32+HEKcW+BGajMQSviBMY5HjJcQ5M8L
	 qMRzug9ByKKSpMDTakbTrJlTOqoDMuwPYZGxPwL71bMS1wAD4Uny6PZDUCHm4Ckr9X
	 V81MI3EvYLo5/nx+BkM3U8NiK79tmbBg9GUBn2HGN6D2HusssZ8S3E1XAiDq2NAvXF
	 F4KAOKtMOI923jaVvp/DXpIrB5EOivAeJ+wWTINT0pSdBfytn05v7kaiuufwE99T+T
	 s9l+MGxUEXo1Q==
Date: Tue, 18 Mar 2025 15:47:47 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
Message-ID: <20250318154746.GB13829@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
 <20250311181151.GD5216@willie-the-truck>
 <CACu1E7Gg3WpQASADAdediRzFz2wEXAnfD7tg05XkiXZQp=X8fQ@mail.gmail.com>
 <20250312124907.GB6181@willie-the-truck>
 <CACu1E7Hm=DWDC2aFdBRkT8f=8gKXJPpif_uEOA9iFZcyT-uCfQ@mail.gmail.com>
 <394571e1-f86d-472c-91dc-4377d512bfbe@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <394571e1-f86d-472c-91dc-4377d512bfbe@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_084754_202917_5B1D3F1D 
X-CRM114-Status: GOOD (  29.86  )
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

On Tue, Mar 18, 2025 at 01:36:55PM +0000, Robin Murphy wrote:
> On 12/03/2025 1:30 pm, Connor Abbott wrote:
> > On Wed, Mar 12, 2025 at 8:49 AM Will Deacon <will@kernel.org> wrote:
> > > On Tue, Mar 11, 2025 at 04:01:00PM -0400, Connor Abbott wrote:
> > > > On Tue, Mar 11, 2025 at 2:11 PM Will Deacon <will@kernel.org> wrote:
> > > > > On Tue, Mar 04, 2025 at 11:56:50AM -0500, Connor Abbott wrote:
> > > > > > +     /*
> > > > > > +      * If the device is on and we changed the setting, update the register.
> > > > > > +      */
> > > > > > +     if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
> > > > > > +             spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> > > > > > +
> > > > > > +             u32 reg = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> > > > > > +
> > > > > > +             if (enabled)
> > > > > > +                     reg |= ARM_SMMU_SCTLR_CFCFG;
> > > > > > +             else
> > > > > > +                     reg &= ~ARM_SMMU_SCTLR_CFCFG;
> > > > > > +
> > > > > > +             arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, reg);
> > > > > 
> > > > > Are you sure you don't need TLB invalidation for this to take effect? I
> > > > > think some fields in the SCTLR can be cached in the TLB but you'll need
> > > > > to check whether or not that applies to CFCFG.
> > > > > 
> > > > 
> > > > I think it should be fine because CFCFG only controls behavior when
> > > > there's a context fault and there can't be TLB entries for entries
> > > > that cause a context fault: "The architecture permits the caching of
> > > > any translation table entry that has been returned from memory without
> > > > a fault and that does not, as a result of that entry, cause a
> > > > Translation Fault or an Access Flag fault."
> > > 
> > > Ok, but what about other types of fault? For example, a permission fault
> > > or an address size fault?
> > > 
> > I'm not sure, but the pseudocode for context faults mentions
> > resampling CFCFG after a fault happens ("We have a fault and must
> > resample FSR, CFCFG and HUPCF") so I don't think it would be legal to
> > cache it. Also in practice this does seem to work. Does that answer
> > it?
> 
> FWIW I checked with the former MMU-500 design lead, and although he doesn't
> remember the exact details he's pretty confident that they wouldn't have
> cached anything fault-related, so at least from our side I'd consider this
> OK.

Thanks for checking, Robin.

Connor -- please can you stick some of the above in a comment prior
to the CFCFG munging so I don't "rediscover" the problem in the future?

Will

