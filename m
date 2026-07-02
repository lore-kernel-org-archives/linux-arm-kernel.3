Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8BBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHZVkcI1dGlitqBERLzcSZUkSvuExam94MObbuJvLAQ=; b=1gYyKpRi1jPllOJdhbAAWD9MnY
	UorHYJ7fQLJr4bUlpSanixHAwunRUIxpOKgdtqJ9SwpD0/1rXkmbqeX088nP7Y8TZOcs6u2UBuErI
	iQ3JSdGtDlNQakrQN35akmqaaJGnm3zhJbzi4PYTer2Xc1gH3nIijaSWm/qjZ2MLuZCHPrAXCEXML
	yGTJZ4CTiuq77gSnFdTOqmIIW3Mt290EPUeSQ65fJa7IFsT+6yb8xpe+/VkT8TQfgxr51JcWrVBV2
	riFzZy0WvnRA+tMrsiDaooPU+n4Da4BaO5cagpmePC68LhwnabAzc5vyL3psEkKUlBSg7VRko1+rA
	YV7EtgeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIhy-00000004i66-2J41;
	Thu, 02 Jul 2026 14:48:06 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIhQ-00000004gIq-0OAl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 14:47:40 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-51c16ac21acso11595291cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783003651; x=1783608451; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHZVkcI1dGlitqBERLzcSZUkSvuExam94MObbuJvLAQ=;
        b=UTpNLupDPKEKkiRYzzI8zvDe5KhwdqU4c3QBhUYP8gYf+JBkcJK9diRXq6dkK6S6ti
         hKWDCk/FEDXXkWs+ry+30VTMdoTy0qNdt1M/+Uqm4SXWIdLuo+kyR05J+K4Lr8HMAoEe
         M5WJDcL5vtNdqPwkHLHH1kkd6xoSypOcj4AfC6+nopEOy876rvrgkZ3hbX220IAPMMCy
         3BhtUe5WSKNvj3VGEzvh/v1TPX2Txa25bAJvSPbUxBuPYUpIxPVqpwh0M7BlZGiWi3UX
         NGv1vkOBTONifhWHAhu3hin4LkdryxcAIowoYunSAQxhma9jqXDbTHDQ4/vQSiKAW8jY
         NCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783003651; x=1783608451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHZVkcI1dGlitqBERLzcSZUkSvuExam94MObbuJvLAQ=;
        b=MyreAImuCMPlwHo/0de4dVvyjkHvpep/NL0/XgQbFbIsS+OWIJZwDLdlxMZh1NRqvR
         TjUu8Mg2bmXtg5wE0xL3Ij9Z8YvbUUNhp8kv7h4L0P0s4miNaK6CFUZjZVNMuX/6Axfx
         atXmVTScc65FyoS/vDD2Pgc8lV/dUT65AjBUhUOkt8G3PqYO2xKGDnGE+8hcqFhjweuW
         uyM/CSevmF25hMm3L95xlp9/9hyUBEjP9bOxCEBq9e8rOPyhj5H/pheE0hrUG5/ihJIh
         aMv4qPd0duVFVv6T379HXgvlz+9F02psKi17e162Lvpq8b+AlEpDp9IZOXkH/ur/4aS4
         xVyA==
X-Forwarded-Encrypted: i=1; AFNElJ8oCixcwQjlqAXG7kPyEfGYGufxLC/eGp4iSzWxgQX+RRtAZufQvIeKBEG3P+B/mxXat+W8K/XrMNkBxGgjmlbQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5Yh3MBgK9XV4OZwxa+LIfIroqkEQtm0NOVmZzoGL3tIz9KiEd
	J4BkhIyxnpxkC6+8FHd6xIiLACPiNnfoaLYBKCg3wTanay/9pdnEp2G7NCEe5oMmesM=
X-Gm-Gg: AfdE7clHYSP4+/roWP9RQvL/MREGaiNMPsWPvVekiDwFnVOljvEU8RNfYyQ6Fav/oRQ
	1d3rnXSeiXBD/u+gJ1cdCZoyYlV3NjysxCQpQJsIHYa1GZDjcfUtFY2jAgwAZ5M/8ptSDGCHFAG
	g16Qa+LGTAnW/3ZwO8wQVqxtYUkI+tIp+vp64UTlKBHcnZTDqFpnkydaiBrK6bMaGJWQh0s2B7g
	BUX6yXFTVValaw4yit/C2z6kgvUFrqXXpLpCtuehMBY67JA16aDGlZNQsn0D7/Otazwh5ApsPcA
	JUP11L0jDL3ypNogK8gmjhyAXhKE/oZwEaRvuDwIOWH2rdKiDHCoijqoCuIdsC88G2Q18ja2B5M
	M37VVfu0EQTS9aCixA6Sb1dgtPnf2ijox/hPIm+vuDPfgfCJoHysZOT4qY6xSRyVXLefvjsyze8
	HkU3BcaLuvd1Zfza7QCeBmWmcko1subc+N/f78/cGprReuM0l0yBmWgiVQWObYbRMmB3o=
X-Received: by 2002:a05:622a:1b92:b0:51c:1ec5:d0f with SMTP id d75a77b69052e-51c2aebaa70mr65534301cf.40.1783003650663;
        Thu, 02 Jul 2026 07:47:30 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c30c61857sm15516901cf.28.2026.07.02.07.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:47:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wfIhN-00000005tmX-0mNc;
	Thu, 02 Jul 2026 11:47:29 -0300
Date: Thu, 2 Jul 2026 11:47:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
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
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>,
	"Cheloha, Scott" <Scott.Cheloha@amd.com>
Subject: Re: [PATCH v6 03/20] dma-direct: use DMA_ATTR_CC_SHARED in
 alloc/free paths
Message-ID: <20260702144729.GP7525@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-4-aneesh.kumar@kernel.org>
 <845d0c8a-6d51-47aa-8e0b-8381e733444a@amd.com>
 <20260617154101.GE3577091@ziepe.ca>
 <25155bd6-4348-4aa8-ba70-0a882fc84db9@amd.com>
 <20260630160242.GI7525@ziepe.ca>
 <98800d21-18f6-44d6-9ba0-da9b77567d85@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98800d21-18f6-44d6-9ba0-da9b77567d85@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_074732_963272_8267DF6F 
X-CRM114-Status: GOOD (  14.47  )
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

On Thu, Jul 02, 2026 at 10:25:16AM +1000, Alexey Kardashevskiy wrote:

> > > not externally available so I'll have to trick the DMA layer into
> > > using SWIOTLB (which is still all shared, right?) as I specifically
> > > want to skip page conversions. Setting low DMA mask won't guarantee
> > > that the DMA layer won't allocate a page outside of SWIOTLB and
> > > convert it. Manually do
> > 
> > Why so particular?
> 
> aahhh I missed "pre-". I need a way to get pre-shared pages for my
> sev-guest activities.

It sounds to me like you don't, what you are worried about is
optimizing the dma_alloc_coherent flow to avoid fragmentation and all
CC architetures require this optimization.

So I'm strongly against you trying to open code something in your
driver. Use the DMA API as-is. Propose general DMA API improvements to
reduce the fragmentation problem. It is a real problem.

Jason

