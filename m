Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1182E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWAhHox9z1pGuktzjGrZ9ZPbtvZRaueR8hk7/jquBck=; b=MBFOBmPDlnqj04nQBzbY3ZlLSc
	+ynL/GEV23dndlH7Y4R+ZvoNvdfcRTotGbwjXtnskxhG+eOVVA8MoyLLgq6PauJwsxwsMYjQumT/A
	uVr/zWHjsWwsPlfJbtLIwCvGyX8JjvrrzTdJgusqqNyB5kmt3DI08K04/zHyKd6ZL5NPU7tlaArkT
	/E6JTQ8HGMHRnnGHRd01TfuOp8C6GJBy1osh7OM3SElRrQGy9aK5blzzQT2zzR3R82Dj53qfXr6aF
	9KvRBgWKHQGFXUI7PInm7eHyTlyYItOIIGevXGbIZin3bAwOxz+rufcRhMMb6WozoSB2OjWbTqSaQ
	GV0jFZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtbF-0000000CFHk-1X8e;
	Thu, 09 Jan 2025 14:33:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVta1-0000000CF03-3dGa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 14:32:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1C6F5C5AE4;
	Thu,  9 Jan 2025 14:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7948C4CED2;
	Thu,  9 Jan 2025 14:32:09 +0000 (UTC)
Date: Thu, 9 Jan 2025 14:32:07 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, will@kernel.org,
	ardb@kernel.org, ryan.roberts@arm.com, mark.rutland@arm.com,
	joey.gouly@arm.com, dave.hansen@linux.intel.com,
	akpm@linux-foundation.org, chenfeiyang@loongson.cn,
	chenhuacai@kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com, stable@vger.kernel.org
Subject: Re: [PATCH v4] arm64: mm: Populate vmemmap/linear at the page level
 for hotplugged sections
Message-ID: <Z3_d59kp4CuHQp97@arm.com>
References: <20250107074252.1062127-1-quic_zhenhuah@quicinc.com>
 <Z31--x4unDHRU5Zo@arm.com>
 <406d5113-ff3d-4c2a-81f0-de791bcbeffb@quicinc.com>
 <1c1504a7-3515-48f2-8ca7-15b2379dea22@arm.com>
 <1515dae4-cb53-4645-8c72-d33b27ede7eb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1515dae4-cb53-4645-8c72-d33b27ede7eb@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_063213_965891_CBB5624E 
X-CRM114-Status: GOOD (  23.70  )
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

On Thu, Jan 09, 2025 at 03:04:22PM +0800, Zhenhua Huang wrote:
> On 2025/1/8 18:52, Anshuman Khandual wrote:
> > > I found another bug, that even for early section, when
> > > vmemmap_populate is called, SECTION_IS_EARLY is not set.
> > > Therefore, early_section() always return false.
[...]
> > > Since vmemmap_populate() occurs during section initialization, it
> > > may be hard to say it is a bug.. However, should we instead using
> > > SECTION_MARKED_PRESENT to check? I tested well in my setup.
> > > 
> > > Hot plug flow:
> > > 1. section_activate -> vmemmap_populate
> > > 2. mark PRESENT
> > > 
> > > In contrast, the early flow:
> > > 1. memblocks_present -> mark PRESENT
> > > 2. __populate_section_memmap -> vmemmap_populate
> > 
> > But from a semantics perspective, should SECTION_MARKED_PRESENT be marked on a
> > section before SECTION_IS_EARLY ? Is it really the expected behaviour here or
> > that needs to be fixed first ?
> 
> The tricky part is vmemmap_populate initializes mem_map, that happens during
> mem_section initialization process. PRESENT or EARLY tag is in the same
> process as well. There doesn't appear to be a compelling reason to enforce a
> specific sequence..

The order in which a section is marked as present and vmemmap created
does seem a bit arbitrary. At least the early code seems to rely on the
for_each_present_section_nr() loop, so we'll always have this first but
it's not some internal kernel API that guarantees this.

> > Although SYSTEM_BOOTING state check might help but section flag seems to be the
> > right thing to do here.
> 
> Good idea, I prefer to vote for this alternative rather than PRESENT tag. As
> I see we already took this stage to determine whether memmap pages are boot
> pages or not in common mm code:
> https://elixir.bootlin.com/linux/v6.13-rc3/source/mm/sparse-vmemmap.c#L465

The advantage of SYSTEM_BOOTING is that we don't need to rely on the
section information at all, though we could add a WARN_ON_ONCE if the
section is not present.

-- 
Catalin

