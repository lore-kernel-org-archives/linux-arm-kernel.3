Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C736C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GF/dZxM95AsUU1wWK1B0B/CUui/snGJUvA0tIkHl1DM=; b=IUBZnRBMsDjoiZrBjIhLZhjN7U
	EUvstRCKFEtp1FUwkuIK09CAohzlUUBvjTLnagPATbH9HSs/EReAvDH7qZbWl84O63nsBOA0mPaI/
	xYA/4CuHykvPvYm15NoASXhsymZ6KrHnofe52XAuBL8o8eyKqUS+uAnXVuv22xobXLGutYIqGblC6
	EiA3XWG5Oq0lm1rs5lMbRCIOpctpDEcDxg9bw3Fa0/Dibd86wN5ZsSekqpglC9ILAjFuwFTOmRr4u
	kLQZo05i8A+bLFr/XSDJsAWW+L4UYWzrQwLlYwKfWwIpS9otFpyGNxdRv8pXpKgKyvr5l8ii2Cgsl
	sAOozWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcMH-00000006qgC-0obT;
	Fri, 03 Jul 2026 11:47:01 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcMF-00000006qew-1azj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:47:00 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-51c4436d02cso1394681cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783079217; x=1783684017; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GF/dZxM95AsUU1wWK1B0B/CUui/snGJUvA0tIkHl1DM=;
        b=Xy1aYaOiFncPNPaBgRz3lAGW5oBbXx3XKP14lMjT63adHA9QDgtRK2sCiaoKLmLvPN
         hAHCt4a3SkEb4anpoNTMCKFlZ9wCxIWJ9lgxyjlrU+SkDftB/2YT8O4vpHANthW16bGL
         bRJ9YXJ810LaVlCzAygN0HUlbCMpTNooTyhNczRZlKiNGKr89rXjBMD9LSlLr3xR1QVr
         I+d04GoevN1nT2WPlRjrUPs1LKbIxH6qOWb3k5XUf4P7d0+SFkMsyBtuplS4DgW6dSDK
         M1I8uNwgk2TNzjeBksa3MApInInoB4Z7AkR7JUMZ34kS2/p88zua7JjRrm/Ls08NyxUO
         GVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079217; x=1783684017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GF/dZxM95AsUU1wWK1B0B/CUui/snGJUvA0tIkHl1DM=;
        b=hMZoUoa2oNZwIaDauswrUZTt+RIz0+YWnH/HPtCFPels44W9/jR5STIhbeLuMTWVIu
         Mu7/2S5JmAy+0yxrW4laeoUI1aDxh3h4MQUzrIIAm7meD0kuN223PMv8Idqqny4zz/cZ
         8k0YAkgMyjHMcpK87YLRvCHvhjE6EnVd3khltWAkwTqgwzj+iM/UycC527FVT8GAhDCB
         EOyl9VDtIzpZC8GufdSNvsdHP5d78l6mSu7V+7jAwSaKob27GQ9x8RCm/8/FFoJ0Jgxe
         vso+xjq5dak2wXHzG6BeXHR9N7NRHE4S27OUaDPdw780bcvGspAuh36pC5LBWAWgd65f
         TgDw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZBc40W4FC5FGTbGCpd2orI0waAitAqMlIhVvs2pmkp7nXqP78JEI8AO7KMiIzYU6o9Iz5uatZ5eAvvu8R3CAe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3HSbzYC2pL5PbJXZS8jgPTlkizCb+z7YoJGU3YkrQUWYO7i35
	Cd/nKx87Pczy7jtH1v7+5RGq5PkafJtiB8dIlqub64W8TKOGiVngUUUhG3W7Qk6Y4I8=
X-Gm-Gg: AfdE7cmrxsVuiEXc+fbFirJy4YyWnEieCa5l0D1ORHrQl6bwFAM+9dm7gflw4I9QIJp
	PX7DOe2wjhfpGcmp9s2VQvjQpJW57V6gW2ov9mqWiI/w05CjSYDniRRCGiaAk0Vv7sNEuPafPew
	vdRR/6TDKcrLeplpL5cFC4RXuHV7jN5CC64H4Mz9AgbNLmFE1n3cLmzo81V3aDNeia3UUAeItg8
	VIVMcDLe2UAavRdgsw7vvM/HZOWkQEVI+RpGhTZonHrvLw4leX07Upaol9fQBQy6fHHumBbGojS
	CAOnKILF/4Rbarc3d1volraYwIxLbJOVr+d0X1+jsEIPkmPs49A2BPOq/6UjislQ7S8PuZTRDaJ
	KWYbpZiP10po5VM/TrS7JYrlUA8MjsVz4T4Rf0rymuKIsf5EjuGn7H7rawzXViw5yzHJVcdnbkm
	JOgNZnQsc2+fokIYhKJui5CKFWoyjiWGZZ5y6jMqUjY3thD+qXpUusrtBuMB4nQM0lSyI=
X-Received: by 2002:ac8:59d1:0:b0:51c:555:7dea with SMTP id d75a77b69052e-51c2ad42df1mr112307971cf.30.1783079216951;
        Fri, 03 Jul 2026 04:46:56 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c4202366csm13366551cf.30.2026.07.03.04.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:46:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wfcMB-00000007ngp-0vd7;
	Fri, 03 Jul 2026 08:46:55 -0300
Date: Fri, 3 Jul 2026 08:46:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>,
	"Cheloha, Scott" <Scott.Cheloha@amd.com>
Subject: Re: [PATCH v6 03/20] dma-direct: use DMA_ATTR_CC_SHARED in
 alloc/free paths
Message-ID: <20260703114655.GW7525@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-4-aneesh.kumar@kernel.org>
 <845d0c8a-6d51-47aa-8e0b-8381e733444a@amd.com>
 <20260617154101.GE3577091@ziepe.ca>
 <25155bd6-4348-4aa8-ba70-0a882fc84db9@amd.com>
 <20260630160242.GI7525@ziepe.ca>
 <98800d21-18f6-44d6-9ba0-da9b77567d85@amd.com>
 <20260702144729.GP7525@ziepe.ca>
 <58bb92a9-c5ea-47a3-b19a-934573f15305@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58bb92a9-c5ea-47a3-b19a-934573f15305@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_044659_541361_946BEBC9 
X-CRM114-Status: GOOD (  21.60  )
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

On Fri, Jul 03, 2026 at 08:15:49PM +1000, Alexey Kardashevskiy wrote:
> On 3/7/26 00:47, Jason Gunthorpe wrote:
> > On Thu, Jul 02, 2026 at 10:25:16AM +1000, Alexey Kardashevskiy wrote:
> > 
> > > > > not externally available so I'll have to trick the DMA layer into
> > > > > using SWIOTLB (which is still all shared, right?) as I specifically
> > > > > want to skip page conversions. Setting low DMA mask won't guarantee
> > > > > that the DMA layer won't allocate a page outside of SWIOTLB and
> > > > > convert it. Manually do
> > > > 
> > > > Why so particular?
> > > 
> > > aahhh I missed "pre-". I need a way to get pre-shared pages for my
> > > sev-guest activities.
> > 
> > It sounds to me like you don't, what you are worried about is
> > optimizing the dma_alloc_coherent flow to avoid fragmentation and all
> > CC architetures require this optimization.
> 
> It is not about fragmentation, it is about unwanted page state
> changes when few pages are shared for a very short time.

That's really basically the same thing. The responsiblity for
optimizing the shared/private conversion lies with the DMA API not the
callers.

> When I needed these pages, I could: get a private page, convert,
> (possibly trigger RMP and IO PDE smashing if that 4K is backed with
> 2M), do the VM<->HV communication, convert back to private (and
> possibly unsmash the page).

IMHO it would be better to use something like dma_pool to amortize the
coherent allocations instead of trying to hack with swiotlb.

Jason

