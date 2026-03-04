Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9CAEFCE21
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kx8vnEm28aGLiRE9vB2nHEueIYFDqBkfc/uJtYW6dw=; b=SyXqcWf0lkE5MzcIEqNMMlDW2W
	YF98gY3lSuv4jvfY2Tw9cO2/Qmw00J7UTKxiry5/IUCADK7T8HDC8YR4CpHE/e+ahyZRvWeHMBg78
	39RTV5qTtABDc9A+38B+25hPUWCw/bSpSX5uA3ByMHblHsJjsniHX4w42Rc2wX8AFQkv624BGNrLd
	l80bxNlOYq/QtTTj6VOy6x4dMUj1IPuFeGSKYvEmetlzkSXb1A8J0PQwswagxh3eaL7Hxb0yFcnTv
	ebJS1jZF28cx47L/hLvrIIGU2sA00No7npVL6le0zkmayupZo0Pb0oYL/ZpwSyfqAp7elfcGT+iPZ
	Ne60XwgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpyO-00000000BRt-0xkJ;
	Wed, 04 Mar 2026 17:25:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpyK-00000000BRV-2YKj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 17:25:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AFBF339;
	Wed,  4 Mar 2026 09:25:12 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A59AB3F73B;
	Wed,  4 Mar 2026 09:25:16 -0800 (PST)
Date: Wed, 4 Mar 2026 17:25:10 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Piotr Jaroszynski <pjaroszynski@nvidia.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Alistair Popple <apopple@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Breno Leitao <leitao@debian.org>, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: contpte: fix set_access_flags() no-op check for
 SMMU/ATS faults
Message-ID: <aahq9i7XNYOBG49y@arm.com>
References: <20260303063751.2531716-1-pjaroszynski@nvidia.com>
 <aagUtDTca5d0le2Y@arm.com>
 <20260304134313.GM972761@nvidia.com>
 <aahJX0NwtYHy1ILe@arm.com>
 <20260304153949.GP972761@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304153949.GP972761@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_092521_604759_0D78E2F4 
X-CRM114-Status: GOOD (  14.11  )
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

On Wed, Mar 04, 2026 at 11:39:49AM -0400, Jason Gunthorpe wrote:
> On Wed, Mar 04, 2026 at 03:01:51PM +0000, Catalin Marinas wrote:
> > Good point. For the AF bit, the hardware is not allowed to cache it in
> > the TLB, so we can't get an AF fault for an unrelated VA nearby.
> 
> The way we have read the spec is there is no restriction on what PTE
> the HW accesses when it encounters a CONT group.

Trying to find some rule in the Arm ARM, it only says that hardware
AF/DBM only happens to a single entry but it is not specific about which
in a contiguous range.

So yeah, it's better not to assume anything. If it helps software, we
could tighten the architecture but I think the benefit is marginal.

-- 
Catalin

