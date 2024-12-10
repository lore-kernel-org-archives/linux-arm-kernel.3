Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2B5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pO8jq8K05ziX1kKttCa3ywuA95Peb+QVwhVURYTEVAk=; b=eACl0BxaUS462YhmDIoT43STjq
	UOkVj7/7w3I3g2Hwnh+lsjTfi4SYqSqDvs8loGv8n3E81FbARDLOVanXw/A3Z0y9JRfKB0PwxVaq8
	/AVUlHLMUY71mISVmM9XK+UOVGK9ff4ZGOyhBIYfWQHlEOLkj5J9zQmTR3RWRRjBr4OOzP0TwoqTZ
	QpVz3mIwAcavxOOZYXS0Ab5vqq2ZpsWLhLRtYzSG2JXl+EZsp+4woIP1wOmBkxgAlXUwTclF8uyAI
	Un/E9BIbpzEJ+8sPVoOHWccsGkuUBXDHALjEvdPGFjTcKqrM/7MPanXApzYkL7I+52ansK5F/7YTj
	ghe2ku5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1VD-0000000Bpt0-2Zqi;
	Tue, 10 Dec 2024 14:46:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1U8-0000000BpfG-03jW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:45:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B913A41908;
	Tue, 10 Dec 2024 14:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B804BC4CED6;
	Tue, 10 Dec 2024 14:45:03 +0000 (UTC)
Date: Tue, 10 Dec 2024 14:45:01 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Will Deacon <will@kernel.org>, ankita@nvidia.com, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, ryan.roberts@arm.com, shahuang@redhat.com,
	lpieralisi@kernel.org, aniketa@nvidia.com, cjia@nvidia.com,
	kwankhede@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com,
	acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com,
	danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com,
	udhoke@nvidia.com, dnigam@nvidia.com, alex.williamson@redhat.com,
	sebastianene@google.com, coltonlewis@google.com,
	kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org,
	akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/1] KVM: arm64: Map GPU memory with no struct pages
Message-ID: <Z1hT7Z1sp_6Qv6Me@arm.com>
References: <20241118131958.4609-1-ankita@nvidia.com>
 <20241210140739.GC15607@willie-the-truck>
 <20241210141806.GI2347147@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210141806.GI2347147@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_064512_117394_58A89883 
X-CRM114-Status: GOOD (  18.48  )
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

On Tue, Dec 10, 2024 at 10:18:06AM -0400, Jason Gunthorpe wrote:
> On Tue, Dec 10, 2024 at 02:07:40PM +0000, Will Deacon wrote:
> > On Mon, Nov 18, 2024 at 01:19:57PM +0000, ankita@nvidia.com wrote:
> > > The changes are heavily influenced by the insightful discussions between
> > > Catalin Marinas and Jason Gunthorpe [1] on v1. Many thanks for their
> > > valuable suggestions.
> > > 
> > > Link: https://lore.kernel.org/lkml/20230907181459.18145-2-ankita@nvidia.com [1]
> > 
> > That's a different series, no? It got merged at v9:
> 
> I was confused by this too. v1 of that series included this patch, as
> that series went along it became focused only on enabling WC
> (Normal-NC) in a VM for device MMIO and this patch for device cachable
> memory was dropped off.
> 
> There are two related things:
>  1) Device MMIO memory should be able to be Normal-NC in a VM. Already
>     merged
>  2) Device Cachable memory (ie CXL and pre-CXL coherently attached
>     memory) should be Normal Cachable in a VM, even if it doesn't have
>     struct page/etc. (this patch)
> 
> IIRC this part was dropped off because of the MTE complexity that
> Catalin raised.

Indeed, we only merged the Normal NC part at the time. I asked Ankit to
drop the cacheable attributes and only focus on getting the other part
merged.

-- 
Catalin

