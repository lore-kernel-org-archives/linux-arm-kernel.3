Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6841AC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 21:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6MDLYjLn+ocuz7r4vs09MXpA233UNWx/xCnRJqXepo=; b=K6KPPoO6sg7EpFse0gUFx1fvCc
	Su6P0j9BwMPigQTK5Fsl7a7jQloVwyCrJPPdFnOr0goVE+mZnxmz+yRkboTc5fS7NuZOjE8dO3EPJ
	XOR0RNFwHVxqHLK19pUV8CnUhRHXZBWyFFySjSYgohf232DAOWWDT3h8M51A8ghguqfwp62H/UPGP
	MXDEWmslfTO7kuHKowMCMKinlX4NwYCD6QdmTjwsNsMstaqi1zrNi94Ras001Tk0ByNRD0ndwiATt
	G5424bEHFQkAJo+moO7SqV0+8uZ0vqYLkNuobsYY7GqI93B82jXeNSqkVVP1m4tcdNmNzDliMpsY3
	9W3sYWaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmg91-0000000FG0A-1z5r;
	Mon, 24 Feb 2025 21:37:43 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmg6o-0000000FFfJ-2AI1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 21:35:27 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2212222d4cdso45765ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 13:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740432926; x=1741037726; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B6MDLYjLn+ocuz7r4vs09MXpA233UNWx/xCnRJqXepo=;
        b=xvChsY2817Vb7tVh0D4en77vddX6xYR2w5rQzkRcVNsinzmAZQKHiFKrGhgQ4JsLXK
         e/ipaQ5c6KUSRlW3GWbWQp0E5pihZwnd1qqcqh53ff3bRAT65wKxOJc6mc+Rn/7oRCc9
         0QDUZ0OV5YKavR4qd72h30uXM8FCiJ0AY7CN4LCjZndZQwPYwGos7+W3tZIM+HiqSKyT
         +Iyrh8fkSSCCWuXw5E48Cyq6jp5CqpcOwoSONnaI7rTCi4E+rw9f6bvVQUDWyDsIBH2p
         H0fnG3JpgB0ZIb0zTIj+KXlgmFcBBZnd+GQVfEsRKDRfmy4KNiGLCsiVxRUOePDTcVPT
         qb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740432926; x=1741037726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6MDLYjLn+ocuz7r4vs09MXpA233UNWx/xCnRJqXepo=;
        b=lsf4pYBKHRwZu3Ib28GqgTMM0ud9wRVuQh4e+ahMwSiPHm06oGuxlb0gpjwVf8cBVh
         CDW99qpxqRvZF60Me+n+NQ14Rg/HeRv8OfpntAR+PNYk3pkv9LAGMQZBxM/i6lU5st/a
         Rr3N6ePKG+b0mlX+qi1mJ+maWEHdG1DmBjyh2e7lu4tjWKzTyMf55ja/uCLXqw97qcSd
         FR9yoNcwB7YxfXMLxEO3nDbqeMu9Pa8gu2oqqUxInDM7GWmyjwz0yNkEbTJHtYAzwIph
         Sicgyjqbt/TKxCLpJcJDRbh18F73Rgubzxq+ZqpweqCYtF70iZfpT4M/1sRKH7KbbG26
         /kIw==
X-Forwarded-Encrypted: i=1; AJvYcCW/7Uo8wZS8abCNNs3yv39YVOM1fqUSn3h9yfD9MEXRy6vguxDI4sNZqtOpA8XN/vQVZdfWXJrRtooMoMt6mbjF@lists.infradead.org
X-Gm-Message-State: AOJu0YwGCa1hohzFzoggR/qAAEGFBj5mDsFDS0QAxV2f3gKQhrJ5pWp+
	77OqYS8dr6vOOYH8PLiLJnPM/H2/G3BmVhcMYEYgHO7g/6km5tOrXL7TgAus+g==
X-Gm-Gg: ASbGnctjI7k68NBSr0tzq8EOMPdBwOi4KsMS+YalIiKqdw/9u5PkMxoU4S+ccqomY0V
	e6OEy1WYJLA+rpuvtR+iSWxfDBiATg5xpts/B4QezXEKevwPyw12sUc5uoTImc+6xcMbrhvj0xg
	D3wfwE/HplH2MDiVlkrXGr87nmEeP3+X89we6oC/swYHNbVUc8NQRrPVHQ20o1iTGA5J6K+Ltwv
	uEFCH4TaD12ewKVLc/pA9E2uEu+GD4cpmC4C9cHgkMnd+uO0CtB5KGxjf3z7vDjfGIzQCF31uzJ
	wWwOO/4Vh3AKs5Dlgnrt7+ljJ63Hv6bpMIZ382kUYiV8biAZE+PjqQY9wizMwOs=
X-Google-Smtp-Source: AGHT+IEvbtSCavbWzJzTUhgymYrP41u+KdaH4TpPZexQDV04gmMsaPcW7ZdSgqeE7hyABwizrzsr3A==
X-Received: by 2002:a17:903:234c:b0:21f:2ded:bfc5 with SMTP id d9443c01a7336-22307aab886mr1036055ad.28.1740432925555;
        Mon, 24 Feb 2025 13:35:25 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0a3ca8sm730145ad.169.2025.02.24.13.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 13:35:25 -0800 (PST)
Date: Mon, 24 Feb 2025 21:35:14 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	joro@8bytes.org, suravee.suthikulpanit@amd.com,
	robin.murphy@arm.com, dwmw2@infradead.org, baolu.lu@linux.intel.com,
	shuah@kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v7 13/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
Message-ID: <Z7zmErar4YvQSSxw@google.com>
References: <cover.1740238876.git.nicolinc@nvidia.com>
 <b1930038cf828dc13c080e2b46b3003a8c98ef24.1740238876.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1930038cf828dc13c080e2b46b3003a8c98ef24.1740238876.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_133526_556563_CABD2DFD 
X-CRM114-Status: GOOD (  36.85  )
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

On Sat, Feb 22, 2025 at 07:54:10AM -0800, Nicolin Chen wrote:
> Aside from the IOPF framework, iommufd provides an additional pathway to
> report hardware events, via the vEVENTQ of vIOMMU infrastructure.
> 
> Define an iommu_vevent_arm_smmuv3 uAPI structure, and report stage-1 events
> in the threaded IRQ handler. Also, add another four event record types that
> can be forwarded to a VM.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  7 +++
>  include/uapi/linux/iommufd.h                  | 23 +++++++
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 17 ++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 60 +++++++++++--------
>  4 files changed, 82 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 85352504343b..c8574969e700 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -1067,6 +1067,7 @@ int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
>  				    struct iommu_domain *domain);
>  void arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state);
>  void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master);
> +int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt);
>  #else
>  #define arm_smmu_hw_info NULL
>  #define arm_vsmmu_alloc NULL
> @@ -1085,6 +1086,12 @@ arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state)
>  static inline void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master)
>  {
>  }
> +
> +static inline int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster,
> +					   u64 *evt)
> +{
> +	return -EOPNOTSUPP;
> +}
>  #endif /* CONFIG_ARM_SMMU_V3_IOMMUFD */
>  
>  #endif /* _ARM_SMMU_V3_H */
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 2ade4839880d..5fc7e27804b7 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -1054,9 +1054,32 @@ struct iommufd_vevent_header {
>  /**
>   * enum iommu_veventq_type - Virtual Event Queue Type
>   * @IOMMU_VEVENTQ_TYPE_DEFAULT: Reserved for future use
> + * @IOMMU_VEVENTQ_TYPE_ARM_SMMUV3: ARM SMMUv3 Virtual Event Queue
>   */
>  enum iommu_veventq_type {
>  	IOMMU_VEVENTQ_TYPE_DEFAULT = 0,
> +	IOMMU_VEVENTQ_TYPE_ARM_SMMUV3 = 1,
> +};
> +
> +/**
> + * struct iommu_vevent_arm_smmuv3 - ARM SMMUv3 Virtual Event
> + *                                  (IOMMU_VEVENTQ_TYPE_ARM_SMMUV3)
> + * @evt: 256-bit ARM SMMUv3 Event record, little-endian.
> + *       Reported event records: (Refer to "7.3 Event records" in SMMUv3 HW Spec)
> + *       - 0x04 C_BAD_STE
> + *       - 0x06 F_STREAM_DISABLED
> + *       - 0x08 C_BAD_SUBSTREAMID
> + *       - 0x0a C_BAD_CD
> + *       - 0x10 F_TRANSLATION
> + *       - 0x11 F_ADDR_SIZE
> + *       - 0x12 F_ACCESS
> + *       - 0x13 F_PERMISSION
> + *
> + * StreamID field reports a virtual device ID. To receive a virtual event for a
> + * device, a vDEVICE must be allocated via IOMMU_VDEVICE_ALLOC.
> + */
> +struct iommu_vevent_arm_smmuv3 {
> +	__aligned_le64 evt[4];
>  };
>  
>  /**
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 364d8469a480..42c7daf4c8c7 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -445,4 +445,21 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
>  	return &vsmmu->core;
>  }
>  
> +int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt)
> +{
> +	struct iommu_vevent_arm_smmuv3 vevt;
> +	int i;
> +
> +	lockdep_assert_held(&vmaster->vsmmu->smmu->streams_mutex);
> +
> +	vevt.evt[0] = cpu_to_le64((evt[0] & ~EVTQ_0_SID) |
> +				  FIELD_PREP(EVTQ_0_SID, vmaster->vsid));
> +	for (i = 1; i < EVTQ_ENT_DWORDS; i++)
> +		vevt.evt[i] = cpu_to_le64(evt[i]);

Just thinking out loud here:
I understand the goal here is to "emulate" an IOMMU. But I'm just
wondering if we could report struct events instead of the raw event?

For example, can't we have something like arm_smmu_event here with the
sid changed to vsid? 

Are we taking the raw event since we want to keep the `u64 event_data[]`
field within `struct iommufd_vevent` generic to all architectures?

> +
> +	return iommufd_viommu_report_event(&vmaster->vsmmu->core,
> +					   IOMMU_VEVENTQ_TYPE_ARM_SMMUV3, &vevt,
> +					   sizeof(vevt));
> +}
> +
>  MODULE_IMPORT_NS("IOMMUFD");
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 9e50bcee69d1..fdf8bba14303 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1813,8 +1813,8 @@ static void arm_smmu_decode_event(struct arm_smmu_device *smmu, u64 *raw,
>  	mutex_unlock(&smmu->streams_mutex);
>  }
>  
> -static int arm_smmu_handle_event(struct arm_smmu_device *smmu,
> -			       struct arm_smmu_event *event)
> +static int arm_smmu_handle_event(struct arm_smmu_device *smmu, u64 *evt,
> +				 struct arm_smmu_event *event)
>  {
>  	int ret = 0;
>  	u32 perm = 0;
> @@ -1823,6 +1823,10 @@ static int arm_smmu_handle_event(struct arm_smmu_device *smmu,
>  	struct iommu_fault *flt = &fault_evt.fault;
>  
>  	switch (event->id) {
> +	case EVT_ID_BAD_STE_CONFIG:
> +	case EVT_ID_STREAM_DISABLED_FAULT:
> +	case EVT_ID_BAD_SUBSTREAMID_CONFIG:
> +	case EVT_ID_BAD_CD_CONFIG:
>  	case EVT_ID_TRANSLATION_FAULT:
>  	case EVT_ID_ADDR_SIZE_FAULT:
>  	case EVT_ID_ACCESS_FAULT:
> @@ -1832,31 +1836,30 @@ static int arm_smmu_handle_event(struct arm_smmu_device *smmu,
>  		return -EOPNOTSUPP;
>  	}
>  
> -	if (!event->stall)
> -		return -EOPNOTSUPP;
> -
> -	if (event->read)
> -		perm |= IOMMU_FAULT_PERM_READ;
> -	else
> -		perm |= IOMMU_FAULT_PERM_WRITE;
> +	if (event->stall) {
> +		if (event->read)
> +			perm |= IOMMU_FAULT_PERM_READ;
> +		else
> +			perm |= IOMMU_FAULT_PERM_WRITE;
>  
> -	if (event->instruction)
> -		perm |= IOMMU_FAULT_PERM_EXEC;
> +		if (event->instruction)
> +			perm |= IOMMU_FAULT_PERM_EXEC;
>  
> -	if (event->privileged)
> -		perm |= IOMMU_FAULT_PERM_PRIV;
> +		if (event->privileged)
> +			perm |= IOMMU_FAULT_PERM_PRIV;
>  
> -	flt->type = IOMMU_FAULT_PAGE_REQ;
> -	flt->prm = (struct iommu_fault_page_request) {
> -		.flags = IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE,
> -		.grpid = event->stag,
> -		.perm = perm,
> -		.addr = event->iova,
> -	};
> +		flt->type = IOMMU_FAULT_PAGE_REQ;
> +		flt->prm = (struct iommu_fault_page_request){
> +			.flags = IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE,
> +			.grpid = event->stag,
> +			.perm = perm,
> +			.addr = event->iova,
> +		};
>  
> -	if (event->ssv) {
> -		flt->prm.flags |= IOMMU_FAULT_PAGE_REQUEST_PASID_VALID;
> -		flt->prm.pasid = event->ssid;
> +		if (event->ssv) {
> +			flt->prm.flags |= IOMMU_FAULT_PAGE_REQUEST_PASID_VALID;
> +			flt->prm.pasid = event->ssid;
> +		}
>  	}
>  
>  	mutex_lock(&smmu->streams_mutex);
> @@ -1866,7 +1869,14 @@ static int arm_smmu_handle_event(struct arm_smmu_device *smmu,
>  		goto out_unlock;
>  	}
>  
> -	ret = iommu_report_device_fault(master->dev, &fault_evt);
> +	if (event->stall) {
> +		ret = iommu_report_device_fault(master->dev, &fault_evt);
> +	} else {
> +		if (master->vmaster && !event->s2)
> +			ret = arm_vmaster_report_event(master->vmaster, evt);
> +		else
> +			ret = -EFAULT; /* Unhandled events should be pinned */
> +	}

Nit:
I don't see the `arm_smmu_handle_event` being called elsewhere, is there
a reason to return -EFAULT instead of -EOPNOTSUPP here?

I think the current behavior here is to return -EOPNOTSUPP if (!event->stall).
Whereas, what we're doing here is:
	if (event->stall) {
	...
	/* do legacy stuff */
	...
	}

	else {
		if (master->vmaster && !event->s2)
			arm_vmaster_report_event(vmaster, evt);
		else
			ret = -EFAULT
	}

	mutex_unlock(&smmu->streams_mutex);
	return ret;

Thus, we end up returning -EFAULT instead of -EOPNOTSUPP in case
event->stall == false. I agree that we aren't really checking the return
value in the evtq_thread handler, but I'm wondering if we should ensure
that we end up retaining the same behaviour as we have right now?

>  out_unlock:
>  	mutex_unlock(&smmu->streams_mutex);
>  	return ret;
> @@ -1944,7 +1954,7 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
>  	do {
>  		while (!queue_remove_raw(q, evt)) {
>  			arm_smmu_decode_event(smmu, evt, &event);
> -			if (arm_smmu_handle_event(smmu, &event))
> +			if (arm_smmu_handle_event(smmu, evt, &event))
>  				arm_smmu_dump_event(smmu, evt, &event, &rs);
>  
>  			put_device(event.dev);
> -- 
> 2.43.0
> 

Thanks,
Praan

