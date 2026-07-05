Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D82C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6ZkehhfOr5XXJ3jery3AcqU6u9rwntx9neKtZ84pmI=; b=Df21hFoOZEu4IIRFNcsDGfjCUB
	dXUp7mHEah5RRgTeLbsJsrIK7kIsTK95TnH8rdJoHvkswq2lx7UitSXN3bTrnZljVyMt1ENQQi4RC
	zpr3xYxp0ic0RI9fZuEaP1+Sp8824XgvdTgI1sZypGvpQOfK/Au7wEcQmJN7xX3CIc7nOe/8ZwQxv
	Wsj/u+9QFcF1xJMNWxUtnUWqOFBeFwsVPf28AVesYrlWOOx5YELAfemRIoU0HXCQju5kh1UNnjhLe
	jX/zLmMtb62nDZv8mAMhXbNbqOqiWOkwLjWCaHxZ+wZpvRM2d9m2X4l4LMwJKGGRIg/DiMhvXfJLa
	YGO8KZ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHOX-000000093Va-2ogM;
	Sun, 05 Jul 2026 07:36:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHOV-000000093VK-2vNM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 07:36:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD21A60051;
	Sun,  5 Jul 2026 07:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68261F000E9;
	Sun,  5 Jul 2026 07:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783236961;
	bh=A6ZkehhfOr5XXJ3jery3AcqU6u9rwntx9neKtZ84pmI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FWr7oYXOt5Tp+K6Ek8q6APpXSMD+p/aNq4SvRIWBniP6sobBE8u2g/45GuabtZ7Lh
	 5E6jKvT6FbQ902LJvZk8l9k4niP2mOqpY3EAy0PXbjEdEmkzyqGxqmXJfvqHOtrnHp
	 7W8TPuCgfYN9bK/6++23sY3tVDsVYxqEXnEpRnKA=
Date: Sun, 5 Jul 2026 00:35:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dev Jain <dev.jain@arm.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, ljs@kernel.org,
 david@kernel.org, liam@infradead.org, riel@surriel.com, vbabka@kernel.org,
 harry@kernel.org, jannh@google.com, lance.yang@linux.dev, kas@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, apopple@nvidia.com,
 rcampbell@nvidia.com, ziy@nvidia.com, matthew.brost@intel.com,
 joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
 gourry@gourry.net, ying.huang@linux.alibaba.com, ak@linux.intel.com,
 nao.horiguchi@gmail.com, mel@csn.ul.ie, j-nomura@ce.jp.nec.com,
 pfalcato@suse.de, tglx@kernel.org, dave.hansen@intel.com,
 jpoimboe@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/6] arm64: make huge_ptep_get handled unaligned
 addresses
Message-Id: <20260705003559.8b124d2b94b685cc2e4e77ae@linux-foundation.org>
In-Reply-To: <20260703114202.365553-2-dev.jain@arm.com>
References: <20260703114202.365553-1-dev.jain@arm.com>
	<20260703114202.365553-2-dev.jain@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri,  3 Jul 2026 11:41:54 +0000 Dev Jain <dev.jain@arm.com> wrote:

> huge_ptep_get() can be handed a virtual address pointing to the middle of
> a contpmd/contpte mapped hugetlb folio (examples of callers are
> pagemap_hugetlb_range, page_mapped_in_vma).
> 
> The arm64 helper rewalks the pgtables in find_num_contig to answer whether
> the huge pte we have maps a contpmd or a contpte hugetlb folio, and
> returns CONT_PMDS or CONT_PTES, so that it can collect a/d bits over the
> contiguous ptes. We can falsely return CONT_PTES instead of CONT_PMDS
> if the addr is not aligned.
> 
> Fix this by aligning the pmdp pointer down to a contpmd base before
> checking equality with the passed huge pte pointer, to correctly answer
> whether the huge pte is the base of a contpmd block.
> 
> Fixes: 29cb80519689 ("arm64: hugetlb: Cleanup huge_pte size discovery mechanisms")
> Cc: stable@vger.kernel.org

Please describe the userspace-visible effects of bugs when fixing them.
Particularly when cc:stable is proposed.  Thanks.


