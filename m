Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F6EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 18:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbAOOUKsalrnyJTM4wor6y5G5I8sKroNDDc7YCgeN4g=; b=RI0SNiO86zr7OC3Rw6KLlLDqGB
	vNlmaq0HUTRKJYQwPZZmc2txKzKMMhwc63E8BD5xL64/cPY3VLTdMrhpwTb1clUM0vD6G74Fs1S0D
	UeXQGcduA2iFHjA55zsQvKEKmJ2caLx1oykd6U0f7rDhOrNpPNxGHgbQFQa5APO2aC1gP+ivCcs4P
	CTf5GbE/+JuNPDIL+kzHVnsJfGnHr3A5DouEp0ez+uCU8Xil9tlmMqhkEh1Ob5/Vj4Dds/vBlgQIB
	ubgzSDz4VGcQxxGzwvyB6p/V0xJ/QiA3JVlF3981CCNn7UGod9vuszfO4XdZ7+EYoacI32C8tiUI9
	RGPeci1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pyH-0000000Aai5-1sy6;
	Tue, 29 Apr 2025 18:46:21 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pwM-0000000AaQY-2HR0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 18:44:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2240aad70f2so209715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 11:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745952262; x=1746557062; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RbAOOUKsalrnyJTM4wor6y5G5I8sKroNDDc7YCgeN4g=;
        b=q0hT/Xlj9gNJIGmyMoO6EJhoubCqDnYPJuWuUkIfjuQoPIysPiD06BO+nC0JrVUKKN
         m2OywhRPkmewOcg4lbNrteeIXzRxCd3wSAZEtgrFVwgENrfOtSsenZS3AJcNT7QXb+kM
         uf9M+Mu7pIbGSjkrJTjUUjuG0JZxzX0MiRITUsf46el1b8xBbBaltVFebGTC1FK+VS7o
         kMWJcXDuXz8i8D2fKuRVH5yHMA16hrInUljKk7+ge6Y5WkmrI1rRq3jtwxawmti/KOHB
         8byxGs19KQXl+sTbPJkRUvAZRK30dwve84d1DtPQogo5DXndjf/brq+VTSRYJLlAY0ao
         8hiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745952262; x=1746557062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbAOOUKsalrnyJTM4wor6y5G5I8sKroNDDc7YCgeN4g=;
        b=pzKc+tQAlSejF+wyBLpYs8lqV3HhW6VtfYtdLUEz4+GKFe28BLSsZuSrM5Kh9ptWex
         mXKuqhPPHfTRlmhoXZ8POaDgmocZ/4AHbG7mHtwq4Y+8LdgcOeEXjL98cG1l0yxVMO8z
         q3hnt/nZ8z6aqQppsX6GwB6OtIA7VXu4kxKlym/QeGhABendGst+5ZXNHxKy7xoGMD2p
         ok0Fwg4+AgsSO3GkD5OeSE4bBcQHjOpBDOGY+Pnn8CD3Tyi1cOakNX0e6EDigGF5Y4J+
         XSLQ69ZZtDQbwopONcij8XO1Jm/b6hp7llN+eQA0KQZPgdQmHX85XInYbHxkowmNDImd
         cQFw==
X-Forwarded-Encrypted: i=1; AJvYcCXauRRkJtM8rx6KtaHzEGzUloqX43ImwA4FvvVwNjBfeJODT2/bhNm6DvXP0fEoSNQ8vWULlvnEOnrTcjE7GCUh@lists.infradead.org
X-Gm-Message-State: AOJu0YwW+RHVJcCk5UKNLJl/idgEL8obxNgM6VIFey/DIanGhBeKv39N
	em9RhAx+Dk5hl2cu1nDx23EY2xwvmcBajW1M1EsFi3QOmOjZu36M8iqZp2LSOA==
X-Gm-Gg: ASbGncteItZV+bpUNYpxP3xlhv/9cw8WbLwZwE/p4VItDOJZueCFh4FjUbwpKbKab4L
	K7JQL0xbuteGm5zJ02Ar6KzID8o0HARuhMoaHWdr2SLXtORXQCAM3HdCetyCpvHltdAa/y+D8iU
	wjaZIF/qOu9W+Q0U4LUQozlEopx0SiiEBdC/mXzprlcgoKMIBPn6RU6YNngwAtYx3iad+4oc3a2
	Mda3P5VxEPy7Pyd2q4jPrPtM5BOfgArjuhDEkMQs1NSyZkcAurary2YZzJV2pG0hPgg3FwEQeVK
	GIcuY8KKncIXRyMoIGYuLJz5zkcUROHDTFTJ2jR9Mzj4hQnmK614xlp3ojpPRmt413TBnNvL
X-Google-Smtp-Source: AGHT+IHAAAZnrzfCTnyRFSrfgzM7EUKVTFf0g+y/q4rYabIT5b7Fav3BwFROBr2u073eUGpUmQ9SUw==
X-Received: by 2002:a17:902:d2ca:b0:216:21cb:2e14 with SMTP id d9443c01a7336-22df41fb4admr245055ad.21.1745952261334;
        Tue, 29 Apr 2025 11:44:21 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740399415bcsm362b3a.73.2025.04.29.11.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:44:20 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:44:10 +0000
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
Message-ID: <aBEd-kacX84dkUuf@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <a25c9454c17663f9e79b37bc2908bf3a99856be6.1745646960.git.nicolinc@nvidia.com>
 <aBDIpz7w8wxIn_AF@google.com>
 <aBEIBKdjuecVHgpU@Asurada-Nvidia>
 <aBEThP2Bn0YDgXfu@google.com>
 <aBEVboMt0OtZmt4Y@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBEVboMt0OtZmt4Y@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_114422_575846_0F655AF5 
X-CRM114-Status: GOOD (  34.94  )
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

On Tue, Apr 29, 2025 at 11:07:42AM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 05:59:32PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Apr 29, 2025 at 10:10:28AM -0700, Nicolin Chen wrote:
> > > On Tue, Apr 29, 2025 at 12:40:07PM +0000, Pranjal Shrivastava wrote:
> > > > On Fri, Apr 25, 2025 at 10:58:06PM -0700, Nicolin Chen wrote:
> > > > >  /* Caller should xa_lock(&viommu->vdevs) to protect the return value */
> > > > >  struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
> > > > >  				       unsigned long vdev_id)
> > > > 
> > > > If I'm getting this right, I think we are setting up dependencies like:
> > > > vcmdq[2] -> vcmdq[1] -> vcmdq[0] based on refcounts of each object,
> > > > which ensures that the unmaps happen in descending order..
> > > 
> > > Yes.
> > > 
> > > > If that's right, Is it fair to have iommufd_vcmdq_depend/undepend in the
> > > > core code itself? Since it's a driver-level limitation, I think we
> > > > should just have iommufd_object_depend/undepend in the core code and the
> > > > iommufd_vcmdq_depend/undepend can move into the CMDQV driver?
> > > 
> > > The moment we added iommufd_object_depend/undepend, we already had
> > > a blur boundary here since we had no choice to handle in the driver
> > > but to ask core for help.
> > > 
> > > The iommufd_vcmdq_depend/undepend is just a pair of macros to help
> > > validating the structure inputs that are core defined. It is quite
> > > fair to put next to the raw functions. I also had the notes on top
> > > of the raw functions suggesting callers to use the macros instead.
> > > 
> > 
> > Well, yes.. in that case let's call the macros something else? The
> > current names suggest that the macros only setup dependencies for vcmdq
> > and not any "two sibling structures created by one of the allocators
> > above" as mentioned by the note. Maybe we could rename the macro to
> > something like: `iommufd_container_obj_depend`?
> 
> That's the intention of the macros: to validate vCMDQ structure
> and help covert a driver-defined vcmdq structure to the required
> core field, as we only have vCMDQ objects using them.
> 
> If we have use case for other objects in the future, we should
> add another iommufd_vxxxx_depend/undepend macros.

Thanks for clarifying the rationale behind the VCMDQ-specific naming.

On the point of needing new iommufd_vxxxx_depend macros for future
object types, I don't think that would be required because the current
static_asserts within these macros validate the container->member.obj
embedding pattern, not the struct type of the container itself which
makes the macro logic inherently reusable for any other object type 
that adopts the same embedding.

However, if there's  a strong preference against making it generic,
I don't have any issues since we only use it for vCMDQs right now.

My main point was to keep the core code seem generic to aid other
implementations in the future... today NVIDIA has CMDQV, tomorrow maybe
someone else would have something for vdevice or something. Anyway, I
don't feel strongly about this. Just trying to help :)

> 
> Nicolin

Thanks,
Praan


