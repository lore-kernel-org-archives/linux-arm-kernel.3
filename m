Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4623C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NllAQfNayY8cb5iLzosXwdI782jVJrwH9mu2C3D5sw0=; b=FBfNuLegcFcOPU49t1hc3tBfKr
	2MF8gAbB9QL8T9H2MsYZd8gkKpO6vik5JFc70T5gPvx9t4LDXYwpOiaLqlzb+55fol/1fkK2TAXW/
	nXSXmGBKVz6JaAx9/mKu2reb0CSK/v5CZ42eKUahxAdSuiQTlzfvZpLQ6Rc2LgIgCcf+uPSpU5z5m
	ZsrgnzV+YyMyeLPkc1US5LhBT/bOEA8JKBUhT2u0N+Eip6TpYjZ8hdatV09S3Btzt0xRME1IUh2HF
	dco451ZGCg07XsecWPEjo5t5V2/7iPqoafvWBCHObvDLSbUDQOYDPJNdL2TVvcGcWh5eAPFPf3hqt
	3jMy9VKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZr78-0000000BteT-2EVz;
	Thu, 10 Jul 2025 13:15:02 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpZh-0000000BeZP-1Qlo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 11:36:27 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-237f18108d2so171505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 04:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752147384; x=1752752184; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NllAQfNayY8cb5iLzosXwdI782jVJrwH9mu2C3D5sw0=;
        b=p1Wmg/hCBhz5jye+8Jg9wYJLWcM+9QLe+Ty5E+enR1FAoNtFAr4k9nNVOBfAh1cCal
         5XDafdx+62Uxf/WW+S9DsjADM/8ljF4w4lOQ/DQqeMZirCxrA69DKN1SDjSs4z+zi75l
         bLL2x0AeesrDrQhl3Zqz950Qza/ZR4Vwvjmmx8mo3K/4zSHpR/ljsJQAv54cTKRInF/l
         TqpZ3lrX4RNZvZdw9JI/wXu2a4M83KWPq6nE2NdkFJAxgNLjbs1IOTFzlHFIjgCzFTgG
         w2RIA36VD59qPSP1UhvhOKs7VZ8ZScIa9T3y9MS+vns9ls+73PDf/QPBULBe+0VOxEJx
         EC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752147384; x=1752752184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NllAQfNayY8cb5iLzosXwdI782jVJrwH9mu2C3D5sw0=;
        b=wREXnyE41STPQQqX4LV/4AVyXj7Oard/sUKLLWeBrhKFVVNMkLgH2wsM4mGYtoQOMk
         M6uc0TGjZDBbh2GvSBzTBSwX70gcmkMLjiAqDYyAIN43NcAHNQ9umzWFMNHYiIvY5hT0
         Hg1fcScuTIcseEAEIVpmrmHZMVM/clRsuD3psc7uHUqaiTgBdkXMtE2fqUQz0wM81HtE
         0TrzMx9auTWbUYw8GY5qCTjOWQRe1rfrBzCQhpx85b5pRIpr/NLqE1JcRSpvFHFe+T0P
         IdE4IZ9arvnWm7xFA2rNqPKxTo/9Pm6DQPSFKB50Z+AUlCWUkJyhLVOtDGXjK0HIjJWm
         ARYw==
X-Forwarded-Encrypted: i=1; AJvYcCWzrlBtd7i4dforwjQrSipaVVJF+UuMvTPxXoF/2pnuQXEvnS7EA2167jjhaTy/Cc+wsDnxPMs+bTzgnptxtK2U@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8NFxQxyF33O9Uy+dXxc5Pa/j2vUK+xjv1S3kYVKfAZsrb5S7u
	F8WAPxFL140pW/el4L/1Ld1veEuahaKEkZqCBvkRudKM5Q5KgIBchZh1cErjmpz+Lw==
X-Gm-Gg: ASbGncuojeWH/KVEurcZZTJiwauPClgROiXTYgEoZ+4EwGN30Hs5Azs2CjPsAGuxLt5
	QQREESeNbs52b/M8IAxFEE6zT6hf9skJXHphatDtgoCZKLjgqANtjcPGaKA+u79cAasm+VwAmQq
	wAYUqVuRh6engen2vBUuzUs+vHv7woNteKDn8QvjEKtdc/dT0zTcPNiPl6F6AMPocMd2P8PKgvT
	FvqUohjrMP1kLZG5A1bCOIrZJ5y4Su219GlnZTaRaW4YeymmMdY1Htm76wkJEPeRkCDTpmWzOuD
	CfIrlb7CsGfUDMrMsI/pYJUFZbSzmJPusE+MnhWHmSkM9Ar5Wsh36zQkmPYNK7F2QjZQILRY25P
	k85k39clRNAX8BDcvodea
X-Google-Smtp-Source: AGHT+IFWWBrqFVRqrzk0Fwyab1Mld4BviLi8cbgIh+j6R1xSHmEyatBRaGWIq1+8HV4NnwrugSgVcw==
X-Received: by 2002:a17:903:3ba5:b0:215:9ab0:402 with SMTP id d9443c01a7336-23de38137a5mr2696735ad.18.1752147384158;
        Thu, 10 Jul 2025 04:36:24 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e07793sm1937009b3a.69.2025.07.10.04.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 04:36:23 -0700 (PDT)
Date: Thu, 10 Jul 2025 11:36:15 +0000
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
Subject: Re: [PATCH v9 16/29] iommufd/selftest: Add coverage for
 IOMMUFD_CMD_HW_QUEUE_ALLOC
Message-ID: <aG-lr9nUhwff4GuJ@google.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
 <e8a194d187d7ef445f43e4a3c04fb39472050afd.1752126748.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8a194d187d7ef445f43e4a3c04fb39472050afd.1752126748.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_043625_382508_22FA80CB 
X-CRM114-Status: GOOD (  29.90  )
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

On Wed, Jul 09, 2025 at 10:59:08PM -0700, Nicolin Chen wrote:
> Some simple tests for IOMMUFD_CMD_HW_QUEUE_ALLOC infrastructure covering
> the new iommufd_hw_queue_depend/undepend() helpers.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> ---
>  drivers/iommu/iommufd/iommufd_test.h          |  3 +
>  tools/testing/selftests/iommu/iommufd_utils.h | 31 ++++++
>  drivers/iommu/iommufd/selftest.c              | 97 +++++++++++++++++++
>  tools/testing/selftests/iommu/iommufd.c       | 59 +++++++++++
>  .../selftests/iommu/iommufd_fail_nth.c        |  6 ++
>  5 files changed, 196 insertions(+)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_test.h b/drivers/iommu/iommufd/iommufd_test.h
> index fbf9ecb35a13..51cd744a354f 100644
> --- a/drivers/iommu/iommufd/iommufd_test.h
> +++ b/drivers/iommu/iommufd/iommufd_test.h
> @@ -265,4 +265,7 @@ struct iommu_viommu_event_selftest {
>  	__u32 virt_id;
>  };
>  
> +#define IOMMU_HW_QUEUE_TYPE_SELFTEST 0xdeadbeef
> +#define IOMMU_TEST_HW_QUEUE_MAX 2
> +
>  #endif
> diff --git a/tools/testing/selftests/iommu/iommufd_utils.h b/tools/testing/selftests/iommu/iommufd_utils.h
> index a5d4cbd089ba..9a556f99d992 100644
> --- a/tools/testing/selftests/iommu/iommufd_utils.h
> +++ b/tools/testing/selftests/iommu/iommufd_utils.h
> @@ -956,6 +956,37 @@ static int _test_cmd_vdevice_alloc(int fd, __u32 viommu_id, __u32 idev_id,
>  		     _test_cmd_vdevice_alloc(self->fd, viommu_id, idev_id,   \
>  					     virt_id, vdev_id))
>  
> +static int _test_cmd_hw_queue_alloc(int fd, __u32 viommu_id, __u32 type,
> +				    __u32 idx, __u64 base_addr, __u64 length,
> +				    __u32 *hw_queue_id)
> +{
> +	struct iommu_hw_queue_alloc cmd = {
> +		.size = sizeof(cmd),
> +		.viommu_id = viommu_id,
> +		.type = type,
> +		.index = idx,
> +		.nesting_parent_iova = base_addr,
> +		.length = length,
> +	};
> +	int ret;
> +
> +	ret = ioctl(fd, IOMMU_HW_QUEUE_ALLOC, &cmd);
> +	if (ret)
> +		return ret;
> +	if (hw_queue_id)
> +		*hw_queue_id = cmd.out_hw_queue_id;
> +	return 0;
> +}
> +
> +#define test_cmd_hw_queue_alloc(viommu_id, type, idx, base_addr, len, out_qid) \
> +	ASSERT_EQ(0, _test_cmd_hw_queue_alloc(self->fd, viommu_id, type, idx,  \
> +					      base_addr, len, out_qid))
> +#define test_err_hw_queue_alloc(_errno, viommu_id, type, idx, base_addr, len, \
> +				out_qid)                                      \
> +	EXPECT_ERRNO(_errno,                                                  \
> +		     _test_cmd_hw_queue_alloc(self->fd, viommu_id, type, idx, \
> +					      base_addr, len, out_qid))
> +
>  static int _test_cmd_veventq_alloc(int fd, __u32 viommu_id, __u32 type,
>  				   __u32 *veventq_id, __u32 *veventq_fd)
>  {
> diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
> index 38066dfeb2e7..2189e9b119ee 100644
> --- a/drivers/iommu/iommufd/selftest.c
> +++ b/drivers/iommu/iommufd/selftest.c
> @@ -150,6 +150,8 @@ to_mock_nested(struct iommu_domain *domain)
>  struct mock_viommu {
>  	struct iommufd_viommu core;
>  	struct mock_iommu_domain *s2_parent;
> +	struct mock_hw_queue *hw_queue[IOMMU_TEST_HW_QUEUE_MAX];
> +	struct mutex queue_mutex;
>  };
>  
>  static inline struct mock_viommu *to_mock_viommu(struct iommufd_viommu *viommu)
> @@ -157,6 +159,19 @@ static inline struct mock_viommu *to_mock_viommu(struct iommufd_viommu *viommu)
>  	return container_of(viommu, struct mock_viommu, core);
>  }
>  
> +struct mock_hw_queue {
> +	struct iommufd_hw_queue core;
> +	struct mock_viommu *mock_viommu;
> +	struct mock_hw_queue *prev;
> +	u16 index;
> +};
> +
> +static inline struct mock_hw_queue *
> +to_mock_hw_queue(struct iommufd_hw_queue *hw_queue)
> +{
> +	return container_of(hw_queue, struct mock_hw_queue, core);
> +}
> +
>  enum selftest_obj_type {
>  	TYPE_IDEV,
>  };
> @@ -670,9 +685,11 @@ static void mock_viommu_destroy(struct iommufd_viommu *viommu)
>  {
>  	struct mock_iommu_device *mock_iommu = container_of(
>  		viommu->iommu_dev, struct mock_iommu_device, iommu_dev);
> +	struct mock_viommu *mock_viommu = to_mock_viommu(viommu);
>  
>  	if (refcount_dec_and_test(&mock_iommu->users))
>  		complete(&mock_iommu->complete);
> +	mutex_destroy(&mock_viommu->queue_mutex);
>  
>  	/* iommufd core frees mock_viommu and viommu */
>  }
> @@ -764,10 +781,86 @@ static int mock_viommu_cache_invalidate(struct iommufd_viommu *viommu,
>  	return rc;
>  }
>  
> +static size_t mock_viommu_get_hw_queue_size(struct iommufd_viommu *viommu,
> +					    enum iommu_hw_queue_type queue_type)
> +{
> +	if (queue_type != IOMMU_HW_QUEUE_TYPE_SELFTEST)
> +		return 0;
> +	return HW_QUEUE_STRUCT_SIZE(struct mock_hw_queue, core);
> +}
> +
> +static void mock_hw_queue_destroy(struct iommufd_hw_queue *hw_queue)
> +{
> +	struct mock_hw_queue *mock_hw_queue = to_mock_hw_queue(hw_queue);
> +	struct mock_viommu *mock_viommu = mock_hw_queue->mock_viommu;
> +
> +	mutex_lock(&mock_viommu->queue_mutex);
> +	mock_viommu->hw_queue[mock_hw_queue->index] = NULL;
> +	if (mock_hw_queue->prev)
> +		iommufd_hw_queue_undepend(mock_hw_queue, mock_hw_queue->prev,
> +					  core);
> +	mutex_unlock(&mock_viommu->queue_mutex);
> +}
> +
> +/* Test iommufd_hw_queue_depend/undepend() */
> +static int mock_hw_queue_init_phys(struct iommufd_hw_queue *hw_queue, u32 index,
> +				   phys_addr_t base_addr_pa)
> +{
> +	struct mock_viommu *mock_viommu = to_mock_viommu(hw_queue->viommu);
> +	struct mock_hw_queue *mock_hw_queue = to_mock_hw_queue(hw_queue);
> +	struct mock_hw_queue *prev = NULL;
> +	int rc = 0;
> +
> +	if (index >= IOMMU_TEST_HW_QUEUE_MAX)
> +		return -EINVAL;
> +
> +	mutex_lock(&mock_viommu->queue_mutex);
> +
> +	if (mock_viommu->hw_queue[index]) {
> +		rc = -EEXIST;
> +		goto unlock;
> +	}
> +
> +	if (index) {
> +		prev = mock_viommu->hw_queue[index - 1];
> +		if (!prev) {
> +			rc = -EIO;
> +			goto unlock;
> +		}
> +	}
> +
> +	/*
> +	 * Test to catch a kernel bug if the core converted the physical address
> +	 * incorrectly. Let mock_domain_iova_to_phys() WARN_ON if it fails.
> +	 */
> +	if (base_addr_pa != iommu_iova_to_phys(&mock_viommu->s2_parent->domain,
> +					       hw_queue->base_addr)) {
> +		rc = -EFAULT;
> +		goto unlock;
> +	}
> +
> +	if (prev) {
> +		rc = iommufd_hw_queue_depend(mock_hw_queue, prev, core);
> +		if (rc)
> +			goto unlock;
> +	}
> +
> +	mock_hw_queue->prev = prev;
> +	mock_hw_queue->mock_viommu = mock_viommu;
> +	mock_viommu->hw_queue[index] = mock_hw_queue;
> +
> +	hw_queue->destroy = &mock_hw_queue_destroy;
> +unlock:
> +	mutex_unlock(&mock_viommu->queue_mutex);
> +	return rc;
> +}
> +
>  static struct iommufd_viommu_ops mock_viommu_ops = {
>  	.destroy = mock_viommu_destroy,
>  	.alloc_domain_nested = mock_viommu_alloc_domain_nested,
>  	.cache_invalidate = mock_viommu_cache_invalidate,
> +	.get_hw_queue_size = mock_viommu_get_hw_queue_size,
> +	.hw_queue_init_phys = mock_hw_queue_init_phys,
>  };
>  
>  static size_t mock_get_viommu_size(struct device *dev,
> @@ -784,6 +877,7 @@ static int mock_viommu_init(struct iommufd_viommu *viommu,
>  {
>  	struct mock_iommu_device *mock_iommu = container_of(
>  		viommu->iommu_dev, struct mock_iommu_device, iommu_dev);
> +	struct mock_viommu *mock_viommu = to_mock_viommu(viommu);
>  	struct iommu_viommu_selftest data;
>  	int rc;
>  
> @@ -801,6 +895,9 @@ static int mock_viommu_init(struct iommufd_viommu *viommu,
>  	}
>  
>  	refcount_inc(&mock_iommu->users);
> +	mutex_init(&mock_viommu->queue_mutex);
> +	mock_viommu->s2_parent = to_mock_domain(parent_domain);
> +
>  	viommu->ops = &mock_viommu_ops;
>  	return 0;
>  }
> diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
> index a9dfcce5e1b2..73426de77675 100644
> --- a/tools/testing/selftests/iommu/iommufd.c
> +++ b/tools/testing/selftests/iommu/iommufd.c
> @@ -3032,6 +3032,65 @@ TEST_F(iommufd_viommu, vdevice_cache)
>  	}
>  }
>  
> +TEST_F(iommufd_viommu, hw_queue)
> +{
> +	__u64 iova = MOCK_APERTURE_START, iova2;
> +	uint32_t viommu_id = self->viommu_id;
> +	uint32_t hw_queue_id[2];
> +
> +	if (!viommu_id)
> +		SKIP(return, "Skipping test for variant no_viommu");
> +
> +	/* Fail IOMMU_HW_QUEUE_TYPE_DEFAULT */
> +	test_err_hw_queue_alloc(EOPNOTSUPP, viommu_id,
> +				IOMMU_HW_QUEUE_TYPE_DEFAULT, 0, iova, PAGE_SIZE,
> +				&hw_queue_id[0]);
> +	/* Fail queue addr and length */
> +	test_err_hw_queue_alloc(EINVAL, viommu_id, IOMMU_HW_QUEUE_TYPE_SELFTEST,
> +				0, iova, 0, &hw_queue_id[0]);
> +	test_err_hw_queue_alloc(EOVERFLOW, viommu_id,
> +				IOMMU_HW_QUEUE_TYPE_SELFTEST, 0, ~(uint64_t)0,
> +				PAGE_SIZE, &hw_queue_id[0]);
> +	/* Fail missing iova */
> +	test_err_hw_queue_alloc(ENOENT, viommu_id, IOMMU_HW_QUEUE_TYPE_SELFTEST,
> +				0, iova, PAGE_SIZE, &hw_queue_id[0]);
> +
> +	/* Map iova */
> +	test_ioctl_ioas_map(buffer, PAGE_SIZE, &iova);
> +	test_ioctl_ioas_map(buffer + PAGE_SIZE, PAGE_SIZE, &iova2);
> +
> +	/* Fail index=1 and =MAX; must start from index=0 */
> +	test_err_hw_queue_alloc(EIO, viommu_id, IOMMU_HW_QUEUE_TYPE_SELFTEST, 1,
> +				iova, PAGE_SIZE, &hw_queue_id[0]);
> +	test_err_hw_queue_alloc(EINVAL, viommu_id, IOMMU_HW_QUEUE_TYPE_SELFTEST,
> +				IOMMU_TEST_HW_QUEUE_MAX, iova, PAGE_SIZE,
> +				&hw_queue_id[0]);
> +
> +	/* Allocate index=0, declare ownership of the iova */
> +	test_cmd_hw_queue_alloc(viommu_id, IOMMU_HW_QUEUE_TYPE_SELFTEST, 0,
> +				iova, PAGE_SIZE, &hw_queue_id[0]);
> +	/* Fail duplicated index */
> +	test_err_hw_queue_alloc(EEXIST, viommu_id, IOMMU_HW_QUEUE_TYPE_SELFTEST,
> +				0, iova, PAGE_SIZE, &hw_queue_id[0]);
> +	/* Fail unmap, due to iova ownership */
> +	test_err_ioctl_ioas_unmap(EBUSY, iova, PAGE_SIZE);
> +	/* The 2nd page is not pinned, so it can be unmmap */
> +	test_ioctl_ioas_unmap(iova2, PAGE_SIZE);
> +
> +	/* Allocate index=1, with an unaligned case */
> +	test_cmd_hw_queue_alloc(viommu_id, IOMMU_HW_QUEUE_TYPE_SELFTEST, 1,
> +				iova + PAGE_SIZE / 2, PAGE_SIZE / 2,
> +				&hw_queue_id[1]);
> +	/* Fail to destroy, due to dependency */
> +	EXPECT_ERRNO(EBUSY, _test_ioctl_destroy(self->fd, hw_queue_id[0]));
> +
> +	/* Destroy in descending order */
> +	test_ioctl_destroy(hw_queue_id[1]);
> +	test_ioctl_destroy(hw_queue_id[0]);
> +	/* Now it can unmap the first page */
> +	test_ioctl_ioas_unmap(iova, PAGE_SIZE);
> +}
> +
>  FIXTURE(iommufd_device_pasid)
>  {
>  	int fd;
> diff --git a/tools/testing/selftests/iommu/iommufd_fail_nth.c b/tools/testing/selftests/iommu/iommufd_fail_nth.c
> index f7ccf1822108..41c685bbd252 100644
> --- a/tools/testing/selftests/iommu/iommufd_fail_nth.c
> +++ b/tools/testing/selftests/iommu/iommufd_fail_nth.c
> @@ -634,6 +634,7 @@ TEST_FAIL_NTH(basic_fail_nth, device)
>  	uint32_t idev_id;
>  	uint32_t hwpt_id;
>  	uint32_t viommu_id;
> +	uint32_t hw_queue_id;
>  	uint32_t vdev_id;
>  	__u64 iova;
>  
> @@ -696,6 +697,11 @@ TEST_FAIL_NTH(basic_fail_nth, device)
>  	if (_test_cmd_vdevice_alloc(self->fd, viommu_id, idev_id, 0, &vdev_id))
>  		return -1;
>  
> +	if (_test_cmd_hw_queue_alloc(self->fd, viommu_id,
> +				     IOMMU_HW_QUEUE_TYPE_SELFTEST, 0, iova,
> +				     PAGE_SIZE, &hw_queue_id))
> +		return -1;
> +
>  	if (_test_ioctl_fault_alloc(self->fd, &fault_id, &fault_fd))
>  		return -1;
>  	close(fault_fd);
> -- 
> 2.43.0
> 

