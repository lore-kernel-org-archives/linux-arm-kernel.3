Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A368BC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zie8FPC+ypBCiXTadchBVHx1J62Vde/cFCP4jTGgfSo=; b=l1DzEOpEzQQG8n4wKWUYWoFvOu
	GqHJ7YKVHe5btHVTiDRyGyGrglol9EeQD45nBDQa5Qe0+dzvBS/hEms1Q7arVB66g3pA5kV5ifTCn
	4QRwMUP7O8gWODD3ie1Oo683whjZc9SUiwPpmyD1tW3m+U7XsNkRiNrh1q0XZtN1SgiEhecu9ljg2
	1tuWRrmDjhMZigINUog0kiy4T7QRbqElzwqgaS3VegiOiofNcHUIqMK7Z+C4+TejTKVgV6zYXsD1J
	pi3984sNbikG9R/Y6tEIYtO+ttZK87zaHFbtP8dTy5pNeIGzjudumcgo6nhUNHv8zCYD6hNpulycQ
	RhdVa2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKkv-00000009i0g-0Aqz;
	Thu, 17 Jul 2025 09:18:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKJH-00000009cVB-1C2B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 08:49:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 23580A56051;
	Thu, 17 Jul 2025 08:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08DE7C4CEED;
	Thu, 17 Jul 2025 08:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752742185;
	bh=1LaZMmufVKTiGZ1B+WdO3aR89rghURP6uEd2rsuld3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOSFBXonALTq4dkOywT4xN2hhzCqX0iqVkTVuJJXa9C+H+FN9PkqbyO++9Mocnm5o
	 TlSekzaBH6Pn6oaDakF4NIRz9K9B0pwRmhyf+81WMF80SRwwOorv57DUCjzoItdwyd
	 fdIzVUxI4Yl0bgZ+BGfo5jzvRmFTSlYhMP3KZDlQmlmYMRbLb8vbR96EOxqttldm3L
	 CFoa7CpqGqfB6RZzgn4zJcdDjgdvfFCG1ShybgH1FM1Ka+fDvFUC076bL5DklbnXZE
	 fOQ+SImE0z8OiZQtbxTElodRLlanUXmH1gehrnxsHT95TTc4+Ty6LK1an5NU6FSeg6
	 vSiIYpw/35h/g==
Date: Thu, 17 Jul 2025 09:49:37 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v9 23/29] iommu/arm-smmu-v3-iommufd: Add vsmmu_size/type
 and vsmmu_init impl ops
Message-ID: <aHi5IUXqHJZGB67M@willie-the-truck>
References: <cover.1752126748.git.nicolinc@nvidia.com>
 <375ac2b056764534bb7c10ecc4f34a0bae82b108.1752126748.git.nicolinc@nvidia.com>
 <aHE4Y-fbucm-j-yi@willie-the-truck>
 <aHahEP0+LKmeA/Tf@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHahEP0+LKmeA/Tf@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_014947_458667_03CDF742 
X-CRM114-Status: GOOD (  26.95  )
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

Hi Nicolin,

On Tue, Jul 15, 2025 at 11:42:24AM -0700, Nicolin Chen wrote:
> Sorry for the late response.

No problem at all.

> On Fri, Jul 11, 2025 at 05:14:27PM +0100, Will Deacon wrote:
> > >  /* MMIO registers */
> > >  #define ARM_SMMU_IDR0			0x0
> > > @@ -720,6 +721,10 @@ struct arm_smmu_impl_ops {
> > >  	int (*init_structures)(struct arm_smmu_device *smmu);
> > >  	struct arm_smmu_cmdq *(*get_secondary_cmdq)(
> > >  		struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
> > > +	const size_t vsmmu_size;
> > > +	const enum iommu_viommu_type vsmmu_type;
> > > +	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
> > > +			  const struct iommu_user_data *user_data);
> > 
> > It would be nice to avoid adding data members to the ops structure, if
> 
> You mean the "vsmmu_size" and "vsmmu_type" right?

Yup.

> So you want them to be removed, by having two impl_ops:
> 	size_t get_vsmmu_size(enum iommu_viommu_type vsmmu_type);
> 	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
> 			  const struct iommu_user_data *user_data);
> 
> right?

Yes, please.

> > at all possible. The easiest thing would probably be to add a function
> > for getting the vsmmu size and then pushing the two checks against
> > 'vsmmu_type' down into the impl_ops callbacks so that:
> > 
> >   1. If the type is IOMMU_VIOMMU_TYPE_ARM_SMMUV3, we don't bother with
> >      the impl_ops at all in arm_vsmmu_init() and arm_smmu_get_viommu_size()
> 
> Hmm, I was hoping for an implementation could support the default
> IOMMU_VIOMMU_TYPE_ARM_SMMUV3 while having its own viommu_ops or so.
> But I think your suggestion is fine since there is no such a use
> case at this moment :)
> 
> >   2. Otherwise, we pass the type into the impl_ops and they can check it
> > 
> > Of course, that can be a patch on top of the series as there's no point
> > respinning the whole just for this.
> 
> Thanks for that! I can draft a patch to send later this week once
> the requirements are confirmed.

Thank you!

Will

