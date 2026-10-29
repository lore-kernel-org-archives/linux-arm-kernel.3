Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A12C606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L4yijBu8;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZvaTBnXw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xrs5nmJVJab8tRZxFKVKeWjGi/2IO56BZp571uVAax4=; b=L4yijBu80L+f7fR5IVr+Uh0Z/q
	O4p1ekFAGchrhNhBb5n+37J2K62VTLnJiK2NAItZNYwyIUHt/1PVoX8LpsPH63C+bg2yccA+8WUFz
	lVx4pLIczxRuf0uYRiVEzAlwRQD1k3aozTQcxarG+YpL63UyfdfsR1lsTdTJ386PNDGYxRbkMWvzb
	xBxsFNosEKBLGMEcgnqkI8driUr1pL+w21EtWvtLD2UqWKCw/ypWIjDaXFgxNkDdQxUleRXiFhe3G
	W8VkyKrLsDEwxlBSrJtwzGXwVWkbN6MDVPo48G1Yt1LEXsvH9KAEYETDQzVbeIw55C5Bv0CTyDXcZ
	TiKOxIFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXvQ-0000000AR0k-3rz2;
	Thu, 29 Oct 2026 21:44:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXvN-0000000AR0J-1q56
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:44:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CBD11682;
	Thu, 29 Oct 2026 14:44:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 807CA3F59E;
	Thu, 29 Oct 2026 14:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793310279; bh=1Jc6BQnB39kf9zB+DQFACw/SOjdeZK68FOMqJEkdGZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvaTBnXwk4vEh9RGdEieYrP+lcbbLQFeswH4ozshE0llEbLfdUJT22PqsrlbpTnwp
	 RPeiQtuyX1sWs06Kh6O1kM+aQZudBXMLuPvlUaKRZ5/1cxj3tLJSYILv7GVESBB/H/
	 MsCtUL3cBXEqH4nzkhbDr5bv3ZjwFLSEy4lCwIq8=
Date: Thu, 29 Oct 2026 21:44:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Price <steven.price@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] KVM: arm64: Clear the whole hugetlb folio when
 sanitising MTE tags
Message-ID: <auO-Pzqy-bp8fT4m@arm.com>
References: <20261021110700.493315-1-fuad.tabba@linux.dev>
 <20261021110700.493315-2-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021110700.493315-2-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_144441_605320_5959D0C6 
X-CRM114-Status: GOOD (  10.59  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 12:06:57PM +0100, Fuad Tabba wrote:
> sanitise_mte_tags() clears the tags of the pages about to be mapped at
> stage-2 before marking them tagged. For a hugetlb folio the flag covers
> every page in the folio, but the loop only covers the mapping being
> installed. Stage-2 maps a folio in pieces for the contiguous hugetlb
> sizes, and for any size under dirty logging. The first fault then marks
> the whole folio after clearing only its own piece, and the rest keeps
> its previous owner's tags for the guest to read.
> 
> Clear the whole folio, as mte_sync_tags() does.
> 
> Fixes: 25c17c4b55def ("hugetlb: arm64: add mte support")
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

