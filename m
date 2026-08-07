Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603E4C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYbufw58gsel6FCE1/jEcLG9PAf4/Ixif2gUvboMhY0=; b=XvXBo2Izxr5TyTMPnk3DRGCL4H
	2j2Uw1GlGL7DzP1H/IikcWALkiP9NQPwyaCB2dQe0NLepmr6z/G9WBGlGA2oqQ0FpUbNFdEGQht3l
	BzbFUCvwwCw+FWBD+J12YdM+TKGdbhL0jnsB3HrwynXxGQrau/AivV+dQtuDVnylCj6+qybXGGMaa
	EmibeQT6bV0+MsnE1e1wmLeSeMjcutVBB8WSua4GxezWKXoEw81LqixQ2U8z/iLQrRIokwvlqdjbB
	GPgTbFlm2smEt0lBRI9W3knAPlhSI5Md1Lhp1XvAW8Qv3bHVeWcHwfxgq4fWhf1Apo6V/rFWXl79P
	Q1C0WsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHF0-00000007YdB-1wU2;
	Fri, 07 Aug 2026 09:51:50 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHEy-00000007Yc4-0n8a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:51:49 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6a177b2dc8dso9911a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 02:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786096305; x=1786701105; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QYbufw58gsel6FCE1/jEcLG9PAf4/Ixif2gUvboMhY0=;
        b=g6/YUtoPqU/mdGIyxrPrIqLSflE9CuxUq7pfZlx53upNCpG12ZtT4/Xsgl1zKXf+Tb
         4AHy5nNKFjfI8S5/dzo5568elIUyX/y3ECRXByeXU8D20QLdEqYC8qAuJKZI2crW/ZG1
         KhlZH74vlXBx5XLELZ7WWrsg0pKs2obU1aWMjwGSSfi/KswOP7ncGFZTNjDVpd5pdMUb
         L3sHFj7+Ez5C7Hfy+oytbGW3Sqd37w1nV7VoowLs8MWQHndIS9sCZwmJRdJGS/QdfN8Y
         IiH0iuH9JX8sUQwtTsvyk9iw2Yh+dx7P1q+zUBLSIab8bgaELDcp3w5L7W+y0BtWCHcP
         E4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096305; x=1786701105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYbufw58gsel6FCE1/jEcLG9PAf4/Ixif2gUvboMhY0=;
        b=Kr6eS/OYWUWogJTKMiU8PXoa2w9ROwbmsNywtVakpgxIGHUKm57B37jC3J0677DtAC
         u6/EG5izth8gBd9OltroUp1bZ6IY7WAv7/ctyIHIQHp/bs3iyi4x9r1e4ulLQLSdy0RY
         UIhvNFZ7QZccsUNtqnvryqM4sJIAy23dmT8b5VsRPI2U6+7inwRD4itLYhIn/rdtLMyr
         B9Jl60Fu6KocF/zEMwcwqOHZQk2anvPXicR9N2y/rT0R1FLBudfMuIM7v6wUNoHXRZQi
         30MylkW/Pq0WdeapImE6S4U2LHkIMZ9Q3SVFPTsBu8Tz16YmoQIYm7ku4++2+5GfmwiH
         gAug==
X-Forwarded-Encrypted: i=1; AHgh+RrmcbfJLO2BwTosuTumlI5IQgYxoWyajM4IoG2oRX/JYuBggfQB4IebCJPJUigpdsWaELFgfZIT/FQGVwMIwGbH@lists.infradead.org
X-Gm-Message-State: AOJu0YxV1iICfYEksSjIdGs9Z6/aEB76bpvWi3v374irYsdIa5HRfUMB
	B2UR1ciDsbMdMZpLf1zxH6hYfwgl68W0YTBLfNtIvqtTBCusc98YvAznKoa3kHWO5g==
X-Gm-Gg: AR+sD13/SM8/3FtdE6xoB4ezhigl2/38M59HlK0KJchDoyQIbiF9QyeFrR4XN/kOYZ7
	mIYZEZ/3Pwf1GioW8mMt7P6jL57nWHQPuGsksQPRs3MzKsyNTMf1hCWK0KTrgcSsB6gOZQXczih
	VZc8+27UJFM5nJCqwwQ5Nwi8PpotUxorjEN+uyUWluNluIlaSuX6DHNGnQC0+yygcblYfv8bQWn
	RQPwCeE8ntUd4OuZxu4y2THySKrbISPYTxGTM7ZUziNmzJ/QhL6goP6m2eF3HCTIGwuDN8rc3O7
	UwdTY1CUm/yhb+AbhzKFUm17HssySR5QXcFbooWuQsTL12V7hZ3pRg9mCKCZTY4uUDUtkPtrgff
	cS+YJAAyB95rcPDMZkwv3a6W3sycrLixVI8YuWpcKRcuQ3YhD1nd59Joqw9SviCYiu9/14dioQ1
	5vzYWttq+c+N0Jz5+28MO94+uu4pOfwYQkaHjFvOlzdo5WnezTArPnb7GuCAzlpjkIq0gPFOqq6
	VbAFdCvN/iwcmy2itZom2j5bapLSw==
X-Received: by 2002:a05:6402:a5c6:20b0:69c:cf5e:a504 with SMTP id 4fb4d7f45d1cf-6a1da7b32camr36697a12.8.1786096304665;
        Fri, 07 Aug 2026 02:51:44 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a6fa80sm32856466b.22.2026.08.07.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:51:43 -0700 (PDT)
Date: Fri, 7 Aug 2026 09:51:39 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
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
Subject: Re: [PATCH v8 00/23] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
Message-ID: <anWqq-vjEwwaziaM@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <CGME20260725070930eucas1p16cbafb514de7a2e7531d0e4ae158acfb@eucas1p1.samsung.com>
 <yq5azezfeeax.fsf@kernel.org>
 <85be992d-9567-433e-ae2e-64ae5483964d@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85be992d-9567-433e-ae2e-64ae5483964d@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_025148_248395_14A23203 
X-CRM114-Status: GOOD (  18.21  )
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

Hi Marek,

On Fri, Jul 31, 2026 at 09:33:47AM +0200, Marek Szyprowski wrote:
> On 25.07.2026 09:09, Aneesh Kumar K.V wrote:
> > "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:
> >> This series tracks confidential-computing shared DMA state through the
> >> dma-direct, dma-pool, and swiotlb paths so that encrypted and decrypted
> >> DMA buffers are handled consistently.
> >>
> >> Today, the direct DMA path mostly relies on force_dma_unencrypted() for
> >>
[...]
> > pKVM topic branch is now available 
> >
> > https://lore.kernel.org/all/178467286876.125042.12010461715645610054.b4-ty@kernel.org/
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/coco
> I've just got back from my holiday's and I see that there is everything ready to give
> this patchset some tests in linux-next. I hope nothing will break.
> 
> I've applied this patchset to dma-mapping-for-next, on top of pKVM topic branch with

I was trying to find this tree and it seems the MAINTAINERS file have
the wrong address:
DMA MAPPING HELPERS
M:      Marek Szyprowski <m.szyprowski@samsung.com>
R:      Robin Murphy <robin.murphy@arm.com>
L:      iommu@lists.linux.dev
S:      Supported
W:      http://git.infradead.org/users/hch/dma-mapping.git
T:      git git://git.infradead.org/users/hch/dma-mapping.git

I believe the corret one is:
https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git/

Thanks,
Mostafa

> patch "[PATCH v8 17/23] dma-direct: make dma_direct_map_phys() honor DMA_ATTR_CC_SHARED"
> rebased onto latest changes in arch/arm64/mm/init.c.
> 
> The remaining items pointed in the review can be fixed incrementally.
> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

