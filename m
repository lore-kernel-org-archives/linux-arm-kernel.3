Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E0AC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5QKxnLZKN15CjETYE0cz5F8y62z+3Lyd2c2OfhrGOQ=; b=18yj91T5L1DJwwax2dAbupF3B9
	+nVx9BVuabxyT//cvPSbyE7PxDrKKeJBDu5Ly6WvBYoo+8Kq1OIFVSTdzyhOJwcmIB2GzwaW6NUzl
	yXJ9/CeeQ8kC+h5ZYbdUDWszDrS4eOlIv4gww8cstJEepDOE7hDEiTy05t8djFoVNnZx8qo5JKm2J
	vBtbZjcUc3R0SDo5FbnUKdCHMlFmzAB2ECVAVvXQMfZRw3TDzuSr6Tm0ygl2c/gdqyYevqxsG1vhc
	EXYezcVgZGjAyDS2jKUngVlOg4jG2nn3Rlb165hDhuklC3FNXAb0fj358dXftuOm4LjXSVhivfEh3
	LNKKl68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gNd-00000008x77-0fLu;
	Tue, 29 Apr 2025 08:31:53 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gK5-00000008wNx-3iVd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:28:15 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2240aad70f2so89175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 01:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745915293; x=1746520093; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D5QKxnLZKN15CjETYE0cz5F8y62z+3Lyd2c2OfhrGOQ=;
        b=Mny6tQS6cqCH9B5vtKCOReZPxbT0t1vVwgZTeAsXYJo/WVDiWaZOPzQSIoSGVbCtVv
         iyl9Ia8cy4UzOvm244c8t4zYNHXOjUzFs4KZ4gBHjFfUs+k+0qtA+SUZOrmooAM5BlLm
         yiVd6UNu4xy22jjipsV4JsgCTL+/deyh7ZWirAkAbR5Qd+n5xP4j1MMmf5J0zn4QI3Q9
         oSJJBoftgkqjjxP1RUQ0JiY0vbb2Sg56xa2Il7AeWuzgIEfe0uh6JqqR8X97tiB2ZQeb
         yN76MGv6GmgfsKMIUtNQ2y0YQV0nEkeA6k4L5PrSR7guLU6lKSM8glNrVT21Ye59+n/e
         6aMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915293; x=1746520093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5QKxnLZKN15CjETYE0cz5F8y62z+3Lyd2c2OfhrGOQ=;
        b=IYwkUT8Ij7A38z55DdgXY0/++ywrLcKoxcGbxhVnmeN7KZpIvAwcq4SrmKrXxdDwa7
         607pCHotnRaOPNru8CiNnvAh9Ho4IvvuaUXqXL4UQkVGty7uaRG1wnRQgnTXGnouioXy
         Pp8q9Dn2un4OO4fIVq0kWuZRwedGTbjDJtAFnZCRov44kg55dQMxtTTZwd6LDOdgyK+k
         bNTZFruObEEfjCo08riW+4MjHap+CPxWCfrluz1fit0WckoWNO5WiDPvLRakhHvkK5K/
         rgFOuT1EKpkgef5cR3tbCQfigxPpwLqva9pFAqB545FF6MeZ0JOTr3q3vsQ0prpfbU+h
         cXXA==
X-Forwarded-Encrypted: i=1; AJvYcCUCDitB7CAvjjw9hMJFFmSrQbQ7vl657lAZgQNoNbPgXff0S6khXaALPT+lLdfjR+laUmT2Zpl7nuMdG8bKMHDy@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ4MK70DC1SW3dcCIkSH7cpMk2jLP+CPkTDK1HfVdD99+QGX6I
	0GctWv8YmfdLJd+QbTcgX0dHaDVABqZrF6Q9gD78YzIdBp+L3P38NSLFf8Mpmg==
X-Gm-Gg: ASbGncuwACJgjAC0qXacWP5nldpWi4PJHbBm2OCMImWS5XxaPUnc4Sg3YPW5009yXQL
	16RsyVAyv5oFpqw7E/Pfvd5y/yuylpJ0o1jAbzq+bJ6L5WyJFiTLasTOA6X0plMbFnoGXH9Y6PC
	riize4EfTBaXbHG9vqNiC/wJrIlfze7AII48HuXmA908VV2Gv6mdQaukSDmIVnwAXngEL6+J7Vx
	e1O2AScIEO8gVqd00o/+108zwv0TzIWyOIzAe0yRCi84kVqhFjT8uXJpBzJhlUdF1dYQ+HTVhqM
	Zzq2QykT1JMYIekEJRvZLLCEmRSenjR16hMNzr5Tw7G9W8tRpy2Kjaegavt/IZdjfL2LBsMz
X-Google-Smtp-Source: AGHT+IEBLTjQEPi6T2MilTT/Y6yv+CY2P+m49PsmJxyrcH4D1FATZ6uG7LkMVqt9dbTXi33w3gHvEg==
X-Received: by 2002:a17:902:f643:b0:223:f479:3860 with SMTP id d9443c01a7336-22de6de05c5mr2640355ad.18.1745915292715;
        Tue, 29 Apr 2025 01:28:12 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a995edsm9628409b3a.130.2025.04.29.01.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:28:12 -0700 (PDT)
Date: Tue, 29 Apr 2025 08:28:01 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 10/22] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
Message-ID: <aBCNkcLp6XZpjYYT@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
 <aA_0TV0RkVOHk7Qj@google.com>
 <aBAEuP9962XweHPc@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBAEuP9962XweHPc@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_012813_926938_252A4E48 
X-CRM114-Status: GOOD (  36.32  )
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

On Mon, Apr 28, 2025 at 03:44:08PM -0700, Nicolin Chen wrote:
> On Mon, Apr 28, 2025 at 09:34:05PM +0000, Pranjal Shrivastava wrote:
> > On Fri, Apr 25, 2025 at 10:58:05PM -0700, Nicolin Chen wrote:
> > > @@ -501,6 +504,9 @@ static const struct iommufd_object_ops iommufd_object_ops[] = {
> > >  	[IOMMUFD_OBJ_IOAS] = {
> > >  		.destroy = iommufd_ioas_destroy,
> > >  	},
> > > +	[IOMMUFD_OBJ_VCMDQ] = {
> > > +		.destroy = iommufd_vcmdq_destroy,
> > > +	},
> > >  	[IOMMUFD_OBJ_VDEVICE] = {
> > >  		.destroy = iommufd_vdevice_destroy,
> > >  	},
> > 
> > When do we expect the VMM to use this ioctl? While it's spawning a new
> > VM?
> 
> When guest OS clears the VCMDQ's base address register, or when
> guest OS reboots or shuts down.
> 

Ack. So, basically any write to VCMDQ_BASE is trapped?

> > IIUC, one vintf can have multiple lvcmdqs and looking at the series
> > it looks like the vcmdq_alloc allocates a single lvcmdq. Is the plan to
> > dedicate one lvcmdq to per VM? Which means VMs can share a vintf?
> 
> VINTF is a vSMMU instance per SMMU. Each VINTF can have multiple
> LVCMDQs. Each vCMDQ is allocated per IOMMUFD_CMD_VCMDQ_ALLOC. In
> other word, VM can issue multiple IOMMUFD_CMD_VCMDQ_ALLOC calls
> for each VTINF/vSMMU.
> 

Ack. I'm just wondering why would a single VM want more than one vCMDQ
per vSMMU?

> > Or do we plan to trap access to trap the access everytime the VM
> > accesses an lvcmdq base register?
> 
> Yes. That's the only place the VMM can trap. All other register
> accesses are going to the HW directly without trappings.
> 

Got it.

> > > diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> > > index a65153458a26..02a111710ffe 100644
> > > --- a/drivers/iommu/iommufd/viommu.c
> > > +++ b/drivers/iommu/iommufd/viommu.c
> > > @@ -170,3 +170,97 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
> > >  	iommufd_put_object(ucmd->ictx, &viommu->obj);
> > >  	return rc;
> > >  }
> > > +
> > > +void iommufd_vcmdq_destroy(struct iommufd_object *obj)
> > > +{
> > > +	struct iommufd_vcmdq *vcmdq =
> > > +		container_of(obj, struct iommufd_vcmdq, obj);
> > > +	struct iommufd_viommu *viommu = vcmdq->viommu;
> > > +
> > > +	if (viommu->ops->vcmdq_destroy)
> > > +		viommu->ops->vcmdq_destroy(vcmdq);
> > > +	iopt_unpin_pages(&viommu->hwpt->ioas->iopt, vcmdq->addr, vcmdq->length);
> > > +	refcount_dec(&viommu->obj.users);
> > > +}
> > > +
> > > +int iommufd_vcmdq_alloc_ioctl(struct iommufd_ucmd *ucmd)
> > > +{
> > > +	struct iommu_vcmdq_alloc *cmd = ucmd->cmd;
> > > +	struct iommufd_viommu *viommu;
> > > +	struct iommufd_vcmdq *vcmdq;
> > > +	struct page **pages;
> > > +	int max_npages, i;
> > > +	dma_addr_t end;
> > > +	int rc;
> > > +
> > > +	if (cmd->flags || cmd->type == IOMMU_VCMDQ_TYPE_DEFAULT)
> > > +		return -EOPNOTSUPP;
> > 
> > The cmd->type check is a little confusing here, I think we could
> > re-order the series and add this check when we have the CMDQV type.
> 
> This is the patch that introduces the IOMMU_VCMDQ_TYPE_DEFAULT.
> So, it's natural we check it here. The thing is that we have to
> introduce something to fill the enum iommu_vcmdq_type, so that
> it wouldn't be empty.
> 
> An unsupported DEFAULT type is what we have for vIOMMU/vEVENTQ
> also.
> 
> A driver patch should define its own type along with the driver
> patch. And it's what this series does. I think it's pretty clear?
> 

Alright. Agreed.

> > Alternatively, we could keep this in place and
> [..]
> > add the driver-specific
> > vcmdq_alloc op calls when it's added/available for Tegra CMDQV while
> > stubbing out the rest of this function accordingly.
> 
> Why?
> 
> The vcmdq_alloc op is already introduced in the prior patch. It
> is cleaner to keep all core code in one patch. And then another
> tegra patch to add driver type and its support.
> 

Alright.

> Thanks
> Nicolin

Thanks,
Praan

