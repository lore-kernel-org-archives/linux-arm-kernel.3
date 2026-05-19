Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0412CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kt+hX5KDw0Kh9RBmOyjzabH+WBL9dObDUAkuMZR7Klg=; b=gcIZMnUTHQeCnsmIjD+taDo+Nf
	WBltlqw1jnBagMCxc0Rjcf3V3WmCsKoHlqMSHetpRHkpZBR6ZRRdDR+uhS8QEzH0hgxxX3bMq50za
	kxjJ+Rtjzmd5zNoYVfIZijRkngNXPBIFHKusvs6blooMwBKJy/DWQ+ZJLnyk4/UNmD2QzkFtJOqfc
	6KksI5h6QZm4+if/C7E7xBqQLYUfcQgOVAa96aflbNo9KG6xHdFOYJreVIioGr4BT9GOiD9Y0WDj3
	Jncv/53XqJckfpbVj4VxLhx5vrBwRaHRk7iC0j35ZTJXSy1eHOlXu+sknUl56B1imkuSOlU5J18Cz
	BxAQhRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMME-00000002386-1yB4;
	Tue, 19 May 2026 15:27:46 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMMC-0000000236q-0kAz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:27:45 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-910bb291688so461073485a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779204463; x=1779809263; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kt+hX5KDw0Kh9RBmOyjzabH+WBL9dObDUAkuMZR7Klg=;
        b=g90v9ZtbxdjdJeSbymsVVtCSDXWvfQoMh+oouoA4XLXHUhZedzRHxkp6D3xTPKpazg
         qIF3QpW0xPirtGKbhypHIyoA1aJcnDbz+WloJQr4CsCc4RkjyfIhPLi/IOOgtuuI7ZQ/
         ZtTC1xb8RvfZBg1j4428EFJv02EG7Iu676CWUByZcNEMndvdp2uh5FdRUlCFQpqxHy5B
         Bo00OF5nwiYHytD8pz47SeA2E9d1xgdgEpRAU4iphyASyMqRCRch8BjMs02dvhCOnjSw
         8AGhof+/NtQW7zCXbMLT/xZLA1TCrK/ASzWty1XllpE2bWptu6Q6IH8n8Kcvb6WVQY1Y
         WwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779204463; x=1779809263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kt+hX5KDw0Kh9RBmOyjzabH+WBL9dObDUAkuMZR7Klg=;
        b=qPjYnyxuLPoar5Sf6xMqDF/+hi2O1gV+bfgemxsVkGJJGKZt2H25Zk3KP/2o0UOsRh
         SQ4jZUQEReX9PMueJrwnuv6SamnYO1zcYh06MN5rDMrWOOqDOJh9IYiJhEM6lre0dL9o
         v05gGyBCh8+5HhBUhp9+w4b8pk0Xy3Ux0wV8H/tUR05cTNLsb95PcJX/63J1vPUhko0W
         +YQwH3Q+gAdle/+AHJBWJ75YvaWdyvfIaHKqo4g/10btAs6WgsMSpfOfoT6LmVg5Ms4V
         LBBRHjYscEw1GvMlLfidPDQk7f6IFgJV1xHE2vQqm969nE2Mk8OsUmtzHsA7k+OjzdrL
         x2Dw==
X-Forwarded-Encrypted: i=1; AFNElJ/u2+aoprdDHvdFCvi5xlAipPGqoYgv9taMteUX9cd0FcB9ODaZOZETQkcWcwrs5WsnozsD93b+m5A3X8R8VHYw@lists.infradead.org
X-Gm-Message-State: AOJu0YyfJ/6eHtlYys9DReILms2UiKm98UT5y7/yr4R7aax05ZZbtlTE
	7eAMmprrMmJLANjYLLogF5o0wi4T6g711aUF7Enfn3k+z4Q1AW1m8cI+6uVag6MPI7c=
X-Gm-Gg: Acq92OFyW+9go4oWgozgCeEfEj0HJaguGSHyuB0+ohWXMGWoQo89whSuqG2z/PGZB04
	5VR/ijrkW2z2WePo8mDfyTI1QIGl66kZcgiKRmF2lA+OIrr+yGutbXbYDndCHwItRhMlb3gQBRV
	lN3DcFdf7ZiHNbGSEqdyp4rtyQaKACPISlhcACn4hVxICui+b/cK/w6STR/pS/Rln3c0KpuLVXB
	Dp2KKvh6dIW3HgKJRcEO5n+2R2I0bAxDlFhKRGg6CnTA2K+c19XXR5iLQPv33JJfqfIR/ppw3ah
	nxRMdqXC/gMnDComr7TRIAgp2J8pTXtofKbmjI8fseKcQVM74j343OEmFiEgsrp3CRvHRVtAImi
	bcl4rpfG4MaIRdAZi8HGZDWFk9x2cMvnj3A124XdF+3e3WA/dg7TGh+olzY3Ry3xxS36mEPmum3
	6uzp0pcCJCtwTKUwfgomP/WCW7rUrc/YNxfDBzzFlEGFqS8vXFXQwH0EHsEPcTGPU6JiaytVQwe
	3zZTmAdfjWOoO2c
X-Received: by 2002:a05:620a:45a5:b0:912:671b:d098 with SMTP id af79cd13be357-912671bd4e8mr2727065785a.51.1779204462879;
        Tue, 19 May 2026 08:27:42 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba943761sm1881906785a.11.2026.05.19.08.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:27:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPMM9-0000000FCKQ-2JCd;
	Tue, 19 May 2026 12:27:41 -0300
Date: Tue, 19 May 2026 12:27:41 -0300
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
Message-ID: <20260519152741.GM7702@ziepe.ca>
References: <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <yq5amrxvshxg.fsf@kernel.org>
 <yq5abjebsaid.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5abjebsaid.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_082744_342885_62E76540 
X-CRM114-Status: GOOD (  12.66  )
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

On Tue, May 19, 2026 at 08:37:54PM +0530, Aneesh Kumar K.V wrote:

> if we get force_dma_unencrypted(dev) correct, we won't need the above.
> 
> for dma_direct_alloc and dma_direct_alloc_pages() we have
> 
> 	if (force_dma_unencrypted(dev))
> 		attrs |= DMA_ATTR_CC_SHARED;
> 
> 
> for dma_direct_map_phys(), if we have swiotlb bouncing forced,
> 
> swiotlb_tbl_map_single():
> 
> 	if ((attrs & DMA_ATTR_CC_SHARED) || force_dma_unencrypted(dev))
> 		require_decrypted = true;

IMHO I really do prefer the DMA_ATTR_CC_SHARED flows closer to the
thing that did the decryption. While the above is possibly sound it is
very obtuse to be guessing what kind of memory swiotlb decided to
return..

Can we pass a pointer to the attrs into the swiotlb stuff and it can
update it based on the kind of memory it has allocated?

Jason

