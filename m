Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5DFCD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9LPBfHeyyLdgfb3oWsJJs9sVnnCU9Plv3UTJaVJh/Q=; b=cFrHX5qTU8YUlxntLjtj8Dp5gZ
	F2JIV6z00zL3B1MqBtrv3/gbMUq5u/qo6SanB2OZE2pqW/FT3s2xm7Z8KG8wfdw/9Rqk3m6HxBKOW
	Wnnyy7Wyr7hrn19IRumEC8ge6sdKcOFm/S9CUrFAS1Fb+KKyR2lcnHiuZOEb66VRBof2JfL1vCz0z
	t9L7k2VmLHVjtY7k0GpyHO9BwPxw8HJbxCohYcuSp6yF50GDo9XBPbZdTDhVoaqaMGRPr/Yv+k4BC
	myI5s9TSilwXjH0WnmncgZX2787Y4RUgMei65TCN8JRTvHakp+4AivpUYgeqZBEaDA4ie2IpYR59H
	yXUcVSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYEL-00000002NbV-2cmb;
	Fri, 19 Jun 2026 12:21:53 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYEJ-00000002Nb3-20mO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 12:21:52 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8db9f25c5acso27424566d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781871710; x=1782476510; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9LPBfHeyyLdgfb3oWsJJs9sVnnCU9Plv3UTJaVJh/Q=;
        b=WGxpuIKu3uyIBU3Nb6O0e86lA7zF3yCYh4wwcOsHwpPgS4UgsIrdnzNA22O5hjzWcx
         R/P0wGcDf3ijiHAZSNvVEFxJ13bAuo499HVBUKJ7zbVBustHe1BjkZ1ngno3lNToHcMv
         7DkFlmMugQ48uDHQaWwoN2Oc/e6vzF64ZSaFaiNTPxh5qjIQgt2MbCQhi8dXpWc3xVE0
         u67/RLIbBo4epePYsJAgTbjh3EaFn+4HK7vOGoCJqJiA0QxFlh98hlIf6KYqYDLWE4RS
         nOHKEB+AB5D+TLxtu52CKl0R2RW4wwGudq4FEYInPz7K2m2086unGTMZ3Ok29ik+cUgh
         uBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781871710; x=1782476510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9LPBfHeyyLdgfb3oWsJJs9sVnnCU9Plv3UTJaVJh/Q=;
        b=kpQvNC1osUexODy1DXBfPRthxTbFDRiBVb4/Kt+BK92dOBHeF5NW+MhhzAVqD34OKY
         GnwqQSk46DtL+VmpXaPkZ1UZh8SKiffs6/3T8wNEElA5f6nLWHeiMB9NIWAfQ9s0U61e
         TmycPg1s5kEVHN1xx2iDuUgoz1oM6wsliBgma//HUdMzuWfr/U53RR+8rq2pNdGHVdAK
         xt9PYiWKU+24d1hAR6JRdfo/fPoYrX6XzG5nTCR8BLswAWSOpYXRyVtmcM1UQB7j4jd9
         /daMJIH22AkF/n4oe2YbiWRrH1V0wo1grs3jWsGssKjwBEsg/RwGwvFL2jGJpXmWqAY8
         n4Kw==
X-Forwarded-Encrypted: i=1; AFNElJ86kffsOO4u8i62sinOufMqxKqoG7R7X10DCyWwtXXV5l4ANQBqUg3mFTKaOk9qwwesSuWafbfBAVDUBiZgMR40@lists.infradead.org
X-Gm-Message-State: AOJu0YwY232oeaAL7jnFS7T6r2xGudGS98/iNBvFKM3cEFsBRZt+kZaW
	kPb2/KRB4iGGi6VnARC4jCch6uVD74T4eAlgjQoO7hLj4jQvSRfjJlzj8JAIipQfSeo=
X-Gm-Gg: AfdE7ckZI9xtkaFf0r/9pWTMH0KVp0HuGUowTtKvDYWv4C71qa79SRnDx3kf9Ru11C/
	PxZw2sxrj3l+D6mNrgYnQqpYU/09583G5sx3JgVhdUTI0OG2cg7i6TZKmRl6A7pljLfV08iD36s
	k7Qk3wWHXQiWV61IrdUCPgruVmSXQWiLawCgb8J7jwpOXi/Szh/camougFSQpkOUts58ibniZnN
	gf5+kC0o5X+o8iNmOps3mglZ2IjZLvdQtXuBQspmanKnrK8dd+dMPyyxHtyo5CUzm4ezAnWMJl1
	KrLfFjbb9IkzYP5EDgx2waQxYarKmRIDxk2hXO6hMgAnfPr6KS6/EA/ZRXYz6juPjoxciQqOEFp
	vCapHmTuzMZ6+O4ZaFtKkm0mmUDH21vvOFcGNtcQ+0MpfcC1prVTH1pNcsER0onvdKvx3QQkY93
	bLryGgF2yf7DFlS2HvN5xjYZ4kuvg10xyWTLF7PhsgEl303Ecc/SjCsuv02YZOg5l2Hp2YMzh0Q
	HkCcQ==
X-Received: by 2002:a05:620a:4413:b0:915:1359:fc5f with SMTP id af79cd13be357-9208f835f14mr474588385a.14.1781871709844;
        Fri, 19 Jun 2026 05:21:49 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a4966577sm218949585a.34.2026.06.19.05.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 05:21:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1waYEG-00000004U03-2Vgj;
	Fri, 19 Jun 2026 09:21:48 -0300
Date: Fri, 19 Jun 2026 09:21:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v6 00/20] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
Message-ID: <20260619122148.GL231643@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <aigYbK12D8uKQvJF@arm.com>
 <20260609144746.GL2764304@ziepe.ca>
 <2ecfa1a8-6202-4319-9692-a6ffeb5a3dbf@amd.com>
 <yq5aqzm4dz25.fsf@kernel.org>
 <20260618153705.GH231643@ziepe.ca>
 <yq5ao6h6enhm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ao6h6enhm.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_052151_528154_D80A6B92 
X-CRM114-Status: GOOD (  15.39  )
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

On Fri, Jun 19, 2026 at 01:14:13PM +0100, Aneesh Kumar K.V wrote:
> > And this is more insane logic. The right fix is to allocate the
> > swiotlb bounce from the *encrypted* pools when running on the
> > hypervisor which requires undoing this abuse of force_dma_decrypted().
> >
> 
> Agreed. If the device can do encrypted DMA and requires bouncing, it
> should bounce through encrypted pools. We don't support encrypted pools
> now and that means, we mark the option ("mem_encrypt=on iommu=pt
> swiotlb=force") not supported for now? 

?? if you don't have a CC system then the swiotlb is "encrypted"
meaning ordinary struct page system memory.

The hypervisor should not be triggering any CC special stuff here, it
is not a CC guest.

Agree we don't need to worry about swiotlb=force with a trusted device
in the GUEST for now, but it should be something to fix eventually.

Jason

