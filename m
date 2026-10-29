Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BD6606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 22:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2FzVxQRe;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=upv+BRLR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qYbQzwwz9h4FO+VW0r/egh1lxyBMUI0Ck4LAOJSy2I0=; b=2FzVxQReo6OTiNh7yck9suAFPs
	37BR/Pab9apqlRqq3Qoq8fhfLpI2Jc1Ph+BrI5zsgu/02XlrLUaBamfUxlMTMvhg9pyS2bIkK/wqT
	rCb0hNWSZc2hEhtiggS6jVPhjgWKFSJITmiuQX0DjdRkjzl1UX4puJPshBVBtNpOE6Ljnc85rOKr5
	D1EJ9BhoSKMdxWu7rIxNxBgX/hd1ogVUYzabCiKvXY6KmuMhiPClTgY0widNP9kscv6qz1JeSZVJj
	BPc/WPTzthK3yNJf3O3kaiSy3t4jzXObHULBCznaupwj9/XkmEZyjckiEiE1zM7O9DkhWevUpED64
	mBRTIqHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYEo-0000000ASPo-3kC9;
	Thu, 29 Oct 2026 22:04:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYEl-0000000ASPQ-3RpV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 22:04:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD07815A1;
	Thu, 29 Oct 2026 15:04:38 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE4453F673;
	Thu, 29 Oct 2026 15:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793311481; bh=cF8ZXU+yg8O7anxbXOyalOzsUNIxFJB1v9XBEV+iq38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upv+BRLRwQd8M2cIlnBmc1JNLj9LEYmnebc9S1iNqq1j4x5hI/D9+E1myTzbd/rym
	 1p/DchbDZg2h79bXS7E+j03dg7Lpn9wXbnSDrELDsekIhhybEFQAAIGGco0MdD6FYB
	 hPBp7C8PNo1dzEk0Ho99RvctNqSedz751cjm88fU=
Date: Thu, 29 Oct 2026 22:04:37 +0000
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
Subject: Re: [PATCH v2 3/4] KVM: arm64: Sanitise MTE tags when a permission
 fault installs a mapping
Message-ID: <auPC9aOxXE1mIJn7@arm.com>
References: <20261021110700.493315-1-fuad.tabba@linux.dev>
 <20261021110700.493315-4-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021110700.493315-4-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_150443_966772_73117471 
X-CRM114-Status: GOOD (  11.54  )
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

On Wed, Oct 21, 2026 at 12:06:59PM +0100, Fuad Tabba wrote:
> The stage-2 fault path sanitises MTE tags only on translation faults, as
> a permission fault normally just relaxes an existing leaf. However, when
> the page is backed by a THP, a permission fault at page granule installs
> a block whose other pages may never have been mapped or sanitised. Once
> dirty logging is off, a guest write to a page mapped read-only during
> logging installs the block, and the guest can read the tags those pages'
> previous owners left.
> 
> Sanitise whenever the fault path calls kvm_pgtable_stage2_map() rather
> than relaxing permissions. If the VMM replaces the VMA after the guest
> takes a permission fault but before vma_lookup(), that path would map
> and sanitise memory from the new VMA without checking it. Run the
> VM_MTE_ALLOWED check in kvm_s2_fault_compute_prot() on permission
> faults too.
> 
> Fixes: ea7fc1bb1cd1b ("KVM: arm64: Introduce MTE VM feature")
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

