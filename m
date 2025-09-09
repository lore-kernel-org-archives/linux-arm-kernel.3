Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8488CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhvGZRaKvGOKbFuieB7cy8gqgC/YDYs/ewa6xCzMoyM=; b=nt0lxqbLtUZyt3MObwS7HRHCFx
	f+zGH2c3m6vrysjM3JUhqfBmRwpl4VDl/SLywXe/bcAPRNHufNQ6oG+LehrTNJepZgmJ29FlNKV37
	PCgvSg26YiolPLH7A3HQMmYynu0BREW1yQJcxHeHKZ9ROTU7FuwOlICWSuc5I50w3m1mdUcIMQ12f
	RsrrOfZPMYwRP5dpuj3xBUM4TJU3NLOceS7ricS8WR8M5haqNpClzXk8spt2MCytbXHqyc4Fyz65J
	F7i+rxMUSWqYKSZEoLsOHfZfc9tw2zKGZheelAMvpk++2xKf5l5VeuJ3H7mAC8Kw9Ca7g2LVgHkUv
	x9mfG8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26I-000000094Pe-1Rhz;
	Tue, 09 Sep 2025 17:25:50 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0k5-00000008MOL-3uuS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 15:58:51 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-811dc3fdc11so245492285a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 08:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1757433528; x=1758038328; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xhvGZRaKvGOKbFuieB7cy8gqgC/YDYs/ewa6xCzMoyM=;
        b=c0nJgP3RmV4HTEfvpmpUBHWnisOSgft/ZOQFnylrSrJm7JpDLdwisVzF1ySXsxIDk9
         /PVJV3GGov6SUPLmyF+BPDhM6/Eg7+ZSHCBElF5suhy/RLAZvtlj/finxuFu26+VZ287
         cytYZZd1gTiBHpHLX7O3Cr9rR9Cua0O3I7OCYEZJWkJJlsFBY8IMXnXzTE6G2OdQtVAK
         Ne8RnfE4xvidYzq6fNgDz+aXm8PFIxaJgquSnm9kUBqqzF7ZcH8C8F3bqkV8dNiQjlO3
         rO3D/PIiZNuuqwNjprf8FxWl/ddWhfcF/8F7bujOKYRH3X0DAr0eEbQAfQce4P3ItyBa
         m3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757433528; x=1758038328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhvGZRaKvGOKbFuieB7cy8gqgC/YDYs/ewa6xCzMoyM=;
        b=OMXVqlXbAE95zuScGPsvf/YBg0NKvwL6FKpPX5jAC1yfBUJirdRCz8JenRf8RRS/SA
         SUNxjrwAB5PW3Mo/ueaeaCCWh93IbquAkWUC1mS5xmMxB5+iEy9hPXSUcnp27f0fSLbL
         UQiyI3Gp5ndt50OehrY7fjwxnIISy90ueqVtGeqgIQP+74e5xQ91ThNcm3CG9vj8dCRm
         qL1+Zv6heU1l/Bu1ERwGC4iCCpEJKLArECpOTfS9KfeTmosLx0+f7Sv4y2mp0/TLN4G4
         LdPhgCxcNJvJrkncMnCZclCH9e3DQlQ31A8opfdmQ94g/VhZ/wibwdheBb57CCJndiR4
         I0fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX3loyT5d+XjJk60sofZPPf8nRab/3x/r0Nle0rxUGreLSlrjYbxZIMct/W0F2qcgIAFdL55iEXKRTI+woTKCa@lists.infradead.org
X-Gm-Message-State: AOJu0YxCCCfYJFSvkXEPEI3svh09dOQmycYx1AYqIP62GGf2mlG+UCsF
	VTdeqPqcGLpongBsCxmJ9UW1gEVexsMhS5gKd37Hz30f97D18u2UkYbxITFAxShskVs=
X-Gm-Gg: ASbGncsMo3abxoDTIQScyrnGRDnLIseheoFHQovubM2gsue+0VjKGIyOLRnKHkVXQMV
	Cdrw/S6hBh8P48UPB2U8/x0E9ZITaSrj7zTVP5OTz4sLjup1FWw88MB39AdaahESimMWrnELIcB
	d166QYDekxH5QtdFWV4uWB2irhAC9JuC8R6RCubg4soHIGZR50zHxVNzjwqtdeBzTLNHE2akZrF
	CPI2XwyIrT7Piz4qn5ae7eO+d2JKZUk+bgDeJHVSEUVaonhGtgDbIxyzgXW106+425HH1t3Zmho
	zhEIpz5w0mw5bAeXoIofOvLjU0ORCqehD2DcQaYoKpWrxuOBi7XT8hICEwOf+PtHxOQFHf/1FLP
	CgdKkcCuJNNglotLJ/JO2X40gpwAMjCAGWRGOgO5A1FcY4s2oppFwl6eOB/5zud1DeIdW+LXxGZ
	WrKbM=
X-Google-Smtp-Source: AGHT+IHIkjBRe7yt4WbOZJ/YpK79iphLy2T8QoB+1HLpvRtSFAYohJmx9nvB2OQluCbq6HB69MOUdw==
X-Received: by 2002:a05:620a:4609:b0:816:638f:4ab0 with SMTP id af79cd13be357-816638f4eebmr916110485a.27.1757433528370;
        Tue, 09 Sep 2025 08:58:48 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b58d4957fsm141532185a.3.2025.09.09.08.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 08:58:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uw0k3-00000003iHY-0OSc;
	Tue, 09 Sep 2025 12:58:47 -0300
Date: Tue, 9 Sep 2025 12:58:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: thierry.reding@gmail.com, robin.murphy@arm.com, robh@kernel.org,
	joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	jacob.pan@linux.microsoft.com, eric.auger@redhat.com,
	code@tyhicks.com, eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	lizhi.hou@amd.com, clement.leger@bootlin.com
Subject: Re: [PATCH v4 4/4] drivers: iommu: refactor arm_smmu_get_resv_regions
Message-ID: <20250909155847.GB882933@ziepe.ca>
References: <20250909154600.910110-1-shyamsaini@linux.microsoft.com>
 <20250909154600.910110-5-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909154600.910110-5-shyamsaini@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_085849_974705_CA023337 
X-CRM114-Status: GOOD (  14.65  )
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

On Tue, Sep 09, 2025 at 08:46:00AM -0700, Shyam Saini wrote:
> Both ARM SMMU v2/v3 drivers have common set operations for
> arm_smmu_get_resv_regions(), except iommu_dma_get_resv_regions()
> call all other operations can be clubed into common code block.
> So to avoid code duplication put common operations in a new helper
> function iommu_set_sw_msi() and call this helper function from
> arm_smmu_get_resv_regions() instead.
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 26 ++-------------
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 24 ++-----------
>  drivers/iommu/iommu.c                       | 37 +++++++++++++++++++++
>  include/linux/iommu.h                       |  6 ++++
>  4 files changed, 47 insertions(+), 46 deletions(-)

I would do this first, not after you made all the changes to both
drivers.

And then once you do it:

> -	static const u64 msi_bases[] = { MSI_IOVA_BASE, MSI_IOVA_BASE2 };

Can just be constants written here, nothing else in the kernel should
refer to them any more because they are dynamic. The only way to learn
the value is to read the IOMMU_RESV_SW_MSI. Thus don't write them out
in public headers to prevent mis-use.

I'm comfortable with this side from the iommu perspective once you get
agreement on the DT representation.

Jason

