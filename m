Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5D6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cH1o0f7+Xgp89WLi95K+Rx7Uq4DeC7XdXtfbyGqV9hg=; b=rg+dv/DHjlWaVOMRmGKB92Uy1+
	LYrr7fDTryH9zs3NeBOtS3mEOGAwXXoaYjnRIMQbEB4jicDvvgYgDkBzy6bcWxUs+iTjEtkILstlw
	odqeUcH5Tj2g5G9aPv67a8imRpvJp6XynSwHWVX+ddvvV5kQF5Fj6t8UYDiM/cH43uO6uU+X/cljF
	vLjpRsEwCufGNqgXDA6HRW5MWCxtFx+C7imdpkC6dbaujCygbnF1tb5REoIQ3HEpB7BTnhcw8Exf9
	Mcii5zqw/1HvuVS5iZw0fkE+NgqJOrTXvLz8eBWuB1a1RFxkGbeNotqtMCDDChcpG9JnxIzbRgyTV
	GYFw+1Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4Ls-0000000EtIQ-3biQ;
	Tue, 07 Jul 2026 11:52:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4Lp-0000000EtHs-36U5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:52:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493b8d99342so26065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 04:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783425152; x=1784029952; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cH1o0f7+Xgp89WLi95K+Rx7Uq4DeC7XdXtfbyGqV9hg=;
        b=vDpazQ3l5aO27ntCwnWIgMqdVD9lwyuPkyGDvlq0V0EEjqzagiSOr8psfJeuNhol7U
         Iwj7ZOoACy8gO3Pf745ahTGy02bQmrCkmz+LRURful3jiKtBy1mgF48hGqzeRMY370JA
         0aSBZG/kYapnI8m4xTr14nRIKcZInyyWF+dML13qudf+bt+Zq0RIRMuSNmi5sdsWWFfC
         ww1KZVhabxSiB4I5aDfvIWiDv+oisfh+Pz+PqN96q+x5dV7qeOFiC8odxq7B29PANxDQ
         N6JD2INQEkOJi1XhaDxXB++GFdAxjKcgXL4afkXFY6rles5VZ5HvHVjUIiCE7Ji4OhbI
         mHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425152; x=1784029952;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cH1o0f7+Xgp89WLi95K+Rx7Uq4DeC7XdXtfbyGqV9hg=;
        b=WGDpIASqFehGpENFDAe0G2fOfFjcCJoun2TUA7hoFeJFHQlJ73ClQ+zHutvV3e72Gf
         d35R2kYtLEYz0PiJjC8xmQnYRAvurtRF7V1e3X5suiPdWsYwliDmqdb4cNwxJIywWJge
         Kccjb1wGBdBakFKc6Q1/KDwh7z8PMBq68435NOij2xjOZT069lqdxBuZ1JBZ0nXYwzKw
         P0rga/qEstKI+cAz3H03ICde2N42/Viqvd62uiCwgSilVfa4jgeu8M7fhaC4LWk883vB
         1YPZQFxmbFdgH1CPK3G+gfuwIlEdEkmCy1PvXmKYsyZYxolBDDGQA6X9HUNGzXFF5U8P
         l+Rg==
X-Forwarded-Encrypted: i=1; AHgh+RprO93kUUryhzooNHnpVf3bbn3yBg6/hVcayIlG5Stjga0f4fOYBY40Pln1XXKsqB3ft2gUl8eTZM95n3HW5OjL@lists.infradead.org
X-Gm-Message-State: AOJu0YzZkk4h10cXqd7DP9A7RWkisM3IA/orPD/nBp6MTvHo7lyhZkoi
	FBQC5oFvyF+AG3JyXbmw1/Ey2vAL+dXYjvYjUrhJaDuyrx3oYk03JOuoCQZ9Cv7OAQ==
X-Gm-Gg: AfdE7cnjLHWWHszzcZt1SQUItz3eLrmJ44mBUZcIIHbFIi4Z8VsipGWt59cYPgRC9QY
	YIlMH8+Nq8K5apuqu8xuS+nu4oGJNt8/Pa7lHmArEa/XoDjdxcZHeDe4P4GNe8eYve3eHSkhN4C
	Mg/FAuBMq6urov6W6W9H6ahVLeivAgraBwSfhEJbS5gmu/mr25Ajlld7oBbq0jPzi1BeJPy3XUe
	xShlsZlEE7XX7AQKHfqAx2SHnnRgs5OQtDpmfzXQqcnS4Z5FBZkZ/VW7cFMfReh9+RNz32GvsOe
	B8xbhvlXrnLCz/XrvnuPQ/nJHg/fcTuvW+Q1EkfNzBFnx7ag6dG7aUmGw7zsU37XPcdk7WYKst2
	xc0oX9KL9lTXj1XRrQ79Pm/eLoiY7ZDpfC2lt4bwISDMXzjfRnBtAQkCF9ErXCodOu1/+H8ezLt
	1CrZke31872MzU1fthyFww762pgq0v0U09lU7ktJI/q598V9zO
X-Received: by 2002:a05:600c:1c0d:b0:492:203f:a378 with SMTP id 5b1f17b1804b1-493e121b8cdmr1175185e9.8.1783425151514;
        Tue, 07 Jul 2026 04:52:31 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f40912sm47378305e9.4.2026.07.07.04.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:52:30 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:52:25 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v2 5/8] iommu/arm-smmu-v3: Precompute the invalidation
 commands
Message-ID: <akzoeexW-4W70QdU@google.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <5-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_045233_807511_1A4A424A 
X-CRM114-Status: GOOD (  14.97  )
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

On Mon, Jul 06, 2026 at 01:26:42PM -0300, Jason Gunthorpe wrote:
> Store the required cmd data in the tlbi and just copy it out when
> processing each item in the invs list. The cmd form only depends on
> if the instance supports RIL or not, otherwise it is always the same.
> 
> This avoids redundant calculations for each invs entry.

I do not understand how does this avoids redundant calculation?
This would be the case if the domain shares multiple SMMUs,
otherwise, a range TLB invalidation should be unique and can not be
reused.
And in that case I am not sure that would be noticeable with modern
CPUs/compilers.

Thanks,
Mostafa

> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 132 +++++++++++---------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  11 ++
>  2 files changed, 81 insertions(+), 62 deletions(-)
> 
> 2.43.0
> 

