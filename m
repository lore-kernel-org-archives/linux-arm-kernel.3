Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD16ACD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddZ4Cxr/JHWef23HUq6enll8EtpPZioHbQeLyG5b3yM=; b=VzVJaZEa6QCfrh3mFW+iAkt0Yc
	5GFbCP2aMAhZbXCSthGTaIlSYZgW2qR7tFSP3BeL8POADw9YyLr7BqNb6sqwD2/kZ1nwGBLMu2/iy
	G/2IkCX+bYbNYKKpkOS5bLqDj39pUp1bC7QIwYYl2vLmh9KETIp6nCGg4MQshzBVlk/kJOmpaW1cv
	mZO+fJ1rr5vIEfoMHxSyLW6NScGaIkH0Wp9YT/PRY2xuWfDLpojpBD2SYLfgO13DEnTRltAgYYge8
	LDCU25HcI41XGW/puqichtsePodZPv/V8YwDdybbmgejlMuNAL//u/8ejokpq4W29sXITnAKo9DhO
	PHmrVHPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0G5-0000000AfiI-2mP7;
	Mon, 01 Jun 2026 10:52:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0G2-0000000Afha-32c4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 10:52:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36253176B;
	Mon,  1 Jun 2026 03:52:26 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37CCE3F905;
	Mon,  1 Jun 2026 03:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780311151; bh=UjrGkaDhseC03+f0B0Jhh2lPATfx6lpV4JnTinESzMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PXvzdFZrnKS59D70C3+d7nG3vdUdOGRub0Xj/YxDb49qUPEhSNidUEZYOiKWOn6pm
	 czPqruORnbkzukaW834oroIc9Q3fUTmIwApu21iNdWe5UE7kLigPaupx8w7RWyZk5o
	 o/P4J/QDwR5LhDNtVXVItlJM4u78s/yZiZDOMtCw=
Date: Mon, 1 Jun 2026 16:22:26 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Usama Arif <usama.arif@linux.dev>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC V2 14/14] arm64/mm: Add initial support for FEAT_D128 page
 tables
Message-ID: <ah1kanXHdkcUUn5Y@a079125.arm.com>
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
 <20260513044547.4128549-15-anshuman.khandual@arm.com>
 <6330f618-c3e1-4e44-9b3c-6607bae1ae5e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6330f618-c3e1-4e44-9b3c-6607bae1ae5e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_035234_845743_9143BA57 
X-CRM114-Status: GOOD (  41.33  )
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

On Wed, May 27, 2026 at 03:54:03PM +0100, Ryan Roberts wrote:
> On 13/05/2026 05:45, Anshuman Khandual wrote:
> > Add build time support for FEAT_D128 page tables with a new Kconfig option
> > i.e CONFIG_ARM64_D128. When selected, PTE types become 128 bits wide and
> > PTE bits are mapped to their new locations. Besides the basic page table
> > geometry is also updated since each table page now holds half the number
> > of entries (aka PTRS_PER_PXX) as it did previously.
> > 
> > Since FEAT_D128 exclusively supports the permission indirection style for
> > page table entry permission management, given kernel compiled for FEAT_D128
> > requires both FEAT_S1PIE and FEAT_D128. If these architecture features are
> > not present at boot, the kernel panics just like it does when there is a
> > granule size mismatch.
> > 
> > TTBR0/1_EL1 and PAR_EL1 registers become 128 bit wide when D128 is enabled,
> > thus requiring MSRR/MRRS instructions for their updates. Because PA_BITS is
> > still capped at 52 bits, MRS/MSR instructions are currently sufficient for
> > the register accesses that basically operate on the lower 64 bits. Although
> > entire 128 bits for these registers get cleared during boot via MSRR.
> > 
> > Add support for TLBIP instruction for TLB flush macros with level hint and
> > address range operations. Although existing TLBI based TLB flush would have
> > been sufficient given PA_BITS is still capped at 52, but then it would have
> > lacked both level hint and range support.
> > 
> > This enables support for all granule size, VA_BITS and PA_BITS combination.
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Linu Cherian <linu.cherian@arm.com> (TLBIP instructions)
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> > Changes in RFC V2:
> > 
> > - Updated ARM64_CONT_[PTE|PMD]_SHIFT both for 16K and 64K base pages
> > - Adopted TLBIP implementation to recent TLB flush changes
> > - Renamed __PRIpte as __PRIpxx per David
> > - Renamed all ptdesc_ instances as pxxval_ instead
> > 
> >  arch/arm64/Kconfig                     |  51 ++++++++-
> >  arch/arm64/Makefile                    |   4 +
> >  arch/arm64/include/asm/assembler.h     |   4 +-
> >  arch/arm64/include/asm/el2_setup.h     |   9 ++
> >  arch/arm64/include/asm/pgtable-hwdef.h | 137 +++++++++++++++++++++++++
> >  arch/arm64/include/asm/pgtable-prot.h  |  18 +++-
> >  arch/arm64/include/asm/pgtable-types.h |   9 ++
> >  arch/arm64/include/asm/pgtable.h       |  56 +++++++++-
> >  arch/arm64/include/asm/smp.h           |   1 +
> >  arch/arm64/include/asm/tlbflush.h      |  68 ++++++++++--
> >  arch/arm64/kernel/head.S               |  12 +++
> >  arch/arm64/mm/proc.S                   |  25 ++++-
> >  12 files changed, 374 insertions(+), 20 deletions(-)
> > 
> 
> [...]
> 
> Some comments on tlbflush.h only:
> 
> > diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> > index 361d74ef8016..7831759b98e1 100644
> > --- a/arch/arm64/include/asm/tlbflush.h
> > +++ b/arch/arm64/include/asm/tlbflush.h
> > @@ -41,6 +41,25 @@
> >  
> >  #define __tlbi(op, ...)		__TLBI_N(op, ##__VA_ARGS__, 1, 0)
> >  
> > +#ifdef CONFIG_ARM64_D128
> > +#define __tlbip(op, arg) do {		\
> > +	asm (ARM64_ASM_PREAMBLE		\
> > +	".arch_extension d128\n\t"	\
> > +	"tlbip " #op ", %0, %H0\n"	\
> > +	: : "r" (arg.full));		\
> > +} while (0)
> > +
> > +#define __tlbip_user(op, arg) do {		\
> > +	if (arm64_kernel_unmapped_at_el0()) {	\
> > +		arg.low |= USER_ASID_FLAG;	\
> > +		__tlbip(op, (arg));		\
> > +	}					\
> > +} while (0)
> > +
> > +#endif
> > +
> > +#define TLBI_ASID_MASK		GENMASK_ULL(63, 48)
> > +
> >  #define __tlbi_user(op, arg) do {						\
> >  	if (arm64_kernel_unmapped_at_el0())					\
> >  		__tlbi(op, (arg) | USER_ASID_FLAG);				\
> > @@ -162,9 +181,15 @@ static inline void sme_dvmsync_batch(struct arch_tlbflush_unmap_batch *batch)
> >  
> >  #define TLBI_TTL_UNKNOWN	INT_MAX
> >  
> > +#ifdef CONFIG_ARM64_D128
> > +typedef union __u128_halves tlbi_args_t;
> 
> I wonder if you could just define this as u128? That would make things a bit
> neater I think? - You should be able to do normal bit twiddling I think?

Having it as two 64 bit halves would make it easier to make use of
the bit field macros FIELD_XXX (which supports only the 64 bit)

> 
> > +#define __tlbi_wrapper(op, arg)		__tlbip(op, arg)
> > +#define __tlbi_user_wrapper(op, arg)	__tlbip_user(op, arg)
> > +#else
> >  typedef u64 tlbi_args_t;
> >  #define __tlbi_wrapper(op, arg)		__tlbi(op, arg)
> >  #define __tlbi_user_wrapper(op, arg)	__tlbi_user(op, arg)
> > +#endif
> >  
> >  typedef void (*tlbi_op)(tlbi_args_t arg);
> >  
> > @@ -211,17 +236,28 @@ static __always_inline void ipas2e1is(tlbi_args_t arg)
> >  	__tlbi_wrapper(ipas2e1is, arg);
> >  }
> >  
> > -static __always_inline void __tlbi_level_asid(tlbi_op op, u64 addr, u32 level,
> > -					      u16 asid)
> > +static __always_inline void __tlbi_update_level(u32 level, u64 *arg)
> >  {
> > -	u64 arg = __TLBI_VADDR(addr, asid);
> > -
> >  	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) && level <= 3) {
> >  		u64 ttl = level | (get_trans_granule() << 2);
> >  
> > -		FIELD_MODIFY(TLBI_TTL_MASK, &arg, ttl);
> > +		FIELD_MODIFY(TLBI_TTL_MASK, arg, ttl);
> >  	}
> > +}
> > +
> > +static __always_inline void __tlbi_level_asid(tlbi_op op, u64 addr, u32 level, u16 asid)
> > +{
> > +#ifdef CONFIG_ARM64_D128
> > +	union __u128_halves arg;
> > +
> > +	arg.low = FIELD_PREP(TLBI_ASID_MASK, asid);
> > +	__tlbi_update_level(level, &arg.low);
> > +	arg.high = addr >> 12;
> > +#else
> > +	u64 arg = __TLBI_VADDR(addr, asid);
> >  
> > +	__tlbi_update_level(level, &arg);
> > +#endif
> >  	op(arg);
> >  }
> 
> It would be a neater change if you could get away with something like this. If
> you typedef tlbi_arg_t as u128, will FIELD_MODIFY() work? Not sure...

FIELD_MODIFY expects the arguments to be of 64 bit.
Atleast the bit shifting depends on ULL,
	#define __bf_shf(x) (__builtin_ffsll(x) - 1)
Guess, this might work for modification in the lower 64 bit
but not for the higher 64 bit.
IMHO, it doesnt looks okay to use it unless the FIELD_XXX
macros support 128 bit arguments with higher 64 bit field
modification. 

> 
> 
> static __always_inline void __tlbi_level_asid(tlbi_op op, u64 addr, u32 level,
> 					      u16 asid)
> {
> 	tlbi_arg_t arg;
> 
> #ifdef CONFIG_ARM64_D128
> 	arg = FIELD_PREP(TLBI_ASID_MASK, asid);

Essentially, here we have to make an assumption that FIELD_PREP
is always for the lower 64 bit, which is not evident from the code.
Would that be okay ? 

> 	arg |= (addr >> 12) << 64;
> #else
> 	arg = __TLBI_VADDR(addr, asid);
> #endif
> 
> 	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) && level <= 3) {
> 		u64 ttl = level | (get_trans_granule() << 2);
> 
> 		FIELD_MODIFY(TLBI_TTL_MASK, &arg, ttl);



> 	}
> 
> 	op(arg);
> }
> 
> 
> >  
> > @@ -507,19 +543,33 @@ static __always_inline void ripas2e1is(tlbi_args_t arg)
> >  	__tlbi_wrapper(ripas2e1is, arg);
> >  }
> >  
> > -static __always_inline void __tlbi_range(tlbi_op op, u64 addr,
> > -					 u16 asid, int scale, int num,
> > -					 u32 level, bool lpa2)
> > +static __always_inline u64 __tlbi_range_args_encode_comm(u16 asid, int scale, int num, u32 level)
> >  {
> >  	u64 arg = 0;
> >  
> > -	arg |= FIELD_PREP(TLBIR_BADDR_MASK, addr >> (lpa2 ? 16 : PAGE_SHIFT));
> >  	arg |= FIELD_PREP(TLBIR_TTL_MASK, level > 3 ? 0 : level);
> >  	arg |= FIELD_PREP(TLBIR_NUM_MASK, num);
> >  	arg |= FIELD_PREP(TLBIR_SCALE_MASK, scale);
> >  	arg |= FIELD_PREP(TLBIR_TG_MASK, get_trans_granule());
> >  	arg |= FIELD_PREP(TLBIR_ASID_MASK, asid);
> >  
> > +	return arg;
> > +}
> > +
> > +static __always_inline void __tlbi_range(tlbi_op op, u64 addr,
> > +					 u16 asid, int scale, int num,
> > +					 u32 level, bool lpa2)
> > +{
> > +#ifdef CONFIG_ARM64_D128
> > +	union __u128_halves arg;
> > +
> > +	arg.low = __tlbi_range_args_encode_comm(asid, scale, num, level);
> > +	arg.high = addr >> 12;
> > +#else
> > +	u64 arg = __tlbi_range_args_encode_comm(asid, scale, num, level);
> > +
> > +	arg |= FIELD_PREP(TLBIR_BADDR_MASK, addr >> (lpa2 ? 16 : PAGE_SHIFT));
> > +#endif
> >  	op(arg);
> >  }
> 
> And you could do the same thing here, keeping a single function with only a
> minimal diff.

Similar to above, the concern here is whether to use 64 bit and 128 bit arguments
seamlessly with FIELD_PREP macros with the assumptions that the field
range being limited to 64 bit.


--
Thanks,
Linu Cherian.

