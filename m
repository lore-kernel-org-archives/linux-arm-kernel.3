Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DD6C7EE24
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaC15VNy2W6fdEhbxclQpnkYOQSK9bnjumzMUXgIe2M=; b=NRgEamK9RpAK2G6+HD0YUD22Y4
	E8jDmQZC3CPucAUS8Q7xyVe06SSzRIVRqgykfBLq9+6bLMhoLQWUwgtwb5R11VBkw1bVKQprRRNWx
	gd0EciQ8ce/P3gLHa8LsMXCxssHeNV1gMA3f9rXJW2h518cZgAcCgS+XmmWqEo0sonr5fqgWfqTep
	1gIogCr2K5gjc2M962293kU3SmvhdlYlKZpD/mczh9ENsGcd2Ek4+njirK2+tUVn3kCOioO+VnPYi
	8i752j7Os0+q910Yi1mI2z3FbETjRgQ1/nBH3ZHf3oeFfbFMIaFdg0OnC7fOrzdI1oRdWvXVReK2k
	WPQviJDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRS-0000000DRPN-0YL0;
	Thu, 19 Jun 2025 15:44:42 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBnc-0000000CeAG-3MeB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 09:43:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2348ac8e0b4so110075ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750326192; x=1750930992; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qaC15VNy2W6fdEhbxclQpnkYOQSK9bnjumzMUXgIe2M=;
        b=YLfVgc8ejGrvD4oviinalCX95BcBk08BOUX+aq37YEd0oVsmQn34R6NCe9dHgnIAJL
         hfbhaANTuLZQZqZxEYzYvukL3sZ7Lw/LOQttU5niYYyT5o03wluh2kEqD2iV6bUVqD73
         CEqcxzd+VLm/F9dM4I+qkvGiuhOCdND5zxcQLt6dGXh0eDP2qvP+y2Zu3JmNfGRFfs9E
         ajR9/M/4vm0jAzV3V1ke6JkAYurEfTVQXKkruCw+5X6dHEq+DlKEC500seLEkhp01P74
         04fZ/UipXZMtfBJDxdjUO3Jsa1WocKAuBX2aq3yzFXA/mFQc5BUrEcTSVlugxfOAN0wL
         L+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750326192; x=1750930992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaC15VNy2W6fdEhbxclQpnkYOQSK9bnjumzMUXgIe2M=;
        b=VKgYbu7m95+MBLdJlJj9ncJV1DvnZPLHUpnoQ9+thJGhR1+1f7lzILgPgL77n8n3zp
         seQdisZxVIMpkU76GPd5s0At5TjCymtevFaA9zQAQWcAdRrcrfTRs/WttomnkCoDpZ89
         nE1KdLKBlOYfk6ert8JBCmPEabNzfZ22lgcQPvAkMt1TgCu0Kq/8JCA7zTg4Vl2wzlsZ
         D5IX8b24Nlnpi4z679vNzCb8iLmxURw26stbas8JLydluhiq0cin6ebKTaviEHoGaaV1
         oPTUMK4oPq43EUjrC7Kc/x5GDlhZRuxX3Qa//Al+suJlUCOwNRgD4BurUQF0U5fxpeIQ
         qm1w==
X-Forwarded-Encrypted: i=1; AJvYcCXovjKSS2uDA1iMtWcNeZuJEvpiy7r2c70KKrzQp1843/lgwaWuganq3X0OanAje4MxPckDR3WacEtfLOgCqOz4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3TyThXw9euGnEhtw4vs+nNkrhwWhX+NuyuscMGOBBWQaluMgU
	5/6WKltpOEL/juNpMwcYVsOmuwTmaHXlx1iLIx3znQ9pP6H58s+7xhKtgXP+zGLj0w==
X-Gm-Gg: ASbGncs6ais69t+EejI6SEXgueJZrbX0ntyUV44RsiHE0QjAmxHL+9j765Lcs2u1+5s
	BXml+NritWB09iBDqyWUrdGBvS4y39ejvEQFMvekcCbGlCFAXw1aCArERFzgJEfm2eW78kdzk3p
	kN1JPnPeNYvUEV3XyUTU6XH6ytZ5b2k8Ggokg8YO8Ra2yo6Z5Qstqkl7jsiVgxYimPDVGOOJghb
	YaXFs5CtpPOhMbQ+E2Ufw2Tj+WmKsR4YEA8bccjnWTQacVlVJ1BdHozvstHwqj4COVhZsR4VIJ8
	0n4eqUxiUoYldsDo9G/KHAS1zL7+6gCe7isefXJoG1yHQXEu8pBzuscplGfaJrWqValxi2Lajvs
	k/UmiFurHviTm7xihokQV
X-Google-Smtp-Source: AGHT+IF5Xbj3Phk3inMt+DC051gDXuXBtlipiWCKp5tiqrOfx50jggHB3jHa73ldHrX+V4U1FbWR2Q==
X-Received: by 2002:a17:903:1510:b0:235:f298:cbbb with SMTP id d9443c01a7336-237cca9b5a1mr2457355ad.26.1750326191623;
        Thu, 19 Jun 2025 02:43:11 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890082e71sm13198748b3a.107.2025.06.19.02.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 02:43:10 -0700 (PDT)
Date: Thu, 19 Jun 2025 09:42:59 +0000
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
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 07/25] iommufd/access: Add internal APIs for HW queue
 to use
Message-ID: <aFPbo6RI-D4T7nXE@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <64145b184a0fa7c9b60532c9b475a51625edb77c.1749884998.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64145b184a0fa7c9b60532c9b475a51625edb77c.1749884998.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_024312_844371_3D52EA8C 
X-CRM114-Status: GOOD (  28.37  )
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

On Sat, Jun 14, 2025 at 12:14:32AM -0700, Nicolin Chen wrote:
> Now, access->ops can be NULL, to support an internal use case for the new
> HW queue object. Since an access object in this case will be allocated by
> an inernal iommufd object, the refcount on the ictx should be skipped, so
> as not to deadlock the release of the ictx as it would otherwise wait for
> the release of the access first during the release of the internal object
> that could wait for the release of ictx:
>     ictx --releases--> hw_queue --releases--> access
>       ^                                         |
>       |_________________releases________________v
> 
> Add a set of lightweight internal APIs to unlink access and ictx:
>     ictx --releases--> hw_queue --releases--> access
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h |  8 ++++
>  drivers/iommu/iommufd/device.c          | 59 +++++++++++++++++++++----
>  2 files changed, 58 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 4a375a8c9216..468717d5e5bc 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -484,6 +484,14 @@ void iopt_remove_access(struct io_pagetable *iopt,
>  			struct iommufd_access *access, u32 iopt_access_list_id);
>  void iommufd_access_destroy_object(struct iommufd_object *obj);
>  
> +/* iommufd_access for internal use */
> +struct iommufd_access *iommufd_access_create_internal(struct iommufd_ctx *ictx);
> +#define iommufd_access_destroy_internal(ictx, access) \
> +	iommufd_object_destroy_user(ictx, &(access)->obj)
> +int iommufd_access_attach_internal(struct iommufd_access *access,
> +				   struct iommufd_ioas *ioas);
> +#define iommufd_access_detach_internal(access) iommufd_access_detach(access)
> +
>  struct iommufd_eventq {
>  	struct iommufd_object obj;
>  	struct iommufd_ctx *ictx;
> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> index 9293722b9cff..ad33f1e41a24 100644
> --- a/drivers/iommu/iommufd/device.c
> +++ b/drivers/iommu/iommufd/device.c
> @@ -1084,7 +1084,39 @@ void iommufd_access_destroy_object(struct iommufd_object *obj)
>  	if (access->ioas)
>  		WARN_ON(iommufd_access_change_ioas(access, NULL));
>  	mutex_unlock(&access->ioas_lock);
> -	iommufd_ctx_put(access->ictx);
> +	if (access->ops)
> +		iommufd_ctx_put(access->ictx);

Purely relying on access->ops being NULL feels a bit hacky to me..

> +}
> +
> +static struct iommufd_access *__iommufd_access_create(struct iommufd_ctx *ictx)
> +{
> +	struct iommufd_access *access;
> +
> +	/*
> +	 * There is no uAPI for the access object, but to keep things symmetric
> +	 * use the object infrastructure anyhow.
> +	 */
> +	access = iommufd_object_alloc(ictx, access, IOMMUFD_OBJ_ACCESS);
> +	if (IS_ERR(access))
> +		return access;
> +
> +	/* The calling driver is a user until iommufd_access_destroy() */
> +	refcount_inc(&access->obj.users);
> +	mutex_init(&access->ioas_lock);
> +	return access;
> +}
> +
> +struct iommufd_access *iommufd_access_create_internal(struct iommufd_ctx *ictx)
> +{
> +	struct iommufd_access *access;
> +
> +	access = __iommufd_access_create(ictx);
> +	if (IS_ERR(access))
> +		return access;
> +	access->iova_alignment = PAGE_SIZE;

Maybe setting acces->ictx = NULL; explicitly here would be a clear
demarcation between the new API for "internal" v/s the original one.
Else, I definitely believe we should have a comment mentioning that
access->ictx is NULL for internal.

> +
> +	iommufd_object_finalize(ictx, &access->obj);
> +	return access;
>  }
>  
>  /**
> @@ -1106,11 +1138,7 @@ iommufd_access_create(struct iommufd_ctx *ictx,
>  {
>  	struct iommufd_access *access;
>  
> -	/*
> -	 * There is no uAPI for the access object, but to keep things symmetric
> -	 * use the object infrastructure anyhow.
> -	 */
> -	access = iommufd_object_alloc(ictx, access, IOMMUFD_OBJ_ACCESS);
> +	access = __iommufd_access_create(ictx);
>  	if (IS_ERR(access))
>  		return access;
>  
> @@ -1122,13 +1150,10 @@ iommufd_access_create(struct iommufd_ctx *ictx,
>  	else
>  		access->iova_alignment = 1;
>  
> -	/* The calling driver is a user until iommufd_access_destroy() */
> -	refcount_inc(&access->obj.users);
>  	access->ictx = ictx;
>  	iommufd_ctx_get(ictx);
>  	iommufd_object_finalize(ictx, &access->obj);
>  	*id = access->obj.id;
> -	mutex_init(&access->ioas_lock);
>  	return access;
>  }
>  EXPORT_SYMBOL_NS_GPL(iommufd_access_create, "IOMMUFD");
> @@ -1173,6 +1198,22 @@ int iommufd_access_attach(struct iommufd_access *access, u32 ioas_id)
>  }
>  EXPORT_SYMBOL_NS_GPL(iommufd_access_attach, "IOMMUFD");
>  
> +int iommufd_access_attach_internal(struct iommufd_access *access,
> +				   struct iommufd_ioas *ioas)
> +{
> +	int rc;
> +
> +	mutex_lock(&access->ioas_lock);
> +	if (WARN_ON(access->ioas)) {
> +		mutex_unlock(&access->ioas_lock);
> +		return -EINVAL;
> +	}
> +
> +	rc = iommufd_access_change_ioas(access, ioas);
> +	mutex_unlock(&access->ioas_lock);
> +	return rc;
> +}
> +
>  int iommufd_access_replace(struct iommufd_access *access, u32 ioas_id)
>  {
>  	int rc;
> -- 
> 2.43.0
> 

