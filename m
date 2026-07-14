Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04B4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuDF+BU2wT5tVoACVa1l/BwLN4UR/axOeynKCGX6Iio=; b=u9JJwuDJGR/DCfabGtLdaLeIGG
	Dkj0lKhro6dcdmAaorWdaWhykJiEHfh2LnXC1n6zwNmuSX+ldQZ83mIx61HByikr2Q3aFnqJfond0
	3H4SD9DkNPvQQC+eDZXfh44nvzxogxASgp50DSB9t9k6q8owwopU8QAJNZTfS23H01LiY53bfDere
	J1qZe8HAEbtEdq67NyfyCQxtAzGk9eCKIzz1cpfd4RToV2SKtASmgOKN/34RgvtqOMtlDRdnfLbia
	BfuoRIjYl91sLPEYn7vnZxfojA8BG6ksgpl/bv+4D9MYg44JNeDxmaB7c3ETVUBmViPzX+MjGLX+Z
	Blh/F8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcDj-0000000BvEk-34VC;
	Tue, 14 Jul 2026 12:26:43 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcDh-0000000BvEF-2hck
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:26:42 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8ee88fce572so12373046d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784032000; x=1784636800; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AuDF+BU2wT5tVoACVa1l/BwLN4UR/axOeynKCGX6Iio=;
        b=bLN6GKi+mzza7ExeGpEwILBNLcQ4FbhFYOLXtCHuvrNE+ftaDDOQUEfCMNu6oNmesQ
         Ghj/ZuY8lq3YHcwjqx8UJnMiZzZ6glT90cHehse+0P2htHFUxkCVF70zguudK+TNnWKr
         BT0B9FR/JzxTBjEewfefrqwTR0+LEr+32SsRO4tJA6m9x50YAD9c3E5ANFP6xwswkg1V
         3MUSJ0+MEUwNM60ChhdlrUnEZLjLoBivFrx1zCSGcA6XI9HIQ/87QChA/TUHsZnuHipJ
         1sMycpHJmYja+utIfyZsMCBM3BqmKGZEWp6582kxWMKs88u1cXqHByVEYo/Kkpysq57Z
         vjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032000; x=1784636800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AuDF+BU2wT5tVoACVa1l/BwLN4UR/axOeynKCGX6Iio=;
        b=KkcVuwFvPGQUcixMPI62yraPEqZftx4HQ0otq2pP33xo5IcrUGwIQR7/gmaQhpQX61
         V/B2ARV4oHympaiH7J/lrkOpGW8pkjEmbvfW2Fe5TImQ7O3r9s+qXsyiUII14FedL3Y/
         wKEsga2DnrgFaPK760dlyuhSqJ0YWPVFxE7ZwlDu7QM2RicnkMYMSw5PpPX6Hgwb3JmH
         RH7ZBmh1EHUmHXk71ilUsdjuCbdKqoXjKNozInbZP3afxUo9Z5UJYlnlymxB+BKVsxmz
         63r7WLh+fZ6m9RXaycqTz+Gk/lESn9xOc/9fPtIk6CbMQ/2gh7sG+Ol43FL0PFhBgQ7r
         CkFg==
X-Forwarded-Encrypted: i=1; AHgh+RpBhJ6nFX/H9sieUPYDVaxWM9Ji7TsU1J8dNwp/osvX91/GAs6xgOENHL0bWJD9T8kQ+jKkH9wK1sUz7epLxwnW@lists.infradead.org
X-Gm-Message-State: AOJu0YwQvyeBB4LkgKvSbuBdYR4CnTy9pKJSN7JDsEIZLcKhUnvP+EFp
	h3U6czgEeKNrNWykNz+S1msX98nt1jYaFH8nNavSmQppnGTRNRqOnMt86OaS4FLqShQ=
X-Gm-Gg: AfdE7cnQyFwumLw5+3wi8UL7v1ZODifUmPk1Mv74Spu1ZeqTBR65ew7fLkB2WfubosL
	jHfW3ViaCdSRquvzAlaJCNYCW9dECYD8YGISqUBvZH1qNKmBKHajpzxe35rKbuDIb4KO5ivhplH
	cr+qTOnDn6wYMdG7agrdDdhnSE8tTOxoXpq+wF4pA4o5n2Len5sTUKwdnPuyy0UrDaKMKJO9HvG
	95EfZUsser4F+tUct4fbsmZt7jYvfpEML2WHFfwBEgF8ra0tEYx/4bw+Irox5nLIdqI/h+qG5/J
	VxoChsELacamZACWN3kM9LkKH6nuz+T1jwKZXXVqdX5lcTMagQRf/Z3JI+QLVHz2uQ2e2Y0InBT
	ga4eP3kpFdlcfCGdYjxZUAS/b4JaDjkiFGM+XpIjaPSOvFViUZwfK+oaQ9YFZ
X-Received: by 2002:a05:6214:1cc6:b0:8e9:f5de:d629 with SMTP id 6a1803df08f44-9040423dcecmr141353846d6.56.1784032000167;
        Tue, 14 Jul 2026 05:26:40 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1ec84sm168106996d6.29.2026.07.14.05.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:26:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjcDf-0000000FRvu-0Ugk;
	Tue, 14 Jul 2026 09:26:39 -0300
Date: Tue, 14 Jul 2026 09:26:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Subject: Re: [PATCH v7 11/22] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260714122639.GH3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-12-aneesh.kumar@kernel.org>
 <20260713184810.GM3133966@ziepe.ca>
 <yq5aqzl6mc00.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aqzl6mc00.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_052641_692102_5D137973 
X-CRM114-Status: GOOD (  11.80  )
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

On Tue, Jul 14, 2026 at 09:57:43AM +0530, Aneesh Kumar K.V wrote:
> >
> > But I don't view this as that important, the CC hypervisor is probably
> > going to use the S2 page table to force cachable on all system memory
> > so the non-cached pgprot is a NOP, but the extra vmap is wasteful and
> > it is confusing.. So maybe a little fixme is all that is needed here.
> >
> 
> Something like?

Yeah

Jason

