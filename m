Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86ED8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 14:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTDVjpRWTB5xLz1rJhXl+zL1ZWA88STzpaSgnQuzgNQ=; b=CWrHrmv/ylSj4loDGuk+JqY6Tb
	WCD3pBfq2CoxVKWkBIawn745wKDC/93jpdk5YzV+oVsy3KhP8r1JVRYUexWaoWoPxowCDdtixNJMG
	HYa7qlc04Slgpweo+DAY518K8WnwClFb53ZKg2fg3acxqZFX5+9B+oeOmAAOhWCf1xxo2jEzHczV6
	3MXPffw++Vw1SfQLWAJWmVGWGAnOdSe6pXzH/o8V2ic1Eh6Dc/Rd4XXmAfwgNpv6w9BJSNM8aCsB/
	N+2UeitPJIk3LYFX1sc98cRmtyRNDz11J/8YA1oWl7Fbbp+voVCJXqc9g5NJtrqNm8VJ6BB58hfQn
	AlTjPg3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7x5-0000000BVAb-0XuO;
	Fri, 26 Jun 2026 14:54:43 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7x2-0000000BV9t-3N3z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 14:54:42 +0000
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 6D95E20B7169; Fri, 26 Jun 2026 07:54:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6D95E20B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1782485674;
	bh=FTDVjpRWTB5xLz1rJhXl+zL1ZWA88STzpaSgnQuzgNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4YVjO/vL9TlHYJDpGFXqcbR/6jI85VyLql7+Y7KNo3wuPzKze1wVfItjL6ugt2ao
	 pRtIz4B/j0SCfl/IFlU18O2+U5ip5iqGWbNp2s4UOb4BDQ0+ex52Pb0uZQW7iDtOEy
	 LL5DyWYNLkeqztby2/J/kT+3I2LZIL5V+lDkfDBM=
Date: Fri, 26 Jun 2026 07:54:34 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	tgopinath@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	kees@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
	bp@alien8.de, rdunlap@infradead.org, peterz@infradead.org,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	elver@google.com, enelsonmoore@gmail.com, kuba@kernel.org,
	lirongqing@baidu.com, ebiggers@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Message-ID: <aj6SqipC/dIN01iN@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260619062331.348789-1-shyamsaini@linux.microsoft.com>
 <aje-nY6QbwZP9XLG@kernel.org>
 <ajyC2eX9MKSU84Z8@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <ajzovhWHcFQZ9d3l@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajzovhWHcFQZ9d3l@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_075440_894997_27A5F535 
X-CRM114-Status: GOOD (  30.45  )
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

On 25 Jun 2026 11:37, Mike Rapoport wrote:
> Hi Shyam,
> 
> On Wed, Jun 24, 2026 at 06:22:33PM -0700, Shyam Saini wrote:
> > On 21 Jun 2026 13:36, Mike Rapoport wrote:
> > > On Thu, Jun 18, 2026 at 11:23:31PM -0700, Shyam Saini wrote:
> > > > reserve_mem relies on dynamic memory allocation, this limits the
> > > > usecase where memory is required to be preserved across the boots.
> > > > Eg: ramoops memory reservation on ACPI platforms
> > > >
> > > > So add support to pass a pre-determined static address and reserve
> > > > memory at a specified location. This enables use case like ramoops
> > > > on ACPI platforms to reliably access ramoops region with previous
> > > > boot logs.
> > > > 
> > > > Also skip the parsing of <align> when static address is passed.
> > > > 
> > > > Example syntax for static address
> > > >  reserve_mem=4M@0x1E0000000:oops
> > > 
> > > reserve_mem is best effort by design because such hacks as well as memmap=
> > > cannot guarantee this memory is actually free.
> > > 
> > > If you want to preserve ramoops reliably, use KHO with reserve_mem.
> > > The first kernel will allocate memory, this memory will be preserved by KHO
> > > and could be picked up by the second kernel.
> > 
> > ok, On ARM64 DTS systems, we can reserve ramoops memory in the device tree during
> > the warm reboot.
> 
> The cc list actually implied x86 ;-)
> Added arm64 folks now.

Thanks for adding ARM folks, I had just included whatever get_maintainer script
suggested, sorry. 
> > For an equivalent ARM64 ACPI platform, what is the recommended way to reserve
> > and preserve that memory across the boots? 
> 
> I don't think it exists, but a command line option (be it memmap= or
> reserve_mem=) does not seem the right way to me.
> 
> Most of the arguments that were made against adding memmap= to arm64 [1]
> apply here.
> 
> If kexec is an option, KHO provides a reliable way to preserve memory
> across boots.
> 
> If kexec is not an option, we should look for a generic way to specify
> something like DT's reserved_mem for ACPI/EFI systems.
> 
> [1] https://lkml.kernel.org/lkml/20201118063314.22940-1-song.bao.hua@hisilicon.com/T/
> 
Well, kexec is one of the option for my use case, it also requires
memory reservation during warm reboot, I think memory can be reserved in
the firmware but this will create a dependency on firmware for Linux
reservation.

It would be great to have a in kernel memory reservation mechanism for
ARM64 ACPI platforms. I believe some other use cases like PMEM
reservation would also benefit from this.

Thanks,
Shyam

