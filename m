Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3132BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvJy2eU2NKOX06+H5Vs2S45nqKcJ32b1n8dkLQorqiw=; b=ABE/2gBwVlZYz/IwtredPmWG6P
	vuSvmCCsoUorFgROizs4MOTpMp7GgYowV86RkhJjQ6L5vvl0YFL+gL84KIV0uOe84SDWu5NTXYizr
	wcj9xQa3MI+qsJ35kyMdDunv/sDoPFXPy4wPC3qmDgphYMFnqOMb45uj08H2on6tz+KyDjHiA5SYG
	0tesGX6RMV9B2ONF332RqQ0R3Uj67+EWgndQw/f8+TIIBdwhg4eB0miQ2mszElfzA/H0oKAy3KDf1
	muR+GXANW8fVJVUxdHmJmCw6TqzjQCQQJ2s1yJr4sW2KVqTHK3PmQesoK79W/WgiJwkSrR/QTr+D1
	vN0I+VEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyIH-00000000VMU-0CXy;
	Tue, 25 Feb 2025 17:00:29 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy4I-00000000Qk2-1iAn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:46:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2212222d4cdso172575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 08:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740501960; x=1741106760; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DvJy2eU2NKOX06+H5Vs2S45nqKcJ32b1n8dkLQorqiw=;
        b=N52CL4Jnw5ivHsMqwXfb/A4uLpp76e0TRjjigrKiyOOXoqncJCqS5y4ciFYiLMxxmq
         qhUPHaJBzClmXwJGRPIfHv5sLJIrYgqj38Bi9FF9u56iSo1own939lhTLeBtFi7tHViR
         0YGLqkbvAgWOeTm4mXWVu7wVrxrxheRUBXU0plTEzm8hxuSvG9hOV9ai519hurEHG3Ei
         29ZlvHKs+ID8qWMjLPGAflOe66wu03WFn7WRygZSa4XCSxSpv3DalnQWuh9INtprWKGB
         GRJSXioLqQ3ODbdoHJsjBM4ZSdLYLL0HMX6BTzn90diOjHguMwcyqpPR4bP3IPbwFkl5
         DlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501960; x=1741106760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvJy2eU2NKOX06+H5Vs2S45nqKcJ32b1n8dkLQorqiw=;
        b=dyw+iIs8YutUlSbIZD0g5Jrt6PMKHXrlR6j6i7ZVGNa6c3r1u1xuaePZh1eJNbkNir
         YLjImq1vdVKclEO1Fp0xLjVLU/K/8OAksRJegOu0obFi2plHwFixtclsRM7z1tSK5HVS
         ZBqHnmnC34f++pja7Zqw65M+PQoNlWu0gpHOtY574AtozjsC4nBiHwZHMFlCastRP3Wf
         dXUHsVukA1givk0yFJs8H6eyy170AUR03UZuNB5LTfU37zBoB5Z+hdPVGL76Vh1skPu2
         zYqdilWKJBE3w7LJlAGKcrrjQTjQALJettUjb/89ZQzJuA3zQu2/t8YfqUsq8EgVh7s2
         IRtg==
X-Forwarded-Encrypted: i=1; AJvYcCVTrH1JhBAvbl4lfGvJG4dDsC76oIIgchkB38jg8hitG43VijKdzqUYSiwCbRsppvrb/5CXeFfc9pY2a9ziyNzV@lists.infradead.org
X-Gm-Message-State: AOJu0YwmVBpgyQNFz9torfMiyd89dA5+1Y7tv0InVx2bRHLTNCdszxd7
	7hDjnNNCkWbWkpw4HkLpvSbKd+PShHOYawcifbYFQqMYjhFMijDxk/xsERInFg==
X-Gm-Gg: ASbGncv3TK5C5OXH4lrqDwc5Me8EIoOV744mvSAqgA2UvaZ3vFKY4z1+NOx55ReeSmd
	AG3sd3U7EaNAYaVl2fUakKALqqzCNIGWXnPJ8cCsXqJvLiVfiBTqeqi99SMfSsq1GY4Kel56mSU
	/pVE3GvgdzPcQfbfJZ73wRai4CFOaiAl4eDedv/hVDPU1ZVltzJoI9+pP51+3nrljVIf9eQ/f/j
	6G4oLaqx4S0cWUbkgGNL0njbsl2sMzeKxqpbVghUuLX0qpWhpWr9mFeIBDZ8dH9fSsVuxaVk7q+
	RGJDpfoIia1l7ppgojdQRQ55rcYO7l0DP/BEwXoK5vySGfVW+WUczSZAzJyg2JU=
X-Google-Smtp-Source: AGHT+IEN5DYqq3Kc3cWdCDht37pR+ox7Pyn1fNUO9eOSCsjsyhHHqegeAVtSYgiTkCHpwG2cFWbA4w==
X-Received: by 2002:a17:903:2445:b0:215:9ab0:402 with SMTP id d9443c01a7336-22307a98a03mr3458305ad.18.1740501959581;
        Tue, 25 Feb 2025 08:45:59 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6fa230sm1709220b3a.70.2025.02.25.08.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:45:58 -0800 (PST)
Date: Tue, 25 Feb 2025 16:45:48 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v7 12/14] iommu/arm-smmu-v3: Introduce struct
 arm_smmu_vmaster
Message-ID: <Z73zvIbsXzJMCaNt@google.com>
References: <cover.1740238876.git.nicolinc@nvidia.com>
 <be799951a817557ac093ac3e18d02a631306aa35.1740238876.git.nicolinc@nvidia.com>
 <Z7zYLBLZGKim-5UL@google.com>
 <Z7zlH74/orq9HF7Q@Asurada-Nvidia>
 <Z7zqdrQn7Q8yXfcn@google.com>
 <Z7zxsbJsOFp41Dzd@Asurada-Nvidia>
 <Z70EnQ5CXacc4ysT@Asurada-Nvidia>
 <20250225160225.GA593877@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225160225.GA593877@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_084602_511453_3ECBB1B4 
X-CRM114-Status: GOOD (  16.17  )
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

On Tue, Feb 25, 2025 at 12:02:25PM -0400, Jason Gunthorpe wrote:
> On Mon, Feb 24, 2025 at 03:45:33PM -0800, Nicolin Chen wrote:
> 
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > @@ -95,8 +95,6 @@ int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> >  
> >  	iommu_group_mutex_assert(state->master->dev);
> >  
> > -	if (domain->type != IOMMU_DOMAIN_NESTED)
> > -		return 0;
> >  	nested_domain = to_smmu_nested_domain(domain);
> >  
> >  	/* Skip invalid vSTE */
> > @@ -122,19 +120,9 @@ void arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state)
> >  {
> >  	struct arm_smmu_master *master = state->master;
> >  
> > -	mutex_lock(&master->smmu->streams_mutex);
> > -	if (state->vmaster != master->vmaster) {
> > -		kfree(master->vmaster);
> > -		master->vmaster = state->vmaster;
> > -	}
> > -	mutex_unlock(&master->smmu->streams_mutex);
> > -}
> > -
> > -void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master)
> > -{
> >  	mutex_lock(&master->smmu->streams_mutex);
> >  	kfree(master->vmaster);
> > -	master->vmaster = NULL;
> > +	master->vmaster = state->vmaster;
> >  	mutex_unlock(&master->smmu->streams_mutex);
> >  }
> 
> I'd leave the clear_vmaster just for clarity. Commit should not be
> unpaired with prepare in the other functions.
> 

Ack. I'd like to pair prepare and commit as well. I'm just confused
about the check if (state->vmaster != master->vmaster). Maybe a helpful
comment about what are we checking for would make things cleaner.

With this nit:

Reviewed-by: Pranjal Shrivastavat <praan@google.com>

Thanks,
Praan


