Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B1EC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taWB0uXbzkRB1mUN9KZfaLzgtuo90Ci8LAw7+KXQGL8=; b=y2lu3nSf23IfcdYrzlL/sMXmK/
	64v44vKXHKLshITLlwhLsXsG2gYoufu42I+0ZvEh7asZk0bR1vriSA6podBxZ9Ai9Yi8swFp8lNMM
	yJ0kol6jk9NFHufTMD4QmLSBt0dFW8gHD80fcrolB+UmsWHoKuDCi7mc9qACLe4qzot9GPF4+C5bs
	mrWaQ7H6r5oP/V5yj76Ci9F03fQtVrR78rOM1WhisZ0pueSRNwiN0uNf+aDBYR7F8zEirT4gM6pzt
	2VRAxRjgU2X6xtmFUoUjMJS933e06vPRDUGItvYmoPuzZFdzMr4chupsuPWoNGURZqtr9/wo3y4rd
	TGWvfwNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2JY-0000000AKvL-1P3P;
	Wed, 19 Mar 2025 22:55:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2Hr-0000000AKno-2R4d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 22:53:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 491F9A48A8C;
	Wed, 19 Mar 2025 22:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFFBC4CEE4;
	Wed, 19 Mar 2025 22:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742424802;
	bh=d+VUlRbK15AHSFijWQvk3uMYQmbTQJLLjN8PURft8ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtV0RUuaJkhmaEiHB2PZgmeMLgwQjqAjWPMrJzalJ5tRkWiU3WCYb2rYplF0qvr+K
	 i5ozLcRQ1OlREyfH48tOvBsxYt8jTyaIMyXgbEAca6fi8fi+p/9Gq/MRJ7Bh2uVqUN
	 wmI7HM4E3ma4o8IXmYOyYnICbjxoBcT+m6es1oj9vlLDldHht8CNIBmVWR8cx510b7
	 ym5o/hft4iG4Zk4jNqPqe4RAJ+xS9ngXXJGD/HvBrZ+PTkLGRhMe20E2P4MDYweGDw
	 NYT0xOhlkQnL39VU5LlqSOCljukD8PlM396DMxP1/UdyMhQC+yHuzUuE2FaB6fsGtc
	 Lsip1fIhVxvwA==
Date: Wed, 19 Mar 2025 16:53:18 -0600
From: Keith Busch <kbusch@kernel.org>
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Gavin Shan <gshan@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alistair Popple <apopple@nvidia.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sean Christopherson <seanjc@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Jason Gunthorpe <jgg@nvidia.com>, Borislav Petkov <bp@alien8.de>,
	Zi Yan <ziy@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>,
	David Hildenbrand <david@redhat.com>,
	Yan Zhao <yan.y.zhao@intel.com>, Will Deacon <will@kernel.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 18/19] mm/arm64: Support large pfn mappings
Message-ID: <Z9tK3gEchs9X0k7h@kbusch-mbp.dhcp.thefacebook.com>
References: <20240826204353.2228736-1-peterx@redhat.com>
 <20240826204353.2228736-19-peterx@redhat.com>
 <Z9tDjOk-JdV_fCY4@kbusch-mbp.dhcp.thefacebook.com>
 <Z9tJMsJ4PzZk2ZQS@x1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9tJMsJ4PzZk2ZQS@x1.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_155323_681835_C43EF1A7 
X-CRM114-Status: GOOD (  24.97  )
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

On Wed, Mar 19, 2025 at 06:46:35PM -0400, Peter Xu wrote:
> On Wed, Mar 19, 2025 at 04:22:04PM -0600, Keith Busch wrote:
> > On Mon, Aug 26, 2024 at 04:43:52PM -0400, Peter Xu wrote:
> > > +#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
> > > +#define pud_special(pte)	pte_special(pud_pte(pud))
> > > +#define pud_mkspecial(pte)	pte_pud(pte_mkspecial(pud_pte(pud)))
> > > +#endif
> > 
> > Sorry for such a late reply, but this looked a bit weird as I'm doing
> > some backporting. Not that I'm actually interested in this arch, so I
> > can't readily test this, but I believe the intention was to name the
> > macro argument "pud", not "pte".
> 
> Probably no way to test it from anyone yet, as I don't see aarch64 selects
> HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD, which means IIUC this two lines (before
> PUD being enabled on aarch64) won't be compiled.. which also matches with
> the test results in the cover letter, that we only tried pmd on arm.
> 
> The patch will still be needed though for pmd to work.
> 
> I can draft a patch to change this, but considering arm's PUD support isn't
> there anyway.. maybe I should instead draft a change to remove these as
> they're dead code so far, and see if anyone would like to collect it.
> 
> Thanks for reporting this.  I'll prepare something soon and keep you
> posted.

Thanks, good to know it wasn't reachable.

The reason I was conerned is because the only caller, insert_pfn_pud(),
just so happens to have a variable named "pud" in scope, but it's not
the pud passed into the macro. So if this macro was used, it would just
so happen to compile by that coincidence, but its using the wrong pud.

