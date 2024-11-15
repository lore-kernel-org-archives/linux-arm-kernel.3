Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B03D6A223
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 01:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3aWXJDvKxrgbp/6ctsqOes9P0Tv5Ujk4CBOngYzj++k=; b=WvUpI44eJEfx6hJr85MjBFkaKD
	hUPXpyPnv9tO6BupdJYH9N/UUcaaYVfwE8OGWWcVdb/eYkeYo3PE6dV5u8Li4qYyBV8K5y08rnW9H
	19YLbZZ+WBZx5Cu1xAEQdeW8Y/uo3rf4Io+LWgxsCjX/33gdIwtAe3cu1tqhsZp7l0SZseiC1/fDL
	LjKIzZTXkHAQAH9w+lR3dVlYHukfGFSJIIXSFRyHrHi8B/7epoDcTprOUYc0pqPFxHwK7N67omoFf
	gmaCT/TclK1QqkNPjqmnc4FDTgrkufe63w0pgrQiow5w2KlLKbIk6UN+ccnIOgb6femukaY7jCPgX
	pmEBbmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBkpb-00000001Gf0-03VN;
	Fri, 15 Nov 2024 01:09:03 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBkod-00000001GZz-0g1v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 01:08:04 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6ee3c27c0e3so15092857b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 17:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1731632878; x=1732237678; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3aWXJDvKxrgbp/6ctsqOes9P0Tv5Ujk4CBOngYzj++k=;
        b=GwoZpIGB9aFjJKkFZv5DdQujKgbQY91OL8eP5KkXFa2JIOwM5rdE0XXRd4M/aQYWD4
         l08vYtepMwBjv1cx0WkWf1jluO55IMlnHSo683vD5EL2pWT+QnIeiie+ESyGH5h4+/a3
         pWfQ+g1v5ieSECrjEmgZwWM4OfMT+TM2bfhf9r2NT0OeTfJdD3f4q5+kjfA+nseLEINu
         OTqsH/pIKbcA1WT9/1nMSBQA1cOTK/Mfmb/XKla6QrYTPH6/4nQWElVVlYaNrGvaysdL
         mEIw6jxilXSuLb8EAS05LQ0CHwYN11PXS3GsIAJnVIKBgVLWq7z2ET9n2tmiC7nVxiN1
         Rpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731632878; x=1732237678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aWXJDvKxrgbp/6ctsqOes9P0Tv5Ujk4CBOngYzj++k=;
        b=Yv4MmQn1CcIZhJRoDjtYHW+CykHIknAxqDc+lAJ/UR6pp80eYa4rrZR6ZsgIZE10UC
         dGWGsfZ2k5rUjrJJm7wQVcRsQEQC8vDb3tJe9isa4QHaKRrzmmWG3g28JGaV5XBGBfeS
         BX9bs7oRueFt6wRf9NxtfAsue7401f3IrbPzhZz+yUV1dSi4UO6PmUcjn8sPMClS4V8v
         UfyLvyZ5XaskbpOLLwQhwVRUE/W8WCua3hAyTRDr1uQn+hCJIHIyr+G+x3guVxza/hy4
         gGbrqn1Lm05hTJSphNyjeLzgxE4Ipq/t/035yFCxDlOSlgRCL5PNaTcP8Xde0hUVgHfF
         qqVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz39ti0NQTosSrcRAjj5K9OkmMLVEZJwPtk7yZNkrbC+h7AMn72SnLklp6OINZbJ7Oh3Yo/K5PkXeHwX83mZj3@lists.infradead.org
X-Gm-Message-State: AOJu0YxA6v+4duwEwse95HztFtsS8R3sW3ZcgpJIFbOAduZqno2AVXDA
	3RNBiGRwyVAFeZ2Rg2/e6x22WND2bDQotYGYTXkr7FSwmQ8G+VcLJOMEQkOZ96I=
X-Google-Smtp-Source: AGHT+IFbzaNJ9yX/vZFqwFt8LqRMXX16nQ2JQuel0sEYgbV2jhBLReqJAN+HyqsCdlHeN/ugBBKRhw==
X-Received: by 2002:a05:690c:604:b0:6ee:381b:eb74 with SMTP id 00721157ae682-6ee55c2bad7mr11848267b3.22.1731632878617;
        Thu, 14 Nov 2024 17:07:58 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b35ca2f72esm107056085a.78.2024.11.14.17.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 17:07:57 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tBkoW-00000002KO4-3Gj3;
	Thu, 14 Nov 2024 21:07:56 -0400
Date: Thu, 14 Nov 2024 21:07:56 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH] iommu/arm-smmu-v3: Import IOMMUFD module namespace
Message-ID: <20241115010756.GB173265@ziepe.ca>
References: <20241114-arm-smmu-v3-import-iommufd-module-ns-v1-1-c551e7b972e9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114-arm-smmu-v3-import-iommufd-module-ns-v1-1-c551e7b972e9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_170803_335340_8CD1CD21 
X-CRM114-Status: GOOD (  12.15  )
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

On Thu, Nov 14, 2024 at 10:42:29AM -0700, Nathan Chancellor wrote:
> Commit 69d9b312f38a ("iommu/arm-smmu-v3: Support IOMMU_VIOMMU_ALLOC")
> started using _iommufd_object_alloc() without importing the IOMMUFD
> module namespace, resulting in a modpost warning:
> 
>   WARNING: modpost: module arm_smmu_v3 uses symbol _iommufd_object_alloc from namespace IOMMUFD, but does not import it.
> 
> Commit d68beb276ba2 ("iommu/arm-smmu-v3: Support IOMMU_HWPT_INVALIDATE
> using a VIOMMU object") added another warning by using
> iommufd_viommu_find_dev():
> 
>   WARNING: modpost: module arm_smmu_v3 uses symbol iommufd_viommu_find_dev from namespace IOMMUFD, but does not import it.
> 
> Import the IOMMUFD module namespace to resolve the warnings.
> 
> Fixes: 69d9b312f38a ("iommu/arm-smmu-v3: Support IOMMU_VIOMMU_ALLOC")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 2 ++
>  1 file changed, 2 insertions(+)

I guess the build bots don't run ARM64 all mod config?

Thanks, applied

Jason

