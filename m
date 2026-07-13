Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4B6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTUChJSUQ7qBnpi6xNUNbqkdyOGkeoHtaVMHI6/gjvI=; b=YY9ZiQRh/jRbPmkLDVTr6Gb8b3
	DeA1KNDz2dB/fZjKtjm2637tigvGufdIFeq2Ch80ZrKtNR8urNzzdFIzeOKisCj+SF37TOWcpJK/M
	4uEQNXuelRiOwp1QceaPQViGF9zBqMMWocUv+mZvmlkKGEflB4fsx/aXdKjMk1a5Ldcf19wRbjpDG
	IKMUQv1KAPZ84cWDlMZo/l+dOwQm9DY0wqpUuWzKV27/hI5mRHD5URyKBgaVGx0RcMDVgiQc4UvS+
	pQPObYUjeN14aOWuf1Y5+kYIS4DQDbb1qjFG3dSOoS/5J8FEWpsPR3qfT6zznJX97dB9Y97iu0HzR
	sJVOOO5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMEg-0000000AHJr-1Tkf;
	Mon, 13 Jul 2026 19:22:38 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMEe-0000000AHId-0S4j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:22:37 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8ee88fce572so2383306d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783970555; x=1784575355; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rTUChJSUQ7qBnpi6xNUNbqkdyOGkeoHtaVMHI6/gjvI=;
        b=DnS7O8i0TRoQmiApolRcalF8eLFkJZ1sXbFn1M+1NcYSUGCW4jNC/csez8VGf6gnFZ
         M+4o33mOKZYSA7mtxTDAZIBW8i2zkK4+k1pFw8owNYrzS9EORaZUxHjZIwqcSxmqApqb
         6KObJk79t2nFRNckhDzYHE78bN2VhTTv9OPCANNJfeceyGhJ2iFANH4QtLNIOBeDIe/W
         CkMkB3dOYEmpc9QuKtkS8L+ZTIybwSuAOccHINewI0H7+kY2WMjhOhhi2FKXQ/lUP4Hp
         qS2JHiI879sJ7fF6hDOVXvjD4JaJlSUG7H7Xxd38EJGLgpC9GogbZa4GevsN6yd2kaZ5
         neug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783970555; x=1784575355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTUChJSUQ7qBnpi6xNUNbqkdyOGkeoHtaVMHI6/gjvI=;
        b=k+3lRgnGZjnFog+LLhXXoOkT6DEmACKrVpKz/6dwelq/fDob2pDYaw93IM1ypld0PM
         AAus1Ft9boG9HK1dpNwBoeXplCqCQrVHe15dJBCxjsdsx1h7U6hR45tfYexWHSjFZ7Rx
         dB20FASQZqfd889oohkH37YCgSzDWf6f5MAyR5Y0P48HiO4J10ragcyJsdzkfn7v7MJw
         5XgoRvEkj7Yb8fOWU7afkSwIhIKHMM59qGlLZ03z156rXPhyfuZ3sg2BeNak7EEnPgZO
         zdIhD6fYM9WM5QrsGNHnsJnMR9Fx16b3Gst2ZfCOd8q9FFXEEueMW8uikUDcc92fggBA
         RqrA==
X-Forwarded-Encrypted: i=1; AHgh+RouIkRZ1C+whg0/jptJkQ5yXB0EuU+vQVnmOpCNC9ij9R1pjP03b61FtK/oNRYtMINUV6DrfChtITf4EOz+21sO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7rzAv7X+aBN6DAqxx1v98tCeOoaEdbpRl6eA/zpwXzMTsnIvV
	cDGROfUOcLWNPTm9pDOjNJv8pE565M4P5maaz4naE+IRphWjqsGkYnW11WxWm2Cq5CwePohGexr
	BDpvG
X-Gm-Gg: AfdE7cnE+RkKgfIrT5MsPmD+hKkoHfA7jtd0OCTictriJQMpGVnPZEcX0bmDdTaE2OZ
	e9IVa4etyESnEPZaf6WcVPYkE+3fCzM33HN7FgtkYwAH+QGbWwnmCcPrUVqA0UW23SL81f25K65
	ISRD6aTXAOR2iQ9ElStB/ZQCr9boV3MX3HesUts6mnOKQraT+hxCqcTc7ve9jPuSXi6kjbfZ044
	WVlEj812Kcqcra1nPJkhE+IJZozI9/pa8TA9GX7mgb8/VY8h2OIMRHYJgRZLcJtJLdITnx+biq3
	MceHoz6jg1K2wY7NxTFsxFg+zQlW/be23fkjEcc2Q5eJ3yVGsxa6L4AG7UAFIx+CFAqp5AIBbJx
	gHHv9Kp9V8QhvVWRwdDBkMU/36d/58X4CbdZ2g3XLOBzMuxT1RLZgkypIgf+KkcqW+RL0ZKc=
X-Received: by 2002:ad4:5caf:0:b0:8f1:2607:ad86 with SMTP id 6a1803df08f44-90400b8b562mr134619656d6.4.1783970554874;
        Mon, 13 Jul 2026 12:22:34 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50df5e2sm138736336d6.4.2026.07.13.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:22:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMEb-0000000E54I-3Zkq;
	Mon, 13 Jul 2026 16:22:33 -0300
Date: Mon, 13 Jul 2026 16:22:33 -0300
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
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 12/22] dma: swiotlb: pass mapping attributes by
 reference
Message-ID: <20260713192233.GR3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-13-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-13-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_122236_160612_87D8382A 
X-CRM114-Status: GOOD (  14.07  )
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

On Wed, Jul 01, 2026 at 11:19:16AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Change swiotlb_tbl_map_single() to take the DMA mapping attributes by
> reference and update the direct callers accordingly.
> 
> This is a preparatory change for a follow-up patch which updates the
> attributes based on the selected swiotlb pool. Keeping the signature change
> separate makes the follow-up patch easier to review.
> 
> No functional change in this patch.
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/iommu/dma-iommu.c | 2 +-
>  drivers/xen/swiotlb-xen.c | 2 +-
>  include/linux/swiotlb.h   | 2 +-
>  kernel/dma/swiotlb.c      | 6 +++---
>  4 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

