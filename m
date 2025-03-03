Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AE6C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/flDcj3kBHDiYN5YVb/qYG44iBTvgIEvIL8aqJ+QZ8=; b=AYirzqfEBC0hmZbzZjyUlurbhr
	BhHN8INDBRZjvFkwL1S6uwgLluuJL3Ydpf1MvUAIGzeMEMKnM+b3cIsjoLscd4+9ncvRMgcPf9/fj
	mBndfX1DjrIC4gPTjVDrLECOCr5Lp5hCEjxOPKriqH7Em8Z+/8z3csIVWQMaAngRWienRKDz56Xdr
	uiPm9vzcElYhkM7pGcPqBTHPrFX6uqz+HVyEzYOaHZi9yn3PsTFslOrHFwPmiupnK+mOy6ihaYpdQ
	RI9eoZ340kakNoWYfHbDaxCZZqqyakehcbr6swP+zJK7MKj1R/ddw06vJ/Y7NZZmlxzqoI5egOJBq
	ZFNR8cPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp54z-00000000m0B-2H2m;
	Mon, 03 Mar 2025 12:39:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4Lr-00000000dw6-1BGa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:52:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7E97106F;
	Mon,  3 Mar 2025 03:53:04 -0800 (PST)
Received: from e133081.arm.com (unknown [10.57.37.136])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 220D43F673;
	Mon,  3 Mar 2025 03:52:46 -0800 (PST)
Date: Mon, 3 Mar 2025 11:52:44 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: ryan.roberts@arm.com, suzuki.poulose@arm.com,
	yang@os.amperecomputing.com, catalin.marinas@arm.com,
	will@kernel.org, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, joey.gouly@arm.com, oliver.upton@linux.dev,
	james.morse@arm.com, broonie@kernel.org, maz@kernel.org,
	akpm@linux-foundation.org, jgg@ziepe.ca, nicolinc@nvidia.com,
	mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v2 3/4] arm64/mm: Elide tlbi in contpte_convert() under
 BBML2
Message-ID: <20250303115244.GB74129@e133081.arm.com>
References: <20250228182403.6269-2-miko.lenczewski@arm.com>
 <20250228182403.6269-5-miko.lenczewski@arm.com>
 <f270bb5d-aa54-45d3-89ed-2b757ab3a4b0@redhat.com>
 <20250303094947.GB13345@e133081.arm.com>
 <7e987f17-ffcb-45e0-8588-2d569d90f776@redhat.com>
 <20250303105539.GA74129@e133081.arm.com>
 <0ff27dbb-401b-4793-be70-1ff9c8010e4a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ff27dbb-401b-4793-be70-1ff9c8010e4a@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_035251_358652_3DC83265 
X-CRM114-Status: GOOD (  20.54  )
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

> > I think I understand what you mean. I agree that it is possible for a
> > concurrent walk to see an invalid TLBI state, if it is on the same TLB
> > that the repaint is happening on. For other TLBs, the flush has not yet
> > propagated our invalidated PTEs (from `__ptep_get_and_clear()`) though?
> 
> What I am saying is: if there is no TLB entry yet, HW will walk the page
> table to find no present PTE and trigger a fault.

Yes, that is 100% correct. I believe that this is unavoidable.

> > That invalidation will only be seen by other TLBs after the
> > `__flush_tlb_range()`, so we should save a few faults because only
> > "local" threads will ever see the invalid entry, as opposed to all
> > threads that try to read our modified range?
> 
> So what you say is, that deferring the flush means that if there is already
> a TLB entry, flushing deferred reduces the likelihood that a page table walk
> is triggered that could find no present PTE: consequently, reducing the
> likelihood that a page fault is triggered.
> 
> (I use the word likelihood, because I assume other action could result in a
> TLB entry getting flushed in the meantime, such as TLB entry reuse)
> 
> Correct?

Yes, and your language here is clearer than the original commit message
(and cover letter). Will amend it to be closer to your wording.

-- 
Kind regards,
Mikołaj Lenczewski

