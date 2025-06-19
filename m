Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA641C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 11:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWamqH4Qzt1P4RdD6HP7YstMpMkIZRoPsNcDiTnzqKM=; b=D0C0f1Kf7GefnkRkz/SnJBS74p
	BUrGx9peFA0Z9MXtm0AtKTr+zfdrYWRAsqG5a+XCrD5x+pJoaaghjCvbxpzxcKx3udwn8BxjAE68E
	FeDBSyDUaLDbhZEscO+uOQ9nmwfafpeJxAOF+1YTQiAsXCxXSQrs6+2IDtn4Xk3UFF6cuh08Fo92n
	/zUsoPsuW7lieJ3u9cv6ScrkD2prKjIozPSqDfhpYAxdOuhG5w4YVhAKHlertZaa0Ng2sj2u1zH9p
	bBzhT2Q1ZeGuyqDMmuULE+vITT3Um1v2/Wu8P5aPv5pEr0u1+JAFdkSr3JgiFzVOn7rEyZ1PrPXZc
	wj0Th6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSD4L-0000000CoHZ-0IZ4;
	Thu, 19 Jun 2025 11:04:33 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBM3-0000000CaIt-3aim
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 09:14:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-235e389599fso154905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750324482; x=1750929282; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oWamqH4Qzt1P4RdD6HP7YstMpMkIZRoPsNcDiTnzqKM=;
        b=1gNFutwytHYuVLmvhIizLVpmvKeuZh8FmD5Mr+0UOhLuUPnzLXMvPXE4eaXzK7bNYq
         n9KAnpwO+FZBMPEJD2OmJKL0gz5O6sCuP/0WcAoGhlfHdt6OBNOIHskJTqTBpQAjmmrP
         RMvHhosXy4RggxKrlGIp+iquLL23yey7nDHm0j4+qPXMAsykYTIBYxgrpS/7H9dgBPAZ
         zlMgf+UWQPXEmUW84VbTD2hB5D9anpPUJV1rGbJjmKWCbHs5NhPCnpWJ8ilF6A0rPlWz
         ZklZKdo6EFgOWHnGzjvagC3AdIp7TW5REVZQfXJKF6anHDV/IdtbQQ0C/sLGBAuYiCYF
         oU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750324482; x=1750929282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWamqH4Qzt1P4RdD6HP7YstMpMkIZRoPsNcDiTnzqKM=;
        b=tNlWbPR5H3PSM0BxtrTLgnAdYKAFruPACPuSIHKae9eYGxIT9dtYJStN5TUQDIPIqB
         Lw+L9vqYbXtl9Azo8qoJpH2CrGRF/Iqre1NnuA4f7pSLICUP9OK05aT377FLjnz2YpEA
         bU4dU92+p+k6X4f/nAF6jYVnBCAzA9cnRdqt10swoj9zguwZnoAg+M6WxOYoI38Idpwu
         zLBguZpifxmT1Z3+KITp+Bu9BdMwLozQP7r0LihCDZ5ECY/suoNYoJwGmUC7dxTREWU1
         x4hjAyTSjF9ME8gcgvEPvoJyay+ytrbQWIr7Qr+/DSX4NMGjN5emklh+lj+NFqcY0mf4
         HC6g==
X-Forwarded-Encrypted: i=1; AJvYcCUaObb3QZB8QBiN33WjVjCHssBHim4mVT1ovM0iP/e98dFzMM0rzsC6rO/MwGPUC6PxvE68BHVcJ5/j+PbwtzoY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1FqcGyeSccbHmHD6yM4ERoroLPQpU3++b/JGaV3M4VlkdMq38
	aLwhFgNCmlmMt1qvbLlkRVrV3s2wRVvgEmKk72XE+A+52S2Ue0bGBnZyvp6P7DzQng==
X-Gm-Gg: ASbGncsOsmP/KP40i4nUOLw3ZRyiE7glOnOzMUEL7Y/S4LjaDx+rr6iRdMoBaQZp/5W
	wF5+pfj3Z6Wmlll93artZxKZ5MPCuxWGA4e0CW5i6AzRNqKQCjHdNwASDPmiT/oZtJqwsy7KE+5
	yg/t2Z/obJYsyUx0OXVD0UVVxyioLfVyWeZGEavlKYP7Ob/hgd0/8UWvcGRVEG9R/NaJGYIDgJp
	dSAQLp8t75G+1uV/BdbfeJpuxa+yX1zSnfw0HT1LWeFdk+0k2vWyJkkoMWXXVIwYzsckNR5EBvs
	DCts5LtlSHeRfI+CbfUn3N8LUW82yiuOFSmT/kwDhsreYCQetZ3Mw0LNu/fltYwk5ww4fi7mdC9
	JEyT8W96/aRMwN4fgPqsJ
X-Google-Smtp-Source: AGHT+IEvh8ntAaeawSzvvAW9v54xfOai3SDk6b1VSkUWtSTdDIzpJHZdPCeE04W9I0TDOLd777OhYA==
X-Received: by 2002:a17:902:da48:b0:234:13ad:7f9f with SMTP id d9443c01a7336-237ccb4af65mr2441805ad.22.1750324481903;
        Thu, 19 Jun 2025 02:14:41 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c029sm114860565ad.26.2025.06.19.02.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 02:14:41 -0700 (PDT)
Date: Thu, 19 Jun 2025 09:14:29 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, corbet@lwn.net,
	will@kernel.org, bagasdotme@gmail.com, robin.murphy@arm.com,
	joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
	jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
	nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
	mshavit@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 06/25] iommufd/access: Allow access->ops to be NULL
 for internal use
Message-ID: <aFPU9TKgU0Lofl-O@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <e6a989c4dd9cb94aa4a98d46ed56a2afcb41b70d.1749884998.git.nicolinc@nvidia.com>
 <20250616133305.GB1174925@nvidia.com>
 <aFDRKEsdVZc2XQ91@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFDRKEsdVZc2XQ91@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_021443_917354_E37CB51E 
X-CRM114-Status: GOOD (  16.02  )
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

On Mon, Jun 16, 2025 at 07:21:28PM -0700, Nicolin Chen wrote:
> On Mon, Jun 16, 2025 at 10:33:05AM -0300, Jason Gunthorpe wrote:
> > On Sat, Jun 14, 2025 at 12:14:31AM -0700, Nicolin Chen wrote:
> > > @@ -1321,7 +1328,7 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
> > >  
> > >  	/* Driver's ops don't support pin_pages */
> > >  	if (IS_ENABLED(CONFIG_IOMMUFD_TEST) &&
> > > -	    WARN_ON(access->iova_alignment != PAGE_SIZE || !access->ops->unmap))
> > > +	    WARN_ON(access->iova_alignment != PAGE_SIZE))
> > >  		return -EINVAL;
> > 
> > I don't want to loose this check, continuing blocking mdevs is still
> > important. Only the internal access should be able to use this
> > mechanism.
> 
> OK. So, it probably should be 
> 	if (IS_ENABLED(CONFIG_IOMMUFD_TEST) &&
> 	    WARN_ON(access->iova_alignment != PAGE_SIZE ||
> 		    (access->ictx && !access->ops->unmap))
> 

Nit: Probably worth mentioning in a comment that access->ops shouldn't
be NULL during selftests and hence we avoid checking for !access->ops?

If you feel it's too verbose, you can let be as well.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> Thanks
> Nicolin

