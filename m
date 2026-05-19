Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183E6CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTIuQdBXtpQH67pVdVz1Fjrx/oRpQ8R86tVZsSSuQBc=; b=4KxrbtvpcX9VcFSt3dt6gQu+/t
	8BJ0LbrUHtomCpWJz8qqRdgbCdUYL03Ex8zXN//aecIcb9/zfX6Bmv96Pz6KSfgu5d8q6fNjK41J2
	XZKSiexQCT6CbUdEaCe66FhSqDOFnNTEddGABGIpR6Hi0feG3ncRm0EZz6DA9Aib6kMiOq08ebPH8
	n+3csv5fx0BqYpKGTXzCsbIEY3bBEKtaxra+LOa85bClA0t+OdgKKLUNmPgGVFKTJcWrVxo4UDWPy
	L65hkf9ltERKQsjuZS9nO4W9z9T9HU7fyFjWeVXsbJdtYFpcxwZCndMzaWpzI8TIdo0pqKQsQXDN+
	EaNq2W3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLQU-00000001pYQ-3Ybb;
	Tue, 19 May 2026 14:28:06 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLQT-00000001pXy-06Px
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:28:06 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-515548f390fso7141cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779200883; x=1779805683; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FTIuQdBXtpQH67pVdVz1Fjrx/oRpQ8R86tVZsSSuQBc=;
        b=irquhpHDT/cxwAxnx7XDm4w10C6TY4uafMIRn1VK1dGutzaHpQcTUz6RQHtKmVt7U1
         jKtMMRPG82MR3GJRS9khICOvIJqLG2/BCCVnExlau721PMkesAFo49v2QEbURzIVBsp1
         Djh6psZSep6qfOBusLfEBgSp/KPiiGQIkPlBbAV4stmGlUp/GK33cr05y3lcjHHOyGwa
         GQRBqBnQ5oczVoyCidXRG7yvw1sNm7OdNuXF2u9mKtXhbipNYd0QWT2zfEdCl7B/CDt4
         ua5Z79QoZW6mydP/ooMEA++JiG+pkvqxjp7NYQL5bQ3xxAVkVHBWqf43h+t1gC89VPCx
         NNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200883; x=1779805683;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTIuQdBXtpQH67pVdVz1Fjrx/oRpQ8R86tVZsSSuQBc=;
        b=AeFIODjJnycpKGB/HeUCv5qL2q2gLePXoxETdmohkx8s+TGMwshVScDg0e854zQ4pC
         Z7A81/N1JcvG3Yb6TDTIyaKXLAYmcBMLE8oWH64sEuTIz2wcRa5zZ2DmoM0FiUVc82My
         rZblo/fQVXPLKRNqKipFvp0vbXaD0b/hfyC4fiQD/9xcOT2NKkWlptJhKcdsSeTMLcEW
         GKy3rhTVNFsTaHWOBaxIUgBSfgz/4SIhnvjcvRV+hx63EVyfmDlGJD5Sj6JHH4Eldpx2
         PD7qOqpfadtsCI54gYC+o7DUXRC8fNf1kcyIUFzqvd9TzxThT4UfZzZyY5IjdUTNp5B5
         RyRA==
X-Forwarded-Encrypted: i=1; AFNElJ+FquqTa32wp9TWgzo26hHvO6dQBKY2kX2RBoGrJLBuYJikGgDhjZGoyYNCCdzEXC3cnRolAru4ZCi7yktHTp1B@lists.infradead.org
X-Gm-Message-State: AOJu0YzZNyfCDBpqgMNrLCE69v0g6eRLf90glWlxkjIN7cpSySNDk8Eh
	ZEo5u0ziITfP7jUMb/yrOIFfbWPDWVSYqnK+MQFhFxVnOGJOrRjTaM3YypYaBt2mAw==
X-Gm-Gg: Acq92OFdcCzhiMIhlmvnqENCOrNDZvdamTpLtah6U8c3KGlfGNdQPAtfNsAHgR5K9Hr
	4qq+Vx0gMwQhx6Me6vIgeQAITMScR+hg2xFTVjVFT5BjFmreR9p77dk/O9U56esnpktJpfYMmN5
	yloiIa8vvxZ5Tm0zy5ebxD1D4rOsJpTkJYNBQgyf2/t9mYPAu8KP1inRPxyRIqONJMmZl3t7h+5
	ZUESwRQb2ejY0pIvcVp1JP1ZMsIu7dF5C3KqrXFt5PJCvoEqxSp0w3c7T/zIYCN+Qhwcc0Kjt4u
	cD3HDYfNswQIaGPpLBf87rUldqQpSPF8P2CmXjUbebKKrNuJqbOIocyW2Mwx+sMJJbKHdaXfsfR
	9IBud5NeINAwlAzFzsIlDmOJpaAnS48qBt4ncF1wsBjkP7jb6HBJjjItSCQFDTOn8ZdMkaCVI+J
	Eq6qMYXeAf5081nPw/Jx3/CHzTVrTsCbNURYR61lkjoEKDVK/IhI+uWaGYq/Lkg6RDReMcv3f3j
	f2q
X-Received: by 2002:ac8:5cd0:0:b0:516:4f62:85ee with SMTP id d75a77b69052e-5167b6a87a6mr33333931cf.19.1779200882847;
        Tue, 19 May 2026 07:28:02 -0700 (PDT)
Received: from google.com (136.41.155.104.bc.googleusercontent.com. [104.155.41.136])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9cbb0404sm37077347b3.42.2026.05.19.07.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:28:02 -0700 (PDT)
Date: Tue, 19 May 2026 14:27:54 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev,
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
Message-ID: <agxzanDBmIP54hUz@google.com>
References: <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <20260519132911.GA7702@ziepe.ca>
 <agxolksC_1nfO34X@google.com>
 <yq5ah5o3sdn3.fsf@kernel.org>
 <agxt7SFGT7OLMIah@google.com>
 <yq5aecj7sctv.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5aecj7sctv.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_072805_072737_8B39105C 
X-CRM114-Status: GOOD (  26.41  )
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

On Tue, May 19, 2026 at 07:47:48PM +0530, Aneesh Kumar K.V wrote:
> Mostafa Saleh <smostafa@google.com> writes:
> 
> > On Tue, May 19, 2026 at 07:30:16PM +0530, Aneesh Kumar K.V wrote:
> >> Mostafa Saleh <smostafa@google.com> writes:
> >> 
> >> >> > 
> >> >> > I am still running more tests, but looking more into it. Setting
> >> >> > force_dma_unencrypted() to true for pKVM guests is wrong, as the
> >> >> > guest shouldn’t try to decrypt arbitrary memory as it can include
> >> >> > sensitive information (for example in case of virtio sub-page
> >> >> > allocation) and should strictly rely on the restricted-dma-pool
> >> >> > for that.
> >> >> 
> >> >> ??
> >> >> 
> >> >> Where does force_dma_unencrypted() cause arbitary memory passed into
> >> >> the DMA API to be decrypted? That should never happen???
> >> >
> >> > Sorry, maybe arbitrary is not the right expression again :)
> >> > I mean that, with emulated devices that use the DMA-API under pKVM,
> >> > they will map memory coming from other layers (VFS, net) through
> >> > vitrio-block, virtio-net... These can be smaller than a page, and
> >> >
> >> 
> >> Don't we PAGE_ALIGN these requests?
> >> 
> >> dma_direct_alloc
> >> 	size = PAGE_ALIGN(size);
> >> 
> >> iommu_dma_alloc_pages
> >> 	size_t alloc_size = PAGE_ALIGN(size);
> >> 
> >> 
> >
> > For allocation, yes, and that's fine because we bring memory from
> > the pool.
> > But not for mapping, as dma_direct_map_phys(), where the memory is
> > allocated from the driver or other parts in the kernel and the page
> > may be shared with other kernel components.
> >
> 
> But if we are using restricted-dma-pool, we also have:
> 
> mem->force_bounce = true;
> mem->for_alloc = true;
> 
> So, will we use the swiotlb buffers for mapping and copy only the shared
> content into those swiotlb buffers?

True, that's why under pKVM, force_dma_unencrypted() should never
cause any memory to be decrypted and so we set it to false.
As in case of any bugs, the guest does not leak any information,
similar to what just happened initially here due to missing attrs.

However, as I mentioned to Jason, I think with some tweaks to
force_dma_unencrypted() we can make it work under pKVM for aligned
memory which eliminates some of the bouncing.
I am currently investigating that.

Thanks,
Mostafa

> 
> -aneesh

