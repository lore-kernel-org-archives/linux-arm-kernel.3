Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D697F532E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 07:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZscMz3/ltsM4mEec+3AAbOOemJ3tvro+id7tm9uXfzQ=; b=xhi5jYe5nLAgW2tvMRNc1sXj0m
	DLLsFM/nxx712MFFUVdM9U2JC17soMZfkbsPL7rCpcL8baMTlzXgS3wkp8gc9xVL88pGmonnc2Xeo
	jf0GhIiqP1YA0Kzxv6kev3xX5sOhnDngKN+2IN17umxrILvbsbxluj2EYhRtZdiOUj6ONcRdL2W3H
	1QODd0WbKDWoTaWSFc2gupZymIiFRclqU/7p8ryJ1736b+mvve0r1QU8r2GJguK7AqXabc9iit2d3
	hGoRKQ9G80yENKZCNWIX6rGiblWOwzv1TOzdNyI62aVJ3+DohuJxleNK+voEmcjr0oLvG8gcDpp2V
	+LvcgKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wRj-00000000umG-1xRH;
	Tue, 24 Mar 2026 07:45:03 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wRi-00000000um6-0wsL;
	Tue, 24 Mar 2026 07:45:02 +0000
Date: Tue, 24 Mar 2026 00:45:02 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Demian Shulhan <demyansh@gmail.com>
Cc: Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>, linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] raid6: arm64: add SVE optimized implementation for
 syndrome generation
Message-ID: <acJA_s2gfKhiRxXF@infradead.org>
References: <20260318150245.3080719-1-demyansh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318150245.3080719-1-demyansh@gmail.com>
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

Hi Damian,

thanks for looking into this.

I've added the arm64 maintainers and arm list as that's your best bet
for someone actually understanding the low-level assembly code.

On Wed, Mar 18, 2026 at 03:02:45PM +0000, Demian Shulhan wrote:
> Note that for the recovery path (`xor_syndrome`), NEON may still be
> selected dynamically by the algorithm benchmark, as the recovery
> workload is heavily memory-bound.

The recovery side has no benchmarking, you need to manually select
a priority.

Note that I just sent out a "cleanup the RAID6 P/Q library" series that
make this more explicit.  It also make it clear by prioritizing
implementations using better instructions available we can short-cut
the generation side probing path a lot, which might be worth looking
into for this.

I'm also curious if you looked why the 4x unroll is slower than
the lesser unroll, and if that is inherent in the implementation.  Or
just an effect of the small number of disks in that we don't actually
have 4 disks to unroll for every other iteration.  I.e. what would the
numbers be if RAID6_TEST_DISKS was increased to 10 or 18?

I plan into potentially select the unrolling variants based on the
number of "disks" to calculate over as a follow-on.

We'll have to wait for review on my series, but I'd love to just rebase
this ontop if possible.  I can offer to do the work, but I'd need to
run it past you for testing and final review.

> +static void raid6_sve1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)

Overly long line.

> +{
> +	u8 **dptr = (u8 **)ptrs;
> +	u8 *p, *q;
> +	long z0 = disks - 3;
> +
> +	p = dptr[z0 + 1];
> +	q = dptr[z0 + 2];

I know all this is derived from existing code, but as I started to hate
that I'll add my cosmetic comments:

This would read nicer by initializing at declaration time:

	u8 **dptr = (u8 **)ptrs;
	long z0 = disks - 3;
	u8 *p = dptr[z0 + 1];
	u8 *q = dptr[z0 + 2];

Also z0 might better be named z_last or last_disk, or stop as in the
_xor variant routines.

> +	asm volatile(

But I wonder if just implementing the entire routine as assembly in a
.S file would make more sense than this anyway?

> +static void raid6_sve1_xor_syndrome_real(int disks, int start, int stop,
> +					 unsigned long bytes, void **ptrs)
> +{
> +	u8 **dptr = (u8 **)ptrs;
> +	u8 *p, *q;
> +	long z0 = stop;
> +
> +	p = dptr[disks - 2];
> +	q = dptr[disks - 1];
> +
> +	asm volatile(

Same comments here, plus just dropping z0 vs using stop directly.

> +#define RAID6_SVE_WRAPPER(_n)						\
> +	static void raid6_sve ## _n ## _gen_syndrome(int disks,		\
> +					size_t bytes, void **ptrs)	\
> +	{								\
> +		scoped_ksimd()						\
> +		raid6_sve ## _n ## _gen_syndrome_real(disks,		\
> +					(unsigned long)bytes, ptrs);	\

Missing indentation after the scoped_ksimd().  A lot of other code uses
separate compilation units for the SIMD code, which seems pretty useful
to avoid mixing SIMD with non-SIMD code.  That would also combine nicely
with the suggestion above to implement the low-level routines entirely
in assembly.

I'll leave comments on the actual assembly details to people that
actually know ARM64 assembly.

