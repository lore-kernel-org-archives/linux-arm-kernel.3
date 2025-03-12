Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E8AC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGt+phQ1yUPbtABmil4OllQSAyzXqm6CO9sChUj/od4=; b=KOyd8vbTuFbSLUpsrmNLMxxo3a
	aQE+a+T9sds+j+sXjWrIIl42j3fvxZ8zlfBliMdFbvl4gWIPb+pQ5+fC1AJ6PSddgkZ0updU9GElu
	IsyMVAg6ICfze1TfP/EGaubUfay/tpItf95s+lX2zTm7zCtz7iv46bgat7A47s3Omfd4EUcV5XBYL
	SFXPmyziehRSze/3S65uIfrCqVz6154eLtoXpNEFY96CJEbU55BzRx+T3YTvoYocShRMVIb40UkrU
	T7pzSvUHJlIdKF25PmrPIFhspg52i17YQvfVQQmly1JlquSlwaqyvwtDEz+HVrnDm81xnlMZjwmqh
	kVhS1K3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMKU-00000008bAD-30Uv;
	Wed, 12 Mar 2025 13:41:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLpO-00000008WQt-0E2x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 13:08:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7A5C5C5A58;
	Wed, 12 Mar 2025 13:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E764C4CEE3;
	Wed, 12 Mar 2025 13:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741784933;
	bh=hwdB5W2Pu3p7Ykqhvjai1ChhLr5eStjSGb3j1Yi9kfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/JFWJq/0Uik293y1BXdAvps6dt29ppdcnHpTyTH5JhK08xDjAUijsgJhP4V4QLu0
	 UksTIMV3LLM//7ZetXvaBx/34hfiOeOVbeBn9PjrtiQ2MYvtpzK4Ce0edFsOAR+Gv2
	 0QM0+x/69TLP6h4U8CG27KMwZq9tFj21gMQQcTxTITRW5fZqN8MoByE+2MsAv32zGz
	 JV+2zWk6yKO7LJByrLM458TZFzucJyaL72/hplQrbelaXnhDgXse6QUxKi240ZH5cC
	 cFu7rb22C7QEZV8heJ6Kum/N+L2mEr2Lbw/kDSnP9cAD6JgVu2cFEBIYTfUck1ZC8y
	 Try3A64ogC96g==
Date: Wed, 12 Mar 2025 13:08:47 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org,
	Bibek Kumar Patro <quic_bibekkum@quicinc.com>,
	catalin.marinas@arm.com, kernel-team@android.com,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
Message-ID: <20250312130846.GE6181@willie-the-truck>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <173625436399.258197.10961901698600591079.b4-ty@kernel.org>
 <20250311175528.GA5216@willie-the-truck>
 <CAF6AEGvDyPtXN7Cn98BKsTM9GjUzy1sTEOsLiz-cdvaZ14qWyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvDyPtXN7Cn98BKsTM9GjUzy1sTEOsLiz-cdvaZ14qWyA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_060854_145446_B3A124D1 
X-CRM114-Status: GOOD (  18.14  )
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

On Tue, Mar 11, 2025 at 01:03:29PM -0700, Rob Clark wrote:
> On Tue, Mar 11, 2025 at 10:55 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Jan 07, 2025 at 04:42:39PM +0000, Will Deacon wrote:
> > > On Thu, 12 Dec 2024 20:43:57 +0530, Bibek Kumar Patro wrote:
> > > > This patch series consist of six parts and covers the following:
> > > >
> > > > 1. Provide option to re-enable context caching to retain prefetcher
> > > >    settings during reset and runtime suspend.
> > > >
> > > > 2. Remove cfg inside qcom_smmu structure and replace it with single
> > > >    pointer to qcom_smmu_match_data avoiding replication of multiple
> > > >    members from same.
> > > >
> > > > [...]
> > >
> > > Applied to iommu (arm/smmu/updates), thanks!
> > >
> > > [1/5] iommu/arm-smmu: Re-enable context caching in smmu reset operation
> > >       https://git.kernel.org/iommu/c/ef4144b1b47d
> > > [2/5] iommu/arm-smmu: Refactor qcom_smmu structure to include single pointer
> > >       https://git.kernel.org/iommu/c/445d7a8ed90e
> > > [3/5] iommu/arm-smmu: Add support for PRR bit setup
> > >       https://git.kernel.org/iommu/c/7f2ef1bfc758
> > > [4/5] iommu/arm-smmu: Introduce ACTLR custom prefetcher settings
> > >       https://git.kernel.org/iommu/c/9fe18d825a58
> > > [5/5] iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500
> > >       https://git.kernel.org/iommu/c/3e35c3e725de
> >
> > Hrm. I'm not seeing any user of the new ->set_prr*_() functions in
> > linux-next yet. Is there something under review, or should I revert this
> > for now?
> 
> It is WIP, part of a larger patchset adding sparse binding support in
> drm/msm.  Please do not revert.

Sure, if it's actively being worked on then I'll leave the hooks in
place.

Do you have a link to the patchset so that I can follow along, please?

Will

