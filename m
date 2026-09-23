Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB38C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLS6K5yNkNKdGDkQFfdRpx4/MjK91Sar/Xvn4H+27fE=; b=AKfK3NGZbxwk6G/OhUTP3dGuH3
	+Wn1Qvmue3axhlptDYQTnXGyrzYE8i6pP9ZMufx5mJzIcpHD0y5JpN/RSUNRLFxwBHPD71t+Y5GYt
	3jMPLBOlOioaBHkDWLh8EC87HERRojE4ot0nUw44LmW2V32YBLXdoECVDzREu1n5ouPN1ZPjKBJYx
	AxAQL96hNQWDfJNBNK68p5MI7jor2ms/nORvfe1/bHDt3GsLFabh/rrke8V0DFhxoRjBSGTLEMIYG
	p6W+wdAg52TAdMEK803C7w6w9PiZCfcd+QdYJN+Y1T5WpKldftFxJlz4YFc3DzVzx1SR+bbxaIBKY
	dMf1KpcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jw5-00000007r4T-1hhi;
	Wed, 23 Sep 2026 10:10:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jvz-00000007r3a-2coW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:10:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8480152B;
	Wed, 23 Sep 2026 03:10:34 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 146163F86C;
	Wed, 23 Sep 2026 03:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790158238; bh=aJd5PwgdVPJ9tE7A7OasMy/wKrzLGbTgJY/jXplpFIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3sYQlebo9JuaPrX/aY4BYXg4kl12bBh2l+dg5S1TpD/sd1OrXwH32xGOiPW5K434
	 UuBzqurGcjPFaH0amX7WpALPGj4+fE2hTuRxrmfBQJcpZcj2x3NVvhpckvNi+KxnQI
	 AtUULuSivZdyBUiepK0KoTPupOCiWcVRdZmElWyM=
Date: Wed, 23 Sep 2026 11:10:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <arOlmBBWdZTi8Xre@arm.com>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <yq5afqz02wtv.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5afqz02wtv.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_031040_728664_720C91D7 
X-CRM114-Status: GOOD (  12.18  )
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

On Wed, Sep 23, 2026 at 02:01:08PM +0530, Aneesh Kumar K.V wrote:
> I was pointed to this email thread:
> 
> https://lore.kernel.org/all/c25502d3-35c6-4281-a9ec-856f789fb1b4@arm.com
> 
> This makes a stronger case for having a CoCo shared memory allocator
> that captures all these restrictions. It also means that
> alloc_cc_shared_pages_node() needs:
> 
> 	if (WARN_ON_ONCE(!gfpflags_allow_blocking(gfp)))
> 		return -EINVAL;
> 
> 	might_sleep();

I think gfpflags_allow_blocking() is the wrong predicate. It checks for
__GFP_DIRECT_RECLAIM but we have callers like dma-buf which clear the
flag (see HIGH_ORDER_GFP). ITS allocations also use GFP_NOWAIT, so
they'll fail here.

I'd just keep a might_sleep() in cc_make_*() and ignore gfp flags
checking. Passing a no-blocking GFP flag doesn't necessarily mean the
caller cannot sleep. It might also happen early enough (like its_init())
not to care - __might_resched() skips the warning if SYSTEM_BOOTING.

-- 
Catalin

