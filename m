Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270A8C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QM6kau2iQ4j6ZEaDdmG4fMZZFTf4UoSv3ypQuKbFJw=; b=vVzOShB7U+ysI/ImEzyaU3DStk
	Rwqh3iI+qAW/XT9yu/jh8EACaPTDK0vecSVkUZcINsbryhs+F2gOfOYsXR0aiTv0Y2O4H6iC4rYlL
	u62bdfJrqWhpmU0/V5JCFBwyxHegDcRTgyRQSKjZheRgRfGQpWWqQpzalcbCwDSu+rGnpgl+mMm8T
	MOi2HiIgfbY34RCTNahVtp2Rry2y7rYgKFdnMuiC4OpAR2/6JmBRHn1EI5BAHIKxe2hw+hapoWlzh
	lmm8vsNXRBXWRLT/dTt23VD4rmst6bfdki3B1J1/VmgbsgG7SOHj3s9g3IVuNkgc08OH4QgfUKybp
	I1XX80jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyi2-00000000dUH-0ORu;
	Tue, 25 Feb 2025 17:27:06 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyQ1-00000000XlF-2MpW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:08:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22117c396baso201265ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 09:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740503309; x=1741108109; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1QM6kau2iQ4j6ZEaDdmG4fMZZFTf4UoSv3ypQuKbFJw=;
        b=kKwtFhmtuPS87bDJhabCgZJhQBA85V+t8Tov2w5phfMmi5Ihc1NmklxvObHwnTFjGh
         d9zJiEE6HIyHFTUQEvqlvBu2/2kN0zd70D/rlgjHuZVTFC7U3V65N9mmE87bFm4DRNxe
         ThdEP8H0e3Jq5CebIMAYwCS76VnR/iwmlLXqIt7w0ShNK7SQrhxw+rPvn9XsLmuKPxXX
         AgdRlX4XU6jWxDuCoWHzObBnoSCvSjIxczRLbMfzbZSLqzp/J6/FDzr/B11TESBdgAj4
         Mxj44OLRk2/Yv3KdNQyMeV8OYPphD8xkXQfqYtmzv+UAqXwrHV781OS372ltP5e6x1cG
         CuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740503309; x=1741108109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QM6kau2iQ4j6ZEaDdmG4fMZZFTf4UoSv3ypQuKbFJw=;
        b=eBw5e5LQhM+4x3n50kk5L8rm+sWcW2v3HHaRVNExvZoo/aafGzOC3HdP9Emn/LeOi9
         5DEX/KMDbzaYQpB1DnifQ5/Ay5sAe+CDhBHxEe2IDPD5lB9vno+QH3QMy/Fh8T/wkVYB
         ir+qqHEZoBoDBYOcO9qwVueJjFexHQMPP1Ko5yZA7+iSQaJ8KxsIgCdPksdaUhqzs0Nk
         PUQSDIbM+SWDPJGmaQhr8u3cn6f7It3qjymEX08zP65sFmDw14vLy7kpmuakV/IRmPGu
         ION24Oh0D0ppL1ZACqiYID/BeSzY27fVJ8ac7h55DxxeGkPVAj9WHMz5hrJYt1HWv54N
         dgZw==
X-Forwarded-Encrypted: i=1; AJvYcCVAPNdCpvjpR6bxdgoU9er4MSHi5P8l6Kz/Xfwn95Eh7SrkvlG8Djsd8hRJwPMn3zto1gz2MS1uOujlTZiaVKDA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/+b9KwjUdHa5azeA6PKI0VUwFx59M76s+khk3OzxTgF4VyQvB
	bjLG1nmIbpQzWMI00KIu3q3iyEEuuUWLIK1uDclO8r30m+uH3A4k/ynpS5Yg9Q==
X-Gm-Gg: ASbGnctzkl0X/FRAeOr9/CJ1rS9aZ66GCdag0k7bBPG2Ru28qoEyc2h1aOhiyjuucM2
	fZvF3hy/w5YmI1+nbM0oLObEoncqCV8//wcPxwEa26E8S0uvFCLiSkwuUgII08LI9JtXcz+Va5U
	Z86MmCgVoLGrLk0HMf2of9ct6jba4eZAxJ5KUBFmcY+9j9bg9uf3MH4hLdG8HeglyXHpCYBNkz2
	VV5w9a6rJ4OFWDKwd6qsQ17AvJaErA6AREo1OPZYF7UtCbINfrDmZ5Jy1Z76g00Qu72SG2/yZWo
	BKl9HFApBbHFGxb0JWPB/VU/r3jd0IvbS7RQ1N8ELt7Ribrux7KPVfH4xGqKBbw=
X-Google-Smtp-Source: AGHT+IHxrabWDtym7s/ddOkqBHoBfq1ZqP6yAIbeWpN90fX7xeP+90KuPUzmekpH3adGkKddVDiEdg==
X-Received: by 2002:a17:902:ec90:b0:216:607d:c867 with SMTP id d9443c01a7336-22307aabb1cmr3599065ad.29.1740503308535;
        Tue, 25 Feb 2025 09:08:28 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9ae8sm1757069b3a.120.2025.02.25.09.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:08:27 -0800 (PST)
Date: Tue, 25 Feb 2025 17:08:16 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, corbet@lwn.net,
	will@kernel.org, joro@8bytes.org, suravee.suthikulpanit@amd.com,
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
Message-ID: <Z735AMlhP29YEndU@google.com>
References: <cover.1740238876.git.nicolinc@nvidia.com>
 <be799951a817557ac093ac3e18d02a631306aa35.1740238876.git.nicolinc@nvidia.com>
 <Z7zYLBLZGKim-5UL@google.com>
 <Z7zlH74/orq9HF7Q@Asurada-Nvidia>
 <Z7zqdrQn7Q8yXfcn@google.com>
 <Z7zxsbJsOFp41Dzd@Asurada-Nvidia>
 <Z70EnQ5CXacc4ysT@Asurada-Nvidia>
 <20250225160225.GA593877@nvidia.com>
 <Z73yt4r0iDFwbty2@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z73yt4r0iDFwbty2@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_090829_609375_6F31296E 
X-CRM114-Status: GOOD (  25.65  )
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

On Tue, Feb 25, 2025 at 08:41:27AM -0800, Nicolin Chen wrote:
> On Tue, Feb 25, 2025 at 12:02:25PM -0400, Jason Gunthorpe wrote:
> > On Mon, Feb 24, 2025 at 03:45:33PM -0800, Nicolin Chen wrote:
> > 
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > > @@ -95,8 +95,6 @@ int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> > >  
> > >  	iommu_group_mutex_assert(state->master->dev);
> > >  
> > > -	if (domain->type != IOMMU_DOMAIN_NESTED)
> > > -		return 0;
> > >  	nested_domain = to_smmu_nested_domain(domain);
> > >  
> > >  	/* Skip invalid vSTE */
> > > @@ -122,19 +120,9 @@ void arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state)
> > >  {
> > >  	struct arm_smmu_master *master = state->master;
> > >  
> > > -	mutex_lock(&master->smmu->streams_mutex);
> > > -	if (state->vmaster != master->vmaster) {
> > > -		kfree(master->vmaster);
> > > -		master->vmaster = state->vmaster;
> > > -	}
> > > -	mutex_unlock(&master->smmu->streams_mutex);
> > > -}
> > > -
> > > -void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master)
> > > -{
> > >  	mutex_lock(&master->smmu->streams_mutex);
> > >  	kfree(master->vmaster);
> > > -	master->vmaster = NULL;
> > > +	master->vmaster = state->vmaster;
> > >  	mutex_unlock(&master->smmu->streams_mutex);
> > >  }
> > 
> > I'd leave the clear_vmaster just for clarity. Commit should not be
> > unpaired with prepare in the other functions.
> > 
> > It looks fine with this on top too
> > 
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Ack. I added it back and a #ifdef to the vmaster: 
> 
> +void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master)
> +{
> +       struct arm_smmu_attach_state state = { .master = master };
> +
> +       arm_smmu_attach_commit_vmaster(&state);
> +}
> [...]
> @@ -824,6 +829,9 @@ struct arm_smmu_master {
>         struct arm_smmu_device          *smmu;
>         struct device                   *dev;
>         struct arm_smmu_stream          *streams;
> +#ifdef CONFIG_ARM_SMMU_V3_IOMMUFD
> +       struct arm_smmu_vmaster         *vmaster; /* use smmu->streams_mutex */
> +#endif
>         /* Locked by the iommu core using the group mutex */
>         struct arm_smmu_ctx_desc_cfg    cd_table;
>         unsigned int                    num_streams;
> @@ -972,6 +980,9 @@ struct arm_smmu_attach_state {
>         bool disable_ats;
>         ioasid_t ssid;
>         /* Resulting state */
> +#ifdef CONFIG_ARM_SMMU_V3_IOMMUFD
> +       struct arm_smmu_vmaster *vmaster;
> +#endif
>         bool ats_enabled;
>  };
> 

Umm.. I'm not too sure how I feel about these #ifdefs _between_ a struct
definition. Given that currently, the arm_smmu_v3.h file doesn't have
such `#ifdef CONFIG`s between structs. I'd say, in case
CONFIG_ARM_SMMU_V3_IOMMUFD is turned off, we can simply leave the
vmaster ptr NULL?


-Praan




