Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E57CCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tm+jP+3WfoLtXaL6gn2l0sQY+Wj2XqJdxBBXikZyHQE=; b=G+X1pw/30SAszbI8cdK5UN6TRB
	LWdqLFI5BWSx/2qKwIZvVJAHu3yLWkhrsVwkxEY9lLN2i+L/m1xQPtJ0Xh/AQIvyO6384Kt9tYPCT
	iWV/dofz02CtMI9dpAeQqgb/noztFxnPhTcWEYFcSgllmFgGK6UXvSCwRHmyLw8599Qf+SBHYJp65
	aBoaaSgiS0J94f+3mrZoJkRPBmdXqgykF4nW3Cvp50U6LwO9B5cVB8B+l9q3/+KN3yzdlxHZN+X40
	Qk3qy5MqGyQwHTSfZnbn4jczia0y1pCDk5knbAFDL2Jia1o5wsgMAdR+X1jc14Nqxn6QV6sd7x6Hk
	lfg+UTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEnq-00000001Uow-2ayP;
	Thu, 18 Jun 2026 15:37:14 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEnk-00000001UoX-3EGO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:37:12 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-9185503e6a5so140949885a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 08:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781797027; x=1782401827; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tm+jP+3WfoLtXaL6gn2l0sQY+Wj2XqJdxBBXikZyHQE=;
        b=ewROTf56ukZ01tNj888vt50yLMfpiDz9V3KC5cqG1t7jk28alOfQPiX0ZjYROmXx/1
         8rcJDGPfpOxul5F4Wfzmpf4ekXBu7oTkfXCzV5gtNOpxTsR0ULkswYXUU3VSgIp3bzB7
         bKyVgY8sGh65X4v74R03eweZr488hSt+KI+mu+SSORfPfhxB4/rdrNPUpVZKuRnXv+6V
         tTHz0LyeYAGQCd8d8RsCv/I1cCBIRYuhp9J/yJnDBzUP1A3hip+Id/S6cyrmWsoEL2t8
         KJTjK4OLJY2+NpMbizqkeorsgimGSuOYFyeazffvOiZ+vUUHbwL5uctUlk8O5tStEihY
         9eMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781797027; x=1782401827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tm+jP+3WfoLtXaL6gn2l0sQY+Wj2XqJdxBBXikZyHQE=;
        b=eetAXdtXMxADeX7neUkF/1j3hKe447MqkyBx14/YEbdX95UM5C9jovvdBVl3qpvsua
         5d4YFnl1FuHZmBHfCBn87vmLX4mhVm1VDuDD5urxO+BJbeiCx6c5bkd5Z3k7kwm5zGIq
         xoUQ/jo/xwQANxtrOHs7b62YARZuQiBjFaCqfFP8xEEeYga3Fx6cjYnFfuF7SqY6JQhP
         4gfbiAcso4Rx4V1xK8JhC8/yw7/pgRQU2l0FvtCaHLXfByDx7EqMUTI+GMfRhiHS59US
         8FBNSDxwv8PAvgo11WgO3OsJUt2tf4/Ydn/Sb09Z9VBIfYYzuH54dydVdmUppfLOPy+3
         PUew==
X-Forwarded-Encrypted: i=1; AFNElJ8lSxxWw8eQ0p/roQ4EQK0WPHtsDlZmRbwehLDGrsxHEWcP0rG0deOQc92N3bi0yD4j7Pxxowk61C+zRrVv/Va9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcb1NcffXbh3L0886KKLWgmiteOO8+pxuX2jAEywHIQGTsbjoE
	84Xj9Z4+YABeRG4+GEzapOVoxGQWc3pXEk8bHRYj/8ynp93KV1oIK4x7GsMBw2Ufuuo=
X-Gm-Gg: AfdE7ckInvgqJN0Mtxhtw6mwmZjAtCbxuZlq2mYjkzgeJKaKzv2rihRCA3tntR7fAhA
	wYAtUzeDt3oJu6KCX9Dg+N7EiiLEiXdu4e99bQmMXgFypOFupgzlTuOK07z3BBDpH/2aaT6JBeV
	S+WT1M6DbY3FAtyKE42DdSgUMTG+2PQdYxhs218FcnHdVaskTAG3GebxBJyt6sUP2kQLevDOdfd
	93IYEwLxmNm3Z35Q+1ye78bz9EmRi8IYgUzSYu56SERhTkLEsPA/moC241pFvF76sEM67e14ew1
	ng8nI8hkn/sUQrXdxl3+jXS0gdeYlNMFfOsySfTY4XbAbi4S/SDgEYUdMK8mi7xAbjFpkwxxuz6
	I4AkLezsn487Sgt4DH0p7wohuWWQaJdUB4+iD/YgqomRWa+zJSvF5qVH4zZinrzl2TQgpMBeVET
	bImX0e3GBLxV0iz/IXySnp5G2lA3lzWDA693GBB2TDFhk4ObkWLU1MQk4+AMzSoeiyUD0=
X-Received: by 2002:a05:620a:469e:b0:915:8f64:604c with SMTP id af79cd13be357-91f082ff425mr678605385a.15.1781797026718;
        Thu, 18 Jun 2026 08:37:06 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f3c324sm2104263685a.21.2026.06.18.08.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:37:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1waEnh-00000002tSw-24HO;
	Thu, 18 Jun 2026 12:37:05 -0300
Date: Thu, 18 Jun 2026 12:37:05 -0300
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
Message-ID: <20260618153705.GH231643@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <aigYbK12D8uKQvJF@arm.com>
 <20260609144746.GL2764304@ziepe.ca>
 <2ecfa1a8-6202-4319-9692-a6ffeb5a3dbf@amd.com>
 <yq5aqzm4dz25.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aqzm4dz25.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_083708_824749_B0F972BC 
X-CRM114-Status: GOOD (  25.36  )
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

On Thu, Jun 18, 2026 at 09:37:22AM +0100, Aneesh Kumar K.V wrote:
> Alexey Kardashevskiy <aik@amd.com> writes:
> 
> > On 10/6/26 00:47, Jason Gunthorpe wrote:
> >> On Tue, Jun 09, 2026 at 02:43:08PM +0100, Catalin Marinas wrote:
> >>> On Thu, Jun 04, 2026 at 02:09:39PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >>>> This series propagates DMA_ATTR_CC_SHARED through the dma-direct,
> >>>> dma-pool, and swiotlb paths so that encrypted and decrypted DMA buffers
> >>>> are handled consistently.
> >>>>
> >>>> Today, the direct DMA path mostly relies on force_dma_unencrypted() for
> >>>> shared/decrypted buffer handling. This series consolidates the
> >>>> force_dma_unencrypted() checks in the top-level functions and ensures
> >>>> that the remaining DMA interfaces use DMA attributes to make the correct
> >>>> decisions.
> >>>
> >>> Please check Sashiko's reports, it has some good points:
> >>>
> >>> https://sashiko.dev/#/patchset/20260604083959.1265923-1-aneesh.kumar@kernel.org
> >>>
> >>> I think the main one is the swiotlb_tbl_map_single() changes which break
> >>> AMD SME host support. There cc_platform_has(CC_ATTR_MEM_ENCRYPT) is true
> >>> but force_dma_unencrypted() is false. Normally you'd not end up on this
> >>> path but you can have swiotlb=force.
> >> 
> >> IMHO that's an AMD issue, not with the design of this series..
> >> 
> >> The series is right, a device that is !force_dma_decrypted() must be
> >> considerd to be a trusted device and we must never place any DMA
> >> mappings for a trusted device into shared memory.
> >
> > swiotlb=force forces swiotlb, not decryption.

If force_dma_decrypted() == true then swiotlb must allocate from a
decrypted memory pool. It is right there in the name!

The hypervisor environment should *never* set force_dma_decrypted()
because all devices can access all hypervisor memory, up to their IOVA
limits.

> > So when I try "mem_encrypt=on iommu=pt swiotlb=force" with this
> > patchset, it fails to boot. But it boots with a hack like this:

On the host side I expect this to cause swiotlb to allocate encrypted
memory and bounce to it.

>  		u64 dma_enc_mask = DMA_BIT_MASK(__ffs64(sme_me_mask));
>  		u64 dma_dev_mask = min_not_zero(dev->coherent_dma_mask,
>  						dev->bus_dma_limit);
> +		/*
> +		 * With memory encryption enabled, SWIOTLB is marked decrypted.
> +		 * If SWIOTLB bouncing is forced, treat the device as requiring
> +		 * decrypted DMA.
> +		 */

And this is more insane logic. The right fix is to allocate the
swiotlb bounce from the *encrypted* pools when running on the
hypervisor which requires undoing this abuse of force_dma_decrypted().

Jason

