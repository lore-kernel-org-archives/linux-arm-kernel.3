Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713C9C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 18:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZWx5YzsE6VtBscW7jSSrryOsxFdJT63HSkZNADS7Hs=; b=EfpRUUJiTLpDyCO9fcb9Ntm1NI
	51nu4JFBjXbl1PwwYOTi6SpGiHU7EPSXx8bMhZvYi14Cmjro0KoxQmHj/mA0PcfsQJKWA70D0On3a
	OvtDzAo4PirjtzRaUvfCNoFSIuv8ImVH48HATqhTBmJqZU2T3pUjBldJ6ZMaPbANeOxXQaajabSeX
	FOaM6uSWrxWgE8EU/mi7VvhDQp/EufnDvVX0LG+DhhShxe9juFv3/BR5JARgXkncx5tqcZffT0coN
	1ssZGtAs8e6QJnlBuqtYY1+44qUoRyfP4eZKXnRIE0stiQZ691Ua6WPrldmPHaAP/Ip78OOU6mN6Q
	GwCzbnBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pH8-0000000ATSe-0w7J;
	Tue, 29 Apr 2025 18:01:46 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pFB-0000000AT6k-11WZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 17:59:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2264c9d0295so198275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 10:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745949583; x=1746554383; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QZWx5YzsE6VtBscW7jSSrryOsxFdJT63HSkZNADS7Hs=;
        b=mPHufB8TZ3yZUsMpg8M5aIHhgBszcZQBf3eGqOQpTFiYvNS5xi2B9KbV/batLO0gup
         W3K+I/149Xauknd2sWlDRevXKrgQ2aoqSYYul/PsHfUjb+FvPXHrr3U5l4NMwUTtt9sj
         4xcRVAVw3xBoztMKvrShWxhI6Dl92iEd8Cpu3m+j18YbzgUQCFp+SwJXOKI/03LWykTs
         F0xELw0rBsWMJdzupk/VnAEi3SPdVK5sUcpsCcccI+phcBAHyvnrUZ/jmeay6AJ8RiSq
         J7PA1PwELoo+RoOcQzzzYLGnoWEto9C+p24K89WJBl+cKti4GBVCW7HrPEuAVnspJgk+
         lsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745949583; x=1746554383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZWx5YzsE6VtBscW7jSSrryOsxFdJT63HSkZNADS7Hs=;
        b=Hj/9dbhF0RfO/dKrlP10rt5upXovhbaLWJePLO7htOzAOVu1kYwOtJ9OEV64nO0IOs
         3xnvH4vtx+fIxwsS/khMYbKlEeL3EBueB3iyn0/3fJ8MqwzC13D3qWP/YU2TruL9pFa8
         NT2SWLUsNLxGYhYDzlgZ/8F8ohBCQKFKJEuVT5s1I6LJqBoasHXLURoOgBgOUNSWKeIo
         ycOopfCsm7tgRMJNkm/szxfQ5QTdirPPJkqiBjWYIyuS+y39XYPt5Ub1piDzpaF5DOLM
         jke/5LMKhOPIVnFXQhWsNEGFplfRne56GJsT40zVcZ0ppXRIGjxokC+MuJNtqMqfz2vo
         2dPA==
X-Forwarded-Encrypted: i=1; AJvYcCVru9v8moVf5zlT2sRnyVdVGy1uGUTxRRGqNw7DL6w3p3ge1YkZLVr5HBM+aFuA88O2XFvVB92CWXffz5M9ISwf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6iF9fjC0ut4aj52rE/GSJJZdN+7NNuIiESU7Iaoo6aCXFuW3m
	uRpJq7HfSIbHybCZTZO9TJuTn6G/4eL8+v1BgaGJJx1NdgtKwr3TCAUdrRF+Dw==
X-Gm-Gg: ASbGncsOjkNLsd69kLWLwuDsFPQ0zbPvDBd9E2DH8+t/8MZYJVT2Rzo6P93FIlHobl8
	Vhqg4eXCxNltDo5oUbTMLqdhEHeRWQZtA5JDQrLlwROYsZrKzFilECrPc9Agadu5LMRLy7lVizq
	sdRpTpOvuVqbA9PS3MYM2WJdyCCzWAMXRIOyn+lEpgN45PyfFaLujD2Np/2tabE+IDsqYANCA3G
	d57GtZR/8W/LQUT/goHwdQ+pN3FGQtYBcloikgCM67EySTJ0NfJxj8vlWWDUzUz6PHgYkbrd3aE
	WUfs9TQ4iQMy5pFO2O3Xjd85HsR4eR/JDXSknth2kRCP81LWbd0XbXt7nyv3MJh6KFYpOQ+C
X-Google-Smtp-Source: AGHT+IFpQWcmyzP1N/TbZRNb1gatjkwbbsmgC09afTOnO3GyWImnhX2qlaIfI4JGDZZ0CTRg72ZS0g==
X-Received: by 2002:a17:903:2303:b0:215:f0c6:4dbf with SMTP id d9443c01a7336-22df3fe491emr117295ad.14.1745949583190;
        Tue, 29 Apr 2025 10:59:43 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db510272csm105625315ad.177.2025.04.29.10.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 10:59:42 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:59:32 +0000
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
Subject: Re: [PATCH v2 11/22] iommufd: Add for-driver helpers
 iommufd_vcmdq_depend/undepend()
Message-ID: <aBEThP2Bn0YDgXfu@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <a25c9454c17663f9e79b37bc2908bf3a99856be6.1745646960.git.nicolinc@nvidia.com>
 <aBDIpz7w8wxIn_AF@google.com>
 <aBEIBKdjuecVHgpU@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBEIBKdjuecVHgpU@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_105945_281319_96421C83 
X-CRM114-Status: GOOD (  24.91  )
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

On Tue, Apr 29, 2025 at 10:10:28AM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 12:40:07PM +0000, Pranjal Shrivastava wrote:
> > On Fri, Apr 25, 2025 at 10:58:06PM -0700, Nicolin Chen wrote:
> > >  /* Caller should xa_lock(&viommu->vdevs) to protect the return value */
> > >  struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
> > >  				       unsigned long vdev_id)
> > 
> > If I'm getting this right, I think we are setting up dependencies like:
> > vcmdq[2] -> vcmdq[1] -> vcmdq[0] based on refcounts of each object,
> > which ensures that the unmaps happen in descending order..
> 
> Yes.
> 
> > If that's right, Is it fair to have iommufd_vcmdq_depend/undepend in the
> > core code itself? Since it's a driver-level limitation, I think we
> > should just have iommufd_object_depend/undepend in the core code and the
> > iommufd_vcmdq_depend/undepend can move into the CMDQV driver?
> 
> The moment we added iommufd_object_depend/undepend, we already had
> a blur boundary here since we had no choice to handle in the driver
> but to ask core for help.
> 
> The iommufd_vcmdq_depend/undepend is just a pair of macros to help
> validating the structure inputs that are core defined. It is quite
> fair to put next to the raw functions. I also had the notes on top
> of the raw functions suggesting callers to use the macros instead.
> 

Well, yes.. in that case let's call the macros something else? The
current names suggest that the macros only setup dependencies for vcmdq
and not any "two sibling structures created by one of the allocators
above" as mentioned by the note. Maybe we could rename the macro to
something like: `iommufd_container_obj_depend`?

With this nit,
Reviewed-by: Pranjal Shrivastava <praan@google.com>

> Thanks
> Nicolin

Thanks,
Praan

