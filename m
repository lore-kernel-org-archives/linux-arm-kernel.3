Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7A3C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 17:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXoy6sxPPZ/z2WrCrnWnxSxhkK1XoAbzd892zSPGLLk=; b=BswNKpRxkz5Lo3s/XLV+LuHt1T
	r0EnIFTbII6TZwlLQoUmCp85PjSZLCO89hrFD0PhsuWWi9nKJQp+I4OkJdgOerSC2S7uO9s+KU5LJ
	FDnEr/aBYKOVOMmfZsHNn5zPsuwO4wHwdml2XOLsiO2KXXDZ8qq2Gks+WFirRw4qaZ9vhkFeJOptt
	odLilkZ8uXmjcRREQR1TDlBKhHRcVXDbknaTTl/0Ee6ue4meAZWjKiDfDPxYlh/AIDN1HKZ2oYB0z
	FlRvRRQMu0xGYP+0PUpZX2XOW8MFDY6e72dF8SAD/1xe2Ax78pgfv8A4CgFRr21LyDgT1sWyk2CxR
	/ed7+NzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SiD-000000079FS-3pkf;
	Mon, 28 Apr 2025 17:56:13 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Sek-000000078sY-0SjO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 17:52:39 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2264c9d0295so22945ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 10:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745862757; x=1746467557; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mXoy6sxPPZ/z2WrCrnWnxSxhkK1XoAbzd892zSPGLLk=;
        b=2uT24gS/tiJa7zTNcWIRcDCvFr5pdBbA3kksEskvABO2+iViUc9nRVMtBcwUqUbpTP
         U47imXOIwAqsbA6UeKA3DRPkIEYkve+A31iTC3mjg5cLK3FfZzaZ3yVhwSr7HNIf5L2V
         9Y/zxMo02IfbUYlf2gJspDIMIXa8PptW1D0Ro4+oy2s7rx+WtmThS7L0WwlUBi25W/vh
         gpfFGuhczoc59qFhrPaJCSxI5ErsIJBOQbxAxUs+HsRUjUpLSeTHD63Tj9d2Ug7rUhpC
         hrmO6SgUVKR39nnPI4cyEplFggn5ottup3tmhxtaJD0QqhitKP/MkWXwiJJzM9We/4fN
         AifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862757; x=1746467557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXoy6sxPPZ/z2WrCrnWnxSxhkK1XoAbzd892zSPGLLk=;
        b=SDBkusVAvD3Y+3Kq/+zdr2ErnVyTPxjwNoH8gzaBIdjZJ88slp7O5vPrVPXEGpDMN0
         KYzr5+vDPTtwawhXaE1T1APxlQoz2ByjMVPDddlF7TL0mYMqwrGWeq13vE9Grt9Tou19
         F621I46GPhxFuJOR32lv5NLY/URRfb6LJaUrUqp8epd1FBtjVFeEkHtg92U9duT22BI/
         4JXWEVEGsaoKifKxAoADkkOC7aiToicRjC9eG/TaN5RmOqK+hMuPg5fpgQoURwunzPOa
         l7xO2X+QQb1cPfYwXhYA7rmZERUEPL08uWx2gg+WZVG5WqHgejUfAghBpupEGZcx2OXx
         SutA==
X-Forwarded-Encrypted: i=1; AJvYcCXJu6IdyGhDCHxhPXoS0DYCYKKusuzdAFQ9hLVerNFazqrTS8jRCp3NKlEE5gOz+aBxHNXOpxLOGuTw74ovGpzg@lists.infradead.org
X-Gm-Message-State: AOJu0YynprV8w/MWfCV86/Nty6Tt4nZtheJOdLiFB4UZLjjqjLPt9Lbp
	1CDX0wW0icvL6MWyxexWrgLSnbZ8rMo5bnDb6Ags7GmA5OBgm2le1XoHRnHAIg==
X-Gm-Gg: ASbGncuEhbHEJKZY4rUTZAWXrkF0JZNRIgLaPBmEBEogphlZs03V24i+g4idpAcg9c/
	HrxccubdkWs5p4JXqwo0YgpSbhz/7afSPInhbixHgn2Z/D0ZWqo3+9L4aP4LkW0J/KB3OuUxQzA
	RDfwm6uqfs3XiOp3BaNZQ/L6V2neVLfI18u3BzLAWYzx/MmX7sISaVVcK2ek8QQEf2gBHhFpjoR
	tZ9Uxkd1pI/4NeuoMQs06Ee9pdo/xQ5jKj2a9yYi9Cbe47ox96E2dTMR7XwsfMjjkBVq2W+8QSt
	9pLboL4XpXw/wcX5MOBlsMW2ZYO7QylurV3pVz+PFAa/x3IgdgYZXZYAdVInYv+roHZMbkd1
X-Google-Smtp-Source: AGHT+IF7sSGBhp3GPgZs/6zIUASVzRs0/32vLn2f7+jmPw+exeJNlnbAKCbgqdOEVPuoFGNIT6O/Vw==
X-Received: by 2002:a17:903:1946:b0:216:7aaa:4c5f with SMTP id d9443c01a7336-22de6ebc2f6mr21395ad.3.1745862756998;
        Mon, 28 Apr 2025 10:52:36 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f77032f9sm7553154a12.15.2025.04.28.10.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:52:36 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:52:26 +0000
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
Subject: Re: [PATCH v2 03/22] iommufd/viommu: Allow driver-specific user data
 for a vIOMMU object
Message-ID: <aA_AWhJGFWwAzRUl@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7031ae5ab6f625e73dbd51b074c2ff8a9923c731.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7031ae5ab6f625e73dbd51b074c2ff8a9923c731.1745646960.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_105238_154902_352CEF3F 
X-CRM114-Status: GOOD (  21.85  )
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

On Fri, Apr 25, 2025 at 10:57:58PM -0700, Nicolin Chen wrote:
> The new type of vIOMMU for tegra241-cmdqv driver needs a driver-specific
> user data. So, add data_len/uptr to the iommu_viommu_alloc uAPI and pass
> it in via the viommu_alloc iommu op.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Acked-by: Pranjal Shrivastava <praan@google.com>

> ---
>  include/uapi/linux/iommufd.h   | 6 ++++++
>  drivers/iommu/iommufd/viommu.c | 8 +++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index f29b6c44655e..cc90299a08d9 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -965,6 +965,9 @@ enum iommu_viommu_type {
>   * @dev_id: The device's physical IOMMU will be used to back the virtual IOMMU
>   * @hwpt_id: ID of a nesting parent HWPT to associate to
>   * @out_viommu_id: Output virtual IOMMU ID for the allocated object
> + * @data_len: Length of the type specific data
> + * @__reserved: Must be 0
> + * @data_uptr: User pointer to an array of driver-specific virtual IOMMU data
>   *
>   * Allocate a virtual IOMMU object, representing the underlying physical IOMMU's
>   * virtualization support that is a security-isolated slice of the real IOMMU HW
> @@ -985,6 +988,9 @@ struct iommu_viommu_alloc {
>  	__u32 dev_id;
>  	__u32 hwpt_id;
>  	__u32 out_viommu_id;
> +	__u32 data_len;
> +	__u32 __reserved;
> +	__aligned_u64 data_uptr;
>  };
>  #define IOMMU_VIOMMU_ALLOC _IO(IOMMUFD_TYPE, IOMMUFD_CMD_VIOMMU_ALLOC)
>  
> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index fffa57063c60..a65153458a26 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -17,6 +17,11 @@ void iommufd_viommu_destroy(struct iommufd_object *obj)
>  int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  {
>  	struct iommu_viommu_alloc *cmd = ucmd->cmd;
> +	const struct iommu_user_data user_data = {
> +		.type = cmd->type,
> +		.uptr = u64_to_user_ptr(cmd->data_uptr),
> +		.len = cmd->data_len,
> +	};
>  	struct iommufd_hwpt_paging *hwpt_paging;
>  	struct iommufd_viommu *viommu;
>  	struct iommufd_device *idev;
> @@ -48,7 +53,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  	}
>  
>  	viommu = ops->viommu_alloc(idev->dev, hwpt_paging->common.domain,
> -				   ucmd->ictx, cmd->type, NULL);
> +				   ucmd->ictx, cmd->type,
> +				   user_data.len ? &user_data : NULL);
>  	if (IS_ERR(viommu)) {
>  		rc = PTR_ERR(viommu);
>  		goto out_put_hwpt;
> -- 
> 2.43.0
> 

