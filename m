Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47904C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dThHBkWDs48b/2hz2YL35z2V9VnPq+MKY/40ZoZ5a/U=; b=gm5U/WsUhsWkkD55O7KC+BcZNE
	HYqumYtxg8Dit1P9T8H1ciFeDqYJK5CM5rDzBICX5zd2Jypb3mctxQ1VYccoLU5CpBL03vz7a/SuP
	3UWNaFlbfcWy4dlJYT50sAWgRtjV05tJIy5ZFiO9hRReFJaWvfeFR4OxauQaFa6ey+1z5ksK7VUPP
	xdXMO5GTaL5TJ3mekCEbq8/kAghFw9q1jDFzMzEnqoGWnLkRY3GesAARkymuTNBjZ32iH/L/lOdbV
	nNzJwWpgkLxmlbBHcBLU16zfmHb5YimEqXsOAJSlBqs7xkteKR4aVbqF5DQILTUmdkwFtgpUsdei9
	KIAwu79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjH9G-00000009SuN-3tEA;
	Mon, 13 Jul 2026 13:56:42 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjH9E-00000009StM-3Rj9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:56:42 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-8fcc43c48f7so27401576d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783951000; x=1784555800; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dThHBkWDs48b/2hz2YL35z2V9VnPq+MKY/40ZoZ5a/U=;
        b=f85r9ehEtRGQnBSWDAx8fwHLA8lRn1Et16cQr1rvJNTeBa/yC6OaNRQ3DarrLvNxo/
         1UyUkgV6rtvQjIzN7jEORv0sT1u9pr9NzVFwc/v3TYfvPed0aNkS7NCNm1/Pul2dJzRQ
         9tAS1Aw72JtaPoRwH2GNtIDdC6GhujTurq2kc+1RfWP2nOa0cE6kgkVmS49Ti8gNi6Jf
         jPI4NCN7V9wrHwTwnst/N2oTcdIWuoku+MeXN5Ez9qovUPv0M4gnmTewZBg5idUTlBiz
         MGhpTMhyYGKQmQtIEsFM8QYPiqO2c5RatXcmLxhpG6bOytT+vZ2ZJE4IGgqMG3kwMtBq
         78XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951000; x=1784555800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dThHBkWDs48b/2hz2YL35z2V9VnPq+MKY/40ZoZ5a/U=;
        b=hYG/AkMw1ByRzS95t4kxJXozikd9WpPGnISlzuCMSNxQDLeQ1/Avu3ZSPg+SOK92bt
         o4HJka01Yx1a1GNaj5bpA6jYu6tZtOExUcr5TkWRXVmRIHd8tO3EGweOogjo1x9dkbE/
         s1VSPfK+okiBn3mijdJv0kCkYhYSXX7SXvMS+XPvjdPjuSN3WBIgQLmRXbsN0tH7BU4w
         oiLtVnt3XDrPnZ92IJskRj+1+aOgWJhJ1gD3fTsB0BseV9oCrWaykl+mw+1hUEOzdGHq
         emHYyf62GlUjNUw1XumPUU+n/dO1ToM8xq7DisPBM8NiicvshcXxwu/IzMo4dHh82XWe
         QXhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpN3z6GMgCrjm5Y45GTSRsFLXyUUOBhMQCvEOp0c2Je8muBFOWjTV5QgD8Y0A1No/scS0Q3JotirdW399tDNLj8@lists.infradead.org
X-Gm-Message-State: AOJu0YzvfTpJM1ai1xKcFzIRjPSEamAHygdZWEVMNtDtiw/1queyZ2pK
	wISOQmev7hS2vJ9V75wlkkYYhd72LFCwzwdCd8JlMrhwsGz7QayBgdTFaJIiYh2/Os0=
X-Gm-Gg: AfdE7clbofirMYuFDnLoLZOumnUdcEgjeh0wpwSDbzRthZZ2pjCiau4CR/NUiRQiEaW
	bcDLzgdyi9AIPfkpju95XwdW80N11tgX189wMn/Cz8GYCAG/K+Xl8XqtnbIShALXIOrGrnpXBcr
	xN4Z95VishJh3jOvLPswGrlAnOlMAxqz8Hb2HuLoES7aXx9ElRUJ5fceenT6ZRb038+Em5wjVfK
	hADpJN2LUIZNUGDzZstB656hR/Mhvt+QDF6DegrxB70D0W+dlAUv5s1Czr5KMVN5qlT6fhHsF4v
	DxSBIDe0TZav1HKJCZwonsP7DRl1XaLwGxA2QiBmBw5LWqZbYySU+FUd/VXnEsfVJcbKscRJbyV
	Tf+6Ve2wZPV0LjiLt3yCanlZnspN6fNIX/4kmHWhhU4t+wqs0Sw+SQri6Vbkx
X-Received: by 2002:a05:6214:da9:b0:8ee:756a:f1d3 with SMTP id 6a1803df08f44-903ffc638e5mr98221496d6.28.1783950999687;
        Mon, 13 Jul 2026 06:56:39 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd81f4bbdsm126704796d6.36.2026.07.13.06.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:56:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjH9C-0000000DL9o-26N7;
	Mon, 13 Jul 2026 10:56:38 -0300
Date: Mon, 13 Jul 2026 10:56:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
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
Subject: Re: [PATCH v7 16/22] dma-direct: make dma_direct_map_phys() honor
 DMA_ATTR_CC_SHARED
Message-ID: <20260713135638.GB3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-17-aneesh.kumar@kernel.org>
 <ak42F240d-53QeFN@arm.com>
 <yq5apl0xgy89.fsf@kernel.org>
 <ak-CT3oanlDfgTy4@arm.com>
 <20260709181336.GM118978@ziepe.ca>
 <yq5ajyr3h106.fsf@kernel.org>
 <20260710161945.GO118978@ziepe.ca>
 <yq5atsq6hdaa.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5atsq6hdaa.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_065640_874523_D083046F 
X-CRM114-Status: GOOD (  18.11  )
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

On Sat, Jul 11, 2026 at 12:39:49AM +0530, Aneesh Kumar K.V wrote:

> > But if you really want to it should be
> > cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) *only* and get rid of the wrong
> > force_dma_unencrypted().
> >
> 
> Ok, I will update the changes to so we preserve the previous behaviour
> for SME?
> 
> 	if (attrs & DMA_ATTR_MMIO) {
> 		/*
> 		 * For host memory encryption treat MMIO memory as shared
> 		 */
> 		if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
> 			attrs |= DMA_ATTR_CC_SHARED;
> 	}

I'm OK with this, with the expectation we should aim to remove it when
fixing the callers.

> > But IMHO, I'd rather this series treat ATTR_MMIO as private MMIO and
> > ATTR_MMIO|CC_SHARED as shared MMIO and that's the right and correct
> > thing for the DMA API.
> >
> 
> If you think the rest of the series is ready for upstream, could you
> please ack it so it can be picked up for the next merge window? I'll
> repost v8, rebased on top of the pKVM topic branch.

Yeah

Jason

