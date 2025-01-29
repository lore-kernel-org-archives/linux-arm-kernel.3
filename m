Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C97C02190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 13:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sf+DtGmrqdTwE2hubtPrHYXjgFDMJbqgNNnIu1aYodU=; b=N2Nu8yMnNpFZka
	kh7SeeUyapw89HUd9ZAlZMSpI0c5Rjlh04uCvRWxagSxI4H0OnuZ4KyWjROv4H318wevR+bSlqVpf
	Gb4jbYKMLHtukPkFDjmuT/sQHQJoQBvWigt2djisP6DlxiJAcvsYvNtSphGZlMeXEIFoS/2dlLM7p
	uZZP0HikC3WXa/eRBpL4srxJ0EZ46XoKtJmjT1j1FvbGxUDaWieFubr90SRyyecY30JGHZhRTMFWw
	76/nFw2dqLQ4Vm3R0g03PXkdwZBvTbKPCl95m/Z4RfjMKGzAeOkcEl5+t9GjHGjpcx7R3Wa216AY0
	1uIh04T1tuJtRnNzGAng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td8Nz-000000072X4-06ki;
	Wed, 29 Jan 2025 13:45:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td8Mg-000000072Py-2GTr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 13:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738158261;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sf+DtGmrqdTwE2hubtPrHYXjgFDMJbqgNNnIu1aYodU=;
	b=F5hhpXnawqB7JDJTKlAkraF4zN1rBoiucBAajLOYYZ6e2eBw8+veMPz8Xq0WHLAz7CidT6
	AboQJ/MwGLuGELSCiBYlBKzwqqjKxZhyvLa4YVd40ye0dhlsVoK0E2LSnFLFwJWZeWBuVV
	9thfV9+iW7aTCr+4qsjybbgfLoKM5Zg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-QFvE0RG-MPW2ADYk2WCJEQ-1; Wed, 29 Jan 2025 08:44:20 -0500
X-MC-Unique: QFvE0RG-MPW2ADYk2WCJEQ-1
X-Mimecast-MFC-AGG-ID: QFvE0RG-MPW2ADYk2WCJEQ
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7be6ccb09f9so664016085a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 05:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738158260; x=1738763060;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sf+DtGmrqdTwE2hubtPrHYXjgFDMJbqgNNnIu1aYodU=;
        b=mv4yB8D4bGClJyWV2hhLfpHMgi1Mz3GIpSUyYSWlmlQyQgkr7hMYl/Gmm0IEEwe7F5
         apRHI/O3c6fhdDLXA3pus9UwZmmOFnE30KuneS5R7MPYyFkk/xfNFxXSIGD2TxWq9SpE
         QFArtnJwQuThjRG1pda7+Pg/YFRhWjSqxc6gpX54ew7CwsutmsjDx+f6702rGG2Ajj0S
         uU9h9KNy9CdRW/y5bpmbOwLSS1fg586x3y/phMrYteUbN+zErigJYOtpFVabTj/ec7Lu
         ncKfulCGdUTr7nqgr78WCCVX5P7l9nfsXoKVN2mIlQ8i7r2pEy1eI85w/uPyEp97CB1k
         zatw==
X-Forwarded-Encrypted: i=1; AJvYcCWhLSnou0kYpEKBm2NuLSiRvEWJ7CC2usTG08a4GILUX4vrCbx4lyLFvaDFfj6szaKU9rcndlbzncor1sTKiGiJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy36ZUupCOd+UtYQCbvv1QGDfLueFRpqth2bEgYvQaRd3+QpMXc
	wthXB796obakpk9Xf18bv12FJa79g1nf5NS0E3YItoBNMtLcs/xVrpkAeNKkXCrf+QEOyw4ymSV
	ltXrNLvENVOOqR0xlQh6+O60Yy+Elf1mBWdfnYFjP++ivqqthTSFy+y81uzCfuc2KevIyovk7
X-Gm-Gg: ASbGncshCe09HhkOOFxL7fagAVimWsHT9FBJIOug5Q8LVgBzhTtUzrufQPTdBowMSCw
	G0jlGvDL26HmwbqpLRe7LxNHEcLOw76pGCRLSAF8AbezLoqiLRfqBwBjazp4p5UH5Zakehei7jt
	VhWfnxxNh6ceeZGe1C2PKt6OAsMrkzbtYwA5nTrG2coXUsbxh4QjCi8PS84exQwQ7h7OMHkMqFF
	Sg+ik81dqClZZiz2xaU9zNH3HeQHRzAcI4+D4slNmYx1/JmDdY4mTz2Qr83bRuqfA1vE7rY/K0j
	0ngXfD1Y6vewMom0C0JlqdVCCV0LF0eBDOxP4Bz4L4PWJZGGZ+gA
X-Received: by 2002:a05:620a:4387:b0:7b6:d910:5b31 with SMTP id af79cd13be357-7bffcd902b1mr487014885a.39.1738158259370;
        Wed, 29 Jan 2025 05:44:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfdRRfWiU/OFcr3Tb9Wnx23c3Oss13g014CVs37t9ZgKQ1ODWd2wjx8kgWWU1PdQbKyQMMZA==
X-Received: by 2002:a05:620a:4387:b0:7b6:d910:5b31 with SMTP id af79cd13be357-7bffcd902b1mr487009785a.39.1738158258956;
        Wed, 29 Jan 2025 05:44:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be9af03b3dsm619851385a.90.2025.01.29.05.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 05:44:18 -0800 (PST)
Message-ID: <0521187e-c511-4ab1-9ffa-be2be8eacd04@redhat.com>
Date: Wed, 29 Jan 2025 14:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 09/13] iommufd: Add IOMMU_OPTION_SW_MSI_START/SIZE
 ioctls
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, jgg@nvidia.com, kevin.tian@intel.com,
 tglx@linutronix.de, maz@kernel.org, alex.williamson@redhat.com
Cc: joro@8bytes.org, shuah@kernel.org, reinette.chatre@intel.com,
 yebin10@huawei.com, apatel@ventanamicro.com,
 shivamurthy.shastri@linutronix.de, bhelgaas@google.com,
 anna-maria@linutronix.de, yury.norov@gmail.com, nipun.gupta@amd.com,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
 jean-philippe@linaro.org, mdf@kernel.org, mshavit@google.com,
 shameerali.kolothum.thodi@huawei.com, smostafa@google.com, ddutile@redhat.com
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <d3cb1694e07be0e214dc44dcb2cb74f014606560.1736550979.git.nicolinc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <d3cb1694e07be0e214dc44dcb2cb74f014606560.1736550979.git.nicolinc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i0eL7DDg_ABsLfyBr5U4kUn2Y55P2r-IvDHTsSyu4kU_1738158260
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_054422_666442_6B8E6EA7 
X-CRM114-Status: GOOD (  37.85  )
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
Reply-To: eric.auger@redhat.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,


On 1/11/25 4:32 AM, Nicolin Chen wrote:
> For systems that require MSI pages to be mapped into the IOMMU translation
> the IOMMU driver provides an IOMMU_RESV_SW_MSI range, which is the default
> recommended IOVA window to place these mappings. However, there is nothing
> special about this address. And to support the RMR trick in VMM for nested
well at least it shall not overlap VMM's RAM. So it was not random either.
> translation, the VMM needs to know what sw_msi window the kernel is using.
> As there is no particular reason to force VMM to adopt the kernel default,
> provide a simple IOMMU_OPTION_SW_MSI_START/SIZE ioctl that the VMM can use
> to directly specify the sw_msi window that it wants to use, which replaces
> and disables the default IOMMU_RESV_SW_MSI from the driver to avoid having
> to build an API to discover the default IOMMU_RESV_SW_MSI.
IIUC the MSI window will then be different when using legacy VFIO
assignment and iommufd backend.
MSI reserved regions are exposed in
/sys/kernel/iommu_groups/<n>/reserved_regions
0x0000000008000000 0x00000000080fffff msi

Is that configurability reflected accordingly?

How do you make sure it does not collide with other resv regions? I
don't see any check here.

>
> Since iommufd now has its own sw_msi function, this is easy to implement.
>
> To keep things simple, the parameters are global to the entire iommufd FD,
> and will directly replace the IOMMU_RESV_SW_MSI values. The VMM must set
> the values before creating any hwpt's to have any effect.
>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h |  4 +++
>  include/uapi/linux/iommufd.h            | 18 ++++++++++++-
>  drivers/iommu/iommufd/device.c          |  4 +++
>  drivers/iommu/iommufd/io_pagetable.c    |  4 ++-
>  drivers/iommu/iommufd/ioas.c            | 34 +++++++++++++++++++++++++
>  drivers/iommu/iommufd/main.c            |  6 +++++
>  6 files changed, 68 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 3e83bbb5912c..9f071609f00b 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -45,6 +45,9 @@ struct iommufd_ctx {
>  	struct mutex sw_msi_lock;
>  	struct list_head sw_msi_list;
>  	unsigned int sw_msi_id;
> +	/* User-programmed SW_MSI region, to override igroup->sw_msi_start */
> +	phys_addr_t sw_msi_start;
> +	size_t sw_msi_size;
>  
>  	u8 account_mode;
>  	/* Compatibility with VFIO no iommu */
> @@ -281,6 +284,7 @@ int iommufd_ioas_unmap(struct iommufd_ucmd *ucmd);
>  int iommufd_ioas_option(struct iommufd_ucmd *ucmd);
>  int iommufd_option_rlimit_mode(struct iommu_option *cmd,
>  			       struct iommufd_ctx *ictx);
> +int iommufd_option_sw_msi(struct iommu_option *cmd, struct iommufd_ctx *ictx);
>  
>  int iommufd_vfio_ioas(struct iommufd_ucmd *ucmd);
>  int iommufd_check_iova_range(struct io_pagetable *iopt,
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 34810f6ae2b5..c864a201e502 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -294,7 +294,9 @@ struct iommu_ioas_unmap {
>  
>  /**
>   * enum iommufd_option - ioctl(IOMMU_OPTION_RLIMIT_MODE) and
> - *                       ioctl(IOMMU_OPTION_HUGE_PAGES)
> + *                       ioctl(IOMMU_OPTION_HUGE_PAGES) and
> + *                       ioctl(IOMMU_OPTION_SW_MSI_START) and
> + *                       ioctl(IOMMU_OPTION_SW_MSI_SIZE)
>   * @IOMMU_OPTION_RLIMIT_MODE:
>   *    Change how RLIMIT_MEMLOCK accounting works. The caller must have privilege
>   *    to invoke this. Value 0 (default) is user based accounting, 1 uses process
> @@ -304,10 +306,24 @@ struct iommu_ioas_unmap {
>   *    iommu mappings. Value 0 disables combining, everything is mapped to
>   *    PAGE_SIZE. This can be useful for benchmarking.  This is a per-IOAS
>   *    option, the object_id must be the IOAS ID.
> + * @IOMMU_OPTION_SW_MSI_START:
> + *    Change the base address of the IOMMU mapping region for MSI doorbell(s).
> + *    It must be set this before attaching a device to an IOAS/HWPT, otherwise
> + *    this option will be not effective on that IOAS/HWPT. User can choose to
> + *    let kernel pick a base address, by simply ignoring this option or setting
> + *    a value 0 to IOMMU_OPTION_SW_MSI_SIZE. Global option, object_id must be 0
I think we should document it cannot be put at a random place either.
> + * @IOMMU_OPTION_SW_MSI_SIZE:
> + *    Change the size of the IOMMU mapping region for MSI doorbell(s). It must
> + *    be set this before attaching a device to an IOAS/HWPT, otherwise it won't
> + *    be effective on that IOAS/HWPT. The value is in MB, and the minimum value
> + *    is 1 MB. A value 0 (default) will invalidate the MSI doorbell base address
> + *    value set to IOMMU_OPTION_SW_MSI_START. Global option, object_id must be 0
>   */
>  enum iommufd_option {
>  	IOMMU_OPTION_RLIMIT_MODE = 0,
>  	IOMMU_OPTION_HUGE_PAGES = 1,
> +	IOMMU_OPTION_SW_MSI_START = 2,
> +	IOMMU_OPTION_SW_MSI_SIZE = 3,
>  };
>  
>  /**
> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> index f75b3c23cd41..093a3bd798db 100644
> --- a/drivers/iommu/iommufd/device.c
> +++ b/drivers/iommu/iommufd/device.c
> @@ -445,10 +445,14 @@ static int
>  iommufd_device_attach_reserved_iova(struct iommufd_device *idev,
>  				    struct iommufd_hwpt_paging *hwpt_paging)
>  {
> +	struct iommufd_ctx *ictx = idev->ictx;
>  	int rc;
>  
>  	lockdep_assert_held(&idev->igroup->lock);
>  
> +	/* Override it with a user-programmed SW_MSI region */
> +	if (ictx->sw_msi_size && ictx->sw_msi_start != PHYS_ADDR_MAX)
> +		idev->igroup->sw_msi_start = ictx->sw_msi_start;
>  	rc = iopt_table_enforce_dev_resv_regions(&hwpt_paging->ioas->iopt,
>  						 idev->dev,
>  						 &idev->igroup->sw_msi_start);
> diff --git a/drivers/iommu/iommufd/io_pagetable.c b/drivers/iommu/iommufd/io_pagetable.c
> index 8a790e597e12..5d7f5ca1eecf 100644
> --- a/drivers/iommu/iommufd/io_pagetable.c
> +++ b/drivers/iommu/iommufd/io_pagetable.c
> @@ -1446,7 +1446,9 @@ int iopt_table_enforce_dev_resv_regions(struct io_pagetable *iopt,
>  		if (sw_msi_start && resv->type == IOMMU_RESV_MSI)
>  			num_hw_msi++;
>  		if (sw_msi_start && resv->type == IOMMU_RESV_SW_MSI) {
> -			*sw_msi_start = resv->start;
> +			/* Bypass the driver-defined SW_MSI region, if preset */
> +			if (*sw_msi_start == PHYS_ADDR_MAX)
> +				*sw_msi_start = resv->start;
>  			num_sw_msi++;
>  		}
>  
> diff --git a/drivers/iommu/iommufd/ioas.c b/drivers/iommu/iommufd/ioas.c
> index 1542c5fd10a8..3f4e25b660f9 100644
> --- a/drivers/iommu/iommufd/ioas.c
> +++ b/drivers/iommu/iommufd/ioas.c
> @@ -620,6 +620,40 @@ int iommufd_option_rlimit_mode(struct iommu_option *cmd,
>  	return -EOPNOTSUPP;
>  }
>  
> +int iommufd_option_sw_msi(struct iommu_option *cmd, struct iommufd_ctx *ictx)
> +{
> +	if (cmd->object_id)
> +		return -EOPNOTSUPP;
> +
> +	if (cmd->op == IOMMU_OPTION_OP_GET) {
> +		switch (cmd->option_id) {
> +		case IOMMU_OPTION_SW_MSI_START:
> +			cmd->val64 = (u64)ictx->sw_msi_start;
> +			break;
> +		case IOMMU_OPTION_SW_MSI_SIZE:
> +			cmd->val64 = (u64)ictx->sw_msi_size;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		return 0;
> +	}
> +	if (cmd->op == IOMMU_OPTION_OP_SET) {
> +		switch (cmd->option_id) {
> +		case IOMMU_OPTION_SW_MSI_START:
> +			ictx->sw_msi_start = (phys_addr_t)cmd->val64;
> +			break;
> +		case IOMMU_OPTION_SW_MSI_SIZE:
> +			ictx->sw_msi_size = (size_t)cmd->val64;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		return 0;
> +	}
> +	return -EOPNOTSUPP;
> +}
> +
>  static int iommufd_ioas_option_huge_pages(struct iommu_option *cmd,
>  					  struct iommufd_ioas *ioas)
>  {
> diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
> index 7cc9497b7193..026297265c71 100644
> --- a/drivers/iommu/iommufd/main.c
> +++ b/drivers/iommu/iommufd/main.c
> @@ -229,6 +229,8 @@ static int iommufd_fops_open(struct inode *inode, struct file *filp)
>  	init_waitqueue_head(&ictx->destroy_wait);
>  	mutex_init(&ictx->sw_msi_lock);
>  	INIT_LIST_HEAD(&ictx->sw_msi_list);
> +	ictx->sw_msi_start = PHYS_ADDR_MAX;
> +	ictx->sw_msi_size = 0;
>  	filp->private_data = ictx;
>  	return 0;
>  }
> @@ -287,6 +289,10 @@ static int iommufd_option(struct iommufd_ucmd *ucmd)
>  	case IOMMU_OPTION_RLIMIT_MODE:
>  		rc = iommufd_option_rlimit_mode(cmd, ucmd->ictx);
>  		break;
> +	case IOMMU_OPTION_SW_MSI_START:
> +	case IOMMU_OPTION_SW_MSI_SIZE:
> +		rc = iommufd_option_sw_msi(cmd, ucmd->ictx);
> +		break;
>  	case IOMMU_OPTION_HUGE_PAGES:
>  		rc = iommufd_ioas_option(ucmd);
>  		break;
Eric


