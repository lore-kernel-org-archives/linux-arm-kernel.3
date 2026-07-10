Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339F1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wu7pGf03sdcW+GKZ7Iww7/tPEwPDkL98YpGrOpuCsUc=; b=OororUBD/oOTYzbhyrK2gg+Xoz
	xt/AyaEuim4Gnj2kfnMxhWr1ms1ZWBLCTKVPThd/9WcwVqEfiJltLhoKIZsBerXhwX8EfYs3pZ6MV
	MfWjzjcdQE3UcQhNe/WDE2oAODr9t05Tf8IfFucr/dZ2IIybKfxHsocsZSYBj6Hg/epKwqT59E2RE
	ngTN0J0sgB7vpyjz2qNjJ/ENOSnRuV0sk0MF3mxPtPTMzIVJlxIFDiwn5ifyy5DiEBCBERi5BMVDB
	TFZZYIrbWM1qNFCfo16JbyyeViZQ1qVX/8zb4VryHL49C2B6UTlAd+iFVNAPCnRLSCCPESiR3RJKe
	OGcRV5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDxE-00000005H7T-247l;
	Fri, 10 Jul 2026 16:19:56 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDxB-00000005H6n-4664
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 16:19:55 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8efcfdb2b43so7349396d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783700392; x=1784305192; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wu7pGf03sdcW+GKZ7Iww7/tPEwPDkL98YpGrOpuCsUc=;
        b=cKI8tub5UPl8g/MYX8JwdaJ/5rRB6z86nl2xvAMaHWmzt9NUdDYEAMBmyRlFot5hw1
         weH754sI4+SiEbGItk2pK1Jxs4HRLR0wciQqxtl0gQPIKY4/h57BNR8s3liDZbN85ZQ8
         LwTd53zBSACxqWIqOVWa3/8SDF87feKQxR9c/NI3+II382vtRFE5OKl2L9a9/jSYq5N2
         abEJ152jGDIaLI2LuAK+D9r4msVcaG4pbk74X2jDCodubvrdBwbRF/9e3XoeqBDtLItW
         bpsc/UlsFxXHMUdcFepQCqo0P+hgwCv1n7TeG0aOZ65YxjgIYkXqNLZaziw7pCU9Ra4c
         liUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700392; x=1784305192;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wu7pGf03sdcW+GKZ7Iww7/tPEwPDkL98YpGrOpuCsUc=;
        b=TU6ohxcyuY6mJp/HinlINpSRyHCWn53vdW3bATZJnaDz4deTINCk/lwwcuzjvT55ES
         m7ptYkxtpddL6MPMcSLOAFPRu/bIwNcYCmQXug5N0/stC9xpcWZKAQIQ0Wx7N7Go0JWi
         hcL/yqac2Pkp+ZWVFzzsinZZuIxLb8QXTPS5/7l8Jycw1L5QVnxDeW+jaJW8TLoUyJMC
         83F75cCScxjhECNmIYEAesIkDYjZwvpNiOho0DOgP5baMP0gb9h8H8w0asrwe3QWKrPj
         znYfLpEbx+uohrNotfj9kKYybNH4GvLOu1T3QfjtOjV4kPhnaz77wZFzSm/KOTtRAG3V
         4Wuw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6M6iKxn89Ja5qOf60lrJhMOrBJz4rfjaeV29b6LbaEM2V8QIlqJUlIYQFDVI3oBAGAPwvoyPZC1RVraO4nwEL@lists.infradead.org
X-Gm-Message-State: AOJu0YxZhB3tyKf0hQLPn/VH+8kfGTgrMMihcZ1u2BcCjcAyjdptwLm1
	m6m/QliOmu40Qlv8DXl2cbPw3LTH81JgpVTZ0aWat20ondQ/3iJJ6sMDaoZ1BtqZy98=
X-Gm-Gg: AfdE7cnl54RmexxD/MDkxo9Rz/Lu1axMw+v1oDbkCNy/6a2YtughzQzMi0ahScKJ/u9
	coFAr+P+4QEUJ7Pbv7R8/gc/WUnIEZo1QYJoa795D7USra+hQ6hE1MOcSJz7ynDbk8QmhuJXIgF
	gEYOOpQ+m2Jg7tY4Fpr6mIB71xfq86pOsnGuHhEthC1+X/xUby9JYEcfbeSiG34QzUJpRhWIhLV
	HXPdXLTAeLjOwjPv3IXF0/68kfSzpJsxeb7y73/Vhz80keSBfU2Tq5fBx5MZtaQFkKVtV2+vTfi
	YM/QixFTiVk4asXy7y5ImVUHsgUss5pOBnfsmcZ8rF/dHoje78DjhsckilIQiPolLZbzT1hdGxR
	6zh5CZHXFB+iyLaOAbtnVK6IJ15OWvcRU/bPGh++aVlO24GkWaJWrC4K1HbLt
X-Received: by 2002:ad4:5743:0:b0:8f4:870f:72bc with SMTP id 6a1803df08f44-8fec3cf5d44mr142091486d6.51.1783700387612;
        Fri, 10 Jul 2026 09:19:47 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56bf455sm44263206d6.13.2026.07.10.09.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:19:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiDx3-00000007We8-41pt;
	Fri, 10 Jul 2026 13:19:45 -0300
Date: Fri, 10 Jul 2026 13:19:45 -0300
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
Message-ID: <20260710161945.GO118978@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-17-aneesh.kumar@kernel.org>
 <ak42F240d-53QeFN@arm.com>
 <yq5apl0xgy89.fsf@kernel.org>
 <ak-CT3oanlDfgTy4@arm.com>
 <20260709181336.GM118978@ziepe.ca>
 <yq5ajyr3h106.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ajyr3h106.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_091954_026952_CE292121 
X-CRM114-Status: GOOD (  27.93  )
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

On Fri, Jul 10, 2026 at 10:52:49AM +0530, Aneesh Kumar K.V wrote:
> >> > 	/*
> >> > 	 * For host memory encryption and device requiring unencrypted DMA,
> >> > 	 * MMIO memory is treated as shared by default.
> >> > 	 */
> >> > 	if (attrs & DMA_ATTR_MMIO) {
> >> > 		if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) || force_dma_unencrypted(dev))
> >> > 			attrs |= DMA_ATTR_CC_SHARED;
> >> > 	}
> >> 
> >> Yes, I think it does the trick, preserves the current semantics for AMD.
> >> I guess you could use a single 'if' for all checks (up to you).
> >
> > Please don't change it, MMIO P2P is broken on CC systems today and it
> > should stay broken. Passing DMA_ATTR_MMIO with DMA_ATTR_CC_SHARED is
> > an error that we need to correct in the drivers not make work in the
> > core code.
> >
> 
> But the above changes are intended to handle HOST_MEM_ENCRYPT. In v7, we
> had the following diff:

To follow how the rest of the decrypted/encrypted stuff works the MMIO
has to be flaged with CC_SHARED for HOST_MEM_ENCRYPT too, just like
the PTEs.

> @@ -88,37 +88,40 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>  {
>  	dma_addr_t dma_addr;
>  
> +	/*
> +	 * For a device requiring unencrypted DMA, MMIO memory is treated
> +	 * as shared by default.
> +	 */
> +	if (force_dma_unencrypted(dev) && (attrs & DMA_ATTR_MMIO))
> +		attrs |= DMA_ATTR_CC_SHARED;

force_dma_unencrypted() says nothing about the properties of the
address passed in, this was nonsense :\

> As we discussed [1], that can come in a later patch. In the meantime, adding
> the HOST_MEM_ENCRYPT check preserves the previous behavior for SME.

It never worked. When we added ATTR_MMIO it started to have a chance
to work but prior to that it was always broken anyhow. I don't see
there is much merit in preserving the narrow window when we
inadvertantly had a half working ATTR_MMIO.

But if you really want to it should be
cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) *only* and get rid of the wrong
force_dma_unencrypted().

But IMHO, I'd rather this series treat ATTR_MMIO as private MMIO and
ATTR_MMIO|CC_SHARED as shared MMIO and that's the right and correct
thing for the DMA API.

Jason

