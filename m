Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B045E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mtig8lXsoUwLD51T1aq3aT1xZ4mrN3No+06U1nAA6eA=; b=ddUf9bYQwJ8Y+rUoDK27y30U0D
	/pbzsIFttKuhaPDkiyHy+PpBRDSdfyp0YqDeKoxwWZK3dq5RBbP3uYri5fW4GvQMVz/FN2Knl/pD7
	P5ZiQl7ddMV0GRHHkdzDagFUNLNYTlPvzXcby28UZ8NEi7LWIII+chl0C6Kc7Ymm86nEWUiNDsAHs
	4FezhTU9YWAfVXvax5d3AmnhJ8m+Of2W7QdGnexNxJwkZFcpsyV5b0WmY8tz9xy+0to7UhjqCK/sQ
	+KUTv+hEMX1b/F7VVLNaQGkOAPRI+a37bZopIuQ2qRkjOWBgLCFI9c1x0Yp1OsauWIpy7EHQNxr//
	VvS4C7GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLp85-00000001hA6-47eY;
	Thu, 12 Dec 2024 19:45:45 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLp70-00000001h2J-1qnu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 19:44:39 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-467a1ee7ff2so4605151cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 11:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1734032677; x=1734637477; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mtig8lXsoUwLD51T1aq3aT1xZ4mrN3No+06U1nAA6eA=;
        b=cKx83gUzbKOyp22K20Qz8w+7+JgxAWVFIIanuXpmplzQ/RR/efs3amE5pjQbe6KPGB
         JLv9DJQ2mtgGW06wp0xJ8jUbtAe+wz62F28F09UdLI5X7O2ARfJfAYUV1YVV3nQBNRSn
         I4nxEc0YQQSTE+zSBoI0n2Rd9BEVAaLbcU6ifhUI4/J1gTlDW0Ons9d09fOcZgbU/g0e
         wGRiKr62fE76VX6E+cCxBcRPSLQiwcbmruSCUKHRt9AGU5C4U3wXcovmdYFLXC/yhKRc
         qWEZF8U7247i9uI/bOGE/dU+3HHrS+jfjtwsEP2CD6umksrMS8xVZdApvyztNQXC8kpU
         2ZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734032677; x=1734637477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mtig8lXsoUwLD51T1aq3aT1xZ4mrN3No+06U1nAA6eA=;
        b=uu7KfXY0XrHWczABtfZyfN1D78JY2yjucmH0+S/offv1WrDM0ylYJho72KywNbR/K6
         KGYQmgS3++aykH/YhtqIgS7+3D8rj+Ex4uPFCC65xOWH71/xo4rAx8QS+PgfS8QS3FdC
         55TUoXcbM2vOtxh+yFShRdmftdcqBwlwdoUMHDNpJ4PYiejDsTwSeSihB5pA2Qu0ixAr
         AO2jjgfptQSRxNnFMLAd9dCaO/VkguMMAiIEBAqJrxmokomr5y1kqpRJgFpxh9yL/fzq
         csxapXvuuGeVvxHtavhFbHqcM+gaqNhejULgawBnAPdeyLDULTOsjfchj9O1cLmN2cVQ
         6+/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+vVQfae4ZwA//I4UEGlb0NQXmY8h1uDfayrK0yvfkZ3Pbh4asImt4tuLNWFDljrNmiXYLe3a5siUqNH3W77Qa@lists.infradead.org
X-Gm-Message-State: AOJu0YxAz/5dqNlzqUchqgRoUMjJdAUAEUFI86y5VTIGHEMKCiFywn9B
	XPl/VLAtdCtXBBY8JyEfKQYLfjJvJ2VJM274APJMUz/3HTV2JF1sf3Y8C0U0bA8=
X-Gm-Gg: ASbGncvqUwdLpjpEbNoDmpoTXW+jljXpsgKkZPFWImx1D5UUq8ExfpHt5GxMGIMD18M
	UwiRZSGNggUeWgXuyH63R5iAGEYZjLkBcOBfQmQGEUhOgdEewfcxlhpkidAAtKkRDd4F4OgK8Px
	b6GLIS5RsTXMuWxzw9+DY7nbCYmPT4Ck3Tp9Khhj1EyXOofI4zn8vfkr4NDiDAocElqb0FHBsIy
	lpC+oFfLAai08L8AzwwJa1LXbebrBMpApQ3PwdZY4vxAQlr5nXvGu0sBv6RrXAB9ywdFvsPQZQM
	mQ4T4PDx3tNOrmdTj2y3ZKCF5LwNFg==
X-Google-Smtp-Source: AGHT+IE1sxaWouFki1wTNuqW4Mldx9O5wExQbsXpYwJ4pEsT62nJIL+C/8F//xL6ak8oICXCgpkwJg==
X-Received: by 2002:a05:622a:1114:b0:466:9f89:3d6b with SMTP id d75a77b69052e-467a156ffb2mr26650471cf.24.1734032676656;
        Thu, 12 Dec 2024 11:44:36 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46783eb0d91sm28376531cf.63.2024.12.12.11.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 11:44:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tLp6x-000000001Zr-0B7D;
	Thu, 12 Dec 2024 15:44:35 -0400
Date: Thu, 12 Dec 2024 15:44:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org,
	robin.murphy@arm.com, jean-philippe@linaro.org, nicolinc@nvidia.com,
	vdonnefort@google.com, qperret@google.com, tabba@google.com,
	danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 40/58] KVM: arm64: smmu-v3: Add map/unmap pages
 and iova_to_phys
Message-ID: <20241212194435.GA5484@ziepe.ca>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-41-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212180423.1578358-41-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_114438_478507_366E7142 
X-CRM114-Status: GOOD (  15.66  )
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

On Thu, Dec 12, 2024 at 06:04:04PM +0000, Mostafa Saleh wrote:
> Add map_pages and iova_to_phys HVC code, which
> mainly calls the io-pgtable.
> 
> For unmap_pages, we rely on IO_PGTABLE_QUIRK_UNMAP_INVAL, where the
> driver first calls unmap_pages which invalidate all the pages as
> a typical unmap, issuing all the necessary TLB invalidations.
> Then, we will start a page table with 2 callbacks:
> - visit_leaf: for each unmapped leaf, it would decrement the refcount
>   of the page using __pkvm_host_unuse_dma(), reversing the what IOMMU
>   core does in map.
> - visit_post_table: this would free any invalidated tables as they
>   wouldn't be freed because of the quirk.

I don't know if the timelines will work out, but the pagetable stuff
I'm working on will let you write a much more appropriate
implementation for pkvm's usage than trying to hack it into the
iopgtable code like this.

Even the iommu focused routines I have got now would solve this
problem because they allways spit out a linked list of all the memory
to free after map/unmap and never internally free it..

Jason

