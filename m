Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE36C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BM3nl1PDUv3g4PwFQ23XNaGdtMsSR0uMk4FDd4zSWU0=; b=3JfabvLXtUfLCWSwto9Sm+DnqY
	mUtsCNV1uaB1FpsVx1cvXJhdD/Mm7iT84fqqRLO51OKydHUK7+i0STV4EJ3/drLXl2vovPq7mknVT
	u79qEXAn/pX8Z8T9PlUpOWibmnAs4yL/Mtp8zrFfMlqunANk9eWTuQT0ktzAREnKBjZiR4HtX5DVf
	MO5A/MM4c4jlk8+XcQ5qvewZ1obMRdMAYZ7h0YpucUDb0cnU5iyzZ+576KwUErnKQfYODGeZDscdl
	0hFGMyW3Bt15vM6FAtSvUHalwKdJu4Yew4bmVt6gYyZ/Les79IJhdwBho346Q3fTHvcQnWwA1rihI
	/ffpUurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptI1-00000008u0X-1XWJ;
	Wed, 05 Mar 2025 18:16:17 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptGP-00000008tjR-3epC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:14:38 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7be49f6b331so683428285a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 10:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1741198476; x=1741803276; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BM3nl1PDUv3g4PwFQ23XNaGdtMsSR0uMk4FDd4zSWU0=;
        b=IDCua/S778Y22lT1TA5JXU0XEtxGRjnV6jnwS5Z/7brDdBCDdVYptqRm3+xmJPirbc
         YC5uKFFN8tXsRaAzuHAmAKZbU9qF8V0lssc5/PMSSA+tp50ECRinsJi98wg3+JmwndVj
         hrzKzjyIlfbtqL3gzZ9+xxrsAvhIvH2VsYz+rdzt360gsmsrO6eEHqM3qIGR+T+Sk0xh
         qvoi0Y8ATThEWEYkMKoyb61/unjJTjMyze/YV2KQP4Mmd1g4qWb6N1HChKxhTQRi7iYX
         N8/92WX66d5RfBaNzN5ZSiOh85O2soc9Rahr9ltmPy76Evozm+AGYwfl/OVbgBxINuMc
         sx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741198476; x=1741803276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM3nl1PDUv3g4PwFQ23XNaGdtMsSR0uMk4FDd4zSWU0=;
        b=qV/eNc9lY8a2PKBL0aBNrEIc4k6Kc7r6zsPi+Do1XZHTzfcc/N/wgEBrrLtanXtbU1
         D5YtDCQYBghQqbBw4uWyN77b3LGGmNRfqIapF6bY7alIw83pQq8UtieSkixD6L4Ihby2
         OLsT2eBHlSAYYKT75wF4awM72QimElOjlLZ+jShTY05iW9nLpgmKVBu8H9QuSqnkgBEy
         sIjmMIGz4ZoXPvnN3p+ixv/LcUNgoZPXdpgs7St46kuAYT4gyNHYy0OLcgJ3FHshIuiC
         Ca2U9coumdoUji7j+vfxjtRKl94LQSAwzFNhNQ6VdsJDdia91ixr48hfFB5GQ+YADbnS
         DxMA==
X-Forwarded-Encrypted: i=1; AJvYcCWXzHoYxXBixDDybPZiq+e6ycd6WhH0SWCaDQaidatw9nLRgXYbMCVI9n2jU/4CwPY5RtfiZW3cy9FdHQcqc9/O@lists.infradead.org
X-Gm-Message-State: AOJu0YwrTRvK9MbksyfxtcokpoiICuhm162K8wbyXsdmvgLVJjttd6x3
	IkUvCBTWxm96UIEFNtifWKwGcZxJvcOziHeHpm2VR3VXHML31gLW0/V/BNP4L9s=
X-Gm-Gg: ASbGncu31IYrErWKcbkVbukmpWdJqDqHLPvO5JWr56M5FPrbvWVuJepC1m5XRGwqbCk
	Q12Abd11x5JleHRgPk0xnD9LRzF04XoPuhLpQpDYwXcWfbdAd8etgvJLWMQa7kcABmkrnvomKuv
	FAz2ryFBXrzuKdc8meqHjzws2KNlcWmQ6WEa7xlYnFgyNF1kINYrNaB0FQLzju0kKDPFoBxNDTN
	7zGh3ceGOVrtv4odmPKOGWnW7gW7iQrjbvIDBo7wp9OGKMurFUOsruP7bnA4qPGcCgkya9VVgzp
	cwEgSDP56G23pYXQ6v0=
X-Google-Smtp-Source: AGHT+IGBXOlCQEjAXivcZONN7HD211rRxB+Amwcgf4SScDXv9d/J0SEM3NN6sEdvhUlnOiPXZLnHzQ==
X-Received: by 2002:a05:620a:2b44:b0:7c3:c077:fbf2 with SMTP id af79cd13be357-7c3d8ee8505mr677678685a.45.1741198476550;
        Wed, 05 Mar 2025 10:14:36 -0800 (PST)
Received: from ziepe.ca ([130.41.10.206])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976da283sm81577696d6.111.2025.03.05.10.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:14:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tptGN-00000001U2f-0a3P;
	Wed, 05 Mar 2025 14:14:35 -0400
Date: Wed, 5 Mar 2025 14:14:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Charan Teja Kalla <quic_charante@quicinc.com>
Subject: Re: [PATCH v2 3/4] iommu: Keep dev->iommu state consistent
Message-ID: <20250305181435.GJ5011@ziepe.ca>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <d219663a3f23001f23d520a883ac622d70b4e642.1740753261.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d219663a3f23001f23d520a883ac622d70b4e642.1740753261.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_101437_911192_AAE0F88C 
X-CRM114-Status: GOOD (  11.42  )
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

On Fri, Feb 28, 2025 at 03:46:32PM +0000, Robin Murphy wrote:
> @@ -127,6 +128,7 @@ int of_iommu_configure(struct device *dev, struct device_node *master_np,
>  		mutex_unlock(&iommu_probe_device_lock);
>  		return 0;
>  	}
> +	dev_iommu_present = dev->iommu;

I feel like this deserves a comment..

Maybe it is:

/*
 * If of_iommu_configure is called outside the iommu probe path
 * dev->iommu should be NULL and it needs to remain as NULL
 * If it is called within the probe path then the dev->iommu
 * was setup by iommu_init_device() and must not be changed.
 */

And I think the commit message should explain what consistent
means.. AFAICT you are going for !dev->iommu means no probe has
succeed / dev->iommu means a probe is ongoing in this call chain or
it has succeeded?

Otherwise:

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

