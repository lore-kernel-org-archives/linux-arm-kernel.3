Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A850BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 19:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2eyvzlKuLCQH5Cuh9KFE8Y+QAaptwkDzMvAXLYmk8E=; b=pjVFDTOPMOEnTHZa6mafxNYKs5
	GwWDmRY6osdEKNkfD4sPfPX23+6SHvV8hqAkb5Y3Wn6OgyDNg6jSrhwhrK4CooXM6tw8oxea2Sdxh
	uvLi2OFaN1RBrZ5/67tj654jEdEpcFxPSok1fxvlRA4UiOxfjc6LEVwmp8L3rLeV+6KNK56aqv4G2
	f1px7VzBR73OotOGshweLg4qzj6O79DKETiVD8vkQb4RI8jRRxpw9pxs22fUPrJhaEtYqg98NTRj5
	0Lyf4tZMpRy7Nt8N7PLwUJ95Wav72jjMGEageJVsSYwFUiqh8NMIva4MixiCSNAnexm6lydAbXI6t
	HVy5yBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwmj-0000000Cnyj-2uOD;
	Thu, 10 Jul 2025 19:18:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuMu-0000000CUVB-0SrP
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 16:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C2eyvzlKuLCQH5Cuh9KFE8Y+QAaptwkDzMvAXLYmk8E=; b=R4+FXHOpiIsdDf4mAOCaOOPyJz
	0THipZB5fs9GmvETRlNKBRrxToqHdRBT/pQWtPR9qd33S+URts5Goj2o2Xfmqq8GJ8oF1nrV6sgXx
	FyefJ9RrFaZscRKLGH3lNp9j7FqmoSYPFcreOhWKVsJFiadKX/FNE8O/DOhZ20WVPUtGlEwynHD5i
	sK2hI8imB2EjEhD1uhjGcETCLOVnXzcDEt4dZZ5UidlIGrlt1IRUbo/yqDRk2nX1t+Mx68XkgaBJf
	ciHB6AKSdkHboirxxvWq8MC3mc7ZPsQCL4fmEN40s0X4FSmIPX0GwQlSAY/rFmLnlxTye1Q0TBjfd
	ZFxKKhRA==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuMp-0000000951G-1zT3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:43:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-237f18108d2so4075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752165805; x=1752770605; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C2eyvzlKuLCQH5Cuh9KFE8Y+QAaptwkDzMvAXLYmk8E=;
        b=ZC2j4Xh2mCrdrlzBSJGlW16A3Z9Clnfv+8vZoBQy4weLxMGUtTbbQw5zPMV2O9jRDS
         mOMK9BdEJAMF3xgqr94rjXGSb89k4I2luSUO9uOpqS7ylXIip8miyECzoV3lPZJZOS/T
         UwVt/cQWSS9OKmahi32VbfnnWsonAZ8X8Em2wziqoJdxJJWIePY01uQM9dnl/cgnC1EM
         sYYXSrkXqOBvh35hAXU4ZRddXeEgb+DBMRdcbfjdOVLppY0094uHO59zwh1bb3+DeJoG
         wyzrc4tcQ9TNBG6q4j3MfdR9WMZ1dvuWaRvF8V+v8SwtytsBSmT+GRdm+VNJcF6xg+4K
         QG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752165805; x=1752770605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2eyvzlKuLCQH5Cuh9KFE8Y+QAaptwkDzMvAXLYmk8E=;
        b=wHyxcNA0X2hfB/J4/aEc+JuEajSGTkQMmExmK7g9OdxFVR8voqO5eYAYoLucHHkyf3
         Pq0/CZfceNEeHktGckJRQLv0a4H19vNvkEo/5r1rdPY7AzS28LejBA5QZJwdePzebGXb
         /cEigCoqCm4I2u89kJpfUbA/1UMrZBfvevg0FCEAI7Iv7Qd/ClHdq/Dmhd/lj6rhm5Qi
         EHZq0uTXAR/MTngJOTrywMOZYYMimOyhMjX97R07Gr9wg9bsoiZllMO+m+UD5XYJQx7B
         zpCIWelaqXsAOW3RJrKtzLf9+U1Z6Py/83f7Cn0iNwsadawfQplTdO2MwwxQGYfDCGBv
         agyw==
X-Forwarded-Encrypted: i=1; AJvYcCXsaEmHGLiXHUZgIvvheYV678taLa0MqAowCbZvn6Wxax79Gr6C3LZ6wVGDYnqTkE9YKMH/mRp2hUQKkaqnCRc2@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf4Rprs/K8qBdeE7EaL8sqFP1hOzG+3zWGacTnpcE4Y6uPJWX4
	z6rBW5Hmyrn4erYnXxd8F5bML0I7kHQ1HmBBZOBFKBjHxQg9bN36uICjkGzXRV6I2Q==
X-Gm-Gg: ASbGnctUp84yrkwFYpSEo6zi+KNJKMxlnj90RhbH6qPyFoP+4FP8xTHVsWy7KR5yIkj
	1dvTZDZNqNCQhZVjXSsWG/gdosm+7a38YMYyXmsqJ/2iPHtf0MRDomPPVGJhbG8b3X0NcT5ArJ3
	rcymq60hfvjFBeU9jz8hIACOwcyk6IiMMN5Ey+Wiibgz8lvATMCwvcp1Sf0593WAfkUdbiyesF/
	9IqXIPuXJGp915VU1Ng6U6DbOqKSTP0AajPfaIrYbRnpe29DwS7qLltLCnNgUyYXAvGMia2ScRy
	nsfKs8wFK3uOQBK3Nx+BY8OXQys8c7jXByZJKuCIdsS9McQ8Q8g81kFzZkp/idrUKDXrNEIGI4b
	v//ZQVtBsIdEmAouo71swVDZgCP9E/Dg=
X-Google-Smtp-Source: AGHT+IEFm5EK2K+aFRgM2luBkKYZSMINjT3NZbf79E/WEwhVEuFkFUby27jaM+gbx9d+ftRkB3XZMQ==
X-Received: by 2002:a17:902:e94c:b0:234:9fd6:9796 with SMTP id d9443c01a7336-23de43702c4mr3052595ad.19.1752165804369;
        Thu, 10 Jul 2025 09:43:24 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de435c2e3sm24897415ad.226.2025.07.10.09.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:43:23 -0700 (PDT)
Date: Thu, 10 Jul 2025 16:43:14 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, bagasdotme@gmail.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v9 22/29] iommufd/selftest: Update hw_info coverage for
 an input data_type
Message-ID: <aG_togvop53dLSZM@google.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
 <f01a1e50cd7366f217cbf192ad0b2b79e0eb89f0.1752126748.git.nicolinc@nvidia.com>
 <aG-fZv39ci6yip3z@google.com>
 <20250710153202.GO1599700@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710153202.GO1599700@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_174327_708578_33D3FD92 
X-CRM114-Status: GOOD (  16.88  )
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

On Thu, Jul 10, 2025 at 12:32:02PM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 10, 2025 at 11:09:26AM +0000, Pranjal Shrivastava wrote:
> > On Wed, Jul 09, 2025 at 10:59:14PM -0700, Nicolin Chen wrote:
> > > Test both IOMMU_HW_INFO_TYPE_DEFAULT and IOMMU_HW_INFO_TYPE_SELFTEST, and
> > > add a negative test for an unsupported type.
> > > 
> > > Also drop the unused mask in test_cmd_get_hw_capabilities() as checkpatch
> > > is complaining.
> > > 
> > > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > 
> > Reviewed-by: Pranjal Shrivastava <praan@google.com>
> > 
> > Note: I see a couple of warnings while building the selftests on Jason's
> > tree, but these seem unrelated to this series:
> 
> This is fixed in v6.16-rc5
> 

Alright, this was on the `for-next` branch when the head was at:
3e2a9811f6a9cefd310cc33cab73d5435b4a4caa
iommufd: Apply the new iommufd_object_alloc_ucmd helper

But I see that on `for-rc` [1] the fixes are merged.

> Jason

Thanks
Praan

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd.git/commit/?h=for-rc

