Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AC7C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgBpvBKNceadcIlK+jQ2H7nSb6VN21Y6ASF39ITBcCM=; b=Bl2Fd6yCswdLb/ycPkWWbvPREk
	5blas1hfP/3gK+h4CqqA7Q1VviJBZ2BJ/QbM6eefZM/2ym3hk3TkxbDdO3MK76/+5IqiNZ0bEGU2t
	aG7ACea5V/e1ybc9sqmeuTUWNWLTrZFjs96EW7JOQoQRs+8Mrc7iGAVZ31oYawR6GJ+0ogOFwVdfB
	82fysGeBAv+MaK47DZr8dUaDQOkQW+E7bI6zF7AzPuleOr90lZn1rmiI9H1SDNeJS8VidDpfH0nDD
	GdNNTXNLLv0spmgSR6GVB7D4g5C21FNlj8kZQtnhFqsYDnvAEr824I1QfsUkZqXz5VOnj9FLCYF+/
	GztUlz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqe1-0000000BoPf-0E2o;
	Thu, 10 Jul 2025 12:44:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpEa-0000000BbQj-0AfN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 11:14:37 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2357c61cda7so115725ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 04:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752146075; x=1752750875; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TgBpvBKNceadcIlK+jQ2H7nSb6VN21Y6ASF39ITBcCM=;
        b=eoYcbujQMLV4i85gjoPWMLQVlbFLsfv4UWZO5+Cyg0wvdOjZtYG0zZkjATWZnHo74+
         XZY8BhsP9ygrUWv7xzvhsdKhSXCz+zqC9M3Sh87vG053/plEAHLQDAqwo0noauY/IZzw
         UXpr3emCQt8SVUsCz8Tf556P4EQXRJ49Sibt2UmWBmx2+zHea6eNm1kdNJGV+QINVxuU
         lOFmNu2u3zVhqYMT1s4+pvulLwjHOYivtqlK1W9NWBUEiDJLMdWbgsNQhg7eNLAEln6k
         wYv7rqm/cdFrXXGOcSVVtczbmKBm71UQ82+R83UepBR+sEMhuBw9LSMt4BQrOFPsWRCO
         ZaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752146075; x=1752750875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgBpvBKNceadcIlK+jQ2H7nSb6VN21Y6ASF39ITBcCM=;
        b=WX4L93gJRAU3X1U4CeiaEW1kBztUvCarwwphbWq11tFd4ckjgZB/vSs8ajclIF7Zu0
         mTrM6hs6YGkQhHkDJIg0dp/cwZHK/XtdCmDfgYztWwarJyx9l3LgG6rLt81WSUPDmPxL
         V/oWqx0DwQD7FtjZRbP1aUe3+cAtl2+K41k/Ef4N7s2br31+9FUYaEdt0LuCMXVPKc3V
         njK65OTNBHVQVeasVb+lVf3hUOEdh5OZhU69XhsMO44lMnDXm1QZepCG9py/qzoDkAbV
         +JB8zLc8ypWctF+PLG4JM+viMtdLTcjf85Jwpp8i3uPxxYMtlzMr2MgkerAS38a6jkea
         rGdg==
X-Forwarded-Encrypted: i=1; AJvYcCV6Ufd+Pz7EveFJ/lXg2kl5oBxfHXTKQpSRRBQGNysXUcTRIxYk7nhbwNSI71pghwISQ840B46h+U8wdwvjmczi@lists.infradead.org
X-Gm-Message-State: AOJu0YwayKPyrNeIKQIzr3d/AxgjPLSTazvxgnEDoCEFqdggY4lLKI1t
	/oIYkaQo/Gp7s18BIUepX8j0a3VJizoK56NTtw0+SRkDPy16N+uBx157kJP3pxIJYA==
X-Gm-Gg: ASbGncsbu49lDkPFYKTSe0tb1e9B5rbtF7pEUfO1w3XRIz+oEt2swkLzhcJcXzvyOrU
	U68Ifd9MXIPow24QtPNVZaUhOjDhBR/C3iNM1qVJtApyHfJGAy0yyixWZsfb2q81B+GUDFrItYI
	qHwtNp14CAL6Aji8jVha78AI44uXACRtY3izxU/Aet4Cc1Zkxh0ufDIWMGCykCPmM3zaL877eKx
	cdtNwbYFLD9f0w3ax4uGxM0ABjyJFhu47voa2JGNWC1cN5qaIj2Df12RlBVb/2rlnJff9q7hlBY
	AlpBIp06zs6bo6jFqeU4biEVyBUiIHkMuX9JT3IKms+cSkJcMpLllO307fUVbg9qXinpPEuOC1t
	UY+YMlo0PrD8rLtN/xNHT
X-Google-Smtp-Source: AGHT+IFecBQHKG/ADcdq4eQ6HjOLMsTP4bdCQ53xMQ7WEkYQDG2G5iyvFIgwZFKNsIRqwMRxh8GaYQ==
X-Received: by 2002:a17:903:3b8e:b0:234:c37:85a with SMTP id d9443c01a7336-23de38106e0mr3159625ad.24.1752146074745;
        Thu, 10 Jul 2025 04:14:34 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4366698sm18961295ad.246.2025.07.10.04.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 04:14:34 -0700 (PDT)
Date: Thu, 10 Jul 2025 11:14:25 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net,
	bagasdotme@gmail.com, will@kernel.org, robin.murphy@arm.com,
	joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
	jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
	nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
	mshavit@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v9 18/29] iommufd/selftest: Add coverage for the new mmap
 interface
Message-ID: <aG-gkXOZExtzUGxe@google.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
 <b02b1220c955c3cf9ea5dd9fe9349ab1b4f8e20b.1752126748.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b02b1220c955c3cf9ea5dd9fe9349ab1b4f8e20b.1752126748.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_041436_084144_7433A789 
X-CRM114-Status: GOOD (  26.75  )
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

On Wed, Jul 09, 2025 at 10:59:10PM -0700, Nicolin Chen wrote:
> Extend the loopback test to a new mmap page.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> ---
>  drivers/iommu/iommufd/iommufd_test.h          |  4 +++
>  tools/testing/selftests/iommu/iommufd_utils.h |  4 +++
>  drivers/iommu/iommufd/selftest.c              | 33 ++++++++++++++++++-
>  tools/testing/selftests/iommu/iommufd.c       | 19 +++++++++++
>  4 files changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_test.h b/drivers/iommu/iommufd/iommufd_test.h
> index 51cd744a354f..8fc618b2bcf9 100644
> --- a/drivers/iommu/iommufd/iommufd_test.h
> +++ b/drivers/iommu/iommufd/iommufd_test.h
> @@ -232,12 +232,16 @@ struct iommu_hwpt_invalidate_selftest {
>   *                                (IOMMU_VIOMMU_TYPE_SELFTEST)
>   * @in_data: Input random data from user space
>   * @out_data: Output data (matching @in_data) to user space
> + * @out_mmap_offset: The offset argument for mmap syscall
> + * @out_mmap_length: The length argument for mmap syscall
>   *
>   * Simply set @out_data=@in_data for a loopback test
>   */
>  struct iommu_viommu_selftest {
>  	__u32 in_data;
>  	__u32 out_data;
> +	__aligned_u64 out_mmap_offset;
> +	__aligned_u64 out_mmap_length;
>  };
>  
>  /* Should not be equal to any defined value in enum iommu_viommu_invalidate_data_type */
> diff --git a/tools/testing/selftests/iommu/iommufd_utils.h b/tools/testing/selftests/iommu/iommufd_utils.h
> index 9a556f99d992..4a1b2bade018 100644
> --- a/tools/testing/selftests/iommu/iommufd_utils.h
> +++ b/tools/testing/selftests/iommu/iommufd_utils.h
> @@ -56,6 +56,10 @@ static unsigned long PAGE_SIZE;
>  #define offsetofend(TYPE, MEMBER) \
>  	(offsetof(TYPE, MEMBER) + sizeof_field(TYPE, MEMBER))
>  
> +#define test_err_mmap(_errno, length, offset)                                 \
> +	EXPECT_ERRNO(_errno, (long)mmap(NULL, length, PROT_READ | PROT_WRITE, \
> +					MAP_SHARED, self->fd, offset))
> +
>  static inline void *memfd_mmap(size_t length, int prot, int flags, int *mfd_p)
>  {
>  	int mfd_flags = (flags & MAP_HUGETLB) ? MFD_HUGETLB : 0;
> diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
> index 2189e9b119ee..8b2c44b32530 100644
> --- a/drivers/iommu/iommufd/selftest.c
> +++ b/drivers/iommu/iommufd/selftest.c
> @@ -152,6 +152,9 @@ struct mock_viommu {
>  	struct mock_iommu_domain *s2_parent;
>  	struct mock_hw_queue *hw_queue[IOMMU_TEST_HW_QUEUE_MAX];
>  	struct mutex queue_mutex;
> +
> +	unsigned long mmap_offset;
> +	u32 *page; /* Mmap page to test u32 type of in_data */
>  };
>  
>  static inline struct mock_viommu *to_mock_viommu(struct iommufd_viommu *viommu)
> @@ -689,6 +692,10 @@ static void mock_viommu_destroy(struct iommufd_viommu *viommu)
>  
>  	if (refcount_dec_and_test(&mock_iommu->users))
>  		complete(&mock_iommu->complete);
> +	if (mock_viommu->mmap_offset)
> +		iommufd_viommu_destroy_mmap(&mock_viommu->core,
> +					    mock_viommu->mmap_offset);
> +	free_page((unsigned long)mock_viommu->page);
>  	mutex_destroy(&mock_viommu->queue_mutex);
>  
>  	/* iommufd core frees mock_viommu and viommu */
> @@ -887,11 +894,28 @@ static int mock_viommu_init(struct iommufd_viommu *viommu,
>  		if (rc)
>  			return rc;
>  
> +		/* Allocate two pages */
> +		mock_viommu->page =
> +			(u32 *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 1);
> +		if (!mock_viommu->page)
> +			return -ENOMEM;
> +
> +		rc = iommufd_viommu_alloc_mmap(&mock_viommu->core,
> +					       __pa(mock_viommu->page),
> +					       PAGE_SIZE * 2,
> +					       &mock_viommu->mmap_offset);
> +		if (rc)
> +			goto err_free_page;
> +
> +		/* For loopback tests on both the page and out_data */
> +		*mock_viommu->page = data.in_data;
>  		data.out_data = data.in_data;
> +		data.out_mmap_length = PAGE_SIZE * 2;
> +		data.out_mmap_offset = mock_viommu->mmap_offset;
>  		rc = iommu_copy_struct_to_user(
>  			user_data, &data, IOMMU_VIOMMU_TYPE_SELFTEST, out_data);
>  		if (rc)
> -			return rc;
> +			goto err_destroy_mmap;
>  	}
>  
>  	refcount_inc(&mock_iommu->users);
> @@ -900,6 +924,13 @@ static int mock_viommu_init(struct iommufd_viommu *viommu,
>  
>  	viommu->ops = &mock_viommu_ops;
>  	return 0;
> +
> +err_destroy_mmap:
> +	iommufd_viommu_destroy_mmap(&mock_viommu->core,
> +				    mock_viommu->mmap_offset);
> +err_free_page:
> +	free_page((unsigned long)mock_viommu->page);
> +	return rc;
>  }
>  
>  static const struct iommu_ops mock_ops = {
> diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
> index 73426de77675..0b21c095ca5e 100644
> --- a/tools/testing/selftests/iommu/iommufd.c
> +++ b/tools/testing/selftests/iommu/iommufd.c
> @@ -2799,6 +2799,7 @@ TEST_F(iommufd_viommu, viommu_alloc_with_data)
>  	struct iommu_viommu_selftest data = {
>  		.in_data = 0xbeef,
>  	};
> +	uint32_t *test;
>  
>  	if (!self->device_id)
>  		SKIP(return, "Skipping test for variant no_viommu");
> @@ -2807,6 +2808,24 @@ TEST_F(iommufd_viommu, viommu_alloc_with_data)
>  			      IOMMU_VIOMMU_TYPE_SELFTEST, &data, sizeof(data),
>  			      &self->viommu_id);
>  	ASSERT_EQ(data.out_data, data.in_data);
> +
> +	/* Negative mmap tests -- offset and length cannot be changed */
> +	test_err_mmap(ENXIO, data.out_mmap_length,
> +		      data.out_mmap_offset + PAGE_SIZE);
> +	test_err_mmap(ENXIO, data.out_mmap_length,
> +		      data.out_mmap_offset + PAGE_SIZE * 2);
> +	test_err_mmap(ENXIO, data.out_mmap_length / 2, data.out_mmap_offset);
> +	test_err_mmap(ENXIO, data.out_mmap_length * 2, data.out_mmap_offset);
> +
> +	/* Now do a correct mmap for a loopback test */
> +	test = mmap(NULL, data.out_mmap_length, PROT_READ | PROT_WRITE,
> +		    MAP_SHARED, self->fd, data.out_mmap_offset);
> +	ASSERT_NE(MAP_FAILED, test);
> +	ASSERT_EQ(data.in_data, *test);
> +
> +	/* The owner of the mmap region should be blocked */
> +	EXPECT_ERRNO(EBUSY, _test_ioctl_destroy(self->fd, self->viommu_id));
> +	munmap(test, data.out_mmap_length);
>  }
>  
>  TEST_F(iommufd_viommu, vdevice_alloc)
> -- 
> 2.43.0
> 

