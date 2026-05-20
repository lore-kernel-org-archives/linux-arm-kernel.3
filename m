Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A033CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 13:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+SwQbDLFG0Y+rBu9pL52xRO2ueMe5MsHi84X45A//o=; b=BblnVfK62yIQzD0zk06+sVgzsj
	FypwS5OQYMBd2nkgFRJoAsF+I6EOUJTdSKjVmlWaSaQm2HKnttpKDRjH2V6t2Cl0L8h8IM+PDiK2h
	MLnn2ty1J/CdP+BGYb1KqAas5WdJnNj9AJJ3sYuGfndnAjqxN328J0Ug/61wIE4I46KKF+uCoxCeH
	g/guE3Qr02Bcblw1JCA+5p7TLYD6icPtUWZ4/YJHl7rlcWEDVrCRR81Zmru09Ji1JP01orp8bXLPi
	tbTu5opHPWIoIiMe5EGu+YMRgt3WCXMZmRFz8URjwLfgHkvNWx0dN7pyUFbhX6KTQpbUOT3Ge09VY
	QrfH1JFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhAC-00000004hzv-24YK;
	Wed, 20 May 2026 13:40:44 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhAA-00000004hz3-2IN6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 13:40:43 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-8b4298d271fso105060216d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 06:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779284441; x=1779889241; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W+SwQbDLFG0Y+rBu9pL52xRO2ueMe5MsHi84X45A//o=;
        b=WoZJxcumg/ppA6C/ZHdWR+exM8Aya2XcniU7dJjKCClwUlxYjLvM56J+He3cRhuvq5
         AulfANGoRWECy2Wa2hspYDFNiqRTFl5kR4q/uXAkmBapgKct6X0UWYFX/X02aImItiqD
         5dr8YIlxP4r5EqCgnV28nu1BW5W241xUq9szKxHyGAEtganKOc05H1MBB1DszSSpUHLw
         mzNDRWhnjpn2nvHleRZFuD7MVtG97KqR7YQr3iaW7HF2fjRcqsX0jws3pyMWwaGk3zLg
         XxtkN/nMAKxxbgZeFfVk6FBql6Dm769DDCsAzxE/koT6G1qbiORB9jCZsdSvDbvfi7L9
         t/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284441; x=1779889241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+SwQbDLFG0Y+rBu9pL52xRO2ueMe5MsHi84X45A//o=;
        b=V8qQNiopJw2tRYSRwPOQkbzjGHGACuhGgv3r8fFoZ6DcGheVA0PRPA5M30rq/sR2Px
         NoFeFraY9jbd0sRhJWn8EAtmwUQNXuvbTt7ZA3sjbaUi2QxmTn4KIXypvPoqHutwvzRm
         OAf1A32wNh0VpTdt9B+/msCcMSFJKfT4WPlY/UunB5aAe8DtobrgLqIk12x9Smn7SXVD
         VWvymZd2ObOwvIu3+11RTcdOXHpqazJObVW5uqOWUF3dNrcwvr5FBA2EA8TL5XxL0vbX
         lee4uA+HY/NBVfTPpPecpHjQxV2JGbpaKRV8D9zmsz7djYFGYyzEGIkHrgWRIjV2eMVr
         RsDg==
X-Forwarded-Encrypted: i=1; AFNElJ84EWepaWjd+z288eIgR/cnW6E+laHqX1MKsUx5LenZCn13+9ghamA1DajZ1m8IoUPSXNfu15eGEaCxu/hzkyyC@lists.infradead.org
X-Gm-Message-State: AOJu0YwGSqSjdQbfctfaPfseghpab+dggGjJsjjVCMfkR653q43qhlSc
	UNbMPnipMdXzqWCjc0DbDlmL/Dmo/INZ+b5WChIDMN+8+rPc8fbvQvxRJ5+2uPCluuU=
X-Gm-Gg: Acq92OGnw5sjLtXR9erPDrbncLbnM+H4R2ao96sK4ReI77IXc6TtcJT/FeQtjrdnnMX
	Oa5VbqxMH/Q6P6R8hgVanMqeU8+e49plqe+kzbjEezegZHX83GCFEWqwfW5/q0mH0KBC+WuK/F7
	+2qiepHC/d08dsRjDQZk1EcinESn1DpRxGyo7HbxS87dudrSSEnO/DaqoBMnlgugnV/ZfRqdRkX
	L69y9FK/6bFyRsD7izxY9hKeQTudoCmyZU6gWjmoLknZzlJqg/KRpmytTHwdIVMS8ARGFBCCoN1
	Qn8OhQXX10LDYUK7VrsK7VSIqYjyWNYaCgBMQNDPJU9S+n8PMBx4liNiPGFdLs9oeHUwDUn/2jc
	EGXJHSbPQg+qFNxJB7aAEVRMc1+Qk7Yeq0b/bBsvB2oGPidslWK/iriDK1/Y34tV3iwiM5XgPK9
	n62bKFnLsSrBcZuQ0ody2/qUb4DmksgeVbB+IIRxyTUNIx3c5pngERyERyRZ2cMkB1xhiNyol3A
	qhMF9ghgcYVhnf6
X-Received: by 2002:a05:6214:5c42:b0:8ca:16fd:7297 with SMTP id 6a1803df08f44-8ca16fd752cmr347910676d6.30.1779284440966;
        Wed, 20 May 2026 06:40:40 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca360ac735sm122405916d6.19.2026.05.20.06.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:40:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPhA7-0000000HB8S-389S;
	Wed, 20 May 2026 10:40:39 -0300
Date: Wed, 20 May 2026 10:40:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <20260520134039.GT7702@ziepe.ca>
References: <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <yq5amrxvshxg.fsf@kernel.org>
 <yq5abjebsaid.fsf@kernel.org>
 <20260519152741.GM7702@ziepe.ca>
 <yq5a8q9fs7ud.fsf@kernel.org>
 <20260519161120.GO7702@ziepe.ca>
 <yq5a5x4ispg8.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a5x4ispg8.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_064042_604982_F3377E4D 
X-CRM114-Status: GOOD (  22.48  )
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

On Wed, May 20, 2026 at 09:27:27AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Tue, May 19, 2026 at 09:35:30PM +0530, Aneesh Kumar K.V wrote:
> >> Yes, that also resulted in simpler and cleaner code.
> >> 
> >> swiotlb_tbl_map_single
> >> 	/*
> >> 	 * If the physical address is encrypted but the device requires
> >> 	 * decrypted DMA, use a decrypted io_tlb_mem and update the
> >> 	 * attributes so the caller knows that a decrypted io_tlb_mem
> >> 	 * was used.
> >> 	 */
> >> 	if (!(*attrs & DMA_ATTR_CC_SHARED) && force_dma_unencrypted(dev))
> >> 		*attrs |= DMA_ATTR_CC_SHARED;
> >> 
> >> 	if (mem->unencrypted != !!(*attrs & DMA_ATTR_CC_SHARED))
> >> 		return (phys_addr_t)DMA_MAPPING_ERROR;
> >
> > Yeah, exactly that is so much clearer now that the mem->unecrypted is
> > tied directly.
> >
> > That logic is reversed though, the incoming ATTR_CC doesn't matter for
> > swiotlb, that is just the source of the memcpy.
> >
> > /* swiotlb pool is incorrect for this device */
> > if (mem->unencrypted != force_dma_unencrypted(dev))
> >     return (phys_addr_t)DMA_MAPPING_ERROR;
> >
> > /* Force attrs to match the kind of memory in the pool */
> > if (mem->unencrypted)
> >      *attrs |= DMA_ATTR_CC_SHARED;
> > else
> >      *attrs &= ~DMA_ATTR_CC_SHARED;
> >
> >
> > Attrs should be forced to whatever memory swiotlb selected.
> >
> 
> But that will not handle a T=1 device that wants to use swiotlb to
> bounce unencrypted memory. That is:
> 
> force_dma_unencrypted(dev) == 0  /* T=1 device */
> attrs = DMA_ATTR_CC_SHARED;
>
> In that case, it should use an unencrypted io_tlb_mem:
> mem->unencrypted == 1

No! The DMA_ATTR_CC_SHARED only states the nature of the source
memory, the DMA transfer will always happen under T=1

It is perfectly fine to memcpy from shared to private and do a T=1 DMA
from the private memory if we have to bounce.

Jason

