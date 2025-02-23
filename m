Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C8FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 18:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRWUqmsrLK6i38ZO4BPx5T6pvN4JGgKtctrGtp+3Kwk=; b=Hb23+BF2/zty2jHCLPnRY3xQK8
	39Riyi09VmcrFl7/sWJ8N8V3pNdrLAS0oeg/svIvx4TJhe0vPLz8vq7MuVfF80VJKVOxyqBFCHkrz
	wb0ECCSWS9isKciGkuhpBuooClqsxlmjZfmmzeP8dnr0lrhuhgU/hTLYiCcoVAQqahA0E5cdrZw5k
	/gCHIj2dAviseMv0ywBEvjJmtnPmkJdV3tSGu2Qi3C3epX35Dx5SIyFhQa4NMt8JL7efGaHznmy3n
	TjIX/dbcIiHFrDrCj6sAZPJNrl5lglNkEgzqmVbGKDy5GI8ciNVoIYgGXxeCQAapTqCZF7V2Wl7nX
	c3v7sqbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmH6R-0000000BbzW-1VI5;
	Sun, 23 Feb 2025 18:53:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmH4x-0000000Bbpy-34TF;
	Sun, 23 Feb 2025 18:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7BE3E5C5AD5;
	Sun, 23 Feb 2025 18:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCCAC4CEDD;
	Sun, 23 Feb 2025 18:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740336708;
	bh=tco7lF+ns8c6//J7LH3Pw1kK1mQ+wFDcdS7oH71ovZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AC8V4qptb+AtjX51lQpQkK+feFUMV6tEPciZsc50vgPEZZgXJ1Mr4Wzt7gW7ncRVo
	 Pt9qf6/7Xj1nucn97rkBAvcg1gvIbSBfi4vLWNYW1Bti3Pp9XJRm1yUzDZOyQsQked
	 X34aOkKQ9k+9y02frKQDZp3NLs+3NcckJUmxCX9gLcUhTieOhWf166eJVGsyLSlOR9
	 lWRj/Ck4JYsdvBrvGHwpNQCWs/LyFm4bpcEkILuW9yIPoYj373AD5iOcoPBVBLranD
	 XyPmKBdMuZXi/JeAzNVhBDavpPR/JhEriZkg8Hu83FZNMSODeSrM13Nax7awzelSqN
	 yk0gFpZg0lLSA==
Date: Sun, 23 Feb 2025 20:51:27 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Ingo Molnar <mingo@redhat.com>, James Gowans <jgowans@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pratyush Yadav <ptyadav@amazon.de>,
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v4 05/14] kexec: Add Kexec HandOver (KHO) generation
 helpers
Message-ID: <Z7tuL-FInR7KLD1l@kernel.org>
References: <20250206132754.2596694-1-rppt@kernel.org>
 <20250206132754.2596694-6-rppt@kernel.org>
 <20250210202220.GC3765641@nvidia.com>
 <CA+CK2bBBX+HgD0HLj-AyTScM59F2wXq11BEPgejPMHoEwqj+_Q@mail.gmail.com>
 <20250211124943.GC3754072@nvidia.com>
 <CA+CK2bAEnaPUJmd3LxFwCRa9xWrSJ478c4xisvD4pwvNMiTCgA@mail.gmail.com>
 <20250211163720.GH3754072@nvidia.com>
 <20250212152336.GA3848889@nvidia.com>
 <Z6zOqtaLQwnIWl2E@kernel.org>
 <20250212174303.GU3754072@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212174303.GU3754072@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_105151_890634_98CD7ED7 
X-CRM114-Status: GOOD (  32.57  )
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

On Wed, Feb 12, 2025 at 01:43:03PM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 12, 2025 at 06:39:06PM +0200, Mike Rapoport wrote:
> 
> > As I've mentioned off-list earlier, KHO in its current form is the lowest
> > level of abstraction for state preservation and it is by no means is
> > intended to provide complex drivers with all the tools necessary.
> 
> My point, is I think it is the wrong level of abstraction and the
> wrong FDT schema. It does not and cannot solve the problems we know we
> will have, so why invest anything into that schema?

Preserving a lot of random pages spread all over the place will be a
problem no matter what. With kho_preserve_folio() the users will still need
to save physical address of that folio somewhere, be it FDT or some binary
structure that FDT will point to. So either instead of "mem" properties we'll
have "addresses" property or a pointer to yet another page that should be
preserved and, by the way, "mem" may come handy in this case :)

I don't see how the "mem" property contradicts future extensions and for
simple use cases it is already enough. The simple reserve_mem use case in
this patchset indeed does not represent the complexity of a driver, but
it's still useful, at least for the ftrace folks. And reserve_mem is just
fine with "mem" property.
 
> I think the scratch system is great, and an amazing improvement over
> past version. Upgrade the memory preservation to match and it will be
> really good.
> 
> > What you propose is a great optimization for memory preservation mechanism,
> > and additional and very useful abstraction layer on top of "basic KHO"!
> 
> I do not see this as a layer on top, I see it as fundamentally
> replacing the memory preservation mechanism with something more
> scalable.

There are two parts to the memory preservation: making sure the preserved
pages don't make it to the free lists and than restoring struct
page/folio/memdesc so that the pages will look the same way as when they
were allocated.

For the first part we must memblock_reserve(addr, size) for every preserved
range before memblock releases memory to the buddy.
I did an experiment and preserved 1GiB of random order-0 pages and measured
time required to reserve everything in memblock.
kho_deserialize() you suggested slightly outperformed
kho_init_reserved_pages() that parsed a single "mem" property containing
an array of <addr, size> pairs. For more random distribution of orders and
more deep FDT the difference or course would be higher, but still both
options sucked relatively to a maple tree serialized similarly to your
tracker xarray.

For the restoration of the struct folio for multiorder folios the tracker
xarray is a really great fit, but again, it does not contradict having
"mem" properties. And the restoration of struct folio does not have to
happen very early, so we'd probably want to run it in parallel, somewhat
like deferred initialization of struct page.
 
> > But I think it will be easier to start with something *very simple* and
> > probably suboptimal and then extend it rather than to try to build complex
> > comprehensive solution from day one.
> 
> But why? Just do it right from the start? I spent like a hour
> sketching that, the existing preservation code is also very simple,
> why not just fix it right now?

As I see it, we can have both. "mem" property for simple use cases, or as a
partial solution for complex use cases and tracker you proposed for
preserving the order of the folios.

And as another optimization we may want a maple tree for coalescing as much
as possible to reduce amount of memblock_reserve() calls.
 
> Jason

-- 
Sincerely yours,
Mike.

