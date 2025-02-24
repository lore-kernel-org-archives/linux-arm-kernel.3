Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F24C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 21:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qcg5x+HnDt6i287wHJ6fnl/QzabNNejalgvIUO3dans=; b=4fGX8iZl4IFiWKA/02h+bBpZas
	wdQMKuHS9sWClyNrUpm+aI0iDg0YtOOXrCqMDWRQWZ7osSGtpOeIwtxNrosHgnzjQezIoApryyEN0
	wNknZPlGIBQ9qXjU5+NptGsfHmLcH82lkLRH3uqhWJ5WHTv1avsvQ05yLphm6fnZPwAbnAoiIxAhv
	uvk3+/o9EKOxW3jEfwjChPBGFmXKnbyFKr3hVD6Gf3GQdJrjwJGMpUdx64pW6kq2LKJBuvCQVfL9a
	RAp6QoVVYsL1dhnrErSfRRgPisSbC2nzevMB/sZvXEyOX6LMvVZ2ZDouaQ5J/roC1u6CWG0R2UbW8
	8AxyuxLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgQR-0000000FICE-3nL1;
	Mon, 24 Feb 2025 21:55:43 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgOw-0000000FHwr-0rAx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 21:54:11 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-220e0575f5bso53475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 13:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740434049; x=1741038849; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qcg5x+HnDt6i287wHJ6fnl/QzabNNejalgvIUO3dans=;
        b=v95vIIsUBb6kmLhfaqY0M7hoeqRsjMNHfhhyF+4ARM5h0nqXp9SDpySRo5hDehczP9
         r+PE4/Xy0j7tuECngjpwgAoIFV5VJsIrtX3KOCu3yffICUUtIRDpUMAi/Q9ljF2GfaDz
         JbZRALq76JdX/SdZ4oCil3vM0WS7nhNd15gdzOvAz5sNoSP7PH9GszAeWGBUKEGQ4hv+
         B4/Bj05hNNarpydOtogTynxY6uxwPETNwNs5jeZleM2EAC0wopfL7y2lMARgmZd+BguF
         x1WePhwclZ4Ziuj9hz2kaSghPqrPquatEcpFsa4+T4MBFjruxmLEc21b9cslSiSLzkuD
         lVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740434049; x=1741038849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcg5x+HnDt6i287wHJ6fnl/QzabNNejalgvIUO3dans=;
        b=Xpc/c+jItLDq6C8pDcNPVBAYBcsCBOKKBX51T2a0lRFnzLn9WjyycIDa8+mQe0kAgA
         Z3x3McHAnP1QGXcQtfKtJPaIGIP2WLJ8E5mFJI8kg+KmgAYjZeBOV6OPIXje9l55Je8J
         bJCr5TldhSZDlMWPlzI0dLhrhruQ0TUrmrUX41I6PUEJtpu+ZcqvCBVUgkDyJmrH6xrB
         N7N15EX7cbKLx2xuKL8FCh7cMRm6q9q0J3exwwoRCvprjWIVQ0dhhpVBnWAc86QgjV+U
         F3/ark96v3NvCeKBGE+ih+XEOrBenTNqwDRmyEv4b78+u2NgLj6MA3xVyfC44eJ0KQX9
         OrYA==
X-Forwarded-Encrypted: i=1; AJvYcCWGY/PQxnr94cw5V9ggGtD6cpWaK5v4dekmywdiB9IHBcqFRMtr+fS1jWpbYkaypeIY2OjJZKfpDNaEEGmdH+GM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2azhWF8ItCdKgVJv+qybvwdGgyDKMZIpi1ZVG7MIhRMB/vO1e
	I1qp6bpUa86iAQEsN0Qetqorc14lJ9/7YSQKOoIwyhwcjqDtPpkgWupQUcaTeQ==
X-Gm-Gg: ASbGncuCTwE7ybm7yCuzmbDxs6HQZi4gd2RsfiGcSjjxlXfWI+tmVL9ZCdAByn7Ifgw
	pYg075DFtkJbdtUl/k6GfXIWuRYird6h4q0U87AtoD1w1JC49BwTeMJhl1Qbtt7NygAFsPEqDAO
	7L8HNKm1cLTFlWpxA3k9ke88gY3Vjq6xpVPFgtG2qSfYck1+yur1Yryt4GyuVaR/yk32YYOfcsr
	Kh044WM+qw3inRnZEfTjRQip1Vpqy6lv+N0iFRh6+owxj/5Nw2kxgsUwpEPP5ubLalxmWwoWBZA
	Q5Ta48/d/VVb1gQjEgNBLJAzXn1B2oGRgBFrbg7cFPAGHJdfnsprFfuoyI3YmwQ=
X-Google-Smtp-Source: AGHT+IEpKhaMyBCkt6aQomwMTBim64fWChp3DGISBq2p87Hyiqlav2xt82oY5FJwGrR4tW3dc9pk3Q==
X-Received: by 2002:a17:903:22ce:b0:216:21cb:2e14 with SMTP id d9443c01a7336-22307a989ecmr1049425ad.21.1740434049047;
        Mon, 24 Feb 2025 13:54:09 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6fa230sm131119b3a.70.2025.02.24.13.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 13:54:08 -0800 (PST)
Date: Mon, 24 Feb 2025 21:53:58 +0000
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
Subject: Re: [PATCH v7 12/14] iommu/arm-smmu-v3: Introduce struct
 arm_smmu_vmaster
Message-ID: <Z7zqdrQn7Q8yXfcn@google.com>
References: <cover.1740238876.git.nicolinc@nvidia.com>
 <be799951a817557ac093ac3e18d02a631306aa35.1740238876.git.nicolinc@nvidia.com>
 <Z7zYLBLZGKim-5UL@google.com>
 <Z7zlH74/orq9HF7Q@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7zlH74/orq9HF7Q@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_135410_246169_4D64AD23 
X-CRM114-Status: GOOD (  25.77  )
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

On Mon, Feb 24, 2025 at 01:31:11PM -0800, Nicolin Chen wrote:
> On Mon, Feb 24, 2025 at 08:35:56PM +0000, Pranjal Shrivastava wrote:
> > oN sAt, Feb 22, 2025 at 07:54:09AM -0800, Nicolin Chen wrote:
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > > index 5aa2e7af58b4..364d8469a480 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > > @@ -85,6 +85,59 @@ static void arm_smmu_make_nested_domain_ste(
> > >  	}
> > >  }
> > >  
> > > +int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> > > +				    struct iommu_domain *domain)
> > > +{
> > > +	struct arm_smmu_nested_domain *nested_domain;
> > > +	struct arm_smmu_vmaster *vmaster;
> > > +	unsigned long vsid;
> > > +	int ret;
> > > +
> > > +	iommu_group_mutex_assert(state->master->dev);
> > > +
> > > +	if (domain->type != IOMMU_DOMAIN_NESTED)
> > > +		return 0;
> > > +	nested_domain = to_smmu_nested_domain(domain);
> > > +
> > > +	/* Skip invalid vSTE */
> > > +	if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> > > +		return 0;
> > > +
> > > +	ret = iommufd_viommu_get_vdev_id(&nested_domain->vsmmu->core,
> > > +					 state->master->dev, &vsid);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	vmaster = kzalloc(sizeof(*vmaster), GFP_KERNEL);
> > > +	if (!vmaster)
> > > +		return -ENOMEM;
> > > +	vmaster->vsmmu = nested_domain->vsmmu;
> > > +	vmaster->vsid = vsid;
> > > +	state->vmaster = vmaster;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +void arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state)
> > > +{
> > > +	struct arm_smmu_master *master = state->master;
> > > +
> > > +	mutex_lock(&master->smmu->streams_mutex);
> > > +	if (state->vmaster != master->vmaster) {
> > > +		kfree(master->vmaster);
> > > +		master->vmaster = state->vmaster;
> > > +	}
> > 
> > Does this condition suggest that we might end up calling
> > `arm_smmu_attach_prepare_vmaster()` multiple times before __actually__
> > commiting to a vmaster?
> 
> No. prepare() and commit() are 1:1. How is it interpreted to have
> "multiple times"?

Ohh alright. I was just confused about why do we need to check:
`if (state->vmaster != master->vmaster)` ?

> 
> > > +	mutex_unlock(&master->smmu->streams_mutex);
> > > +}
> > > +
> > > +void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master)
> > > +{
> > > +	mutex_lock(&master->smmu->streams_mutex);
> > > +	kfree(master->vmaster);
> > > +	master->vmaster = NULL;
> > > +	mutex_unlock(&master->smmu->streams_mutex);
> > > +}
> > > +
> > >  static int arm_smmu_attach_dev_nested(struct iommu_domain *domain,
> > >  				      struct device *dev)
> > >  {
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > index 358072b4e293..9e50bcee69d1 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > @@ -2803,6 +2803,7 @@ int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
> > >  	struct arm_smmu_domain *smmu_domain =
> > >  		to_smmu_domain_devices(new_domain);
> > >  	unsigned long flags;
> > > +	int ret;
> > >  
> > >  	/*
> > >  	 * arm_smmu_share_asid() must not see two domains pointing to the same
> > > @@ -2832,9 +2833,15 @@ int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
> > >  	}
> > >  
> > >  	if (smmu_domain) {
> > > +		ret = arm_smmu_attach_prepare_vmaster(state, new_domain);
> > 
> > IMO, this adds a little confusion for folks not using iommufd.
> > 
> > I guess it'd be cleaner if we invoke this below within the:
> > `if (new_domain->type == IOMMU_DOMAIN_NESTED)` condition instead of
> > simply returning from the function if the new_domain->type isn't NESTED.
> 
> But the arm_smmu_attach_commit_vmaster() still has to be
> unconditional as !NESTED domain should clean the vamster away..
> 

Ack. Right.

Thanks,
Praan

