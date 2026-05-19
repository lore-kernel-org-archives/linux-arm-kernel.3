Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509AECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+e/82ARLCMhJAFToMBvP+HlY35DA3/x25Ks+dxKl00=; b=G0Ff1K/0ZABjNcNSkPfFcpRC0o
	T28vDohv0WC8Qnwjdp7MfD6qyaCrXpgXjAZwUYmkQwnW/lR5NYjSi5dSOQVIuQpeM0V/pPpygAHgr
	lWC1AsG5h82Ry5iAp98vMqigTjAzKAKnsx+REc38kJtw/hdqRELw9K+pIxf0jq5n+Kp1YGT4ZwNCA
	RyRQ2GT+AOpcPs2AUh+ZUSpJkm6039spil/mexMh9f6gQjptnoauRL/Yf45XuZEKOeDAvWkKefAtE
	Qd4Rv7h7DtzuXhrXrlUTQ+4HqvCFoz3WXlNk/aC/Zb9EGk/Yiw059LQlemc8vxVD0nb3wjqLNRSZ6
	lcVNoi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIFi-00000001Fcw-3jqs;
	Tue, 19 May 2026 11:04:46 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIFh-00000001Fbu-0Bw6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:04:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779188682; x=1779793482; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a+e/82ARLCMhJAFToMBvP+HlY35DA3/x25Ks+dxKl00=;
        b=Rv6fiMEShJxDYjQAwJGbUKstqlUNn8zCQoJjMJJdcDQORr1hNkTcjf+cOTUoSYptsm
         BKKroJDhZLq5PTlKDjD86aVhJZQbr29UaWgC6rVBVC7xOCq4ZbAVVmhss12aBNlib/9B
         I7WNYp6hYOCkHYQfmuR2CiOEew9KboUUqjpIQM73bY/1bk10wE31pT/rSbxoGpU7tash
         cn8yuf3YssyeZhu4zofWA0Fd8+/flAIOoqvVJ0/Y4Kt+a7rr5/NheH37kPSG185u7fTS
         qGuO7OBq7kNSnnE2ZuyEVMGLoeEXfYf9nChR/mNrVP8cumFc0mDLzVyeB+ACSAkocw+x
         WOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779188682; x=1779793482;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+e/82ARLCMhJAFToMBvP+HlY35DA3/x25Ks+dxKl00=;
        b=qqnQGqbNbS/AmNBDwOrFHGlTlh85NMsTYrAFqHZoUfo0CdNgkrGTPZUDbf6FTA0mP+
         aw1wZuvDeDEkIgqk4j3odcOKBLJT4u+oe1UzczJrpUCIm9R+EhB+xXyoPjBojw9I7trD
         GnufH9thKUlSy128EcLbpzLVnMtekCtiQpajLV694KLm2mXIxMkHplEYCU+CI/kQHBg4
         q6H2cUdfqujro9SGAr7LFl9C7KFmJgPiyuChdWjwg3pyo+RtFhXlQaRPrSSK5oJtiwb/
         FM5ybdyfRBhVN3VP/xGkZZy6pC0gQWlylsz8/c5G/DHDwhn6kXCUsh4hOTvOj8mWd5j6
         IaeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CyPW0I0wTx3fFoYnAhG83x7+uQ9kJ1W2yci59CrDoVJYF5vdlqd737yNHGBTLeo+0+DqQKRzLJ1dsWZvt/4OW@lists.infradead.org
X-Gm-Message-State: AOJu0YwBXpN0jW/4hykkF+9eVrPmLwqfcoBkvZlzySD/ZmkZWpFHIDIH
	bnLG1zYkZJjjPe3M5Wie51WOhn4ZGJL+jNPf5/Sbp1lA5t4LnBpNtmObOns5ey4WrQ==
X-Gm-Gg: Acq92OH8wKwrYLdcnBeooiKTEMZnenSK6+DyTV7dbVHwPLB4EmVdAeHwFkdZLxZLX+y
	LnKFifoCfIXysyXuSmUeUlmBgezcgwLLXj2xuHK96lH3lPLThsR72CJAigNzdvGIluwnjyGR6MW
	1aWa1muCGi5UFSIGyRtg/NfHScFF3paQZSIVo0Yl85jI4idvxQMJB6AQU4Rf4yKftTB1qNElLOu
	KTpHLXYvmKxMbmRiJ+FZloUOZGIFZoCf1LLBGgooa2eTnhXVrd4HVb8uDzVbDP45iMOwScszFhd
	AOQ1ZWKhI6RCL++a+brLil4khXBSEuoSt9yaNH3JILEBT6Zg4y0P2UulcsyuNLdtettuBKWBI3y
	jhjPLH40cuaIlkEWaAx4V0t2FB4+x6vjs02vennnK9GfgJDV08/k6ORnMkQP14SBLyrFcdywMRQ
	Z83DNkFg628OdTS7D1zW11ZFWx7z33MD5UdrgYgoFJBXnWisNm0sGg0Gch9fYHJy5RBEXpcpAry
	OHanpy0kujsSQ==
X-Received: by 2002:a05:600c:2183:b0:48a:5d95:d33e with SMTP id 5b1f17b1804b1-48ffa5d593cmr2833855e9.6.1779188681631;
        Tue, 19 May 2026 04:04:41 -0700 (PDT)
Received: from google.com (136.41.155.104.bc.googleusercontent.com. [104.155.41.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c834besm340461595e9.3.2026.05.19.04.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:04:41 -0700 (PDT)
Date: Tue, 19 May 2026 11:04:37 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <agxDxdxynp4KEovA@google.com>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5ah5oa59wy.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_040445_139706_1067955A 
X-CRM114-Status: GOOD (  25.34  )
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

On Thu, May 14, 2026 at 08:13:25PM +0530, Aneesh Kumar K.V wrote:
> >> 
> >> What I meant was that we need a generic way to identify a pKVM guest, so
> >> that we can use it in the conditional above.
> >
> > I have this patch, with that I can boot with your series unmodified,
> > but I will need to do more testing.
> >
> 
> Thanks, I can add this to the series once you complete the required testing.
> 

I am still running more tests, but looking more into it. Setting
force_dma_unencrypted() to true for pKVM guests is wrong, as the
guest shouldn’t try to decrypt arbitrary memory as it can include
sensitive information (for example in case of virtio sub-page
allocation) and should strictly rely on the restricted-dma-pool
for that.

However, with my patch and setting force_dma_unencrypted() to false
on top of this series, it fails on pKVM due to a missing shared
attribute as Alexey mentioned, as now SWIOTLB rejects non shared
attrs, so, the DMA-API has to pass it. With that, I can boot again:

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 5103a04df99f..b19aeec03f27 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -286,6 +286,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	}
 
 	if (is_swiotlb_for_alloc(dev)) {
+		attrs |= DMA_ATTR_CC_SHARED;
+
 		page = dma_direct_alloc_swiotlb(dev, size, attrs);
 		if (page) {
 			/*
@@ -449,6 +451,8 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 						  &cpu_addr, gfp, attrs);
 
 	if (is_swiotlb_for_alloc(dev)) {
+		attrs |= DMA_ATTR_CC_SHARED;
+
 		page = dma_direct_alloc_swiotlb(dev, size, attrs);
 		if (!page)
 			return NULL;
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 4e35264ab6f8..8ee5bbf78cfb 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -92,6 +92,7 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
 			return DMA_MAPPING_ERROR;
 
+		attrs |= DMA_ATTR_CC_SHARED;
 		return swiotlb_map(dev, phys, size, dir, attrs);
 	}
 
-- 


I will keep testing and let you know how it goes. If there is nothing
else required to convert pKVM guests to CC, I can just post the patch
separately as it has no dependency on this series.

Re force_dma_unencrypted(), I am looking into a safe way to use it
for pKVM as I beleive it will be useful to eliminate some bouncing.
However, that’s not critical for this series and can be added later
as I am still investigating it, if I reach something I can post it
along the pKVM patch above.

Thanks,
Mostafa

> 
> 
> -aneesh

