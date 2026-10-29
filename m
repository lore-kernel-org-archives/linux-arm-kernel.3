Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD4F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 22:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AVhylnYD;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q1HLeuNJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BOIOVIeuoZTPYLCw9qgl59aa+oUmsxHGBfBI4tPDjNk=; b=AVhylnYDX+NiNryrXTE2JdbDIv
	Z4n1r75QAmVY9BiwFrrgnmOy+cBmG3He37/bYfjXpk4nQZRJx1Hsz2OifIUzf6aN7u7Z9GP5xCpKC
	Wg1IkGv9HPiasnWTjoAFb30Dqnf95RpUh/yFlJCxBFjszrCFNRQxFBRq+aYlAyiez9YmiH8KZAKMZ
	pDaYn+mgZIBJkVmUCO/+tsci1vVq4ZurJIXGZ5eTyTBNMPczQMO4/CWPP5LwYfUm9Ci3Cw88aQoWv
	l3GfoUI34fbQOwHQZVyoZkzE8ndXHaw5p19yPnrclGpRVjSbxo4oicfGOiVcnVQALdCatFuZXMFRf
	DW7VjGpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYFM-0000000ASVp-2AdL;
	Thu, 29 Oct 2026 22:05:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYFJ-0000000ASV0-0MjY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 22:05:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDA4815A1;
	Thu, 29 Oct 2026 15:05:12 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE5AD3F673;
	Thu, 29 Oct 2026 15:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793311515; bh=Ijs585yEk7skk5Tt9uzpTzRD8zZrNST3f/danWDydDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1HLeuNJ6kUbLgKJbyCy8NiFp2jr5MnpfDLave9KjaLtv7f17AEgdwnAF7e5lb6Ro
	 tVVtAHTLlFvSsEdFncJ6eGP961Hg7yMz4IR1dHygDt/zYxGNOmAmFdq9mHa/82Rt1J
	 eh9vd1QlT9ochELhnF9vdn4cxoch5nBM4dVrR9B0=
Date: Thu, 29 Oct 2026 22:05:11 +0000
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
Subject: Re: [PATCH v2 4/4] arm64: mte: Add mte_clear_folio_tags()
Message-ID: <auPDF0KIpU_WjK_k@arm.com>
References: <20261021110700.493315-1-fuad.tabba@linux.dev>
 <20261021110700.493315-5-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021110700.493315-5-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_150517_172572_C134CE6A 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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

On Wed, Oct 21, 2026 at 12:07:00PM +0100, Fuad Tabba wrote:
> mte_sync_tags(), sanitise_mte_tags() and kvm_vm_ioctl_mte_copy_tags()
> each open-code the loop that clears the tags of every page in a hugetlb
> folio. Add mte_clear_folio_tags() and use it in all three.
> kvm_vm_ioctl_mte_copy_tags() then tests for hugetlb first, as it does
> where it sets the tagged flag below.
> 
> No functional change intended.
> 
> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

