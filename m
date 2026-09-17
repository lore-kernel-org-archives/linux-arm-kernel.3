Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71053C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 06:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiRMaoY3cRTa9MhpKbPocPbsr/YaGM7PATKxMZxjze4=; b=w7OvW1pn8VNQRgCS24W6fx4i3y
	JIrGODCiA+Hg80rxsdzxlzdmRL/vqvV/eOIMCekCxMLuB04Olb7MNTG0KADX+G18sBtuQUEvSTR6m
	LGf39kp7gzEyuQJS25S8ql2+baykC2O8cJf7IP1hNnE4pphFQjtB5yS9HillExQlJWErrN6+M6/L5
	JCqsE4MMtrFVszUq80p9e2tbPdKth+9+gFfg4s4YbFoGsODRF+GNeDCRLlAoRDbjvsMFHJMNq3yhl
	Dq4Nso+TDhF+DdihI/S12zHPCj5i3l5bfZI6E8PbAX0Nh5/T2FJEDOQCiyJq7Qd4YpEELWDpX1P8v
	kyGBJVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75SH-0000000AeVf-2NBw;
	Thu, 17 Sep 2026 06:18:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75SE-0000000AeVH-2VVd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 06:18:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA7F41476;
	Wed, 16 Sep 2026 23:18:35 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C32C13F882;
	Wed, 16 Sep 2026 23:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789625919; bh=5r38bdBPwTF0dKcq39wGt84GgYIEr0WGkYnRDt6n+mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJtvYv00iOOtQNWrUiPJgkunbZExZ9AoaM+TawX53wEJeFEfHYJnbH9aeFZT81Y91
	 MEMhDAFakHNbfdim7oqxayZbv5pf5JaGb0mBpGx/dtTNOhjzCgL1ulUdTWkr/Caupb
	 +d4+lEau/tWsjjqSA5GLJiGG/qd1lBQYl0PSilro=
Date: Thu, 17 Sep 2026 11:48:36 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V2 06/14] arm64/mm: Enable fixmap with 5 level page table
Message-ID: <pi6o4hjdaz2tndzlx64qvzbgxhuyh3kyewpfetiqnnetbtpzpa@prrxusgc3lpm>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
 <20260907035030.2839978-7-anshuman.khandual@arm.com>
 <be1c0a62-4589-4fe4-a500-d3fe16a6e610@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be1c0a62-4589-4fe4-a500-d3fe16a6e610@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_231843_095666_A007F1B1 
X-CRM114-Status: GOOD (  20.55  )
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

On Wed, Sep 16, 2026 at 04:30:05PM +0200, David Hildenbrand (Arm) wrote:
> On 9/7/26 05:50, Anshuman Khandual wrote:
> > FEAT_D128 halves PTRS_PER_PXX thus shrinking the VA range coverage
> > for each page table level. Hence in order to preserve all existing
> > VA range configurations, some geometry now need to become 5-level.
> > 
> 
> Hmm, wasn't this 5-levels before, but other code allocated+initialized the p4d
> table for us?

But fixmap was never 5 level earlier.

> 
> I mean, I see how we are filling in another level, but I don't see how we would
> reconfigure something to use 5 page table levels?

IIUC existing configurations which never required 5 levels would not need
this reconfiguration even now.

> 
> > Since fixmap is used to build and manipulate page tables early on
> > during boot the mapping must also gain that additional level which
> > was not required earlier.
> 
> I am no expert ... but I am confused :)
> 
> We do have a loop only in early_fixmap_init_pmd(). So we cannot possibly span
> more than a single ... PTE table?
> 
> > 
> > Enable fixmap with 5 level page table when required. This creates table
> > entries at the PGD level. Add a fallback stub for pgd_page_paddr() when
> > (PGTBALE_LEVELS <= 4) which helps in intercepting any unintended usage.
> 
> 
> Again, I am very confused. Is it really just "As the page table layout changes,
> we might no longer have a p4d table pre-populated for the range our fixmap falls
> into. So if there is no p4d table yet, populate a static one just like we do for
> the other levels."

Right.

> 
> -- 
> Cheers,
> 
> David

