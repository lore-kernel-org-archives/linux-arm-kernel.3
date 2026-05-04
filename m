Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72FAFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOfQTG3NufNYyUm+WMPkXEQQNupQgi3c8ZHhQrRCx6U=; b=Urx99N8PD4i9LezuMsv/5xFASh
	eg8kn9oV34GqT7DtN4MOkZKkCYdFiJYyd+JCkv6/D+wx9z/VQXuxi2tJubWbIaq7ZC+VvJlrxzR1m
	AoXnblkvVF0tHdnsSNc+f+7zrd7bAfhZKsDHSWXrFvasncfZqdRcPe39RMf33H79MGVRX2XTxHSOf
	7Oqvc3D++Lnak3RB8VlnbDeSZ9buY+qBlI9XhEB2jISdiIqRylM9nmVuntI6FMuYTQaZZSF0guLOc
	ObqAa5qbsGFklHid+GWmc1R/iWHApaJDlg8ouamyE1+uw8DPTnIvLqw37QNR7TLIXDRGguK9Ozcxz
	S2iN7HNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsRi-0000000DA4X-2GBM;
	Mon, 04 May 2026 12:30:46 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsRc-0000000DA3i-3cVg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 12:30:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so171385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 05:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777897839; x=1778502639; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qOfQTG3NufNYyUm+WMPkXEQQNupQgi3c8ZHhQrRCx6U=;
        b=Hy0uAvFnijf6fGbE70fT7WrYapI6BAidrr/bQ0AJEnseW12hTvfhmanJLoDh7B+PJj
         jZE9955cUYDlDm/ykqOras3QCS3hcTuZ4E5EUObtc0l9k3Jh15N0qPmajiZ1p7PB3YoN
         ZQfqdiJPlCNyvrbU7NVS+F5HgxEtReEeQTIM8UKTgsP6WlcNXhStJTMMxXv1z4zauOLW
         Dml6+DQabiwQhOkii+KXD6xYYFC2Zr6FQ9uSySomSHeJpiWyQ5n7uXKzzd/bIZio6R/y
         GyRTO+BccAUQl0qXd7TZiEpvqAM9YI7eq5aI+DRNK7RTWqOIK981wAJgzj1dsfdbqQfS
         iO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777897839; x=1778502639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOfQTG3NufNYyUm+WMPkXEQQNupQgi3c8ZHhQrRCx6U=;
        b=XB0rJogeHLRmie9vFPLtgnSUfn91PulTwCddivSXqG95TObCorjKf7U/vkFo18nOy5
         F7XKDHT2jxVdWW5ZdtSX0bchkAFGn2AAC53LHRg7zOZpZC46PJNG+81DR7KDotw+4X5p
         KlSwYZITBgZlEsQxGY9j/dpnotvZx0ZHv6eCrmNkQKZy5/vnX/UQZKTuO97/gAqcpMlc
         TCND+bZ1LeT5CUOAbUxcs7neIlRoXBGbmf/GSdJE1imJ+XCOWevDrQXDroVAHYqxS5RE
         G01NiufHPOYKnNnwFhph0/ogHr8UY8wWg4yHk6zTt6ifCnzj9fhy2YIvb9uMDd9dHDiY
         Fvyg==
X-Gm-Message-State: AOJu0Ywqa8k1wgF7OSomql+MFrjbEkuCq+vp4ofCF3YAA6UbJmaYlDdl
	H7l0TLl54tlZePz97JfJUAvewGfYl3j2mMZ8CJJfYT5+uxxTJbz8nYjaIO7OQ5Rzzg==
X-Gm-Gg: AeBDietVFOAQqlBMyz1GPgLU/mbujXuvHrKLbF/mejyMNm7TAJDi9yk/uNHZfrvz4vv
	7d1lukBPdnRTHQPxZ9iZIVDfAvnD2R7l7gSqbFRdSzWigE3rohVOYPSTklJGBmVOd9Ci4QHOYcp
	Owgl5swwwjF1PjulH0kM3Eak33BDGROzx/nPlMMdQQ0LHiJ2Gn36y3ji1AFAcrpukiWxAUIiGN3
	INVlb0bho6cgJ209S0Amn+BqKVHXyd/FhgemsBeQm3epH6RdVPa2Fm4Za6nlr79EjWPFdxsSDje
	+xYqj5dMAWQUsC9O6vtLe9SrubiOpsWXe2FCuDhWCUUyPmLDrNnDXAKDqxqXalxqZ5OM6J2O+me
	DhA5a0Z3f4NWqv1O+OWKRccgspcFCvVT5r66EAHL8QLshUfCGGDG1LVlffoa8SNtDUT5iizG22a
	7wDgg+3veZx/g4vZeQmFZAvGIb8uXQ0EOHVIE0WXUXyD4ptWap1wnb6x6jxJDuUYC00KFylBVSu
	cTxhw==
X-Received: by 2002:a05:600c:63c4:b0:485:b6e4:9808 with SMTP id 5b1f17b1804b1-48ac315a359mr2185965e9.1.1777897838152;
        Mon, 04 May 2026 05:30:38 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fee32fesm113417605e9.3.2026.05.04.05.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:30:37 -0700 (PDT)
Date: Mon, 4 May 2026 12:30:33 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 13/25] iommu/arm-smmu-v3-kvm: Probe SMMU HW
Message-ID: <afiRaQRmu7Evbzfn@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-14-smostafa@google.com>
 <20260501125148.GE6912@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501125148.GE6912@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_053040_952574_4494E01F 
X-CRM114-Status: GOOD (  24.33  )
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

On Fri, May 01, 2026 at 09:51:48AM -0300, Jason Gunthorpe wrote:
> On Fri, May 01, 2026 at 11:19:15AM +0000, Mostafa Saleh wrote:
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index 61e6ab364086..157acde0436d 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -4738,12 +4738,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
> >  	return 0;
> >  }
> >  
> > -#define IIDR_IMPLEMENTER_ARM		0x43b
> > -#define IIDR_PRODUCTID_ARM_MMU_600	0x483
> > -#define IIDR_PRODUCTID_ARM_MMU_700	0x487
> > -#define IIDR_PRODUCTID_ARM_MMU_L1	0x48a
> > -#define IIDR_PRODUCTID_ARM_MMU_S3	0x498
> > -
> >  static void arm_smmu_device_iidr_probe(struct arm_smmu_device *smmu)
> >  {
> >  	u32 reg;
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > index 64618299d03a..f904f4d19609 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > @@ -84,6 +84,12 @@ struct arm_vsmmu;
> >  #define IIDR_REVISION			GENMASK(15, 12)
> >  #define IIDR_IMPLEMENTER		GENMASK(11, 0)
> >  
> > +#define IIDR_IMPLEMENTER_ARM		0x43b
> > +#define IIDR_PRODUCTID_ARM_MMU_600	0x483
> > +#define IIDR_PRODUCTID_ARM_MMU_700	0x487
> > +#define IIDR_PRODUCTID_ARM_MMU_L1	0x48a
> > +#define IIDR_PRODUCTID_ARM_MMU_S3	0x498
> > +
> >  #define ARM_SMMU_AIDR			0x1C
> 
> Lets put these hunks in some earlier patch to migrate out the
> functions/etc
> 
> I think all these pkvm/arm-smmu-v3.c should just be building up the
> driver.

Will do.

> 
> > +static bool smmu_nesting_supported(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	unsigned int implementer, productid, variant, revision;
> > +	u32 reg;
> > +
> > +	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1) ||
> > +	    !(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
> > +		return false;
> > +
> > +	reg = readl_relaxed(smmu->base + ARM_SMMU_IIDR);
> > +	implementer = FIELD_GET(IIDR_IMPLEMENTER, reg);
> > +	productid = FIELD_GET(IIDR_PRODUCTID, reg);
> > +	variant = FIELD_GET(IIDR_VARIANT, reg);
> > +	revision = FIELD_GET(IIDR_REVISION, reg);
> > +
> > +	if (implementer != IIDR_IMPLEMENTER_ARM)
> > +		return true;
> > +
> > +	if (productid == IIDR_PRODUCTID_ARM_MMU_600)
> > +		return variant >= 2;
> > +	else if (productid == IIDR_PRODUCTID_ARM_MMU_700)
> > +		return !(variant < 1 || revision < 1);
> > +
> > +	return true;
> > +}
> 
> Why not share all this errata stuff with the idr parsing code too?
> 
> We already have ARM_SMMU_FEAT_NESTING that has the above calculation.
> 
> The two drivers use the same ARM_SMMU_FEAT system, I would expect one
> chunk of shared code to compute the FEATs, who cares if pkvm doesn't
> use all of them?
> 
> Use the same errata logic and so on to get to the feat bitmap.

Makes sense.

Thanks,
Mostafa

> 
> Jason

