Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F01C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3m/HJ6Vecz1p3Ok2PpVoeyJx4Kr3fYGQdvSJdMfRxk=; b=VakECfoKILSQd2vaScBIjTtxf4
	f69eDtiw/I/0i/8zyntJM55FtJOn387cH2V8COnTDhKM/XNn0jTGv9K1aAcZPjAoMIfux3wXg/j6J
	XYWbBeQoahNnDVbtSKtPyIVsBzP67OvKVNwLP7Z6KqLF4sJbcIGEqY2fA+ipeFYSGX9eFaEd0U9o+
	2aoCMTKY3g/7mcnc1K79CGObTw1vXnfoWqHHNUHS5hxHwG82zV88ctaVeV6hyhDC+Wyyy2VZapxhd
	8xr4yImtMVqzRUr2pzxmabY+FtLpHVWi/36KvKp/wDfMWI9fE0N4bfBONnZdoHdkCfyGkPH4FXBCC
	y7F7CjCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgzU-00000003VRc-19Zx;
	Mon, 10 Mar 2025 17:32:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgxN-00000003VBP-1822
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 17:30:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AA9D1424;
	Mon, 10 Mar 2025 10:30:36 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7651F3F5A1;
	Mon, 10 Mar 2025 10:30:23 -0700 (PDT)
Date: Mon, 10 Mar 2025 17:30:21 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64/mm: Create level specific section mappings in
 map_range()
Message-ID: <Z88hrbNFM_7hIx_Z@J2N7QTR9R3.cambridge.arm.com>
References: <20250310062812.216031-1-anshuman.khandual@arm.com>
 <Z87FFqV03Pd0-NXl@J2N7QTR9R3.cambridge.arm.com>
 <b1fb982a-4936-4c18-aaad-3e8e8f61bccc@arm.com>
 <Z876UI5-xGRHl4td@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEZ86C8bouLt+xNkNr+L9AvCSQ2SZeJpLMtyvGo-8h6gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEZ86C8bouLt+xNkNr+L9AvCSQ2SZeJpLMtyvGo-8h6gw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_103025_355632_A6509CD8 
X-CRM114-Status: GOOD (  26.94  )
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

On Mon, Mar 10, 2025 at 03:53:33PM +0100, Ard Biesheuvel wrote:
> On Mon, 10 Mar 2025 at 15:42, Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Mon, Mar 10, 2025 at 01:48:53PM +0000, Ryan Roberts wrote:
> > > On 10/03/2025 10:55, Mark Rutland wrote:
> > IIUC the problem is that for a sufficiently large (and aligned) extent
> > of physical memory, we might try to create a block mapping larger than
> > the HW supports?
> 
> Yes. However, this code is only called to map the kernel, the DTB and
> the ID map code and data pages, and so it seems unlikely that we'll
> hit this bug in practice.
> 
> Nonetheless, it is a shortcoming that we should address to avoid
> future surprises.
> 
> > With that in mind, my earlier comment about LPA2 and blocks at level-0
> > is particularly relevant...
> 
> Indeed - at the higher levels, there is quite some variation between
> page sizes, LPA2 vs !LPA2 etc in which level is the highest at which
> block mappings are supported.
> 
> But given the context where this code is used, I'd prefer to simply
> map everything down to level 2 or higher (for 64-bit descriptors)
> rather than add elaborate rules for all these combinations that are
> never exercised in practice. The net result should be identical.

That sounds much better to me!

> > Though TBH, maybe it makes more sense to split this up into separate
> > levels (as with the code in arch/arm64/mm/mmu.c) and handle each level
> > explicitly with a separate function. That way each level's check can be
> > handled within that level's function, and we can use the right types,
> > etc. It feels like that might be better for D128 in future?
> 
> I have a slight inclination towards having a separate routine for
> D128, but I can easily be persuaded otherwise.

FWIW, I don't have strong feelings either way w.r.t. sharing the code
with D128. If it's cleaner for that to be separate, sure, but I'd have
to see the code.

My concern here was the the current recursive nature of the PI
map_range() function makes it hard to have level-specific behaviour, and
means that it's structurally different to most other code in the kernel,
e.g. the alloc_init_pXX() functions in arch/arm64/mm/mmu.c, where we
have separate functions for each of the levels that handle the
level-specific details.

I think that structure of separate functions per level is clearer, even
if it's a bit more code.

Mark.

