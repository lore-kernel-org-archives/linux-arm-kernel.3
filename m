Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F8CC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 16:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owzmUkDB0UZwHfh/mp1W0vc+6IvE+QEuLxbybZAQPWY=; b=05Y0M+OqZlk0AVjOgemUtP72lS
	ShHEqwHMTfUBh3yFlccRxG7AXHrGXmgvYlGnEwmkvl/YNRiGazw/X0WoCm3F3NZdgm1EnupNVKHpe
	NLzzp5m7ZuqbSR/WfIK+JGWzKG4Ep9URMERGwLfTyR4xJKmHw9it2GeWuR90CKocCsgPXqst5lduo
	u0KulO6NPNR31tPgHSvGAkGjlqMvWPcimJ56I9gqqfNqiAFl57yxSiIzk9VZo/Bk0l7kTcg3FoZTF
	cQ5uFgylIqaFu7mpzfZE+8d1X51fOyJrUkLqDPyz/ATwZ5++cxj2lyIu0UesoU0vvFPIFydjvXV/3
	MR+EPofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwMlN-00000008MUF-0CSu;
	Tue, 18 Aug 2026 16:34:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwMlK-00000008MT7-3TU7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 16:34:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C893D1A00;
	Tue, 18 Aug 2026 09:34:01 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EC663F85F;
	Tue, 18 Aug 2026 09:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787070845; bh=roFDoKpIkkJ7bFHN1815WLEntXi/XSfb52O3DVWoU5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJ1erU2EjXBce91TN7aGMwTzVUyboExPz7I9asApP1cBlfCRqrlh4mDRXGFUKQbVC
	 2xmOvd1kc1becHOtol6vpq529+9g5Szv+t9bVESsXstMxjCUL1zvyrvEKnT5055PFk
	 4EkA0pbBQHw2CWShtLCigBmizYAWquRBMybh2qQc=
Date: Tue, 18 Aug 2026 17:33:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: James Houghton <jthoughton@google.com>
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Nikos Nikoleris <nikos.nikoleris@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>,
	Frank van der Linden <fvdl@google.com>,
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 12/18] arm64: Implement try_populate_vmemmap_pmd using AF
 trick
Message-ID: <aoSJcAFMNJ1nPl2H@arm.com>
References: <20260708031129.3503195-1-jthoughton@google.com>
 <20260708031129.3503195-13-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708031129.3503195-13-jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_093406_916467_E2BF7E64 
X-CRM114-Status: GOOD (  15.65  )
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

On Wed, Jul 08, 2026 at 03:11:22AM +0000, James Houghton wrote:
> This routine is to be used for updating in-use, leaf-level PMDs in the
> vmemmap without introducing a window where vmemmap accesses might fault.
> 
> Implementing this on arm64 requires some care: use the same access flag
> trick that is used for vmemmap PTE updates. HAFT is not needed and the
> TLB flushing routine remains identical, as we are not overwriting a
> non-leaf PMD.
> 
> For systems that support BBML2_NOABORT, there is no need to use the AF
> trick.

This part needs even more text in the Arm ARM. With dropping of the
BBML2_NOABORT requirement in patch 13, we are left with the D8.17.2
rules in the Arm ARM (M.c) requiring BBM. I'm not sure we can infer much
from the AF=0 caching rules as here we talk about the walk caches. For
example, a walk cache memorises the VA to block descriptor translation
and that's irrespective of the leaf entry AF bit. If AF=0 and you skip
the TLBI, nothing flushes the walk cache which may confuse the CPU when
it suddenly sees a table entry where it expected a block one.

If it's not critical to the series, I suggest we leave this patch and
the next one out for now.

-- 
Catalin

