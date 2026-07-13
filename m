Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94D6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JWJRfd6QdZf7qlUjcbW5D2kIZlwkQZ3KWr7+m1ApiM=; b=TBfci01BSLydFHafB+KBYsA/BT
	2VAA5R4Hjy7RP1/sjrTelBTd4M7plI1tSRKQpQL5P21JGi4KE68jj8LZZsCu3AQ0cQ4ZixLmrQ8sD
	KowlQIJzFyV50bM33oejDwxkIQvniRMHB+b6/x79Pp266iHtYDTfwVI/IT9IT8bk/wFof7hXNcawB
	XY8zj0ECv1zN0KhcnTfVSWwBbPn3v/9qDebs6rBwaX87jwt0FWNNWHn+zewTUC6D7iHAhIIzcT0PS
	t0embeIR7l4Z+UhEleCOEbRPycTeFQnprjUdKvUtCuY1IlzzMsLmknGbuICneelWDA5HxgL98w1ky
	ubOWd3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMVG-0000000AIsv-2XvL;
	Mon, 13 Jul 2026 19:39:46 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMVE-0000000AIsF-36PQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:39:45 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-8f032b47e3cso27466936d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783971583; x=1784576383; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1JWJRfd6QdZf7qlUjcbW5D2kIZlwkQZ3KWr7+m1ApiM=;
        b=P0fAVFpvK2YysoeXKxDwwyEbpIEl8/Zr9HbihAbh+S9XQgZwj4Jl7uGCpLSJBx8qaL
         ZcG58C5WqsWgVXZ0DjbDS9BnKPelsCbfCHMV/TxxxxpzYx9Xh7UpqZSP8jmerfmEDJy9
         VbSn5EgrDQPO2Btwv65o0U6ejbKP/6GEqUMJQPXZBNGK1wEChepN2O1z17lfIzBrUzYc
         gJYOvbxvd6Z5W65khKYTA11Rs/um0ph5C/1l15p+Xk6bqa+wPD5V6IaRvr1Kmqc6Xxbf
         Hlse+kcknK+VWlhqN9M4D53n4i2xRkZ0cz2DqlmwN0V1PxTgg2KOLvJZFxRphVsbbxSk
         EeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971583; x=1784576383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JWJRfd6QdZf7qlUjcbW5D2kIZlwkQZ3KWr7+m1ApiM=;
        b=tRMh9NdSd90vY2WcOYjlccbk5xJO+2BRAK7YD9M74yKrojMif2SaOoM2mqc97iHjHh
         KvhCe+zpJXclY9zJCTr94BQSe3JUWcBCU0l6MIMO7Nx/UAN70it/LYdDpgpDcK7oQS9t
         j1HEBTEFWA6d07In2uqmVPVDSo7BT4odqj13UuDhSZhqL6Y/q0fDfcB35Tgf/LF98sew
         cLiN51Bul7K306fRjRH8irNUFcbXnohD5qXPCbdC0UK+l0yAjiRmaMirb5fFR3d/4HpF
         pRrfiKptz9wsc0+GCtFj1FIo/w8j/rPfGtfKfOAct5eJcWgQYbv8ss9L1KH5tMOtiYw7
         wQ3A==
X-Forwarded-Encrypted: i=1; AHgh+RrVru1U5F0fqeHnc2dOFhC6WKu9Ftn77FyiV9vUXtagfYA2kBibNErxB4QaT7JL+N6B2R3eMUa4L1OTSnvHEbPr@lists.infradead.org
X-Gm-Message-State: AOJu0YwlXvlUU84XgvbkkycaqO89jjoZ+Sj28P63btpfDuMpfjZX9R3S
	biNPfw+soyojtNN+BkIKZ3ltnd35L5BWbqX7fLuZF5QI3KXMyrHWKVQarT+3xMH9/j0=
X-Gm-Gg: AfdE7ckuEMdc3gRqRT5BRjTuNiJylZ26SEE1Y++cP6nbaLy+5sB7OZSBgKND+UIknnH
	5RQ2V9vm4WfUHCsfx/M2AkiehliOloNZmvsNnquTFfHGjClXoeJS4i0NIhvoL3bqQTga4aBCbkd
	ViQUp/vRU3t5WhvN2iSO2lWgc0QOSDdvRue34cI8FfyY5L0qoUK6sUU78PTnnPEG3fWMZJw2M90
	UKM16VMDr7ImZBCese33H4fHq+fM9qMwZLFHzJSIY0qSlCc5zpcAfEWlBtgRDoSN0+4un84qn/Z
	x8JEEC3Z9RK4y/VXgEuPTW8ThvA4JutHEkNXINUsNqR4BzBVb8pJYAHa0ckkx9NU8PBUxboWfzj
	RvVR7IIL8lz5GbkNMNUM/AtAIO7YZ9Z84vsXvg22fztZ+Wry61z0bPrTy+PTD
X-Received: by 2002:a05:6214:4c8a:b0:8f1:3533:7a83 with SMTP id 6a1803df08f44-90402c68b4dmr105755746d6.33.1783971582552;
        Mon, 13 Jul 2026 12:39:42 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90725bc050esm20419156d6.28.2026.07.13.12.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:39:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMVB-0000000E6bn-2D9o;
	Mon, 13 Jul 2026 16:39:41 -0300
Date: Mon, 13 Jul 2026 16:39:41 -0300
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
Subject: Re: [PATCH v7 18/22] dma-direct: select DMA address encoding from
 __DMA_ATTR_ALLOC_CC_SHARED
Message-ID: <20260713193941.GX3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-19-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-19-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_123944_788388_95C9163D 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
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

> -	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
> +	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
> +					 !!(attrs & __DMA_ATTR_ALLOC_CC_SHARED));

The !! isn't needed when going through bool, the compiler does it
automatically.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

