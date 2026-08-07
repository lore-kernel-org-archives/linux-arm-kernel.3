Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A100C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9M1k5SlL5Su3vC0BTK1X+EZdBDJQy7Ds7MO/9dG8qvo=; b=LAayOHxg/FAcbS7/s2w9oVzm6L
	uS+JOLm8eT9IJOX6fxx/iD95CblTgir2iM4JstR8SBsjxDY5vkApRVnfVxF61LyIA0vwHPhulmeHf
	bSSFTDIk+cwQLkVBRjUGnYYFRL/uVH296colIaq2QW5vpNeosVG0aGB8PeGYyqN78oxaUQOshl4Bf
	nQGc9smFejFfqa8XeR+ccTcW0IWnNzLtdQyyL1QuahveIcEfTly+gQ4JlISmBcfkxkl50UIKhu9HR
	YFJd4+ouz9nORmUmdlA8Cs7KuPl4clJIJPxU0njUKT/dYsBsHS4o4QY/AwHC9EiNCgeNjTQ3tIjG+
	GjkQJdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOsV-00000008Yc7-2DEo;
	Fri, 07 Aug 2026 18:01:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOsU-00000008Yc0-1RMX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 18:01:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C272E600B0;
	Fri,  7 Aug 2026 18:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6464F1F000E9;
	Fri,  7 Aug 2026 18:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786125665;
	bh=9M1k5SlL5Su3vC0BTK1X+EZdBDJQy7Ds7MO/9dG8qvo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=k2KP1BuwvBL3uUlPBpKv0J0Pm0yBgEOZ6G/A5UhKjJIS+jWDTjRG4EioD3Dp2//SZ
	 pY8YHcUZOqaotakwE11W09YnuJjVFeJKAhYBTL2nKs0RsCS4wzvHV18t+XmOetroYJ
	 gnqCdm82zmjLjAURA7aPUN49jhWtqEh6LSkkoML93+Nzloet5QKfiQ4StPRY1bvESW
	 ActGHYqTISBAKwDmrPW11A0MSURZGvzkWn3qPoAauu57PTvP6AWMOndXhEZvcW97ck
	 mtG/lpXbVMiA04jqQx6iI0gySsIUw2bwnMvuXuIl3zkajdZDJUAtWIfo59dTnZF+vf
	 hUaHTEP+kpSMg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>, Will Deacon <will@kernel.org>,
	Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
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
Subject: Re: [PATCH] arm64: swiotlb: Keep the default size for protected guests
In-Reply-To: <20260807135810.GA200537@ziepe.ca>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
 <20260807092612.2202005-1-aneesh.kumar@kernel.org>
 <anXIZSh9lq99VG9X@willie-the-truck> <yq5acxvu2ict.fsf@kernel.org>
 <anXbJ2O4DWgPxCeg@willie-the-truck> <20260807135810.GA200537@ziepe.ca>
Date: Fri, 07 Aug 2026 23:30:51 +0530
Message-ID: <yq5awlu1yfn0.fsf@kernel.org>
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

> On Fri, Aug 07, 2026 at 02:18:31PM +0100, Will Deacon wrote:
>
>> > I was under the impression that there is a possibility of using swiotlb
>> > instead of restricted-dma-pool with pKVM.
>> 
>> Yes, that patch enables swiotlb as a possibility for protected guests
>> but with your patch we avoid shrinking the swiotlb buffer even when
>> restricted dma pools are being used and that's a waste of memory.
>
> I also thought we switched pkvm to use CC-like swiotlb as part of the
> alignment in this rework? Mostafa ?
>
>> > If that is not the case, then we could change:
>> > 
>> > !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
>> > 
>> > to
>> > 
>> > !is_realm_world() &&
>> 
>> Perhaps, or you could just pass the swiotlb= option if the defaults don't
>> work for you. Can you give more details about the slots exhaustion you're
>> seeing under CCA?
>
> We see badness with swiotlb too, it basically doesn't work out of the
> box if you have to use it 100% for real devices. It easily runs out
> of memory.
>
> Auto tuning to higher levels makes sense to me, but I'd rather the
> core code handled adjusting its size to the estimated need, not arch
> code.

Agreed

-aneesh

