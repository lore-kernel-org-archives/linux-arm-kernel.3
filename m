Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3F9C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlwW9UoqChuDQG8Ubc8yfsDP24EvYv1xxnKt9rNQ+co=; b=08MjbceWL165STXqNx94CXDV2K
	zBbwH6vulFVOmpausG3bOow8Odo5pkpYgg0Fpnn/FFSbfOZUFdWpOYZrhp+DEV5igvQij6RPG8jzz
	CYT5IS1HbpzMYDCl+orIhOwJtY24i0Vf7jTixHIPji6qg8PhyD7bwgVVlpi8pN7blnhapYnzfDOBY
	zJWkpaEvFmFebjt7U7IDqEK0vdkYehRlgHWufXaQwKdnNAYcuOFZlVSnkHaaqvfaxcr98+YyPq7vu
	n19iAyo1GkjdAktfZEYYsQVJf7JXDjWcLkIuVulP09upxiXkFj4pQ5P6S8xK6ZYjkjb8ZuUw2cQ0Z
	qwrij3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jtt-0000000EdTK-40mg;
	Wed, 02 Sep 2026 12:17:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jts-0000000EdSr-1i38
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Sep 2026 12:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WlwW9UoqChuDQG8Ubc8yfsDP24EvYv1xxnKt9rNQ+co=; b=KNqcxapN7Z3H3ddZ587gyh6JzE
	7GX//UGsFL36lGrt/c1skceoYzBtGZPJF3R3sPdN45gAlF5CTWxgnXJbVsi8rNrkyJo7iq/GuR1mz
	AbQgP+fFVrTKEeYLPRDdhySiyI6jEGOXPmR2+0G9byHvfwqkSK721HpFX3rSwRiPr0eC3a+Y0GoKF
	c3my4/uwfxSz7trZTahxEJSSOrXCkUh8aPS+n2k1Fd7Fs3T4NFNcRBCfrEva1MjgTyCTABA/byscO
	uqu8lBdlf1jrgMMpdB4DG7bkXv2e+QMILSBuM12o4tRgosN+4YStee0bqOrhGxrCfNFAgVZ3IgDFg
	u9Sy8L+A==;
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1jtp-0000000BxZH-2Tof
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:17:07 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-52de50e77ffso10994751cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788351423; x=1788956223; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WlwW9UoqChuDQG8Ubc8yfsDP24EvYv1xxnKt9rNQ+co=;
        b=KphQdVEy4ijI9Ojy26tbuCApjackzGY90J+stL2L9ItySKSesrejR9N7lZoEMPLEQL
         JCfP/2af+WKwzTNXZMeLWSLAyQ7XRDDgdcI3XXXJz/fErlDmBEtMr/6nTg3T4tsD76OR
         MCuKyCbInuirDjRQU0Qqgadsn8HsqhWemz41gCGL9ZqYTN2KzzoGA0DpglUpMHVmaCs5
         VSQhBzxCB+4JMpvwsoFvFOWpiNujAOmgTeXwWZVJPmVDwushEegeQT7iMFB8BeIsTkRQ
         JZEpo4WeppkEcwJGcVYwRnEUHCy52Eeo2F2sNSKplWq53pZp2kRAHlCWyd2p+wFyFWaa
         KkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351423; x=1788956223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlwW9UoqChuDQG8Ubc8yfsDP24EvYv1xxnKt9rNQ+co=;
        b=VFD5zAVcepSoOshAiJGQaAbluuPnCy39BRzDZ7c2M09fsXNed5eFnza/GLDX79M3k0
         xyu40r25Pl1p8mTkFM+WbMs2TP949ukOXfLaR1QxrI/sUcjk+VOXrpdWwtS6Z8IU+aiX
         59zUw7cKqoEvW47iGq6GJsi6SwKRHRtd+A2rlRZQ+C1EQo/79hJ5n2zjNGyofyAZXNW1
         JZyg1JQERwGRy57bI4ibp90XwVlHXve3d6+Q/lfzClv3oGe75SwrF71o5pVOCGze+ESm
         HSWJbzyo4FkX8OdbijlSgG3uK7NfmFJ+efaIa3GwDnr+lKMNofFdPCATq5aogYhGAWfR
         7Lpw==
X-Forwarded-Encrypted: i=1; AHgh+RoEG1ThDBIi7KXSmbuFWv5Bq9zTjsBvWWBw179ABHbVwpCwEwhB4QRpx1sko2irhKCFoRMM2pcCfbVCORcZwNcw@lists.infradead.org
X-Gm-Message-State: AFuF++kRN79PR/fCnlI++3K28Kxm3OkDzUo/YjETHYXOChBd70ypLVws
	TaQ55jBte1/K0N2Wjks0Gs2ZVeOXtGKhyQidaUCI7x0GBqjubiX/3JIVi4XZzi7R2lo=
X-Gm-Gg: AR+sD11j88R+CThB+8EUI8pHQgEG4wdEIJWaf8/rZan7KGPj6bcSFYy9lLEpVzoitL1
	jmfTGdTy1bTvQsJGL/QgJ8wTib1jBp25f+ecvV0DVNUJfOq/GujUW49eWAxZ7RAc+TVkd7KCT3u
	msnEy3GyfPlSKc3Cz1Uh47jFzuaSz3sNL/CLqQccZkhvAvWUhMfDl6gG0AmWk9M19Ma2yHRadh7
	GwuIzxykizcB2UkDIoneruXxnbhVE/GceqSIKpNsLMgc5Pc5VXFZMbpgWTLDJqRSZjUV8Wksry+
	jvrv9XgXjYdCKZ8mrSObPQ7QxJj7SmmT4qIqj44oKMIy2G/w6wnHbvu86b1Sjtm8kHVWiTt5AJg
	yh6KlOZPaPJlkl2OxtXl3rwf85dlqC7Fa8nI3e/OngyQLqRz+mx3RcYIpYSIiaWjYEicQyfMIqV
	spgSsvBWjb83dzaETv0ciAKl4o15o0uHfB38pZFFtsEwHrbdw8Vzeq7IPudeQLrEn4ThVCvi0Vr
	rR69DgWq/Z5B9DrYIKsWMHUFEICIvF8jqYuSNXAI100MA==
X-Received: by 2002:ac8:5d49:0:b0:527:7a5b:ca67 with SMTP id d75a77b69052e-53036cc7263mr48464101cf.20.1788351423074;
        Wed, 02 Sep 2026 05:17:03 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53032ff4e90sm17590961cf.2.2026.09.02.05.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:17:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1jtk-0000000EB68-1U6I;
	Wed, 02 Sep 2026 09:17:00 -0300
Date: Wed, 2 Sep 2026 09:17:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260902121700.GC2890729@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a8q5kkoz3.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131705_693182_7BB8A9EC 
X-CRM114-Status: GOOD (  31.17  )
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

On Wed, Sep 02, 2026 at 02:30:00PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Tue, Sep 01, 2026 at 03:36:37PM +0530, Aneesh Kumar K.V wrote:
> >
> >> @@ -463,14 +460,13 @@
> >>  	vsmmu->vmid = s2_parent->s2_cfg.vmid;
> >>  
> >>  	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
> >> +		if (arm_smmu_is_realm_viommu(viommu))
> >> +			return arm_realm_smmu_v3_init(viommu, user_data);
> >> +
> >
> > I think the realm vsmmu is going to require a different info struct
> > than the normal psmmu case, isn't it?
> >
> > If so it needs its own enum value.
> >
> > It would be nice to see a draft patch showing how the real vsmmu works
> > on top of the RMM spec for it. If we are using a viommu object then
> > non-vsmmu case should be identical just with an option in the info
> > struct to not create the vsmmu object.
> 
> Based on feedback on other emails in this thread, I have now implemented
> this without using a vdevice or viommu. This should make the CCA and
> non-CCA cases similar.

That wasn't the feedback. The feedback was to use the viommu and not
make a bunch of new stuff..

> +int arm_smmu_realm_tsm_bind(struct device *dev, struct kvm *kvm)
> +{
> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +	int ret;
> +
> +	if (!kvm_is_realm(kvm))
> +		return 0;
> +
> +	ret = arm_realm_smmu_get(master->smmu);
> +	if (ret)
> +		return ret;
> +
> +	ret = arm_realm_smmu_stream_get(master);
> +	if (ret)
> +		arm_realm_smmu_put(master->smmu);
> +	return ret;

It still makes no sense this doesn't do the VDEV_CREATE too.

> iommufd_device_tsm_op_ioctl()
> 
> 	switch (cmd->type) {
> 	case IOMMU_DEVICE_TSM_BIND:
> 		if (!idev->tsm_iommu_bound && ops->tsm_bind) {
> 			if (WARN_ON_ONCE(!ops->tsm_unbind)) {
> 				ret = -EOPNOTSUPP;
> 				break;
> 			}
> 			ret = ops->tsm_bind(idev->dev, kvm);
> 			if (ret)
> 				break;
> 			idev->tsm_iommu_bound = true;
> 			iommu_bound = true;
> 		}
> 		ret = tsm_bind(idev->dev, kvm, cmd->tdi_id);

Yuk! Now this uAPI doesn't make any sense when you have an actual
viommu involved, we can't take tdi_id from userspace, it must come
from the vdevice.

I don't want two confusingly different flows, this stuff is hard
enough to keep straight.

Your first version was better, we just need to commit to using the
viommu for everyone on every arch and drop the the tsm_bind() API and
IOMMU_DEVICE_TSM_BIND interface.

The only draw back is the VMM has to manage a litte bit more.

Jason

