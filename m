Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3E1C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 23:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHkE0KygFhIS9HXgLrJJS0y5ES5oOeyv4LpvZ/FUmdg=; b=JMrqRjQFCSDJat547uIFLuL7cY
	oq/XQZoVQQeQM+XNiE9RU9rWD2gNmJ8zMKSx+OjDBBsxvH7mw8Sf4KbmzBpRsatkU5NAODFm57HuP
	L2VoLEzcIWlU0TAsTQQ1ug5zg69CY2rKSqcBdkBZFjHECcfQhR+qNbO7NwPOs+STqf8BiJ9mjSPoe
	Jwt8rqTV01yOHBGx1qO/EcY8sLDaqiKjSVhqX6XJVfr4bUXaFaDp96ngeBESjITv2AFtUcGwFJw2W
	SFeU81e7m5HPDbOowZqTaCeOQPKGuyiAvO9VGXigK0cAdUyJvLut92kHTkU+J9RTj4mwdhLFn4N06
	jo9s0yow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1uoQ-0000000G6c0-1BUS;
	Wed, 02 Sep 2026 23:56:14 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1uoO-0000000G6bd-1VtM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 23:56:13 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-9390dd46b45so125164585a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 16:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788393371; x=1788998171; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JHkE0KygFhIS9HXgLrJJS0y5ES5oOeyv4LpvZ/FUmdg=;
        b=bbh4+XE5rNIfqr6tDpSu0yTCGSzy7DwHs0UHJe6Wq4d0SSIz619YkFIkGqVMHErVg/
         gDgpfZMcGBjjrhAPQzlIjiOAlNa0airGpQeZUuBKK+4bmikRKMpVgo/nYd+FNoaJXzgr
         PWiFoovmiTj56QIgL+T/K6tTSWA/kMuBL4JOLRKVFcGf/kDxVf6C+PU9M+buolvJdJXN
         KHj9UN5Dip4INJ1SDVDt//5OSS7fLjhGaJ1S/3FUXQCrnywIElD7ixW0m4r7KPGeFBEQ
         xDEJQBD1t1jiLTkzbNI9jNpjgKcSkrjgwLtumoKqVa20A8GcVcXUzdNdSh7eE/yQpeR1
         TZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788393371; x=1788998171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHkE0KygFhIS9HXgLrJJS0y5ES5oOeyv4LpvZ/FUmdg=;
        b=BiBYVnUGrO6owvC7BeLyYkuk7qPpu6Dnbuf/185FfPh4mPgabvvxZtV0EmsMbZ9+K3
         Ur77RSYYXjZUVEyo68zLlVoecUgH6HSzE+/D/DPr5Mg+fpJCZ5aNDVreTsEev/ECzBGj
         yhYh1bdmObF3ZNLz+v4SF8OLVdmW6nOi0z2jwHxd4l7je2gO5KN/+3lVELag3kdouBUk
         yYg5tpanffX0XPUc7tsmAryw/W61HtBitzeFYuAPBMWZTtzD2D2ChTIA7AxPLXU4Bxsn
         qsjpafX5JiOzXWfI/+yVM0YILm1eK74qUlGpsu9dva1CRBz2dX+MR39SZ+C5g+GQbCEW
         3Snw==
X-Forwarded-Encrypted: i=1; AKwUvByXWo0rBj+etIyHdefeL60iZm+ABw5IMeRfWrfGbJ6XD4DCRQYEhGQt3AHK1VcyTImDbl26cYodhjwzU9Z6Ojf6@lists.infradead.org
X-Gm-Message-State: AFuF++k7uIZXsH5u9nK+d3JJklzkCJ0Y5xcjf/ei1+onAzcUypJ8Yl6l
	gKzf86pT+Jn2XiomNvpj2W3yT8aO1GxvMI/feO3l/MYb5zf9SkjOc/NRCJYY8Y5nDLOwixbnD2/
	R1LBu
X-Gm-Gg: AYBFou2H5pwcb/qPK6F/zIIeUPRy45Ve/SjRkxRsfdL+mmWN+FEAjAsXRELPB+B5Qg6
	nPM8aNl2itrqmj3Cc9lcSHrxLOIyW06uDbrMgQSBLwwKwT+kGy7vZ9/0g77Qdjj7Fzi+Rr+3oI6
	piHoVQEOP3tZ+nBl9vA78RHCGb/uHiVi7nQ7fMy8xzr7qjw8QFsN7WSHmFBRqFWB8WIYC3SIasJ
	YmwNkvu4ZS8KfpEbPPWBTRbqstB7e9yiGyLsaV5cnCTwu/mSki7PBAvNay2knwj4Khsz8GnSFjB
	rYiYDJ2cFDIs3FFqznT7oiC9Mv+c9x5NOgJh6jyFWkuXghF7Bm0tJKMI3UxEfgomxFM1m7qwQDl
	44/q6oU/FeNmFmUfKQf622WqEwFABU0oXtbVCMmz2L0MUAztVXNIbK6uEtkPyj3WYxcezL31bOD
	50XP4Zjwe95NJ63kBfiP/udEh8kHpjDjUmqrKJb8mQPjsbnrdVc1xBu81kQ+5LvZZV93PuyCAm8
	/67jEMB2veX9/cbtH9D/7T/3eAFWMkkBppcwfomjexCBA==
X-Received: by 2002:a05:620a:8c98:b0:92e:7ba3:73e5 with SMTP id af79cd13be357-939610139b3mr758596785a.42.1788393370920;
        Wed, 02 Sep 2026 16:56:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f3dd7easm362448885a.45.2026.09.02.16.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:56:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1uoL-0000000FTW5-1KK8;
	Wed, 02 Sep 2026 20:56:09 -0300
Date: Wed, 2 Sep 2026 20:56:09 -0300
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
Message-ID: <20260902235609.GG2890729@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
 <yq5aecfbzjyk.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aecfbzjyk.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_165612_513795_B6D90716 
X-CRM114-Status: GOOD (  28.34  )
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

On Wed, Sep 02, 2026 at 10:09:15PM +0530, Aneesh Kumar K.V wrote:
> static int arm_realm_smmu_v3_vdevice_init(struct iommufd_vdevice *vdev)
> {
> 	struct device *dev = iommufd_vdevice_to_device(vdev);
> 	struct kvm *kvm = vdev->viommu->kvm_file->private_data;
> 	struct arm_smmu_device *smmu;
> 	struct arm_smmu_stream *stream;
> 	struct arm_smmu_master *master;
> 	unsigned long rmi_ret = 0;
> 	unsigned long l2_sid;
> 	int ret;
> 
> 	if (!tsm_is_configured(dev))
> 		return 0;
> 
> 	master = dev_iommu_priv_get(dev);
> 	/* FIXME which stream to pick */
> 	/* At this moment, iommufd only supports PCI device that has one SID */
> 	stream = &master->streams[0];
> 	smmu = master->smmu;
> 
> 	l2_sid = ALIGN_DOWN(stream->id, STRTAB_NUM_L2_STES);
> 
> 	{
> 		guard(mutex)(&smmu->realm.mutex);
> 
> 		if (!arm_realm_smmu_active(smmu))
> 			return -EINVAL;
> 
> 		ret = rmi_psmmu_st_l2_create(smmu->base_phys, l2_sid,
> 					     &rmi_ret);
> 		if (ret || rmi_ret) {
> 			if (!ret)
> 				return -EIO;
> 			if (RMI_RETURN_STATUS(rmi_ret) != RMI_ERROR_PSMMU_ST ||
> 			    RMI_RETURN_INDEX(rmi_ret) != 2) {
> 				dev_warn(dev, "failed to create realm stream mapping\n");
> 				return -EIO;
> 			}
> 			/* The L2 stream table already exists. */
> 		}
> 	}
> 
> 	vdev->destroy = arm_realm_smmu_v3_vdevice_destroy;
> 	return tsm_bind(dev, kvm, vdev->virt_id);

I think we should drop tsm_bind() as an abstraction. It doesn't make
sense to take that round about path when we are calling RMIs directly
above. It was intended to be an abstraction, but it isn't working out
with this viommu based abstraction.

> @@ -513,10 +514,16 @@ static ssize_t cca_tsm_guest_req(struct pci_tdi *tdi,
>  		if (copy_from_user((void *)&req_obj, req.user, req_len))
>  			return -EFAULT;
>  
> -		if (req_obj.tdi_state != RHI_DA_TDI_CONFIG_RUN)
> +		switch (req_obj.tdi_state) {
> +		case RHI_DA_TDI_CONFIG_UNLOCKED:
> +			return cca_vdev_device_unlock(pdev);
> +		case RHI_DA_TDI_CONFIG_LOCKED:
> +			return cca_vdev_device_lock(pdev);
> +		case RHI_DA_TDI_CONFIG_RUN:
> +			return cca_vdev_device_start(pdev);
> +		default:
>  			return -EINVAL;
> -
> -		return cca_vdev_device_start(pdev);
> +		}
>  	}

This stuff cannot flow through sysfs. The VMM must support running in
a sandbox so it cannot easially call out to sysfs while the VM is
running. That makes the sandboxing more complex and ugly. The flow we
have now relies on fd passing from the launcher into the sandbox to
get things like vfio and iommufd into the VMM.

So these actions really should work the same way unless there is a
strong reason to do otherwise.

Given these are all acting on bound devices, and those can only be
created by iommufd, it makes more sense to feed the operations through
iommufd into the viommu and vdevice ops. AMD wanted to create such
general command ops anyhow for their viommu emulation (non cc).

And.. then you don't need struct pci_tdi. The vdevice is effectively
the tdi and the existing locking scheme in iommufd for vdevice takes
care of everything the tsm code was trying to do, except in a way that
applies to every viommu out there.. This actually makes a lot of sense
because the tdi is not really separable from vfio. You cannot have a
tdi without a kvm and you cannot link a pci dev to a kvm without vfio.

Finally, there is really nothing about the viommu_ops that has much to
do with smmuv3. It would be fairly straightforward for the tsm_ops to
be able to create the viommu and provide the viommu_ops. We can get
there based on the IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3.

This then would open up a much nicer split where arm-cca-guest.ko can
provide a realm smmuv3, and inside those viommu_ops are all the realm
& tdi related ops, psmmu, vsmmu, vdevice, "guest req".

The arm-cca-guest can just make a simple function call to SMMUv3 to
get the phys and interrupts. Somehow I think Will would like this
better than adding to SMMUv3.

Now that the viommu stuff is more developed on the iommufd end, and
the RMM spec is more complete with vsmmu, I think this arrangement
becomes visible.

What do you think?

Jason

