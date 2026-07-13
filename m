Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE77C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kWy2240zOoLDDzwtKisgk31mZ51kjxw8fZyoUW4j0E=; b=cur5irIL1IWAKCiU0KFIPIjum7
	/eDyr54M7KfKD6lJ4duCESwqBrCCZPiV9FNoVLUmJHcINd6ZVbittKRcZZ96AXnG+sdQOvh3f3Pdj
	/wH8o9Wd09aphRktazkpnIPlwjR9wm1N9SwHk7SbH6pQ/2tk/MvyzLD8A9NSxf/MLzmj2MI8n8ze5
	EdVlAjJbzP/RydBx6dQJn9KO38O/stMBityvfnHypf32T8LVNuPC1GdqAxay3tXsS5EF+xmtyfwRz
	RurpQ+A6InIG1E8qxd5V6kdqlCNq82J3X9GtWZrVJ8d6CUpJpHc0+ojcNY4squz0M1oX5coDPHTYz
	F29z2X9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMH6-0000000AHXG-0JbK;
	Mon, 13 Jul 2026 19:25:08 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMH3-0000000AHWm-3MEI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:25:06 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8efec2c28f8so1580786d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783970704; x=1784575504; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2kWy2240zOoLDDzwtKisgk31mZ51kjxw8fZyoUW4j0E=;
        b=kIrPICoUBujFwtgX9s0l74rEAUc43hSg3DvfIVblQKS+qAgfkN1nDPmNEfhdw/1AyE
         LFQhory3Oqiox/n21sqdo9iBsW1OLfHFqx8lmHJiWO98IRd3iqo/QxSO30ckQV/xgaen
         wf0vaD34Rxnn3l6ELxt+7SvDcmjbZ8q0HD9BdMB6mA/L+xoHHX0S6BEJ+Q1zFCflOFkG
         dBpYHJf2mVwY4ADkKDLj0c/jWWRBMIb3sp8P7CKBvh/8GgAAibFW9QR1MP3m/N9JV9YW
         Td+Tt/1CIEYf1qup3S4out1Is1Zj1FD/h66SjgEX0mzFIFGwuXvyFP9y1XRbaBbTi5Ma
         OXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783970704; x=1784575504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2kWy2240zOoLDDzwtKisgk31mZ51kjxw8fZyoUW4j0E=;
        b=Mv87MXVgk7m9DG25iRjtj6bVYD8yLwAO1+rH4KDx2LTzbgVpFAX+yjmg4B9GgYlsuC
         iKsGLuzqEmQwljB8cbIw/7sMIyKOkKgYb8FW8n3CMmvDRvYh3qYILt+iIrD00FzR1iB5
         r6tTHdr7tN8ZIde8TA5CmPfB5xiN7cIzOVjM/dky6RrEkMWJVWTxAsADIf3Uqox+kGMH
         KBi1dVLDFxfScYTTsWpqeDzKhiBH9PYfywDsK6Z0GL9IB8Di0BdmmYOpBF2VMFzRkJ2s
         UiKjusoAB7skMiLjruiaSLbJC94zYUCZCoLkRZPD1rdEReY7azsbeZx9PIQbKHl7ANF6
         OUEg==
X-Forwarded-Encrypted: i=1; AHgh+RqCE6ztS7Va2fAYucuTuOpPXwaAj+0W9M1GiO0+oC/8Vx4X5QnLXfABDSADXxqeAOyAFMMY7LP1dqE9s6HsV4h6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Y+OylZlew60j1olL9+O18Jkm+7QZAXAzooYIHmnn6iNJsHFw
	9CDAZXZ0NaZY/mwe0YpZMRNvtJev5jwe8XdA6EKLV4hdq9aO0sVCTZe/z/Zu8yn31Ys=
X-Gm-Gg: AfdE7cnmje3OEXIGPxfa370ADOq8NWG5lksPdGa2vUxD50WpZiZ8CqC0gEcULw+niKw
	ygy9MjC21DgTQi/VWFH6efjOnPImPesfjdgyS4TsFHptNAyqOt9ZZk2/is+rAJ6wLuuKCksEGuH
	kkiYOBykXouj0JoTofmlUKqke7mA2+KRrXtP8qNzYLo/k6QrYJI/7xmuUcpj3+wtuxmlZ0wg2Jt
	yWJ4GJOGNo4ukV2h9Oc8Nx+hRN57tRCKI252NmeipaWo9HstJNZFpXrP0SGqq641EJ1nBVSxHnA
	BBDjfLL7KK931XFbOMN+RWHRX3v9h5omhU7U7c7SyoXYUVhy61lIYUD8775oVJN4H8/krQFw+VL
	sYvO+qfxCkBvqHcH0m1Jpqb9ZBsTdr6Px23QIOl1OVd/VskluXgNPK+Ryfl2/
X-Received: by 2002:a05:6214:2f8d:b0:8ef:76c:cb18 with SMTP id 6a1803df08f44-903fe450e81mr122377626d6.11.1783970703547;
        Mon, 13 Jul 2026 12:25:03 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1da1bsm137170026d6.30.2026.07.13.12.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:25:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMH0-0000000E5NW-1O3S;
	Mon, 13 Jul 2026 16:25:02 -0300
Date: Mon, 13 Jul 2026 16:25:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 13/22] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <20260713192502.GS3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-14-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-14-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_122505_857165_B53DAAC5 
X-CRM114-Status: GOOD (  12.98  )
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

On Wed, Jul 01, 2026 at 11:19:17AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Teach swiotlb to distinguish between encrypted and decrypted bounce
> buffer pools, and make allocation and mapping paths select a pool whose
> state matches the requested DMA attributes.
> 
> Add a cc_shared flag to io_tlb_mem, initialize it for the default and
> restricted pools, and propagate __DMA_ATTR_ALLOC_CC_SHARED into swiotlb
> pool allocation. Reject swiotlb alloc/map requests when the selected pool
> does not match the required encrypted/decrypted state.
> 
> Also return DMA addresses with the matching phys_to_dma_{encrypted,
> unencrypted} helper so the DMA address encoding stays consistent with the
> chosen pool.
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  include/linux/dma-direct.h |  10 +++
>  include/linux/swiotlb.h    |  10 ++-
>  kernel/dma/direct.c        |  13 ++-
>  kernel/dma/swiotlb.c       | 177 ++++++++++++++++++++++++++++---------
>  4 files changed, 162 insertions(+), 48 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

