Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB12C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 17:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mEMzzefTttNVGmGGFEF+tVQHWP3i8v0cb/h12OtES4=; b=nrEZ7BQDSYx/rbKvQDIVvg9LkA
	dW9wv9/5D5IjhLKhIu2PqJ3vv9a4vEQwuPOd8Ype/1gkiDjmFq6OBURjVgglnOl72gxkypJNQH4S+
	of7eChifDCNCw774J4siv42mJ1g7bb2D6z0MOZIlDODOjhvhlxI+4C0IMSd2rzHr9kQSrHtroDUD9
	Inxxwl1co/b5G2gowe0hU9u0P91MzTJy6axq43jxuxvWR24QPmNyVWiDGmB7wTOzAzW22Z0/jw+wr
	iHp0pGAXolFJvAlELWqRJbmK1UgSNO3welH1DqBPU6I/fRAwNdBopa8ollAHJYKsNoTKhhsqX1e0G
	bG4mVt9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SgI-0000000793a-0k6K;
	Mon, 28 Apr 2025 17:54:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Scw-000000078jt-19Ow
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 17:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5mEMzzefTttNVGmGGFEF+tVQHWP3i8v0cb/h12OtES4=; b=qGAczGMjn8BwuIM7hycnxoHh26
	JjLZY5ylG6ByipWHpmk7zgNVmL28TncUTcdOyAddzvCPlGPS+FYnYwLn6gh2A60saYhTIZhaWmpxy
	3PEFTjB7Ml5e6zkiO1gs23KhfZsVdDR7N4azbmTwkbLJWoOnLYik37Zcqnu1Hka+xMiFUbI0v8owi
	AkY9XkBRHKTZyzlFS38JJQcoImyGsOCd8pTAz5O38pS30mtwsJW+9/IzMYa6dq+BIAK7j9lsVVXbP
	5qpUN1wpihlxC7pbj7tMzBhQxp6/p99PCSTFqPXv8pB5u+R0/Y5htYd93hFIv/yhGrmNuTOq+PWag
	9YBZoHrQ==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9Sct-0000000CwPF-14fo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 17:50:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2264c9d0295so22095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 10:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745862640; x=1746467440; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5mEMzzefTttNVGmGGFEF+tVQHWP3i8v0cb/h12OtES4=;
        b=LfkLbeQZU4KNXySdLsb9Se0t/QRhs1nmbH8L8WGMzjwCTQYiLvYj80P4ODP3sq/LhD
         3St3BiO7kUscTyGJEUlFqFvBNu13Q+XJy1Cg1q1tTAWibDlRJsIWmea1IRSFBLii2reS
         BRa4jYD2rAZFquKzTmFR2+ski7NxT+68Pld9hCTAl6Qeq6kU/aqBftXxsSeWk2PRC8BV
         cmSDBtcg6FFLo20hpOSy8L2I/Lh7ZXCRmjWEb3yYGcu8ppvr8mlQeD0HeudRfNFbYCAw
         FjXZ26DKb3L2wOPGP5c/8vK+joHuA+oDgusKoA2Ae5RgCzf2iE24mDckaowtSWsNEg2M
         cWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862640; x=1746467440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mEMzzefTttNVGmGGFEF+tVQHWP3i8v0cb/h12OtES4=;
        b=fQwcEwUqJGGwGPlW9kW7Z6zO/AIOqKrnlz+p/z4rN707bo+CY2ZZdoFbSal488YIbm
         EaNwcnU4ymOZhIRqQIRgUDUWtjLWyTRxcDJ5emFXBIBJfMhm+fXABN1LXTy3oDzZoA/n
         8qofaMgH0rIGj51HVVNRSQ811/aytNJn0T/JjaCLS8yhXKnrY4z/WanT/F4fLhA/naI8
         0pQlIpzLR0aw1OqQLNdFfqh6VEMZyQar7pAc7p6AS6Z4Si2PCfsqqWSihrtjWpEUZ/us
         AqIWJ3jIjWVyb+8CVflJ4upG68cFbG9hnbw21qMTeeUtELqlZ9gk+xwFQ295wyi5PpZq
         QCGA==
X-Forwarded-Encrypted: i=1; AJvYcCWFlFk4nLlR6eHmI6Y5hloZZYN1HoRhTV7OhWWbnEJz6I41OzDaJqpzcw+XgX5EwdK8V6/ZVOnlYGMyz/gDMArE@lists.infradead.org
X-Gm-Message-State: AOJu0YxWIXX6H4gPpMaCCW+wgCvkVeVkWVsqmKQGN3PClpfgMAITf6X2
	fwBLv+REBljv5HARL7UeqsqiMXj50YAP6gboNpjvkrjjmWYXJmtTlXMhoCigHQ==
X-Gm-Gg: ASbGnctNhf/T6YlUJx0xE60xBvGXunBySMfN7ZwA/2koSgCkoCDQdnxWkNZ5y/mtu+z
	3oSWTDAmo31ivW76As6p1KejOyaueUqVwk9SqPobpexFXTRpE61KKcdgn0rioExm26JH1QIbrX8
	P2ev+Pc2vJCgFhCeLHi2HoLcsMGI46ACr2muLAKee5lyL5KhR25XBLpYOnoG2bVL3YTKZl2xEq2
	FO8uGUX6cNzjub5fXgvi7B32M4LL9aOKqtK/nOLLntHMEbbSA0QrJslwC+GaLJGx3Y8dQ+Zw72P
	ZC0QLBQagWxPwIdlSFjl5huuT2HfOQT5g8VOBK5GOep3SvRldDApzpR2ss6/emKZM3UJidrR
X-Google-Smtp-Source: AGHT+IFdvGjCZd8WihYpKKAdbavzVYWBtSaBNCLX1v9EIv3lNKixiHNvn3PMdFhA2dEanqkbNONo4w==
X-Received: by 2002:a17:902:ebce:b0:229:1de5:e8c9 with SMTP id d9443c01a7336-22de6ebc37cmr33095ad.13.1745862639534;
        Mon, 28 Apr 2025 10:50:39 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4db9b02sm85788765ad.56.2025.04.28.10.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:50:39 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:50:28 +0000
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
Message-ID: <aA-_5FQK0uZPdGVA@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <ca032e90c0241fe0653023fcb655185dba763f5f.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca032e90c0241fe0653023fcb655185dba763f5f.1745646960.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_185043_436425_F8D46C16 
X-CRM114-Status: GOOD (  22.89  )
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

On Fri, Apr 25, 2025 at 10:57:59PM -0700, Nicolin Chen wrote:
> Similar to the iommu_copy_struct_from_user helper receiving data from the
> user space, add an iommu_copy_struct_to_user helper to report output data
> back to the user space data pointer.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommu.h | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index ba7add27e9a0..634ff647888d 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -562,6 +562,46 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
>  	return 0;
>  }
>  
> +/**
> + * __iommu_copy_struct_to_user - Report iommu driver specific user space data
> + * @dst_data: Pointer to a struct iommu_user_data for user space data location
> + * @src_data: Pointer to an iommu driver specific user data that is defined in
> + *            include/uapi/linux/iommufd.h
> + * @data_type: The data type of the @dst_data. Must match with @src_data.type
								   ^
Nit: Must match with @dst_data type.

> + * @data_len: Length of current user data structure, i.e. sizeof(struct _src)
> + * @min_len: Initial length of user data structure for backward compatibility.
> + *           This should be offsetofend using the last member in the user data
> + *           struct that was initially added to include/uapi/linux/iommufd.h
> + */
> +static inline int
> +__iommu_copy_struct_to_user(const struct iommu_user_data *dst_data,
> +			    void *src_data, unsigned int data_type,
> +			    size_t data_len, size_t min_len)
> +{
> +	if (WARN_ON(!dst_data || !src_data))
> +		return -EINVAL;
> +	if (dst_data->type != data_type)
> +		return -EINVAL;
> +	if (dst_data->len < min_len || data_len < dst_data->len)
> +		return -EINVAL;
> +	return copy_struct_to_user(dst_data->uptr, dst_data->len, src_data,
> +				   data_len, NULL);
> +}
> +
> +/**
> + * iommu_copy_struct_to_user - Report iommu driver specific user space data
> + * @user_data: Pointer to a struct iommu_user_data for user space data location
> + * @ksrc: Pointer to an iommu driver specific user data that is defined in
> + *        include/uapi/linux/iommufd.h
> + * @data_type: The data type of the @ksrc. Must match with @user_data->type
> + * @min_last: The last member of the data structure @ksrc points in the initial
> + *            version.
> + * Return 0 for success, otherwise -error.
> + */
> +#define iommu_copy_struct_to_user(user_data, ksrc, data_type, min_last)        \
> +	__iommu_copy_struct_to_user(user_data, ksrc, data_type, sizeof(*ksrc), \
> +				    offsetofend(typeof(*ksrc), min_last))
> +
>  /**
>   * struct iommu_ops - iommu ops and capabilities
>   * @capable: check capability

With the above nit.
Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 

