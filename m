Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD387E6F061
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vena6H1phr3MgeVL8fFEujbOUBs119swW41Ew9CXTwY=; b=EeBU9PQTTgPh9/tXyUZRFw5rj0
	+KRF2hiMg3fH9Tc0S3Va9K/yRPD3h328Grmm5adGgX/SvV59hV1b2GYBePyt/nlrhmInlvyHkRTCz
	GJC7OoF44+o0l2rb+RIzIdQEQXMqGlYHFdGRRfhkeZzRU4InYICsDYRUEclvTNDkL6S/25quukhzW
	7UgMqcB7Uio9oN+Ye3Aq3doAeHHUtl0VTai/80k7lJ2eHcgJDj/c307WeI3CY8W2MaaXjOhLufWh2
	mWqlVwNsu/KdakMZuA7A69DhWcUlFecGnKm4oxHy6pejNmONQGmihXPKpGjjLeATJxCZD61SVMazX
	z6ZXcH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sUt-00000007Ixw-1cH6;
	Fri, 01 Nov 2024 14:19:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s7w-00000007FYK-38MB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 13:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Vena6H1phr3MgeVL8fFEujbOUBs119swW41Ew9CXTwY=; b=o8G0exS95OaZBf4DOo3aU3Uos8
	ZX6qHgrrsitb2mViK0thsnDtlg73dI+WSrQ0lI1a69Xe4oZxXYlv/1MG+PhWu9CwgBSyGQb898t3I
	fqfeAOdOJVMKdY3LDt4tcUte5lALLJ2vNm0B58QkJxhC3Dhpp8fhIu/iV/trKI4MBf7z+xAcOpmVD
	Lu89eg+wfkddZpkSeLpqSxkE2bqIHU6UGpfVWcDx1Fg4cBfu4iuUqdL1SMhTH1UsLCYt477Br+XXf
	BYu7CfCJX7MHyVUoC7VabjhZQKriMB4N9s7cYjI12bRHjBVVy65ihqopIiUG+uzaDBgR0tR84rUDb
	Bfl3Q3mA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s7s-0000000AiSw-0Pel
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:55:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEFB55C8A05;
	Thu, 31 Oct 2024 21:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3477C4CEC3;
	Thu, 31 Oct 2024 21:07:18 +0000 (UTC)
Date: Thu, 31 Oct 2024 21:07:16 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Greg Marsden <greg.marsden@oracle.com>,
	Ivan Ivanov <ivan.ivanov@suse.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Message-ID: <ZyPxhF34JjT3Ky9K@arm.com>
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014105514.3206191-1-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_135544_446542_4FB783C8 
X-CRM114-Status: GOOD (  21.44  )
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

Hi Ryan,

On Mon, Oct 14, 2024 at 11:55:11AM +0100, Ryan Roberts wrote:
> This RFC series implements support for boot-time page size selection within the
> arm64 kernel. arm64 supports 3 base page sizes (4K, 16K, 64K), but to date, page
> size has been selected at compile-time, meaning the size is baked into a given
> kernel image. As use of larger-than-4K page sizes become more prevalent this
> starts to present a problem for distributions. Boot-time page size selection
> enables the creation of a single kernel image, which can be told which page size
> to use on the kernel command line.

That's great work, something I wasn't expecting to even build, let alone
run ;). I only looked briefly through the patches, there's probably room
for optimisation of micro-benchmarks like fork(), maybe using something
like runtime constants. The advantage for deployment and easy testing of
different configurations is pretty clear (distros mainly, not sure how
relevant it is for Android if apps can't move beyond 4K pages).

However, as a maintainer, my main concern is having to chase build
failures in obscure drivers that have not been tested/developed on
arm64. If people primarily test on x86, they wouldn't notice that
PAGE_SIZE/PAGE_SHIFT are no longer constants. Not looking forward to
trying to sort out allmodconfig builds every kernel release, especially
if they turn up in subsystems I have no clue about (like most stuff
outside arch/arm64).

So, first of all, I'd like to understand the overall maintainability
impact better. I assume you tested mostly defconfig. If you run an
allmodconfig build with make -k, how many build failures do you get with
this patchset? Similarly for some distro configs.

Do we have any better way to detect this other than actual compilation
on arm64? Can we hack something around COMPILE_TEST like redefine
PAGE_SIZE (for modules only) to a variable so that we have a better
chance of detecting build failures when modules are only tested on other
architectures?

At the moment, I'm not entirely convinced of the benefits vs. long term
maintainability. Even if we don't end up merging the dynamic PAGE_SIZE
support, parts of this series are needed for supporting 128-bit ptes on
arm64, hopefully dynamically as well.

Thanks.

-- 
Catalin

