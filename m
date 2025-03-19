Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D932C36000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 23:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gseEEcgxR2PUFeV7iG/jei3VTxYiomeFsvivAthjJ6c=; b=2W794rvdfHO3jrBa7SWcuiEhLn
	sD3CEsNJsRi0Xdq+xZ2BrwhbB8kpd08YTG67SVyb0q9XRg7YN46177o6nY8ouoJksTjQUmHs3duCv
	AxwSZcOjQEvmci6smGISGaUgz6KVtJqh/Hj94KuwMwinLdbIVUHlfbe4LeXM+0E9YpulxFlwYkGHi
	zgsUWpMrg01+/4kRTrM7UK4kY1XyHp3OfmKHQGvA5Zd7FfTF983zQr8dwo/6ShdsDQNty1greCShv
	tjNXCOMzGBjw8RLDyAUsRUoTSeY19u8FDfy0Z1n7SVQJxaO7Pkq7TC4CPRIFiUj9XNHamwzqMyvFb
	9pYglVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2sp-0000000ATIG-0PdI;
	Wed, 19 Mar 2025 23:31:35 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2qB-0000000ASaX-2GY3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 23:28:52 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6e8fce04655so1599556d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 16:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1742426930; x=1743031730; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gseEEcgxR2PUFeV7iG/jei3VTxYiomeFsvivAthjJ6c=;
        b=cQzk8L84He9+3CGbSOKWPiWRmMw9erHd2WX1ntx39XvoWpk0vZCl6yDqCMqkZoirc1
         3B52e4d/xUIFkSoE3gixKzRNMMQcgdakPiTDJ7RpzgXBvtPv7nCPgmOamOP1qh38PpZB
         cK/BGY3LCkmOoIzEquJNQzI5T70CAkzbWxlhOkEeDLZ0GHTBOxMk010Rqf09IDTHu66i
         JlJPu7v4OggEcccimpMDf72JeZTbx/nZPuuRLCqxLygaUSj6z3+YuByrYhpTLHkZiMh0
         qTKQGTtTMvZ9HafwBfO0wdKQJz5e15LAlsV9rIGOcSj+j28pnnoO29Z/GzTdJDPdY5Aj
         D4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742426930; x=1743031730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gseEEcgxR2PUFeV7iG/jei3VTxYiomeFsvivAthjJ6c=;
        b=n/oWZkj7Dxc6KGuvaw5awBRkVZlcL4MA2afLCaDQ2O20OtT6fubsIbj9ZZbwzoVHdQ
         4d+MF0BRx3NbL/49Rj20Aoeqkl6D+BtP2CQYQKyl3AcVaYmgOf09gO6eVaogS22U+pwk
         fH5gC65AdbjC6jvDCelBQfNYTs15oeBmz3i5IyiXcrIQsammdrWb6oLZZ/zTe409jE1n
         31f/orxXnc+JcrnMejmt3GrY3N33kzp/dZtYl4aN/aqebY0+4sVTXglVK0JwPRn+IL8A
         1JiJQRnwrEh0ie5aMYCG2LYCBVi4q0dh/7zpYiOgpl0PYimDOBuqt8T2+EU69p4neoeB
         Hf+g==
X-Forwarded-Encrypted: i=1; AJvYcCWPPtVVDtx/ANAcOe6OqfkjDLUNzT92So6L8Ly7weK7oj02W0KfRWBKPayzPcG4ejoJAe6sc56/Bj94s8MvnxxN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2IFKNq3diuejaKemANO9nLY8O8dVuZPc45nNa9gpcOLaVvwcD
	7VvDVqSA1qGd7/Nv7WY6BUVDatxd3OgLxOwYPzKfaNOzrOWbVkM/MbpL3opHjS0=
X-Gm-Gg: ASbGncuV9gxZnnXUMEeW43e3Qzu0uP5TW7ClIL2tj1ZcMRY895JY3Hu5X85WZXE7LN1
	LviO8hslLtqIMNoZfeGqan3nebyM0aEDNJq6wUJAswyNoaudI4ziFK5A143Kw8SmaaVECQzNsON
	t+JkxceU7xQ3StH64i51rwETPujRFjz1Hy0KZRq7CIICtNzhMb3Wxkl4Km/HbAOW/aUNcySgxzk
	X71HH5chyEoz0dJU+lG7eFkwEj2g2iTVrUnVghRQE9N5oofanIUkqYT3QZVyXcugpMVdp96dpJ7
	yiRCpa+LMwEZHhUHHaMK7Or2ALT9aNYh0pep1cpms2/g8gQQ8wJ8N2CvHIqSvbBerN33RtCp9JU
	OhcxALFVUhWetF+iLIg==
X-Google-Smtp-Source: AGHT+IGbrUJL++VHjNdJiRp2wbmBFeF1zO3i2g8SKEiaH6sIBdq4CqOBZ41CKMhKYzBCvXB+fzodAg==
X-Received: by 2002:a05:6214:4111:b0:6e4:2e5f:c03b with SMTP id 6a1803df08f44-6eb293a5ef9mr61501766d6.22.1742426930195;
        Wed, 19 Mar 2025 16:28:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade24ea1dsm85642276d6.65.2025.03.19.16.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 16:28:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tv2q8-00000000cbM-47kn;
	Wed, 19 Mar 2025 20:28:48 -0300
Date: Wed, 19 Mar 2025 20:28:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com,
	kevin.tian@intel.com, alex.williamson@redhat.com, maz@kernel.org,
	oliver.upton@linux.dev, will@kernel.org, robin.murphy@arm.com,
	nicolinc@nvidia.com, jean-philippe@linaro.org,
	jonathan.cameron@huawei.com
Subject: Re: [RFC PATCH v3 2/5] iommufd/device: Associate a kvm pointer to
 iommufd_device
Message-ID: <20250319232848.GD126678@ziepe.ca>
References: <20250319173202.78988-1-shameerali.kolothum.thodi@huawei.com>
 <20250319173202.78988-3-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319173202.78988-3-shameerali.kolothum.thodi@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_162851_751639_ECAAF07D 
X-CRM114-Status: GOOD (  13.92  )
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

On Wed, Mar 19, 2025 at 05:31:59PM +0000, Shameer Kolothum wrote:
> Add a struct kvm * to iommufd_device_bind() fn and associate it
> with idev if bind is successful.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  drivers/iommu/iommufd/device.c          | 5 ++++-
>  drivers/iommu/iommufd/iommufd_private.h | 2 ++
>  drivers/vfio/iommufd.c                  | 2 +-
>  include/linux/iommufd.h                 | 4 +++-
>  4 files changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

I'd probably explain more in the commit message that this is to allow
VFIO to pass the KVM to iommufd so it can later be associated with
downstream objects like the viommu.

Jason

