Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFE3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kt1NNWVp5vzCd+THxZiV4tdGJLfhiT0ZXPz0TueqWMw=; b=qR0LKl/2SUG0wJ/OpZJRVrd9J5
	ar4KLzHNhvzfGmnKGHCzNAdI583uMms3YvGG+fLn+29Zw7d8qw18rDQmpBCOaZVU1I1bkYBH6DXtj
	c4hb3ucedJ0QxCJ7E4F8EpKsYkP74diNdYosXHWRaTDINMBY3InpiwSHRk0uX1qMeH77EeGmk6QcM
	mOdhFwwPfVMCC29YO6usTl7LJSI0lJGYTQBzKX6jp9hd6VkcFXSmNeeZFCwHJrjGV26bSwUmAzkM5
	Il09F4EW8VxG6NTtU84pk9eUi/OmDA42x06vqNS4QtM62r7AtyJDDKNCe6g0N4TM4FATezDIl8gla
	ZdzdNhag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjME7-0000000AHBb-0Sg1;
	Mon, 13 Jul 2026 19:22:03 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjME4-0000000AHB0-2zxA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:22:02 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-92e53581361so231851585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783970519; x=1784575319; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kt1NNWVp5vzCd+THxZiV4tdGJLfhiT0ZXPz0TueqWMw=;
        b=AWjGSJ3NI+pRZzuV5KbMHwMPNt1aaSFF2umWvSudfQMNKQyTu7lsV9h/EtgnlwTVzW
         5m9b4xtn4bDVV3rck6vU07uqn6xqZBS8UoOwaDsvxYJcDhTH98qpuXVQTLMvuN52XIoE
         gJ9VJo/Jg7cunfzrr57yB2OzGkTDR4ZcRmPRKik3V0eLm1jKFAaIdmUlaGHpJPsbNzA8
         UzgIkdgRKy5UUofKSbGWPWUB/G3tFr1HD+hVWAANEuPBEXpd/qrdObyHj1FRG1p8yQng
         sl2KEcmPNvoCBXYA0/P0vdcVZcuXAY8iB/DroU82HXAXInPAgz/l3aWqSwuDUmw31Nyj
         rAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783970519; x=1784575319;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kt1NNWVp5vzCd+THxZiV4tdGJLfhiT0ZXPz0TueqWMw=;
        b=IYT4AY0SESggWHhJh1pDSyvivjuI84Inzf3EA4pLjXt5xaDCL/wBrY92XnJSaQKUac
         TvBHpOXpq2kRCQLyQUMIQKRBp89U6Pj8piUcH4ECzEKOQbt5qcuJwJmFV45Zijs3Gkuc
         ZMS6AGQ5WPU0MmCBHbwHoAnOIfalfXyNbYlEP0YVSJRwLy+24FhwACfGFO7NN6Lk1NLW
         aeal3eSfQZK/vERkwV4xMPJZ2UAOcZEa40JkObrD8JMG68Wv07VaHbBWg+q9R3JH+S3h
         XeC6CVZSg0YlPWVzPwoRJsKvlLI2u3Pmf+UsDhJcvGDNg06XcfPWxcZy5Vrij0gstSLg
         ABdA==
X-Forwarded-Encrypted: i=1; AHgh+Rpfq/g6OBuBi73USxfB+YyERxEUM7LRE0e65/9ivopITd/7WdDI+JKjgK5dPB7JWvkxfOBsd9IZ3UonsYB/ubtm@lists.infradead.org
X-Gm-Message-State: AOJu0YzBoPiFl2J+0QAh8ehK2ZWgtw+E5TVsTzDZy1vs3dIulVRem7hp
	cYGDlFx5HxAW72ObWxXPO+VZraC0AaJ30a9F7g8cN0dyjng96ODgYbRPBJ0T6nYNrmY=
X-Gm-Gg: AfdE7clmSqoQBbQQ9WGgg452lptZSjc43Hu/mFiMy89zLnbRJC5/UUTEa1DkXjVLEWx
	QJIneu0+5O/tN73YlaCPZT23hZ+RxL8ceeAIOrSrNNbzu4+QMZDVBBEKJnTbjeT/RtKEp2v4t+h
	Eg3Ds6GH3ERNZO+3S1H9yE/ULJXkniPJeAFhBsAO7+PD9QRQdDwZsDDNIgZ+oZZkEuERbd0RWVe
	RqcIjWJCDxNOwXLhrU+0YounIVgYciYnPVQqqMnySkjJTsMB1pe2cY3jcQvrbPp84T41Ncxnjy0
	ZPrY+qAcDJoeOnzoy0m6HmwSTig+6pK9oag1d21P7H9mYtYECzJWRNSZIcHa5FpacY6vbXKsIHh
	CA4ZGxcOMtEERGbWVJKDpZ8HiaEpuED/5EAz1mM33LUF7QG/74Av5/TdPiR7kYhdtVTw+oFQ=
X-Received: by 2002:a05:620a:44cf:b0:92b:6805:eae0 with SMTP id af79cd13be357-92ef2c0c787mr987778485a.61.1783970519182;
        Mon, 13 Jul 2026 12:21:59 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cf7ab2sm1122922585a.30.2026.07.13.12.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:21:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjME1-0000000E53O-3cBb;
	Mon, 13 Jul 2026 16:21:57 -0300
Date: Mon, 13 Jul 2026 16:21:57 -0300
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
Subject: Re: [PATCH v7 10/22] dma-direct: use __DMA_ATTR_ALLOC_CC_SHARED in
 alloc/free paths
Message-ID: <20260713192157.GQ3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-11-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-11-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_122200_937301_E594EF63 
X-CRM114-Status: GOOD (  15.74  )
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

On Wed, Jul 01, 2026 at 11:19:14AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Propagate force_dma_unencrypted() into __DMA_ATTR_ALLOC_CC_SHARED in the
> dma-direct allocation path and use the attribute to drive the related
> decisions.
> 
> This updates dma_direct_alloc(), dma_direct_free(), and
> dma_direct_alloc_pages() to fold the forced unencrypted case into attrs.
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/direct.c  | 42 +++++++++++++++++++++++++++++++++---------
>  kernel/dma/mapping.c |  9 +++++++++
>  2 files changed, 42 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 0cbf2b0835c4..98e47e0b332d 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -192,16 +192,22 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
>  {
>  	bool remap = false, set_uncached = false;
> -	bool mark_mem_decrypt = true;
> +	bool mark_mem_decrypt = false;
>  	struct page *page;
>  	void *ret;
>  
> +	if (force_dma_unencrypted(dev))
> +		attrs |= __DMA_ATTR_ALLOC_CC_SHARED;

After going through what was left of force_dma_unencrypted() once the
series was fully applied you might consider something like

  dma_update_attrs(dev, &attrs);

To remove the frequently duplicated code

It is fine like this too

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

