Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3525CC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zClWOUjkDWFvMHOUBkD6PB+uKy7SGdgOfe7bM5K85sk=; b=cCy0dGUDPwWHvt4MRN+T+qro7N
	Rol91pgbHiEOYiM1N5+s9Cmfo+9nyA4t8ph63A8AfHT0X6XNrtZJJ3f9pK5AkTxQeaxpNo7YnUsiO
	AqK9axX/DhUsoNkjDRpHE72wB1mMQzI2Q5Hkevg4owJ95LSXnRGeRjdi1gVNzw8wipJU5wuaewB+R
	J6+NT8f7SzIH42qr27jjjO+loiIagdHXwmAgKj6AzRxwtyzTUHSVRjbxi/c/a/X3TBQw7nsja6LIi
	lh8xDjDl05bBEB6SW7oDffyL3Y8HP17DarhpTfVwb2dmm2Ckbg5WMBgeR22Ph2zvnaq8j1sykx7mC
	+FmWmt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecTV-0000000HabW-3MdB;
	Tue, 30 Jun 2026 17:42:21 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecTT-0000000Hab9-3BFa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 17:42:21 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-51c08df8513so15348121cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1782841338; x=1783446138; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zClWOUjkDWFvMHOUBkD6PB+uKy7SGdgOfe7bM5K85sk=;
        b=BvT7pqMXtxVlaKVGegTRKVlxiJZv4hbEGECmphNNC65ReCqzDqWia1+mN473zc1y3A
         BP5ROeR9wjsjOpDakCDUfSZBHQBUUS9QgfmNV9iZmHyWLBZaKwcafaQ4rkh0JTIKfk4j
         G9Bmm1zvPx4Am+YXKV1/20EXKlZdPSUydN3XxYsFEn04RUmh2WmVT5XBBupchAmJLBln
         d+Y3R3n83q+hhgnlYRtdWyStpraCDlNmoV9KAhG6agodwJZarpCKveExstbsKWBNhAgc
         H81h/NcS5VbEA1UyU5IGb1YK3VRb3qdO6HugvlzOyJlPT2pyA1zRXefm+dbgIJtw4hGN
         LMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782841338; x=1783446138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zClWOUjkDWFvMHOUBkD6PB+uKy7SGdgOfe7bM5K85sk=;
        b=qd9yrl1W3Bk5aelp9z8Q4GunCAgRIpS+3HDaYU7Nw9vgIiowRrUiY1FCtctZFIDzIa
         o30z/sjd7SmaPjgYu/LEr7wBlIgH/5eB9F1iv7cutVkI4ySFvscyj0xW6FgJxfeisjxJ
         2pnXFowcH3qsdS5wZwzBG3BsfDaCn/nHi+lsmNvJOBLqjUjwFtIu7tcIVxR+HB9LL7Eh
         a3NQVN+RnkbpTKtyDXMZcHB3nzSZWUT4hAgHwlOIrm7JLFzD0cuF10OW1IQHMQI8Yf+s
         gRmfSlpu/TDScCaI63x6rzyV8J2ppF7Z0sd4vdRz+2tbSILzyvR7g24O28sJHoVCNTw9
         3LPA==
X-Forwarded-Encrypted: i=1; AFNElJ9F1TIFj8QFB95LD1VNmYAWXSOm45z9I2Xrgjw497XZ0kQx1IkK1VdVTKR9YiNiaNQSTYHeREyeYM/JSxAKr4R3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/ldjGZbeE/3iO8kab+Yuir2CrIbfn1CHCoYHCxLd3Arzjd4zy
	GAbCB+Smk1sr/GqfzlLOhOUHCQfC52/pAzLuv00w79wJurM2pKwN2V5O5s04+BQJCKA=
X-Gm-Gg: AfdE7ck5QsxRCUUaR25n7Qq3TeEdkp6Lnex7fcwWxN1cgz3q5YToN48GqS5GVrnp21B
	f50zMSEzRWUOiZQr6bTqmuBsTLkm1p5wcMixPDI3YPgEf3ZCs7LU8xp+5T0mVF0oY2R5ebGvun2
	wP2iR+fkwtfzmrnRJ/E5fsoPN1J0GiawEKVULlyZ7ASrSuHZagxNSofjXSOxWUwuLitLqMCIgEn
	NjK3I7xYQhIAQR5WXBFjdABuAYNgxKPh7YjqXZ78FCDhqiQ21sndc0tPwg3Cj4ZWRUuE6xJM7i5
	/r2G7NxobRGoJ4oz8ckn1Dse0jrVUmaam0l0c78hlfyObofKn4foiiFGRuQLSZxrxeZ1jcH3tSs
	fivJFKwRcKqc2/WTIxXwiQpMadPbeWdASzCn4enGd8oBfvXIzo95ptpaF4tuETBH1r4y+DqjMXP
	CJm6K8dxl9tYbc09dcHbZmUBtTwUVlv8TlRaB+QdiZEU8oV4Jvb4PxjIZAM+Qr7yTXtug=
X-Received: by 2002:ac8:59d4:0:b0:51a:8c99:1f14 with SMTP id d75a77b69052e-51c108ca48fmr58918701cf.67.1782841337969;
        Tue, 30 Jun 2026 10:42:17 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c1080d4dcsm22942861cf.5.2026.06.30.10.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 10:42:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wecTQ-00000002FOX-35V1;
	Tue, 30 Jun 2026 14:42:16 -0300
Date: Tue, 30 Jun 2026 14:42:16 -0300
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
Message-ID: <20260630174216.GK7525@ziepe.ca>
References: <aigYbK12D8uKQvJF@arm.com>
 <20260609144746.GL2764304@ziepe.ca>
 <2ecfa1a8-6202-4319-9692-a6ffeb5a3dbf@amd.com>
 <yq5aqzm4dz25.fsf@kernel.org>
 <20260618153705.GH231643@ziepe.ca>
 <yq5ao6h6enhm.fsf@kernel.org>
 <20260619122148.GL231643@ziepe.ca>
 <yq5aldcaejos.fsf@kernel.org>
 <20260619140616.GB1068655@ziepe.ca>
 <yq5ao6gtoncp.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ao6gtoncp.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_104219_884553_F2F0C388 
X-CRM114-Status: GOOD (  44.12  )
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

On Mon, Jun 29, 2026 at 12:16:30PM +0530, Aneesh Kumar K.V wrote:
> >> Thinking about this more, I guess we should mark the swiotlb as
> >> cc_shared only with  CC_ATTR_GUEST_MEM_ENCRYPT instead of
> >> CC_ATTR_MEM_ENCRYPT as we have below.
> >
> > The name cc_shared should be used for GUEST scenarios only.
> >
> > I guess there is some merit in keeping swiotlb using "decrypted" to
> > mean it usinig pgprot_decrypted and set_memory_decyped() which AMD
> > gives meaning to on both host and guest.
> 
> Are you suggesting to change the struct io_tlb_mem::cc_shared back to
> struct io_tlb_mem::unencrypted?. 

Yes

> > IDK what AMD should do on the host by default. I guess it should setup
> > a swiotlb pool of low dma addrs "unencrypted", but not "cc_shared"?
> >
> 
> If by low DMA address you mean using an address with the C-bit
> cleared. 

Yes

> The current code already does this and uses the swiotlb pool correctly
> on SME.

Well, through the force_dma_unencrypted() hack...

> The challenge arises when we want to force SWIOTLB
> bouncing even for devices that can handle encrypted DMA addresses (more
> on that below). For such a config force_dma_uencrypted(dev) will return
> false and swiotlb will be marked cc_shared/decrypted = true; This trip
> the new check we added.

Yes, because cc_shared (guest) and unencrypted (host) are very
different things and we've mixed them:

> 	if (unlikely(mem->cc_shared != force_dma_unencrypted(dev)))

I'm aruging force_dma_unencrypted should mean cc_shared and be
guest_only, but the SME hack breaks this.

> We can also do
> 
> 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
> 		/* swiotlb pool is incorrect for this device */
> 		if (unlikely(mem->cc_shared != force_dma_unencrypted(dev)))
> 			return (phys_addr_t)DMA_MAPPING_ERROR;
> 
> 		/* Force attrs to match the kind of memory in the pool */
> 		if (mem->cc_shared)
> 			*attrs |= DMA_ATTR_CC_SHARED;
> 		else
> 			*attrs &= ~DMA_ATTR_CC_SHARED;
> 	} else {
> 		/*
> 		 * Host memory encryption where device requires an
> 		 * unencrypted dma_addr_t due to dma mask limit
>     		 */
> 		if (force_dma_unencrypted(dev))
> 			*attrs |= DMA_ATTR_CC_SHARED;
> 		else
> 			*attrs &= ~DMA_ATTR_CC_SHARED;
> 	}

If we do this I would like to split the force_dma_.. functions into
guest and host, ie force_dma_cc_shared() and force_host_decrypted()

To make it clear there are two very different things here.

> Here I see value in having DMA_ATTR_UNENCRYPTED. The question is do we
> need to split this into two flags and introduce the resulting code
> duplication.

The external flag name should be DMA_ATTR_CC_SHARED and only used on
CC guest. Internally that turns into using set_memory_decrypted()
which works on guest and host for AMD. I don't know how to make the
host only case clearer and still keep the code efficient..

> > The dma api has to detect, after the driver sets the dma limit, that
> > none of system memory is usable when:
> >  - The direct path is being used
> >  - phys to dma for 0 is outside the dma limit
> >
> > Then it should assume the arch has setup a swiotlb pool for it to use
> > to fix the high memory problem.
> >
> > Similar hackery would be needed in the dma alloc path to know that
> > decrypted can be used to fix the high memory problem like for GUEST.
> >
> > I guess some 'dev_cannot_reach_memory(dev)' sort of test in a
> > few key places? Setup with a static branch to be a nop on everything
> > but AMD, compiled out on every other arch.
> >
> 
> If we are not able to reach the memory because of the memory encryption
> bit, then isn't dev_cannot_reach_memory(dev) the same as
> force_dma_unencrypted(dev)? If so, that is how it is already done.

Sort of yes, but it is properly named to its purpose and not confused
with what should be a guest-only function.

> x86/dma: Disable forced SWIOTLB bouncing for SME IOMMU passthrough

Maybe as a crutch to get this series merged..

Jason

