Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65431C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2ro1loNwbkACqpDIeM0PdgrbNZfsWDTHY6fPjx3IQg=; b=q6vLG6QGxeChJzCHFaViTmcZ/Q
	xN7KtDW6j3b0oYtjedPv0492kJ7rjj+FJxNZg0QaGj7lYm2Hb3U+E1bTheLNeb0C95zJW6M2c1Rle
	0zA3Hb5A01FDLR4sHElOR51iU+nzEMnYPb71l/8IL/fteoHTfaoj0paLGiolf6J9gFGkc1pCuRLJL
	88Ga7YsGTJ6U8lYdn6L3gpAf8/4vrGnqxnXQjugeglXulwPlaQtQmAdz+1/HnV7H/ABrjw2+VXPVl
	IAhSmprVXrhVOYAGfBgr221xVXK+2GcZ4H/TI4rqa/vnpPcmu1mVzAibqwrqSmcf/5tHzpoPy/4kW
	kjKCUvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL5U-00000008CwT-3V0K;
	Fri, 07 Aug 2026 13:58:16 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL5R-00000008CvS-2wkz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:58:14 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-92e5b048375so171951085a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 06:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786111092; x=1786715892; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i2ro1loNwbkACqpDIeM0PdgrbNZfsWDTHY6fPjx3IQg=;
        b=Cadm3uLwl7BvBWvnJaK43/7ZKh4n3tlGO/fZyNFnuTATnPnsFXlMKkrwzRXIhofz22
         0K2pdsf34gW4YMwnhxGVm5GBvfIuSjozys80q/OP6jD/std2RltegEO0T6CEFJxwN9Nu
         DvnG6xxB6Xi9k0OXzXyPprE9Pd7XtrDv+PKNkYMmfxyxSznix7jdGpI0BEFvo1esxNgZ
         XbpKRf9r8RCZL9+0t375+BTE5Re9iqXVCSWehIJrwAVh+TlQOiNEFsBjCjLZhz1phNRS
         8AEwojanfJJL/it2qgWG3Eatxbsphs4gKMzXj8fZfKM1Eyn1/SD6QRgrrSlPbJwwRzxk
         ZVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786111092; x=1786715892;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2ro1loNwbkACqpDIeM0PdgrbNZfsWDTHY6fPjx3IQg=;
        b=hKizATcHpMwAbzzJo/YAoMDYAxcV7UTvKP96Ak1+QqnprtbMIvdhwmN7v3/BV/lDHg
         Y+O3AzNF9xrLIYigV9GHY8QP37+ZQIPFwjV6qJBvXr2e7QtUfjbgXccYQ5RD9aXNYYYR
         Pe8x2tWapPxAysccFlIrGOxavstow98kuN84m2Ig4ijZcRQbS7EfYlPxiFOTUFeDwMp5
         GdaYiPltcEKZdAXL6tcgdApnsD8TstJYCWwewfnXfHVOH+g+Vsjz1xHkBMzKby1FPqmS
         P9Um0h8hau/owcvi42+4Ocpk9/6TULXp/Zfm9Rp4GRk/GkLb2PU/CN5SByaf8x6lDCL+
         ggEg==
X-Forwarded-Encrypted: i=1; AHgh+RrUym16+BgVefXByBfdtOSX32NUH+p6NUHidORSfz+hYAG+TJq8AZgTG6+2R4nUwDA4waD1ZgrzgVZQhd3bRkTB@lists.infradead.org
X-Gm-Message-State: AOJu0YxwO+MHKFTxrjNYZlOZljXJB8qLVpeOwJ++z12XzIE9N1LRrGaz
	endQvw0gpm+aPYLLVPCrfN2ZjqZ9agM10PixKhMmuiiXlCOvDDF2tNHkl/uwatM/PlQ=
X-Gm-Gg: AR+sD11+UL9cvxuIUhtKUvMIp+riBrWniydeSSyLlNFuVwNilj68pZ+hVUbZQLoRd5S
	Ya6OsLw7zel/zGOKilWlgXX5tgI95jChOiomn7h+HyVrt/l7VlAPT/B6rrpCIk9BU0H8f4FZp3U
	wNd2lPDP2w+oGfmsj10DViFvPr3iDutjDax/IyZHfwMGFk/1Bn73Is8UlNMw5RYyGM9Jq9OuMJZ
	RSvZfiSYuy4WmQVaKMveOeQPyvBVpLOg5emtf8vx4myYt/deNG7NEHQWx4XhpzUdFkjQ5PQBTYO
	MBiqC7l4J3Fdd8aq3y4/fnGIcrLAzHJkI/SQ9Sr6zwXFngd71fWptFBoocEQmXH5tUk8qoFT5gS
	V98E1Skdq/up8/YcQjiszVD/LVS1ys1Xh3O5Z6Qpbuc0vxjSXhqlShJ1TyudxRQlscYTqLxeRdR
	EbX4UHjoxJqgf2xL4+PmE9DjZIdn7D+sAnNHBcNg==
X-Received: by 2002:a05:620a:2725:b0:916:14f5:8866 with SMTP id af79cd13be357-936490191c4mr2577886985a.16.1786111092001;
        Fri, 07 Aug 2026 06:58:12 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e2971d0sm152121785a.43.2026.08.07.06.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:58:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wsL5O-000000012Hc-2aob;
	Fri, 07 Aug 2026 10:58:10 -0300
Date: Fri, 7 Aug 2026 10:58:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>, Mostafa Saleh <smostafa@google.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
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
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH] arm64: swiotlb: Keep the default size for protected
 guests
Message-ID: <20260807135810.GA200537@ziepe.ca>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
 <20260807092612.2202005-1-aneesh.kumar@kernel.org>
 <anXIZSh9lq99VG9X@willie-the-truck>
 <yq5acxvu2ict.fsf@kernel.org>
 <anXbJ2O4DWgPxCeg@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anXbJ2O4DWgPxCeg@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_065813_821034_B82FB11D 
X-CRM114-Status: GOOD (  18.09  )
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

On Fri, Aug 07, 2026 at 02:18:31PM +0100, Will Deacon wrote:

> > I was under the impression that there is a possibility of using swiotlb
> > instead of restricted-dma-pool with pKVM.
> 
> Yes, that patch enables swiotlb as a possibility for protected guests
> but with your patch we avoid shrinking the swiotlb buffer even when
> restricted dma pools are being used and that's a waste of memory.

I also thought we switched pkvm to use CC-like swiotlb as part of the
alignment in this rework? Mostafa ?

> > If that is not the case, then we could change:
> > 
> > !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
> > 
> > to
> > 
> > !is_realm_world() &&
> 
> Perhaps, or you could just pass the swiotlb= option if the defaults don't
> work for you. Can you give more details about the slots exhaustion you're
> seeing under CCA?

We see badness with swiotlb too, it basically doesn't work out of the
box if you have to use it 100% for real devices. It easily runs out
of memory.

Auto tuning to higher levels makes sense to me, but I'd rather the
core code handled adjusting its size to the estimated need, not arch
code.

Jason

