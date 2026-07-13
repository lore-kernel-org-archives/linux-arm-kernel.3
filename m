Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A62C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 18:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3LqUwIJYp9NQ4diqGbAZyVDrYnzRQFmiULYhYdIqPw=; b=rUw7MJRN/gEpQSTZ3o3j25Q0CD
	vt2isq9aCBczeMvzyAZSkn0GW8PtAvvh3dQPwS3J6Eq096Ywdb98GVEhkDKB9XKYwybjMbgoVQHQo
	ptZ9326dAW1ZjMaS/BmTGxedzHBAAdpJZIPTiAxmmIj4TSstkbFuWGcF5WONp0lA005oPeTwM//sC
	ibxEk+lIXO+LdAbmUm3ZCcuDaJCSAhR/puTfZrqxRWCKJB5v+CsFeOmtqFplFkkmWuOHmy4a67iur
	GOhxMCOGyvUsudUsEZMt8doujpJBqQePGGCYe6sTDY6Cw6WGxP29QfI1SJZA3Kjx0rXk5QSPSS+vU
	X/3gmjkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjL7Q-0000000AB16-27nC;
	Mon, 13 Jul 2026 18:11:04 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjL7O-0000000AB0l-2IpH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 18:11:03 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8efcef23d21so30778946d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 11:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783966261; x=1784571061; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r3LqUwIJYp9NQ4diqGbAZyVDrYnzRQFmiULYhYdIqPw=;
        b=FdOLFyVR1B/C6iFQpHpbsthvmDN11YfbPRMSwCFlso36OHCQhgoo4Mz2i/JRmDCHM3
         jGfTHJZyZrhEndB9m26DzSTwaTzZ08DCWmj5bqUo4BaTJhCWSYXiewT4vIpbZ/UcmfO3
         nqN+X7Eqw38UL5P75K1bJCUB+8x3gcCzpjmVeEJwzlMPRbdgFleIyqAqv7N9mlYxVbNl
         ZvmcU+GTZwTZ7ODOxmpmSkgCtd2QPDASerQf2zh4X6uihjcJZuUXmKBWOQu1ZLGuxBn1
         3iHTkZrQsowCI8rvgug9+t2+mlJRtORJP4MGtubqkmtgzMYC5R/xl/1jEbi06C1oJA7T
         Mc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783966261; x=1784571061;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3LqUwIJYp9NQ4diqGbAZyVDrYnzRQFmiULYhYdIqPw=;
        b=sbGW0rFzE0iHloX4mPeugKn18HgQw0234y8vzaO3D+cVKzY3mOUnI6Pbs/QFQlTdLA
         y2lq2POqgpHitwc47Tk1vqB8kpvEIy+otKlgwFUm12MW7lObrsy0L7u6Js+n49zQ66Oj
         USBGRiItRHf4oT1NhouDc1O9Ek/2tD4RO5gM8fzz+r4xosYbuszoVWYN1PQ5LWAASfid
         HDepE/eolhSpcIQSmh+gtm7uw/jSK3Y/6c+BFhIjfIG5REUC1+ffFGk789iy5VYhti2C
         6dMsujDy3k/4gouyz4PcYUl46qma8ti5eP6n6Jat/LQKarVwY7vGwI8h2q+ztRG0RWik
         95Dw==
X-Forwarded-Encrypted: i=1; AHgh+RrIhvDibhW9j7JWAF0hO8csms0/Exb/OmDsj7Zdi2stdhdp00LLbtOeZfrFf8ebAYj01AL1orMRCag7ib2Mdt8D@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0gDQYbB04ayZfqFo9RI5+kI2nfeK3mrKCZtCcsii+giXmZ92A
	DPQVNEUIErFO5m+NZxmDa7E7XISrgoAGqXG9RfHVmVZB0uJ/3MBHQEGzOLPbiXGrA8o=
X-Gm-Gg: AfdE7cmqA905boFuGh56Xi5Sxf54xjWKmiBYc5ySzxHYA7Yq5iha/mRptgTrQ/EESmQ
	Gtf+u9ARZ3i2yyHf5bZZLV3P2L6L3pDTB2ZDvhhwb+toVefybl1fzjCuttkTe5HsVvA++EgsfId
	YHvR6gJBqGxlDvujBmiJ587N8XRUnoWia/HhfP4DHyLzAOrBUXsOLslUmf5jfnVoQ6KW0N00Sun
	PI306guF/MsL2dmGak4al9NB5PgoGOqFIvoYGzZ/c/V2uduGgZYl89s8/qcH4ELD2tjDQzlQNnQ
	aca3U6H2DUs7gq+F1OVE8KMCWPIsV/pSxLDMeo93tVEjPVsEad8+YBhKWQGU3K4rjFTdje0TZtl
	cO8CG4DMb0y8hapZoRIhQetPunZuUAaEf5qxIU50U/Ys7ih/jH5DkDuUG3swB
X-Received: by 2002:a05:6214:601a:b0:8f6:8677:7ea5 with SMTP id 6a1803df08f44-90402c68ee8mr99154096d6.37.1783966260999;
        Mon, 13 Jul 2026 11:11:00 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd5bbac2asm135284216d6.21.2026.07.13.11.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 11:11:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjL7L-0000000DyOu-42Rk;
	Mon, 13 Jul 2026 15:10:59 -0300
Date: Mon, 13 Jul 2026 15:10:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 04/22] dma: free atomic pool pages by physical address
Message-ID: <20260713181059.GL3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-5-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-5-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_111102_605696_A19FE440 
X-CRM114-Status: GOOD (  21.20  )
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

On Wed, Jul 01, 2026 at 11:19:08AM +0530, Aneesh Kumar K.V (Arm) wrote:
> dma_direct_alloc_pages() may satisfy atomic allocations from the coherent
> atomic pools. The pool allocation is keyed by the virtual address stored in
> the gen_pool, but the pages API returns only the backing struct page.
> 
> On architectures with CONFIG_DMA_DIRECT_REMAP, atomic pool chunks are added
> to the gen_pool using their remapped virtual address.
> dma_direct_free_pages() reconstructs a linear-map address with
> page_address(page) and passes that to dma_free_from_pool(). That address
> does not match the gen_pool virtual range, so the pool lookup can fail and
> the code can fall through to freeing a pool-owned page through the normal
> page allocator path.
> 
> Add a page-based pool free helper that looks up the owning pool chunk by
> physical address, translates it back to the gen_pool virtual address, and
> frees that address to the pool. Use it from dma_direct_free_pages() while
> keeping the existing virtual-address helper for coherent allocation frees.
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  include/linux/dma-map-ops.h |  1 +
>  kernel/dma/direct.c         |  4 +--
>  kernel/dma/pool.c           | 54 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 57 insertions(+), 2 deletions(-)

This seems pretty suboptimal?

If !CONFIG_DMA_DIRECT_REMAP then page_to_virt() was used to compute
the genpool's addr so dma_free_from_pool_page() can use the same
logic, which is how things must be working at all today

The CONFIG_DMA_DIRECT_REMAP scenario does look broken, so I'm
surprised there isn't a Fixes line on this commit? I don't have an
opinion on the search, but since alloc_pages() is used there is 8
bytes in the struct page that could be used to store the remapped
vaddr to avoid the search if someday someone wants to improve
this. Maybe a small comment hinting that direction would be a nice
addition.

Jason

