Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0197C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 20:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTENdrjrQjKdf4LTtk0rNbYwdganBE87alZpnHbaQAo=; b=Chx75EPVnoHJzV1gOI5558wbBb
	QqXZe2bgMX1DuQ08W1FHijLrjptiMkr+Oqx1iWoBXPtA6HBFIPqo1B0SWmqt6oSRURvIvDHqD4Sjm
	3ZuZhCUPB28PwkuR7gevBt9glibwCKhwqkUOWFlWcyFn+7o3d4Azs7bSQocm/VL5ez85UY1psCdV7
	L2YmJlbydfwEOFQ6xfn23sgfFBeWnSNNh5AxfjhlrMvIJ+IItCDgxGuTZiqDwKBr4F9YpjGk0F+QW
	39XTOZPQC0KoDi8jTP4c7azJF1nS7j6cOQuXRpgcz+Inu2C7fxuelMM4QPr74z+zIax/t7WVxh6QV
	bFbNqfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf31J-00000008RNU-3Gm7;
	Thu, 24 Jul 2025 20:58:29 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2yr-00000008RHX-4BNV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 20:55:59 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-237f18108d2so59755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 13:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753390556; x=1753995356; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gTENdrjrQjKdf4LTtk0rNbYwdganBE87alZpnHbaQAo=;
        b=u1VS5d09sltyf6v2N9Fq2Yqg8iirNNtwuH3snaMNDcop0cAOq8a7BOg0vevYc1pBA8
         VkogHx7M7fFvJ/4rB115voK+1FmHEKq6alK8dcMDrjhekdrD0vmQ3uAiEbnViwUD+2SX
         7Fz1IWgcLX5KI4sMZaoUEGgA4b+lpWaktdXajMmLlci1NxdvZAJcq0mkIMu05ToyO+Zv
         q/M8U5TLf7LF/RjaV3wR0gsB3ZmNeIIuv/BtqWagVpRyCnq5RuobB4OvWsvO6MU9SVNh
         zgrPtfS2nHDLQYIBWtRx24gZirpaPUe+navMWZY5c+xEdmSPKlcaCuIPqjGzWWwX8n1B
         Yg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753390556; x=1753995356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTENdrjrQjKdf4LTtk0rNbYwdganBE87alZpnHbaQAo=;
        b=TtMfBGKG2C7U52iHA++i6qRNzunqCRDTbqBntpeCLXOmo8R1Ytw6wLwUN8pClmXfwJ
         H3gentk5tyEbFw1Hgnj9EdtqWqQ/ABkFziP9H1DkTtAHsZZQZEROyDOxz8qViFDAstSw
         ONfg5E0AAzBvn9OGqDCyPCzyXPnukKwQAkuOnS3q0r05VFvD1JL4RXybslC7oEQtBNZ6
         K+gUnjPwvQt3DDS0c7PH+3pdTCZ6Bywy1rz8NptGK7AZk6zJVOghc34bk9Ji/rDSUajD
         iF2mAAVws1HcE5zFCt8+mEiKdO3X9IP6/gttPE6J07/iiGIVaABR1xp7+jz4LUBkfsfp
         UTwA==
X-Forwarded-Encrypted: i=1; AJvYcCUk6GAQxVIeJ0eRNGjw+d3FJImV9+xr53ZpGLttpHOLrSEOu2BEdunSN6NcndYpfFYsPYdFV74s3yeUnMvyS+rQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6UCSBIB8IePaRh+VIeEP0sIt63y5JB/iSQrVpM3s7KqiYj0Nr
	nnWVnX3/j1ba0QRktLLlL7vosvyoKdy5pO4mN319+lSSqKpvsFfTvnkNQ1mYrynYTA==
X-Gm-Gg: ASbGncurU0iG1QTRN1RtK3VSvP60eJ8+J4enUPxnw/fETHbOIviMAhIvpQUM0mlFWlg
	HkztqeLQroO+6kYAnGii+Roe8SRnIHRzCqVhm05EDgwloRnhWPmlmxFCA4ubXH1AbYalBNAHnU3
	7hDIgAdsDN8RQS3ccXFIJcPBWbXWj8MtHo95HWZqY/yO3VtYy1iAZoAmtpmVjrygzB9JDZMVANW
	snRmO1aULUpwwgEmzyR6XspJlwv2luqUQJJJlBA3ti/3iyqJ3AII/mf5ohzaEB/3Rgw4E66gICH
	lJLzQCfI1DB9fZMeVX3p+UeFMf9p5bEbe4UKPa1xLQUuEuf6iMQuTqAYK5BoijHemJVYCJ53Om8
	5GuxaQPH4U2N5oKdHq7ZzFm4/hlffJOQbbIkKOnLUQKCH9tCyB9q0CICo
X-Google-Smtp-Source: AGHT+IHAKLnuNj4dfO0gvzhHyjc+lG/rACu6++zv+Qt1qddir1QwuV7zgtdYIfUhlyrA+12IZWRoQw==
X-Received: by 2002:a17:902:ef48:b0:223:ff93:322f with SMTP id d9443c01a7336-23fada587f0mr920885ad.2.1753390556054;
        Thu, 24 Jul 2025 13:55:56 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475deafsm22232285ad.11.2025.07.24.13.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:55:55 -0700 (PDT)
Date: Thu, 24 Jul 2025 20:55:50 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIKd1owebUNQeN1-@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
 <aIEwzM7mKUI8-h9U@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIEwzM7mKUI8-h9U@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_135558_035679_20A8D4F8 
X-CRM114-Status: GOOD (  31.55  )
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

On Wed, Jul 23, 2025 at 06:58:20PM +0000, Pranjal Shrivastava wrote:
> On Wed, Jul 23, 2025 at 11:05:26AM -0700, Nicolin Chen wrote:
> > On Wed, Jul 23, 2025 at 01:37:53PM +0000, Pranjal Shrivastava wrote:
> > > On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> > > > @@ -1273,6 +1279,10 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
> > > >  	phys_addr_t page0_base;
> > > >  	int ret;
> > > >  
> > > > +	/* Unsupported type was rejected in tegra241_cmdqv_get_vintf_size() */

Sorry, if this wasn't clear in the previous comment. I meant this
comment must be updated, the "unsupported type" wasn't rejected in
vintf_size, rather the type got corrupted which brought us here. Had the
vintf_size rejected it, we wouldn't be calling the init op.

Thanks,
Praan

> > > > +	if (WARN_ON(vsmmu->core.type != IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV))
> > > > +		return -EOPNOTSUPP;
> > > > +
> > > 
> > > Nit: I don't think we'd expect a call to this if the vintf_size returned
> > > 0? I see that in iommufd_viommu_alloc_ioctl, we already have a check:
> > 
> > It's added in the previous patch where I explained that this is
> > to detect data corruption. When something like that happens, it
> > would be often illogical.
> > 
> 
> Right.. I got mis-led by the comment, my point is that if an
> "unsupported type" was rejected in _get_vintf_size, we wouldn't be here
> calling viommu_init since we error out based on the check in
> iommufd_viommu_alloc_ioctl.. but yes, if there was some data corruption
> that changed the viommu type between these calls, I guess it makes sense
> to check and error out here.
> 
> > > And call ops->viommu_init only when the above isn't met. Thus,
> > > if we still end up calling ops->viommu_init, shouldn't we BUG_ON() it?
> > > I'd rather have the core code handle such things (since the driver is
> > > simply implementing the ops) and BUG_ON() something that's terribly
> > > wrong..
> > 
> > BUG_ON is discouraged following the coding style:
> > https://docs.kernel.org/process/coding-style.html#use-warn-rather-than-bug
> > 
> 
> Noted. Thanks.
> 
> > > I can't see any ops->viommu_init being called elsewhere atm, let me
> > > know if there's a different path that I missed..
> > 
> > I see it as a precaution that should never get triggered. But in
> > case that it happens, I don't want it to proceed further wasting
> > precious HW resource given that this function allocates a VINTF.
> > 
> 
> Agreed.
> 
> > Nicolin
> 
> Praan

