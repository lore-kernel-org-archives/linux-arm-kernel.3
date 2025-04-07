Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EFBC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PM1xp6gzVd/l23ioaAQhkaBubnLpRRJNpYojAABDe0E=; b=SWpnRsi4ilRmQL5z2AEIIx4Vbw
	WHgqi+VkPDZEpbt9dSiOYn34FknEN3hpW/zbe6HFpNbUzfbpnaz7Z0PsKiAuIvak25XKkN5ZP6wB6
	8qoVPVHSIXcNuwDVjhX6C1KRPWcXYSjK8WAWjmqex6hYpu5mMNLZY8L9vTFWdU236qy4DUxLQknIx
	UW07luBYSgMMylK8Uz9jZrOx4UV1uSYCPHhZgeuZlt9bCbziyUMPTFAZgX4lk66PR4sgmuuwAqcVr
	n4BVhveSvkE/w5fc+2kbEyHUBYKXVK5Jmft9vdwVI0kMB1XjcKEzeKfHO1lMHNiz2ydhoXRdGkyjU
	2tDzJFUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iFZ-0000000H5bq-1mbs;
	Mon, 07 Apr 2025 08:54:37 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hyt-0000000H2Wp-3ZXW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 08:37:24 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2264c9d0295so324945ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 01:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744015043; x=1744619843; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PM1xp6gzVd/l23ioaAQhkaBubnLpRRJNpYojAABDe0E=;
        b=k+8HMHMlJ2Op4OUVtPNNgqyNOEMloclLP+8EdSIda75UdDTS0DWnhTvhm3/54664a8
         LQDIlim2ZGHuPtQuFw6xRE3EV73pvV7gC35ZVVK32yYNG6Q8S+y1WuW10LGY4YpoLus4
         miAxgZi4wFPu0YvDy9VM17eImMrADpbF7Ab2ogFN6bp8onWuwVVwtF0dIlOUKSkDd0nN
         aOcaaqjzfPbPmGeZF8yA+2XBSM1+kuXkbOW6XmtFQcCuHL/DBC0whmzACQVImbmjP4OI
         dp8m2jVgZKsn6AXVXe9jvLC4mfa9RZGWJYhVchv4OY7Sm84HoGkB5fAAnqhBW8Qh9ovK
         BoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744015043; x=1744619843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PM1xp6gzVd/l23ioaAQhkaBubnLpRRJNpYojAABDe0E=;
        b=EDG33mIXf68BY/9OUQ3zD2SDIPb4wK2TUeK/0/3O8HTRQY7aUqRK3kZw0Ys8WhTsO+
         KuWWvjq7ALW2ysvNnfwXwHKVyR/HtXa5QCCWdlT2qUnotvXoH7CPERPxLCdXV0M39s3Z
         O3sSWJgwbTH6ylmKLocjUJ1z59zBunMwzb/YBPjZpSCNWlrEoVqDJWJue8x2PUNxJcXx
         zA5RD0t3c/FPwGxnw87UhSeiE5QJN3KvxMwJFH29cUeLawuQzxhPl/yFQJ8Sm6/ZJCjj
         ozHh7cO0tsFVsfU+CGBIEEDsCjDfsQ7kKlBbcoAQY2BUdlvVTNzVkZSIR/oeBrOSTWn3
         s65A==
X-Forwarded-Encrypted: i=1; AJvYcCXiRUIjMnBZaiyl+bWU6CbJHPWlN9B8oKhhpqykqqfU/BpU/KMGgLXNz0AUl47zzO6byWuFyp96MGOywqdZdDNW@lists.infradead.org
X-Gm-Message-State: AOJu0YzmOn0bih/AwPwFQ0c6LoClaqeGgrs5K7guAvAFhbgL65aahIml
	vYrdLvFhp1NYGVXzMcYaQeur4R5rdR5S++Ul9rK9m7rHLvH7pwFnUuRnu8bpmQ==
X-Gm-Gg: ASbGnctk6Q3XdwnwFSLSLuM2Gz1vrUf9PXR6G642oyofE1wg7NyMC9kYKeiTt8KXHMc
	el2rt/l3nIgiot/ZFgv97JSW4qHORxbc2q6mN1g7eRW9uBi0lY1IGb/aJlWJOyfqLXjMbMgYajR
	Jjsu9A2smoqlrF9G/uQGsWMOJJq9rHXRFR9zSRcXWBLAjyogV8IclQ1Lhle33lTI4L3+aI5Omye
	l5HcNkbbl2eDEbJZXT2FGkJqqbIfgUxJE4SCN8i9NavtUJ8GDLNXe7r/cswXBlk7NBZitSt04yR
	Ew0AuqjBRvjcP9SQIFOrSyMa5pcDT0dFDfkHx6Bn07B5OsNIyCEBiiwG7YtjK6DotmJZbgPm/+y
	7uCU=
X-Google-Smtp-Source: AGHT+IFEcecwODNx4wiqbqJKpBlZrrA4mcqLS8OyyMt6tYMj4vc7ksfjibFdVhVKjFGu4nMmJA0OlA==
X-Received: by 2002:a17:903:2308:b0:215:8232:5596 with SMTP id d9443c01a7336-22a95e638e2mr3367595ad.16.1744015042625;
        Mon, 07 Apr 2025 01:37:22 -0700 (PDT)
Received: from google.com (188.152.87.34.bc.googleusercontent.com. [34.87.152.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d19c5sm7904646b3a.20.2025.04.07.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:37:22 -0700 (PDT)
Date: Mon, 7 Apr 2025 08:37:14 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"jgg@nvidia.com" <jgg@nvidia.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/4] iommu/arm-smmu-v3: Pass in vmid to
 arm_smmu_make_s2_domain_ste()
Message-ID: <Z_OOukRG0foehmV6@google.com>
References: <cover.1741150594.git.nicolinc@nvidia.com>
 <214b10db02f1046efdc70e2c4803111357f60070.1741150594.git.nicolinc@nvidia.com>
 <a95b39a55c324907a7001d3a2cdf076b@huawei.com>
 <Z8iNfnZ9N5Lczxmq@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8iNfnZ9N5Lczxmq@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_013723_893122_8615179C 
X-CRM114-Status: GOOD (  16.46  )
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

On Wed, Mar 05, 2025 at 09:44:30AM -0800, Nicolin Chen wrote:
> On Wed, Mar 05, 2025 at 08:50:17AM +0000, Shameerali Kolothum Thodi wrote:
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > index bd9d7c85576a..e08c4ede4b2d 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > @@ -887,7 +887,7 @@ struct arm_smmu_entry_writer_ops {
> > >  void arm_smmu_make_abort_ste(struct arm_smmu_ste *target);
> > >  void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
> > >  				 struct arm_smmu_master *master,
> > > -				 struct arm_smmu_domain *smmu_domain,
> > > +				 struct arm_smmu_domain *smmu_domain,
> > > u16 vmid,
> > >  				 bool ats_enabled);
> > 
> > Now that vmid is an input, do we need some kind of validation here as
> > at least vmid = 0 is reserved I guess for bypass STEs.
> 
> Perhaps it should do a WARN_ON_ONCE(!vmid), as it doesn't make
> sense for a caller to make an S2-bypass STE with this function.
> 

+1, a warning should suffice as the caller isn't expected to call this
with vmid = 0. For the s2 bypass case, we already set vmid field to 0 in
make_cdtable_ste for clients who *really* want the vmid = 0.

> Thanks
> Nicolin
> 

Thanks
Praan

