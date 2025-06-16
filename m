Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E0AC71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 21:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkxtSh5lJN8oDluqdUpIdBWts0li7o6KCp4HMQP+7eU=; b=VIrvb/5G60kkryImz/3T+knaZt
	5PgkevNHvk1H5ul2rvuhjBAnFvhb/6gIdVWkfWKP4ezxRclfr9awFukUBv5KdjiHHIxK490HvugGs
	odhYuF3bKUI+YtYhkMGbhX2HuPaAMrEEIkdM7whqLcQt92lRuta0Br+JY39PSy4POFN4BgpX5MOcC
	gD+5ZQzN/oA2ACdjYwTtz8HlvLkKr0DPHEFeu/pzE6ivelwyoQKWE2SgAaL+xSdOtjxztrEbS+Ax9
	8MR2pnmdLEUigHeG3reygDq/Vb45aI0GLpXGzWMgRAFwil9TWDnlfUjqGcD0O/RKzyrcL5GsAJW9T
	hEZU9O8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHfy-00000005bpg-2pg6;
	Mon, 16 Jun 2025 21:47:34 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHdk-00000005bRz-23Ki
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 21:45:17 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2348ac8e0b4so26155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750110316; x=1750715116; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PkxtSh5lJN8oDluqdUpIdBWts0li7o6KCp4HMQP+7eU=;
        b=y42VtvHUNY7R8x/mE742ImVPOONmfZ3VO1MHDM2Qwk5e3M5/vWEIEWXOLskCj3pAie
         HybVBF22yRjVzhxaz7t/OUrqXrLvSGTDrPnYrde4WCoiivkKc8yjcEZExtdx90/MIQpi
         0AsTY5byw16e+ojd9p2DxYZKpZCsUzKi2MyguNgpbsCCcm/XoHJBhRbSt6/dHJ8J1LBV
         W3gI/WvqEog9wiWzh7RwbKUBQf983XbgtY/aprM0J4R5eWcB7dKa4Qo99+p0nXIkuScE
         tbRgParamdLmXoeWEfw10xbMahoqtJhZtjUhRUvMrlxoVRvBIAi6yBtRGSMn9KsX6sfx
         sj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750110316; x=1750715116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkxtSh5lJN8oDluqdUpIdBWts0li7o6KCp4HMQP+7eU=;
        b=NdyDLJLHRPlMhvp1tXcnRty5oLKjrZdrQn4dTc32Id+BoiFGgxhQWxUiISOaGMh1Kf
         w/HmkxaN+lxetTrLg3KduIh+kO7LIzMU9O87q2hfO4ma/kiuDUiou63H+SCkJxSciNyE
         s1CGSBGhjj2Nraj5JR46AXdrkO1oRVkQ/L98mOQgCVkP/gjC2XMQa6zH45W4QVE3c9oQ
         zAr9Q8RohrDFeb8hG5LBQoorIru40nSyObYoFIywmzoQso+neGwNhaB69g9+FuAF2Q0L
         ZPhWo6MKpc7QN/SxAnGWZKYcyzW41c3ZlFJ2dRmRr1TcobskrO42QRDCnNfZNByKz8Wf
         +bGA==
X-Forwarded-Encrypted: i=1; AJvYcCVjtJ476eRbR+D6HgM11ecoAItt6SCzkGVHizFtMIjZATw1FtutLcIYsTBgQOD77xodpyFCk3nBPjgyl8/cQ01h@lists.infradead.org
X-Gm-Message-State: AOJu0Yye6YfyokgB9UHyDw+hOCWDS8wCCqAeM7Jm/LTEEb/otBDrJdJ6
	8s7wLFX4Robddc4DVlTg5AS/nLz6vNRv+OVytctfA0q+WYffeLdfAylzd4NkoW35PA==
X-Gm-Gg: ASbGncutyjZ3hbScCk+gcH7ZEdz3IkDpphbpZ2jyQ1RamgJQ0LQUoN9ottBa7UwCWIX
	4aDlA8vpKuQ0rW4sRJJLo6OApOclWu2FYl4Icgh2xBNSUNxAFAX1OCjfg5DuNbLbvNIJvaOfPwu
	NjuH+ltH+/l6v8fXT59+Z1SszBsat5IzmqW5+MQkkCnXrPV3hno7Iaab6U9SgfQZKsXbrfNkBhQ
	65DDEqYU65pyZbnxi2c+60hC5qtkv6jP914/+t141quyDFQggSyvAXT73M6qMc4Y1aUHwGnolN2
	5scOiITt6vRYziZuKlxAHYuN7y+wxOMaoQsw28+GiybZtuC1S13yzrCUONYTSn5ixrR5hFZTfSS
	VaNaw8F9x0yqQZExHMn9S
X-Google-Smtp-Source: AGHT+IHrQDyvVnwCf9csPzPlw1hS7k+ZaNmE2pdHcui8ltcFiMTENAodaPPmibhzeNqADUXMrthyDA==
X-Received: by 2002:a17:903:1a27:b0:234:bf4:98ba with SMTP id d9443c01a7336-2366c5bf768mr6063095ad.6.1750110315130;
        Mon, 16 Jun 2025 14:45:15 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d1ceesm7328258b3a.161.2025.06.16.14.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:45:14 -0700 (PDT)
Date: Mon, 16 Jun 2025 21:45:06 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 03/14] iommufd: Use enum iommu_viommu_type for type in
 struct iommufd_viommu
Message-ID: <aFCQYqHostKg0YVt@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <6c6ba5c0cd381594f17ae74355872d78d7a022c0.1749882255.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c6ba5c0cd381594f17ae74355872d78d7a022c0.1749882255.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_144516_531580_106A0DCE 
X-CRM114-Status: GOOD (  16.78  )
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

On Fri, Jun 13, 2025 at 11:35:15PM -0700, Nicolin Chen wrote:
> Replace unsigned init, to make it clear. No functional changes.

Super nit: Typo: s/init/int

> 
> The viommu_alloc iommu op will be deprecated, so don't change that.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommufd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index 498c9a768506..ac98e49e44fe 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -101,7 +101,7 @@ struct iommufd_viommu {
>  	struct list_head veventqs;
>  	struct rw_semaphore veventqs_rwsem;
>  
> -	unsigned int type;
> +	enum iommu_viommu_type type;
>  };

Reviewed-by: Pranjal Shrivastava <praan@google.com>

>  
>  /**
> -- 
> 2.43.0
> 

