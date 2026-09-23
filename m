Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B17C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gswDY1mG66Lwu8tE7+G4+W7L5mN7cWkxPfHU3SkDVKo=; b=Xm3ZONUkAaH08Bze7I9IKBMzzX
	EPbmef2wFsgnL1H/3sUb/SUYihbPXQMqgEvcWndDkuL0NnzYWS9Hw2OugaIfxxdnHdh4pgrrQ0+Jw
	CIPR+BsS0YcpACGcntCeK4w4Jco3rrDFIDkfUHgxaBF2ZAn801B0+eS9i15ZdE9ylkZXjSK/VmBD7
	jZ2rJvWP/adDz2v9X4SxvA94qZqqdWn18QrX+98/JME0cGkOD8ZqchdxZyL0Kfpbyz1eZErU6R8YV
	AJ3q3maz3VL+zMZ8UN22ZkkKHgnEZeOWIuu6Pk2DOVRWjM62j13/N3e0IhJavhOF1ViouWMBfV4E3
	j/9OWwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ORB-00000008bxJ-1FuP;
	Wed, 23 Sep 2026 14:59:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OR9-00000008bx4-3qMY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:59:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B53F41848;
	Wed, 23 Sep 2026 14:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79AFD1F000FF;
	Wed, 23 Sep 2026 14:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790175547;
	bh=gswDY1mG66Lwu8tE7+G4+W7L5mN7cWkxPfHU3SkDVKo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gxODoNb72NWn9YPpDe8KLIfANsjCxo5gtqjTs0tVjyVQLSUt7VjxY4odyO7h2T0nC
	 o4xeysn4SqbjBbrzO/k8BC6P1zv9vl39VCVI9ZQ7IOhYkLNyT6sllXj5fSpyE5qyVe
	 kAe4GlZ84iDl0ZDLt9081Bf44hBYpqnANogB3sSSAe4bYi6Nt71WpYEqApRXHNHQFV
	 lsW/OSUjSOhCaTupqB/rAoBRuvGlM5KaAA6S7fHWuC1YeKSSi9S9ZLdoFOi0P4jEFP
	 SY9nq/2ZAJRRqMiLkoe+vZrhbLNj0eg7oSntaVwEl+MhSA8FXaTng/Ah83KmnM661J
	 SANvHw/6tOcAA==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
In-Reply-To: <20260923130611.GF1540250@ziepe.ca>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com> <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com> <yq5a5wzw2ree.fsf@kernel.org>
 <arOspFxWZ1DjgcAr@arm.com> <20260923130611.GF1540250@ziepe.ca>
Date: Wed, 23 Sep 2026 20:28:57 +0530
Message-ID: <yq5atsng10b2.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Wed, Sep 23, 2026 at 11:40:36AM +0100, Catalin Marinas wrote:
>
>> The simplest is probably to always zero in the backend and ignore
>> __GFP_ZERO to the allocator. But it's probably only marginally smaller
>> than passing a CC_SHARED_ZERO flag down. Get codex to try this as well
>> and compare the diffstat.
>
> For patch ordering I would convert to use the allocator first
>
> The semantics of the new API should be clear
>
> If you pass GFP_ZERO then the resulting allocated memory is zero
>
> Otherwise the allocator does Whatever The Arch Needs to not leak
> private data out.
>

ok

>
> Once places are converted to the allocator lets go see what is left
> and ask why it is left and what API it actually needs.
>

I'm also considering requiring the address passed to cc_make_shared() to
be in the linear map. This is currently required by both TDX and CCA,
while AMD SNP appears to support vmalloc addresses. The only user of
that vmalloc support is Hyper-V VMBus GPADL setup
(vmbus_establish_gpadl()). How should the generic CoCo shared-memory
allocator handle this?

-aneesh

