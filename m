Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3484C98307
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jivi9KM6L+A+vDAYK+1HL6GBVOU14mX2y+wEPboH2kM=; b=frEV7qAXK5lTFYSooYN3VhRI/m
	cUn2KNIhyPggWb0606LF1ARn/T6A0dwCHuwnZR83EPY3oDMA1qbmtK76hAXopBic/+Wyv5lTBGjnf
	AS3o/8v4mhAPDNXSrFbcj8Ww9MqW/amhAly4FAJXdaeLOnLqvuwCZFkzybGS5/VmuXINXidbdcjoz
	a+dO6x5UPaHtUKBIap3/zKnsBnmwYK+zGPdGYXJwV2lTPwtpsbYKvOb+w986ZJrLkcA019MK/7ia7
	PZziW02bAjjvFwSgzg+QQWUe5va93/eLFPnIiXVqqsbmtzs6tbN4bF/NYGHqIVqLhrjF9+dmCZqFD
	X4RtQBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lh6-00000008At8-2as3;
	Wed, 23 Sep 2026 12:03:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lh4-00000008AsC-09Jv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:03:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso40735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790165000; x=1790769800; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jivi9KM6L+A+vDAYK+1HL6GBVOU14mX2y+wEPboH2kM=;
        b=RJXLvOA3mz9o6XZrmjmvly/Xgv/xQAYFe6zFMDEMTDjl6av5i69le1xilT/x1Zgkkj
         deJbfx++2q7OSoRZooD0TcE+ZpCqCay2D+ozE3QxEb4VviLYc06MOGiC+GDGVIZE+v05
         BJtbiweIKPL6nskhdn3E9nMmLFxiJMOLnxCf6W/5yVrlfBr3eV80WVq4Sl+uZmD/yy3p
         9nLOl8+KiRsTEGnxInvxao2hZGpLpYGDZ73xSg4jx2Gk/fM6IZkIjD9dfbJw/vzv3ofK
         xPFUdohflSDnHTWwzKS3q9agE0kfJ2SitD0/H0ncfibP363WJu670s0qGzO4QSf63vwp
         jC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165000; x=1790769800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jivi9KM6L+A+vDAYK+1HL6GBVOU14mX2y+wEPboH2kM=;
        b=DjL5s1sB3TmGx5r89ACexqdXBwJqDZEP0I3qroTrcwOwH7xRkTFGM6ixiJgs3+M9Hi
         KDMQ2xn/UexLGGmLRfU0w1eOwI1Bonh6/15DcKlTl/511uQh99qcG9L75y3ACOh2ld5c
         h08lKZQuEwi42qhxKRqkYHKzMyYK+/4GEVd9AqqSggXOvurQ7flcyHMgseaXiCQz9gRe
         lZCurFq46JeVJ9wHjlQWvOtnZ8hOTOnymBhMyYaJNsbqA45XEC+aR9pvkWFhb+tORcmc
         vCeff9cS60AflltxbvOhGi5O8xYlaojbhhwTrX50R9pk7erPv+1AuEpCHizU11AmguNs
         eqdQ==
X-Gm-Message-State: AFuF++nxr5XIhpoeeH0y/6naMhSeuZoCrXSd4EOjcMGlIIfwBLtlTOaa
	Ot8nH+32u99kANAt2KjaYCbbRU0R5Ogx4ovEWgDOnnMydIeyNw4gUoUh/bUqYsMwSA==
X-Gm-Gg: AYBFou1pankuk8Nwke8R89JIT3uZWYFvsDHL/C51pW4zMMwvf0wyIwMAMVm2sAuiIvW
	q2FYDKmzmsBXOkhf+cdOfBlDXbVJtW4J3zPqT7uZtnqrhAD0CYJHtua8seYDOpwprV6st4wMvoA
	5UisBXHriPFBKQwKxrqK/BYoHLs4yAW9Qt27CvzGGQDh5sRfTTemBKS3mz5LqyvmyfF2yzZDazJ
	+VLvB8718v5z29VgILSwoxKamrHCKGaTA9axqVUVx52xFXvSs7OiXGwpQA7RD+d3LxvinooZ4m0
	UddHVz0EjeRWZWYOQsoBF/3VuvDORdOFEIebJ04i3QWZ0QROuG6IKQvivSZXeW44q+LEPSzGHvn
	jiQprDvlvGn8GBAm0fjYpCT5a4w7fbznnhtvNxfWmQL7opU+omPh8TBnR8kT1sImZiHyYJvwfC6
	zbQDtNoiQyEYi0MRBaj6axRxlcsPsSEB48JXmXdZGqLBJBfDCLCHZm76Dm6emzqtpzpBcVxbrZc
	npjk4cLlJc74w3kFlhJE3WW0GnFk0bV4A8nrkzCl5VU2O0c2SA=
X-Received: by 2002:a05:600c:35c3:b0:49d:24e2:5454 with SMTP id 5b1f17b1804b1-49fe0c4a230mr920275e9.13.1790164999501;
        Wed, 23 Sep 2026 05:03:19 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1ccb90sm73291145e9.6.2026.09.23.05.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:03:16 -0700 (PDT)
Date: Wed, 23 Sep 2026 12:03:12 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 12/25] iommu/arm-smmu-v3-kvm: Probe SMMU HW
Message-ID: <arPAAK_O0d68dorh@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-13-smostafa@google.com>
 <arMu0An215TY3tM9@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arMu0An215TY3tM9@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_050322_093355_70C7F285 
X-CRM114-Status: GOOD (  30.97  )
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

On Tue, Sep 22, 2026 at 06:43:44PM -0700, Nicolin Chen wrote:
> On Tue, Sep 22, 2026 at 01:12:45PM +0000, Mostafa Saleh wrote:
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
> > @@ -11,6 +11,9 @@
> >   *
> >   * Other members are filled and used at runtime by the SMMU driver.
> >   * @base		Virtual address of SMMU registers
> > + * @oas			PA size
> > + * @pgsize_bitmap	Supported page sizes
> > + * @sid_bits		Max number of SID bits supported
> >   */
> 
> Some of them belongs to one of the prior patches.
> 
> And, if we are going to list them all, could we do in kdoc style?

I will fix it.

> 
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > @@ -29,6 +29,47 @@ static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
> >  	smmu->base = NULL;
> >  }
> >  
> > +/*
> > + * Mini-probe and validation for the hypervisor.
> > + */
> > +static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	u32 reg;
> > +
> > +	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
> > +		return -EINVAL;
> 
> Does this need to check IDR0.COHACC? If not, an inline note that
> explains why?
> 

This is similar to the kernel driver logic, where FW will override
coherency and in case of mismatch the driver will just WARN and trust
the FW.
pKVM can't print a warning as WARN is fatal in EL2. So it just picks
what the FW says. I am not sure what systems rely on this, but I can
add more strict checks and fail probe in case of mismatch with pKVM.

> > +
> > +	reg = arm_smmu_idr0_probe(smmu);
> > +
> > +	if (!(FIELD_GET(IDR0_TTF, reg) & IDR0_TTF_AARCH64))
> > +		return -ENXIO;
> > +
> > +	if (!(smmu->features & (ARM_SMMU_FEAT_TT_LE | ARM_SMMU_FEAT_TT_BE)))
> > +		return -ENXIO;
> > +
> > +	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
> > +	if (reg & (IDR1_TABLES_PRESET | IDR1_QUEUES_PRESET | IDR1_REL))
> > +		return -EINVAL;
> > +
> > +	smmu->sid_bits = FIELD_GET(IDR1_SIDSIZE, reg);
> > +	/* Follows the kernel logic */
> > +	if (smmu->sid_bits <= STRTAB_SPLIT)
> > +		smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
> 
> The IDR1 reg guard and sid_bits can be shared with the main driver.
> 
> Maybe add an arm_smmu_device_idr1_probe()?
> 

I thought about that, but this will be only used for sid_bits, the
hypervisor struct doesn't have ssid_bits as it doesn't use it, it
only shadows the STE and not the CD as the CD is translated by stage-2.

Other fields also not used by the hypervisor (PRIQS, EVTQS...)

As sashiko pointed, I will need to add ARM_SMMU_FEAT_ATTR_TYPES_OVR
check in the hypervisor, so maybe arm_smmu_device_idr1_probe() can be added
to partially probe the register and return the value so it can be probed the
main driver.

> > +
> > +	arm_smmu_idr3_probe(smmu);
> > +
> > +	arm_smmu_idr5_probe(smmu);
> > +	if (!smmu->oas)
> > +		smmu->oas = 48;
> 
> The truncation can be shared with the main driver too?

The main driver will print an error, if arm_smmu_idr5_probe() fix it
silently we will lose that.

> 
> > @@ -43,8 +84,14 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
> >  		return ret;
> >  
> >  	smmu->base = (void __iomem *)haddr;
> > +	ret = smmu_probe(smmu);
> > +	if (ret)
> > +		goto out_ret;
> >  
> >  	return 0;
> > +out_ret:
> > +	smmu_deinit_device(smmu);
> 
> Nit: out_deinit

Sure.

Thanks,
Mostafa

> 
> Nicolin

