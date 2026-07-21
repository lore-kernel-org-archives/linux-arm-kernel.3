Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDD8C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 18:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zO9yiMTAazx5bwGvEvIyBcvPS46sW+B44wcbxVnE5g=; b=j8A1cu19KT00VlnueeIoCZ0ZGa
	z+LQdlBbBIVqx/2512WTZLZcMWEZ945IKpSXr68T5VDgcZyeHic/t9ohKBQHYLXx+cfdWcFZm1Mzf
	EKrNqbJoy0fWhkvyI/NCU9epBJHtw64zCxbzhqAJqBwuVfp6+Dbo1SZHmo2Es3Sm0oBIazfGzAVaO
	boFUAxyEat8hlDx7L/3amHoRG1VFXT8JuLMzmXUjFP1JMD+x3NFz7kGDrmlHUXFC9kjqgvbByEYHw
	h6qQI9r84Mqih9qLKRhUia82/aJSiSOV1+67xDnFkm9xkEzOXqbfnB9Z011WsWlSU+qkMR27xL+7Y
	difi+8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFEn-0000000AD9X-08L9;
	Tue, 21 Jul 2026 18:30:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFEl-0000000AD90-3DM5;
	Tue, 21 Jul 2026 18:30:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBE0360103;
	Tue, 21 Jul 2026 18:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0DE1F00A3A;
	Tue, 21 Jul 2026 18:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784658638;
	bh=9zO9yiMTAazx5bwGvEvIyBcvPS46sW+B44wcbxVnE5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ByYK4o3Cka+hTsFRrAZAJRNYhFGvW7e38UptX/Hs7lUB1boZoKI/JB79A96h/sJlt
	 YKqi6ru/0HEtyn5K1g1fKFvrrOvAs55HrxyU1PfQKIYMBQpvNRutYSbErst/xzLFT2
	 5geUT2eCxPXWhMAI7fAevDyJeTIGeFMK22SP/rV56hOgG5rIOPcfSZnBK8/yramW/9
	 5j646seiC6BJN7K+hbtAwOp0ZDuR1NSGUi+9LNhopPTljgCIcz8FIMem/5jmuNKlHz
	 M1MQRG8RBAEZdihKmF6FW6rAvGtDzXs9xOhBrO2BggxJWR7HuxG3+1Sm2YW2C5sGbx
	 a0g4ar95F9w/A==
Date: Tue, 21 Jul 2026 21:30:26 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <jackmanb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH RFC 01/18] x86/mm/pat: Don't gate cpa_lock on
 debug_pagealloc_enabled()
Message-ID: <al-6woCPBH5d-lwP@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <20260721-generic-set-memory-v0-1-v1-1-2c1fc62306b3@kernel.org>
 <al-oTOKY7vkdPHr5@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al-oTOKY7vkdPHr5@lucifer>
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

On Tue, Jul 21, 2026 at 06:16:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Jul 21, 2026 at 07:23:24PM +0300, Mike Rapoport (Microsoft) wrote:
> > The splitting and merging of kernel page table mappings between small and
> > large is protected by cpa_lock. The merging is relatively new but the
> > splitting is ancient.
> >
> > The splitting has a locking optimization: since DEBUG_PAGEALLOC forces all
> > mappings to 4k, there are no large pages to split. So the code that *might*
> > cause a split can just skip the locking (and a few other things).
> >
> > This is entertaining, but it adds complexity and makes for weird locking
> > rules. Plus it's all for a debugging feature which makes the kernel super
> > slow in the first place. Optimizing something which is already super slow
> > and not used in production is not the best way to spend our complexity
> > budget.
> >
> > Stop gating cpa_lock on debug_pagealloc_enabled() to simplify the code
> > and the locking rules.
> >
> > [ dhansen: flesh out changelog ]
> >
> > Suggested-by: Dave Hansen <dave.hansen@intel.com>
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> > Link: https://patch.msgid.link/20260715144519.934289-1-rppt@kernel.org
> > Link: https://lore.kernel.org/all/aab44f08-89f8-47fe-bee4-0ab6b25968c6@intel.com/
> 
> Hmm this patch is already taken separately though? ([0]) (obv. commented there
> already with review feedback).
> 
> Intended to be with this series as some kind of background or? Probably better
> to separate out given it's a live patch

From the cover letter:

  Patch 1 is already applied to the tip tree and I posted patch 2
  separately [4], but I included them both here for the completeness.
 
> Thanks, Lorenzo

-- 
Sincerely yours,
Mike.

