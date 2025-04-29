Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E34C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNi2KjTVYx94VsJLpl+aLzT0MDWDcyauEZBdUwqWejg=; b=XXKBr9o6o7vFp3JEDvbFzG/eRI
	w+K7T9LyH5ag9qcsyyXmuyNiJBie/HQT4BfCxFPAPn02jiWqH5JZccKQfULYW8jVri8S9hBwcuwdT
	NOxBd1keutnQYzhtppWUseMTEfblJMlu/2+PGYwOek9CEHmCDO4BC3TcWtxiHC3yVOwS/IYRWQlkd
	i8SO73CmaLemhkScj6GRzLQv0iNAcGgpQhs0W4+JQ6OQZ64ap3DKEWkmiGZM9gYNklVHIOom/iDyH
	wmZFlYljgjXoL/wbmqI0il4lXM4wtpQGUS7xxEROs2C6CQ7R8APvkzldWusznY9VWjil/9qqOfusw
	iQsfbGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gPW-00000008xJZ-3nln;
	Tue, 29 Apr 2025 08:33:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gN7-00000008wxG-2lOE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:31:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2240aad70f2so89835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 01:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745915481; x=1746520281; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TNi2KjTVYx94VsJLpl+aLzT0MDWDcyauEZBdUwqWejg=;
        b=ZIzGac0K7z2MSI9tQ8QXpbkTrQCIohEe+TYVbMEG5H1Y3VcIOkBKiOWoSmUx3DRthH
         tJ91QZlN7eIDptv//0QpL1CGru6/aMU3XVgjRliDrXy8G3ofq1cO/UoXPXHBCPAP9rwu
         CcDrbiAW6BFcbCvx9JBhoE94HA9kIs3ntrODQnYBwlaq4KsOg2D1BUC0f4b7fN7ZWdVT
         vdZNKRVuXqHizoUmu8hJYM71c/H3zM0+ws5rOBEWcBjzOKVZMtv4v0sqe6n3NJVs3G1J
         8yAZLl6odiCBF91CVHuUPMnl9Hfu1SHNIbHg0FUzhnfViE6zmK6EfKmwESHmh7kRzUmj
         /46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915481; x=1746520281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNi2KjTVYx94VsJLpl+aLzT0MDWDcyauEZBdUwqWejg=;
        b=d/DBsjnsje/Hjx2+ju+BJZGDv8fhaNK33p/Eo9O7uhmPcfTkB9e6U7fwNuBXBPUdGO
         LK7BrgSBwxzIdC1Dc3YZfbqFrUJqjZHENrnyhlXEiLWXUJ0qlMncvShX4P/LTPiavuHV
         17UVhjoKNSjJDlYYO6e802lJrU7gRta29xqXwZS4BXkpKPeXn3KqGQUNyuo/EN7jEyh4
         96B/H6MP+CtxQ5ubvOte2u19fih+6QS821eExn9ZsbI7XKvh+tLTJruA0vzgeAMSsMz2
         TlHc8eSLmYAu82FuiXtX9u5sA07Ofqvuy/gGksbJFAF76X0dQYGFYp7MlLXIpCjtBwOq
         +eCw==
X-Forwarded-Encrypted: i=1; AJvYcCXUQUHckg58bY5JSfAm+GbE5BIGpuJXKYc+BNb6BIpJPM6IaAZMCvNA2wbDdiVOCppv+mQzUaoYsqDin2nPCRtX@lists.infradead.org
X-Gm-Message-State: AOJu0YyUhPdHkskSDQN7VAY3vEQ6Ro+RuwPIAUXwJjSRjc3DUA65kZgR
	OvkONH9o0nw5ql40x9GBZZcWu0cPW7SI/SsPojAQIBwUUudTLiUhFBSUL57hpA==
X-Gm-Gg: ASbGncvEBlgD0E9cK8t9KLZVaUoDL9MuZCb4YQAGtMKljXQ3gvmIrJX1twaR9sUeahN
	DTNGg9z16fAmT/0eOivFvWeQOj9rVvSsfxgRHMEf+WmXkjkeNWnlQ6WnFJj0dhZM0KN+/0YQ5Yc
	+ZjKDFwxF93qCwKtQ5rtQCi+J9x9iuEEMzWcuYtRdFxxbWNQrKYJ7tphypaVVupfcSxL9QzNaQK
	fFmPF211EXZBAgrpWtVsDknSxWmNrizNKuUC16umeKjCx1T1XQnFfhyXMDlAMEtW5O80wj2Nau+
	hdo0/P/SQdhPff4g+hHBgB12z1XtkICf3sA8zMZRH8AQAgxkiIqqhuKJQsTbBitmwybxJPGK
X-Google-Smtp-Source: AGHT+IEuwEN6Vz0nl2aEx/jObUHE3H07L74jGS/5bsNXpJR+QacDK6nh9jI6VmQObGdH+OZv4saKuQ==
X-Received: by 2002:a17:903:1cd:b0:21f:465d:c588 with SMTP id d9443c01a7336-22de6c52c70mr2586365ad.14.1745915480493;
        Tue, 29 Apr 2025 01:31:20 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef124ce9sm10440195a91.34.2025.04.29.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:31:19 -0700 (PDT)
Date: Tue, 29 Apr 2025 08:31:08 +0000
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
Subject: Re: [PATCH v2 04/22] iommu: Add iommu_copy_struct_to_user helper
Message-ID: <aBCOTDDC8--age-V@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <ca032e90c0241fe0653023fcb655185dba763f5f.1745646960.git.nicolinc@nvidia.com>
 <aA-_5FQK0uZPdGVA@google.com>
 <aA/HN2CV+0UQ4S9j@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA/HN2CV+0UQ4S9j@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_013121_691330_0EC24000 
X-CRM114-Status: GOOD (  21.07  )
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

On Mon, Apr 28, 2025 at 11:21:43AM -0700, Nicolin Chen wrote:
> On Mon, Apr 28, 2025 at 05:50:28PM +0000, Pranjal Shrivastava wrote:
> > On Fri, Apr 25, 2025 at 10:57:59PM -0700, Nicolin Chen wrote:
> > > Similar to the iommu_copy_struct_from_user helper receiving data from the
> > > user space, add an iommu_copy_struct_to_user helper to report output data
> > > back to the user space data pointer.
> > > 
> > > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > > ---
> > >  include/linux/iommu.h | 40 ++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 40 insertions(+)
> > > 
> > > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > > index ba7add27e9a0..634ff647888d 100644
> > > --- a/include/linux/iommu.h
> > > +++ b/include/linux/iommu.h
> > > @@ -562,6 +562,46 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
> > >  	return 0;
> > >  }
> > >  
> > > +/**
> > > + * __iommu_copy_struct_to_user - Report iommu driver specific user space data
> > > + * @dst_data: Pointer to a struct iommu_user_data for user space data location
> > > + * @src_data: Pointer to an iommu driver specific user data that is defined in
> > > + *            include/uapi/linux/iommufd.h
> > > + * @data_type: The data type of the @dst_data. Must match with @src_data.type
> > 								   ^
> > Nit: Must match with @dst_data type.
> 
> Oh, that's a copy-n-paste mistake. It should be:
>   * @data_type: The data type of the @src_data. Must match with @dst_data.type

Ack, yes that's what I meant!

> 
> Thanks!
> Nicolin

Thanks,
Praan

